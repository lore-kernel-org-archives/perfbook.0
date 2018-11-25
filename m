Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32872 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726369AbeKZDxb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 25 Nov 2018 22:53:31 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAPGwpFM005448
        for <perfbook@vger.kernel.org>; Sun, 25 Nov 2018 12:02:01 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nymuegyva-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 25 Nov 2018 12:02:01 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 25 Nov 2018 17:02:00 -0000
Date: Sun, 25 Nov 2018 09:01:59 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/3] Employ new scheme for code snippets (cont.)
Reply-To: paulmck@linux.ibm.com
References: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c49a5ed-290f-f81c-a768-b2d5d2450b43@gmail.com>
Message-Id: <20181125170159.GB4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 25, 2018 at 11:44:41PM +0900, Akira Yokosawa wrote:
> >From 4ebe85f38ed5f0e003847854b64bc8773bec8ebb Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 25 Nov 2018 23:30:16 +0900
> Subject: [PATCH 0/3] Employ new scheme (cont.)
> 
> Hi Paul,
> 
> This is a set of patches to further apply the new scheme for snippets in
> chapters "owned" and "defer". Further updates in "defer" will be submitted
> shortly.

Good stuff, applied, thank you!

I also fixed a filename typo (my fault, not yours) and expanded a bit
on the topic of mechanical reference counting.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   owned: Employ new snippet scheme
>   defer: Employ new snippet scheme for route_seq.c
>   defer: Employ new scheme for snippets of route_refcnt.c
> 
>  CodeSamples/defer/route_refcnt.c |  67 +++++++++--------
>  CodeSamples/defer/route_seq.c    |  42 +++++------
>  defer/defer.tex                  |  76 ++++----------------
>  defer/refcnt.tex                 | 152 +++++++++------------------------------
>  owned/owned.tex                  |  19 ++---
>  5 files changed, 115 insertions(+), 241 deletions(-)
> 
> -- 
> 2.7.4
> 

