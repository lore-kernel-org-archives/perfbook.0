Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379210AbiD2Rnm (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 29 Apr 2022 13:43:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2D01BE8F
        for <perfbook@vger.kernel.org>; Fri, 29 Apr 2022 10:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0927962411
        for <perfbook@vger.kernel.org>; Fri, 29 Apr 2022 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651254021;
        bh=PorApCkLf0B+tvNdRDodMql4NTvxHqP8S5uYamL+CvA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=uyR2BPmHFQEG98so02eYc+lMz3hdd/wmnG4kAK0uwFEcADkLld1luh2KAdtcHnr/2
         p81TmfcwDzW1JHgwqGG7N2LBZ4H4E2CJ8YoXmAx3C5VCtOi1J8ygYTmpD0E13cj+bU
         6j3Ms9ZyQ7TJoRgp1V4RIh9QRlrQiWbjTM6M+P8IvRi8IKwXCAUTghhf4KXuySRa9I
         CejS26+4YJV7ON3jB6OzdD61rAzEpwRAOoiLP++BtFV12tkyj4hb2u0vZjz33bOU6A
         Xce0iU2wNp4tNUojjt3itbEsTchos25yyyx8uiUj28iwqxftD8famuu6+VxgaFR502
         Miqtuf17/c5jg==
Date: Fri, 29 Apr 2022 10:40:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] whymb: fix description in DMA coherence
Message-ID: <20220429174021.GP1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220417110947.GA27447@haolee.io>
 <20220417165239.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <20220418062359.GA12176@haolee.io>
 <20220419173616.GQ4285@paulmck-ThinkPad-P17-Gen-1>
 <20220420113857.GB25933@haolee.io>
 <CA+PpKPnzvtxZ6GrqXWOC8MxQrsHwEbQ7KLdhtc8Eo5Qm_H83jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+PpKPnzvtxZ6GrqXWOC8MxQrsHwEbQ7KLdhtc8Eo5Qm_H83jA@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 29, 2022 at 11:43:11PM +0800, Hao Lee wrote:
> On Wed, Apr 20, 2022 at 7:38 PM Hao Lee <haolee.swjtu@gmail.com> wrote:
> >
> > On Tue, Apr 19, 2022 at 10:36:16AM -0700, Paul E. McKenney wrote:
> > > On Mon, Apr 18, 2022 at 06:23:59AM +0000, Hao Lee wrote:
> > > > On Sun, Apr 17, 2022 at 09:52:39AM -0700, Paul E. McKenney wrote:
> > > > > On Sun, Apr 17, 2022 at 11:09:47AM +0000, Hao Lee wrote:
> > > > > > CPU caches need to be flushed before DMA operations to avoid data
> > > > > > overwriting.
> > > > > >
> > > > > > Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
> > > > > > ---
> > > > > >  appendix/whymb/whymemorybarriers.tex | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > > > > > index b49d5fe8..4ec27962 100644
> > > > > > --- a/appendix/whymb/whymemorybarriers.tex
> > > > > > +++ b/appendix/whymb/whymemorybarriers.tex
> > > > > > @@ -1640,7 +1640,7 @@ future such problems:
> > > > > >         in any DMA buffer before presenting that buffer to the
> > > > > >         I/O device.
> > > > >
> > > > > The paragraph above is before the I/O starts.  Any changes to the buffer
> > > > > need to be flushed to memory so that the I/O device's DMA actually
> > > > > sees them.
> > > > >
> > > > > The next paragraph is the other end of I/O request, after it completes.
> > > > > So we cannot have "before".  But maybe we need "invalidate" instead of
> > > > > "flush".
> > > >
> > > > Got it!
> > > >
> > > > > With a note that itcan be more efficient to both flush and
> > > > > invalidate prior to presenting the DMA buffer to the device.
> > > > >
> > > > > The point is that any pre-DMA data in the CPU caches must be gotten
> > > > > rid of in order for the CPUs to see the data that was actually DMA'ed
> > > > > into memory.
> > > >
> > > > Great explanation! Now I know we need something like WBINVD instruction
> > > > for the former case and INVD instruction for the latter.
> > >
> > > Glad that it helped!
> > >
> > > > > >         Similarly, you need to flush the CPU caches of any location
> > > >
> > > > Should we change the word "flush" to "invalidate" to differentiate these
> > > > two opposite DMA operations?
> > >
> > > If after the DMA, we need to care about the difference, hasn't the CPU
> > > incorrectly written to part of the DMA buffer during the DMA operation?
> >
> > Sorry, I can't understand this passage...  Maybe I didn't make myself
> > clear.  I find a great example in arch/powerpc/include/asm/cacheflush.h
> >
> > Before DMA provides output buffer to devices, we should call
> > flush_dcache_range or clean_dcache_range to let the devices see the
> > latest data generated by the CPU. After DMA writes data into the input
> > buffer, we should use invalidate_dcache_range to invalidate the CPU
> > cache so the CPU can read the latest data written by devices.
> >
> > Should we change the word "flush" in the following sentence to "invalidate"?
> >
> >         Similarly, you need to flush the CPU caches of any location in
> >         any DMA buffer after DMA to that buffer completes.
> >
> 
> Hello,
> 
> My above reply may be missed :)

No, not missed, just slowness on my part.  For whatever reason, the past
few months have seen unusually high levels of activity for Linux-kernel
RCU [1].  Plus I am presenting at the LSF/MM summit next week.

But I will get to this, I promise!

In the meantime, one of the things that needs to be done to Appendix C to
bring it up to chapter status is to provide a state table for each of the
sequences of events, then converting the enumerated steps to paragraphs.
See for example Table 15.1 and the corresponding discussion.  Would you
be interested in constructing such tables?  That would speed things up!

							Thanx, Paul

[1] https://docs.google.com/document/d/1GCdQC8SDbb54W1shjEXqGZ0Rq8a6kIeYutdSIajfpLA/edit?usp=sharing

> Thanks,
> Hao Lee
> 
> >
> > > If you are thinking of some other scenario, could you please list the
> > > events leading up to that scenrio?
> > >
> > > > > > -       in any DMA buffer after DMA to that buffer completes.
> > > > > > +       in any DMA buffer before DMA to that buffer completes.
> > > > > >         And even then, you need to be \emph{very} careful to avoid
> > > > > >         pointer bugs, as even a misplaced read to an input buffer
> > > > > >         can result in corrupting the data input!
> > > > >
> > > > > And this last clause could just wordsmithed a bit.
> > > >
> > > > Maybe it's not quite rigorous?
> > > >
> > > > If I understand correctly, a misplaced read will load the data from
> > > > input buffer area to cache line. If the cpu doesn't write to this cache
> > > > line, I think this case can only result in that the cpu reads stale data
> > > > in subsequent reads but won't corrupt the input buffer given that this
> > > > cache line is clean and won't writeback to memory.
> > >
> > > If the user code that accesses the buffer runs on this same CPU, it will
> > > look to that CPU as if the DMA buffer was corrupted, correct?
> >
> > Ah, this indeed makes sense!
> >
> > > After
> > > all, that user code will see the value loaded by the CPU, not the value
> > > actually DMAed into memory.
> > >
> > > Hmmm...  It might be necessary to spell out these DMA-corruption
> > > scenarios.  Thoughts?
> >
> > Yes. I think spelling out these scenarios should make this passage easier to
> > understand.
> >
> > Thanks,
> > Hao Lee
> >
> > >
> > >                                                       Thanx, Paul
