Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236226AbjFLNrS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 12 Jun 2023 09:47:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEF11B8
        for <perfbook@vger.kernel.org>; Mon, 12 Jun 2023 06:47:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0C21C615DA
        for <perfbook@vger.kernel.org>; Mon, 12 Jun 2023 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686577634;
        bh=Alph6T5iSEBCeo8H/XsT22FzYjzwUB1dPqMVYfHDbFw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=MWbUyrTbOQsFQiO48Z8/lD5gk9yDGBQXTXvoT5PoysGAJtHGgFFxPQ34B1PxvssJL
         EgudmpTSsgAPExibkn8cPOL/3SwVH5Cd1zBhY5AGmAn22AWnwRuxkZmI2xzJQwlxPg
         islMJknAvpDiBNd49TkBQM4mAyfd6XkLx9PXY28Ap3DQO8WPReFGUKPT+SZyRU3aDh
         a4zEzzEasgJ80CSjLC/K5eFkuZbMd1FPdi8Dvg97oBceZG4VvezcY5ENPOWZyGtSlO
         m8tBjzfmCNGCCyJjjpIeKyvLO+tn5FMpQeiXrvC+7Te6KQ8xoGbMSSQr6Pc9HCSnlS
         BYQbHHvgzzrYQ==
Date: Mon, 12 Jun 2023 06:47:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] fixsvgfonts.sh: Convert sans-serif into
 'DejaVu Sans'
Message-ID: <ffac8836-fc43-4ac1-b57f-830417ebf93f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <4ab19efc-4940-c1f9-71cf-221cb048e86e@gmail.com>
 <882ffa53-f280-da10-abf7-cf50618ccce7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <882ffa53-f280-da10-abf7-cf50618ccce7@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jun 12, 2023 at 06:41:59PM +0900, Akira Yokosawa wrote:
> Depending on fontconfig setting of a build system, it chooses
> one of available sans-serif font families for generic font in
> SVG files while SVG --> PDF conversion by Inkscape.
> 
> utilities/fixsvgfonts{-urwps}.sh scripts explicitly converted it
> into "Nimbus Sans", which is a clone of Helvetica.
> 
> "DejaVu Sans", which originated from "Bitstream Vera", is slightly
> wider than Helvetica and it is the fallback of Paul's setting.
> 
> Update fixsvgfonts{-urwps}.sh so that the explicit conversion meets
> Paul's expectation.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> This change assumes "fc-match sans-serif" returns "DejaVu Sans"
> under your setting.  The slight width mismatch causes texts you
> centered inside boxes to be left shifted slightly.
> 
> If you don't see "DejaVu Sans" from the command above, what does
> it say?

$ fc-match sans-serif
DejaVuSans.ttf: "DejaVu Sans" "Book"

So it appears you assumption is correct.

You know, I distinctly recall a time when the concern was a lack of
machine-usable fonts.  ;-)

Queued and pushed, thank you!!!  The new look of Figure 15.2 is much
improved, very good!

							Thanx, Paul

>         Thanks, Akira
> --
>  utilities/fixsvgfonts-urwps.sh | 2 +-
>  utilities/fixsvgfonts.sh       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utilities/fixsvgfonts-urwps.sh b/utilities/fixsvgfonts-urwps.sh
> index 21eb15349063..5af10514a4d8 100644
> --- a/utilities/fixsvgfonts-urwps.sh
> +++ b/utilities/fixsvgfonts-urwps.sh
> @@ -8,7 +8,7 @@
>  sed	-e 's+:Helvetica+:Nimbus Sans+g' \
>  	-e 's+="Helvetica+="Nimbus Sans+g' \
>  	-e 's+:Sans+:Nimbus Sans+g' \
> -	-e 's+:sans-serif+:Nimbus Sans+g' \
> +	-e 's+:sans-serif+:DejaVu Sans+g' \
>  	-e 's+:Courier+:Nimbus Mono PS+g' \
>  	-e 's+="Courier+="Nimbus Mono PS+g' \
>  	-e 's+:monospace+:DejaVu Sans Mono+g' \
> diff --git a/utilities/fixsvgfonts.sh b/utilities/fixsvgfonts.sh
> index 1fa4fedb2829..d75becdeef81 100644
> --- a/utilities/fixsvgfonts.sh
> +++ b/utilities/fixsvgfonts.sh
> @@ -8,7 +8,7 @@
>  sed	-e 's+:Helvetica+:Nimbus Sans L+g' \
>  	-e 's+="Helvetica+="Nimbus Sans L+g' \
>  	-e 's+:Sans+:Nimbus Sans L+g' \
> -	-e 's+:sans-serif+:Nimbus Sans L+g' \
> +	-e 's+:sans-serif+:DejaVu Sans+g' \
>  	-e 's+:Courier+:Nimbus Mono L+g' \
>  	-e 's+="Courier+="Nimbus Mono L+g' \
>  	-e 's+:monospace+:DejaVu Sans Mono+g' \
> -- 
> 2.25.1
> 
> 
