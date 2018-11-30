Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49436 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726393AbeK3LaH (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 30 Nov 2018 06:30:07 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAU0Ixmi037065
        for <perfbook@vger.kernel.org>; Thu, 29 Nov 2018 19:22:45 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p2r4uwd31-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Thu, 29 Nov 2018 19:22:45 -0500
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 30 Nov 2018 00:22:44 -0000
Date: Thu, 29 Nov 2018 16:22:40 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 0/4] Update snippets of litmus tests
Reply-To: paulmck@linux.ibm.com
References: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Message-Id: <20181130002240.GP4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 30, 2018 at 07:10:15AM +0900, Akira Yokosawa wrote:
> >From f07d05ca837a57e07f7a87bcbac2bf034905adab Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 30 Nov 2018 06:55:25 +0900
> Subject: [PATCH 0/4] Update snippets of litmus tests
> 
> Hi Paul,
> 
> RCU litmus tests recently added in "formal" did not compile
> by klitmus7. Patch #1 is my attempt to manage them klitmus7
> ready.
> 
> Patch #2 add recipe for klitmus7-ready tests. Such tests need
> to be manually added in a list.
> 
> In preparing Patch #3, I looked up your "litmus" repository
> and found that comments on "exists" clause are actually allowed
> in the form of "(* ... *)".  Patch #3 updates labels embedded
> in litmus tests. Patch #4 updates styleguide accordingly.
> 
>         Thanks, Akira

Queued and pushed, thank you!

And yes, I sometimes use existing litmus tests as reference manuals.

							Thanx, Paul

> --
> Akira Yokosawa (4):
>   formal: Make RCU litmus tests klitmus7 ready
>   CodeSamples/formal/herd: Add recipe for klitmus7-ready tests
>   Use '(* ... *)' style comments in epilogue of litmus tests
>   styleguide: Loosen restriction on comment in litmus test
> 
>  CodeSamples/formal/herd/C-RCU-remove.litmus        | 18 +++++---
>  .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  | 28 ++++++++----
>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus      |  4 +-
>  CodeSamples/formal/herd/Makefile                   |  6 ++-
>  appendix/styleguide/styleguide.tex                 | 25 ++++-------
>  utilities/reorder_ltms.pl                          | 50 ++++++----------------
>  6 files changed, 57 insertions(+), 74 deletions(-)
> 
> -- 
> 2.7.4
> 

