Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WF5pHgdmokYappIxVyDKz+KG4bbmAS+y47xh1ShIykI=;
        b=MmxT+K0UVgZnCHss89z7Hmb4Ro+FV1RDSDcKT/mR3LBOPjBFZEqfn2owRmofBIpNr8
         3p9zOtN/Cpc53LDI3kWQM4v7i4wHRbHaRwUkMzxOTPInQEW+Z889uiBStaFM8Wt9igEN
         JjOQCiSbnvZl8wDnAihRc1tpudHMGwiaXfNbsS9UutZflgGrCXZ6afgGfP+jaUTPZpVi
         RGaLWlKrimpkNrnex2tGMD1GSmwBCXKaQaufEtC4UsKUw9rct+ElcWpmBIp3/b4LxseR
         /AysSk22750Rw3cbzl4q6JvFVdFpMZUMCzc1DQh4Ah1997NdwVWxhuvWnirawg9cQ09V
         9L/g==
Subject: Re: Ask help for litmus tests
References: <CABoNC80N5+fMJViPdNWhXqiDdS6JNwfab=8D2Q0Hfd0wQebj5w@mail.gmail.com>
 <893a78b7-6110-0644-b20b-107ad1fdc2a2@gmail.com>
 <CABoNC83HsE5Q22poEW3+ygENqD-CYespnzDNiX2LvswFQ7t2fA@mail.gmail.com>
 <20181105034107.GO4170@linux.ibm.com>
 <CABoNC82oDuKVzKMOgk832kTi-75Q7AeDnPZt5qqSKTmhrRg7GQ@mail.gmail.com>
 <20181106143610.GG4170@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cf4caa27-c7c9-4122-8a1a-150261ab5e37@gmail.com>
