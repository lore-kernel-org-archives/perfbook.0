Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbiJSXck (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Oct 2022 19:32:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C201D3EB7
        for <perfbook@vger.kernel.org>; Wed, 19 Oct 2022 16:32:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0B7F0B81E85
        for <perfbook@vger.kernel.org>; Wed, 19 Oct 2022 23:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666222340;
        bh=Wlo6y1XvzaqQfYxN7BqoZInLHNDRru3soIkQYSBi7Wk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qvxEtDYeT1Ex/c9FXwH09KM6Ip4SxyZgGkMaf1mym4UdLLtiZpBQZViiZ6ar6iEyp
         twrpthEy1kvhs3wf7+RDZcq/fo3Cv9oD40z+LoF/rTD+6R1Zo6urIRpAsCfZ4Z4zMa
         aOANnBQ4AIXC2CKQbExii1hCM+3eSvMWvQuiimi6H6X8nwIGjHDZvDmQ1Y6ktNwlvg
         r4EYJYRmUQxOqwtN4soUNOYutYUeM9vSzkn3WtHUGp+ZqKKKp0zwemJEcyjfOuNEVb
         Z7IJB95X0AHfa0r7uUCVH0cgkfp5VBUJWAvNBddWNFxiNDOwhsJcPmQ+paevUUhUO3
         XuWOGYGaplXlQ==
Date: Wed, 19 Oct 2022 16:32:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: 7.5.2.7: Library Functions Used Between fork() and exec()
Message-ID: <20221019233220.GH5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FU6Sa=vc6DRGsewXMP6N1Hz2HHUsKkgNTUzPx9Bh0VuKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FU6Sa=vc6DRGsewXMP6N1Hz2HHUsKkgNTUzPx9Bh0VuKQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 14, 2022 at 08:14:42AM -0400, Elad Lahav wrote:
> Ah, multi-threaded fork, my arch-nemesis.
> 
> A few points, though I'm not sure any of these are worth mentioning in the book:
> 
> 1. It should perhaps be made clear that the child's copy of the lock
> is, in fact, a separate lock. The statement that the lock is held by a
> parent thread is somewhat inaccurate. That is, unless the lock is in
> explicitly-shared memory (i.e., the result of mmap(MAP_SHARED)), in
> which case the lock is indeed the same and is (presumably) meant to be
> shared between the parent and child.
> 
> 2. POSIX explicitly says that you can't execute any
> non-async-signal-safe functions between fork() and exec(), which
> pretty much eliminates any function that acquires a lock.
> 
> 3. posix_spawn() is a safer alternative to the fork()/exec() pair
> (though not to fork() by itself), at least with sensible
> implementations that don't devolve to fork() and exec().

Good points!

How about the following update?

							Thanx, Paul

------------------------------------------------------------------------

commit 069eb5ee2b570c9216b7f1244847a4bf2d2dfb47
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Wed Oct 19 16:30:52 2022 -0700

    locking: Expand on fork()/exec() locking issues
    
    Reported-by: Elad Lahav <e2lahav@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/bib/os.bib b/bib/os.bib
index 3ae9b617..0846801e 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -1442,3 +1442,24 @@ Paul E. McKenney",
  note="\url{https://google.github.io/tcmalloc/overview.html}",
  lastchecked="January 24, 2020",
 }
+
+@unpublished{JoshTriplett2022io_uring_spawn,
+ author="Josh Triplett",
+ title="Spawning processes faster and easier with \co{io_uring}",
+ year="2022",
+ month="September",
+ day="12",
+ url={https://lpc.events/event/16/contributions/1213/},
+ note="\url{https://www.youtube.com/watch?v=_h-kV8AYYqM&t=4074s}",
+ lastchecked="October 19, 2022",
+}
+
+@unpublished{JakeEdge2022io_uring_spawn,
+ author="Jake Edge",
+ title="Introducing \co{io_uring_spawn}",
+ year="2022",
+ month="September",
+ day="20",
+ note="\url{https://lwn.net/Articles/908268/}",
+ lastchecked="October 19, 2022",
+}
diff --git a/locking/locking.tex b/locking/locking.tex
index 6d3bb1c8..f74e0784 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2436,11 +2436,11 @@ As noted earlier, if a thread executing a library function is holding
 a lock at the time that some other thread invokes \apipx{fork()}, the
 fact that the parent's memory is copied to create the child means that
 this lock will be born held in the child's context.
-The thread that will release this lock is running in the parent, but not
-in the child, which means that the child's copy of this lock will never
-be released.
+The thread that will release this lock is running in the parent, but
+not in the child, which means that although the parent's copy of this
+lock will be released, the child's copy never will be.
 Therefore, any attempt on the part of the child to invoke that same
-library function will result in deadlock.
+library function (thus acquiring that same lock) will result in deadlock.
 
 A pragmatic and straightforward way of solving this problem is
 to \co{fork()} a child process while the process is still single-threaded,
@@ -2472,10 +2472,16 @@ parent before the \co{fork()}, one to be called by the parent after the
 \co{fork()}, and one to be called by the child after the \co{fork()}.
 Appropriate cleanups can then be carried out at these three points.
 
-Be warned, however, that coding of \co{pthread_atfork()} handlers is quite subtle
-in general.
-The cases where \co{pthread_atfork()} works best are cases where the data structure
-in question can simply be re-initialized by the child.
+Be warned, however, that coding of \co{pthread_atfork()} handlers is
+quite subtle in general.
+The cases where \co{pthread_atfork()} works best are cases where the
+data structure in question can simply be re-initialized by the child.
+Which might be one reason why the POSIX standard forbids use of any
+non-async-signal-safe functions between the \co{fork()} and the
+\co{exec()}, which rules out acquisition of locks during that time.
+
+Other alternatives to \co{fork()}/\co{exec()} include \co{posix_spawn()}
+and \co{io_uring_spawn()}~\cite{JoshTriplett2022io_uring_spawn,JakeEdge2022io_uring_spawn}.
 
 \subsubsection{Parallel Libraries:
 				   Discussion}
