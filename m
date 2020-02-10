Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727518AbgBJNyL (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 10 Feb 2020 08:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581342851;
        bh=d96faYqwNNIegjsy7GBt4eaOUT9i2fOjWWiR36ucX6A=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YXXaSphBc9lUGbnnAtpC+4VfNVw56366fMbTSU+SU9WMS5lQOhJ4SQLPiYmxdb5ms
         leWxgqhdzgiYQXoUaSFrhrpeczeqTt27zHDqfMWdvsCLX02MlqfhFc5fTYvsmYRQa/
         Q9lSQC/nu4BSvosB7sR0GAE8Ri5fTO2pYmNSSlW0=
Date: Mon, 10 Feb 2020 05:54:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] utilities/toarxiv: Copy up-to-date 'fvextra and
 'epigraph'
Message-ID: <20200210135409.GW2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3cd61bd0-40a0-bb56-57aa-95422018e628@gmail.com>
 <b98f9e1c-88c1-2eee-aa26-900fa60064b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b98f9e1c-88c1-2eee-aa26-900fa60064b5@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Feb 09, 2020 at 01:11:48PM +0900, Akira Yokosawa wrote:
> >From d42192f39128f32b145eed4de36002457b8ed085 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 9 Feb 2020 07:39:16 +0900
> Subject: [PATCH 2/2] utilities/toarxiv: Copy up-to-date 'fvextra and 'epigraph'
> 
> The version of arxiv's TeX Live is 2016 at the moment.
> As we depend on "fvextra" and up-to-date "epigraph" now, we need to
> copy their .sty files into the bundle to upload.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> As I can't test the behavior of arxiv's build system,
> I'm not sure this patch actually works as expected.
> 
> I'd like you to test the resulting bundle on arxiv.

This looks to work, queued and pushed, thank you!

I am sure that toarxiv.sh will need help from time to time, but that is
just life.  ;-)

								Thanx, Paul

>         Thanks, Akira
> --
>  utilities/toarxiv.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/utilities/toarxiv.sh b/utilities/toarxiv.sh
> index 5e1c6388..f126eb5f 100644
> --- a/utilities/toarxiv.sh
> +++ b/utilities/toarxiv.sh
> @@ -54,6 +54,8 @@ find */ -type d -print |
>  	sh
>  
>  cp autodate.tex glossary.tex origpub.tex contrib.tex legal.tex qqz.tex origpub.sty qqz.sty pfbook.cls pfhyphex.tex perfbook.bbl ${destdir}
> +cp `kpsewhich fvextra.sty` ${destdir}
> +cp `kpsewhich epigraph.sty` ${destdir}
>  
>  find */ '(' -name '*.pdf' -o -name '*.lst' ')' -exec cp {} ${destdir}/{} \;
>  
> -- 
> 2.17.1
> 
> 
