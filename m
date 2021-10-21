Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231738AbhJUQ6p (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 21 Oct 2021 12:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634835389;
        bh=TCYu1ra/a7L/uL9MzLpwumupdBbVALJn76Dg3G2LAwY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hYyG0KAs2nhy7b52iIjx/etDoAqM4r3ftkxiEIQsAuGZ4s9Pwd0hi0mgNaf1XelsI
         0FtZTRSfZJgRZNADGZ3WZhQDWQds8+cEeQ7cQtH1Eq/s815wrva/KZ2wRGqUNdOuCv
         pHiOxxHUVwjM3JXXFBeJAKkPTHfopaN80GDG7OlyvJ4WVQyyavAJE05TXmHm54sIq+
         aamAAK75V5b4apSToP0/t4aKqCViNzAz480Q8TE4jRjQE0VjwyOnZV6jDNoYWGB3yO
         FtMbsBH5E2Sv/ofUnLdRsyeQpDqU+Hjtp42M/eKgxly/B++mZNa0mfdkjHvMBoWqIo
         IaUU3q6SSc+2g==
Date: Thu, 21 Oct 2021 09:56:29 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] memorder: fix a typo in answer to QQ 15.33
Message-ID: <20211021165629.GS880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211021073251.8821-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021073251.8821-1-zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, luyang.co@gmail.com

On Thu, Oct 21, 2021 at 03:32:51PM +0800, Zhouyi Zhou wrote:
> In answer to Quick Quiz 15.33, update() here should be updater().
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> ---
> Hi Paul,
> 
> In answer to Quick Quiz 15.33, update() here should be updater().
> By the way, I tried to follow Akira's patch as an example to make a
> good looking patch ;-)

Good eyes, and the patch does look good, thank you!  Queued and pushed.

							Thanx, Paul

>    Thanks Zhouyi
> --
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index debfbcc3..eae93f9e 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2830,7 +2830,7 @@ instead of the expected value 144.
>  	not order later loads, only later stores.
>  	If you really need ordering, you could place an \co{smp_rmb()}
>  	between \clnref{equ,pc}.
> -	Or better yet, have \co{update()}
> +	Or better yet, have \co{updater()}
>  	allocate two structures instead of reusing the structure.
>  	For more information, see
>  	\cref{sec:memorder:Control-Dependency Calamities}.
> -- 
> 2.25.1
> 
