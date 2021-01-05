Return-Path: <SRS0=HPzZ=GI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZIpiDAX/ha2af7QAmfoWmmBioT+wies0KKt3vhcyG1g=;
        b=EHKHPhHIbhMGqYPjKqh3wnqO9XvpM5dGH6kvOAljn0Jz2iHf6JFb/QlGsAZHUDGoqB
         CraKBKEqgw/h/YDwZ6TNW8EPkHt1EvwSJ6wS1seAFAMmVFM8yQWAeSh0/7bVfWmopYnB
         4YfgxHjMqVa5LSh0A3cKmrKQB8141GW1gSs9AOffmqVZmyQvYXajXYikCFmt2iLnZQ96
         sCDPm9ti3Ya8Dn06r8cL4p0f+PDnlq0v3xxYp4UqKNmzEQOH/u8/pc9frThc2f+k5Psj
         s0U6sivkPJCWK6DBj2DFBZQgj6FoegkccrbMxkUg8CEMRnRmsmhp31Nt1iHnv+qn9QNw
         PFCg==
Subject: Re: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
References: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
 <20210105145353.GC17086@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bef949af-a733-8024-f6e7-279036bf1045@gmail.com>
Date: Wed, 6 Jan 2021 00:11:25 +0900
MIME-Version: 1.0
In-Reply-To: <20210105145353.GC17086@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 5 Jan 2021 06:53:53 -0800, Paul E. McKenney wrote:
> On Tue, Jan 05, 2021 at 09:23:11AM +0900, Akira Yokosawa wrote:
>> >From e98f36b3a91d406c2375863dc003727bc8153f4f Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 4 Jan 2021 21:14:10 +0900
>> Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
>>
>> Quick Quizzes in this section should be presented in "nq" builds.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Applied and pushed, thank you!
> 
> However, "make nq" is giving me framed quick quiz questions rather
> than the small-font indicators that were there at some time.

Well, what you are seeing is the intention of this patch.

As the opening sentence of this section says:

    This section is organized as a series of Quick Quizzes that
    invite you to apply RCU to a number of examples ...

, I thought the quiz parts of QQs 9.59 and 9.60 should be presented
inline in Section 9.5.6 rather than the small markers.

They are similar to the QQs in the beginning of Chapter 5.

Does this make sense?

        Thanks, Akira

>                                                               This
> might be the fault of my tools, and I will be upgrading soon anyway.
> But I figured I should let you know.
> 
> 							Thanx, Paul
> 
>> ---
>>  defer/rcuexercises.tex | 16 +++++++---------
>>  1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
>> index 9438c9e5..476819a9 100644
>> --- a/defer/rcuexercises.tex
>> +++ b/defer/rcuexercises.tex
>> @@ -13,8 +13,7 @@ The \co{rcu_read_lock()}, \co{rcu_read_unlock()}, \co{rcu_dereference()},
>>  \co{rcu_assign_pointer()}, and \co{synchronize_rcu()} primitives should
>>  suffice for most of these exercises.
>>  
>> -\QuickQuizSeries{%
>> -\QuickQuizB{
>> +\EQuickQuiz{
>>  	The statistical-counter implementation shown in
>>  	Listing~\ref{lst:count:Per-Thread Statistical Counters}
>>  	(\path{count_end.c})
>> @@ -25,7 +24,7 @@ suffice for most of these exercises.
>>  	(Keep in mind that \co{read_count()}'s scalability will
>>  	necessarily be limited by its need to scan all threads'
>>  	counters.)
>> -}\QuickQuizAnswerB{
>> +}\EQuickQuizAnswer{
>>  	Hint: place the global variable \co{finalcount} and the
>>  	array \co{counterp[]} into a single RCU-protected struct.
>>  	At initialization time, this structure would be allocated
>> @@ -59,9 +58,9 @@ suffice for most of these exercises.
>>  	on
>>  	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
>>  	for more details.
>> -}\QuickQuizEndB
>> -%
>> -\QuickQuizE{
>> +}\EQuickQuizEnd
>> +
>> +\EQuickQuiz{
>>  	Section~\ref{sec:count:Applying Exact Limit Counters}
>>  	showed a fanciful pair of code fragments that dealt with counting
>>  	I/O accesses to removable devices.
>> @@ -73,7 +72,7 @@ suffice for most of these exercises.
>>  	(Keep in mind that the performance of the common-case first
>>  	code fragment that does I/O accesses is much more important
>>  	than that of the device-removal code fragment.)
>> -}\QuickQuizAnswerE{
>> +}\EQuickQuizAnswer{
>>  	Hint: replace the read-acquisitions of the reader-writer lock
>>  	with RCU read-side critical sections, then adjust the
>>  	device-removal code fragment to suit.
>> @@ -83,5 +82,4 @@ suffice for most of these exercises.
>>  	on
>>  	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
>>  	for one solution to this problem.
>> -}\QuickQuizEndE
>> -}
>> +}\EQuickQuizEnd
>> -- 
>> 2.17.1
>>
