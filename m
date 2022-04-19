Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbiDSRjB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 19 Apr 2022 13:39:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5134D27170
        for <perfbook@vger.kernel.org>; Tue, 19 Apr 2022 10:36:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E19FA61384
        for <perfbook@vger.kernel.org>; Tue, 19 Apr 2022 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650389777;
        bh=zEDm1qsw8HCwUK3KBKthngHEZQoQWmfVVGoHVz/Whu8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KHeGQNFQOG63JCgqZ94ptBeIh6Xpu3PPQtBeLrM0lAQ14wqaQep6WfD+rOPH9Py+g
         3BW0A/PEppRzdohy7IpHSo1MpELfofVEJX/eOkC8VMbIWQjEHTIHAuvyHBMr1+DJMO
         gAhvtfNAo91OyDMbDo736FagQQNv3Za3Y+IblEkM+1pQHhBK/yyIa5tEW0k0369pbg
         9kMtJLQqcNTkykLDvbGyi/p5l4zmTNv8DOcfj0Z7nQOztYC9KaEwsWFRPDSoUi5GoP
         tr/bArp99FDrEUaH5+DpBOYk/SQrF/FYemaCWJ7DXWC41f7RIt+92pA6kxZoSkH+zV
         32k3VBF9BFSWQ==
Date: Tue, 19 Apr 2022 10:36:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] whymb: fix description in DMA coherence
Message-ID: <20220419173616.GQ4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220417110947.GA27447@haolee.io>
 <20220417165239.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <20220418062359.GA12176@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418062359.GA12176@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 18, 2022 at 06:23:59AM +0000, Hao Lee wrote:
> On Sun, Apr 17, 2022 at 09:52:39AM -0700, Paul E. McKenney wrote:
> > On Sun, Apr 17, 2022 at 11:09:47AM +0000, Hao Lee wrote:
> > > CPU caches need to be flushed before DMA operations to avoid data
> > > overwriting.
> > > 
> > > Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
> > > ---
> > >  appendix/whymb/whymemorybarriers.tex | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > > index b49d5fe8..4ec27962 100644
> > > --- a/appendix/whymb/whymemorybarriers.tex
> > > +++ b/appendix/whymb/whymemorybarriers.tex
> > > @@ -1640,7 +1640,7 @@ future such problems:
> > >  	in any DMA buffer before presenting that buffer to the
> > >  	I/O device.
> > 
> > The paragraph above is before the I/O starts.  Any changes to the buffer
> > need to be flushed to memory so that the I/O device's DMA actually
> > sees them.
> > 
> > The next paragraph is the other end of I/O request, after it completes.
> > So we cannot have "before".  But maybe we need "invalidate" instead of
> > "flush".
> 
> Got it!
> 
> > With a note that itcan be more efficient to both flush and
> > invalidate prior to presenting the DMA buffer to the device.
> > 
> > The point is that any pre-DMA data in the CPU caches must be gotten
> > rid of in order for the CPUs to see the data that was actually DMA'ed
> > into memory.
> 
> Great explanation! Now I know we need something like WBINVD instruction
> for the former case and INVD instruction for the latter.

Glad that it helped!

> > >  	Similarly, you need to flush the CPU caches of any location
> 
> Should we change the word "flush" to "invalidate" to differentiate these
> two opposite DMA operations?

If after the DMA, we need to care about the difference, hasn't the CPU
incorrectly written to part of the DMA buffer during the DMA operation?
If you are thinking of some other scenario, could you please list the
events leading up to that scenrio?

> > > -	in any DMA buffer after DMA to that buffer completes.
> > > +	in any DMA buffer before DMA to that buffer completes.
> > >  	And even then, you need to be \emph{very} careful to avoid
> > >  	pointer bugs, as even a misplaced read to an input buffer
> > >  	can result in corrupting the data input!
> > 
> > And this last clause could just wordsmithed a bit.
> 
> Maybe it's not quite rigorous?
> 
> If I understand correctly, a misplaced read will load the data from
> input buffer area to cache line. If the cpu doesn't write to this cache
> line, I think this case can only result in that the cpu reads stale data
> in subsequent reads but won't corrupt the input buffer given that this
> cache line is clean and won't writeback to memory.

If the user code that accesses the buffer runs on this same CPU, it will
look to that CPU as if the DMA buffer was corrupted, correct?  After
all, that user code will see the value loaded by the CPU, not the value
actually DMAed into memory.

Hmmm...  It might be necessary to spell out these DMA-corruption
scenarios.  Thoughts?

							Thanx, Paul
