Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233824AbjEHP7r (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 8 May 2023 11:59:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747C36A5D
        for <perfbook@vger.kernel.org>; Mon,  8 May 2023 08:59:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A71860F8F
        for <perfbook@vger.kernel.org>; Mon,  8 May 2023 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683561585;
        bh=50Ye3fOAuBw6axz9DBZGuNJWUL7XiDKKiU2WGcbCSJ0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=RtaMlohHQRPIj99RpBDuEEMLc46BWts0v+OK+PMxpxP/lqmvtMqXjrGEjMa5THW4a
         7gO3+9Si9jZkq0UKmeWLcGmWxUJwkhGNJu5Z2grLw8To1eQ/gzUYSWK6v8pepXgjai
         Vl3PZrxgHlNA0LHrovtr5jhbEm1lHwwtYkIi/wnpL26yF98f1BR1al9f1eygyy/j20
         R8IokfKoKDeZdH3v4sipm0HN2pwLzbaYV4VSB5CtRlb74rPTdMLo9rPZUEb+iHHOqv
         SfyuNeQsShet1aAy/CYhNFcY+gN0YVTDlFR2SAgilGc/P0NEaYEfdJRqkfhVPfDrdB
         3JvwNSeTwJbHw==
Date: Mon, 8 May 2023 08:59:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] datastruct: Make the figure consistent with the page
Message-ID: <4f1c11d6-84f4-478b-bacf-6a8e09498c9e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230506155231.29673-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506155231.29673-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, May 06, 2023 at 03:52:31PM +0000, Alan Huang wrote:
> The referenced figure is currently inconsistent with the page.
> Fix that.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Good eyes!  Queued and pushed both, thank you!

							Thanx, Paul

> ---
>  datastruct/datastruct.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 82affce0..8c2bfc16 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -827,7 +827,7 @@ to about half again faster than that of either QSBR or RCU\@.
>  }\QuickQuizEnd
>  
>  What if the memory footprint is reduced still further?
> -\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR}
> +\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
>  on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
>  shows that RCU attains very nearly ideal performance on the much smaller
>  data structure represented by the pre-BSD routing table.
> -- 
> 2.34.1
> 
