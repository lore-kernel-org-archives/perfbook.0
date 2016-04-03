Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:58726 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751393AbcDCN5q (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2016
 09:57:46 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 3 Apr 2016
 09:57:45 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id E7A7438C8026
 for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:57:43 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u33DvhEC41156696	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 13:57:43 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u33Dvh42025933	for <perfbook@vger.kernel.org>; Sun, 3 Apr 2016 09:57:43 -0400
Date: Sun, 3 Apr 2016 06:57:42 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix wrong code example
Message-ID: <20160403135742.GD5835@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <alpine.DEB.2.10.1604021149350.22948@hxeon>
 <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459566236-15362-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: akiyks@gmail.com, perfbook@vger.kernel.org

On Sat, Apr 02, 2016 at 12:03:56PM +0900, SeongJae Park wrote:
> The code means `*(A + 4) = Y` but it is written as `Y = *A`. This commit
> fixes the typo.
> 
> Suggested-by: Akira Yokosawa <akiysw@gmail.com>
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index ee9312d..8e9c876 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1364,7 +1364,7 @@ Y = LOAD *(A + 4); X = LOAD *A;
>  \begin{minipage}[t]{\columnwidth}
>  \scriptsize
>  \begin{verbatim}
> -*A = X; Y = *A;
> +*A = X; *(A + 4) = Y;
>  \end{verbatim}
>  \end{minipage}
>  \vspace{5pt}
> -- 
> 1.9.1
> 

