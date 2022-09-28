Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234536AbiI1RqP (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 28 Sep 2022 13:46:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D65EB2D93
        for <perfbook@vger.kernel.org>; Wed, 28 Sep 2022 10:46:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4EBE9B821B2
        for <perfbook@vger.kernel.org>; Wed, 28 Sep 2022 17:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664387171;
        bh=usdFrD5n4aIixDG3xqCyudUhoYfFtcp595H1xSwYrJI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=s0aPnEC2pAuQEA51H3jcxZ3fmKn71EduB5NJXvrgusZgM8C/Vi5XHOgZ3UAlU6cQd
         NYaDyXHbaEFzJZ8dYqGwEo4ttJERc79tqul4XVvXZ1WlHQjzN4PuHhPSi/mqAoi/dD
         0sA2SqEfYY1OOQY6YG9s03tcdHaWOU3lgbXUe2uqijrEJ97ARs5YWaw9vJjzFd7ewX
         jBccEi5bFs3RfHypgGp+QSgVP5D5zX0pzGRvzgoa8LVWMwUsQSza6O/wLKYOfnIq9j
         c9NMjj/bRts3LUxgvpuwoJ9hZ4lYkJr+4rYhOCcrWt9AATPHvve/gkezXf0PRuUMMN
         doGiMcRYF1TKw==
Date: Wed, 28 Sep 2022 10:46:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] memorder: Fix typo
Message-ID: <20220928174611.GA4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <c8ec96f6-f592-36be-3d8a-55030d430caa@gmail.com>
 <3ca9e48c-3049-1845-a849-d8484c47d645@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ca9e48c-3049-1845-a849-d8484c47d645@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Sep 28, 2022 at 11:30:40PM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good catches, queued and pushed both, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> I don't see any smp_store_release() in P1().
> It must be P0(). :-)
> 
>         Thanks, Akira
> --
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index f85cfe6ca702..a0a87d0a8bca 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2372,7 +2372,7 @@ The only code difference is that
>  has an additional \co{P2()} that does an \co{smp_store_release()} to
>  the \co{x2} variable that \co{P0()} releases and \co{P1()} acquires.
>  The \co{exists} clause is also adjusted to exclude executions in which
> -\co{P2()}'s \co{smp_store_release()} precedes that of \co{P1()}.
> +\co{P2()}'s \co{smp_store_release()} precedes that of \co{P0()}.
>  
>  Running the litmus test in
>  \cref{lst:memorder:A Release-Acquire Chain With Added Store (Ordering?)}
> -- 
> 2.25.1
> 
> 
