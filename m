Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242480AbhLVEhs (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 21 Dec 2021 23:37:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B86C061574
        for <perfbook@vger.kernel.org>; Tue, 21 Dec 2021 20:37:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 23DEBB81109
        for <perfbook@vger.kernel.org>; Wed, 22 Dec 2021 04:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640147865;
        bh=sGn3S27ieqDFnBzlZsCO4b02sFXgJEkw4SJptP5LPK4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZWSPXlmCTXzf4ET9EDEuYfkKvc2pAT7hBFZgYK9anlMgstU6c3TjjV/dfm2YZKekl
         wqE6dWLE/W2p22xoV7pls4ohzvIkDSs9tMYSxqdYk31J0qJytLh9p/qx2fDtUk3ol7
         Z+XJ1Tn50wjGrrKvp4PHJ4V2D1+yLonMp2pto2L2LdntUWrdopsMqqCwkRr5rQzQY6
         0MH8PBKS0lcblQ5xjk4vTySvO2oixovJE0ZgtCc0WUBTcwEsk5B0Cl3DYp7LQcbuld
         mJhtXgk/uEKP5r5/P+k/y/96877iN7S0xOarwEAx5XrSZA8cXn5RZRd9r8T6ybLWaB
         wZR7sRJ6TpMMg==
Date: Tue, 21 Dec 2021 20:37:45 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 1/2] defer/rcuusage: Reflect subsection
 reordering
Message-ID: <20211222043745.GE4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <cd109ef0-2469-7045-d582-32a425cfb1d1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd109ef0-2469-7045-d582-32a425cfb1d1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Dec 21, 2021 at 04:11:39PM +0900, Akira Yokosawa wrote:
> Subsection of "Type-Safe Memory" was moved upward in commit
> e22df8aea3f2 ("defer/rcuusage: Move type-safe-memory section").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I queued and pushed both, thank you!

							Thanx, Paul

> ---
> Hi Paul,
> 
> This patch and the next are last minute nitpicks for the
> upcoming release.
> 
>         Thanks, Akira
> --
>  defer/rcuusage.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 3fbe73be..811dd32a 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -588,8 +588,9 @@ element being freed and reallocated as the same type of structure
>  while they are referencing it, but must prohibit a change in type.
>  This guarantee, called ``type-safe memory'' in
>  academic literature~\cite{Cheriton96a},
> -is weaker than the existence guarantees in the
> -previous section, and is therefore quite a bit harder to work with.
> +is weaker than the existence guarantees discussed
> +in \cref{sec:defer:Existence Guarantee},
> +and is therefore quite a bit harder to work with.
>  Type-safe memory algorithms in the Linux kernel make use of slab caches,
>  specially marking these caches with \co{SLAB_TYPESAFE_BY_RCU}
>  so that RCU is used when returning a freed-up
> 
> base-commit: a8f5948a1b8921941bf4039e278aa7929f64c322
> -- 
> 2.17.1
> 
