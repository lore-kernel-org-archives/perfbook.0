Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241679AbhIWOnW (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 23 Sep 2021 10:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632408110;
        bh=ngpmWVT0vNlktwgHSUbzdQ85pXpunTHQhvs7W4OSiBw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LJzKkrhEcFSpu9Ko3E67fzjyUEsB0vhqHRrfkEs1qrN1BzpVgkNt8gxVu9ITOHXGT
         KZQrzEHSjQd4xFJTrBlHPCdJj5LCwFQ5chr1/O5SOIh0cVpjDzEuJbLc7eF6/bHo64
         FMr6S4L5o/KC0Fg4ihuNB87sNVZbcjyBV6yHfPUlqB4WYXyUKy55fCPWIsNtoA6sBU
         gjMT6rhwBZCwJ1YJ3dIMAu77msWV7zR5pBYzSbhYXyW7IrA8fVKdwwbtggSTxzekNZ
         M8LyKzbyuJDCZjdmsZNCAfBpQvmuXnA9VeCCp0iWDMc6oKcQD3vLXl6P6Kh9oQS0RG
         tr1D/pnGZ8MxQ==
Date: Thu, 23 Sep 2021 07:41:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
Message-ID: <20210923144150.GF880162@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
 <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Sep 23, 2021 at 06:44:33PM +0900, Akira Yokosawa wrote:
> On Thu, 23 Sep 2021 12:08:35 +0900, Akira Yokosawa wrote:
> > Rotated labels on the "Time" axis of Figure 9.27 are misplaced when
> > built on Fedora 34 (Inkscape 1.1) and Ubuntu 21.04 (Inkscape 1.0.2).
> 
> FWIW, here is a link to a screenshot with misplaced labels:
> 
>     https://fars.ee/AMQ2.png

Ouch!!!  And good catch!

>         Thanks, Akira
> 
> > 
> > Update the svg file with the one tweaked by Inkscape 1.1.
> > 
> > It is backward-compatible with Inkscape versions 0.92.3 (Ubuntu 18.04),
> > 0.92.5 (Ubuntu 20.04), and 1.0.2 (Ubuntu 21.04).
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

So I should install an Inkscape 1.1 or later?

							Thanx, Paul

> > ---
> > Hi Paul,
> > 
> > Parameters for string rotation from Inkscape 0.92.5 are not handled
> > as expected by Inkscape >= 1.0.
> > 
> > I've not seen any such breakage in .svg files made by Inkscape 0.92.3
> > (Ubuntu 18.04).
> > So this issue might be local to Ubuntu 20.04, but I'm not sure.
> > 
> > Also, it looks like fixsvgfonts.sh and fixsvgfonts-urwps.sh need some
> > update to catch additional patterns of font specification strings.
> > 
> > I'll post a follow-up patch to update them.
> > 
> >         Thanks, Akira
> > --
> [...]
