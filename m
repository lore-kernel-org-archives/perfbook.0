Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e39.co.us.ibm.com ([32.97.110.160]:46916 "EHLO
 e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1756110AbbBJBFB (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 9 Feb 2015
 20:05:01 -0500
Received: from /spool/local	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 9 Feb 2015
 18:05:00 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 9EF1A3E40030	for <perfbook@vger.kernel.org>; Mon, 9
 Feb 2015 18:04:58 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t1A14wwd50855974	for <perfbook@vger.kernel.org>; Mon, 9 Feb 2015 18:04:58
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t1A14w9S001996	for <perfbook@vger.kernel.org>; Mon, 9 Feb 2015 18:04:58 -0700
Date: Mon, 9 Feb 2015 17:04:56 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Remove a duplicate 'not'
Message-ID: <20150210010456.GJ4166@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1423528405-27006-1-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423528405-27006-1-git-send-email-namhyung@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Namhyung Kim <namhyung@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Feb 10, 2015 at 09:33:25AM +0900, Namhyung Kim wrote:
> Signed-off-by: Namhyung Kim <namhyung@gmail.com>

Good catch, applied, thank you!

							Thanx, Paul

> ---
>  defer/toyrcu.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
> index 9ec2963..220dfbe 100644
> --- a/defer/toyrcu.tex
> +++ b/defer/toyrcu.tex
> @@ -749,7 +749,7 @@ Despite these shortcomings, one could imagine this variant
>  of RCU being used on small tightly coupled multiprocessors,
>  perhaps as a memory-conserving implementation that maintains
>  API compatibility with more complex implementations.
> -However, it would not not likely scale well beyond a few CPUs.
> +However, it would not likely scale well beyond a few CPUs.
> 
>  The next section describes yet another variation on the reference-counting
>  scheme that provides greatly improved read-side performance and scalability.
> -- 
> 2.2.2
> 

