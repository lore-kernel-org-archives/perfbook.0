Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:36378 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiAJEtO (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 9 Jan 2022 23:49:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CE45B80E56
        for <perfbook@vger.kernel.org>; Mon, 10 Jan 2022 04:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641790152;
        bh=BMHfn4Y+d2E8k5fuSbXg/l3NtBFKenGLhTPIQkTcVgY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IJaB6cWEftPc5R2+6JwdagDjEgbhvvXV0CVy7srE3kl5Akv6tJ1TVmgehIZfHhUvY
         5bj+mxuaU7xeOkYIy0n3BN0yfkO+3ff+gPkwt4eCTGbh3pxw0bEVjKQUNL2n/c4428
         Yv7BVHpAGAHx7qAbT0FxxMEVkC4aa8A+En9gd70f73HvAtEc+VhEDCcv3rY1OB09OK
         qKI2v95SUW+FR2Ble16ElPChLq9JhjYkIA5jJe/d/7AlkjPi2C8lFe2vAdnh6UX8Bd
         il2EI2ucmqt9AtaY2hrBVgm+3x6djm8T5/1uF1N1YBiMtFLUap2fjUd/kSCnnATsBG
         L8LCmmUA0VnZg==
Date: Sun, 9 Jan 2022 20:49:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: A few comments on new Section 9.5.1.2 "Core RCU API"
Message-ID: <20220110044911.GC947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <76a0b4f0-6e9b-8012-edc4-e3f6ea918659@gmail.com>
 <20220109182624.GA947480@paulmck-ThinkPad-P17-Gen-1>
 <20220109183023.GA969095@paulmck-ThinkPad-P17-Gen-1>
 <2f08c0f3-2863-7c67-1a64-f5f119cd4e6f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f08c0f3-2863-7c67-1a64-f5f119cd4e6f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 10, 2022 at 07:55:53AM +0900, Akira Yokosawa wrote:
> On Sun, 9 Jan 2022 10:30:23 -0800, Paul E. McKenney wrote:
> > On Sun, Jan 09, 2022 at 10:26:24AM -0800, Paul E. McKenney wrote:
> >> On Sun, Jan 09, 2022 at 10:35:28AM +0900, Akira Yokosawa wrote:
> >>> Hi Paul,
> >>>
> >>> Here are a few comments occurred to me while reading Section
> >>> 9.5.1.2.
> >>>
> >>> o Section title reads "Core RCU API", whereas Table 9.1's
> >>>   caption reads "RCU Core API".  They look somewhat
> >>>   inconsistent.  Is the difference intentional?
> >>
> >> Not intentional.  I guess I was just taking thinking forwards and
> >> backwards to an extreme or something.  Good catch, fixed with attribution,
> >> thank you!  (I chose "Core RCU API" pretty much arbitrarily.)
> >>
> >>> o In the introduction of rcu_dereference(), the term of
> >>>   "an RCU-protected pointer" is used first time throughout
> >>>   this book.  It is also used in the new Table 9.1.
> >>>
> >>>   I think it is pretty obvious for you what it means, but a
> >>>   first-time reader might wonder, "What does protecting a
> >>>   pointer mean?"
> >>>
> >>>   A short answer would be something like:
> >>>
> >>>     What is protected by an RCU read-side critical section is
> >>>     not the pointer itself, but an instance of a pointed-to
> >>>     data structure on memory.
> >>>
> >>>   You can expand as you'd like.
> >>
> >> How about as shown below?
> >>
> >> 							Thanx, Paul
> >>
> >> ------------------------------------------------------------------------
> >>
> >> commit 426fa71dff706185a64087988ee7a7a25d4c7bf1
> >> Author: Paul E. McKenney <paulmck@kernel.org>
> >> Date:   Sun Jan 9 10:24:47 2022 -0800
> >>
> >>     defer/rcuintro: Add QQ on "RCU-protected pointer" definition
> >>     
> >>     Also add both "RCU-protected pointer" and "RCU-protected data" to
> >>     the glossary.
> >>     
> >>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >>
> >> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> >> index 4dfbcfda..dc464742 100644
> >> --- a/defer/rcuintro.tex
> >> +++ b/defer/rcuintro.tex
> >> @@ -210,6 +210,26 @@ that \co{rcu_dereference()} must prevent the compiler and (in
> >>  one case) the CPU from reordering its load with later memory operations
> >>  that dereference this pointer.
> >>  
> >> +\QuickQuiz{
> >> +	What is an RCU-protected pointer?
> >> +}\QuickQuizAnswer{
> >> +	A pointer to RCU-protected data.
> >> +	RCU-protected data is in turn a block of dynamically allocated
> >> +	memory whose freeing will be deferred such that an RCU grace
> >> +	period will elapse between the time that there were no longer
> >> +	any RCU-reader-accessible pointers to that block and the time
> >> +	that that block is freed.
> >> +	This ensures that no RCU readers will have access to that block at
> >> +	the time that it is freed.
> >> +
> >> +	RCU-protected pointers must be handled carefully.
> >> +	For example, any reader that intends to dereference an
> >> +	RCU-protected pointer must use \co{rcu_dereference()} (or
> >> +	stronger) to load that pointer.
> >> +	In addition, any updater must use \co{rcu_assign_pointer()}
> >> +	(or stronger) to store to that pointer.
> >> +}\QuickQuizEnd
> >> +
> >>  The other three members of the core APIs are used by updaters.
> >>  The \apik{synchronize_rcu()} function implements the ``wait for readers''
> >>  operation from \cref{fig:defer:Deletion With Concurrent Readers}.
> >> diff --git a/glossary.tex b/glossary.tex
> >> index 31c09232..efba1089 100644
> >> --- a/glossary.tex
> >> +++ b/glossary.tex
> >> @@ -431,6 +431,20 @@
> >>  	outside of an RCU read-side critical section.
> >>  	Any interval of time during which all threads pass through at
> >>  	least one quiescent state each is termed a ``grace period''.
> >> +\item[\IX{RCU-Protected Data}:]
> > 
> > Except that this results in an index entry of "Rcu-protected data".
> > I changed to this:
> > 
> > +\item[\IX{{RCUa}-Protected Data}:]> 
> > This suppressed addition of this term to the index, which isn't optimal,
> > but it better than "Rcu-protected data".
> > 
> >> +	A block of dynamically allocated memory whose freeing will be
> >> +	deferred such that an RCU grace period will elapse between the
> >> +	time that there were no longer any RCU-reader-accessible pointers
> >> +	to that block and the time that that block is freed.
> >> +	This ensures that no RCU readers will have access to that block at
> >> +	the time that it is freed.
> >> +\item[\IX{RCU-Protected Pointer}:]
> > 
> > And of course the same here.
> > 
> > Is there a better way?
> 
> When you need to keep upper-case letters in the index, \IXr{} is
> for you.  Its definition in perfbook-lt.tex reads:
> 
>     \newcommand{\IXr}[1]{\index{#1}\hlindex{#1}} % put as is into general index

Much better, thank you!  I pushed this change out with \IXr.

> And this addition of QQ and glossary entries looks helpful to me!

Glad you like it!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> +	A pointer to RCU-protected data.
> >> +	Such pointers must be handled carefully, for example, any reader
> >> +	that intends to dereference an RCU-protected pointer must
> >> +	use \co{rcu_dereference()} (or stronger) to load that pointer,
> >> +	and any updater must use \co{rcu_assign_pointer()} (or stronger)
> >> +	to store to that pointer.
> >>  \item[Read-Copy Update (RCU):]\glsuseri{rcu}
> >>  	A synchronization mechanism that can be thought of as a replacement
> >>  	for reader-writer locking or reference counting.
