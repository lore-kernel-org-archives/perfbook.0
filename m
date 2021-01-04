Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbhADEMl (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 3 Jan 2021 23:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609733520;
        bh=Q18q5SCLMzbgEg6s8mz+ghnMD32Klz5PbnqpPnUsKzE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FI7ot5eL6WD6AFjyre4NjMTDv7GBVjS1LuLo6tjmY7S5VTvXRe/AlHSGfzq8pPdRi
         UY27EQogEiRdg0V9gVcf9nakS/PJvEHDqC3y20M+TLMY8QnEbTp/8HzH1KMXeLK1Xj
         1QLCnvTifMrt/oQzsnUrKgjwiaV++ARXZZ5G1h61saFzIbn6OhJzLelHTesXs3Ti+M
         vCwy2p3WC4qckQY60ryt2VTiD6YKUOjR3NhuyOdfCS1gSLKsWjgH8Je4RC2/9SvW9M
         owCDvEc62rE0sEqjEAEsjCPGqBW+5t3SLSxjiOxoXWZZ4ScEGOmOSdwQQePvyszfwB
         DJdkza7x0GfPQ==
Date: Sun, 3 Jan 2021 20:12:00 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Request for clarification on Alpha reordering
Message-ID: <20210104041200.GI12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CAApSCJY_u9gsLHUY+=mBVBXzxU_oS8mF5CM5d_RkDFw7asPmyg@mail.gmail.com>
 <20210103035250.GE12032@paulmck-ThinkPad-P72>
 <7a4a8cbf-8828-6a2b-b45b-372eb84534ba@gmail.com>
 <20210103182429.GG12032@paulmck-ThinkPad-P72>
 <20210104003207.GA6191@paulmck-ThinkPad-P72>
 <3a34f99b-1b4d-7bfb-2a10-b29bac2a7c80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a34f99b-1b4d-7bfb-2a10-b29bac2a7c80@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Nitzan <danny.nitzan@gmail.com>, perfbook@vger.kernel.org

On Mon, Jan 04, 2021 at 12:56:25PM +0900, Akira Yokosawa wrote:
> On Sun, 3 Jan 2021 16:32:07 -0800, Paul E. McKenney wrote:
> > On Sun, Jan 03, 2021 at 10:24:29AM -0800, Paul E. McKenney wrote:
> >> On Sun, Jan 03, 2021 at 01:12:40PM +0900, Akira Yokosawa wrote:
> [...]
> >>>
> >>> Hi Paul,
> >>>
> >>> Off topic, but smp_read_barrier_depends() as a kernel API
> >>> has been removed since Linux v5.9 [1].
> >>> Now READ_ONCE() for Alpha uses mb() [2].
> >>>
> >>> You might want to reflect these changes in perfbook before the
> >>> release of the Second Edition.
> >>>
> >>> [1]: merge commit https://git.kernel.org/linus/145ff1ec090d
> >>>     ("Merge tag 'arm64-upstream' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")
> >>> [2]: commit https://git.kernel.org/linus/d64628588515
> >>>     ("alpha: Override READ_ONCE() with barriered implementation")
> >>
> >> Good catch, thank you!  We will of course need to retain mention of
> >> smp_read_barrier_depends() given that people will be using pre-v4.15
> >> (to say nothing of pre-v5.9) kernels for some time, but the main code
> >> does need to reflect the current state of the Linux kernel.
> >>
> >> Perhaps in the third edition we should drop any and all references
> >> to DEC Alpha.  It is no longer in any way special, at least from the
> >> perspective of core kernel code.  ;-)
> >>
> >> I suppose that the counter-argument is that non-Linux-kernel code might
> >> still need to pay attention, so maybe DEC Alpha needs to stay until such
> >> time as C/C++ handle address and data dependencies.  Worth some thought.
> > 
> > In the meantime, how about like this?
> Looks reasonable to me.
> There is a footnote which now looks redundant.
> Please find a patch below (on top your change) to remove it.
> 
> With my patch (or similar) applied,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed both, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> [...]
> 
> ------------------------------------------------------------------------
> 
> commit 7069136668105b6d4fd2d0c2ea4951d83f2c5424
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Mon Jan 4 12:25:22 2021 +0900
> 
>     memorder: Remove redundant footnote
>     
>     Now that it becomes contextually obvious that this paragraph is
>     talking on the pre-v4.15 READ_ONCE() of Alpha, the footnote can be
>     removed.
>     
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 28c54967..a907025e 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3940,10 +3940,7 @@ This \co{smp_wmb()} on \clnref{wmb} of this listing
>  guarantees that the element initialization
>  in \clnrefrange{init:b}{init:e} is executed before the element is added to the
>  list on \clnref{add}, so that the lock-free search will work correctly.
> -That is, it makes this guarantee on all CPUs {\em except} Alpha.\footnote{
> -	But Linux kernel versions v4.15 and later cause \co{READ_ONCE()}
> -	to emit a memory barrier on Alpha, so this discussion applies
> -	only to older versions of the Linux kernel.}
> +That is, it makes this guarantee on all CPUs {\em except} Alpha.
>  \end{fcvref}
>  
>  \begin{listing}[tbp]
> 
