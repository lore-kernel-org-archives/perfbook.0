Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44133 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751554AbdFIWVU (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 9
 Jun 2017 18:21:20 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v59MJGPR037443
 for <perfbook@vger.kernel.org>; Fri, 9 Jun 2017 18:21:20 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2aywws75ss-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 09 Jun 2017 18:21:19 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 9 Jun 2017
 18:21:18 -0400
Date: Fri, 9 Jun 2017 15:21:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] CodeSamples: Cleanups and Makefile updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39761e77-17b7-7e05-d47b-07b89ff9b4b4@gmail.com>
Message-Id: <20170609222115.GO3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 10, 2017 at 12:22:53AM +0900, Akira Yokosawa wrote:
> >From b31141981b13d40fbbe5d20fa339d714ecba084c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 9 Jun 2017 23:59:11 +0900
> Subject: [PATCH 0/5] CodeSamples: Cleanups and Makefile updates
> 
> Hi Paul,
> 
> Removal of gprof-helper.c and linux/list.h has become a fairly large
> patch set.
> 
> Patch 1 is simple removal.
> Patch 2 is an improvement to make the "-jN" option to propagate to
> subdirectories.
> Patch 3 removes linux/list.h, with refactoring of recipes.
> Patch 4 adds subdirectories that can be built by "make" in the
> CodeSamples/ directory.
> Patch 5 improves build behavior for unsupported architectures.
> You can test the behavior by overriding "arch" variable by defining
> it as an environment variable, e.g.:
>     $ export arch=unsupported
>     $ make clean; make
> After the test,
>     $ unset arch
> will restore the normal behavior.
> 
> Thoughts?

Seems to work, applied and pushed, thank you!

							Thanx, Paul

>             Thanks, Akira
> --
> 
> Akira Yokosawa (5):
>   CodeSamples: Remove gprof-helper.c
>   CodeSamples: Use $(MAKE) for recursive make
>   CodeSamples: Makefile: Remove linux/list.h
>   CodeSamples: Makefile: Add subdirectories
>   CodeSamples: Makefile: Distinguish arch-independent targets
> 
>  CodeSamples/.gitignore                   |   1 -
>  CodeSamples/Makefile                     | 125 +-----
>  CodeSamples/SMPdesign/Makefile           |  19 +-
>  CodeSamples/advsync/Makefile             |  11 +-
>  CodeSamples/count/Makefile               |  11 +-
>  CodeSamples/datastruct/Issaquah/Makefile |  11 +-
>  CodeSamples/datastruct/hash/Makefile     |  11 +-
>  CodeSamples/datastruct/log/Makefile      |  11 +-
>  CodeSamples/datastruct/skiplist/Makefile |  11 +-
>  CodeSamples/defer/Makefile               |  18 +-
>  CodeSamples/depends.mk                   |  14 +-
>  CodeSamples/gprof-helper.c               | 118 ------
>  CodeSamples/intro/Makefile               |  15 +-
>  CodeSamples/linux/list.h                 | 700 -------------------------------
>  CodeSamples/locking/Makefile             |  15 +-
>  CodeSamples/recipes.mk                   |  10 +
>  CodeSamples/toolsoftrade/Makefile        |   1 +
>  17 files changed, 139 insertions(+), 963 deletions(-)
>  delete mode 100644 CodeSamples/gprof-helper.c
>  delete mode 100644 CodeSamples/linux/list.h
>  create mode 100644 CodeSamples/recipes.mk
> 
> -- 
> 2.7.4
> 

