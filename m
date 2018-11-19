Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19511 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406681AbeKTDgz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 19 Nov 2018 22:36:55 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAJH9Sb1036972
        for <perfbook@vger.kernel.org>; Mon, 19 Nov 2018 12:12:35 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nv0pq274m-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 19 Nov 2018 12:12:35 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 19 Nov 2018 17:12:33 -0000
Date: Mon, 19 Nov 2018 09:12:31 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/3] locking: Update code snippets
Reply-To: paulmck@linux.ibm.com
References: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d29326-1695-4b98-48a7-ff9c1439f448@gmail.com>
Message-Id: <20181119171231.GI4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 20, 2018 at 12:15:49AM +0900, Akira Yokosawa wrote:
> >From 0d7e7b86bf743ee1646b705f246bc50e38d23803 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 20 Nov 2018 00:03:43 +0900
> Subject: [PATCH 0/3] locking: Update code snippets
> 
> Hi Paul,
> 
> This is another set of patches to apply new code-snippet scheme in
> Chapter 7.
> 
> Patch #1 does the simple substitutions.
> 
> Patch #2 replaces remaining ACCESS_ONCE()s in Chapter 7 and
> CodeSamples/locking. It also adds a couple of READ_ONCE() and
> WRITE_ONCE() in xchglock.c.
> 
> Patch #3 fixes the use of "figure" referencing code snippets.

Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   locking: Employ new snippet scheme
>   locking: Get rid of ACCESS_ONCE()
>   locking: Fix reference to code snippet by "figure"
> 
>  CodeSamples/locking/locked_list.c |  29 ++-
>  CodeSamples/locking/xchglock.c    |  32 +--
>  locking/locking-existence.tex     | 108 ++++-----
>  locking/locking.tex               | 473 +++++++++++++++++---------------------
>  4 files changed, 299 insertions(+), 343 deletions(-)
> 
> -- 
> 2.7.4
> 

