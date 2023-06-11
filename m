Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKUEX (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Jun 2023 16:04:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2768A1A4
        for <perfbook@vger.kernel.org>; Sun, 11 Jun 2023 13:04:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B12E60F5E
        for <perfbook@vger.kernel.org>; Sun, 11 Jun 2023 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686513861;
        bh=BZF/3p9fDtzW3c9BNqm5/RD2mSiHPMyLUiZmkk1/pZ8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ssXsGk9tEA4lA2pXwqnMMPtTTqU8Gxm4FPLmhdxni4ufJPC8DFPR4fWNVr0uKXPEM
         2UQp48XKSpEqEtGMtx/VwNOMyqqDlD2NLlDdOEfEsnAtfFv+gROWV60G9GiMhB1eFy
         1YSdi1+t56AAzGgVAr8HwyXLlMD2LklKUeVOzV/I3Re/ZMoR0TYW9KZuTZoMoooCEx
         h5TFzvif3r0m/+CUmKzinu8CuBcfjuqyn1GmelzgsCq5HF4vVPAQgDtw1Vk3zYVFFY
         3N6jYqiVOId7HHj4eRRWF6bTsUIjwi4fxuBuTTSrYNWjsZL6pgjNVKo57qPWJ/2QBs
         qVHz7lyZpjZZw==
Date: Sun, 11 Jun 2023 13:04:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] advsync: Minor fixups
Message-ID: <527910de-de12-4d2c-99a4-111070f2f672@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230611171506.32033-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230611171506.32033-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Sun, Jun 11, 2023 at 10:15:04AM -0700, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> This patchset contains trivial fixups for advsync/, which found while
> doing Korean translation[1].
> 
> [1] https://github.com/sjp38/perfbook-ko_KR

Good eyes, queued and pushed, thank you!

							Thanx, Paul

> SeongJae Park (2):
>   advsync/rt: Update path to kernel-per-CPU-kthreads document
>   advsync/rt: Mention the tree of Documentation/ directory
> 
>  advsync/rt.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> -- 
> 2.17.1
> 
