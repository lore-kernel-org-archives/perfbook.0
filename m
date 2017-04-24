Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42873 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1164245AbdDXCue (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 23 Apr 2017 22:50:34 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v3O2mnM3141185
 for <perfbook@vger.kernel.org>; Sun, 23 Apr 2017 22:50:33 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2a0ajcfn0h-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 23 Apr 2017 22:50:33 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 23 Apr
 2017 22:50:32 -0400
Date: Sun, 23 Apr 2017 19:50:32 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] whymb: Prevent line breaks of memory-barrier
 instruction
Reply-To: paulmck@linux.vnet.ibm.com
References: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Message-Id: <20170424025032.GW3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 24, 2017 at 08:51:46AM +0900, Akira Yokosawa wrote:
> >From 343ea80f45c224bf2ecb4bcb84bdc924e8b9cb80 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 24 Apr 2017 07:23:27 +0900
> Subject: [PATCH 0/4] whymb: Prevent line breaks of memory-barrier instruction
> 
> Hi Paul,
> 
> I wanted to prevent line breaks of memory-barrier instructions of
> SPARC and zSeries.
> However, simply using \nbco{} for them ended up in build error.
> It turned out \detokenize{} command used in \nbco{} can't hold
> "#" character.
> Patch #1 modifies the definition of \nbco{}.
> Also, those instructions are easier to recognize with quotation
> marks. Instead of writing quotation marks around each instruction,
> patch #1 also adds a macro named \qco{}.
> Patches 2 and 3 use \qco{} for memory-barrier instructions of
> SPARC and zSeries, respectively.
> Patch 4 is to prevent hyphenation of "GPGPU".
> 
> Note that \tco{} macro still can't hold "#" character.

Queued and pushed, thank you!

							Thanx, Paul

>                                     Thanks, Akira
> --
> Akira Yokosawa (4):
>   perfbook.tex: Modify definition of \nbco{}
>   whymb: Prevent line breaks between 'membar' and '#Sync', etc.
>   whymb: Prevent line breaks between "bcr" and "15,0"
>   Add 'GPGPU' to non-hyphenation list
> 
>  Makefile                             |  1 +
>  appendix/whymb/whymemorybarriers.tex | 26 +++++++++++++-------------
>  perfbook.tex                         |  3 ++-
>  pfhyphex.tex                         |  2 ++
>  4 files changed, 18 insertions(+), 14 deletions(-)
> 
> -- 
> 2.7.4
> 

