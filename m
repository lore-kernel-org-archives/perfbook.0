Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51846 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751262AbdHEPu2 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 5 Aug 2017 11:50:28 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v75Fmvrh119410
 for <perfbook@vger.kernel.org>; Sat, 5 Aug 2017 11:50:27 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2c5a773uvh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 05 Aug 2017 11:50:27 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 5 Aug 2017
 11:50:26 -0400
Date: Sat, 5 Aug 2017 08:50:24 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Employ auto-numbering in litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
 <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
 <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
 <20170805150913.GJ3730@linux.vnet.ibm.com>
 <a69ac710-6be5-0969-c092-8008a6dd764d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a69ac710-6be5-0969-c092-8008a6dd764d@gmail.com>
Message-Id: <20170805155024.GL3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 06, 2017 at 12:35:36AM +0900, Akira Yokosawa wrote:
> On 2017/08/06 0:09, Paul E. McKenney wrote:
> > On Sat, Aug 05, 2017 at 12:41:30PM +0900, Akira Yokosawa wrote:
> >> >From ba0af5ad755ab4e175b07abb71890077e4d54a20 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Sat, 5 Aug 2017 12:29:10 +0900
> >> Subject: [PATCH 0/3] Employ auto-numbering in litmus tests
> >>
> >> Hi Paul,
> >>
> >> As I mentioned earlier, we need to revert commits related to floatrow.
> >> Patch #1 does the revert.
> >> Patch #2 converts litmus tests in Memory Barriers section to use
> >> auto-numbering.
> >> Patch #3 updates style guide to reflect the removal of floatrow and
> >> a typo fix. 
> >>
> >> I'm considering "subfig" package as an alternative to floatrow.
> >> It predates floatrow and has less capability.
> >> I'll see if it works in two-column layout, and update the style guide
> >> if it goes well.
> > 
> > Life is like that sometimes.  ;-)
> > 
> > Applied, thank you!  I did a couple of updates on 3/3 for "nor" and
> > for subject-verb agreement.
> 
> Thanks!
> It is hard for me to choose "and" or "nor" in negative sentences...
> So, "such as x, y, and z" is right in the negative sentence. Hmm.

Well, what is there is OK.  In more ambiguous cases, one approach is
to parenthesize the list, or to reverse the order: "these options,
which include x, y, and z, do not have capability c."

> Uh-oh, in the commit log, the line "Also fix a typo (and -> nor)." remains.

Good point, fixed.

> > Do we want to "git rm" floatrowpf.sty?
> 
> I think it has been already removed by the reverting commit d03363ff3493,
> hasn't it?

My confusion, ran "git diff" backwards, apologies!

							Thanx, Paul

>     Thanks, Akira
> 
> 
> > 
> > 							Thanx, Paul
> > 
> >>       Thanks, Akira 
> >>
> >> Akira Yokosawa (3):
> >>   Revert commits after "Localize floatrow.sty as floatrowpf.sty"
> >>   advsync: Employ auto-numbering in litmus tests
> >>   styleguide: Remove references to 'floatrow' and adjust context
> >>
> >>  advsync/memorybarriers.tex         |  502 ++++++------
> >>  appendix/styleguide/hello.c        |    9 -
> >>  appendix/styleguide/styleguide.tex |  205 +----
> >>  defer/rcuusage.tex                 |    6 +-
> >>  floatrowpf.sty                     | 1482 ------------------------------------
> >>  howto/howto.tex                    |    4 +-
> >>  perfbook.tex                       |    4 +-
> >>  7 files changed, 280 insertions(+), 1932 deletions(-)
> >>  delete mode 100644 appendix/styleguide/hello.c
> >>  delete mode 100644 floatrowpf.sty
> >>
> >> -- 
> >> 2.7.4
> >>
> >>
> > 
> > 
> 

