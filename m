Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36362 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751689AbdFTR17 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 20 Jun 2017 13:27:59 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5KHON5I019791
 for <perfbook@vger.kernel.org>; Tue, 20 Jun 2017 13:27:59 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2b6mk49ws0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 20 Jun 2017 13:27:58 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 20 Jun
 2017 13:27:58 -0400
Date: Tue, 20 Jun 2017 10:27:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] toyrcu: Misc. fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
Message-Id: <20170620172756.GJ3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 20, 2017 at 11:26:30PM +0900, Akira Yokosawa wrote:
> >From 2d0d9c606bf94a9c993f84fb8b5087de6c00b212 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 20 Jun 2017 23:17:56 +0900
> Subject: [PATCH 0/3] toyrcu: Misc. fixes
> 
> Hi Paul,
> 
> While I was preparing patches related to unit symbol usage, I noticed
> a few issues in toyrcu section.
> 
> Patch 1 is trivial.
> Patch 2 seems also trivial, as long as my understanding is correct.
> Patch 3 is a follow-up patch to the previous patch set.

Queued and pushed, good catches, thank you!

							Thanx, Paul

>                   Thanks, Akira
> -- 
> Akira Yokosawa (3):
>   toyrcu: Adjust reference to prerequisite chapters
>   toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
>   future/QC: Another math mode fix
> 
>  appendix/toyrcu/toyrcu.tex | 17 ++++++++---------
>  future/QC.tex              |  2 +-
>  2 files changed, 9 insertions(+), 10 deletions(-)
> 
> -- 
> 2.7.4
> 
> 