Date: Wed, 7 Nov 2018 00:02:59 +0900
MIME-Version: 1.0
In-Reply-To: <20181106143610.GG4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>, Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/11/06 06:36:10 -0800, Paul E. McKenney wrote:
> On Tue, Nov 06, 2018 at 03:12:26PM +0800, Junchang Wang wrote:
>> On Mon, Nov 5, 2018 at 11:41 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>>>
>>> On Mon, Nov 05, 2018 at 11:08:15AM +0800, Junchang Wang wrote:
>>>> On Sun, Nov 4, 2018 at 10:21 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>>>>>
>>>>> On 2018/11/04 20:14:50 +0800, Junchang Wang wrote:
>>>>>> Hi Akira,
>>>>>>
>>>>>> Thanks for your email about litmus tests a few weeks ago. I can
>>>>>> successfully run litmus tests on all three servers I can touch (The
>>>>>> configurations of the servers are listed below).
>>>>>
>>>>> Hi Junchang,
>>>>>
>>>>> Glad to know it helped you!
>>>>>
>>>>>>                                                  Everything goes well
>>>>>> except litmus tests C-CCIRIW+o+o+o-o+o-o (Listing 15.15) and
>>>>>> C-WRC+o+o-data-o+o-rmb-o (Listing 15.16). The "exists" assertions
>>>>>> never trigger on all of my servers. I understand that these assertions
>>>>>> trigger only if the speeds of propagating writing x to different CPU
>>>>>> cores varies a lot. So I have tried different litmus thread placement
>>>>>> strategies by adjusting the affinity setting of litmus7. For example:
>>>>>> $ litmus7 -affinity incr1 ... ...
>>>>>> $ ./C-WRC+o+o-data-o+o-rmb-o.exe +ra -p 0,1,6
>>>>>
>>>>> By klitmus7, I have seen a low probability "Sometimes" on POWER8 system.
>>>>>
>>>>> One of the results reads:
>>>>>
>>>>> ----------------------------------------------------------
>>>>> Test C-WRC+o+o-data-o+o-rmb-o Allowed
>>>>> Histogram (6 states)
>>>>> 60327103:>1:r1=0; 2:r2=0; 2:r3=0;
>>>>> 22740026:>1:r1=1; 2:r2=0; 2:r3=0;
>>>>> 5       *>1:r1=1; 2:r2=1; 2:r3=0;
>>>>> 51117838:>1:r1=0; 2:r2=0; 2:r3=1;
>>>>> 55552319:>1:r1=1; 2:r2=0; 2:r3=1;
>>>>> 10262709:>1:r1=1; 2:r2=1; 2:r3=1;
>>>>> Ok
>>>>>
>>>>> Witnesses
>>>>> Positive: 5, Negative: 199999995
>>>>> Condition exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0) is validated
>>>>> Hash=43057833028631b2f87eb65fe95c0ba2
>>>>> Observation C-WRC+o+o-data-o+o-rmb-o Sometimes 5 199999995
>>>>> Time C-WRC+o+o-data-o+o-rmb-o 68.34
>>>>> ----------------------------------------------------------
>>>>>
>>>>> In theory, litmus7 can also trigger the "exists" clause, but it would
>>>>> require a very long runtime.  Also please refer to the Answer to
>>>>> Quick Quiz 15.24. (You will find my name is mentioned there.)
>>>>>
>>>>
>>>> Hi Akira,
>>>>
>>>> I will try a long runtime. If that doesn't work, I suppose I need to
>>>> wait until I get another PPC server which I can physically touch.
>>>> Thanks a lot.
>>>>
>>>>> As Armv8 architecture is other-multicopy-atomic, this "exists" clause
>>>>> should never trigger, I suppose.
>>>>>
>>>>
>>>> I'm a bit confused here. Perfbook says "Therefore, a
>>>> non-multicopy-atomic platform can have a store reach different threads
>>>> at different times." (Page 277 the first paragraph). So my
>>>> understanding is that for Listing C-WRC+o+o-data-o+o-rmb-o, the
>>>> message of writing y could reach P2 before the message of writing x
>>>> could reach there, and hence the "exists" clause could trigger even if
>>>> on an ARM server. Is that correct? Or did I misunderstand something?
>>>>
>>>> Perfbook says "Most CPU vendors interested in providing multicopy
>>>> atomicity have therefore instead provided the slightly weaker
>>>> other-multicopy atomicity".(Page 277 the first paragraph). My
>>>> understanding is that "Most CPU vendors" here implies PPC, ARM, and
>>>> x86. In other words, all of the servers I can touch adopt
>>>> other-multicopy-atomic? Is that correct?
>>>
>>> ARM and x86 provide other-multicopy atomicity.  IBM mainframe provides
>>> fully multicopy atomicity.  PPC doesn't provide multicopy atomicity
>>> at all.
>>>
>>
>> Thanks a lot!!! This is the first time I know about this. How about we
>> add this as a footnote or something to help readers easier to get a
>> sense of the use of multicopy atomicity in practice? Does the
>> following look OK?
> 
> It does look like a good addition, but it needs a couple of changes,
> please see below.
> 
>> ===
>>
>> >From 8e07ecd836e5b581d2953938a65a395208fe0af3 Mon Sep 17 00:00:00 2001
>> From: Junchang Wang <junchangwang@gmail.com>
>> Date: Tue, 6 Nov 2018 15:00:31 +0800
>> Subject: [PATCH] memorder: Clarify implementation details of multicopy
>>  atomicity in mainstream architectures
>>
>> Reported-by: Junchang Wang <junchangwang@gmail.com>
>> Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> This needs to be just:
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> 
> It is your patch, so it has your signed-off-by.

But it came from Paul's reply. It might be a good idea to cite
the message at

	https://www.spinics.net/lists/perfbook/msg01952.html

in the commit log.

> 
>> ---
>>  memorder/memorder.tex | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index 5e74a91..5db4971 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -1901,7 +1901,9 @@ Most CPU vendors interested in providing
>> multicopy atomicity have therefore
>>  instead provided the slightly weaker
>>  \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
>>  which excludes the CPU doing a given store from the requirement that all
>> -CPUs agree on the order of all stores.
>> +CPUs agree on the order of all stores \footnote{As of late 2018, ARM and x86
>> +provide other-multicopy atomicity, IBM mainframe provides fully multicopy
>> +atomicity, and PPC does not provide multicopy atomicity at all.}.
> 
> Please indent the footnote text so that it stands out more and please
> remove the space character just before the "\footnote":
> 
> CPUs agree on the order of all stores\footnote{
> 	As of late 2018, ARM and x86 provide other-multicopy atomicity,
> 	IBM mainframe provides fully multicopy atomicity, and PPC does
> 	not provide multicopy atomicity at all.}.

