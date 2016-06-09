Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34145 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)	by vger.kernel.org with
 ESMTP id S1751962AbcFIQRT (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 9
 Jun 2016 12:17:19 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])	by
 mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u59GDs8F147366
 for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 12:17:19 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])	by
 mx0a-001b2d01.pphosted.com with ESMTP id 23e9m4rmbp-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Thu,
 09 Jun 2016 12:17:19 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 9 Jun 2016
 10:17:17 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id
 897371FF0055	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 10:16:59 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u59GHFaZ43253960	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 16:17:15 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u59GHEa3012912	for <perfbook@vger.kernel.org>; Thu, 9 Jun 2016 12:17:14 -0400
Date: Thu, 9 Jun 2016 09:17:19 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Follow-up patches of cleanup-makefile
Reply-To: paulmck@linux.vnet.ibm.com
References: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1642a9c-14f1-6cfe-e4f5-7d726226a952@gmail.com>
Message-Id: <20160609161719.GD3758@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jun 08, 2016 at 11:36:14PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> These are follow-up patches of the previous patch series.
> They will suppress warning messages and streamline messages displayed
> during build.
> 
> I hope you like them.

I pulled them in, but I am getting the following when I do "make clean":

Makefile:124: target `SMPdesign/DiningPhilosopher5.pdf' given more than once in the same rule.
Makefile:124: target `SMPdesign/DiningPhilosopher5TB.pdf' given more than once in the same rule.
Makefile:124: target `SMPdesign/DiningPhilosopher4part-b.pdf' given more than once in the same rule.
Makefile:124: target `SMPdesign/DiningPhilosopher5PEM.pdf' given more than once in the same rule.
Makefile:124: target `advsync/store15tred.pdf' given more than once in the same rule.

But I was getting them before these changes, so I pushed them out.

Which raises a question:  What should we be doing to test Makefile changes?

I am guessing something like this:

	git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
	cd perfbook
	make -j16
	# check output
	make distclean
	# check output
	make -j16 1c
	# check output
	make distclean
	make -j16 hb
	# check output

Is there some way of automating the checking of output?

BTW, the reason I was so quick to accept your changes last week was that
I -really- -really- like the fact that make -j now works.  This makes
building from an empty archive much nicer.  But the above errors do
underscore the need to test Makefile changes.  ;-)

							Thanx, Paul

> --- 
> The following changes since commit ca71bc6cf0bf303257b589d7edf251d627e90ce3:
> 
>   Fix typo in epigram attribution (2016-06-07 13:30:31 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git cleanup-makefile-v2
> 
> for you to fetch changes up to 35e4d20da570eab7e6ca6a59b92ab438d2efd7b2:
> 
>   Makefile: Use wildcard for .dot files (2016-06-08 23:05:39 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (3):
>       build scripts: Suppress warning messages
>       Hide sources of unused figures
>       Makefile: Use wildcard for .dot files
> 
>  Makefile                                           |  58 +++---
>  SMPdesign/lockdeq.fig                              | 219 ---------------------
>  .../MoreThanOneValue-15CPU-noresp.eps              |   0
>  .../MoreThanOneValue-15CPU-noresp.fig              |   0
>  .../rcuimpl/{ => .unused}/RCUpreemptCounters.fig   |   0
>  cartoons/{ => .unused}/patterns.fig                |   0
>  cartoons/{ => .unused}/patterns.svg                |   0
>  utilities/runfirstlatex.sh                         |   2 +-
>  utilities/runlatex.sh                              |  16 +-
>  9 files changed, 32 insertions(+), 263 deletions(-)
>  delete mode 100644 SMPdesign/lockdeq.fig
>  rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.eps (100%)
>  rename advsync/{ => .unused}/MoreThanOneValue-15CPU-noresp.fig (100%)
>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptCounters.fig (100%)
>  rename cartoons/{ => .unused}/patterns.fig (100%)
>  rename cartoons/{ => .unused}/patterns.svg (100%)
> 

