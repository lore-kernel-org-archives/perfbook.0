Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbhABToK (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 2 Jan 2021 14:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609616609;
        bh=xIn3J6NzFBC9wvzzkCylRSou2MXwO/oAr/4CtqNe7Tw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AQqLxRQWJGNiHy0QQ2B2ezk1A5o604Z8t7IwKSmQkPM1iJXZuRB99DrTRqabFI4PD
         KPq8qBHQAANH5QFrCjx0xtGjD678wfBOxMgmeN1ZQuLVypGhYuBK2Wa6cQYEp6D0mp
         vFfYHuxesH95eh29W+47dtzvz39S91xUenflRnA6NXHg5IOXrYkuSOLMGMFz3AKQg8
         WFtOIVmT3SwgALI65gkBZre/lK2EF36UYIQp4hOKhthPSl31e9Omljgms1jeBuRFeI
         5vhlyzT5MitEOO9QdIMp2INhVCSDdp90GBpxc9xUSSHs2vvn36BHvCbDlAZosjmPf3
         Uo2TmmVDKhm3A==
Date: Sat, 2 Jan 2021 11:43:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Perfbook build failures
Message-ID: <20210102194329.GC12032@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <8735zj40dh.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735zj40dh.fsf@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>
Cc: perfbook@vger.kernel.org

On Sat, Jan 02, 2021 at 09:14:34PM +0200, Felipe Balbi wrote:
> 
> Hi all,
> 
> I'm trying to build the perfbook, but I always get a build failure while
> building the Dining Philosopher's images, as shown below:
> 
> SMPdesign/DiningPhilosopher4part-b.eps --> SMPdesign/DiningPhilosopher4part-b.pdf
> SMPdesign/DiningPhilosopher5.eps --> SMPdesign/DiningPhilosopher5.pdf
> SMPdesign/DiningPhilosopher5PEM.eps --> SMPdesign/DiningPhilosopher5PEM.pdf
> SMPdesign/DiningPhilosopher5TB.eps --> SMPdesign/DiningPhilosopher5TB.pdf
> make: *** [Makefile:400: SMPdesign/DiningPhilosopher5TB.pdf] Error 1
> make: *** Waiting for unfinished jobs....
> make: *** [Makefile:400: SMPdesign/DiningPhilosopher5.pdf] Error 1
> make: *** [Makefile:400: SMPdesign/DiningPhilosopher4part-b.pdf] Error 1
> make: *** [Makefile:400: SMPdesign/DiningPhilosopher5PEM.pdf] Error 1
> 
> Any ideas on how to debug this?

Apologies for the hassle!

This looks like an issue involving GhostScript and pstricks-base.
Quoting Akira Yokosawa below for workarounds.

							Thanx, Paul

------------------------------------------------------------------------

This September saw updates in both GhostScript (9.53.0, now 9.53.3) and
pstricks-base (3.01).
It turned out this combination is the cause of the error you have encountered.

Update announcement of pstricks-base 3.01 [1] says:

    This version has a modified pstricks.tex|.pro for GhostScript versions > 9.52

However, it does not work with ghostscript 9.53.x in perfbook's use cases.

So, one workaround would be to downgrade ghostscript to 9.52 [2].

Another option would be to downgrade pstricks-base to 2.90 (2018/12/17)
(or similar [3]), which is the version in Fedora's current TeX Live package.
But note that an old version of pstricks-base might be incompatible with
the up-to-date upstream TeX Live.

It may sound strange but pstrics-base 2.90 works with ghostscript 9.53.x
as far as transparency composition is not concerned.
Perfbook's figures don't use transparency composition.

[1]: pstricks-base 3.01 update announcement on CTAN:
    https://www.ctan.org/ctan-ann/id/mailman.2839.1600699145.2548.ctan-ann@ctan.org

[2]: GhostScript release downloads:
    https://github.com/ArtifexSoftware/ghostpdl-downloads/releases

[3]: pstricks-base (as of 2019/02/27)
    https://www.texlive.info/tlnet-archive/2019/02/27/tlnet/archive/pstricks.tar.xz

GhostScript's compatibility-breaking "security" updates have caused a lot of
troubles these days...

Hopefully pstricks-base would catch up gs 9.53.x soon.

        Thanks, Akira
