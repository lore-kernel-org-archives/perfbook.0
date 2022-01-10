Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237275AbiAJQYa (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 10 Jan 2022 11:24:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B191DC06173F
        for <perfbook@vger.kernel.org>; Mon, 10 Jan 2022 08:24:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76F14B81693
        for <perfbook@vger.kernel.org>; Mon, 10 Jan 2022 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641831867;
        bh=3W62OstQeJ0UoGlk7EGLVOha/2WkMBX3YTFdoTwihMY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=szrrfe6d9asR0cvaKFD2vwiT51HSjku2nfz024zbI2bO0z81dXUtOVuOjOwtlptqD
         n9gygj9SZ60rwFphWcDalwZfWXOL2VPmiOwCuDPEu3YFZfIPZlDBAY1IEoMuUcjt4Q
         f6e0Rj1eh+TSky3RBr6d14jqKs0mKrLjrhgQBpStkPvsh0/ElsqBC8tpW2ii+9m+yI
         c6CvoYjPHC02F3ww+me3mydTqQxCsaZwQoqEA3CESiZ1+vcEzyX4D8KPho0oRiuYQM
         wxWI2oWw9LIQvMQiA5/ALtPk7hF1ABDavE0YmaSNeNLuOLS0VgGySvwy2PqSqqr0aa
         TbkRW2Yf24RWA==
Date: Mon, 10 Jan 2022 08:24:26 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/5] glossary: Tweak upper-case/lower-case in
 indexed terms
Message-ID: <20220110162426.GE947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Jan 10, 2022 at 08:16:24PM +0900, Akira Yokosawa wrote:
> For consistency, "RCU-Protected Data" and "RCU-Protected Pointer"
> are better be indexed as "RCU-protected data" and
> "RCU-protected pointer".
> 
> To achieve this, use \IXaltr{} and give desirable forms as
> alternatives.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Even better!  Queued and pushed the series, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> I suggested \IXr{}, but it was not the choice in the Glossary items.
> 
>         Thanks, Akira
> --
>  glossary.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index 658c9b62..06d45ee6 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -431,14 +431,14 @@
>  	outside of an RCU read-side critical section.
>  	Any interval of time during which all threads pass through at
>  	least one quiescent state each is termed a ``grace period''.
> -\item[\IXr{RCU-Protected Data}:]
> +\item[\IXaltr{RCU-Protected Data}{RCU-protected data}:]
>  	A block of dynamically allocated memory whose freeing will be
>  	deferred such that an RCU grace period will elapse between the
>  	time that there were no longer any RCU-reader-accessible pointers
>  	to that block and the time that that block is freed.
>  	This ensures that no RCU readers will have access to that block at
>  	the time that it is freed.
> -\item[\IXr{RCU-Protected Pointer}:]
> +\item[\IXaltr{RCU-Protected Pointer}{RCU-protected pointer}:]
>  	A pointer to RCU-protected data.
>  	Such pointers must be handled carefully, for example, any reader
>  	that intends to dereference an RCU-protected pointer must
> 
> base-commit: 503b84bbe1d1f5c9ee54b1d1893e52481a12092a
> -- 
> 2.17.1
> 
