Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37073 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751462AbdCYSn4 (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 25 Mar 2017 14:43:56 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2PIhsef100357
 for <perfbook@vger.kernel.org>; Sat, 25 Mar 2017 14:43:55 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 29dn2s6pw4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 25 Mar 2017 14:43:55 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 25 Mar
 2017 14:43:54 -0400
Date: Sat, 25 Mar 2017 11:43:51 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 0/7] Import 'TRANSITIVITY' section
Reply-To: paulmck@linux.vnet.ibm.com
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Message-Id: <20170325184351.GR3637@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 25, 2017 at 06:33:55PM +0900, Akira Yokosawa wrote:
> >From 461f7d8b71f955c17ce30585b301834c3ad4026b Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 25 Mar 2017 17:54:01 +0900
> Subject: [RFC PATCH 0/7] Import 'TRANSITIVITY' section
> 
> Hi Paul,
> 
> As has been being discussed off the list, I'm attempting to update
> "Memory Barriers" section to catch up memory-barriers.txt.
> 
> This patch set imports "TRANSITIVITY" section and do some tweaks
> for better LaTeX typesetting.
> 
> Patch 1 imports the section mostly as is.
> Patch 5 diverts from current memory-barriers.txt in the way to
> present code snippets.
> Patches 2 and 7 are updates for issues in previous sections I noticed
> while doing this work.
> 
> Although we need further updates, especially to replace "LOCK/UNLOCK"
> with "ACQUIRE/RELEASE" to go along with changes in memory-barriers.txt,
> this patch set seems worthy on its own.

Queued and pushed, thank you!

							Thanx, Paul

> Thoughts?
>                                   Thanks, Akira
> --
> 
> Akira Yokosawa (7):
>   advsync: Import 'TRANSITIVITY' section from memory-barriers.txt
>   advsync: Permit p (page) placement for consecutive wide figures
>   advsync: Make code snippet in deference to Herman Hollerith float
>   advsync: Add footnote on transitivity
>   advsync: Make code snippets more asm like
>   advsync: Properly use nbsp in initial values
>   advsync: Avoid indent after minipage
> 
>  advsync/memorybarriers.tex | 207 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 195 insertions(+), 12 deletions(-)
> 
> -- 
> 2.7.4
> 

