Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbiLQFQC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 17 Dec 2022 00:16:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF4CF27
        for <perfbook@vger.kernel.org>; Fri, 16 Dec 2022 21:16:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 67C3A60B3C
        for <perfbook@vger.kernel.org>; Sat, 17 Dec 2022 05:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671254159;
        bh=35HMfNQCFROvl+rNpLyg75U5qPyNKk7OsYzw9VTkSC8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=j+7vZXnk6rFHt3YegGQ79FesWemt4Tw6oR3shuPHLXhQ6ZE/0RukAJ0vVmOBrb+AY
         khD67wwN9Ij+55r1oU6ItAQBna882Lu+ggmYgsy3NKfboW2M5p+bWXWGWePzci6RZ9
         KyEJpyej/v6ujxiKutGgEC/Ex4GOHzt1dvkbHJ2t4CZi7MqUTAJTulNurcyWUG5HSp
         f0wYJUSf6qD6Di4eBbOc+ccuc4mz48q0bBQ+AMsytfxVZ/MA/E6imc746cV6n1yplp
         JoXCVpfFJKakwkR6/06v3JMlgNBWVPjjzy4nkZhOgnYtot7P+i0RuS4ov043he298o
         VInubSJqJpfpQ==
Date: Fri, 16 Dec 2022 21:15:59 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] advsync/rt: Fold long list in \cite{}
Message-ID: <20221217051559.GJ4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <bd77b4d5-1be3-02b8-63b9-b97b15c03444@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd77b4d5-1be3-02b8-63b9-b97b15c03444@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Dec 17, 2022 at 11:21:30AM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> You can break inside \cite{}.
> This should be easier to maintain.

Indeed, much better!  Queued and pushed, thank you!!!

							Thanx, Paul

>         Thanks, Akira
> ---
>  advsync/rt.tex | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index 58dfc3224cb0..e9db1b04fc37 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -834,8 +834,13 @@ If configured properly, a non-trivial undertaking, \co{CONFIG_NO_HZ_FULL}
>  offers real-time threads levels of performance that come close to those of
>  bare-metal systems~\cite{AbdullahAljuhni2018nohzfull}.
>  \ppl{Fr\'{e}d\'{e}ric}{Weisbecker} produced a practical guide to
> -\co{CONFIG_NO_HZ_FULL}
> -configuration~\cite{FredericWeisbecker2022nohzIntro,FredericWeisbecker2022nohzFullDynticksInternals,FredericWeisbecker2022nohzfull,FredericWeisbecker2022HousekeepingTradeoffs,FredericWeisbecker2022practicalExample,FredericWeisbecker2022nohzfullTSC}.
> +\co{CONFIG_NO_HZ_FULL} configuration~\cite{
> +	FredericWeisbecker2022nohzIntro,
> +	FredericWeisbecker2022nohzFullDynticksInternals,
> +	FredericWeisbecker2022nohzfull,
> +	FredericWeisbecker2022HousekeepingTradeoffs,
> +	FredericWeisbecker2022practicalExample,
> +	FredericWeisbecker2022nohzfullTSC}.
>  
>  There has of course been much debate over which of these approaches
>  is best for real-time systems, and this debate has been going on for
> 
> base-commit: f59c468b212e66597c8f0c594839da53ccd1e949
> -- 
> 2.25.1
> 
