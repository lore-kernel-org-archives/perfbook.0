Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjHLW5y (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 12 Aug 2023 18:57:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB90D10CE
        for <perfbook@vger.kernel.org>; Sat, 12 Aug 2023 15:57:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 575A361D51
        for <perfbook@vger.kernel.org>; Sat, 12 Aug 2023 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691881073;
        bh=TXZ85adu10wgjKzf8wnds8xtX7AjUQL3ktNID65tl/I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rGZb/OHktcoW13p/UzVyKgvdVTsDfDQUAMfVGTMooaST2S4Pg3lGOF0ki5M/amkGX
         w2e/XqqQ9Rz23gTeiaJDIlBwWyhWnOC+e+oGQDmcUfilBHgCQh7MXCL7jypFIoqBMk
         /Zy2x6k3EiWpchImcHHh12qo3jP2UnkJUwraEUmx5L6to6riEzB/s+WtBdPXp79d2t
         J2jo528DKY/f3GbmyaU0GtF2WMf4FpqFyZdk9MqlwRaVmKKH7bUWJlxD6USGReY/Wj
         9RILnxgA4xKFqbblfko0SOoaXj2WEx1xmGT6toMXJtZRRIGK15uq+PkEd3IE35ddwH
         ayM4nu14VGExQ==
Date: Sat, 12 Aug 2023 15:57:52 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/4] bib/hw: Update CSIRAC entries
Message-ID: <e0e94277-b8e2-4da5-bc63-615e390c9cdc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc20978-26e4-8fa1-28a7-894dc8728615@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 12, 2023 at 05:41:36PM +0900, Akira Yokosawa wrote:
> Museum Victoria Australia's web site was reorganized in 2020.
> It has a nice "CSIRAC Collection" page now.
> The page at University of Melboune was also expanded in 2017.
> 
> Update their bibliographic info.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Very nice!!!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  bib/hw.bib | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/bib/hw.bib b/bib/hw.bib
> index 164af19a5ebf..6b35552ba94f 100644
> --- a/bib/hw.bib
> +++ b/bib/hw.bib
> @@ -145,20 +145,20 @@ and technical workloads.
>  
>  @unpublished{CSIRACMuseumVictoria,
>   Author="{Museum Victoria Australia}",
> - Title="{CSIRAC}: {Australia's} First Computer",
> - year="2004",
> + Title="{CSIRAC} Collection",
> + year="2020?",
>   note="URL:
> -\url{http://museumvictoria.com.au/csirac/}",
> - lastchecked="November 14, 2016",
> +\url{https://collections.museumsvictoria.com.au/articles/3145}",
> + lastchecked="August 10, 2023",
>  }
>  
>  @unpublished{CSIRACUniversityMelbourne,
>   Author="{Department of Computing and Information Systems, University
>  of Melbourne}",
> - Title="{CSIRAC}",
> - year="2006",
> + Title="{CSIRAC}: Our first computer",
> + year="2017?",
>   note="\url{https://cis.unimelb.edu.au/about/csirac/}",
> - lastchecked="February 27, 2021",
> + lastchecked="August 10, 2023",
>  }
>  
>  @unpublished{z80Wikipedia,
> 
> base-commit: 11e363b6d3d9c6df03067807beff2262d0654a69
> -- 
> 2.25.1
> 
