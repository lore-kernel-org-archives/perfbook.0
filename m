Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjI1HRz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 28 Sep 2023 03:17:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8B2BE
        for <perfbook@vger.kernel.org>; Thu, 28 Sep 2023 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695885473;
        bh=R3tLOZM/uTF/JdRPRqaLkl1wVuZDa9xEEdNFbFaw2dE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Fe8a48yGZwT78e4nLAhOhPZ6Cv/Plk4EVB09Y1LzD45L+snaq4vRNbONX5iUQPAQb
         EBACn5B+HRLR0Jaa25OZjSWzAJugSgtvzLU1ykG1UKayDAH9LsXNFHyiocBtilotIB
         WMNPCGwRarbX74to2hJS94XhPpp+9T+VcvmYsSnjIbLw2absPugS7vLFW9RY3hlvco
         xR4GfwyrT/WJw+lvF/8fDHhzdpPAJIWEp+0a1JR9dwMRW70twgEYReQqJnb/RmF9C8
         XEFC5+gBq1Z8v1S35RC8jUWgwtyOXo7nUqI95hRNUZ3VgXKSC3EwdWdbMn807yXnwY
         B7ehmDTB4EzEA==
Date: Wed, 27 Sep 2023 07:45:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] bib/swtools: Fix bib info of
 JonathanCorbet2019KCSAN
Message-ID: <71fbdd4f-1f9a-4386-bdd3-dbe69d1215b5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <2afd9d24-7d59-cff8-8ae3-a43507dd1a6a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2afd9d24-7d59-cff8-8ae3-a43507dd1a6a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 26, 2023 at 08:37:50PM +0900, Akira Yokosawa wrote:
> It looks like most fields were not updated when copy pasted from
> JonathanCorbet2016C11atomics in memorymodel.bib.
> Replace them with those of named LWN article.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Good eyes!  Queued and pushed, thank you!

						Thanx, Paul

> ---
>  bib/swtools.bib | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/bib/swtools.bib b/bib/swtools.bib
> index 336ea7752743..a4a0fc5c4159 100644
> --- a/bib/swtools.bib
> +++ b/bib/swtools.bib
> @@ -899,10 +899,10 @@ numpages = {9}
>  @unpublished{JonathanCorbet2019KCSAN,
>   Author="Jonathan Corbet",
>   Title="Finding race conditions with {KCSAN}",
> - month="June",
> - day="15",
> - year="2016",
> - note="\url{https://lwn.net/Articles/691128/}",
> + month="October",
> + day="14",
> + year="2019",
> + note="\url{https://lwn.net/Articles/802128/}",
>  }
>  
>  @article{HoangHaiDang2019RustBeltRelaxed,
> 
> base-commit: 5880d52c9646561edc5ba3ff8ec285df75ee370d
> -- 
> 2.25.1
> 
