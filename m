Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38952 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752626AbdJLAQX (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 11 Oct 2017 20:16:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9C0DwrB012116
 for <perfbook@vger.kernel.org>; Wed, 11 Oct 2017 20:16:22 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dhs4ajsx0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 11 Oct 2017 20:16:22 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 11 Oct
 2017 20:16:22 -0400
Date: Wed, 11 Oct 2017 17:16:20 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Convert code snippets to 'listing' env (SMPdesign,
 locking, defer)
Reply-To: paulmck@linux.vnet.ibm.com
References: <a83ce6f6-cb5f-ab17-b65f-b77203ed51db@gmail.com>
 <20171011225621.GT3521@linux.vnet.ibm.com>
 <73217c9c-6c30-1cf1-735d-0fa039dd0cc0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73217c9c-6c30-1cf1-735d-0fa039dd0cc0@gmail.com>
Message-Id: <20171012001620.GV3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 12, 2017 at 08:19:42AM +0900, Akira Yokosawa wrote:
> On 2017/10/11 15:56:21 -0700, Paul E. McKenney wrote:
> > On Thu, Oct 12, 2017 at 07:07:17AM +0900, Akira Yokosawa wrote:
> >> >From 096ac85c06a27b8e8895e35bb58c634869a5a979 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Wed, 11 Oct 2017 23:04:11 +0900
> >> Subject: [PATCH] Convert code snippets to 'listing' env (SMPdesign, locking, defer)
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Very good, queued, thank you!
> > 
> > One question...
> > 
> > o	Figure 6.22: "SEQ Pseudocode" is still in the old style.
> > 	Ditto Figure 6.23: "SEQ Helper Pseudocode", Figure 6.26:
> > 	"Partitioned Parallel Solver Pseudocode", and Figure 6.27:
> > 	"Partitioned Parallel Helper Pseudocode".  Are these to be
> > 	handled by a later commit, or is there something problematic
> > 	about these figures?
> 
> Ah, I missed them. I'll take care of them in a later patch.

Sounds good!

							Thanx, Paul

>              Thanks, Akira
> > 
> > 							Thanx, Paul
> > 
> >> ---
> >>  SMPdesign/SMPdesign.tex       | 72 +++++++++++++++++------------------
> >>  SMPdesign/partexercises.tex   | 32 ++++++++--------
> >>  defer/defer.tex               |  8 ++--
> >>  defer/hazptr.tex              | 36 +++++++++---------
> >>  defer/rcuapi.tex              | 16 ++++----
> >>  defer/rcufundamental.tex      | 46 +++++++++++-----------
> >>  defer/rcuusage.tex            | 76 ++++++++++++++++++-------------------
> >>  defer/refcnt.tex              | 32 ++++++++--------
> >>  defer/seqlock.tex             | 52 ++++++++++++-------------
> >>  locking/locking-existence.tex | 20 +++++-----
> >>  locking/locking.tex           | 88 +++++++++++++++++++++----------------------
> >>  11 files changed, 239 insertions(+), 239 deletions(-)
> >>
> [...]
> 

