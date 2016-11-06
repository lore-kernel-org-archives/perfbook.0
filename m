Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47840 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751167AbcKFX32 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 6
 Nov 2016 18:29:28 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uA6NSfPQ008023
 for <perfbook@vger.kernel.org>; Sun, 6 Nov 2016 18:28:52 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 26j7r1vbeg-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 06 Nov 2016 18:28:51 -0500
Received: from localhost by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 6 Nov 2016
 16:28:51 -0700
Date: Sun, 6 Nov 2016 15:28:49 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] rt: Insert missing NBSPs
Reply-To: paulmck@linux.vnet.ibm.com
References: <20161106175234.13878-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161106175234.13878-1-sj38.park@gmail.com>
Message-Id: <20161106232849.GK24166@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Nov 07, 2016 at 02:52:33AM +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  rt/rt.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rt/rt.tex b/rt/rt.tex
> index 21a53a4514b8..870bc9af6e0b 100644
> --- a/rt/rt.tex
> +++ b/rt/rt.tex
> @@ -386,7 +386,7 @@ cylinder contained in the log to the blade,
>  Each of these six phases of operation might well have its own set of
>  deadlines and environmental constraints,
>  for example, one would expect phase~4's deadlines to be much more severe
> -than those of phase 6, milliseconds instead of seconds.
> +than those of phase~6, milliseconds instead of seconds.
>  One might therefore expect that low-priority work would be performed in
>  phase~6 rather than in phase~4.
>  That said, careful choices of hardware, drivers, and software configuration
> @@ -1429,7 +1429,7 @@ only being one runnable task on that CPU is said to be in
>  \emph{adaptive ticks mode}.
> 
>  As an alternative to the \co{nohz_full=} boot parameter, you can build
> -your kernel with \co{NO_HZ_FULL_ALL}, which will designate CPU 0 as
> +your kernel with \co{NO_HZ_FULL_ALL}, which will designate CPU~0 as
>  a housekeeping CPU and all other CPUs as worker CPUs.
>  Either way, it is important to ensure that you have designated enough
>  housekeeping CPUs to handle the housekeeping load imposed by the
> -- 
> 2.10.0
> 

