Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59728 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751707AbdISWoq (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 19
 Sep 2017 18:44:46 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8JMiGYa132083
 for <perfbook@vger.kernel.org>; Tue, 19 Sep 2017 18:44:46 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2d361gdbdj-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 19 Sep 2017 18:44:46 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 19 Sep
 2017 18:44:44 -0400
Date: Tue, 19 Sep 2017 15:44:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Use consistent names of WRC litmus tests
Reply-To: paulmck@linux.vnet.ibm.com
References: <4bb0abd4-6f24-f5d0-bc2b-4019d19b4006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bb0abd4-6f24-f5d0-bc2b-4019d19b4006@gmail.com>
Message-Id: <20170919224441.GL3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 20, 2017 at 07:17:00AM +0900, Akira Yokosawa wrote:
> >From 6c728887ced50a760683df02da552a069dd51ead Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 20 Sep 2017 07:05:32 +0900
> Subject: [PATCH] memorder: Use consistent names of WRC litmus tests
> 
> Also update path names of litmus tests.
> 
> Fixes: 3162ff468ef4 ("memorder: Substitute WRC for WWC to illustrate non-MCA")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, applied and pushed, thank you!!!

							Thanx, Paul

> ---
>  .../advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus   | 33 ++++++++++++++++++++++
>  CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus    |  2 +-
>  .../advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus   | 33 ----------------------
>  memorder/memorder.tex                              |  8 +++---
>  4 files changed, 38 insertions(+), 38 deletions(-)
>  create mode 100644 CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
>  delete mode 100644 CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus
> 
> diff --git a/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus b/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
> new file mode 100644
> index 0000000..602e800
> --- /dev/null
> +++ b/CodeSamples/advsync/herd/C-WRC+o+o-data-o+o-rmb-o.litmus
> @@ -0,0 +1,33 @@
> +C C-WRC+o+o-data-o+o-rmb-o
> +
> +{
> +}
> +
> +{
> +#include "api.h"
> +}
> +
> +P0(int *x)
> +{
> +	WRITE_ONCE(*x, 1);
> +}
> +
> +P1(int *x, int* y)
> +{
> +	int r1;
> +
> +	r1 = READ_ONCE(*x);
> +	WRITE_ONCE(*y, r1);
> +}
> +
> +P2(int *x, int* y)
> +{
> +	int r2;
> +	int r3;
> +
> +	r2 = READ_ONCE(*y);
> +	smp_rmb();
> +	r3 = READ_ONCE(*x);
> +}
> +
> +exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
> diff --git a/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus b/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
> index 5585f5e..6d55ead 100644
> --- a/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
> +++ b/CodeSamples/advsync/herd/C-WRC+o+o-r+a-o.litmus
> @@ -1,4 +1,4 @@
> -C C-WRC+o+o-r+a-o.litmus
> +C C-WRC+o+o-r+a-o
> 
>  {
>  }
> diff --git a/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus b/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus
> deleted file mode 100644
> index 5d9f200..0000000
> --- a/CodeSamples/advsync/herd/C-WRC-o+o-data-o+o-rmb-o.litmus
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -C C-WRC-o+o-data-o+o-rmb-o
> -
> -{
> -}
> -
> -{
> -#include "api.h"
> -}
> -
> -P0(int *x)
> -{
> -	WRITE_ONCE(*x, 1);
> -}
> -
> -P1(int *x, int* y)
> -{
> -	int r1;
> -
> -	r1 = READ_ONCE(*x);
> -	WRITE_ONCE(*y, r1);
> -}
> -
> -P2(int *x, int* y)
> -{
> -	int r2;
> -	int r3;
> -
> -	r2 = READ_ONCE(*y);
> -	smp_rmb();
> -	r3 = READ_ONCE(*x);
> -}
> -
> -exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 5df5649..316bab7 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1847,7 +1847,7 @@ does need to deal with them.
>  \begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
> -C C-WRC-o+o-data-o+o-rmb-o
> +C C-WRC+o+o-data-o+o-rmb-o
> 
>  {
>  }
> @@ -1885,7 +1885,7 @@ exists (1:r1=1 /\ 2:r2=1 /\ 2:r3=0)
>  \end{listing}
> 
>  Listing~\ref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}
> -(\path{C-WWC+o+o-data-o+o-addr-o.litmus})
> +(\path{C-WRC+o+o-data-o+o-rmb-o.litmus})
>  demonstrates multicopy atomicity, that is, on a multicopy-atomic platform,
>  the \co{exists} clause on line~29 cannot trigger.
>  In contrast, on a non-multicopy-atomic
> @@ -2093,7 +2093,7 @@ same variable.
>  \begin{listing}[tbp]
>  { \scriptsize
>  \begin{verbbox}[\LstLineNo]
> -C C-WRC+o+o-r+a-o.litmus
> +C C-WRC+o+o-r+a-o
> 
>  {
>  }
> @@ -2137,7 +2137,7 @@ However, as indicated by the ``C'' in their ``C'' column,
>  release operations do provide cumulativity.
>  Therefore,
>  Listing~\ref{lst:memorder:WRC Litmus Test With Release}
> -(\path{C-WWC+o+o-r+o-addr-o.litmus})
> +(\path{C-WRC+o+o-r+a-o.litmus})
>  substitutes a release operation for
>  Listing~\ref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}'s
>  data dependency.
> -- 
> 2.7.4
> 

