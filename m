Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57937 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750737AbdHZEfL (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 26 Aug 2017 00:35:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7Q4T6NL030525
 for <perfbook@vger.kernel.org>; Sat, 26 Aug 2017 00:35:11 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2ck0y7a6yb-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 26 Aug 2017 00:35:10 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 26 Aug
 2017 00:35:10 -0400
Date: Fri, 25 Aug 2017 21:35:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <2f1687fb-136e-88e8-e678-9066be8b0448@gmail.com>
 <20170826015944.GV11320@linux.vnet.ibm.com>
 <5484c90f-e587-2df8-4243-55ffcf2c7dcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5484c90f-e587-2df8-4243-55ffcf2c7dcd@gmail.com>
Message-Id: <20170826043517.GW11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 26, 2017 at 11:47:29AM +0900, Akira Yokosawa wrote:
> On 2017/08/25 18:59:44 -0700, Paul E. McKenney wrote:
> > On Sat, Aug 26, 2017 at 09:07:33AM +0900, Akira Yokosawa wrote:
> >> >From 65f40cf041aa5506e62c25e4ab9fd63d1d34fdd7 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sat, 26 Aug 2017 08:48:01 +0900
> >> Subject: [PATCH] advsync: Fix litmus tests
> >>
> >> Adjust litmus-test syntax to be accepted by litmus7.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Hi Paul,
> >>
> >> This is my attempt to make litmus7 happy.
> >> herd7 says:
> >>
> >> --
> >> $ herd7 -conf strong.cfg C-WWC+o+o-data-o+o-addr-o.litmus 
> >> Test C-WWC+o+o-data-o+o-addr-o Allowed
> >> States 5
> >> 1:r1=x; 2:r2=u; x=x;
> >> 1:r1=x; 2:r2=x; x=a;
> >> 1:r1=x; 2:r2=x; x=x;
> >> 1:r1=z; 2:r2=u; x=x;
> >> 1:r1=z; 2:r2=z; x=x;
> >> Ok
> >> Witnesses
> >> Positive: 1 Negative: 4
> >> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
> >> Observation C-WWC+o+o-data-o+o-addr-o Sometimes 1 4
> >> Hash=262fd275af47e8ed4fba69491478bb7d
> >> --
> >>
> >> and
> >>
> >> --
> >> $ herd7 -conf strong.cfg C-WWC+o+o-r+o-addr-o.litmus 
> >> Test C-WWC+o+o-r-o+o-addr-o Allowed
> >> States 4
> >> 1:r1=x; 2:r2=u; x=x;
> >> 1:r1=x; 2:r2=x; x=a;
> >> 1:r1=z; 2:r2=u; x=x;
> >> 1:r1=z; 2:r2=z; x=x;
> >> No
> >> Witnesses
> >> Positive: 0 Negative: 4
> >> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
> >> Observation C-WWC+o+o-r-o+o-addr-o Never 0 4
> >> Hash=607040ae8eb633fee308b55be24729e1
> >> --
> >>
> >> Do these look reasonable?
> > 
> > They do, but I failed to push out a change, and thus had to hand-apply
> > them with some adjustment.  Could you please double-check them?  For
> > ease of repairing any errors, I split this into two commits.
> 
> Litmus tests as listings in memorder.tex have indentations of tabs.
> For consistency, they should be 2 white spaces.
> 
> Other than that, the change looks OK to me.

Good catch, I converted the tabs to spaces.

							Thanx, Paul

>     Thanks, Akira
> 
> > 
> > Also, I made the memory-barriers section be its own chapter.  At some
> > point I should move the litmus tests as well, but am holding off until
> > we get these corrected.
> > 
> > 							Thanx, Paul
> > 
> >>      Thanks, Akira
> >> --
> >>  .../advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus  | 22 ++++++++++---
> >>  .../advsync/herd/C-WWC+o+o-r+o-addr-o.litmus       | 24 ++++++++++----
> >>  advsync/memorybarriers.tex                         | 38 +++++++++++++++-------
> >>  3 files changed, 62 insertions(+), 22 deletions(-)
> >>
> [...]
> 

