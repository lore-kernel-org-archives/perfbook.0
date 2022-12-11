Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiLKS4O (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Dec 2022 13:56:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD22C769
        for <perfbook@vger.kernel.org>; Sun, 11 Dec 2022 10:56:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AA0760DCB
        for <perfbook@vger.kernel.org>; Sun, 11 Dec 2022 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670784971;
        bh=yIbGJsV/QW6XZPZxvxkDOEgMx3l2/W0ht7JVVYJeI2Y=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kKILuWMfuTAE57DPV+a0Le47dxLziCY3Fd4d6Ise1nKakbnESjfBXrslO8b1KAoHk
         +WdRY5eliIspgBSmS4TiSPdtlJxrVYKMF2pEfvl3pXou+c2KmrJfOlv6LeBk+AyHSt
         eL3PcJX3AWqCMsUzE/drAMI4vj7kUggr1oACCUPvCCrwzTE66Im920Ie/yl90ti1S8
         8UdZTlEOTI05M9QEBu0WRgftnj5wYlRNnE5ymbZBiG0xQLaxzzSiAhYX+hvhXqwNmQ
         Ca1HZ3ZKnT94oeXnE2ZeasA64BwL5gKT4G52kSeN78jN3SNyeCGKhdaUpFLFGRD6dQ
         kW+yshTI/rSZg==
Date: Sun, 11 Dec 2022 10:56:11 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] Load amsmath before fvextra (for lineno v5.0)
Message-ID: <20221211185611.GI4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <53062ca0-0fe0-8cb3-5758-c77a010b8776@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53062ca0-0fe0-8cb3-5758-c77a010b8776@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 11, 2022 at 09:34:20PM +0900, Akira Yokosawa wrote:
> LaTeX package lineno v5.0 incorporated patching of amsmath code
> for compatibility. (Pre-v5.0 lineno needs a separate package
> linenoamsmath --- now obsolete --- for such compatibility.)
> This introduced the ordering requirement that lineno needs to be
> loaded after amsmath [1].
> 
> In perfbook, lineno is required by fvextra and amsmath is required
> by glossaries which is again required by glossaries-extra.
> Hence lineno is loaded before amsmath and causes a fatal error with
> lineno v5.0.
> 
> As a workaround, explicitly load amsmath before fvextra.
> 
> Link: [1] https://github.com/latex-lineno/lineno/issues/5
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> Hi,
> 
> Having seen no response from lineno's new maintainer for a couple
> of days, let's go forward and apply this otherwise harmless change
> in our preamble.
> 
>         Thanks, Akira
> -- 
>  perfbook-lt.tex | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 80e36084ed3b..d5383f07c5a6 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -55,6 +55,7 @@
>  \usepackage{pifont} % symbols for qqz reference points and carriagereturn
>  \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
>  \usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
> +\usepackage{amsmath} % lineno v5.0 (loaded via fvextra) needs amsmath in front
>  \usepackage{fancyvrb}
>  \usepackage{fvextra}[2016/09/02]
>  \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
> 
> base-commit: 4b38d9da63b7a90bcd2046df249b406bb465f5bd
> -- 
> 2.25.1
> 
