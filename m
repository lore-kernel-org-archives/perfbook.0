Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56450 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbfAPXAZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 16 Jan 2019 18:00:25 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id x0GMxOoT063062
        for <perfbook@vger.kernel.org>; Wed, 16 Jan 2019 18:00:24 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2q28yqugs1-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 16 Jan 2019 18:00:24 -0500
Received: from localhost
        by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 16 Jan 2019 23:00:23 -0000
Date: Wed, 16 Jan 2019 15:00:19 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] defer: Use \slash to permit line break behind '/'
Reply-To: paulmck@linux.ibm.com
References: <c65d597e-9191-573e-af15-1fb695b5b472@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c65d597e-9191-573e-af15-1fb695b5b472@gmail.com>
Message-Id: <20190116230019.GO1215@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 17, 2019 at 07:33:14AM +0900, Akira Yokosawa wrote:
> >From 8d305759c347fa6d1a786adfa2b0199a136d29df Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 17 Jan 2019 07:17:18 +0900
> Subject: [PATCH] defer: Use \slash to permit line break behind '/'
> 
> These captions were hyphenated in a strange way in 2c layout
> as show below:
> 
>                                   ... Ad-
>     d/Delete ...
> 
> By this change, they are broken behind the '/' character:
> 
>                                   ... Add/
>     Delete ...
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

That is strange, good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  defer/hazptr.tex  | 2 +-
>  defer/refcnt.tex  | 2 +-
>  defer/seqlock.tex | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/defer/hazptr.tex b/defer/hazptr.tex
> index 98ba002..fe319ea 100644
> --- a/defer/hazptr.tex
> +++ b/defer/hazptr.tex
> @@ -188,7 +188,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
>  
>  \begin{listing}[tbp]
>  \input{CodeSamples/defer/route_hazptr@add_del.fcv}
> -\caption{Hazard-Pointer Pre-BSD Routing Table Add/Delete}
> +\caption{Hazard-Pointer Pre-BSD Routing Table Add\slash Delete}
>  \label{lst:defer:Hazard-Pointer Pre-BSD Routing Table Add/Delete}
>  \end{listing}
>  
> diff --git a/defer/refcnt.tex b/defer/refcnt.tex
> index 79b5f18..f385389 100644
> --- a/defer/refcnt.tex
> +++ b/defer/refcnt.tex
> @@ -13,7 +13,7 @@
>  
>  \begin{listing}[tbp]
>  \input{CodeSamples/defer/route_refcnt@add_del.fcv}
> -\caption{Reference-Counted Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
> +\caption{Reference-Counted Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
>  \label{lst:defer:Reference-Counted Pre-BSD Routing Table Add/Delete}
>  \end{listing}
>  
> diff --git a/defer/seqlock.tex b/defer/seqlock.tex
> index 3eabf31..abb9f37 100644
> --- a/defer/seqlock.tex
> +++ b/defer/seqlock.tex
> @@ -270,7 +270,7 @@ increment of the sequence number on line~\lnref{inc}, then releases the lock.
>  
>  \begin{listing}[tbp]
>  \input{CodeSamples/defer/route_seqlock@add_del.fcv}
> -\caption{Sequence-Locked Pre-BSD Routing Table Add/Delete (BUGGY!!!)}
> +\caption{Sequence-Locked Pre-BSD Routing Table Add\slash Delete (BUGGY!!!)}
>  \label{lst:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
>  \end{listing}
>  
> -- 
> 2.7.4
> 

