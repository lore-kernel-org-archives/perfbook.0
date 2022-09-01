Return-Path: <SRS0=EhcA=ZE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=v+gqmfXAMilJsaiRBUKVqn6MppeYAo/ncgAKxFzOY50=;
        b=MN3V/QXPnO5cA5WtKM3o3tFMvj0FV27+yzrGxAS3JsuV5cIkSt0rUMFicsEDhdX2py
         RvdKq330dLLM4micJMEJQmHX90ZdWpfucocgZA/wmwk0KxikwIKbOd7uhVPsjgAF+cQs
         CZ3Bi4rwZpD8WCETJtl7gWJakJfrMotMJucXjzHC2LTlgTwuxk+ptkkGI03DaxQKS7EW
         jhYUmGcXebSSwJd/W6ySmdmoV4T5SZqhHwLhYqFP2hRs7GRYfCXeHyDDDBG3TcOJs33W
         acDVB5TDOvlhZUIaV/3bmGnnjLnPQdnZdL4ayFuhhvmmxTVjVYDsIPZmZHSprTw1VQtJ
         LTjg==
Message-ID: <a012cbd4-450e-4e58-e64f-ea7a19a94a06@gmail.com>
Date: Thu, 1 Sep 2022 22:26:48 +0900
MIME-Version: 1.0
Subject: Re: Comments in the form of patch
Content-Language: en-US
References: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
 <3e1afa78-865b-6fb4-ca69-36529f1a8e69@gmail.com>
 <da2fde84-6253-73b4-4eeb-0186e52f74fc@gmail.com>
 <20220831184407.GN6159@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20220831184407.GN6159@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Wed, 31 Aug 2022 11:44:07 -0700, Paul E. McKenney wrote:
> On Wed, Aug 31, 2022 at 11:41:35PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is a collection of comments in the form of a patch.
>> I think you can figure out what I want to say, but if unclear,
>> please ask.
>>
>>         Thanks, Akira
>> ---
>>  defer/rcuusage.tex  |  2 ++
>>  locking/locking.tex | 12 ++++++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
>> index eba1033bbbc3..0cefe84d0e63 100644
>> --- a/defer/rcuusage.tex
>> +++ b/defer/rcuusage.tex
>> @@ -1732,11 +1732,13 @@ locking and by static data-structure layout, respectively.
>>  
>>  	Hazard pointers can be considerd to combine temporal and spatial
>>  	synchronization in a similar manner.
>> +% reference to \cref{lst:defer:Hazard-Pointer Recording and Clearing}?
>>  	The \co{hp_record()} function's acquisition of a reference
>>  	provides both spatial and temporal synchronization, subscribing
>>  	to a version and marking the start of a reference, respectively.
>>  	This function therefore combines the effects of RCU's
>>  	\co{rcu_read_lock()} and \co{rcu_dereference()}.
>> +% reference to \cref{lst:defer:Hazard-Pointer Scanning and Freeing}?
>>  	The \co{hp_clear()} function's release of a reference provides
>>  	temporal synchronization marking the end of a reference, and is
>>  	thus similar to RCU's \co{rcu_read_unlock()}.
> 
> Good point!  I took a stab at this here:
> 
> ec15ee942d5c ("defer/rcuusage: Add references to QQ9.65")
Looks good!

> 
>> diff --git a/locking/locking.tex b/locking/locking.tex
>> index f0b4513995a7..df6458063a89 100644
>> --- a/locking/locking.tex
>> +++ b/locking/locking.tex
>> @@ -1136,6 +1136,13 @@ Of course, locks partition time instead of sawing wood,\footnote{
>>  	are described in \cref{chp:Deferred Processing}.}
>>  but just like sawing wood, using locks to partitioning wastes some of
>>  that time due to lock overhead and (worse yet) lock contention.
>> +%%% ^^^ I could not parse this sentence for the first time.
>> +% ..., [using locks] to [partitioning wastes] [some of that time] ???
>> +%
>> +% [partitioning wastes] looked like a noun phrase.
>> +%
>> +% ..., partitioning time with locks wastes some of that time ... ???
>> +%%%
> 
> This was me changing my mind on how to write the sentence mid-way
> through and failing to clean up afterwards.  The "to partitioning wastes"
> should instead be "to partition time wastes".
Ah, that explains.  ;-)

> 
> 69cd68c5aa33 ("locking: Fix time-partitioning typo")
> 
>>  One important difference is that if someone saws a board into too-small
>>  pieces, the resuting conversion of most of that board into sawdust will
>>  be immediately obvious.
>> @@ -1178,6 +1185,11 @@ be accessed by the lock holder without interference from other threads.
>>  The Rust programming language takes lock/data association a step further
>>  by allowing the developer to make a compiler-visible association between
>>  a lock and the data that it protects.
>> +% A \cite{} or two for the Rust lang?
>> +%   - https://www.rust-lang.org/
>> +%   - https://doc.rust-lang.org/book/ch16-00-concurrency.html
>> +%
>> +% Brief introduction of the Rust lang somewhere in Chapter 2?
> 
> Good point!  But how about this one?
> 
> https://cacm.acm.org/magazines/2021/4/251364-safe-systems-programming-in-rust/fulltext
Yes, this looks like a good read.

> 
> It talks about safety, but also links it to verification.
I do need to read through it.

> 
> 729ed701fa72 ("locking: Add Rust citation for lock/data association")
> 
> Thoughts?
All look good to me.

I have a set of last-minute typo fixes.
Will send them soon.

       Thanks, Akira

> 
> 							Thanx, Paul
> 
>>  When such an association has been made, attempts to access the data
>>  without the benefit of the corresponding lock will result in a
>>  compile-time diagnostic.
>> -- 
>> 2.25.1
>>
>>
