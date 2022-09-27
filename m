Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiI0TGT (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 27 Sep 2022 15:06:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFF3514D36
        for <perfbook@vger.kernel.org>; Tue, 27 Sep 2022 12:06:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4AA06617E1
        for <perfbook@vger.kernel.org>; Tue, 27 Sep 2022 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664305577;
        bh=3kWsW4AMJx86HAH0Z+fDwMKQShpy/Q4NyuuuHOqqYvU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nEcva91btLWaoM2g63t+p6sCj2N7/BnjBeOypeMoarxNDI3zYPtRgvXNW1bn/CKz8
         VgZ8u9Q1taYsHRj8uGnNk7ccg92KS1EszQ2fg6m0edBTnxH2L+PDykn9wDGtEfqod+
         8k0wgPNUM/C9ZMKuibWigp8ygebsY+QCQ342T5DhsGjbwRcOmhvw/EB82fOQk7I+cR
         F05FX4jg07fWTGVQqaa+57dI9tqZ8h4v6rG9jeonXoZsA8qxJ1PQmB1I9nnZrjL6Xt
         68uYyiQmwmyqiPZlnmDRv7udlVLA/sXUQkKvx12BKCRRNhMr6CkgxnanUqiiR3qmnH
         wZJ2b5oZgSpog==
Date: Tue, 27 Sep 2022 12:06:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Comments on Section 7.1
Message-ID: <20220927190617.GV4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FVkC51pkG_cO-bBgfYq1pcug9B=ECEkmcNHLg+3HDbB4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FVkC51pkG_cO-bBgfYq1pcug9B=ECEkmcNHLg+3HDbB4A@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Sep 26, 2022 at 09:48:33PM -0400, Elad Lahav wrote:
> This started out as a longer email, but it looks like at least two of
> the problems I spotted were already fixed in the latest version.
> 
> 1. I think the recommendation to release all locks before invoking a
> user-supplied function should come with a BIG FLASHING WARNING SIGN
> (or the PDF equivalent). Whenever I review code that releases and
> re-acquires a lock I look for the faulty assumptions it makes about
> state being preserved from before the lock was released. 9 out of 10
> times I find a bug.

Good point!

Left to myself, I would add another infamous Quick Quiz.  But would
you like to send a patch proposing something?

> 2. qsort() may not be the best example to use in this section, as,
> even assuming there is some version of it that requires locks, the
> reader may fail to see any problems. While I'm no fan of nftw(), it
> may be easier to see why you would need a lock in the library (to
> prevent changes to the directory), as well as why releasing and
> re-acquiring the lock can be dangerous (the iterator can become
> invalid).

This does sound better than qsort, so if no one has a better suggestion, I
would be tempted to go with that.  In the absence of a better suggestion,
would you be willing to supply some sample code, preferably buildable
and executable?

> 3. Page 106, first paragraph: "an pointer" should be "a pointer".

This one was easy, so I applied it with your Reported-by.  Good eyes,
by the way, and thank you!

							Thanx, Paul
