Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37560 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726231AbeLKRXm (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 11 Dec 2018 12:23:42 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wBBHDbZN004986
        for <perfbook@vger.kernel.org>; Tue, 11 Dec 2018 12:23:41 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2pagmntxqm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 11 Dec 2018 12:23:40 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 11 Dec 2018 17:23:39 -0000
Date: Tue, 11 Dec 2018 09:23:36 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/4] Update definition of cmpxchg() under CodeSamples
Reply-To: paulmck@linux.ibm.com
References: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184fed6d-f9ae-8a0b-e8e8-7bcb3e3acf8e@gmail.com>
Message-Id: <20181211172336.GK4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Wed, Dec 12, 2018 at 12:39:38AM +0900, Akira Yokosawa wrote:
> Subject: [PATCH 0/4] Update definition of cmpxchg() under CodeSamples
> 
> Hi Paul and Junchang,
> 
> Based on the earlier correspondence, I prepared a patch set to update
> the definition of cmpxchg().
> 
> Patch #1 adds a simple litmus test of cmpxchg().
> Patch #2 fix cmpxchg() in .../litmus/api.h by specifying strong
> __atomic_compare_exchange_n)\(). Results of litmus tests are presented
> in the commit log.
> Patch #3 fix cmpxchg() in .../api-gcc.h in the same manner as patch #2.

I applied and pushed #1-3, thank you!

							Thanx, Paul

> Patch #4 is not intended to be applied to master, but provides a weak
> variant of cmpxchg() and count_lim_atomic_weak.c.
> 
> I did some experiments on PPC (10 runs each).
> 
> count_lim_atomic 1 uperf, ns/update (as of v2018.12.08a):
> 56.6572
> 56.4972
> 56.5504
> 56.4972
> 56.6305
> 56.5238
> 56.6038
> 56.5238
> 56.5504
> 56.5238
> 
> count_lim_atomic 1 uperf, ns/update (as of Patch #4):
> 38.3264
> 38.1073
> 38.2287
> 38.2287
> 38.2653
> 38.3142
> 38.1194
> 38.1801
> 38.4986
> 38.2531
> 
> count_lim_atomic_weak 1 uperf, ns/update (as of Patch #4):
> 47.3186
> 47.3747
> 47.4121
> 47.5248
> 47.3934
> 47.3373
> 47.3186
> 47.4121
> 47.6002
> 47.3186
> 
> So count_lim_atomic (strong semantics) is around 9ns/update
> faster than count_lim_atomic_weak, and is around 18ns/update
> faster than count_lim_atomic of v2018.12.08a.
> 
> This contradicts Junchang's view. The difference looks like
> due to removal of ternary operation in cmpxchg().
> 
> Or I might be missing something.
> 
> Junchang, can you please experiment on PPC and ARM?
> 
>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   CodeSamples: Add C-cmpxchg.litmus
>   CodeSamples/formal/litmus/api.h: Fix definition of cmpxchg()
>   CodeSamples: Fix definition of cmpxchg() in api-gcc.h
>   [EXP] CodeSamples: Add weak variant of cmpxchg() as cmpxchg_weak()
> 
>  CodeSamples/api-pthreads/api-gcc.h         |  19 ++-
>  CodeSamples/count/Makefile                 |   4 +
>  CodeSamples/count/count_lim_atomic_weak.c  | 226 +++++++++++++++++++++++++++++
>  CodeSamples/formal/litmus/C-cmpxchg.litmus |  24 +++
>  CodeSamples/formal/litmus/api.h            |   2 +-
>  5 files changed, 272 insertions(+), 3 deletions(-)
>  create mode 100644 CodeSamples/count/count_lim_atomic_weak.c
>  create mode 100644 CodeSamples/formal/litmus/C-cmpxchg.litmus
> 
> -- 
> 2.7.4
> 

