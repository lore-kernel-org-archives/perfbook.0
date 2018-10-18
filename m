Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sEjPEdDSSs7VBl27zUjweA5W/JtxgUHHXrSCAgUs7BY=;
 b=ELwbXTZ5W2Xt5hQmnWTMFq/Gt8dEsyaG60lHEMAT8X7RDQPJAsv0dYvJ77I+/jyNC2
 KWVPOuCoexoxgzGvLkoPGhzoav1nYgYKIH7cK0ggneR1H07mehGtJm6Hf7VI98szNkIH
 mklR/mZZawChEoOu1z28ys+WZXxJqT5hUbxGr32ydnGDpn4ZjNKOGCSZ2vBP3oom1r56
 KceASDgSIKx7k3WuAMf+oSC0coCEJNuwVgSF9g4+cT9oxrUS2nxrRLlvp3O8NI2ST4x4
 jcy90VkdOmKpl/A4aKIxdJBNKyBlDSp01qe26i/b7q0T5jAP+3v4Gp3kwrFg1VP0wdSh
 GlCw==
Subject: Re: [RFC PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()
References: <23166674-838e-b626-4522-6e0709da34b9@gmail.com>
 <20181017151052.GO2674@linux.ibm.com>
 <c6b65e92-750d-f481-916f-1eea8f2875eb@gmail.com>
 <20181018003739.GW2674@linux.ibm.com>
 <5796b290-9c04-8e33-703a-b823cedd16c0@gmail.com>
 <20181018151519.GI2674@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5645bf6d-4348-ea56-213b-73428d89a4e0@gmail.com>
Date: Fri, 19 Oct 2018 07:43:57 +0900
MIME-Version: 1.0
In-Reply-To: <20181018151519.GI2674@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/18 08:15:19 -0700, Paul E. McKenney wrote:
> On Thu, Oct 18, 2018 at 10:03:56PM +0900, Akira Yokosawa wrote:
>> On 2018/10/17 17:37:39 -0700, Paul E. McKenney wrote:
>>> On Thu, Oct 18, 2018 at 07:21:38AM +0900, Akira Yokosawa wrote:
>>>> On 2018/10/17 08:10:52 -0700, Paul E. McKenney wrote:
>>>>> On Tue, Oct 16, 2018 at 08:04:00AM +0900, Akira Yokosawa wrote:
>>>>>> >From 7b01fc0f19cfa010536d7eb53e4d0cda1e6b801f Mon Sep 17 00:00:00 2001
>>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>>> Date: Mon, 15 Oct 2018 23:46:52 +0900
>>>>>> Subject: RFC [PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()
>>>>>>
>>>>>> This message-passing pattern requires smp_wmb()--smp_rmb() pairing.
>>>>>>
>>>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>>>> ---
>>>>>> Hi Paul,
>>>>>>
>>>>>> I'm not sure this addition of memory barriers is actually required,
>>>>>> but it does look like so.
>>>>>>
>>>>>> And I'm aware that you have avoided using weaker memory barriers in
>>>>>> CodeSamples.
>>>>>>
>>>>>> Thoughts?
>>>>>
>>>>> Hello, Akira,
>>>>>
>>>>> I might be missing something, but it looks to me like this ordering is
>>>>> covered by heavyweight ordering in the signal handler entry/exit and
>>>>> the gblcnt_mutex.  So what sequence of events leads to the failiure
>>>>> scenario that you are seeing?
>>>>
>>>> So the fastpaths in add_count() and sub_count() are not protected by
>>>> glbcnt_mutex.  The slowpath in flush_local_count() waits the transition
>>>> of theft from REQ to READY, clears counter and countermax, and finally
>>>> assign IDLE to theft.
>>>>
>>>> So, the fastpaths can see (theft == IDLE) but see a non-zero value of
>>>> counter or countermax, can't they?
>>>
>>> Maybe, maybe not.  Please lay out a sequence of events showing a problem,
>>> as in load by load, store by store, line by line.  Intuition isn't as
>>> helpful as one might like for this kind of stuff.  ;-)
>>
>> Gotcha!
>>
>> I've not exhausted the timing variations, but now I see when
>> split_local_count() sees (*theft@[t] == THEFT_READY), counter part of
>> add_count() or sub_count() has exited the fastpath (marked by
>> counting == 1).
>>
>> So the race I imagined has never existed.
> 
> I know that feeling!!!
> 
>> Thanks for your nice suggestion!
> 
> Well, there might well be another race.  My main concern is whether or not
> signal-handler entry/exit really provides full ordering on all platforms.
> 
> Thoughts?

Does your concern related to the lack of memory barrier at the entry of
flush_local_count_sig() in Listing 5.17?

        Akira  

> 
> 							Thanx, Paul
> 
>>>> One theory to prevent this from happening is because all the per-thread
>>>> variables of a thread reside in a single cache line, and if the fastpaths
>>>> see the updated value of theft, they are guaranteed to see the latest
>>>> values of both counter and countermax.
>>>
>>> Good point, but we need to avoid that sort of assumption unless we
>>> placed the variables into a struct and told the compiler to align it
>>> appropriately.  And even then, hardware architectures normally don't
>>> make this sort of guarantee.  There is too much that can go wrong, from
>>> ECC errors to interrupts at just the wrong time, and much else besides.
>>
>> Absolutely!
>>
>>         Thanks, Akira
>>
>>>
>>> 							Thanx, Paul
>>>
>>>> I might be completely missing something, though.
>>>>
>>>>         Thanks, Akira 
>>>>
>>>>>
>>>>> 							Thanx, Paul
>>>>>
[...]

