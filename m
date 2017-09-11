Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34467 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750715AbdIKPyg (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 11
 Sep 2017 11:54:36 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v8BFsCYN087582
 for <perfbook@vger.kernel.org>; Mon, 11 Sep 2017 11:54:36 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2cwt0u0q65-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 11 Sep 2017 11:54:35 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 11 Sep
 2017 11:54:34 -0400
Date: Mon, 11 Sep 2017 08:54:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Reword footnote on cumulativity
Reply-To: paulmck@linux.vnet.ibm.com
References: <fe6143ec-d858-b3de-682f-0d5e3a3122d2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe6143ec-d858-b3de-682f-0d5e3a3122d2@gmail.com>
Message-Id: <20170911155430.GL3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 11, 2017 at 11:49:06PM +0900, Akira Yokosawa wrote:
> >From bfbd4d2c5c43a436795d4f352c54c3bb6b8d5304 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 11 Sep 2017 23:41:26 +0900
> Subject: [PATCH] memorder: Reword footnote on cumulativity
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, queued and pushed, thank you!

							Thanx, Paul

> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index a916eeb..96b598b 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3583,7 +3583,7 @@ invoked by those two clauses), not to code following that ``\co{if}''.
> 
>  Finally, control dependencies do \emph{not} provide cumulativity.\footnote{
>  	Refer to Section~\ref{sec:memorder:Cumulativity} for
> -	the meaning of transitivity.}
> +	the meaning of cumulativity.}
>  This is demonstrated by two related examples, with the initial values
>  of~\co{x} and~\co{y} both being zero:
> 
> -- 
> 2.7.4
> 

