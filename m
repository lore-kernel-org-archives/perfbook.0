Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKXUs1 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 24 Nov 2022 15:48:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57445317EE
        for <perfbook@vger.kernel.org>; Thu, 24 Nov 2022 12:48:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0EA5CB8281C
        for <perfbook@vger.kernel.org>; Thu, 24 Nov 2022 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669322903;
        bh=8WxbgfOeNXYLGfNN067lJJ98PQTuW90o89AutZww8H0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=O2AeY4BRWkNpzV/Vm1nOUWdyd7F/trZmGkEjgoje4oYBOkQB3BBNLSQ0KmgIgdcPK
         0uFH95rBHj9EdIYoBt8Q4NbBEzRPG4BdespSgWnDkbGpOUKuz5d8PVy07wCqwpMijc
         TebmzgGcTFF1l9ZmgS7Umua0mFpk9jg6n+LwpcFi+PxzsEa0vt6mnKLOZ9kzQ4XNI2
         mSbKQHBYoAh/r8T5Ld10XuFcLEWhiXA3JFXdN+2uhk/RxC/UXG6FnCIHKJQEAyCGHI
         j/M4XcLsp1Xg3JrIGrPigi/Kx4WxIv06BgNX0Lz0OHkp5EI9A75C5kOdnq4J2E3gWL
         jdv36yvtRZJjg==
Date: Thu, 24 Nov 2022 12:48:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 00/13] Minor fixes for defer/
Message-ID: <20221124204823.GW4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221124185803.8150-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Thu, Nov 24, 2022 at 10:57:49AM -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> This patchset contains minor fixes for defer/ that found during the
> Korean translation[1] of it.
> 
> [1] https://github.com/sjp38/perfbook-ko_KR

Good catches, thank you!!!  Queued and pushed.

And a happy Thanksgiving weekend to you, assuming that you are still
in Seattle.  ;-)

							Thanx, Paul

> SeongJae Park (13):
>   defer/rcuintro: Clearly point the QSBR described section
>   defer/rcufundamental: Add non-breaking spaces
>   defer/rcuapi: Add missed unbreakable spaces
>   defer/rcuapi: Use \co{} for boolean return value
>   defer/seqlock: Use \co{} for boolean return value
>   defer/rcuusage: Call paragraphs paragraphs, not sections
>   defer/rcuusage: Provide the reference to synchronous RCU update-side
>     primitives
>   defer/rcuusage: Add a missed unbreakable space
>   defer/rcuusage: Add missing '()' for 'rcu_dereference()'
>   defer/rcuusage: Fix wrong function name: s/timer_stop/nmi_stop/
>   defer/rcurelated: Remove unopen closing parentheses
>   defer/whichtochoose: Fix a wrongly positioned unbreakable space
>   defer/whichtochoose: Remove an unnecessary space.
> 
>  defer/rcuapi.tex         | 10 +++++-----
>  defer/rcufundamental.tex |  6 +++---
>  defer/rcuintro.tex       |  3 ++-
>  defer/rcurelated.tex     |  2 +-
>  defer/rcuusage.tex       | 14 ++++++++------
>  defer/seqlock.tex        |  4 ++--
>  defer/whichtochoose.tex  |  4 ++--
>  7 files changed, 23 insertions(+), 20 deletions(-)
> 
> -- 
> 2.17.1
> 
