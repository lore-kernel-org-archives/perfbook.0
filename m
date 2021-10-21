Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231976AbhJUQ7R (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 21 Oct 2021 12:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634835421;
        bh=8JRZ78EBx7sHsZLvOQGn54+uzb2vkd6kidE84NJiZlE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SLBecPRVh5bhasSh65rwyez55BwjVGGleIEajxt9d3+0sX3QjCIcNM2AjORFHMtLb
         PxaQG3WilOXsTIyV0MrLaBbGp7HCqfSaW08LQbnZzz+FgKHU9VDY6oBVB2ICbusEXL
         9yHbXPxpdV3kotZPW9Ucl4FxoO2IDqksxhTk3oIuhGy3xvVU4n/sdC8LrfbiP9r9Vs
         yurS108/SBl7buWogtNL+/aHaza8zkB9uD8Nw8WWw29/JGcs+2LpPnidSqsMbdz4dU
         xvYS+LwQCe5rw8ByaEjAUGk4C9gSCGZwtrvjkep5kXjItR8xPMEDT/jxmdISlGk5ap
         FI/CDpQhRem+A==
Date: Thu, 21 Oct 2021 09:57:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] advsync: Fix the abstract description of the
 queuetorture.h
Message-ID: <20211021165700.GT880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211021134209.16872-1-shiyn.lin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021134209.16872-1-shiyn.lin@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Chin En Lin <shiyn.lin@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Oct 21, 2021 at 09:42:09PM +0800, Chin En Lin wrote:
> The words should describe queuetorture.h instead of deqtorture.h.
> Also, add the parentheses to 'create_thread' in the comments of
> concurrent_pop.
> 
> Signed-off-by: Chin En Lin <shiyn.lin@gmail.com>

Good catch!  Queued and pushed, thank you.

							Thanx, Paul

> ---
>  CodeSamples/advsync/queuetorture.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/CodeSamples/advsync/queuetorture.h b/CodeSamples/advsync/queuetorture.h
> index 29743ef5..c02d4736 100644
> --- a/CodeSamples/advsync/queuetorture.h
> +++ b/CodeSamples/advsync/queuetorture.h
> @@ -1,5 +1,5 @@
>  /*
> - * deqtorture.h: torture tests for double-ended queue.
> + * queuetorture.h: torture tests for simple queue.
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License as published by
> @@ -82,7 +82,7 @@ void *concurrent_push(void *arg)
>   * Dequeue as specified by the q_test structure. This may be called
>   * directly (in which case the number of elements to be popped must
>   * be exactly that required and the specified goflag already set to
> - * GOFLAG_START), or via create_thread.
> + * GOFLAG_START), or via create_thread().
>   */
>  void *concurrent_pop(void *arg)
>  {
> -- 
> 2.25.1
> 
