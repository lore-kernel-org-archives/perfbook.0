Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:44426 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752404AbcEAWDd (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 1 May 2016
 18:03:33 -0400
Received: from localhost	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 1 May 2016
 16:03:32 -0600
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 040E019D805E	for <perfbook@vger.kernel.org>; Sun, 1 May 2016 16:03:13 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u41M3T0239780404	for <perfbook@vger.kernel.org>; Sun, 1 May 2016 22:03:29 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u41M3Twm032529	for <perfbook@vger.kernel.org>; Sun, 1 May 2016 18:03:29 -0400
Date: Sun, 1 May 2016 15:03:31 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [FOLLOW-UP RFC PATCH] advsync: Minor fix of word choice
Message-ID: <20160501220331.GN3686@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <6cc7de73-01cd-a186-78c4-2cce19f74d31@gmail.com>
 <bc44e04e-2d2c-0000-a6e1-625e51d8fb62@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc44e04e-2d2c-0000-a6e1-625e51d8fb62@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 30, 2016 at 05:29:51PM +0900, Akira Yokosawa wrote:
> >From 67433ddbf67a7d37e83426fed98228c245408c89 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sat, 30 Apr 2016 17:08:03 +0900
> Subject: [FOLLOW-UP RFC PATCH] advsync: Minor fix of word choice
> 
> This should have been "the vertical line", not "the vertical bar".
> 
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>

I squashed this into your previous patch and also pulled in fixes for
a couple of grammatical nits.

Thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index dfbf0f3..9cc546c 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -378,7 +378,7 @@ Again, CPU~0 coordinates the test, so does not record any values.
>  All CPUs eventually agree on the final value of 9, but not before
>  the values 15 and 12 take early leads.
>  Note that there are fourteen different opinions on the variable's value
> -at time 21 indicated by the vertical bar in the lower diagram.
> +at time 21 indicated by the vertical line in the lower diagram.
>  Note also that all CPUs see sequences whose orderings are consistent with
>  the directed graph shown in
>  Figure~\ref{fig:advsync:Possible Global Orders With More Simultaneous Values}.
> -- 
> 1.9.1
> 
> 

