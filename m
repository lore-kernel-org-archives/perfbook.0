Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34808 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932322AbdGKSw2 (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 11
 Jul 2017 14:52:28 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v6BImbpU135388
 for <perfbook@vger.kernel.org>; Tue, 11 Jul 2017 14:52:27 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bn0mv2dh3-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 11 Jul 2017 14:52:27 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 11 Jul
 2017 14:52:26 -0400
Date: Tue, 11 Jul 2017 11:52:22 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] CodeSamples: Add arm64 support
Reply-To: paulmck@linux.vnet.ibm.com
References: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
Message-Id: <20170711185222.GT2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jul 12, 2017 at 12:30:04AM +0900, Akira Yokosawa wrote:
> >From 1908602500df34619ec496c787546d5584d01221 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 12 Jul 2017 00:01:30 +0900
> Subject: [PATCH 0/2] CodeSamples: Add arm64 support
> 
> Hi Paul,
> 
> So, this patch set adds arm64 support for CodeSamples.
> 
> Patch 1 is a followup of the previous patch set. I missed the dependency
> to the custom header file.
> Patch 2 is the addition of arm64 support. It is based on arm support files.
> I appended an "ish" operand to "dmb" in the definition of smp_mp().
> Looks like the same change is necessary in arch-arm/arch-arm.h, but this
> patch doesn't touch it.
> Also, I rewrote the definition of get_timestamp() by using clock_gettime()
> instead of gettimeofday(). For arm64 host, we can expect clock_gettime()
> is supported.
> In Makefile.arch, I chose the flags -mcpu=native and -mtune=native, since
> this Makefile is intended for native build.
> This is compile tested on an ARMv8 host. I didn't have enough time to
> run all the programs. I tested a few under count/ and defer/ sub-directories.

I queued and pushed these, thank you!  If bugs appear, we will fix them.

							Thanx, Paul

>         Thanks. Akira
> --
> Akira Yokosawa (2):
>   advsync: Add dependency to $(CUSTOM_HEADER)
>   CodeSamples: Add arm64 support
> 
>  CodeSamples/advsync/herd/Makefile    |  2 +-
>  CodeSamples/arch-arm64/Makefile.arch |  2 ++
>  CodeSamples/arch-arm64/arch-arm64.h  | 61 ++++++++++++++++++++++++++++++++++++
>  CodeSamples/depends.mk               |  5 +++
>  4 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 CodeSamples/arch-arm64/Makefile.arch
>  create mode 100644 CodeSamples/arch-arm64/arch-arm64.h
> 
> -- 
> 2.7.4
> 

