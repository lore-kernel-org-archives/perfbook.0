Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbjFOUb5 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 15 Jun 2023 16:31:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E0A1707
        for <perfbook@vger.kernel.org>; Thu, 15 Jun 2023 13:31:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6AEC6217F
        for <perfbook@vger.kernel.org>; Thu, 15 Jun 2023 20:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686861111;
        bh=c2n337NP3M3HGwY+rJ9xn23yrLRqJPmodN6NUlMenic=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=NBlX+vhKhHMIlVO/qHUtAm5CRXH8/Yce6VKuLu/6iTBh5gMubCDQJwZt/CW6Btt1y
         I2+KWADjVFRD8zvCAabOGsalfU4fxC36pZrPFIJG6Spzl1vOnKPnLlbDERP+Y1xU54
         Yk2jZsBvTbKlJb3T84mllJqwe+YFfawrXIRyc5hA3L2llmrRvFPI0e2RegfS89NOXN
         5EbFha5+/KVSirHufoMyZdtqdMXIF/whD8yy15jgXCSqVmp3q74yKbHojXrnx/PDob
         AjegKwJ0XWFj+IbopWNSaInkiQwp2JANRHMviH0xo5yLdMKIwVYNqNTIjllZ+JyaS/
         7otUzIwvI4nGQ==
Date: Thu, 15 Jun 2023 13:31:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: 3.2.2: "lock requires two atomic ops"
Message-ID: <3d1bb928-2608-42d4-822b-d08b04817b19@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230614001528.GA3365842@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614001528.GA3365842@schwarzgerat.orthanc>
List-ID: <perfbook.vger.kernel.org>
To: nick black <dankamongmen@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jun 13, 2023 at 08:15:28PM -0400, nick black wrote:
> enjoying the updated edition!
> 
> "The lock operation is more expensive than CAS because it
>  requires two atomic operations on the lock data structure, one
>  for acquisition and the other for release."
> 
> this might be worth expanding upon. it's not immediately obvious
> to me why the unlock would need to be atomic. the rough 2x
> certainly jives with this explanation, and i intend to go look
> at some source, but i'd think it would be more:
> 
>   atomic update
>   fence
>   non-atomic update
> 
> you've presumably got threads attempting to lock with a CAS
> looking for a sentinel representing unlocked, right? so if i
> update back to that sentinel in multiple steps, they're going to
> miss in media res, no?
> 
> feel no obligation to respond, of course.

In some cases, you can release a lock with a simple store instruction.
But much depends on the specifics of the implementation of the lock.

						Thanx, Paul
