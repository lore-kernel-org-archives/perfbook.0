Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbjEUK1S (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 21 May 2023 06:27:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB51184
        for <perfbook@vger.kernel.org>; Sun, 21 May 2023 03:20:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8F3E60E74
        for <perfbook@vger.kernel.org>; Sun, 21 May 2023 10:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684664443;
        bh=lybib1MuE1dsuLiH3nv7cn8slZ8BCzzXALqhB134/g0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=K8QYRoIut5yeiInIjpTd7WG4oG92PlgS7kX5Jy1Q9V+O5hKMe2Lbnb/1xHQShmEZe
         Xmsd5ghuyJY68cDDD6FSQMaQMEesVLa6AKN7uZMDbg7erycYWJrejsUNeofJsXZA8S
         2eZPLdW4+1abcYhJAySDo+DkqsCSTzMUverx6Z/OsFjWewVc8Dgl+PXqUlii8SW/DR
         8ryHv9mvViGQ1sSvtl7ZFffW3lKSih/ny4hPQXXTj/qfE40991LtWvWZnpz3Fx91Wh
         9SkxTkjrbMHOuUlzsQrrsy+oMDQBP7Nq1ErDdChvnrEgYinvxAcWYmnhu5yTmQDnUw
         XPN7T3UI4DmHg==
Date: Sun, 21 May 2023 03:20:40 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
Message-ID: <779cf72a-ab43-4b52-96be-8cd02ced105e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230514145123.37079-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514145123.37079-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, May 14, 2023 at 02:51:23PM +0000, Alan Huang wrote:
> The third step and the fourth step seem to have no causal relationship between them.
> Therefore, this patch explains under what circumstances both counters will be at least 1.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  formal/spinhint.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index 16764aef..dd2e88cc 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -1103,8 +1103,9 @@ follows:
>  	execution.
>  \item	The counter corresponding to this reader will have been
>  	at least 1 during this time interval.
> -\item	The \co{synchronize_qrcu()} code forces at least one
> -	of the counters to be at least 1 at all times.

So this part is true and fundamental to understanding the code.  You can
see this on lines 31-33 of Listing 12.14 ("QRCU Updater Process").
This code increments the next counter before decrementing the previous
counter.  I therefore don't see how we can reasonably delete this item.

> +\item	If the counter corresponding to this reader is 1, then
> +	the other counter is at least 1 because of the completion of
> +	counter flip.

However, we could potentially add this as an intermediate consequence
of items 2 and 3.  Maybe something like this?

\item	The above two items imply that if the counter corresponding
	to this reader is exactly one, then the other counter must be
	greater than or equal to one.  Similarly, if the other counter
	is equal to zero, then the counter corresponding to the
	reader must be greater than or equal to two.

>  \item	Therefore, at any given point in time, either one of the
>  	counters will be at least 2, or both of the counters will
>  	be at least one.

Would that help, or am I missing your point?

							Thanx, Paul
