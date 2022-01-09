Return-Path: <SRS0=KFAY=RZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8fjyp5xJyIKPfBNLzcXfHI1l9uekM9gtR0WpyyP9MGE=;
        b=YT6C5J7SzfM2kOCxl0lmw7/dwVx/JfPwhI4zaexiSNBtmDjgDaOr/Cwp+vh11hHIGB
         7XCkNEGChfHzxlZCNn5GqFu1Z7KOjleqMswsQsUVIfO28M7mDhMVq3lGX3NMFBX14kX1
         PBEwilpSUyHzVrJbbIG/yQjr92Tw79g74cJla6inImj1mYXiAWVuejOOBnzwXVFedDgX
         ZGCTyJ3uEXk5ntjGBg+6aq95Xgz99YIpauM+ESj9Rj6GqlIljhgWi4TqILxTJgHW+Iz7
         BHJhch9vXnUWgHyI7Z2kHbzGQzjI90KUm6Z6/TP4lWtBoRh3sUyI50+KOkfjcHuy0vge
         5B2Q==
Subject: Re: A few comments on new Section 9.5.1.2 "Core RCU API"
References: <76a0b4f0-6e9b-8012-edc4-e3f6ea918659@gmail.com>
 <20220109182624.GA947480@paulmck-ThinkPad-P17-Gen-1>
 <20220109183023.GA969095@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2f08c0f3-2863-7c67-1a64-f5f119cd4e6f@gmail.com>
Date: Mon, 10 Jan 2022 07:55:53 +0900
MIME-Version: 1.0
In-Reply-To: <20220109183023.GA969095@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 9 Jan 2022 10:30:23 -0800, Paul E. McKenney wrote:
> On Sun, Jan 09, 2022 at 10:26:24AM -0800, Paul E. McKenney wrote:
>> On Sun, Jan 09, 2022 at 10:35:28AM +0900, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> Here are a few comments occurred to me while reading Section
>>> 9.5.1.2.
>>>
>>> o Section title reads "Core RCU API", whereas Table 9.1's
>>>   caption reads "RCU Core API".  They look somewhat
>>>   inconsistent.  Is the difference intentional?
>>
>> Not intentional.  I guess I was just taking thinking forwards and
>> backwards to an extreme or something.  Good catch, fixed with attribution,
>> thank you!  (I chose "Core RCU API" pretty much arbitrarily.)
>>
>>> o In the introduction of rcu_dereference(), the term of
>>>   "an RCU-protected pointer" is used first time throughout
>>>   this book.  It is also used in the new Table 9.1.
>>>
>>>   I think it is pretty obvious for you what it means, but a
>>>   first-time reader might wonder, "What does protecting a
>>>   pointer mean?"
>>>
>>>   A short answer would be something like:
>>>
>>>     What is protected by an RCU read-side critical section is
>>>     not the pointer itself, but an instance of a pointed-to
>>>     data structure on memory.
>>>
>>>   You can expand as you'd like.
>>
>> How about as shown below?
>>
>> 							Thanx, Paul
>>
>> ------------------------------------------------------------------------
>>
>> commit 426fa71dff706185a64087988ee7a7a25d4c7bf1
>> Author: Paul E. McKenney <paulmck@kernel.org>
>> Date:   Sun Jan 9 10:24:47 2022 -0800
>>
>>     defer/rcuintro: Add QQ on "RCU-protected pointer" definition
>>     
>>     Also add both "RCU-protected pointer" and "RCU-protected data" to
>>     the glossary.
>>     
>>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>>
>> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
>> index 4dfbcfda..dc464742 100644
>> --- a/defer/rcuintro.tex
>> +++ b/defer/rcuintro.tex
>> @@ -210,6 +210,26 @@ that \co{rcu_dereference()} must prevent the compiler and (in
>>  one case) the CPU from reordering its load with later memory operations
>>  that dereference this pointer.
>>  
>> +\QuickQuiz{
>> +	What is an RCU-protected pointer?
>> +}\QuickQuizAnswer{
>> +	A pointer to RCU-protected data.
>> +	RCU-protected data is in turn a block of dynamically allocated
>> +	memory whose freeing will be deferred such that an RCU grace
>> +	period will elapse between the time that there were no longer
>> +	any RCU-reader-accessible pointers to that block and the time
>> +	that that block is freed.
>> +	This ensures that no RCU readers will have access to that block at
>> +	the time that it is freed.
>> +
>> +	RCU-protected pointers must be handled carefully.
>> +	For example, any reader that intends to dereference an
>> +	RCU-protected pointer must use \co{rcu_dereference()} (or
>> +	stronger) to load that pointer.
>> +	In addition, any updater must use \co{rcu_assign_pointer()}
>> +	(or stronger) to store to that pointer.
>> +}\QuickQuizEnd
>> +
>>  The other three members of the core APIs are used by updaters.
>>  The \apik{synchronize_rcu()} function implements the ``wait for readers''
>>  operation from \cref{fig:defer:Deletion With Concurrent Readers}.
>> diff --git a/glossary.tex b/glossary.tex
>> index 31c09232..efba1089 100644
>> --- a/glossary.tex
>> +++ b/glossary.tex
>> @@ -431,6 +431,20 @@
>>  	outside of an RCU read-side critical section.
>>  	Any interval of time during which all threads pass through at
>>  	least one quiescent state each is termed a ``grace period''.
>> +\item[\IX{RCU-Protected Data}:]
> 
> Except that this results in an index entry of "Rcu-protected data".
> I changed to this:
> 
> +\item[\IX{{RCUa}-Protected Data}:]> 
> This suppressed addition of this term to the index, which isn't optimal,
> but it better than "Rcu-protected data".
> 
>> +	A block of dynamically allocated memory whose freeing will be
>> +	deferred such that an RCU grace period will elapse between the
>> +	time that there were no longer any RCU-reader-accessible pointers
>> +	to that block and the time that that block is freed.
>> +	This ensures that no RCU readers will have access to that block at
>> +	the time that it is freed.
>> +\item[\IX{RCU-Protected Pointer}:]
> 
> And of course the same here.
> 
> Is there a better way?

When you need to keep upper-case letters in the index, \IXr{} is
for you.  Its definition in perfbook-lt.tex reads:

    \newcommand{\IXr}[1]{\index{#1}\hlindex{#1}} % put as is into general index

And this addition of QQ and glossary entries looks helpful to me!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> +	A pointer to RCU-protected data.
>> +	Such pointers must be handled carefully, for example, any reader
>> +	that intends to dereference an RCU-protected pointer must
>> +	use \co{rcu_dereference()} (or stronger) to load that pointer,
>> +	and any updater must use \co{rcu_assign_pointer()} (or stronger)
>> +	to store to that pointer.
>>  \item[Read-Copy Update (RCU):]\glsuseri{rcu}
>>  	A synchronization mechanism that can be thought of as a replacement
>>  	for reader-writer locking or reference counting.
