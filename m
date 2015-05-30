Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e33.co.us.ibm.com ([32.97.110.151]:40947 "EHLO
 e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1755632AbbE3Qge (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 30 May 2015
 12:36:34 -0400
Received: from /spool/local	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 30 May
 2015 10:36:34 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id BB90B19D8026	for <perfbook@vger.kernel.org>; Sat, 30
 May 2015 10:27:34 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t4UGaWWB54067280	for <perfbook@vger.kernel.org>; Sat, 30 May 2015 09:36:32
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t4UGaWsN024269	for <perfbook@vger.kernel.org>; Sat, 30 May 2015 10:36:32
 -0600
Date: Sat, 30 May 2015 09:36:30 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] FAQ: fix wrong question reference
Message-ID: <20150530163630.GE5989@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1432966752-18801-1-git-send-email-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1432966752-18801-1-git-send-email-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 30, 2015 at 03:19:12PM +0900, SeongJae Park wrote:
> A reference to a question inside FAQ.txt was not updated though its
> number has changed from "Update FAQ to describe build hangs"
> (197164dcb9ddd9c1e4). Fix the reference.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Good catch, queued!

							Thanx, Paul

> ---
>  FAQ.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/FAQ.txt b/FAQ.txt
> index c6890ab..631e18c 100644
> --- a/FAQ.txt
> +++ b/FAQ.txt
> @@ -167,7 +167,7 @@
>  		https://sites.google.com/site/kandamotohiro/perfbook
> 
>  10.	I am working on a translation.  What do I need to do to get my
> -	name of the list in #8 above?
> +	name of the list in #9 above?
> 
>  	A.	Send me at least one chapter of your translated work
>  		in machine-readable form, preferable PDF.
> -- 
> 1.9.1
> 