I think the footnote should be just after the punctuation character, i.e.,

CPUs agree on the order of all stores.\footnote{
	As of late 2018, ARM and x86 provide other-multicopy atomicity,
	IBM mainframe provides fully multicopy atomicity, and PPC does
	not provide multicopy atomicity at all.}

> 
> Could you please also add a reference to:
> 
> 	Table~\ref{\label{tab:memorder:Summary of Memory Ordering}?

Did you mean:

 	Table~\ref{tab:memorder:Summary of Memory Ordering}?

Thanks, Akira

> 
> If you update the patch as suggested and send it as a standalone patch,
> I will accept it.
> 
> 							Thanx, Paul
> 
>>  This means that if only a subset of CPUs are doing stores, the
>>  other CPUs will agree on the order of stores, hence the ``other''
>>  in ``other-multicopy atomicity''.
>> -- 
>> 2.7.4
>>
>> Thanks,
>> --Junchang
>>
>>
>>>                                                         Thanx, Paul
>>>
>>>> Thanks,
>>>> --Junchang
>>>>
>>>>> As for C-CCIRIW+o+o+o-o+o-o, herd7 says
>>>>>
>>>>> ----------------------------------------------------------
>>>>> Test C-CCIRIW+o+o+o-o+o-o Allowed
>>>>> States 47
>>>>> 2:r1=0; 2:r2=0; 3:r3=0; 3:r4=0;
>>>>> 2:r1=0; 2:r2=0; 3:r3=0; 3:r4=1;
>>>>> 2:r1=0; 2:r2=0; 3:r3=0; 3:r4=2;
>>>>> 2:r1=0; 2:r2=0; 3:r3=1; 3:r4=1;
>>>>> [...]
>>>>> 2:r1=2; 2:r2=2; 3:r3=0; 3:r4=2;
>>>>> 2:r1=2; 2:r2=2; 3:r3=1; 3:r4=1;
>>>>> 2:r1=2; 2:r2=2; 3:r3=1; 3:r4=2;
>>>>> 2:r1=2; 2:r2=2; 3:r3=2; 3:r4=1;
>>>>> 2:r1=2; 2:r2=2; 3:r3=2; 3:r4=2;
>>>>> No
>>>>> Witnesses
>>>>> Positive: 0 Negative: 72
>>>>> Condition exists (2:r1=1 /\ 2:r2=2 /\ 3:r3=2 /\ 3:r4=1)
>>>>> Observation C-CCIRIW+o+o+o-o+o-o Never 0 72
>>>>> Time C-CCIRIW+o+o+o-o+o-o 0.06
>>>>> Hash=8e54976d74e1bc1ec5b6ce10eda3cb12
>>>>> ----------------------------------------------------------
>>>>>
>>>>> It says "Never", so if you could ever trigger the condition on a
>>>>> real machine, it would've meant something wrong in the implementation
>>>>> on the platform side (cache coherency).
>>>>>
>>>>> Hope this helps.
>>>>>
>>>>>        Thanks, Akira
>>>>>
>>>>>>
>>>>>> But it seems my effort doesn't work; the exist assertions never
>>>>>> trigger. Did I miss something? What's the right/possible configuration
>>>>>> to trigger these assertions. I do know you might be very busy. But if
>>>>>> possible, please give me some hints. These two tests seems very
>>>>>> interesting :-). Thanks in advance.
>>>>>>
>>>>>> Regards,
>>>>>> --Junchang
>>>>>>
>>>>>> ===
>>>>>> Three servers I can touch:
>>>>>>   1. One PPC server which consists of 8 cores. I don's know hardware
>>>>>> details (e.g. which cores share the same LLC or write buffer) because
>>>>>> tools such as dmidecode don't work.
>>>>>>   2. One ARM server with two Cavium CPU. 96 cores in total (no Hyper-threading).
>>>>>>   3. One Intel server with two Xeon E5-2630 CPUs, each of which
>>>>>> consists of 12 cores (with Hyper-Threading).
>>>>>>
>>>>>
>>>>
>>>
>>
> 

