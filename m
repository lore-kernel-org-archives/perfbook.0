Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjBAApV (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 31 Jan 2023 19:45:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF76051C79
        for <perfbook@vger.kernel.org>; Tue, 31 Jan 2023 16:45:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5B3F961759
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 00:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675212318;
        bh=aVj3i/IvQhFdDD8KgD/+BLADLeq2Dj22W9xUbKLfUJg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ADwjVeHWAeqiuwcp2+8QKUEcbxvHbZGLNxONsF2TJ6qLkwqGzfWnGIL3+rW6jLTUo
         sMoqEprm01+h3nXpMQToTLcK+zE2PG0NYEXkq8nnvYbwC3epJLNZ/ocf9mlAg4+cBC
         THzVnuJQvpTo7zJwmh7sW3O3y8dlbkQzweSJYJb3swZauKul9LUN4J86o3Dyc2Larz
         HWmqiX2XvwZZMRe72TRL2JpriwMhWOqYxT41RQWtnXgyGqyuDsNFq3hrXJ1ALRj11p
         nj6zrNTXFs7Zer7QOpGGtcgI7rkaKcSfGrB+vEe5lvK9WWoYK2QwOaQDTG4oa9cpO1
         2j9MHnpx+NAWQ==
Date: Tue, 31 Jan 2023 16:45:18 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] FAQ-BUILD.txt: Add libertine in the list of
 fonts
Message-ID: <20230201004518.GA2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <efaac825-e1bd-92ec-525e-8fd84b8eeafc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efaac825-e1bd-92ec-525e-8fd84b8eeafc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 01, 2023 at 09:23:10AM +0900, Akira Yokosawa wrote:
> Font package "libertine" is necessary since commit 6be27f7414d8
> ("Use Biolinum font family for epigraph").
> 
> Add it to the list of font packages which are not included in
> -fonts-recommended.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you, Akira!

I clearly need to get my local font act together.  ;-)

						Thanx, Paul

> ---
>  FAQ-BUILD.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 107707533398..1ea9d92c90b0 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -149,6 +149,7 @@
>  		in -fonts-recommended:
>  
>  			https://www.ctan.org/pkg/newtx
> +			https://www.ctan.org/pkg/libertine
>  			https://www.ctan.org/pkg/newtxtt
>  			https://www.ctan.org/pkg/nimbus15
>  			https://www.ctan.org/pkg/courier-scaled
> 
> base-commit: 32e14ef456725329455f35eda27c76b46b1f2763
> -- 
> 2.25.1
> 
