Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjCSDnh (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 18 Mar 2023 23:43:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2DFD524
        for <perfbook@vger.kernel.org>; Sat, 18 Mar 2023 20:43:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D1D06B8013A
        for <perfbook@vger.kernel.org>; Sun, 19 Mar 2023 03:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679197413;
        bh=avrlHk8eNy9dF/mnvTaC02SoJYx0zQmHvHKe9fFklXo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZeCdGyRiYJJp/AJ4AoirYruvEDo9ckod6QDZx0ocgooRxYObGkqrq2pB9/MJ/g9Y1
         IN8ZTaDtMEVWvbqd5stzYUMcyAdPDDL+yrxq/qjsHZOfRAekOqvJ/Kn+Zo5g67J1g9
         YIagJm2bzzIj4HWw2D4RoBb+jvfgKfuWylBlYqqCv+R2Q8R7ewNWGVL5DBHL+ZeJQa
         XpaHZRNpuZooAVdXGfzN5hh0isKe0iitt9/ACy8wMnilINjWwyU4jVbMggymi7bRi7
         eoOvwtZ79z5UGtlBBspXIkFkxJO7Bi4wrMwp1SZcAlEksSN5zZTkMEmo+mtfHrxFVz
         GsYqq920xXuWw==
Date: Sat, 18 Mar 2023 20:43:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/3] Fix warning of missing font shape
Message-ID: <f0e335c6-6425-4277-a179-e7a040710497@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <475eb10b-a10c-a3ec-0651-b122f00bdff0@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 19, 2023 at 08:41:11AM +0900, Akira Yokosawa wrote:
> Since commit 6be27f7414d8 ("Use Biolinum font family for epigraph"),
> new warning messages appear in the .log file which read:
> 
>     LaTeX Font Warning: Font shape `OT1/minntx/sb/n' undefined
>     (Font)              using `OT1/minntx/m/n' instead on input line 622.
> 
>     LaTeX Font Warning: Some font shapes were not available, defaults
>     substituted.
> 
> This is because the netwxmath package detects boilinum/libertine fonts
> which have semi-bold shape and sets the option of semi-bold shape
> for bold math on top of newtxtext's default font (Times Roman clone),
> which doesn't provide semi-bold shape.
> 
> Using 'OT1/minntx/m/n' for bold math means it will be rendered in
> normal (non-bold) shape.
> 
> This might be a bug in newtxmath, but can be avoided by moving the
> load of biolinum after the load of newtxmath.
> 
> Currently, perfbook doesn't use \mathbf{} and there is no visible
> defect in rendered math equations.  But it is better to fix this
> potential regression sooner rather than later.
> 
> After loading biolinum, restore newtxtext's \sfdefault (Helvetica
> clone).
> 
> Fixes: 6be27f7414d8 ("Use Biolinum font family for epigraph")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed all three, thank you!

							Thanx, Paul

> ---
>  perfbook-lt.tex | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index f970212cb194..efb49bd0abe7 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -13,7 +13,6 @@
>  
>  % A more pleasant font
>  \usepackage[full]{textcomp} % use symbols in TS1 encoding
> -\usepackage{biolinum}
>  \usepackage{lmodern}
>  \usepackage[T1]{fontenc} % use postscript type 1 fonts
>  \usepackage[defaultsups,helvratio=0.9]{newtxtext} % use nice, standard fonts for roman
> @@ -324,6 +323,9 @@
>    \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
>  }
>  }
> +\usepackage{biolinum}
> +% restore \sfdefault of newtxtext
> +\renewcommand{\sfdefault}{qhv}
>  
>  \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
>  
> 
> base-commit: 2d2853f4b29d0369dd3b64435d5a53203380cf96
> -- 
> 2.25.1
> 
