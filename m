Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:32808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbgLBDSQ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 1 Dec 2020 22:18:16 -0500
Date: Tue, 1 Dec 2020 19:17:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606879055;
        bh=qwS4yeByOg8HqYd977A8enS47HRQ8lBXC9kQPCn/ocw=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LKo4Ytb4wPD1BUKaWN7BkgT2TzBty1CtMONwsETq0v8IM9ioErNMsNcYO0i0SZAce
         zdEq+34AJRCPFZHja3EN6JorK4YxF4dUnfm2xBs+7ahVSriYqijmOhsUVIjrRvyyjz
         l0fd4koMPu+c6x/NMhvIXHqkM8Vk9FfXaE0s8tEk=
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] hw.bib: Mark broken link of Alpha wizard's archive as
 such
Message-ID: <20201202031735.GI1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <c930978c-e022-0961-4bc1-85d7f06497fb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c930978c-e022-0961-4bc1-85d7f06497fb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 02, 2020 at 07:29:20AM +0900, Akira Yokosawa wrote:
> >From 030e802355d7de125f9c32363d768380a35ac2bd Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Wed, 2 Dec 2020 07:25:49 +0900
> Subject: [PATCH] hw.bib: Mark broken link of Alpha wizard's archive as such
> 
> The Alpha wizard's archive under the hp.com domain no longer works.
> 
> This change is inspired by a recent commit in the -rcu tree from
> Paul Gortmaker.
> 
> Indirectly-reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/hw.bib | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/bib/hw.bib b/bib/hw.bib
> index 9b697a3b..b63b0622 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -290,8 +290,9 @@ System Programming",
>   Title="Shared Memory, Threads, Interprocess Communication",
>   month="August",
>   year="2001",
> - note="Available:
> -\url{http://h71000.www7.hp.com/wizard/wiz_2637.html}",
> + note="URL:
> +\nolinkurl{http://h71000.www7.hp.com/wizard/wiz_2637.html}
> +[broken, November 2020]",
>  }
>  
>  @unpublished{MichaelCree2010AlphaLinux,
> -- 
> 2.17.1
> 
