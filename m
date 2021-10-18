Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231634AbhJRQGl (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 18 Oct 2021 12:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634573070;
        bh=E3if0OSyBVpaPuwyyEvLM5HswXz7vey2uX8+gS3UC64=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Ili3mmgrd+XuXne8klttfgDbC2JfsYUZdmaX3dANhoTKjJcLVXhsAzqBb8o70xGoE
         aqnI8iDMcShz/SAHDK+lqzQ75bZWXWcagv0QhlOsCyIZ7zGyTrHAhzKSNOKtJycPlp
         Tt4DFXRU40QJdl4XqHdcdOPEBH47T3LV3ylJwFVQRlsYc9a1TcbuccGkZH3jRYaUL4
         3p2bjgFTsSpFiKEnD5mzA7z0BhW3WGNGdu+YguJzPMH/oFlyndWrNAeOFFWPyZqeKx
         PbyFZpJpefr8r2TwHmQY+yk/Q4r/emLHR3bUVE/T4RV0mjCSCQ++xnCOP9J7/oQdDK
         pXGNLy204c8gw==
Date: Mon, 18 Oct 2021 09:04:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 1/5] toolsoftrade: Consistently add parentheses to
 function names
Message-ID: <20211018160430.GR880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211018084439.7112-1-sj38.park@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018084439.7112-1-sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Oct 18, 2021 at 10:44:35AM +0200, SeongJae Park wrote:
> Parentheses are appended to all function names including 'mythread()',
> but one case is not.  This commit adds parentheses there.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>

Queued and pushed the series, thank you!

							Thanx, Paul

> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index c9f5b399..b2694da2 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -344,7 +344,7 @@ ID of the thread to be created, the second \co{NULL} argument is a pointer
>  to an optional \co{pthread_attr_t}, the third argument is the function
>  (in this case, \co{mythread()})
>  that is to be invoked by the new thread, and the last \co{NULL} argument
> -is the argument that will be passed to \co{mythread}.
> +is the argument that will be passed to \co{mythread()}.
>  \end{fcvref}
>  
>  \begin{listing}
> -- 
> 2.17.1
> 
