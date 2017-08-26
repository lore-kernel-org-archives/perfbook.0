Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60858 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751407AbdHZB7h (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 25
 Aug 2017 21:59:37 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7Q1wjNb074552
 for <perfbook@vger.kernel.org>; Fri, 25 Aug 2017 21:59:36 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cjyrjr490-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 25 Aug 2017 21:59:36 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 25 Aug
 2017 21:59:35 -0400
Date: Fri, 25 Aug 2017 18:59:44 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <2f1687fb-136e-88e8-e678-9066be8b0448@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f1687fb-136e-88e8-e678-9066be8b0448@gmail.com>
Message-Id: <20170826015944.GV11320@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 26, 2017 at 09:07:33AM +0900, Akira Yokosawa wrote:
> >From 65f40cf041aa5506e62c25e4ab9fd63d1d34fdd7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 26 Aug 2017 08:48:01 +0900
> Subject: [PATCH] advsync: Fix litmus tests
> 
> Adjust litmus-test syntax to be accepted by litmus7.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This is my attempt to make litmus7 happy.
> herd7 says:
> 
> --
> $ herd7 -conf strong.cfg C-WWC+o+o-data-o+o-addr-o.litmus 
> Test C-WWC+o+o-data-o+o-addr-o Allowed
> States 5
> 1:r1=x; 2:r2=u; x=x;
> 1:r1=x; 2:r2=x; x=a;
> 1:r1=x; 2:r2=x; x=x;
> 1:r1=z; 2:r2=u; x=x;
> 1:r1=z; 2:r2=z; x=x;
> Ok
> Witnesses
> Positive: 1 Negative: 4
> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
> Observation C-WWC+o+o-data-o+o-addr-o Sometimes 1 4
> Hash=262fd275af47e8ed4fba69491478bb7d
> --
> 
> and
> 
> --
> $ herd7 -conf strong.cfg C-WWC+o+o-r+o-addr-o.litmus 
> Test C-WWC+o+o-r-o+o-addr-o Allowed
> States 4
> 1:r1=x; 2:r2=u; x=x;
> 1:r1=x; 2:r2=x; x=a;
> 1:r1=z; 2:r2=u; x=x;
> 1:r1=z; 2:r2=z; x=x;
> No
> Witnesses
> Positive: 0 Negative: 4
> Condition exists (1:r1=x /\ 2:r2=x /\ x=x)
> Observation C-WWC+o+o-r-o+o-addr-o Never 0 4
> Hash=607040ae8eb633fee308b55be24729e1
> --
> 
> Do these look reasonable?

They do, but I failed to push out a change, and thus had to hand-apply
them with some adjustment.  Could you please double-check them?  For
ease of repairing any errors, I split this into two commits.

Also, I made the memory-barriers section be its own chapter.  At some
point I should move the litmus tests as well, but am holding off until
we get these corrected.

							Thanx, Paul

>      Thanks, Akira
> --
>  .../advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus  | 22 ++++++++++---
>  .../advsync/herd/C-WWC+o+o-r+o-addr-o.litmus       | 24 ++++++++++----
>  advsync/memorybarriers.tex                         | 38 +++++++++++++++-------
>  3 files changed, 62 insertions(+), 22 deletions(-)
> 
> diff --git a/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus b/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
> index e49712f..3e51168 100644
> --- a/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
> +++ b/CodeSamples/advsync/herd/C-WWC+o+o-data-o+o-addr-o.litmus
> @@ -1,23 +1,35 @@
>  C C-WWC+o+o-data-o+o-addr-o
> 
>  {
> -x=z;
> -b=a;
> +int z = 0;
> +int *x = &z;
> +int u = 0;
> +int *y = &u;
> +int b = 0;
> +int *a = &b;
>  }
> 
> -void P0(int **x)
> +{
> +#include "api.h"
> +}
> +
> +P0(int **x)
>  {
>  	WRITE_ONCE(*x, x);
>  }
> 
> -void P1(int **x, int **y)
> +P1(int **x, int **y)
>  {
> +	int *r1;
> +
>  	r1 = READ_ONCE(*x);
>  	WRITE_ONCE(*y, r1);
>  }
> 
> -void P2(int **x, int **y)
> +P2(int **y, int **a)
>  {
> +	int *r2;
> +
>  	r2 = READ_ONCE(*y);
>  	WRITE_ONCE(*r2, a);
>  }
> diff --git a/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus b/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
> index 5439868..7f47f7a 100644
> --- a/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
> +++ b/CodeSamples/advsync/herd/C-WWC+o+o-r+o-addr-o.litmus
> @@ -1,23 +1,35 @@
> -C C-WWC+o+o-data-o+o-addr-o
> +C C-WWC+o+o-r-o+o-addr-o
> 
>  {
> -x=z;
> -b=a;
> +int z = 0;
> +int *x = &z;
> +int u = 0;
> +int *y = &u;
> +int b = 0;
> +int *a = &b;
>  }
> 
> -void P0(int **x)
> +{
> +#include "api.h"
> +}
> +
> +P0(int **x)
>  {
>  	WRITE_ONCE(*x, x);
>  }
> 
> -void P1(int **x, int **y)
> +P1(int **x, int **y)
>  {
> +	int *r1;
> +
>  	r1 = READ_ONCE(*x);
>  	smp_store_release(y, r1);
>  }
> 
> -void P2(int **x, int **y)
> +P2(int **y, int **a)
>  {
> +	int *r2;
> +
>  	r2 = READ_ONCE(*y);
>  	WRITE_ONCE(*r2, a);
>  }
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index fbcd22a..51236c8 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1311,23 +1311,31 @@ does need to deal with them.
>  C C-WWC+o+o-data-o+o-addr-o
> 
>  {
> -x=z;
> -b=a;
> +int z = 0;
> +int *x = &z;
> +int u = 0;
> +int *y = &u;
> +int b = 0;
> +int *a = &b;
>  }
> 
> -void P0(int **x)
> +P0(int **x)
>  {
>    WRITE_ONCE(*x, x);
>  }
> 
> -void P1(int **x, int **y)
> +P1(int **x, int **y)
>  {
> +  int *r1;
> +
>    r1 = READ_ONCE(*x);
>    WRITE_ONCE(*y, r1);
>  }
> 
> -void P2(int **x, int **y)
> +P2(int **y, int **a)
>  {
> +  int *r2;
> +
>    r2 = READ_ONCE(*y);
>    WRITE_ONCE(*r2, a);
>  }
> @@ -1344,26 +1352,34 @@ exists(1:r1=x /\ 2:r2=x /\ x=x)
>  \begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
> -C C-WWC+o+o-data-o+o-addr-o
> +C C-WWC+o+o-r-o+o-addr-o
> 
>  {
> -x=z;
> -b=a;
> +int z = 0;
> +int *x = &z;
> +int u = 0;
> +int *y = &u;
> +int b = 0;
> +int *a = &b;
>  }
> 
> -void P0(int **x)
> +P0(int **x)
>  {
>    WRITE_ONCE(*x, x);
>  }
> 
> -void P1(int **x, int **y)
> +P1(int **x, int **y)
>  {
> +  int *r1;
> +
>    r1 = READ_ONCE(*x);
>    smp_store_release(y, r1);
>  }
> 
> -void P2(int **x, int **y)
> +P2(int **y, int **a)
>  {
> +  int *r2;
> +
>    r2 = READ_ONCE(*y);
>    WRITE_ONCE(*r2, a);
>  }
> -- 
> 2.7.4
> 

