Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48070 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726385AbeLDQkG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 4 Dec 2018 11:40:06 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB4GYDa3052238
        for <perfbook@vger.kernel.org>; Tue, 4 Dec 2018 11:40:05 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p5ubqemcn-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 04 Dec 2018 11:40:05 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 4 Dec 2018 16:40:02 -0000
Date: Tue, 4 Dec 2018 08:40:00 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/4] Misc updates
Reply-To: paulmck@linux.ibm.com
References: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
Message-Id: <20181204164000.GY4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 05, 2018 at 12:27:34AM +0900, Akira Yokosawa wrote:
> >From 5471262067bf42e8698c80fee3e1d42a8c576d43 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 5 Dec 2018 00:10:12 +0900
> Subject: [PATCH 0/4] Misc updates
> 
> Hi Paul,
> 
> As I reported this September, Figure 5.1 is not complete yet.
> As a workaround, patches #1 and #2 restores the old plot of
> Nehalem for Figure 5.1.  Once we can obtain complete data,
> it should be easy to update again.
> 
> Patch #3 is a minor tweak in RCU code snippets to prevent
> short code snippets from being page/column broken.
> 
> Patch #4 fixes a typo in an epigraph you've added recently.
> 
> Hopefully, this would be a final patch set from me for the
> upcoming release.

Applied and pushed, thank you!  And good point, and same for me -- no
more commits authored by me (except for minor fixes) until the release.
Of course, I also welcome minor fixes from others.  Large changes are
also still welcome, but I will instead add them to a branch to be merged
afterthe release.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   CodeSamples/count: Restore atomic125.eps
>   count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'
>   defer: Prevent page/column break in short inline code snippets
>   owned: Fix typo in epigraph
> 
>  CodeSamples/count/atomic125.eps      |  856 +++++++------
>  CodeSamples/count/atomic125.png      |  Bin 3189 -> 3337 bytes
>  CodeSamples/count/atomic_nehalem.eps | 2266 ++++++++++++++++++++++++++++++++++
>  count/count.tex                      |   14 +-
>  defer/rcufundamental.tex             |   14 +-
>  defer/rcuintro.tex                   |    4 +-
>  locking/locking.tex                  |    2 +-
>  owned/owned.tex                      |    2 +-
>  8 files changed, 2770 insertions(+), 388 deletions(-)
>  create mode 100644 CodeSamples/count/atomic_nehalem.eps
> 
> -- 
> 2.7.4
> 

