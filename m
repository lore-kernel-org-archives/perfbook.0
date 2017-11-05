Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35906 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750857AbdKEVVl (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 5 Nov 2017 16:21:41 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA5LIrEt005309
 for <perfbook@vger.kernel.org>; Sun, 5 Nov 2017 16:21:40 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e26e0exs8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 05 Nov 2017 16:21:40 -0500
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 5 Nov 2017
 16:21:39 -0500
Date: Sun, 5 Nov 2017 10:13:55 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] Fix layout hiccup and typo in QQA
Reply-To: paulmck@linux.vnet.ibm.com
References: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Message-Id: <20171105181355.GX3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 05, 2017 at 11:47:33PM +0900, Akira Yokosawa wrote:
> >From 7902d9405a7e92aef281297af179c0696bc389b8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 5 Nov 2017 23:33:03 +0900
> Subject: [PATCH 0/4] Fix layout hiccup and typo in QQA
> 
> Hi Paul,
> 
> There remain several hiccups and typos in Answers to Quick Quizzes.
> This patch set fixes them.
> 
> Patch #1 is actually a regression fix of my own. When I put
> a thin space before the "%", I removed the escape by accident.
> Patch #2 improves the layout of one-liner.
> Patch #3 fixes remaining hiccups in QQA of whymb.
> Patch #4 fixes other trivial typos.

Good eyes, applied, thank you!  I am currently on a plane, so there may
be some delay before these appear in the public perfbook repository.

							Thanx, Paul

>       Thanks, Akira
> --
> Akira Yokosawa (4):
>   formal/regression: Restore escape to '%' symbol
>   defer/seqlock: Use minipage and verbatim for one-liner in QQA
>   appendix/whymb: Fix layout in answers to quick quizzes
>   Fix typos in answers to quick quizzes
> 
>  appendix/toyrcu/toyrcu.tex           |  2 +-
>  appendix/whymb/whymemorybarriers.tex |  4 ++--
>  defer/seqlock.tex                    | 10 ++++++++--
>  formal/regression.tex                |  2 +-
>  memorder/memorder.tex                |  6 +++---
>  toolsoftrade/toolsoftrade.tex        |  2 +-
>  6 files changed, 16 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 

