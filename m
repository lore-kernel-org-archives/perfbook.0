Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43325 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751138AbcGQV6l (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 17 Jul 2016 17:58:41 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6HLwS7E081529
 for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 17:58:41 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 2482e014qh-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 17 Jul 2016 17:58:40 -0400
Received: from localhost	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 17 Jul
 2016 15:58:40 -0600
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 68E901FF001E	for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 15:58:20 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6HLwa9v58523748	for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 21:58:36
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6HLwaXp031371	for <perfbook@vger.kernel.org>; Sun, 17 Jul 2016 17:58:36
 -0400
Date: Sun, 17 Jul 2016 14:59:00 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] qqz: Add another hyperlink to black box in QQA
Reply-To: paulmck@linux.vnet.ibm.com
References: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
Message-Id: <20160717215900.GD7094@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 17, 2016 at 02:50:04PM +0900, Akira Yokosawa wrote:
> From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 12 Jul 2016 20:28:08 +0900
> Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
> 
> This commit adds another cross-link to the black boxes in QQA.
> I think this change would meet readers' expectation.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I agree!  For reasons that are not clear to me, I had to hand-apply
this patch.  Might have been a white-space issue, which I did not
think to check for...

Please take a look at the patch below to make sure that I did it
correctly.

Also, this suggests a possibility:  In the quick-quiz answer, suppose
that the heading and the black box link (as they do now) to the beginning
of the quick-quiz question, but that the white box links to the end
(or just after the end) of the quick-quiz question.  That way, the
reader could choose the return point.

Would that make sense?

							Thanx, Paul

------------------------------------------------------------------------

commit 8afdb9c1a55c7cf2300e6812cff58dd0fda4d585
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Sun Jul 17 14:54:03 2016 -0700

    qqz: Add another hyperlink to black box in QQA
    
    This commit adds a hyperlink from the black box in the quick-quiz
    answer to the beginning of the corresponding quick-quiz question.
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/qqz.sty b/qqz.sty
index 12dc85e30116..0c97df92cb50 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -78,7 +78,8 @@
 	\noindent
 	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }

-\newcommand{\QuickA}[1]{\rule{7pt}{7pt}
+\newcommand{\QuickA}[1]{%
+	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
 	\par\vspace{0.8\baselineskip}
 	\noindent\textbf{Answer:} \\ }


