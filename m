Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbiHOQyw (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 15 Aug 2022 12:54:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A1C248CC
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 09:54:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE05E610A7
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660582490;
        bh=J939yQXGbPVo6QS2tUemnX+NyzkVESxmIEB89xv1CGM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZMY4uVwTIKk9123dCM6dpzxH4G/OzFLX65rhuLMpt0iA50VvAOgP5qtRW5SsF3m8k
         L5Eeo4SckRZnyKvlVHeGEr6+JMBtswpwToe5DUQN8TSNJgTjvBS0KbGCZiB/TJJI3R
         197tWIGruOOTeWNaWn9QnpkEnOWmlEcB3KeWp24Uh1WlvrnBGIdZmQojiRzS1Yx4Hz
         b43FsN8BZSJbuuq1TcibtMLQaZOnMkJ7EVs7K93/db+bxx0C75NRtxs5y7UyDLTO+u
         by3iEGgWAh7T9mJY0k/kZInP3jy1XJrFqzA1GiRHnF+1KkqT26gx12PYcxTfUEjWKR
         fzULG61gzd0Dg==
Date: Mon, 15 Aug 2022 09:54:49 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] CodeSamples: Support for building on different
 operating systems
Message-ID: <20220815165449.GW2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220815103717.7454-1-e2lahav@gmail.com>
 <07ed4c84-976a-cb4a-072f-47a7599cc434@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07ed4c84-976a-cb4a-072f-47a7599cc434@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Aug 15, 2022 at 06:42:22AM -0400, Elad Lahav wrote:
> On 2022-08-15 06:37, Elad Lahav wrote:
> > +	cat api-pthreads/api-$(os_compat).h >> api.h
> 
> I didn't want to go overboard here, so it's just the minimum required for
> having a single per-OS header with specific definitions.

I am good with that, thank you!

> > +#ifndef CLOCK_MONOTONIC_RAW
> > +#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
> > +#endif
> 
> This one wasn't moved to the per-OS header because of the order in which
> headers are included, which I didn't want to fiddle with.

That is fine, especially given that there are other POSIX OSes, including
old versions of Linux, that do not have CLOCK_MONOTONIC_RAW.

> That said, would you be open to changing the ARM64 get_timestamp() to a
> simple read of the hardware clock? It is architecturally-defined.

Sounds good to me!

Your patch looks good and works on my system.  One nit, but an important
one:  The new api-pthreads/api-qnx.h file should have your copyright
notice rather than mine, given that you created the file.  Does something
like this work for you?

 * Copyright (c) 2021 Elad Lahav, BlackBerry.

							Thanx, Paul
