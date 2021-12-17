Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:54278 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhLQXQc (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 17 Dec 2021 18:16:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 69485B82B2A
        for <perfbook@vger.kernel.org>; Fri, 17 Dec 2021 23:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639782990;
        bh=X6/5L8kK7cMYM2lh6vCWtF0a7wgQf7L9bfPD7+J4c2g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=U7Ky+sOFYQZjcWI1euN39zCPXSMNEh8xJ71wDFjxBQPl/RIGEv5cunQRYsGCtTert
         7Wflaul2CijO8tLpt17eF3gRZBtUNJ+JYaAD343Rh9coS6NBJQK1dEKbAHmKXBsbsS
         +ZEiGOhxLgqVjClf5tzhCQhLlAbnsHirNeOMAgShCv0G1mk2+u7Tx5gefupunsjUXq
         H6Uxe96N5rwZuPDSWQMSIqnD8n+R4GxD2jFmnlkqqICtADJUAsrtVpe2bzPg+97gzg
         CF+sUv7vtbd+ZJz7GWaln/CQyk0AY55Eq34s3wJQbOFXbAihorxx/MHKSetZk/+nUL
         zx0h3JzLzlykw==
Date: Fri, 17 Dec 2021 15:16:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Minor fixes to Section 9.5
Message-ID: <20211217231629.GE641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FVZJy5KW_=7etupx6GzOG19+DB3omZ2KE31AmVkPufEPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FVZJy5KW_=7etupx6GzOG19+DB3omZ2KE31AmVkPufEPw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 17, 2021 at 12:34:53PM -0500, Elad Lahav wrote:
> I have some (potentially) more interesting comments about this
> section, but I'll defer those to after I've read Chapter 15, which may
> already address them.

Good eyes, thank you!

I added your Signed-off-by as shown below, so please let me know if
you have objections.  (Similar to that of the Linux kernel, and please
see the perfbook file "FAQ.txt" item 5 for more info.)

							Thanx, Paul

------------------------------------------------------------------------

commit 037ad7be6c8914eb7f6d23d8b6846fecdae9c8c0
Author: Elad Lahav <e2lahav@gmail.com>
Date:   Fri Dec 17 12:34:53 2021 -0500

    Minor fixes to Section 9.5
    
    [ paulmck: Put end of sentence at end of line. ]
    
    Signed-off-by: Elad Lahav <e2lahav@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 96fafeb5..a37a6f26 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -992,13 +992,13 @@ lockdep support &
 \Cref{tab:defer:RCU Diagnostic APIs}
 shows RCU's diagnostic APIs.
 
-The \co{__rcu} marks an RCU-protected pointer, for example,
+The \co{__rcu} tag marks an RCU-protected pointer, for example,
 \qtco{struct foo __rcu *p;}.
 Pointers that might be passed to \co{rcu_dereference()} can be marked,
 but pointers holding values returned from \co{rcu_dereference()}
 should not be.
 Providing these markings on variables, structure fields, function
-parameters, and return values allow the Linux kernel's \co{sparse}
+parameters, and return values allows the Linux kernel's \co{sparse}
 tool to detect situtations where RCU-protected pointers are
 incorrectly accessed using plain C-language loads and stores.
 
@@ -1028,7 +1028,7 @@ Callback checking is provided by \co{rcu_head_init()} and
 \co{rcu_head_after_call_rcu()}.
 The former is invoked on an \co{rcu_head} structure before it is passed
 to \co{call_rcu()}, and then \co{rcu_head_after_call_rcu()} will
-check to see if the callback is has been invoked with the specified
+check to see if the callback has been invoked with the specified
 function.
 
 Support for lockdep~\cite{JonathanCorbet2006lockdep} includes
@@ -1056,7 +1056,7 @@ even offline CPUs, which means that \co{rcu_is_watching()} does not
 apply to SRCU\@.
 
 \co{RCU_LOCKDEP_WARN()} emits a warning if lockdep is enabled and if
-its argument evaluated to \co{true}.
+its argument evaluates to \co{true}.
 For example, \co{RCU_LOCKDEP_WARN(!rcu_read_lock_held())} would emit a
 warning if invoked outside of an RCU read-side critical section.
 
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index bacbabec..109221fd 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -204,8 +204,8 @@ As hinted at in
 section starts with an \co{rcu_read_lock()} primitive, and ends with a
 corresponding \co{rcu_read_unlock()} primitive.
 RCU read-side critical sections can be nested, and may contain pretty
-much any code, as long as that code does not contain a quiescent state,
-for example, within the Linux kernel, it is illegal to sleep within
+much any code, as long as that code does not contain a quiescent state.
+For example, within the Linux kernel, it is illegal to sleep within
 an RCU read-side critical section because a context switch is a quiescent
 state.\footnote{
 	However, a special form of RCU called SRCU~\cite{PaulEMcKenney2006c}
@@ -398,8 +398,8 @@ In the second scenario, the reader does not start execution until
 after the removal has completed.
 The reader cannot possibly obtain a reference to the already-removed
 data element, so this element may be freed before the reader completes.
-The third scenario is like the second, but illustrates that when the
-reader cannot possibly obtain a reference to element, it is still
+The third scenario is like the second, but illustrates that even when the
+reader cannot possibly obtain a reference to an element, it is still
 permissible to defer the freeing of that element until after the
 reader completes.
 In the fourth and final scenario, the reader starts execution before
@@ -700,7 +700,7 @@ algorithms:
 	On subsequent readers?)
 }\QuickQuizEnd
 
