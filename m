Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50656 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750844AbdE3AC4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 29 May 2017 20:02:56 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4TNwZCv035636
 for <perfbook@vger.kernel.org>; Mon, 29 May 2017 20:02:56 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2arvera994-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 29 May 2017 20:02:55 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 29 May
 2017 20:02:55 -0400
Date: Mon, 29 May 2017 17:02:55 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Message-Id: <20170530000255.GQ3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2017 at 07:13:23AM +0900, Akira Yokosawa wrote:
> >From fd5fb9afb6b99b15370a9823b42fa2a92342b92a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 30 May 2017 06:52:40 +0900
> Subject: [RFC PATCH 0/4] CodeSamples: Cleanups and fixes
> 
> Hi Paul,
> 
> While I was looking around CodeSamples, I encountered several
> warnings in build and an infinite loop in one of sample codes.
> Also, I found that CodeSamples/api.h and CodeSamples/Makefile.arch
> can be removed from repository if their recipe are properly
> written in Makefiles.
> 
> Patch 1 adds rules to generate Makefile.arch and api.h that
> suit the architecture of you host. As I don't have ppc64 or
> arm host environment, I tested it only on x86_32 and x86_64.
> I'd like to know if it works on ppc64 and arm.
> 
> Patch 2 removes the redundant files.

I took the first two, and it is nice to just be able to type "make"
in the CodeSamples directory!  ;-)

> Patch 3 and 4 are fixes of warnings and infinite loops.

I have some concerns here, and will reply to the patches.

								Thanx, Paul

> Thoughts?
> 
>                  Thanks, Akira
> -- 
> Akira Yokosawa (4):
>   CodeSamples: Add rule to generate Makefile.arch and api.h
>   CodeSamples: Remove generated files from repository
>   CodeSamples: Use 'intptr_t' to be compatible with 'void *'
>   CodeSamples/defer: Add compiler barriers in gettimestampmp.c
> 
>  CodeSamples/.gitignore                         |   4 +-
>  CodeSamples/Makefile                           |  18 +
>  CodeSamples/Makefile.arch                      |   6 -
>  CodeSamples/SMPdesign/Makefile                 |   3 +
>  CodeSamples/SMPdesign/matmul.c                 |  13 +-
>  CodeSamples/SMPdesign/smpalloc.c               |  11 +-
>  CodeSamples/advsync/Makefile                   |   3 +
>  CodeSamples/api.h                              | 808 -------------------------
>  CodeSamples/count/Makefile                     |   3 +
>  CodeSamples/datastruct/Issaquah/Makefile       |   3 +
>  CodeSamples/datastruct/Issaquah/existence_test | Bin 26359 -> 0 bytes
>  CodeSamples/datastruct/hash/Makefile           |   3 +
>  CodeSamples/datastruct/log/Makefile            |   3 +
>  CodeSamples/datastruct/skiplist/Makefile       |   3 +
>  CodeSamples/defer/Makefile                     |   3 +
>  CodeSamples/defer/gettimestampmp.c             |   5 +-
>  CodeSamples/depends.mk                         |  43 ++
>  CodeSamples/intro/Makefile                     |   3 +
>  CodeSamples/intro/threadcreate.c               |   7 +-
>  CodeSamples/locking/Makefile                   |   3 +
>  CodeSamples/toolsoftrade/Makefile              |   3 +
>  21 files changed, 117 insertions(+), 831 deletions(-)
>  delete mode 100644 CodeSamples/Makefile.arch
>  delete mode 100644 CodeSamples/api.h
>  delete mode 100755 CodeSamples/datastruct/Issaquah/existence_test
>  create mode 100644 CodeSamples/depends.mk
> 
> -- 
> 2.7.4
> 

