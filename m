Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38525 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751444AbdGEPuH (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 5
 Jul 2017 11:50:07 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v65FmckP102960
 for <perfbook@vger.kernel.org>; Wed, 5 Jul 2017 11:50:06 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bgvyb94t2-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 05 Jul 2017 11:50:06 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 5 Jul 2017
 11:50:04 -0400
Date: Wed, 5 Jul 2017 08:50:04 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170705154024.GU2393@linux.vnet.ibm.com>
Message-Id: <20170705155004.GB29379@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 05, 2017 at 08:40:24AM -0700, Paul E. McKenney wrote:
> On Wed, Jul 05, 2017 at 11:22:52PM +0900, Akira Yokosawa wrote:
> > On 2017/07/04 15:21:38 -0700, Paul E. McKenney wrote:
> > > On Wed, Jul 05, 2017 at 12:23:09AM +0900, Akira Yokosawa wrote:
> > >> >From 2845eb208a6e63493997de47293a47ef774a9d49 Mon Sep 17 00:00:00 2001
> > >> From: Akira Yokosawa <akiyks@gmail.com>
> > >> Date: Tue, 4 Jul 2017 23:18:30 +0900
> > >> Subject: [PATCH] advsync: Fix store-buffering sequence table
> > >>
> > >> Row 6 of the table added in commit 2d5bf8d25a71 ("advsync: Add
> > >> memory-barriered store-buffering example") needs some context
> > >> adjustment.
> > >>
> > >> Also tweak horizontal spacing of wide tables for one-column layout.
> > >> Also add a few words to the footnote giving definition of
> > >> __atomic_thread_fence().
> > >>
> > >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > > 
> > > Good catches!  Queued and pushed.  I reworded the footnote a bit, so
> > > please let me know if I overdid it.
> > 
> > After your changes in commit 036372ac2573 ("advsync: Use gcc's C11-like
> > intrinsics to avoid data races"), this footnote seems verbose, doesn't it?
> > 
> > But, I'm not so much a fan of the changes of your commit.
> > It becomes hard to see the relation of lines in litmus tests and rows
> > in the tables. Also, those intrinsics have fairly large overheads.
> 
> They certainly are ugly, no two ways about that!  ;-)
> 
> > How about using "volatile" in thread arg declaration such as the following?
> > 
> > ---
> > C C-SB+o-o+o-o
> > {
> > }
> > 
> > P0(volatile int *x0, volatile int *x1)
> > {
> > 	int r2;
> > 
> > 	*x0 = 2;
> > 	r2 = *x1;
> > }
> > 
> > 
> > P1(volatile int *x0, volatile int *x1)
> > {
> > 	int r2;
> > 
> > 	*x1 = 2;
> > 	r2 = *x0;
> > }
> > 
> > exists (1:r2=0 /\ 0:r2=0)
> > ---
> > 
> > If all you need is to prevent memory accesses from being optimized away,
> > they should suffice. But they might be unpopular among kernel community.
> 
> To say nothing of their unpopularity among the C11 and C++11
> communities!
> 
> > I checked the generated C code in cross-compiling mode of litmus7, and
> > the volatile-ness is reflected there.
> 
> And it also works just fine without the volatile -- the litmus7 tool
> does the translation so as to avoid destructive compiler optimizations.
> 
> I am checking with the litmus7 people to see if there is any way to
> map identifiers.  Some of the other tools support a "-macros"
> command-line argument, which would allow mapping from "smp_mb()" to
> "__atomic_thread_fence(__ATOMIC_SEQ_CST)", but not litmus7.
> 
> So I cannot go with "volatile", but let's see if I can do something
> better than the gcc intrinsics.

And if the litmus7 guys don't have anything for me, I can always write a
script to do the conversions.  So either way, we will have kernel-style
notation at some point.  ;-)

							Thanx, Paul

