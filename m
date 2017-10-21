Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54990 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932180AbdJURPD (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 21
 Oct 2017 13:15:03 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9LHDnmX099283
 for <perfbook@vger.kernel.org>; Sat, 21 Oct 2017 13:15:03 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dr2rmewxn-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 21 Oct 2017 13:15:02 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 21 Oct
 2017 13:15:01 -0400
Date: Sat, 21 Oct 2017 10:14:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync/rt: Remove epigraph under section
Reply-To: paulmck@linux.vnet.ibm.com
References: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <458f0875-24ae-d62b-6448-152affe8fb7c@gmail.com>
Message-Id: <20171021171459.GM3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 21, 2017 at 08:27:57PM +0900, Akira Yokosawa wrote:
> >From 7ec65f19bf8b1d8a6389e684955d672658ac1010 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 21 Oct 2017 20:20:27 +0900
> Subject: [PATCH] advsync/rt: Remove epigraph under section
> 
> Also modify label (chp -> sec).
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Heh!  It overprinted and I didn't notice!  

Good catch on both counts, applied, thank you.

							Thanx, Paul

> ---
>  advsync/rt.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index 673b8f8..4d86c5d 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -1,10 +1,10 @@
>  % advsync/rt.tex
> 
>  \section{Parallel Real-Time Computing}
> -\label{chp:Parallel Real-Time Computing}
> +\label{sec:Parallel Real-Time Computing}
>  %
> -\Epigraph{The difference between you and me is that I was right in time.}
> -	 {\emph{Konrad Adenauer}}
> +%\Epigraph{The difference between you and me is that I was right in time.}
> +%	 {\emph{Konrad Adenauer}}
> 
>  An important emerging area in computing is that of parallel real-time
>  computing.
> -- 
> 2.7.4
> 

