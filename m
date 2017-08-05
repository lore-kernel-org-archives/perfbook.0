Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49179 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751262AbdHEPJT (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 5
 Aug 2017 11:09:19 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v75F8ugw045370
 for <perfbook@vger.kernel.org>; Sat, 5 Aug 2017 11:09:18 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2c5a3xu6sp-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 05 Aug 2017 11:09:18 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 5 Aug 2017
 11:09:17 -0400
Date: Sat, 5 Aug 2017 08:09:13 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] Employ auto-numbering in litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
 <20170801204047.GH3730@linux.vnet.ibm.com>
 <068877e2-655b-0d6f-6dab-84d11467d0e5@gmail.com>
 <20170802162910.GY3730@linux.vnet.ibm.com>
 <0a7b7a93-c60c-436f-77a7-e2b27de86a40@gmail.com>
 <20170802224820.GH3730@linux.vnet.ibm.com>
 <672edb74-85b9-1086-44ee-dba21a0589c9@gmail.com>
 <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94dbb98d-370a-8311-b467-9670f3968393@gmail.com>
Message-Id: <20170805150913.GJ3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 05, 2017 at 12:41:30PM +0900, Akira Yokosawa wrote:
> >From ba0af5ad755ab4e175b07abb71890077e4d54a20 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 5 Aug 2017 12:29:10 +0900
> Subject: [PATCH 0/3] Employ auto-numbering in litmus tests
> 
> Hi Paul,
> 
> As I mentioned earlier, we need to revert commits related to floatrow.
> Patch #1 does the revert.
> Patch #2 converts litmus tests in Memory Barriers section to use
> auto-numbering.
> Patch #3 updates style guide to reflect the removal of floatrow and
> a typo fix. 
> 
> I'm considering "subfig" package as an alternative to floatrow.
> It predates floatrow and has less capability.
> I'll see if it works in two-column layout, and update the style guide
> if it goes well.

Life is like that sometimes.  ;-)

Applied, thank you!  I did a couple of updates on 3/3 for "nor" and
for subject-verb agreement.

Do we want to "git rm" floatrowpf.sty?

							Thanx, Paul

>       Thanks, Akira 
> 
> Akira Yokosawa (3):
>   Revert commits after "Localize floatrow.sty as floatrowpf.sty"
>   advsync: Employ auto-numbering in litmus tests
>   styleguide: Remove references to 'floatrow' and adjust context
> 
>  advsync/memorybarriers.tex         |  502 ++++++------
>  appendix/styleguide/hello.c        |    9 -
>  appendix/styleguide/styleguide.tex |  205 +----
>  defer/rcuusage.tex                 |    6 +-
>  floatrowpf.sty                     | 1482 ------------------------------------
>  howto/howto.tex                    |    4 +-
>  perfbook.tex                       |    4 +-
>  7 files changed, 280 insertions(+), 1932 deletions(-)
>  delete mode 100644 appendix/styleguide/hello.c
>  delete mode 100644 floatrowpf.sty
> 
> -- 
> 2.7.4
> 
> 

