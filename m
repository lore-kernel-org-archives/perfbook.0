Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiDCEBE (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 3 Apr 2022 00:01:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8BCE630E
        for <perfbook@vger.kernel.org>; Sat,  2 Apr 2022 20:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32C3760F69
        for <perfbook@vger.kernel.org>; Sun,  3 Apr 2022 03:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648958350;
        bh=Ik5IGxJIAQ1ull9z693LVjbctscMRUVUv8OqjEyB884=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ewkQojf5fgUztAMxaGDq+Amyb5CA+Bzp2nuR/BhJynH6ATwlVj9SARMrIFrAvY+ap
         tZ+PzNL1sOycUrEZ6kMpxwNiEK5d812EpPCTtLk9Q850TTDJfQS4Th/5uYA7P8rEmj
         Rhb2st0uuQLsTyA8FakMkEakt5EUfpjGhppF69kBrunX5tQwd2ldJp6EQeY7EFlGWA
         Nhl0usBPv4XmCvSZUal0XCZ9sP4hp7a8c4qAYbyDeNXSf30kf1r2+aAtGoQHrwc49V
         GBxfN3He5IUZPyEyDj4b7eUeJUcMKSEVC/F8xo08NMrEiAjZHk2Ty2rS3TKP2CFT2g
         8f0yR5Q9s+ykw==
Date: Sat, 2 Apr 2022 20:59:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] advsync: Fix typo
Message-ID: <20220403035910.GM4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4edd1109-2614-26a1-c622-5905690e0b47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4edd1109-2614-26a1-c622-5905690e0b47@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 03, 2022 at 09:11:10AM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes, applied and pushed, thank you!

							Thanx, Paul

> ---
>  advsync/advsync.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index df372b4e..d35a64fd 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -432,7 +432,7 @@ largely orthogonal to those that form the basis of real-time programming:
>  	it knows about, and, in the absence of such constraints,
>  	its level best to honor process priorities and to provide
>  	fair scheduling to processes of the same priority.
> -	Non-demonic schedulers allows real-time programs to use simpler
> +	Non-demonic schedulers allow real-time programs to use simpler
>  	algorithms than those required for
>  	NBS~\cite{DanAlitarh2013PracticalProgress,BjoernBrandenburgPhD}.
>  \item	NBS forward-progress guarantee classes assume that a number
> 
> base-commit: 432a94b0b7e1436a00587a0988fb678def465882
> -- 
> 2.25.1
> 
