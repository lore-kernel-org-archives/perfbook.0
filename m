Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235442AbjGNPPJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 14 Jul 2023 11:15:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914DA2708
        for <perfbook@vger.kernel.org>; Fri, 14 Jul 2023 08:15:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24B4561D45
        for <perfbook@vger.kernel.org>; Fri, 14 Jul 2023 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689347707;
        bh=4uDD/rcNBHOgdr61XWfs1bHfzxKABU5cOLqrIlTbFnY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fp2FkCf8lqEg9tctG9k2RqBQkWDEyol6WWOqzvE+K8QH4tLDNaZoq4qulv6epUCqt
         QD0LS6aNdhMJPZAcFJagcN13tpIyyLZuBrULJ9jv+mo+WjOvgfXWGd5oiUx38AR4OP
         39lZUXs7Ju4Cm/LUO2Tj5ZkfqIIpV4qKSK6sXh2JTfwf88+XwaXOP3Yw77ktrHFb41
         Ab7yKy1RmJqnAKLLhfz61hJwS/h+EeAgVXUkNXsqH82PmeezVCU/9k7dHkFcFUqIjd
         JUma/Eev11ybQTH5LPYrg6iUw+GIdoYkXMHi3ujxbOZhsuEd2ZkREOre1bsp93NISR
         N9gv1G4QTVSpw==
Date: Fri, 14 Jul 2023 08:15:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] Don't run fixfonts for pstricks figures
Message-ID: <45115b17-ba95-448f-bd58-a0a099a2d084@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <f8a28118-e3e4-d3ef-faa6-6c874e5c463a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8a28118-e3e4-d3ef-faa6-6c874e5c463a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jul 14, 2023 at 11:07:37PM +0900, Akira Yokosawa wrote:
> fixfonts scripts don't have any effect on EPS files generated
> from pstricks + dvips.
> 
> Font in the figures should be specified in the source .tex files.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  Makefile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index bffdd2da1f4d..f25baf27d8ad 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -414,13 +414,11 @@ perfbook-a4.tex:
>  
>  # Rules related to perfbook_html are removed as of May, 2016
>  
> -$(EPSSOURCES_FROM_TEX): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(EPSSOURCES_FROM_TEX): %.eps: %.tex
>  	@echo "$< --> $(suffix $@)"
>  	sh utilities/mpostcheck.sh
>  	@latex -output-directory=$(shell dirname $<) $< > /dev/null 2>&1
>  	@dvips -Pdownload35 -E $(patsubst %.tex,%.dvi,$<) -o $@ > /dev/null 2>&1
> -	@sh $(FIXANEPSFONTS) $@
>  
>  $(EPSSOURCES_FROM_DOT): $(FIXANEPSFONTS) $(FIXFONTS)
>  $(EPSSOURCES_FROM_DOT): %.eps: %.dot
> 
> base-commit: b48ccb045d17f6d551ff210c74118f1769f66c63
> -- 
> 2.25.1
> 
