Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235392AbjIKIdb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 11 Sep 2023 04:33:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD7C110
        for <perfbook@vger.kernel.org>; Mon, 11 Sep 2023 01:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694421207;
        bh=f1/l7HqZH5ItEe2j+ZsjCR4ogJOaMe5nZz3k0G4sEbQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=l4ZRkivSGtPwZYp8sv4p4hIQjlXKWGhe5Qjg0PBTnVth+v2mM5M8WMvFBjtmeI5LW
         RUWjj7jcywao4gDpmDEXjX0GVj88kP+lLpF2ZmjJwm69dmKcZbjt6chYaG2pUstl5r
         1m2FAQ7rLJTaBkpBdJ1NdgILheHpwrGc+ZkwjcPLPM6olWb+cveQinYQR7LcJOBuq8
         CzDOycKV+jOkvdrMewq9RaEPir48jXmuaCv+/rwxs/IhEmKNEieLsWwPtjkybKdyyz
         GuBCbFfGF+9J+VkgKYkZyCZCowMj6veXAfW86eyn9hH8TqkbTCeTZYQTPRrVU4NYFM
         cCNVA5N4QVj9Q==
Date: Mon, 11 Sep 2023 01:33:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] memorder: Shrink Figures 15.1 and 15.2 in 2c
 builds
Message-ID: <af1790b9-41b1-4289-b936-7a6d5b43e551@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <1241d4bd-07c4-c358-9f89-760ac989065c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1241d4bd-07c4-c358-9f89-760ac989065c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 11, 2023 at 01:04:13PM +0900, Akira Yokosawa wrote:
> Figures 15.1 and 15.2 look unnecessarily large in 2c builds.
> Reduce their widths a bit by using \onecolumntextwidth.
> 
> This change doesn't affect -1c and -eb builds.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Figure 15.2 is now at the top of page 319.
> Figure 15.1 still appears in its own page. Tweaking the position
> of its definition in memorder.tex might help here, but it is not
> urgent, I guess.
> 
> You can find other uses of \onecolumntextwidth in figure*
> environment in memorder.tex.  I think it is a reasonable template.
> \textwidth is good for a figure with tiny fonts such as Figures
> 15.5 and 15.6.
> 
> --
>  memorder/memorder.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 6cf136b8dc6e..1a4edf8bbb6d 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -151,7 +151,7 @@ description.
>  
>  \begin{figure*}
>  \centering
> -\resizebox{\textwidth}{!}{\includegraphics{memorder/locktrans}}
> +\resizebox{\onecolumntextwidth}{!}{\includegraphics{memorder/locktrans}}
>  \caption{Locking Intuitions}
>  \label{fig:memorder:Locking Intuitions}
>  \end{figure*}
> @@ -262,7 +262,7 @@ description.
>  
>  \begin{figure*}
>  \centering
> -\resizebox{\textwidth}{!}{\includegraphics{memorder/relacqtrans}}
> +\resizebox{\onecolumntextwidth}{!}{\includegraphics{memorder/relacqtrans}}
>  \caption{Release-Acquire Intuitions}
>  \label{fig:memorder:Release-Acquire Intuitions}
>  \end{figure*}
> 
> base-commit: 2feb406642d90fac3fbbcc515d60d3573773a3f4
> -- 
> 2.25.1
> 
