Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e34.co.us.ibm.com ([32.97.110.152]:46860 "EHLO
 e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1754317AbbDIXDC (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 9 Apr 2015
 19:03:02 -0400
Received: from /spool/local	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 9 Apr 2015
 17:03:01 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id B8D213E4003B	for <perfbook@vger.kernel.org>; Thu, 9
 Apr 2015 17:02:58 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t39N2wbU46137456	for <perfbook@vger.kernel.org>; Thu, 9 Apr 2015 16:02:58
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t39N2wta022712	for <perfbook@vger.kernel.org>; Thu, 9 Apr 2015 17:02:58 -0600
Date: Thu, 9 Apr 2015 16:02:56 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: s/an write/a write/
Message-ID: <20150409230256.GR6464@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1428610555-27168-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1428610555-27168-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: perfbook@vger.kernel.org

On Thu, Apr 09, 2015 at 04:15:55PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Queued, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index e8666db..2d16542 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1777,7 +1777,7 @@ always be paired.  A lack of appropriate pairing is almost certainly an error.
> 
>  A write barrier should always be paired with a data dependency barrier or read
>  barrier, though a general barrier would also be viable.  Similarly a read
> -barrier or a data dependency barrier should always be paired with at least an
> +barrier or a data dependency barrier should always be paired with at least a
>  write barrier, though, again, a general barrier is viable:
> 
>  \vspace{5pt}
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

