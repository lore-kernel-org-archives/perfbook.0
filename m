Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231321AbiDQRgp (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 17 Apr 2022 13:36:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498CE2DA86
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 10:34:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E1D13B80A72
        for <perfbook@vger.kernel.org>; Sun, 17 Apr 2022 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650216846;
        bh=CVFY2Wq3i/ByH8VJDa2l0EXBMlQQ5VYVCIJC6KO/62Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=UP6xEyQb4yqNYjY4UVjuy24I8/unJWonj4EzmFbrVpNFkc7a5RYrdj8clw5fARb2i
         /6Su5Up0IbQOQOote4DNRLyEp2jSLL40D0moXeRAMVWNFC0MMmaFmhLZAywwIwDBtH
         zGl3jr1L1t/zBPhfU1+fIPVe6SqvKCvD3AER09ERVebWu5sJcPaUwWIQbhakfl7wbU
         UupqN2xE0Z/ZzU4W9GMdE5SaWS1XVfq25/smP/3QhGV1KFZWD7nhCzb2q4CchQqOPK
         bEZPGYMMjr7uHdI3bCt0NHbb1zX/llXGYV+MwGz1T7CaOfHUUaTXEjwmAkQrMsK8m7
         2+xrDiMuBS56w==
Date: Sun, 17 Apr 2022 10:34:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Clarify what the read memory barrier really does
Message-ID: <20220417173406.GQ4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220417111726.GA27498@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220417111726.GA27498@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 17, 2022 at 11:17:26AM +0000, Hao Lee wrote:
> Hello,
> 
> I think maybe we can make the following contents more clear:

Too true, and thank you for spotting this!

> Cite from Appendix C.4:
> 
> 	when a given CPU executes a memory barrier, it marks all the
> 	entries currently in its invalidate queue, and forces any
> 	subsequent load to wait until all marked entries have been
> 	applied to the CPU’s cache.
> 
> It's obvious that this paragraph means read barrier can flush invalidate
> queue.

True, it -could- flush the invalidate queue.  Or it could just force later
reads to wait until the invalidate queue drains of its own accord, which
is what is actually described in the above passage.  Or it could implement
a large number of possible strategies in between these two extremes.

The key point is that C.4 is describing implementation.  And implementation
of full memory barriers.

> Cite from Appendix C.5:
> 
> 	The effect of this is that a read memory barrier orders only
> 	loads on the CPU that executes it, so that all loads preceding
> 	the read memory barrier will appear to have completed before any
> 	load following the read memory barrier.
> 
> This paragraph means read barrier can prevent Load-Load memory
> reordering which is caused by out-of-order execution.

This passage describes the software-visible effects of whatever
implementation is actually used for a given system.  Another passage in
the preceding paragraph describes what is happening at the implementations
level.

> If I understand correctly, read memory barrier has _two functions_, one
> is flushing invalidate queue to make the loads following the barrier can
> load the latest value, and the other is stalling instruction pipeline to
> prevent Load-Load memory reordering. I think these are two completely
> different functions and we should make such a summary in the book.

I would instead say that there are two different ways that memory barriers
can interact with invalidate queues.  And there are two different
levels of abstraction, hardware implementation (buffers and queues)
and software-visible effect (ordering).

I queued the commit shown below.  Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

commit 1389b9da9760040276f8c53215aaa96d964a0892
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Sun Apr 17 10:32:19 2022 -0700

    appendix/whymb: Clarify memory-barrier operation
    
    Reported-by: Hao Lee <haolee.swjtu@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 8d58483f..8f607e35 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1233,33 +1233,76 @@ With this change, the sequence of operations might be as follows:
 With much passing of MESI messages, the CPUs arrive at the correct answer.
 This section illustrates why CPU designers must be extremely careful
 with their cache-coherence optimizations.
+The key requirement is that the memory barriers provide the appearance
+of ordering to the software.
+As long as these appearances are maintained, the hardware can carry
+out whatever queueing, buffering, marking, stallings, and flushing
+optimizations it likes.
 
-\section{Read and Write Memory Barriers}
-\label{sec:app:whymb:Read and Write Memory Barriers}
+\QuickQuiz{
+	Instead of all of this marking of invalidation-queue entries
+	and stalling of loads, why not simply force an immediate flush
+	of the invalidation queue?
+}\QuickQuizAnswer{
+	An immediate flush of the invalidation queue would do the trick.
+	Except that the common-case super-scalar CPU is executing many
+	instructions at once, and not necessarily even in the expected
+	order.
+	So what would ``immediate'' even mean?
+	The answer is clearly ``not much''.
+
+	Nevertheless, for simpler CPUs that execute instructions serially,
+	flushing the invalidation queue might be a reasonable implementation
+	strategy.
+}\QuickQuizEnd
+
+\section{Read and Write Memory Barriers} \label{sec:app:whymb:Read and
+Write Memory Barriers}
 
-In the previous section, memory barriers were used to mark entries in
-both the store buffer and the invalidate queue.
-But in our code fragment, \co{foo()} had no reason to do anything
-with the invalidate queue, and \co{bar()} similarly had no reason
-to do anything with the store buffer.
+In the previous section, memory barriers were used to mark entries in both
+the store buffer and the invalidate queue.
+But in our code fragment, \co{foo()} had no reason to do anything with the
+invalidate queue, and \co{bar()} similarly had no reason to do anything
+with the store buffer.
 
 Many CPU architectures therefore provide weaker memory-barrier
 instructions that do only one or the other of these two.
 Roughly speaking, a ``read memory barrier'' marks only the invalidate
-queue and a ``write memory barrier'' marks only the store buffer,
-while a full-fledged memory barrier does both.
-
-The effect of this is that a read memory barrier orders only loads
-on the CPU that executes it, so that all loads preceding the read memory
-barrier will appear to have completed before any load following the
-read memory barrier.
-Similarly, a write memory barrier orders
-only stores, again on the CPU that executes it, and again so that
-all stores preceding the write memory barrier will appear to have
-completed before any store following the write memory barrier.
+queue (and snoops entries in the store buffer) and a ``write memory
+barrier'' marks only the store buffer, while a full-fledged memory
+barrier does all of the above.
+
+The software-visible effect of these hardware mechanisms is that a read
+memory barrier orders only loads on the CPU that executes it, so that
+all loads preceding the read memory barrier will appear to have completed
+before any load following the read memory barrier.
+Similarly, a write memory barrier orders only stores, again on the
+CPU that executes it, and again so that all stores preceding the write
+memory barrier will appear to have completed before any store following
+the write memory barrier.
 A full-fledged memory barrier orders both loads and stores, but again
 only on the CPU executing the memory barrier.
 
+\QuickQuiz{
+	But can't full memory barriers impose global ordering?
+	After all, isn't that needed to provide the ordering
+	shown in \cref{lst:formal:IRIW Litmus Test}?
+}\QuickQuizAnswer{
+	Sort of.
+
+	Note well that this litmus test has not one but two full
+	memory-barrier instructions, namely the two \co{sync} instructions
+	executed by \co{P2} and \co{P3}.
+
+	It is the interaction of those two instructions that provides
+	the global ordering, not just their individual execution.
+	For example, each of those two \co{sync} instructions might stall
+	waiting for all CPUs to process their invalidation queues before
+	allowing subsequent instructions to execute.\footnote{
+		Real-life hardware of course applies many optimizations
+		to minimize the resulting stalls.}
+}\QuickQuizEnd
+
 If we update \co{foo} and \co{bar} to use read and write memory
 barriers, they appear as follows:
 
