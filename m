Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240887AbiKQV4g (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 17 Nov 2022 16:56:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48381720A0
        for <perfbook@vger.kernel.org>; Thu, 17 Nov 2022 13:56:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7D83621A3
        for <perfbook@vger.kernel.org>; Thu, 17 Nov 2022 21:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668722171;
        bh=mzF5ZNhvzVUB/0QF01lJ0985jM8sSdWjhJYNAPphZv0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=EYVSlNXL1f9SpIjuWoTOYRUOmbEXPwIijN4EJg15pW0XXDFeLjIKGpBciOS8XUWTM
         94vAoKzoDHIXlbcofSaORxQu3tDAlOji3UGgqUS9Z1HakGphb61JR+3ekkLpBTQJDf
         N7gmwrkRKWeQugel8wDzPjyFNlCBmGj/7PX0zt3pqgavWgk46RXtihJ3FikZjFZOKr
         5MLmYonWJv1Bx3Ojmr9/R5C7l+SA/XE/lBTiATmBlhsz/ZQs7e6ys+iTf1fLICDGQg
         8i6ejdcRK/wB930x6TVimOsyO4ZI7LthBui+wKagj6Bu1PF7vJqTrJaUZktkaVX99x
         GKlxwu3blu7zg==
Date: Thu, 17 Nov 2022 13:56:10 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] RCU fundamentals: reader is access_route() not
 read_gptr()
Message-ID: <20221117215610.GH4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221117074425.157105-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117074425.157105-1-e2lahav@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 17, 2022 at 02:44:26AM -0500, Elad Lahav wrote:
> Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Good eyes!

I queued and pushed both of them, thank you!

							Thanx, Paul

> ---
>  defer/rcufundamental.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
> index 87dfaa95..4abd9d07 100644
> --- a/defer/rcufundamental.tex
> +++ b/defer/rcufundamental.tex
> @@ -56,7 +56,7 @@ It is instead necessary to inform both the compiler and the CPU
>  of the need for care, as can be seen from
>  \cref{fig:defer:Publication/Subscription Constraints},
>  which illustrates interactions between concurrent executions of
> -\co{ins_route()} (and its caller) and \co{read_gptr()} from
> +\co{ins_route()} (and its caller) and \co{access_route()} from
>  \cref{lst:defer:Insertion and Deletion With Concurrent Readers}.
>  
>  The \co{ins_route()} column from
> -- 
> 2.34.1
> 
