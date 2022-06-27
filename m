Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbiF0O4a (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 27 Jun 2022 10:56:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD77A167FF
        for <perfbook@vger.kernel.org>; Mon, 27 Jun 2022 07:56:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 625206159F
        for <perfbook@vger.kernel.org>; Mon, 27 Jun 2022 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656341788;
        bh=LFVHwLY7bEgwmsxd417VMz/bXNWtcwuWjC+Fd3GU/fg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=PX+2m/Yt6rlK+ALTCQUT6/lXN8BWd+607/5HE2qoK2bTcWkb97xtsHqEWAefb0qmz
         fEab6GtWBbTufzaVk5g1PeK1Z9PjAmignT5EwFF04C7SqWE/XArzAdKb5HZhQRTgKF
         jjtVbApEsNj7eKDmpPdFQtFPGvQjd5I3AIFaY8Bce6vwSyui4CBOXUMMxZqTyrVnmD
         033fD+8hf6M451uelvAuoFxJ5bvxFpjN/npwKFUm7+LgPzjlFUDHmeY2m+H6215QJo
         r0XkE6JwNiVeI9w7ABAiz6YakY221jWc6LLKJc7gHgqbUQJOe/N9Swm8A/+PgzMkFU
         gajWPB4qBUdag==
Date: Mon, 27 Jun 2022 07:56:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Snir, Marc" <snir@illinois.edu>, perfbook@vger.kernel.org

On Mon, Jun 27, 2022 at 11:52:18PM +0900, Akira Yokosawa wrote:
> On Mon, 27 Jun 2022 07:11:06 -0700, Paul E. McKenney wrote:
> > On Mon, Jun 27, 2022 at 07:32:29PM +0900, Akira Yokosawa wrote:
> [...]
> >>
> >> For the record:
> >>
> >> It turns out that Marc attempted the build under macOS 12.4, which
> >> resulted in a corrupted autodate.tex.
> >> It means utilities/autodate.sh doesn't work as expected under macOS.
> >>
> >> The cause might be the difference of primitive tools such as "date",
> >> "sed", and "grep".  We assume those from GNU, while macOS has those
> >> of BSD origin.
> >>
> >> As I don't have a macOS system at my disposal, I can't help further.
> >>
> >> (I was surprised to know that the build scripts worked without a fatal
> >> error until the first run of pdflatex.)
> > 
> > In theory, it is possible to use the "findutils" and "brew" commands to
> > set up gnu utilities on MacOS, and to do so such that your PATH variable
> > can be used to choose whether the default is the MacOS versions or the
> > gnu versions.  Or so it says here:
> > 
> > https://www.google.com/search?q=latex+on+macos&oq=latex+on+macos&aqs=chrome..69i57j0i22i30l9.3869j1j7&client=ubuntu&sourceid=chrome&ie=UTF-8
> > 
> > I do have an old MacOS system, but it is at home and I am on travel.
> 
> How old is it?  :-)

About three years, but running a current MacOS.

> > I would need to install LaTeX on it (last time I tried, the installation
> > hung), but Marc proved that it is possible to actually install it.  ;-) If
> > I can pass that hurdle, I will try making perfbook use the gnu utilities.
> > 
> > Or is this where someone tells me that  LaTeX on MacOS make use of
> > scripts that rely on the MacOS variants of these commands?  ;-)
> 
> I don't think so.
> If you can make scripts under utilities/ behave as expected,
> "make" should work.
> 
> Except:
> 
> Some of perl scripts have shebang lines of:
> 
>     #!/usr/bin/perl
> 
> , and are invoked directly from recipes in Makefile.
> You need to change them to:
> 
>     #!/usr/bin/env perl
> 
> , so that your PATH setting is respected.  You might need similar
> tweaks for scripts of other languages.
> 
> Good luck!

I will need it.  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Thoughts?
> > 
> > 							Thanx, Paul
> > 
> [...]
