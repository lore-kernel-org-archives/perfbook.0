Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEIRsg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 9 May 2023 13:48:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1104B272A
        for <perfbook@vger.kernel.org>; Tue,  9 May 2023 10:48:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9461B62A19
        for <perfbook@vger.kernel.org>; Tue,  9 May 2023 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683654514;
        bh=r82spoODfdaEbsPUkT2QvtcT3tCVS4bY/AaKvBnAsDc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LjInGGll3Cy2/zhKyQpdQFrN3cPIfeNnxCpo3S9BitKAgjTlpshLmCMd2yE1HBbOQ
         c62+BB96iQToK5VVe55jXLGjBPZwQumy/6ZeRbc8NjpCeMW5pxUB0RyjS78WxMFc+w
         qUybpsq2dx4/RfSiGXUmm9Gc/ntAC0aDkz3MAKzREkZKUxxJM/ZZtSkI8KtmkDf0oz
         OmP357sswMcWiXIioCerpONROQL4VqH+E+vELFNi3FTqDn4rNSsoRIAUuWGgfsZA7i
         TxmO7NS1ehK4CDTdRL6aly3OFCW3iqIMt/LOh9RNcIyRbgJu01g8UnsE9/ntFjUkal
         pL04YRV8jk3Sw==
Date: Tue, 9 May 2023 10:48:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] datastruct: Fix typo
Message-ID: <aa50026e-e6b4-4206-a0be-f4e93c58047e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230509163506.33670-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509163506.33670-1-mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 09, 2023 at 04:35:06PM +0000, Alan Huang wrote:
> This section has almost no code, should be chapter.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>

Good eyes!  Queued and pushed, thank you!

							Thanx, Paul

> ---
>  datastruct/datastruct.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index 0242ccc7..d2a67ffd 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1975,7 +1975,7 @@ produce novel algorithms with surprising properties.
>  %
>  \epigraph{The devil is in the details.}{Unknown}
>  
> -The data structures shown in this section were coded straightforwardly,
> +The data structures shown in this chapter were coded straightforwardly,
>  with no adaptation to the underlying system's cache hierarchy.
>  In addition, many of the implementations used pointers to functions
>  for key-to-hash conversions and other frequent operations.
> -- 
> 2.34.1
> 
