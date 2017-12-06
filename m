Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52284 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752166AbdLFQMC (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 6 Dec 2017 11:12:02 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB6GAvvZ013419
 for <perfbook@vger.kernel.org>; Wed, 6 Dec 2017 11:12:01 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2epkqb0j4h-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 06 Dec 2017 11:12:01 -0500
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 6 Dec 2017
 11:12:00 -0500
Date: Wed, 6 Dec 2017 08:11:59 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] future: Update Locking and HTM comparison tables
Reply-To: paulmck@linux.vnet.ibm.com
References: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49209cfd-5494-fc54-ba4b-f8389ba4aed7@gmail.com>
Message-Id: <20171206161159.GX7829@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 07, 2017 at 12:00:02AM +0900, Akira Yokosawa wrote:
> >From d6497dadbc973d7d94591f48730c4c0ce1c129a8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 6 Dec 2017 23:40:04 +0900
> Subject: [PATCH 0/2] future: Update Locking and HTM comparison tables
> 
> Hi Paul,
> 
> I have tackled the remaining two tables of old style in Section 17.3.
> "Advantage", "Disadvantage", and "Strong Disadvantage" can be indicated
> by background colors, and their structures can be simplified.
> This scheme is inspired by Table 12.4, with using lower saturation
> colors.
> 
> Patch #1 modifies the tables.
> Patch #2 adds a merged table of the two as a sidewaystable.
> 
> Background colors are chosen so that they can be distinguished
> when they are printed in grayscale.
> 
> Thoughts?

Very nice!!!  I very much like the use of colors instead of symbols,
and I say that as someone who is red-green colorblind.  ;-)

I queued both commits and added the commit below.  If you are OK with
the below change, I will push all three.  If not, please let me know
what needs to change.

							Thanx, Paul

------------------------------------------------------------------------

commit 76dacd546e9e1ad1153ef5b3ef6ad0dfd9985246
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Wed Dec 6 08:07:10 2017 -0800

    future/htm: Reword sentence referencing the new Table 17.3
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/future/htm.tex b/future/htm.tex
index 6667cd0ce8f0..908166bc0768 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -920,9 +920,11 @@ A summary of the differences between the two tables is as follows:

 \input{future/HTMtableFull}

-For those who want to see the comparison at one view,
+For those with good eyesight,
 Table~\ref{tab:future:Comparison of Locking (Plain and Augmented) and HTM}
-shows the merged comparison.
+combines
+Tables~\ref{tab:future:Comparison of Locking and HTM}
+and~\ref{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}.

 Of course, it is also possible to augment HTM,
 as discussed in the next section.

