Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59739 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751295AbcGQXfs (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 17 Jul 2016 19:35:48 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6HNTAhM032042
 for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 19:35:47 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2482fvjfef-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 17 Jul 2016 19:35:46 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 17 Jul
 2016 19:35:46 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 59CB0C90042
 for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 19:35:32 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6HNZkpv55574610	for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 23:35:46
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6HNZgBu014019	for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 19:35:42
 -0400
Date: Sun, 17 Jul 2016 16:36:06 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
Reply-To: paulmck@linux.vnet.ibm.com
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
 <20160717215900.GD7094@linux.vnet.ibm.com>
 <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <731d8ed0-deae-e159-a889-ba38822011e8@gmail.com>
Message-Id: <20160717233606.GE7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jul 18, 2016 at 07:54:27AM +0900, Akira Yokosawa wrote:
> On 2016/07/17 14:59:00 -0700, Paul E. McKenney wrote:
> >On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
> >>From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
> >>From: Akira Yokosawa <akiyks@gmail.com>
> >>Date: Tue, 12 Jul 2016 20:28:08 +0900
> >>Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
> >>
> >>This commit adds another cross-link to the black boxes in QQA.
> >>I think this change would meet readers' expectation.
> >>
> >>Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >
> >I agree!  For reasons that are not clear to me, I had to hand-apply
> >this patch.  Might have been a white-space issue, which I did not
> >think to check for...
> >
> >Please take a look at the patch below to make sure that I did it
> >correctly.
> 
> Yes, you did it right. I'm wondering what was wrong on my side.

My guess is whitespace.  Or maybe the email got mangled along the way.

> >Also, this suggests a possibility:  In the quick-quiz answer, suppose
> >that the heading and the black box link (as they do now) to the beginning
> >of the quick-quiz question, but that the white box links to the end
> >(or just after the end) of the quick-quiz question.  That way, the
> >reader could choose the return point.
> >
> >Would that make sense?
> 
> Well, yes if readers expect the behavior.
> But for long answers, there are cases where you can choose only the white
> boxes in your view. I'm hesitating because of your reaction to the first
> attempt  the other day.

All good points!

> Anyway, I'm going to submit a patch for you to try.
> 
> Also we'd also need to update the explanation in the answer of Quick Quiz 1.3
> if we actually do the change.

Looking forward to it!

						Thanx, Paul

> >------------------------------------------------------------------------
> >
> >commit 8afdb9c1a55c7cf2300e6812cff58dd0fda4d585
> >Author: Akira Yokosawa <akiyks@gmail.com>
> >Date:   Sun Jul 17 14:54:03 2016 -0700
> >
> >    qqz: Add another hyperlink to black box in QQA
> >
> >    This commit adds a hyperlink from the black box in the quick-quiz
> >    answer to the beginning of the corresponding quick-quiz question.
> >
> >    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> >diff --git a/qqz.sty b/qqz.sty
> >index 12dc85e30116..0c97df92cb50 100644
> >--- a/qqz.sty
> >+++ b/qqz.sty
> >@@ -78,7 +78,8 @@
> > 	\noindent
> > 	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
> >
> >-\newcommand{\QuickA}[1]{\rule{7pt}{7pt}
> >+\newcommand{\QuickA}[1]{%
> >+	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
> > 	\par\vspace{0.8\baselineskip}
> > 	\noindent\textbf{Answer:} \\ }
> >
> >
> >
> 

