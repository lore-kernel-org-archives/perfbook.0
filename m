Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbiHPTJI (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 16 Aug 2022 15:09:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1348C53020
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 12:09:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD23161464
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660676947;
        bh=1QqwKv/lREzIHRFiAPzayi+UHFMG5ML8C9TGcY8UJ+Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L8fnCu9AahiITURLkZJF6PL+5bFoQXwJw6iMRxGddhQXgCWH6UJuR9ASp2GyDz1u4
         qj0LiMMRPE7knqgmFTszOo4KYuO5nBWkzYxHJ02JKyPWVpuKCw3panswCKpD0WtV63
         +FP/HZUu6IDKkVnR227rr0aK6l6uOxwyGc3pLOmyIJX7rYj2KSKEwbQRN4QdfTdk1T
         3Te94Ux37NFxckLRN/tkK5HgOQNLuhya8fz6EWkjyeZ6ZB1aGZ91pqAwkP8yLXALrE
         0PlPDRtvh1YfgeDKI8vP7iVveLQBzqTZqJDUsQMLLCGXkw0IeGWlugem73qc8XjyNQ
         FlXbFDni6jRgw==
Date: Tue, 16 Aug 2022 12:09:06 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] CodeSamples: Switch ARM64 get_timestamp() to use the
 hardware counter
Message-ID: <20220816190906.GF2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220816124647.75220-1-e2lahav@gmail.com>
 <66962abc-94ce-b9ab-e75f-92d8bd03e8c9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66962abc-94ce-b9ab-e75f-92d8bd03e8c9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 16, 2022 at 08:48:54AM -0400, Elad Lahav wrote:
> On 2022-08-16 08:46, Elad Lahav wrote:
> > Signed-off-by: Elad Lahav <e2lahav@gmail.com>

Queued and pushed, thank you!

> I tested the change on an aarch64 board on both QNX and Linux. The Linux
> results show quite the change in performance from the clock_gettime()
> version, which is probably expected.
> 
> Before:
> root@localhost:~/src/CodeSamples/defer# ./gettimestamp
> d3f5e50a7d
> d3f5e50af5 120
> d3f5e50b6d 120
> d3f5e50be5 120
> d3f5e50c5d 120
> d3f5e50cd5 120
> d3f5e50d25 80
> d3f5e50d9d 120
> d3f5e50e15 120
> d3f5e50e8d 120
> 
> After:
> root@localhost:~/src/CodeSamples/defer# ./gettimestamp
> 73706dac1
> 73706dac2 1
> 73706dac4 2
> 73706dac5 1
> 73706dac6 1
> 73706dac8 2
> 73706dac9 1
> 73706dacb 2
> 73706dacc 1
> 73706dacd 1

I have to ask...  Are these the same units?  (I have in the past used
hardware where they would not be.)

Anyway, even if the hardware clock ticks an order of magnitude more
slowly, it is an impressive speedup.  ;-)

							Thanx, Paul
