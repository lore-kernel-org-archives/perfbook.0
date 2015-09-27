Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:37062 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1756410AbbI0QRW (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 27 Sep 2015
 12:17:22 -0400
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 27 Sep
 2015 10:17:21 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id BEF771FF002D	for <perfbook@vger.kernel.org>; Sun, 27
 Sep 2015 10:08:27 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com
 [9.17.195.170])	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t8RGHIm160096714	for <perfbook@vger.kernel.org>; Sun, 27 Sep
 2015 09:17:18 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])	by
 d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t8RGHI6F028918	for <perfbook@vger.kernel.org>; Sun, 27 Sep 2015 10:17:18
 -0600
Date: Sun, 27 Sep 2015 09:17:15 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] fix typo in quick quiz 4.17
Message-ID: <20150927161715.GG30373@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1443355322-11907-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1443355322-11907-1-git-send-email-pbonzini@redhat.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 27, 2015 at 02:02:02PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Good catch, applied.

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 4e85a9c..ccbe0ad 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -964,7 +964,7 @@ rights to assume that the value of \co{goflag} would never change.
>  \QuickQuizAnswer{
>  	It depends.
>  	If the per-thread variable was accessed only from its thread,
> -	and never from a single handler, then no.
> +	and never from a signal handler, then no.
>  	Otherwise, it is quite possible that \co{ACCESS_ONCE()} is needed.
>  	We will see examples of both situations in
>  	Section~\ref{sec:count:Signal-Theft Limit Counter Implementation}.
> -- 
> 2.5.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

