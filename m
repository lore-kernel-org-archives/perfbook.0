Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:35664 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751418AbdFZQuo (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 26
 Jun 2017 12:50:44 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5QGmaFL062843
 for <perfbook@vger.kernel.org>; Mon, 26 Jun 2017 12:50:43 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bb1wjmkhb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 26 Jun 2017 12:50:43 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 26 Jun
 2017 12:50:42 -0400
Date: Mon, 26 Jun 2017 09:50:42 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Adjust context to herd7 litmus test
Reply-To: paulmck@linux.vnet.ibm.com
References: <2e39d17d-bb28-db5b-b8e1-f65b8fa1caa4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e39d17d-bb28-db5b-b8e1-f65b8fa1caa4@gmail.com>
Message-Id: <20170626165042.GR3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 27, 2017 at 12:04:14AM +0900, Akira Yokosawa wrote:
> >From 3db6dc5ae7f71c42f91742064ec38db750f3f25d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 26 Jun 2017 22:33:30 +0900
> Subject: [PATCH] advsync: Adjust context to herd7 litmus test
> 
> Commit 96ab6febd94c ("advsync: Convert memory-misordering table to
> herd7 litmus test") needs further adjustment.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

Proofreading the surrounding paragraphs showed some room for improvement,
so I have queued the following patch.  Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

commit fb481305ecb2185749586b85dddf38bff3ebd494
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Mon Jun 26 09:49:21 2017 -0700

    advsync: Wordsmith memory-barriers intro
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 4a2c334728d3..d758cfb70a8c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -46,27 +46,24 @@ RCU.
 \end{figure}

 Unfortunately, these intuitions break down completely in face of
-code that makes direct use of explicit memory barriers for data structures
-in shared memory.
-For example, the litmus test in
+code that fails to use standard mechanisms.
+For example, the trivial-seeming litmus test in
 Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
-appears to guarantee that the \co{exists} clause is never validated.
-After all, if \nbco{0:r2=0},\footnote{
+appears to guarantee that the \co{exists} clause is never satisfied.
+After all, if \nbco{0:r2=0}\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
 	equals zero.
 	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
-	for documention of litmus-test structure.}
+	for documention of litmus-test nomenclature.}
 as shown in the \co{exists} clause, we might hope that Thread~\co{P0()}'s
 load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
 which might raise
 further hopes that Thread~\co{P1()}'s load from~\co{x0} must happen after
 Thread~\co{P0()}'s store to~\co{x0}, so that \nbco{1:r2=2},
-which should negate the \co{exits} clause.
-The example is symmetric, so similar hopeful reasoning might lead
+thus not satisfying the \co{exists} clause.
+The example is symmetric, so similar reasoning might lead
 us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=2}.
-Unfortunately, the lack of memory barriers in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
-dashes these hopes.
+Unfortunately, the lack of memory barriers dashes these hopes.
 Both the compiler and the CPU are within their rights to reorder
 the statements within both Thread~\co{P0()} and Thread~\co{P1()},
 even on relatively strongly ordered systems such as x86.
@@ -77,8 +74,8 @@ which found that the counter-intuitive ordering happened
 314 times out of 100,000,000 trials on my x86 laptop.
 Oddly enough, the perfectly legal outcome where both loads return the
 value 2 occurred less frequently, in this case, only 167 times.
-The lesson here is clear: Counterintuitivity does not necessarily
-imply lower probability!
+The lesson here is clear: Increased counterintuitivity does not necessarily
+imply decreased probability!
 % Run on June 23, 2017:
 % litmus7 -r 1000 -carch X86 C-SB+o-o+o-o.litmus
 % Test C-SB+o-o+o-o Allowed

