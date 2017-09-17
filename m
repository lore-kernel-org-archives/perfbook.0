Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54755 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751198AbdIQAyu (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 16
 Sep 2017 20:54:50 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8H0s2Yu010392
 for <perfbook@vger.kernel.org>; Sat, 16 Sep 2017 20:54:49 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d10ggbm8f-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 16 Sep 2017 20:54:49 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 16 Sep
 2017 20:54:48 -0400
Date: Sat, 16 Sep 2017 17:54:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 0/5] memorder: Miscellaneous fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Message-Id: <20170917005444.GU3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 17, 2017 at 12:06:02AM +0900, Akira Yokosawa wrote:
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 16 Sep 2017 23:39:11 +0900
> Subject: [PATCH v2 0/5] memorder: Miscellaneous fixes
> 
> Hi Paul,
> 
> (Sorry, I messed up 2/5 in v1. Retrying...)
> 
> This patch set consists of small fixes in memorder.
> 
> Patches #1, #2, and #3 are trivial fixes.
> 
> Patch #4 fixes a recursive reference within the chapter. I chose
> Section 14.1, but there might be other choices.

I removed the reference with your Reported-by, as it was a holdover
from my moving that section from the appendix.  I also fixed a typo in
the table.

> Patch #5 might be a wrong guess on my side. I have not consulted
> any document regarding PA-RISC arch or its CPU implementation.
> Please apply it if it is the right guess.

All the others look good, including #5, thank you!!!

							Thanx, Paul

>        Thanks, Akira
> --
> Akira Yokosawa (5):
>   memorder: Adjust hspace of table 'Summary of Memory Ordering' in 1c
>   memorder: Fix usage of \IfInBook macro
>   memorder: More reword to 'full-strength non-void RMW'
>   memorder: Update reference to memory-barrier primitives
>   memorder: Fix table of 'Summary of Memory Ordering'
> 
>  appendix/styleguide/styleguide.tex |  2 +-
>  memorder/memorder.tex              | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> -- 
> 2.7.4
> 
> 
> 

