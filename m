Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjAWDAe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 22 Jan 2023 22:00:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89065FF37
        for <perfbook@vger.kernel.org>; Sun, 22 Jan 2023 19:00:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E699360C93
        for <perfbook@vger.kernel.org>; Mon, 23 Jan 2023 03:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674442828;
        bh=3hN8d0TFDLlhHlso6kr7fxpBZSLG+zQa+pTisDTEn54=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PGpmfgSM2jNRc61Q4usoMLIGxCncOUm4cUVDzCPn/qpnHlyGBlXBzR0pqbj0hnsVs
         8MyiCg6Pj9Qn8HXBGZY8S1ws4dS4DgNTYl9rLBHI7A74QHs17RJNPmYk4h+jv2Fzml
         evpVLw3wFTJj7mNj4g0hWzQbSFbpWOliiTsh1P3QQ0XqqJNAfbO/KHmwrDmrFN8+cs
         xYPtqcIAeu6OIaqxQcX7Rx1KEbjS/2RaEgbAaArue5v7397r1C3PkyX9IsEfTuwbA4
         cUtx2DTJ00Kol1p+GdSBoAX4K26FW+mhkdAoOW8xVOM2tBQhVaf1UwfY4NH0zD6yvL
         REOddkzApJvVw==
Date: Sun, 22 Jan 2023 19:00:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] toolsoftrade: Fix staccato of 'than'
Message-ID: <20230123030027.GM2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <5d614259-1abe-2174-a5e5-5b2089b5714b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d614259-1abe-2174-a5e5-5b2089b5714b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 23, 2023 at 10:29:43AM +0900, Akira Yokosawa wrote:
> Fixes: 542aac900b17 ("toolsoftrade: Add QQ about task-local storage in Linux kernel")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index ce8a9430b16e..fee34ae8a1df 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2599,7 +2599,7 @@ as will be shown in more detail in
>  	What do you do if you need a per-thread (not per-CPU!) variable
>  	in the Linux kernel?
>  }\QuickQuizAnswer{
> -	First, needing a per-thread variable is less likely than than
> +	First, needing a per-thread variable is less likely than
>  	you might think.
>  	Per-CPU variables can often do a per-thread variable's job.
>  	For example, if you only need to do addition, bitwise AND,
> 
> base-commit: 60bc6a0123d51fd4730411215465841c4ce8213c
> -- 
> 2.25.1
> 
