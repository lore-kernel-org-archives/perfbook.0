Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjHDRyz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 4 Aug 2023 13:54:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278C84C02
        for <perfbook@vger.kernel.org>; Fri,  4 Aug 2023 10:54:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C6DB620D7
        for <perfbook@vger.kernel.org>; Fri,  4 Aug 2023 17:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691171692;
        bh=UGg0JRXSoBhgpA3OiK8JIYEBTiaFYTCrloC3mm6Ptas=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ByWw2FBmdKrBgnNTrSVLH0ypmyMByVbktYalUnkX7FoxrDKZ0qofgzEJGqZcsi2B2
         FZr0z77Z1JZC3AR40L6vFCcJnxxDj1YxMJQWFbwBhVVZHcV95L4CWGALrki+qy8F2z
         2tfxMZ8E+KFlb8MxMi4/4GTlwFSNAmqJGf5m5EdBTDbsELRWtWsssj2cHQDUINd1OY
         D0rG5YHuMm0gBBOeH4nVL2wWbQ+CI1tr9FgWtu8So1JQZkwqfvwcxzOetttCaoBNph
         NPtHYEaie+O8hN3DnAy1LrMl87f60Hn9YbY1h4DiIoG+jIwEN09+9K39AlR6sD8Zc0
         gq4OqDPplLO7A==
Date: Fri, 4 Aug 2023 10:54:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] utilities/gitlab-ci: Fully update system before building
Message-ID: <90f6becb-6b84-483a-ad61-6d3de58b7942@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230804174136.1142358-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804174136.1142358-1-leobras.c@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo Bras <lsoaresp@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Fri, Aug 04, 2023 at 02:41:34PM -0300, Leonardo Bras wrote:
> Some recent CI errors come from the incompatibility between packages
> pre-installed in the docker image and the ones installed via pacman.
> 
> To avoid this, make a full system upgrade when installing the needed
> packages.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  utilities/gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 544b9373..bcda8712 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -9,7 +9,7 @@ test_codesamples:
>      stage: test
>  
>      before_script:
> -        - pacman --noconfirm -Sy make gcc liburcu
> +        - pacman --noconfirm -Syu make gcc liburcu
>  
>      script:
>          - make -C CodeSamples/
> @@ -19,7 +19,7 @@ generate_pdfs:
>      stage: build
>  
>      before_script:
> -        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
> +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-liberation
>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.regular.ttf ~/.local/share/fonts/ && fc-cache
>  
>      script:
> -- 
> 2.41.0
> 
