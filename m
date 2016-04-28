Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e18.ny.us.ibm.com ([129.33.205.208]:35723 "EHLO
 e18.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751539AbcD1OTM (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 28 Apr 2016
 10:19:12 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Apr
 2016 10:19:11 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id A1C5EC90043
 for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:18:59 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3SEJ5EF36306984	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 14:19:05
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3SEJ4Rh026285	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:19:05
 -0400
Date: Thu, 28 Apr 2016 07:19:42 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Tweak table appearance
Message-ID: <20160428141942.GF4609@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <7e2672ff-90ab-7c4f-ac3a-7dd9d977dd1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e2672ff-90ab-7c4f-ac3a-7dd9d977dd1e@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Apr 28, 2016 at 09:53:52PM +0900, Akira Yokosawa wrote:
> >From 365395c463751c9ed1bb187f4df4758995fc5e73 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Thu, 28 Apr 2016 21:35:43 +0900
> Subject: [PATCH] advsync: Tweak table appearance
> 
> The table added in commit 8de1474e3282 ("Add larger multiple-
> value-write scenario") seems to be a little bit different
> in its appearance from the author's intention.
> This commit tries to reproduce what was presumably intended.
> 
> Note: I might have completely missed the point. Please apply this
> only after checking if it matches your intention.
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

Looks good, applied!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 110 ++++++++++++++++++++++-----------------------
>  1 file changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 538907d..4732172 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -372,119 +372,119 @@ Again, CPU~0 coordinates the test, so does not record any values.
>  \begin{table*}[htbp]
>  \scriptsize
>  \centering
> -\begin{tabular}{r||r|r|r|r|r|r|r|r|r|r|r|r|r|r|r}
> +\begin{tabular}{r||c|c|c|c|c|c|c|c|c|c|c|c|c|c|c}
>       & \multicolumn{15}{c}{CPU's Observed Values} \\
>       \cline{2-16}
>  Time & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 14 & 15 \\
>  \hline
>  \hline
> -12  & \emph(1) &  &  &  &  &  &  &  &  &  &  &  &  &  &  \\
> +12  & \emph{(1)} &  &  &  &  &  &  &  &  &  &  &  &  &  &  \\
>  \hline
> -12  & ~ &  &  &  &  &  &  &  &  &  &  &  & \emph(13) &  &  \\
> +12  & ~ &  &  &  &  &  &  &  &  &  &  &  & \emph{(13)} &  &  \\
>  \hline
> -13  & ~ &  &  &  &  &  &  &  &  &  &  & \emph(12) & ~ &  &  \\
> +13  & ~ &  &  &  &  &  &  &  &  &  &  & \emph{(12)} & ~ &  &  \\
>  \hline
> -13  & ~ &  &  &  &  &  &  &  &  &  &  & 12 & ~ & \emph(14) &  \\
> +13  & ~ &  &  &  &  &  &  &  &  &  &  & 12 & ~ & \emph{(14)} &  \\
>  \hline
> -15  & ~ &  &  & \emph(4) &  &  &  &  &  &  &  & 12 & ~ & ~ &  \\
> +15  & ~ &  &  & \emph{(4)} &  &  &  &  &  &  &  & 12 & ~ & ~ &  \\
>  \hline
> -15  & ~ &  &  & ~ &  &  &  & \emph(8) &  &  &  & 12 & ~ & ~ &  \\
> +15  & ~ &  &  & ~ &  &  &  & \emph{(8)} &  &  &  & 12 & ~ & ~ &  \\
>  \hline
> -15  & ~ &  &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & \emph(15) \\
> +15  & ~ &  &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & \emph{(15)} \\
>  \hline
> -16  & ~ & \emph(2) &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
> +16  & ~ & \emph{(2)} &  & ~ &  &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -16  & ~ & ~ &  & ~ & \emph(5) &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
> +16  & ~ & ~ &  & ~ & \emph{(5)} &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -17  & ~ & ~ & \emph(3) & ~ & ~ &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
> +17  & ~ & ~ & \emph{(3)} & ~ & ~ &  &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -17  & ~ & ~ & 3 & ~ & ~ & \emph(6) &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
> +17  & ~ & ~ & 3 & ~ & ~ & \emph{(6)} &  & ~ &  &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -17  & ~ & ~ & 3 & ~ & ~ & ~ &  & ~ & \emph(9) &  &  & 12 & ~ & ~ & 15 \\
> +17  & ~ & ~ & 3 & ~ & ~ & ~ &  & ~ & \emph{(9)} &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -18  & ~ & ~ & 3 & ~ & ~ & ~ & \emph(7) & ~ & 9 &  &  & 12 & ~ & ~ & 15 \\
> +18  & ~ & ~ & 3 & ~ & ~ & ~ & \emph{(7)} & ~ & 9 &  &  & 12 & ~ & ~ & 15 \\
>  \hline
> -20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & \emph(11) & 12 & ~ & ~ & 15 \\
> +20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & \emph{(11)} & 12 & ~ & ~ & 15 \\
>  \hline
> -20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & ~ & 12 & ~ & \emph(15) & 15 \\
> +20  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 &  & ~ & 12 & ~ & \emph{(15)} & 15 \\
>  \hline
> -21  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & \emph(10) & ~ & 12 & ~ & 15 & 15 \\
> +21  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & \emph{(10)} & ~ & 12 & ~ & 15 & 15 \\
>  \hline
> -25  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & \emph(9) & 9 & 10 & ~ & 12 & ~ & 15 & 15 \\
> +25  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & \emph{(9)} & 9 & 10 & ~ & 12 & ~ & 15 & 15 \\
>  \hline
> -57  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & ~ & 12 & \emph(12) & 15 & ~ \\
> +57  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & ~ & 12 & \emph{(12)} & 15 & ~ \\
>  \hline
> -78  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & \emph(10) & 12 & 12 & 15 & ~ \\
> +78  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & \emph{(10)} & 12 & 12 & 15 & ~ \\
>  \hline
> -90  & \emph(6) & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +90  & \emph{(6)} & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -147  & \emph(4) & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +147  & \emph{(4)} & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -172  & ~ & ~ & ~ & ~ & ~ & ~ & \emph(2) & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +172  & ~ & ~ & ~ & ~ & ~ & ~ & \emph{(2)} & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -173  & ~ & ~ & ~ & ~ & ~ & \emph(2) & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +173  & ~ & ~ & ~ & ~ & ~ & \emph{(2)} & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -212  & ~ & ~ & ~ & \emph(10) & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +212  & ~ & ~ & ~ & \emph{(10)} & ~ & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -214  & ~ & ~ & ~ & 10 & \emph(10) & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +214  & ~ & ~ & ~ & 10 & \emph{(10)} & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -225  & \emph(10) & ~ & ~ & 10 & 10 & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
> +225  & \emph{(10)} & ~ & ~ & 10 & 10 & ~ & ~ & 9 & 9 & 10 & 10 & 12 & 12 & 15 & ~ \\
>  \hline
> -294  & ~ & ~ & ~ & \emph(15) & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
> +294  & ~ & ~ & ~ & \emph{(15)} & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
>  \hline
> -297  & ~ & ~ & ~ & 15 & \emph(15) & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
> +297  & ~ & ~ & ~ & 15 & \emph{(15)} & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 15 & ~ \\
>  \hline
> -308  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & \emph(15) & ~ & 12 & 12 & 15 & ~ \\
> +308  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & \emph{(15)} & ~ & 12 & 12 & 15 & ~ \\
>  \hline
> -309  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & \emph(15) & 12 & 12 & 15 & ~ \\
> +309  & ~ & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & \emph{(15)} & 12 & 12 & 15 & ~ \\
>  \hline
> -311  & \emph(15) & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
> +311  & \emph{(15)} & ~ & ~ & 15 & 15 & ~ & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
>  \hline
> -333  & ~ & ~ & ~ & 15 & 15 & \emph(15) & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
> +333  & ~ & ~ & ~ & 15 & 15 & \emph{(15)} & ~ & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
>  \hline
> -334  & ~ & ~ & ~ & 15 & 15 & 15 & \emph(15) & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
> +334  & ~ & ~ & ~ & 15 & 15 & 15 & \emph{(15)} & 9 & 9 & 15 & 15 & 12 & 12 & 15 & ~ \\
>  \hline
> -379  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & \emph(12) & ~ \\
> +379  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & \emph{(12)} & ~ \\
>  \hline
> -381  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & \emph(12) \\
> +381  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & \emph{(12)} \\
>  \hline
> -391  & ~ & ~ & ~ & \emph(12) & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
> +391  & ~ & ~ & ~ & \emph{(12)} & ~ & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
>  \hline
> -393  & ~ & ~ & ~ & 12 & \emph(12) & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
> +393  & ~ & ~ & ~ & 12 & \emph{(12)} & ~ & ~ & 9 & 9 & ~ & ~ & 12 & 12 & 12 & 12 \\
>  \hline
> -397  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & \emph(12) & ~ & 12 & 12 & 12 & 12 \\
> +397  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & \emph{(12)} & ~ & 12 & 12 & 12 & 12 \\
>  \hline
> -399  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & 12 & \emph(12) & 12 & 12 & 12 & 12 \\
> +399  & ~ & ~ & ~ & 12 & 12 & ~ & ~ & 9 & 9 & 12 & \emph{(12)} & 12 & 12 & 12 & 12 \\
>  \hline
> -441  & ~ & \emph(3) & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
> +441  & ~ & \emph{(3)} & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
>  \hline
> -442  & \emph(3) & 3 & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
> +442  & \emph{(3)} & 3 & ~ & ~ & ~ & ~ & ~ & 9 & 9 & ~ & ~ & ~ & ~ & ~ & ~ \\
>  \hline
> -472  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & \emph(9) & ~ & ~ & ~ & ~ & ~ \\
> +472  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & \emph{(9)} & ~ & ~ & ~ & ~ & ~ \\
>  \hline
> -473  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 9 & \emph(9) & ~ & ~ & ~ & ~ \\
> +473  & ~ & ~ & ~ & ~ & ~ & ~ & ~ & 9 & 9 & 9 & \emph{(9)} & ~ & ~ & ~ & ~ \\
>  \hline
> -475  & ~ & ~ & ~ & \emph(9) & ~ & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +475  & ~ & ~ & ~ & \emph{(9)} & ~ & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -476  & ~ & ~ & ~ & 9 & \emph(9) & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +476  & ~ & ~ & ~ & 9 & \emph{(9)} & ~ & ~ & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -499  & ~ & ~ & ~ & 9 & 9 & ~ & \emph(9) & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +499  & ~ & ~ & ~ & 9 & 9 & ~ & \emph{(9)} & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -500  & ~ & ~ & ~ & 9 & 9 & \emph(9) & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +500  & ~ & ~ & ~ & 9 & 9 & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -510  & ~ & \emph(9) & ~ & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +510  & ~ & \emph{(9)} & ~ & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -511  & ~ & 9 & \emph(9) & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +511  & ~ & 9 & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -515  & \emph(9) & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
> +515  & \emph{(9)} & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & ~ & ~ & ~ \\
>  \hline
> -523  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & \emph(9) & ~ & ~ \\
> +523  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & ~ & \emph{(9)} & ~ & ~ \\
>  \hline
> -525  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) & 9 & ~ & ~ \\
> +525  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} & 9 & ~ & ~ \\
>  \hline
> -528  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) & ~ \\
> +528  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} & ~ \\
>  \hline
> -529  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph(9) \\
> +529  & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & 9 & \emph{(9)} \\
>  \end{tabular}
>  \caption{A Variable With More Simultaneous Values}
>  \label{tab:advsync:A Variable With More Simultaneous Values}
> -- 
> 1.9.1
> 

