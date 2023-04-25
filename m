Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjDYRz2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 25 Apr 2023 13:55:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3A6CC0B
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 10:55:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79F9B615E9
        for <perfbook@vger.kernel.org>; Tue, 25 Apr 2023 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682445326;
        bh=l8W80gtRNpc41e2wlcVTC0an9rRg5f1aW56tS9xbtuw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Qtddf7y2dTFNLgRR7xB8WYd99EwYPN2In0c4pRSCq/rw39ZCtoCHUvaOqTA18AfSW
         tMibsuofpvIrGvf5eKfoRtB48tTFl5pwnZbqLMFZPtsVd5a8xbrpnQKT5dqlaHU71J
         +87mRoMK/IhxjGjvsjQLSbknOr8JKb0FRqN09CCkJXAzuB4AFqOalPwgcFBQEeDN5r
         0dJDCZEdiO6bfaByvSsS/7rBBlkHyxnyfKnZfbF/ltaVPPkcmMuarog+JGn3z+bv4B
         xDkhcwMVKRWcClmIFbfbWFHt4Ip7EbqFENw9RoErmhx+/2grDbypAcfRlb2ONDxJ7U
         rhYlJiNYyk2vA==
Date: Tue, 25 Apr 2023 10:55:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook -v2] memorder: Remove \FloatBarrier in front of
 Section 15.2.8
Message-ID: <fb5c4021-0056-4480-80b7-405cd2d1c11b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <843cb1f5-6d9d-1ca0-2ff6-af5b42932407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <843cb1f5-6d9d-1ca0-2ff6-af5b42932407@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 25, 2023 at 05:51:50PM +0900, Akira Yokosawa wrote:
> This \FloatBarrier was supposed to prevent floats of Section 15.2
> from drifting into Section 15.3.
> 
> Now it causes a mostly empty page in -1c builds.
> 
> As we have a following section (15.2.8) now, the float barrier has
> become redundant.
> 
> Remove it.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
> v2:
>    Just remove the float barrier.  Moving it to the end of Section 15.2
>    has no effect.
> 
> v1: https://www.spinics.net/lists/perfbook/msg03947.html
> 
>         Thanks, Akira
> 
> --
>  memorder/memorder.tex | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c93a5b54135b..f116ab81aceb 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2492,8 +2492,6 @@ In short, properly constructed release-acquire chains form a peaceful
>  island of intuitive bliss surrounded by a strongly counter-intuitive
>  sea of more complex memory-ordering constraints.
>  
> -\FloatBarrier
> -
>  \subsection{A Counter-Intuitive Case Study}
>  \label{sec:memorder:A Counter-Intuitive Case Study}
>  
> 
> base-commit: b7c2ed26da9ea6cbc586cde41fa5d477013cf84d
> -- 
> 2.25.1
> 
