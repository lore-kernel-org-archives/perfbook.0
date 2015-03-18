Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:34119 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751074AbbCRTIm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 18 Mar 2015
 15:08:42 -0400
Received: from /spool/local	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 18 Mar
 2015 13:08:41 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id 5773AC40004	for <perfbook@vger.kernel.org>; Wed, 18
 Mar 2015 12:59:49 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t2IJ8Sl331785134	for <perfbook@vger.kernel.org>; Wed, 18 Mar 2015 12:08:29
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t2IJ8bdU024693	for <perfbook@vger.kernel.org>; Wed, 18 Mar 2015 13:08:37
 -0600
Date: Wed, 18 Mar 2015 12:08:36 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync/mb: s/targetted/targeted/
Message-ID: <20150318190836.GD5312@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1426639213-9551-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426639213-9551-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: perfbook@vger.kernel.org

On Tue, Mar 17, 2015 at 08:40:13PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index cc11323..e8666db 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1293,7 +1293,7 @@ STORE *X = c, d = LOAD *X
>  \end{minipage}
>  \vspace{5pt}
> 
> -	(Loads and stores overlap if they are targetted at overlapping pieces of
> +	(Loads and stores overlap if they are targeted at overlapping pieces of
>  	memory).
>  \item	A series of stores to a single variable will appear to all
>  	CPUs to have occurred in a single order, though this order
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

