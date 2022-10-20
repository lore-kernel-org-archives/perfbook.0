Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiJTXve (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 20 Oct 2022 19:51:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91617229E5F
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 16:51:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 62A77B826C4
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666309889;
        bh=dbs/S07wn54F9Cm0+Wnj95/xYC9yJvqkeyoC48srkdY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ooHi+aFBzN+QJ1LMZyqsCt4NfCvTGRXgyKmfU0XYj3LcDX3HH7vuwBbh9Q/nlYWn8
         C8rP3skj8mDxauDel7jiB03M4wqpMdnzhLDWd7uv+eK/ZnpM4q8nId3mHWcJPCzOZ4
         geXUoYHfkgciJ8PBuMh/pD+9gQ3wPM/mzTAl7zj1el7EGbMoo28TVDDGZK0EkSgDQc
         /VMuALxpJZFR2WzsOQMDDSIT9xc+69upaN4lcrcdJ/tyfnqbGAL2IP45DROdQpsgXP
         GHza8nX+BftjCiNbTRa/2Zj/DzMHK1nvtD7YCT3+HbUIDJWK4EM/eU04Etp4Q/swuL
         k3cwGCaEmQZFw==
Date: Thu, 20 Oct 2022 16:51:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Stick to mfirstuc v2.07
Message-ID: <20221020235128.GF5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <db2a9f79-dcf9-6d04-3517-be4317fed1bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db2a9f79-dcf9-6d04-3517-be4317fed1bd@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Oct 19, 2022 at 10:47:53PM +0900, Akira Yokosawa wrote:
> Version 2.08 of LaTeX package "mfirstuc" (indirectly loaded via
> "glossaries-extra") is a re-implementation using modern LaTeX3
> commands.
> 
> Unfortunately, it is not compatible with our indexing macros and
> build scripts due to the use of mfirstuc's internal macros.
> 
> Newer versions of mfirstuc understand an option [=v2.07] and roll
> back to the earlier version [1]. Therefore, as a work around, load
> it explicitly with that option before loading glossaries-extra.
> It does not affect builds on a system where an earlier version
> of mfirstuc is installed.
> 
> Link: [1] http://mirrors.ctan.org/macros/latex/contrib/mfirstuc/mfirstuc-manual.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> A recent update of mfirstuc broke perfbook builds.
> Looks like I had trespassed the mfirstuc's internal code when
> I tweaked the automatic capitalization of indexed terms/names.
> 
> In LaTeX community, LaTeX3 provides an easier-to-program syntax for
> package writers and it is getting popular day by day. Most of those
> re-implementation have not affected perfbook, but here comes such
> a day.
> 
> In the longer term, I might be able to come up with a better
> approach for future compatibility. I can't promise anything at the
> moment, though.

Longer term, some sort of conversion might be needed.  But in the
near term, queued and pushed, thank you!

							Thanx, Paul

> --
>  perfbook-lt.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 9cde2e4d42e5..80e36084ed3b 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -79,6 +79,8 @@
>  \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
>  \usepackage{footnotebackref} % to enable cross-ref of footnote
>  \usepackage[all]{hypcap} % for going to the top of figure and table
> +\usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
> +                              % indexing macros
>  \usepackage[acronym]{glossaries-extra}[2020/02/13]
>  \usepackage[longragged]{glossaries-extra-stylemods}
>  \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
> 
> base-commit: c2dc57ae109050a8a252278c73158292bb4b9512
> -- 
> 2.25.1
> 
> 
