Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60772 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S934067AbdEWAjx (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 22
 May 2017 20:39:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4N0dc9C088283
 for <perfbook@vger.kernel.org>; Mon, 22 May 2017 20:39:53 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2am8pckm80-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 22 May 2017 20:39:53 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 22 May
 2017 20:39:52 -0400
Date: Mon, 22 May 2017 17:39:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] Update code snippets
Reply-To: paulmck@linux.vnet.ibm.com
References: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
Message-Id: <20170523003949.GT3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 23, 2017 at 12:10:07AM +0900, Akira Yokosawa wrote:
> >From edbd0adf8aafef3704b9059ae484ee44f2aa308e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 23 May 2017 00:01:27 +0900
> Subject: [PATCH 0/2] Update code snippets
> 
> Hi Paul,
> 
> These are follow-up patches regarding recent updates in
> CodeSamples/count/count_stat_eventual.c.

Applied and pushed, thank you!

							Thanx, Paul

>             Thanks, Akira
> --
> Akira Yokosawa (2):
>   toolsoftrade: Update definition of READ_ONCE()
>   count: Remove unnecessay smp_mb() in code snippet
> 
>  count/count.tex               | 11 +++++------
>  toolsoftrade/toolsoftrade.tex |  3 ++-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> -- 
> 2.7.4
> 

