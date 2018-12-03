Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51036 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725868AbeLCRXk (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 3 Dec 2018 12:23:40 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB3HJb0B088819
        for <perfbook@vger.kernel.org>; Mon, 3 Dec 2018 12:23:35 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p583faqpd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 03 Dec 2018 12:23:35 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 3 Dec 2018 17:23:34 -0000
Date: Mon, 3 Dec 2018 09:23:32 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/6] defer: Employ new scheme for code snippets (cont.)
Reply-To: paulmck@linux.ibm.com
References: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5c96e55-3106-1580-2930-c2f5168a7a79@gmail.com>
Message-Id: <20181203172332.GL4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 04, 2018 at 12:33:32AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is a followup patch set to update remaining code snippets
> in chapter "defer".
> 
> My first thought was that patches #5 and #6 might conflict with
> upcoming updates to reflect consolidation of RCU flavors, but it
> looks like these code snippets are unlikely to be affected.
> 
> Patch #1 assumes that you intentionally presented a different
> set of hazptr API from the one used in hazptr.h.
> 
>         Thanks, Akira

Applied and pushed, thank you!

							Thanx, Paul

> --
> Akira Yokosawa (6):
>   defer: Employ new scheme for 'lst:defer:Hazard-Pointer Storage and
>     Erasure'
>   defer: Employ new scheme for snippets of route_hazptr.c
>   defer: Employ new scheme for snippet of seqlock.h
>   defer: Employ new scheme for snippets of route_seqlock.c
>   defer: Employ new scheme for snippets in rcuintro and rcufundamental
>   defer: Employ new scheme for snippets of route_rcu.c
> 
>  CodeSamples/defer/route_hazptr.c  |  50 ++--
>  CodeSamples/defer/route_rcu.c     |  75 +++---
>  CodeSamples/defer/route_seqlock.c |  56 ++--
>  CodeSamples/defer/seqlock.h       |  55 ++--
>  defer/hazptr.tex                  | 168 +++---------
>  defer/rcufundamental.tex          | 381 +++++++++++++--------------
>  defer/rcuintro.tex                |  13 +-
>  defer/rcuusage.tex                | 523 ++++++++++++++++----------------------
>  defer/seqlock.tex                 | 259 ++++++-------------
>  9 files changed, 637 insertions(+), 943 deletions(-)
> 
> -- 
> 2.7.4
> 

