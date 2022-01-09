Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:57450 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiAIS0Z (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 9 Jan 2022 13:26:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 253D460F4E
        for <perfbook@vger.kernel.org>; Sun,  9 Jan 2022 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641752784;
        bh=9eQGBm3FIe/Nb5bbRYAa33ihzChc5KSX9a8XAc4DS6o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=QpDuytxhFGtv0M4cdmzBQYS2mAvlfb1VLX++rr4c8RLvCKoDj4NsXzFO4FxUkUeBU
         SS/bVPfT4HESCjH8CUDpjFwBvYjjsBX8NtdaKs9KADLgI/h1WI13sHGRhu+w6Tk0UI
         49R7zFs045Kr45jxP7SR4Y+f3uvVzaymxegTSnYRS/UQdsrLOC7bZ2ioksou8+2bkS
         O9xmwTY5CoTeGBvMvGEhbhhjcukc3/aMVgo3pL0v+isalIy3ulegMK/6Z2fuil+kLU
         csRonkSrxHMNF6UQ5/cVTf76PfQ9UmYDU7m2YgRB/rVy1nyIv0pqMelp+9n1bFSKj6
         EHvbf18V+gRLg==
Date: Sun, 9 Jan 2022 10:26:24 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: A few comments on new Section 9.5.1.2 "Core RCU API"
Message-ID: <20220109182624.GA947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <76a0b4f0-6e9b-8012-edc4-e3f6ea918659@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76a0b4f0-6e9b-8012-edc4-e3f6ea918659@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 09, 2022 at 10:35:28AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Here are a few comments occurred to me while reading Section
> 9.5.1.2.
> 
> o Section title reads "Core RCU API", whereas Table 9.1's
>   caption reads "RCU Core API".  They look somewhat
>   inconsistent.  Is the difference intentional?

Not intentional.  I guess I was just taking thinking forwards and
backwards to an extreme or something.  Good catch, fixed with attribution,
thank you!  (I chose "Core RCU API" pretty much arbitrarily.)

> o In the introduction of rcu_dereference(), the term of
>   "an RCU-protected pointer" is used first time throughout
>   this book.  It is also used in the new Table 9.1.
> 
>   I think it is pretty obvious for you what it means, but a
>   first-time reader might wonder, "What does protecting a
>   pointer mean?"
> 
>   A short answer would be something like:
> 
>     What is protected by an RCU read-side critical section is
>     not the pointer itself, but an instance of a pointed-to
>     data structure on memory.
> 
>   You can expand as you'd like.

How about as shown below?

							Thanx, Paul

------------------------------------------------------------------------

commit 426fa71dff706185a64087988ee7a7a25d4c7bf1
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sun Jan 9 10:24:47 2022 -0800

    defer/rcuintro: Add QQ on "RCU-protected pointer" definition
    
    Also add both "RCU-protected pointer" and "RCU-protected data" to
    the glossary.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 4dfbcfda..dc464742 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -210,6 +210,26 @@ that \co{rcu_dereference()} must prevent the compiler and (in
 one case) the CPU from reordering its load with later memory operations
 that dereference this pointer.
 
+\QuickQuiz{
+	What is an RCU-protected pointer?
+}\QuickQuizAnswer{
+	A pointer to RCU-protected data.
+	RCU-protected data is in turn a block of dynamically allocated
+	memory whose freeing will be deferred such that an RCU grace
+	period will elapse between the time that there were no longer
+	any RCU-reader-accessible pointers to that block and the time
+	that that block is freed.
+	This ensures that no RCU readers will have access to that block at
+	the time that it is freed.
+
+	RCU-protected pointers must be handled carefully.
+	For example, any reader that intends to dereference an
+	RCU-protected pointer must use \co{rcu_dereference()} (or
+	stronger) to load that pointer.
+	In addition, any updater must use \co{rcu_assign_pointer()}
+	(or stronger) to store to that pointer.
+}\QuickQuizEnd
+
 The other three members of the core APIs are used by updaters.
 The \apik{synchronize_rcu()} function implements the ``wait for readers''
 operation from \cref{fig:defer:Deletion With Concurrent Readers}.
diff --git a/glossary.tex b/glossary.tex
index 31c09232..efba1089 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -431,6 +431,20 @@
 	outside of an RCU read-side critical section.
 	Any interval of time during which all threads pass through at
 	least one quiescent state each is termed a ``grace period''.
+\item[\IX{RCU-Protected Data}:]
+	A block of dynamically allocated memory whose freeing will be
+	deferred such that an RCU grace period will elapse between the
+	time that there were no longer any RCU-reader-accessible pointers
+	to that block and the time that that block is freed.
+	This ensures that no RCU readers will have access to that block at
+	the time that it is freed.
+\item[\IX{RCU-Protected Pointer}:]
+	A pointer to RCU-protected data.
+	Such pointers must be handled carefully, for example, any reader
+	that intends to dereference an RCU-protected pointer must
+	use \co{rcu_dereference()} (or stronger) to load that pointer,
+	and any updater must use \co{rcu_assign_pointer()} (or stronger)
+	to store to that pointer.
 \item[Read-Copy Update (RCU):]\glsuseri{rcu}
 	A synchronization mechanism that can be thought of as a replacement
 	for reader-writer locking or reference counting.
