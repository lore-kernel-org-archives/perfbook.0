Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39584 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751399AbdJ0DDf (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 26 Oct 2017 23:03:35 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9R2xSDS141829
 for <perfbook@vger.kernel.org>; Thu, 26 Oct 2017 23:03:35 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2duqcdcwuu-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 26 Oct 2017 23:03:35 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 26 Oct
 2017 23:03:34 -0400
Date: Thu, 26 Oct 2017 20:03:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/5] Miscellaneous updates
Reply-To: paulmck@linux.vnet.ibm.com
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Message-Id: <20171027030330.GD3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Oct 27, 2017 at 07:49:47AM +0900, Akira Yokosawa wrote:
> >From 263fa8f220207903d6c41bddb773b113b65dd98f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 27 Oct 2017 07:23:35 +0900
> Subject: [PATCH 0/5] Miscellaneous updates
> 
> Hi Paul,
> 
> This patch set is a collection of small fixes and tweaks.
> 
> Patchs #1 -- #4 are trivial fixes
> Patch #5 shrinks/enlarges figures which were too large/small.
> (I like those penguin cartoons, but ...) ;-)
> 
>          Thanks, Akira

;-)

Applied and pushed, thank you!

							Thanx, Paul

> --
> Akira Yokosawa (5):
>   memorder: Fix excessive uses of skips in midrule
>   memorder: Parenthesize properly
>   defer/rcufundamental: Adjust hspace for 1c layout
>   together/applyrcu: Use upright gryph for descriptive suffix
>   Tweak figure size
> 
>  SMPdesign/SMPdesign.tex     | 14 +++++++-------
>  advsync/rt.tex              | 12 ++++++------
>  appendix/questions/time.tex |  2 +-
>  count/count.tex             |  4 ++--
>  defer/rcufundamental.tex    |  4 ++--
>  future/QC.tex               |  2 +-
>  future/cpu.tex              |  4 ++--
>  future/tm.tex               |  4 ++--
>  intro/intro.tex             |  2 +-
>  memorder/memorder.tex       | 10 +++++-----
>  together/applyrcu.tex       |  8 ++++----
>  11 files changed, 33 insertions(+), 33 deletions(-)
> 
> -- 
> 2.7.4
> 

