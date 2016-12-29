Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42903 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1752881AbcL2Qbi (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 29 Dec 2016 11:31:38 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uBTGTVM6135479
 for <perfbook@vger.kernel.org>; Thu, 29 Dec 2016 11:31:38 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 27n3yfmg07-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 29 Dec 2016 11:31:38 -0500
Received: from localhost by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 29 Dec
 2016 09:31:37 -0700
Date: Thu, 29 Dec 2016 08:31:41 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Trivial typo fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <692c6e8e-07e0-2c8c-daba-8961890e4086@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <692c6e8e-07e0-2c8c-daba-8961890e4086@gmail.com>
Message-Id: <20161229163141.GG3742@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 29, 2016 at 08:16:16PM +0900, Akira Yokosawa wrote:
> >From 898b1101cf7f88f42b57f88d7539c6a579f3106a Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 29 Dec 2016 19:42:34 +0900
> Subject: [PATCH] toolsoftrade: Trivial typo fixes
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index f76b250..1946599 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1280,7 +1280,7 @@ The C11 standard added atomic operations,
>  including loads (\co{atomic_load()}),
>  stores (\co{atomic_store()}),
>  memory barriers (\co{atomic_thread_fence()} and
> -\co{atomic_signal_fence()}), and read-modified-write atomics.
> +\co{atomic_signal_fence()}), and read-modify-write atomics.
>  The read-modify-write atomics include
>  \co{atomic_fetch_add()},
>  \co{atomic_fetch_sub()},
> @@ -1849,7 +1849,7 @@ shown in
>  Section~\ref{sec:toolsoftrade:Atomic Operations}
>  to that of per-CPU (or per-thread) variables
>  (see Section~\ref{sec:toolsoftrade:Per-CPU Variables}),
> -as well as to conventional increment (as in ``counter++'').
> +as well as to conventional increment (as in ``\co{counter++}'').
> 
>  % \emph{@@@ need parable on cache thrashing.}
> 
> -- 
> 2.7.4
> 

