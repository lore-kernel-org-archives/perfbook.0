Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47295 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750991AbdFCUUc (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 3
 Jun 2017 16:20:32 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v53KIx3I022495
 for <perfbook@vger.kernel.org>; Sat, 3 Jun 2017 16:20:31 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2auv443tun-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 03 Jun 2017 16:20:31 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 3 Jun 2017
 16:20:30 -0400
Date: Sat, 3 Jun 2017 13:20:28 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] CodeSamples: Fixes for ppc64
Reply-To: paulmck@linux.vnet.ibm.com
References: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
Message-Id: <20170603202028.GJ3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 03, 2017 at 04:01:39PM +0900, Akira Yokosawa wrote:
> >From 7c151a100ef7d6c30259a966c68c45421edd7707 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 3 Jun 2017 13:32:49 +0900
> Subject: [PATCH 0/2] CodeSamples: Fixes for ppc64
> 
> Hi Paul,
> 
> With the help of you, I now have an access to a ppc64 instance on
> OSU Open Source Lab.
> 
> I tried to build under CodeSamples/ there.
> But I needed to fix dependency rules I updated recently.
> Also, script for ppc64 in Makefile failed to copy
> api-pthreads/api-gcc.h to api.h.
> Patch 1 fixes them.
> 
> Patch 2 removes GCC flags specific to POWER5, and update links
> to pages with regard to optimization for POWER.
> 
> And there are a few things I want to confirm regarding CodeSamples.
> 
> (1) Is libucru a must now?
> 
> If it is the case, we should remove "else" blocks in Makefile
> which copu linux/list.h to api.h.

These were put in place because old versions of liburcu didn't support
lists.  I would guess that there still are some distros using those
old versions, but if not, then you are right that there would be no
point in keeping the "else" blocks.

> (2) Is little endian assuemed?
> 
> You suggested to choose ppc64le for the instance on OSU Open Source Lab.
> Is there any code that doesn't work on big-endian platform?

Things should work on both big-endian and on little-endian.  But
Power is slowly shifting from big-endian to little-endian, so I
figured we should look to the future rather than the past.

Hmmm...  Do you have access to some big-endian Linux system?  Maybe
a SPARC or some such?

> (3) Can we remove gprof-helper.c?
> 
> Although I fixed the entry in .gitignore the other day, gprof-helper.c
> lives in the repository from the beginning. Can we get rid of it?

It was necessary long ago, but it has been one long time since I used
gprof.  I tend to use perf instead.  So no objection here to removing it.

>             Thanks, Akira
> -- 
> Akira Yokosawa (2):
>   CodeSamples: Fixes for build on ppc64le
>   CodeSamples: Remove cpu specific flag for ppc64

Queued and pushed, thank you!

							Thanx, Paul

>  CodeSamples/Makefile                 | 2 ++
>  CodeSamples/arch-ppc64/Makefile.arch | 7 +++++--
>  CodeSamples/depends.mk               | 2 ++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> -- 
> 2.7.4
> 

