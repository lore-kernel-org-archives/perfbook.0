Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45135 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1755085AbcGKP7D (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Mon, 11 Jul 2016 11:59:03 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6BFwVWC058012
 for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 11:59:02 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 243eucg552-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Mon,
 11 Jul 2016 11:59:02 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 11 Jul
 2016 11:59:01 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id C056238C8039
 for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 11:58:59 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6BFwxv454657194	for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 15:58:59
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6BFwxsf018314	for <perfbook@vger.kernel.org>; Mon, 11 Jul 2016 11:58:59
 -0400
Date: Mon, 11 Jul 2016 08:59:17 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] defer/refcnt: Another typo fix
Reply-To: paulmck@linux.vnet.ibm.com
References: <75cf85b4-97e8-1425-911b-4f4713aff57e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75cf85b4-97e8-1425-911b-4f4713aff57e@gmail.com>
Message-Id: <20160711155917.GL4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jul 12, 2016 at 12:36:29AM +0900, Akira Yokosawa wrote:
> From ae44b15b34f4cba077d0c49e7416f66681895a3d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 12 Jul 2016 00:33:08 +0900
> Subject: [PATCH] defer/refcnt: Another typo fix
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Applied and pushed both, thank you!

							Thanx, Paul

> ---
>  defer/refcnt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/refcnt.tex b/defer/refcnt.tex
> index 8dfa8fe..76ebf4d 100644
> --- a/defer/refcnt.tex
> +++ b/defer/refcnt.tex
> @@ -267,7 +267,7 @@ Figure~\ref{fig:defer:Pre-BSD Packet Routing List}:
>  The problem is that the reference count is located in the object
>  to be protected, but that means that there is no protection during
> -the instant in time when the reference count itself if being acquired!
> +the instant in time when the reference count itself is being acquired!
>  This is the reference-counting counterpart of a locking issue noted
>  by Gamsa et al.~\cite{Gamsa99}.
>  One could imagine using a global lock or reference count to protect
> -- 
> 1.9.1
> 

