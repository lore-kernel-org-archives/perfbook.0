Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbjDMPKo (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 13 Apr 2023 11:10:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8655B93CA
        for <perfbook@vger.kernel.org>; Thu, 13 Apr 2023 08:10:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 222D063F7B
        for <perfbook@vger.kernel.org>; Thu, 13 Apr 2023 15:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681398628;
        bh=IsXy7bpMC3wNLPz90UUCkzGD2C2M5q2Xo6pEgRVlw8w=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=qxpfeAkznBeNBDhXkajn1rjVe8c13un1misgz/fnZqC3NFtKCgSehkAHRaCUw8Y3w
         FHVwt2ZBPV2DdBtQcSH8uEtz0AE6vRrnnAPGCGQzjwij0fxYp96BsK6nTXRUMiiSaA
         RrCMpHK+TnysJQxmCsFHv1mQze6gu7zQmk38w9uaDubGLA6JVu9Zu6QLCjTTnN0VYm
         8JJxFmMHs/SoPOzK0hW0PIhvwfdYs9WA+QOjulewbjGNjA4KBL4reNkcafK9m3gPoQ
         E97wnVvbtk3LtgDqrjNPpYqRreOhEYA2IgGbZ7Z3LAusou/ZN46tqZ2pdhqTflA8Ri
         o1G90Ifc2vOLg==
Date: Thu, 13 Apr 2023 08:10:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] count: Correct grammar in QQz 5.50
Message-ID: <e56e96d7-0923-4d3c-8c42-c3e7d5ff6996@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <7b762b1f-7a03-0e42-abf9-718fa85546ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b762b1f-7a03-0e42-abf9-718fa85546ad@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Thu, Apr 13, 2023 at 07:19:47PM +0900, Akira Yokosawa wrote:
> Make adverbial phrase look as such.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catch, thank you!  Queued and pushed.

							Thanx, Paul

> ---
>  count/count.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index ccc2e839e5ed..7b2fde109490 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -2440,7 +2440,7 @@ the fastpath happens before this change of \co{theft} to READY\@.
>  \end{listing}
>  
>  \QuickQuiz{
> -	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions}'s
> +	In \cref{lst:count:Signal-Theft Limit Counter Value-Migration Functions},
>  	doesn't \co{flush_local_count_sig()} need stronger memory barriers?
>  }\QuickQuizAnswer{
>  	No, that \co{smp_store_release()} suffices because this code
> 
> base-commit: b66ea50d370a6b028487d19e6857718d8e703f7c
> -- 
> 2.25.1
> 
