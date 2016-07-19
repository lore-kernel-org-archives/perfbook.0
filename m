Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27997 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751205AbcGSPKH (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 19
 Jul 2016 11:10:07 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6JF9CY2057170
 for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:10:07 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2495s98bb1-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Tue,
 19 Jul 2016 11:10:06 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 19 Jul
 2016 11:10:05 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id E546638C806A
 for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:10:00 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6JFA0k155050448	for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 15:10:00
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6JFA0Yr031418	for <perfbook@vger.kernel.org>; Tue, 19 Jul 2016 11:10:00
 -0400
Date: Tue, 19 Jul 2016 08:10:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] formal: Trivial typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee5270b0-78c0-ae91-6a93-336968af2589@gmail.com>
Message-Id: <20160719151024.GU7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jul 19, 2016 at 11:42:13PM +0900, Akira Yokosawa wrote:
> >From aefb442330115d2af25f532fcd725ed4c06e6908 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 19 Jul 2016 23:30:18 +0900
> Subject: [PATCH] formal: Trivial typo fixes
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Thank you!

I queued both this and the quick-quiz explanation.  I wordsmithed
the explanation as shown below.

							Thanx, Paul

> ---
>  formal/formal.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/formal/formal.tex b/formal/formal.tex
> index 0e5fef3..ed9d7a3 100644
> --- a/formal/formal.tex
> +++ b/formal/formal.tex
> @@ -126,7 +126,7 @@ The larger overarching software construct is of course validated by testing.
>  	because the rate of change is just too great.
>  	Furthermore, although the L4 microkernel is a large software
>  	artifact from the viewpoint of formal verification, it is tiny
> -	compared to the a great number of projects, including LLVM,
> +	compared to a great number of projects, including LLVM,
>  	gcc, the Linux kernel, Hadoop, MongoDB, and a great many others.
> 
>  	Although formal verification is finally starting to show some
> @@ -171,4 +171,4 @@ All else being equal, a simpler implementation is much better than
>  a mechanical proof for a complex implementation!
> 
>  And the open challenge to those working on formal verification techniques
> -and systems is prove this summary wrong!
> +and systems is to prove this summary wrong!
> -- 
> 1.9.1
> 

------------------------------------------------------------------------

commit c2260df4e50e2384d99713f8e07b62275e1aa7b2
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Tue Jul 19 08:08:08 2016 -0700

    Wordsmith switching between quick-quiz questions and answers
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/howto/howto.tex b/howto/howto.tex
index 68ed47d919b0..efb570c9d066 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -209,12 +209,12 @@ Here are a few possible strategies:

 Note that as of mid-2016 the quick quizzes are hyperlinked
 to the answers and vice versa.
-Click either the ``Quick Quiz'' headings or the small squares
-to move back and forth between quiz and answer.
-Also note that the white squares at the end of answers are
-linked to the black squares at the end of quizzes.
-If you want to continue reading text after the end of quizzes,
-white squares would be of your choice.
+Click either the ``Quick Quiz'' heading or the small black square
+to move to the beginning of the answer.
+From the answer, click on the heading or the small black square to
+move to the beginning of the quiz, or, alternatively, click on the
+small white square at the end of the answer to move to the end of the
+corresponding quiz.
 } \QuickQuizEnd

 In short, if you need a deep

