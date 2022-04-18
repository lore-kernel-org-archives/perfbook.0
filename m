Return-Path: <SRS0=JMj5=U4=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=px/o4HY4q10zcCgF4yVSnBr3TXg+dyxiwmBJYqvR5gE=;
        b=ViSqsguz0zKVd0g0klq/uc2hntHWije2ZjNMdfEERjdXn3gCRl+VBVNuu6VTcQObDi
         ugiFBRKyhVIdORENSOQ/PV+CkHggZ/d2u+MT/hdxDpYMJVIn2Lm3CrFa55pV70+/H0U+
         B0trbehvu0ov/vuXhbE9+XbNi6nAZ8QzEP58fTqkfGOTZCd5vk+crKIFRvmd3iZQE1m0
         BBIatVMTK7vsfwMx3wQMYbAWKv6y7OBayEw755Rnyh/qNynJjEdz1JavWyXVXyWCmz/C
         8o98/UO9msVyVM/eef09FJkmqnEdCraR+wwldt+GV1kVuaAEvEXEFYdKl80hy53U9DzI
         4sKQ==
Date: Mon, 18 Apr 2022 06:23:59 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: [PATCH] whymb: fix description in DMA coherence
Message-ID: <20220418062359.GA12176@haolee.io>
References: <20220417110947.GA27447@haolee.io>
 <20220417165239.GP4285@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417165239.GP4285@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Apr 17, 2022 at 09:52:39AM -0700, Paul E. McKenney wrote:
> On Sun, Apr 17, 2022 at 11:09:47AM +0000, Hao Lee wrote:
> > CPU caches need to be flushed before DMA operations to avoid data
> > overwriting.
> > 
> > Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
> > ---
> >  appendix/whymb/whymemorybarriers.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > index b49d5fe8..4ec27962 100644
> > --- a/appendix/whymb/whymemorybarriers.tex
> > +++ b/appendix/whymb/whymemorybarriers.tex
> > @@ -1640,7 +1640,7 @@ future such problems:
> >  	in any DMA buffer before presenting that buffer to the
> >  	I/O device.
> 
> The paragraph above is before the I/O starts.  Any changes to the buffer
> need to be flushed to memory so that the I/O device's DMA actually
> sees them.
> 
> The next paragraph is the other end of I/O request, after it completes.
> So we cannot have "before".  But maybe we need "invalidate" instead of
> "flush".

Got it!

> With a note that itcan be more efficient to both flush and
> invalidate prior to presenting the DMA buffer to the device.
> 
> The point is that any pre-DMA data in the CPU caches must be gotten
> rid of in order for the CPUs to see the data that was actually DMA'ed
> into memory.

Great explanation! Now I know we need something like WBINVD instruction
for the former case and INVD instruction for the latter.

> 
> >  	Similarly, you need to flush the CPU caches of any location

Should we change the word "flush" to "invalidate" to differentiate these
two opposite DMA operations?

> > -	in any DMA buffer after DMA to that buffer completes.
> > +	in any DMA buffer before DMA to that buffer completes.
> >  	And even then, you need to be \emph{very} careful to avoid
> >  	pointer bugs, as even a misplaced read to an input buffer
> >  	can result in corrupting the data input!
> 
> And this last clause could just wordsmithed a bit.

Maybe it's not quite rigorous?

If I understand correctly, a misplaced read will load the data from
input buffer area to cache line. If the cpu doesn't write to this cache
line, I think this case can only result in that the cpu reads stale data
in subsequent reads but won't corrupt the input buffer given that this
cache line is clean and won't writeback to memory.

Thanks,
Hao Lee
> 
> Thoughts?
> 
> 							Thanx, Paul
