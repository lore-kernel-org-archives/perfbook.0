Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46028 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751505AbeBYSWj (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 25 Feb 2018 13:22:39 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w1PIIWuZ051926
 for <perfbook@vger.kernel.org>; Sun, 25 Feb 2018 13:22:39 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2gbp7f8b86-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 25 Feb 2018 13:22:38 -0500
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 25 Feb
 2018 13:22:38 -0500
Date: Sun, 25 Feb 2018 10:23:03 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] future/QC: Improve table layout
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e4f8413-f968-9d37-6322-8057bfe97bb7@gmail.com>
Message-Id: <20180225182303.GE2855@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 25, 2018 at 08:47:23AM +0900, Akira Yokosawa wrote:
> >From 66f9f9f82d4fef12b6d7e2a399c14fbaa758e3f8 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 25 Feb 2018 08:09:50 +0900
> Subject: [PATCH 0/5] future/QC: Improve table layout
> 
> Hi Paul,
> 
> This patch set is a response to your recent updates in QC section.
> 
> Patch #1 retouches Table 17.5
> 
> Patch #2 removes alternate-row coloring in Table 17.5, which looks
> redundant after the retouch.
> 
> Patch #3 is for consistency of spacing around unit symbols as is
> suggested in Style Guide.
> 
> Patches #4 and #5 are a word choice suggestion and a typo fix.
> 
> Patch #2 can be skipped if you'd like to keep the background color.

Much better on all counts, thank you!  Queued and pushed.

							Thanx, Paul

> --
> Akira Yokosawa (5):
>   future/QC: Improve layout of Table 17.5 by using subfloat
>   future/QC: Remove alternate-row coloring in Table 17.5
>   future/QC: Add narrow space in front of percent symbol
>   future/QC: Disambiguate 'QC power'
>   future/QC: Fix typo
> 
>  future/QC.tex | 137 +++++++++++++++++++++++++++++++---------------------------
>  perfbook.tex  |   1 +
>  2 files changed, 75 insertions(+), 63 deletions(-)
> 
> -- 
> 2.7.4
> 

