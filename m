Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiL2FCz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 29 Dec 2022 00:02:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AC811A1A
        for <perfbook@vger.kernel.org>; Wed, 28 Dec 2022 21:02:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF0F661706
        for <perfbook@vger.kernel.org>; Thu, 29 Dec 2022 05:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672290172;
        bh=ZjnUNU7VFGQoY6iMxjz0heE1nMP6LDGNH09SaKfdttE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NgbRh6bCZzwJiywjyC7sPcMq8UvMZBnVU+6zP3QXtJX1FzFRbAX44R6hHdvQfF+JX
         c+/5nB2+a1CRBa4SIxrg/j31m/BuSgb+dRwJ3iRsgS/EXiwyo9XREdfzbr1O1DdX1U
         WmqgCqAigwzstqP1gXNgJhRrucZFU7f6PH/4b/00xpaUdHdrhuaZYyGhhlF2rnio5h
         2IRMsYvVJCnhJIMzYVqggi4uMfHR8hwbwaqWr+agtPSHUsR4aol6bUbWgUBIrqQDy6
         hkAFa2lreaY8CdEK8Ui2JwtSUKuwXHlbPML5zbwX/+Ya5F1wuXBadqhUJBAhEOl9w4
         VAR9qViu2BHIA==
Date: Wed, 28 Dec 2022 21:02:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Stick to LaTeX2e glossaries packages
Message-ID: <20221229050251.GM4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <97e4d950-10ce-1320-14e6-37e3c79a8870@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e4d950-10ce-1320-14e6-37e3c79a8870@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 28, 2022 at 09:12:30PM +0900, Akira Yokosawa wrote:
> Commit 55c6bfdbfd44 ("Stick to mfirstuc v2.07") added a rollback
> option to the mfirstuc package.
> 
> However, release note of glossaries-extra v1.49 [1] mentions related
> releases:
> 
>     This release is part of a set of inter-connected releases all
>     dated 2022-10-14: bib2gls v3.0, glossaries v4.50, mfirstuc v2.08
>     and glossaries-extra v1.49. If you update glossaries-extra, make
>     sure you update glossaries and mfirstuc as well (and bib2gls, if
>     you also use that).
> 
> , which suggests that sole rollback of mfirstuc might break
> in the future.
> 
> To be safe, let's rollback related packages all together.
> 
> The glossaries package needs to be loaded in front and needs
> options to be consistent with the "acronym" option and the
> (slightly different) default behavior of glossaries-extra.
> 
> Link: [1] https://www.ctan.org/ctan-ann/id/mailman.1406.1666295591.3715.ctan-ann@ctan.org
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!!!

							Thanx, Paul

> ---
>  perfbook-lt.tex | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index d5383f07c5a6..2c14114e246d 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -82,8 +82,11 @@
>  \usepackage[all]{hypcap} % for going to the top of figure and table
>  \usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
>                                % indexing macros
> -\usepackage[acronym]{glossaries-extra}[2020/02/13]
> -\usepackage[longragged]{glossaries-extra-stylemods}
> +% rollback glossaries related packages as well
> +\usepackage[toc,nopostdot,acronym]{glossaries}[=v4.49]
> +\usepackage{glossaries-extra}[=v1.48]
> +\usepackage[longragged]{glossaries-extra-stylemods}[=v1.48]
> +
>  \usepackage{epigraph}[2020/01/02] % latest version prevents orphaned epigraph
>  \setlength{\epigraphwidth}{2.6in}
>  \usepackage[xspace]{ellipsis}
> 
> base-commit: e586ea257972bb2bb5b7e378fd4ddf6ffbfe8318
> -- 
> 2.25.1
> 