-These three RCU components allow data to be updated in face of concurrent
+These three RCU components allow data to be updated in the face of concurrent
 readers that might be executing the same sequence of machine instructions
 that would be used by a reader in a single-threaded implementation.
 These RCU components can be combined in different ways to implement a
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 28f013d6..48622df8 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -7,7 +7,7 @@
 \OriginallyPublished{Section}{sec:defer:RCU Related Work}{RCU Related Work}{Linux Weekly News}{PaulEMcKenney2014ReadMostly}
 \OriginallyPublished{Section}{sec:defer:RCU Related Work}{RCU Related Work}{Linux Weekly News}{PaulEMcKenney2015ReadMostly}
 
-The known first mention of anything resembling RCU took the form of a bug
+The first known mention of anything resembling RCU took the form of a bug
 report from
 \ppl{Donald}{Knuth}~\cite[page 413 of Fundamental Algorithms]{Knuth73}
 against \ppl{Joseph}{Weizenbaum}'s SLIP list-processing facility for
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 028c2259..7e154fac 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -903,7 +903,8 @@ structures that are designed for addition as well as deletion.
 Perhaps the most common use of RCU within the Linux kernel is as
 a replacement for reader-writer locking in read-intensive situations.
 Nevertheless, this use of RCU was not immediately apparent to me
-at the outset, in fact, I chose to implement a lightweight reader-writer
+at the outset.
+In fact, I chose to implement a lightweight reader-writer
 lock~\cite{WilsonCHsieh92a}\footnote{
 	Similar to \co{brlock} in the 2.4 Linux kernel and to
 	\co{lglock} in more recent Linux kernels.}
@@ -1652,7 +1653,7 @@ rcu_read_unlock();  /* release reference. */
 The combination of the \co{rcu_read_lock()} and \co{rcu_dereference()}
 primitives can be thought of as acquiring a reference to \co{p},
 because a grace period starting after the \co{rcu_dereference()}
-assigns to \co{p} cannot possibly end until after we reach the matching
+assignment to \co{p} cannot possibly end until after we reach the matching
 \co{rcu_read_unlock()}.
 This reference-counting scheme is restricted in that
 we are not allowed to block in RCU read-side critical sections,
