Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51508 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751646AbdJ2D1x (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sat, 28 Oct 2017 23:27:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9T3O2a7020156
 for <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 23:27:53 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dvnw3fjrh-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 28 Oct 2017 23:27:53 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 28 Oct
 2017 23:27:52 -0400
Date: Sat, 28 Oct 2017 20:27:49 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] locking: Fix syntactic ambiguity
Reply-To: paulmck@linux.vnet.ibm.com
References: <0eb6e2e3-e193-3109-7794-fcdf10a3045b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0eb6e2e3-e193-3109-7794-fcdf10a3045b@gmail.com>
Message-Id: <20171029032749.GD3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On Sun, Oct 29, 2017 at 09:01:57AM +0800, Yubin Ruan wrote:
> >From c8a3ed4cc54d322dd107e4842837851943784666 Mon Sep 17 00:00:00 2001
> From: Yubin Ruan <ablacktshirt@gmail.com>
> Date: Sun, 29 Oct 2017 08:40:31 +0800
> Subject: [PATCH] locking: Fix syntactic ambiguity
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>
> Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Signed-off-by: Yubin Ruan <ablacktshirt@gmail.com>

Applied, thank you both!

Yubin, whatever you did to generate and send this patch works just fine,
thank you!  ;-)

							Thanx, Paul

> ---
>  locking/locking-existence.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
> index 9fcbbf9..6340734 100644
> --- a/locking/locking-existence.tex
> +++ b/locking/locking-existence.tex
> @@ -174,8 +174,8 @@ single partitionable data structure such as the hash table shown in the
>  figure, it can be problematic if a given data element can be a member
>  of multiple hash tables or given more-complex data structures such
>  as trees or graphs.
> -These problems can be solved, in fact, such solutions form the basis
> -of lock-based software transactional memory
> +Not only can these problems be solved, but the solutions also form
> +the basis of lock-based software transactional memory
>  implementations~\cite{Shavit95,DaveDice2006DISC}.
>  However,
>  Chapter~\ref{chp:Deferred Processing}
> -- 
> 2.7.4
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

