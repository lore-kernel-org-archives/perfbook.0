Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiF3A1X (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 29 Jun 2022 20:27:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4172A27E
        for <perfbook@vger.kernel.org>; Wed, 29 Jun 2022 17:27:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA87161EDC
        for <perfbook@vger.kernel.org>; Thu, 30 Jun 2022 00:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656548841;
        bh=cPdz0LztO3IyZLRwKmXaKt+oKCWCh4r9ZKIJO05kzi0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DvhBU5vAd3Sps/XKegWbHSb5Bdtpc8LZCD9JFT7mhUl9BXdQxWj5kzeL22CC7oAd/
         dOYwEQarPhJJdXmwNYjlYGrJrwliOT94wPMZGgL4qCgGGeS8rB6dsxSs+tiOC7x+LT
         uxA3kPbitloNYCAUmrhwt696SLF8uJbbBNOE4xQLjuVn4XGIlEAJlw0H5CVnP5s2Nv
         hDDUdUE0CeK6x75uITVTJGNS7kJvXNHIJ7Oeir0Q10N7HXoto8acdXrJmOY6GR840o
         /L9kwGty6All4YZdVudppZGdx8n6vyrn8H89CCmZ70S4pr4N6Hep0FrV5OoK3D6ZwU
         oSssCcfg09kDA==
Date: Wed, 29 Jun 2022 17:27:20 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
 <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
List-ID: <perfbook.vger.kernel.org>
To: "Snir, Marc" <snir@illinois.edu>
Cc: Akira Yokosawa <akiyks@gmail.com>, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

OK, MacTex worked much better for me, meaning that this time it did
not hang when I attempted to install it.  However, once installed,
it complains that it is missing xcrun, whatever that might be.

My thought is to get a release out, then see what can be done about
making this build on MacOS.  Seem reasonable?

Hey, I said I had access to MacOS, not that I was at all competent at
installing software on it.  ;-)

							Thanx, Paul

On Mon, Jun 27, 2022 at 03:36:20PM +0000, Snir, Marc wrote:
> I used MacTex to install Latex and mostly used Brew to install Linux tools
> 
> On Jun 27, 2022, at 10:19 AM, Akira Yokosawa <akiyks@gmail.com<mailto:akiyks@gmail.com>> wrote:
> 
> On Mon, 27 Jun 2022 07:56:28 -0700, Paul E. McKenney wrote:
> On Mon, Jun 27, 2022 at 11:52:18PM +0900, Akira Yokosawa wrote:
> On Mon, 27 Jun 2022 07:11:06 -0700, Paul E. McKenney wrote:
> On Mon, Jun 27, 2022 at 07:32:29PM +0900, Akira Yokosawa wrote:
> [...]
> 
> For the record:
> 
> It turns out that Marc attempted the build under macOS 12.4, which
> resulted in a corrupted autodate.tex.
> It means utilities/autodate.sh doesn't work as expected under macOS.
> 
> The cause might be the difference of primitive tools such as "date",
> "sed", and "grep". We assume those from GNU, while macOS has those
> of BSD origin.
> 
> As I don't have a macOS system at my disposal, I can't help further.
> 
> (I was surprised to know that the build scripts worked without a fatal
> error until the first run of pdflatex.)
> 
> In theory, it is possible to use the "findutils" and "brew" commands to
> set up gnu utilities on MacOS, and to do so such that your PATH variable
> can be used to choose whether the default is the MacOS versions or the
> gnu versions. Or so it says here:
> 
> https://urldefense.com/v3/__https://www.google.com/search?q=latex*on*macos&oq=latex*on*macos&aqs=chrome..69i57j0i22i30l9.3869j1j7&client=ubuntu&sourceid=chrome&ie=UTF-8__;KysrKw!!DZ3fjg!4_j5YLKDbzfq9B7h6-F8zxtMnksVmYkZGrTI8UNScPy0Hqxl4_ieTdmHu_WSoG9aMUBWzuwNnob4gw$
> 
> I do have an old MacOS system, but it is at home and I am on travel.
> 
> How old is it? :-)
> 
> About three years, but running a current MacOS.
> 
> I would need to install LaTeX on it (last time I tried, the installation
> hung), but Marc proved that it is possible to actually install it. ;-) If
> I can pass that hurdle, I will try making perfbook use the gnu utilities.
> 
> Or is this where someone tells me that LaTeX on MacOS make use of
> scripts that rely on the MacOS variants of these commands? ;-)
> 
> I don't think so.
> If you can make scripts under utilities/ behave as expected,
> "make" should work.
> 
> Except:
> 
> Some of perl scripts have shebang lines of:
> 
> #!/usr/bin/perl
> 
> , and are invoked directly from recipes in Makefile.
> You need to change them to:
> 
> #!/usr/bin/env perl
> 
> , so that your PATH setting is respected. You might need similar
> tweaks for scripts of other languages.
> I was confused. perl is perl. There is no GNU or BSD flavor...
> 
> Thanks, Akira
> 
> 
> Good luck!
> 
> I will need it. ;-)
> 
> Thanx, Paul
> 
> Thanks, Akira
> 
> 
> Thoughts?
> 
> Thanx, Paul
> 
> [...]
> 
