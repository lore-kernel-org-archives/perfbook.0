Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235973AbhJSNpF (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Oct 2021 09:45:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634650972;
        bh=ssZS0tfYBzqDm/DEHGqpELqkmAugSSWxJA909k2xafc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Pa2jF4+M4c90A+LHntrE7szRZXTag08ojEBkPMcA3jHytUBIe6tTEVabFYxD2d2Rx
         XKUkhdpUbTW0d5IMvWu9cBKgE77lcKVyv337m1utRFex2RqWBKyIFngglJ+/l07oGJ
         3fC1zoUYsDYxY7a2bl0Ha/YwKLO54ym1/ClERi4JEj3i0f1h7rqzhHpQRRz0rCLhke
         x74mcbb9S62NgpY/sOdzteS2mYNo0jWsVzItbl+qfhAnyAofjuqDYHyC7dB7vOj+dl
         3aE5rP26dv24wxTIbzyGNyguf3lYfFVI92CUzOH73N8zZAKBzo8Z0j1715XYuySuj0
         uqbgX58cMqgmg==
Date: Tue, 19 Oct 2021 06:42:51 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] fixsvgfonts-urwps: Add patterns for 'URW
 Gothic'
Message-ID: <20211019134251.GE880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <2ac75ef4-c43a-195a-f788-15f375e3b20b@gmail.com>
 <20211019040333.GD880162@paulmck-ThinkPad-P17-Gen-1>
 <31e09f3e-9f6d-e7e4-441c-f2b821091037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31e09f3e-9f6d-e7e4-441c-f2b821091037@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Oct 19, 2021 at 02:42:59PM +0900, Akira Yokosawa wrote:
> On Mon, 18 Oct 2021 21:03:33 -0700, Paul E. McKenney wrote:
> > On Tue, Oct 19, 2021 at 11:06:41AM +0900, Akira Yokosawa wrote:
> >> When built on Ubuntu Focal, Figure 3.9
> >> (cartoons/r-2014-CPU-track-meet-phone-booth.pdf) does not have the
> >> "TELE" sign.
> >>
> >> Ubuntu Hirsute and Fedora 34 don't have this issue, so it looks
> >> like Ubuntu Focal lacks some configs for font-name aliases under
> >> /etc/fonts/.
> >>
> >> As a workaround, add patterns taking care of "URL Gothic".
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Hi Paul,
> >>
> >> I'm not sure if you have the same issue on your Ubuntu 20.04,
> >> but I noticed it and tested the workaround on the container image at
> >> docker.io/akiyks/perfbook-build-focal:latest.
> > 
> > I did not notice until just now.  ;-)
> > 
> > I built a Fedora system, and it shows the "TELE" just fine even without
> > this change.  But even with this change, I do not see the "TELE" on
> > Ubuntu 20.04.  Quite possibly because I am missing fonts?
> 
> Or you might have failed to remove cartoons/r-2014-CPU-track-meet-phone-booth.pdf
> before rebuilding with this change??

Apparently, despite having done "make distclean" earlier.

> Still no "TELE"?

After explicitly removing that file, the "TELE" is back!  Thank you!

> What does "fc-list | grep "URW Gothic" say?

$ fc-list | grep "URW Gothic"
/usr/share/fonts/type1/urw-base35/URWGothic-BookOblique.t1: URW Gothic:style=Book Oblique
/usr/share/fonts/type1/urw-base35/URWGothic-DemiOblique.t1: URW Gothic:style=Demi Oblique
/usr/share/fonts/opentype/urw-base35/URWGothic-Book.otf: URW Gothic:style=Book
/usr/share/fonts/type1/gsfonts/a010013l.pfb: URW Gothic L:style=Book
/usr/share/fonts/type1/gsfonts/a010015l.pfb: URW Gothic L:style=Demi
/usr/share/fonts/type1/urw-base35/URWGothic-Book.t1: URW Gothic:style=Book
/usr/share/fonts/opentype/urw-base35/URWGothic-Demi.otf: URW Gothic:style=Demi
/usr/share/fonts/type1/gsfonts/a010033l.pfb: URW Gothic L:style=Book Oblique
/usr/share/fonts/opentype/urw-base35/URWGothic-BookOblique.otf: URW Gothic:style=Book Oblique
/usr/share/fonts/type1/gsfonts/a010035l.pfb: URW Gothic L:style=Demi Oblique
/usr/share/fonts/type1/urw-base35/URWGothic-Demi.t1: URW Gothic:style=Demi
/usr/share/fonts/opentype/urw-base35/URWGothic-DemiOblique.otf: URW Gothic:style=Demi Oblique

Presumably meaning that I have the needed font. ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> [...]
