Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yBs5XEDsIJW7AOunOp7vgDwhTc+5sYEzrOywRaLtC6w=;
        b=nWOnIIalGB0vuCx0ni9qdQLfhfRnJuAsKp+UMufjp4KZCIJMND9vovXu/MwZmp1ftx
         kdz8srA9Xm9dAaEUhhlLM148JdiVCz6en9iNpzSKq0ikL5ER/nmUsFzp9DzZxUJ+rt6P
         xRgFJP0YO9l0L+YjMjMBLY9R1sg+HSi8nlJUJy6tUCgljzYE0xlvtJcBWNYEK8PB9CNG
         zCw4xVufd5ixJIuUFKZodZC6vUcfnd/cVFGEzKYuneTMpOkC6WbRO4ag6S3sBZl4us5u
         gkRbAahVGn12boAwEylEiacFvBQ9zoHRpmjdHGWGiOiLBdiG1aI2yv/lrELCvzlWMyGD
         u7mg==
Subject: Re: [RFC PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()
References: <23166674-838e-b626-4522-6e0709da34b9@gmail.com>
 <20181017151052.GO2674@linux.ibm.com>
 <c6b65e92-750d-f481-916f-1eea8f2875eb@gmail.com>
 <20181018003739.GW2674@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5796b290-9c04-8e33-703a-b823cedd16c0@gmail.com>
Date: Thu, 18 Oct 2018 22:03:56 +0900
MIME-Version: 1.0
In-Reply-To: <20181018003739.GW2674@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/10/17 17:37:39 -0700, Paul E. McKenney wrote:
> On Thu, Oct 18, 2018 at 07:21:38AM +0900, Akira Yokosawa wrote:
>> On 2018/10/17 08:10:52 -0700, Paul E. McKenney wrote:
>>> On Tue, Oct 16, 2018 at 08:04:00AM +0900, Akira Yokosawa wrote:
>>>> >From 7b01fc0f19cfa010536d7eb53e4d0cda1e6b801f Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Mon, 15 Oct 2018 23:46:52 +0900
>>>> Subject: RFC [PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()
>>>>
>>>> This message-passing pattern requires smp_wmb()--smp_rmb() pairing.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> ---
>>>> Hi Paul,
>>>>
>>>> I'm not sure this addition of memory barriers is actually required,
>>>> but it does look like so.
>>>>
>>>> And I'm aware that you have avoided using weaker memory barriers in
>>>> CodeSamples.
>>>>
>>>> Thoughts?
>>>
>>> Hello, Akira,
>>>
>>> I might be missing something, but it looks to me like this ordering is
>>> covered by heavyweight ordering in the signal handler entry/exit and
>>> the gblcnt_mutex.  So what sequence of events leads to the failiure
>>> scenario that you are seeing?
>>
>> So the fastpaths in add_count() and sub_count() are not protected by
>> glbcnt_mutex.  The slowpath in flush_local_count() waits the transition
>> of theft from REQ to READY, clears counter and countermax, and finally
>> assign IDLE to theft.
>>
>> So, the fastpaths can see (theft == IDLE) but see a non-zero value of
>> counter or countermax, can't they?
> 
> Maybe, maybe not.  Please lay out a sequence of events showing a problem,
> as in load by load, store by store, line by line.  Intuition isn't as
> helpful as one might like for this kind of stuff.  ;-)

Gotcha!

I've not exhausted the timing variations, but now I see when
split_local_count() sees (*theft@[t] == THEFT_READY), counter part of
add_count() or sub_count() has exited the fastpath (marked by
counting == 1).

So the race I imagined has never existed.

Thanks for your nice suggestion!

> 
>> One theory to prevent this from happening is because all the per-thread
>> variables of a thread reside in a single cache line, and if the fastpaths
>> see the updated value of theft, they are guaranteed to see the latest
>> values of both counter and countermax.
> 
> Good point, but we need to avoid that sort of assumption unless we
> placed the variables into a struct and told the compiler to align it
> appropriately.  And even then, hardware architectures normally don't
> make this sort of guarantee.  There is too much that can go wrong, from
> ECC errors to interrupts at just the wrong time, and much else besides.

Absolutely!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> I might be completely missing something, though.
>>
>>         Thanks, Akira 
>>
>>>
>>> 							Thanx, Paul
>>>
>>>>         Thanks, Akira
>>>> --
>>>>  CodeSamples/arch-arm/arch-arm.h     |  2 ++
>>>>  CodeSamples/arch-arm64/arch-arm64.h |  2 ++
>>>>  CodeSamples/arch-ppc64/arch-ppc64.h |  2 ++
>>>>  CodeSamples/arch-x86/arch-x86.h     |  2 ++
>>>>  CodeSamples/count/count_lim_sig.c   | 21 +++++++++++++--------
>>>>  5 files changed, 21 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/CodeSamples/arch-arm/arch-arm.h b/CodeSamples/arch-arm/arch-arm.h
>>>> index 065c6f1..6f0707b 100644
>>>> --- a/CodeSamples/arch-arm/arch-arm.h
>>>> +++ b/CodeSamples/arch-arm/arch-arm.h
>>>> @@ -41,6 +41,8 @@
>>>>  /* __sync_synchronize() is broken before gcc 4.4.1 on many ARM systems. */
>>>>  #define smp_mb()  __asm__ __volatile__("dmb" : : : "memory")
>>>>  
>>>> +#define smp_rmb() __asm__ __volatile__("dmb ish" : : : "memory")
>>>> +#define smp_wmb() __asm__ __volatile__("dmb ishst" : : : "memory")
>>>>  
>>>>  #include <stdlib.h>
>>>>  #include <sys/time.h>
>>>> diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
>>>> index 354f1f2..a6ccf33 100644
>>>> --- a/CodeSamples/arch-arm64/arch-arm64.h
>>>> +++ b/CodeSamples/arch-arm64/arch-arm64.h
>>>> @@ -41,6 +41,8 @@
>>>>  /* __sync_synchronize() is broken before gcc 4.4.1 on many ARM systems. */
>>>>  #define smp_mb()  __asm__ __volatile__("dmb ish" : : : "memory")
>>>>  
>>>> +#define smp_rmb() __asm__ __volatile__("dmb ishld" : : : "memory")
>>>> +#define smp_wmb() __asm__ __volatile__("dmb ishst" : : : "memory")
>>>>  
>>>>  #include <stdlib.h>
>>>>  #include <time.h>
>>>> diff --git a/CodeSamples/arch-ppc64/arch-ppc64.h b/CodeSamples/arch-ppc64/arch-ppc64.h
>>>> index 7b0b025..2d6a2b5 100644
>>>> --- a/CodeSamples/arch-ppc64/arch-ppc64.h
>>>> +++ b/CodeSamples/arch-ppc64/arch-ppc64.h
>>>> @@ -42,6 +42,8 @@
>>>>  
>>>>  #define smp_mb()  __asm__ __volatile__("sync" : : : "memory")
>>>>  
>>>> +#define smp_rmb() __asm__ __volatile__("lwsync" : : : "memory")
>>>> +#define smp_wmb() __asm__ __volatile__("lwsync" : : : "memory")
>>>>  
>>>>  /*
>>>>   * Generate 64-bit timestamp.
>>>> diff --git a/CodeSamples/arch-x86/arch-x86.h b/CodeSamples/arch-x86/arch-x86.h
>>>> index 9ea97ca..2765bfc 100644
>>>> --- a/CodeSamples/arch-x86/arch-x86.h
>>>> +++ b/CodeSamples/arch-x86/arch-x86.h
>>>> @@ -52,6 +52,8 @@ __asm__ __volatile__(LOCK_PREFIX "orl %0,%1" \
>>>>  __asm__ __volatile__("mfence" : : : "memory")
>>>>  /* __asm__ __volatile__("lock; addl $0,0(%%esp)" : : : "memory") */
>>>>  
>>>> +#define smp_rmb() barrier()
>>>> +#define smp_wmb() barrier()
>>>>  
>>>>  /*
>>>>   * Generate 64-bit timestamp.
>>>> diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
>>>> index c316426..26a2a76 100644
>>>> --- a/CodeSamples/count/count_lim_sig.c
>>>> +++ b/CodeSamples/count/count_lim_sig.c
>>>> @@ -89,6 +89,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
>>>>  		*counterp[t] = 0;
>>>>  		globalreserve -= *countermaxp[t];
>>>>  		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
>>>> +		smp_wmb();				//\lnlbl{flush:wmb}
>>>>  		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
>>>>  	}						//\lnlbl{flush:loop2:e}
>>>>  }							//\lnlbl{flush:e}
>>>> @@ -115,10 +116,12 @@ int add_count(unsigned long delta)			//\lnlbl{b}
>>>>  
>>>>  	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
>>>>  	barrier();					//\lnlbl{barrier:1}
>>>> -	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
>>>> -	    countermax - counter >= delta) {		//\lnlbl{check:e}
>>>> -		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
>>>> -		fastpath = 1;				//\lnlbl{fasttaken}
>>>> +	if (READ_ONCE(theft) <= THEFT_REQ) {		//\lnlbl{check:b}
>>>> +		smp_rmb();				//\lnlbl{rmb}
>>>> +		if (countermax - counter >= delta) {	//\lnlbl{check:e}
>>>> +			WRITE_ONCE(counter, counter + delta);//\lnlbl{add:f}
>>>> +			fastpath = 1;			//\lnlbl{fasttaken}
>>>> +		}
>>>>  	}
>>>>  	barrier();					//\lnlbl{barrier:2}
>>>>  	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
>>>> @@ -154,10 +157,12 @@ int sub_count(unsigned long delta)
>>>>  
>>>>  	WRITE_ONCE(counting, 1);
>>>>  	barrier();
>>>> -	if (READ_ONCE(theft) <= THEFT_REQ &&
>>>> -	    counter >= delta) {
>>>> -		WRITE_ONCE(counter, counter - delta);
>>>> -		fastpath = 1;
>>>> +	if (READ_ONCE(theft) <= THEFT_REQ) {
>>>> +		smp_rmb();
>>>> +		if (counter >= delta) {
>>>> +			WRITE_ONCE(counter, counter - delta);
>>>> +			fastpath = 1;
>>>> +		}
>>>>  	}
>>>>  	barrier();
>>>>  	WRITE_ONCE(counting, 0);
>>>> -- 
>>>> 2.7.4
>>>>
>>>
>>
> 

