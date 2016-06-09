Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55650 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1751118AbcFIXH4 (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Thu, 9 Jun 2016 19:07:56 -0400
Received: from pps.filterd (m0075420.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u59N3gUo001998
 for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 19:07:56 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 23fcme67kq-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 09 Jun 2016 19:07:55 -0400
Received: from localhost	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 9 Jun 2016
 17:07:55 -0600
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 CA48F19D803F	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 17:07:32 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u59N7qOl40894496	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 23:07:52 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u59N7qIk014230	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 19:07:52 -0400
Date: Thu, 9 Jun 2016 16:07:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Follow-up patches of cleanup-makefile
Reply-To: paulmck@linux.vnet.ibm.com
References: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
 <20160609161719.GD3758@linux.vnet.ibm.com>
 <1b014e28-b9f0-4b0d-8c29-f0a04c0a39f5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b014e28-b9f0-4b0d-8c29-f0a04c0a39f5@gmail.com>
Message-Id: <20160609230756.GK3758@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 10, 2016 at 07:09:29AM +0900, Akira Yokosawa wrote:
> On 2016/06/10 1:17, Paul E. McKenney wrote:
> > On Wed, Jun 08, 2016 at 11:36:14PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> These are follow-up patches of the previous patch series.
> >> They will suppress warning messages and streamline messages displayed
> >> during build.
> >>
> >> I hope you like them.
> > 
> > I pulled them in, but I am getting the following when I do "make clean":
> > 
> > Makefile:124: target `SMPdesign/DiningPhilosopher5.pdf' given more than once in the same rule.
> > Makefile:124: target `SMPdesign/DiningPhilosopher5TB.pdf' given more than once in the same rule.
> > Makefile:124: target `SMPdesign/DiningPhilosopher4part-b.pdf' given more than once in the same rule.
> > Makefile:124: target `SMPdesign/DiningPhilosopher5PEM.pdf' given more than once in the same rule.
> > Makefile:124: target `advsync/store15tred.pdf' given more than once in the same rule.
> 
> I can't reproduce these warnings.
> I tested with GNU Make 4.1 and GNU Make 3.81 on Ubuntu 16.04, Ubuntu 14.04 and Ubuntu 12.04.
> 
> Which version of make are you using?

$ make -v
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu

> > But I was getting them before these changes, so I pushed them out.
> > 
> > Which raises a question:  What should we be doing to test Makefile changes?
> > 
> > I am guessing something like this:
> > 
> > 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
> > 	cd perfbook
> > 	make -j16
> > 	# check output
> > 	make distclean
> > 	# check output
> > 	make -j16 1c
> > 	# check output
> > 	make distclean
> > 	make -j16 hb
> > 	# check output
> > 
> > Is there some way of automating the checking of output?
> 
> Well, the output should depend on the environment.
> Automating the checking would be not so simple...

No argument here, but I was hoping...

> > BTW, the reason I was so quick to accept your changes last week was that
> > I -really- -really- like the fact that make -j now works.  This makes
> > building from an empty archive much nicer.  But the above errors do
> > underscore the need to test Makefile changes.  ;-)
> 
> Yes. In the past cleanup of build scripts, I made several regressions.
> 
> Or should we introduce 'configure' approach to check the existence and
> versions of necessary tools?

Let's see what the actual bug really is before settling on any particular
solution.  ;-)

							Thanx, Paul

> >> --- 
> >> The following changes since commit ca71bc6cf0bf303257b589d7edf251d627e90ce3:
> >>
> >>   Fix typo in epigram attribution (2016-06-07 13:30:31 -0700)
> >>
> >> are available in the git repository at:
> >>
> >>   https://github.com/akiyks/perfbook.git cleanup-makefile-v2
> >>
> >> for you to fetch changes up to 35e4d20da570eab7e6ca6a59b92ab438d2efd7b2:
> >>
> >>   Makefile: Use wildcard for .dot files (2016-06-08 23:05:39 +0900)
> >>
> >> ----------------------------------------------------------------
> >> Akira Yokosawa (3):
> >>       build scripts: Suppress warning messages
> >>       Hide sources of unused figures
> >>       Makefile: Use wildcard for .dot files
> >>
> >>  Makefile                                           |  58 +++---
> >>  SMPdesign/lockdeq.fig                              | 219 ---------------------
> >>  .../MoreThanOneValue-15CPU-noresp.eps              |   0
> >>  .../MoreThanOneValue-15CPU-noresp.fig              |   0
> >>  .../rcuimpl/{ => .unused}/RCUpreemptCounters.fig   |   0
> >>  cartoons/{ => .unused}/patterns.fig                |   0
> >>  cartoons/{ => .unused}/patterns.svg                |   0
> >>  utilities/runfirstlatex.sh                         |   2 +-
> >>  utilities/runlatex.sh                              |  16 +-
> >>  9 files changed, 32 insertions(+), 263 deletions(-)
> >>  delete mode 100644 SMPdesign/lockdeq.fig
> >>  rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.eps (100%)
> >>  rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.fig (100%)
> >>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptCounters.fig (100%)
> >>  rename cartoons/{ => .unused}/patterns.fig (100%)
> >>  rename cartoons/{ => .unused}/patterns.svg (100%)
> >>
> > 
> > 
> 

