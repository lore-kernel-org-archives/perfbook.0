Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjBNXNU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 14 Feb 2023 18:13:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E8BF752
        for <perfbook@vger.kernel.org>; Tue, 14 Feb 2023 15:13:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0D3761938
        for <perfbook@vger.kernel.org>; Tue, 14 Feb 2023 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676416398;
        bh=tAbGOgCs4xEFeY4BZXVza6mMqIjA2haZObV2hrO0X5A=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=H26x4SBLxz1eM9UU7FIUrjYJwmAdH/7+STX3q0xgIv2fc6NNodPzkw+bvSKSIf9jZ
         35gbLY/F6343asOiHDUcYJh8+FdwP1COWpKmtAjdQJqmmLJkyIzSBlUwpFJyznsdoX
         jetVdtMkVXvY5+9v3ed2AlIbGihfdwmuLN6l2YpLS+UAkPCZ6ABPPUHd4+DTvyOEFy
         61BvJ4k3SG9iAoyVJE+s/1QEFWK6iG6Hf5TY0Xvjqls9NKItu+8UiWMbppdDXsusPX
         JP4DrLkV0UxjKyedWjTjrInmzGL6QAF7ZbB+HEAfBlabStmBddWhsE6eQTdgzC5NBN
         1mKqY4eq7ihKQ==
Date: Tue, 14 Feb 2023 15:13:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 0/4] cpu/overheads: Make tables more consistent
Message-ID: <20230214231315.GH2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f565979-bba0-bab1-7c8e-ebc76c2b4e65@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Tue, Feb 14, 2023 at 07:03:12PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> This patch set is a follow-up to commit 34cc066b1d95 ("cpu: Add a QQz
> on table E.1").
> 
> Leo posted a patch to improve Table E.1 at [1].
> 
> I have gone further to improve consistency among tables on overheads
> of atomic operations.
> 
> Patch 1/4 changes the layout of those tables and adjusts upper-/
> lower-casing (with Reported-by: from Leo).
> 
> I found the use of "In-Core" and "Off-Core" in the tables somewhat
> strange. Usually, I find pairs of "On/Off" and "In/Out" more natural.
> In overheads.tex, "On-Core" vs "Off-Core" looks better to me.
> 
> So Patch 2/4 replaces "in-core" with "on-core", and does similar
> replacements.
> 
> Patch 3/4 adds a page reference in QQz 3.8.
> 
> Patch 4/4 is an independent change fixing an issue in -nq builds.
> I noticed an extra "," in the anchor box containing QQz 4.20, 4.21,
> and 4.22 while skimming through QQz's in those builds.
> 
> [1]: https://www.spinics.net/lists/perfbook/msg03827.html

Queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (4):
>   cpu: Improve layout and consistency of Tables 3.1, E.1, and E.2
>   cpu: Use 'on-core' rather than 'in-core'
>   cpu: Add page reference to Table E.1 in QQz 3.8
>   toolsoftrade: Fix QQz macro in QQz series
> 
>  cpu/overheads.tex             | 161 +++++++++++++++++++++-------------
>  perfbook-lt.tex               |   6 ++
>  toolsoftrade/toolsoftrade.tex |   2 +-
>  3 files changed, 108 insertions(+), 61 deletions(-)
> 
> 
> base-commit: 50bb4adf51f683ba2c7d90f269632b6f4b4d4704
> -- 
> 2.25.1
> 
