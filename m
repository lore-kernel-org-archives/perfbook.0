Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235889AbiK2SeE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 29 Nov 2022 13:34:04 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 362C059FD3
        for <perfbook@vger.kernel.org>; Tue, 29 Nov 2022 10:34:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 80254CE12B9
        for <perfbook@vger.kernel.org>; Tue, 29 Nov 2022 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669746840;
        bh=UIzh+j98fbFL4amOQkZnL/qwtpJExTp/ewka697LRuI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Y1d9aMcpi2R9JuiOtZOoRN8Vt/jxrXczBGXkxK/56b60UvcTviSdr0hJfgtGofzDJ
         NIkEuSl+/uiko9eH1PauydurayhKTFqmaKlqhg21A1nfI3nwNpER8LIcnq27xPSZvP
         TouC2oglDMydzred4kcgqHSEAIVz23ijF43Dq3INGEgdMXcTMaNr5Dt2hXBUY5aj5q
         //EoEflXxEP4zLVe0lsr6UHB7QwkgYM+a5akgIkuvLl8/tAFLfAeP1DwVKbmPoOS//
         8PhmxoVs+6IYnZZ7n34Z82W/KSj/ZwSS2Fod89PBRKQlUMvUwDpn97n3M7Z1CZTC2F
         IOcdo/N5LXfUg==
Date: Tue, 29 Nov 2022 10:34:00 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] SMPdesign: Fix typo
Message-ID: <20221129183400.GB4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8db36786-c3da-66ac-2160-77df121c4cc5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db36786-c3da-66ac-2160-77df121c4cc5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 29, 2022 at 11:46:24PM +0900, Akira Yokosawa wrote:
> "... due to the fact that is uses only global locks." doesn't make sense.
> The "is" looks like a typo of "it".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, queued and pushed, thank you!

							Thanx, Paul

> ---
>  SMPdesign/SMPdesign.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 70936c12ce7e..f8a1b289bb8f 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -175,7 +175,7 @@ int hash_search(struct hash_table *h, long key)
>  \subsection{Code Locking}
>  \label{sec:SMPdesign:Code Locking}
>  
> -\IXh{Code}{locking} is quite simple due to the fact that is uses only
> +\IXh{Code}{locking} is quite simple due to the fact that it uses only
>  global locks.\footnote{
>  	If your program instead has locks in data structures,
>  	or, in the case of Java, uses classes with synchronized
> 
> base-commit: 5e6242b1bd3952817b24ccd6d477cc1dadd90639
> -- 
> 2.25.1
> 
