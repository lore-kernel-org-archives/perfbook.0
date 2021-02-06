Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230038AbhBFPYn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 6 Feb 2021 10:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612625042;
        bh=kZTNl1aZNemYONrO5Crkav7V3XAaEo1KPAt0Gf3nzzM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SLRwg0YTGorPpBFERdcv6dvRFI8UGT6QNfAVP7MyEkpJmxNL7sH1yyFEKdwXKSd6z
         Gdn4DdnpCl6JyY/xm3pFLuog70KB6fwySRpQcVkMt5+OWj2wQb5aKgTAoMg7uOdtdi
         32x48tUHgc5Dkkgl5/yoHbZCtzNTuzPF8iwCKnZ6P9x4NgSk5bIyfcb1motZbY1Wbb
         iP+vMBmWcc5iGZ1jkidLNUQ8SEuxft4lDX5bMCebJMaYQEZaF7UxSrqCNRnSjbgEYQ
         49MXHfNlmneZfN8C2MlcPn/3gKC1gbQbn+D3LFQ0CQw5hzi3iMd9zfNfm7syfsYsf5
         m5m35Xi/ov8Yg==
Date: Sat, 6 Feb 2021 07:24:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Remove \OneColumnHSpece{} in
 sidewaystable
Message-ID: <20210206152402.GP2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3cfa5941-656f-6feb-f73f-e5de214ac891@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cfa5941-656f-6feb-f73f-e5de214ac891@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Feb 06, 2021 at 07:21:42PM +0900, Akira Yokosawa wrote:
> The adjustment for 1c layout causes the sideways table to have wrong
> vertical margins.
> 
> Fixes: b03d63b42edf ("defer: Add Tasks Rude and Tasks Trace RCU to the API table")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
>  defer/rcuapi.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
> index fb65621e..29680318 100644
> --- a/defer/rcuapi.tex
> +++ b/defer/rcuapi.tex
> @@ -51,7 +51,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
>  \centering
>  \caption{RCU Wait-to-Finish APIs}
>  \label{tab:defer:RCU Wait-to-Finish APIs}
> -\scriptsize\OneColumnHSpace{-.9in}
> +\scriptsize
>  \begin{tabularx}{8.5in}{>{\raggedright\arraybackslash}p{0.94in}
>      >{\raggedright\arraybackslash}X
>      >{\raggedright\arraybackslash}X
> -- 
> 2.17.1
> 
