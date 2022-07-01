Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229623AbiGAATR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 30 Jun 2022 20:19:17 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039F442A03
        for <perfbook@vger.kernel.org>; Thu, 30 Jun 2022 17:19:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 45E11CE2D94
        for <perfbook@vger.kernel.org>; Fri,  1 Jul 2022 00:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656634749;
        bh=PDCtvQV+V3vmidU24VOVvLCLN0/HioTcQhV0YW9/Jzc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Akxh36bQRP3Ih61XZO5lZ3DOaqPJuooc9qfek+e5PnjzgNSS1My63IxFpzZ4u795a
         nBtJi20w8hX8g/5KuSKbvjSRM7Z04DvbhVM9/u56dMzYcp4I9jdqR1suWpYTV8xXgO
         3Kx4ZFSf4dmE4cx+/Hcnbo0tqpG9CZolpG6eFoKwcAcK9oYMupD41nP1HmzBflRknL
         IGp4ZFo6xqnOrMEBVFeMo1poklCeFWrb8fQ5nFtF2gYkJvuI9fMzTbcXmd5ZgjVWIs
         3zCH9bVWwz9Z0c2/qBK5164gVYQzpQ1wJf2gs7PFFRsvTLPL4A1E+9c5I+DpBamoXx
         xaAp8emCkbN1g==
Date: Thu, 30 Jun 2022 17:19:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220701001909.GA2898500@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
 <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
 <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
 <aebf5e16-e85e-c2a6-77a0-c48a6f33cf3b@gmail.com>
 <20220630142616.GV1790663@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630142616.GV1790663@paulmck-ThinkPad-P17-Gen-1>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Snir, Marc" <snir@illinois.edu>, perfbook@vger.kernel.org

On Thu, Jun 30, 2022 at 07:26:16AM -0700, Paul E. McKenney wrote:
> On Thu, Jun 30, 2022 at 11:18:46PM +0900, Akira Yokosawa wrote:
> > On Wed, 29 Jun 2022 17:27:20 -0700, Paul E. McKenney wrote:
> > > OK, MacTex worked much better for me, meaning that this time it did
> > > not hang when I attempted to install it.  However, once installed,
> > > it complains that it is missing xcrun, whatever that might be.
> > 
> > In search of "macOS 12 xcrun error", I got the following:
> > 
> > https://osxdaily.com/2021/07/19/fix-xcrun-error-invalid-active-developer-path-error-terminal-mac/
> > 
> > Is your issue similar to this one?
> > 
> > (I have no experience with macOS, so take this as just a hint.)
> 
> I have no idea, but I will give it a try later today, Pacific Time.
> Either way, thank you for the hint!

OK, it does take some time to install.  But I at least started the
process today.  ;-)

							Thanx, Paul

> > > My thought is to get a release out, then see what can be done about
> > > making this build on MacOS.  Seem reasonable?
> > 
> > Sounds reasonable to me!
> 
> Very good, I believe I am a bit overdue for a release anyway.  After all,
> we have 156 commits since the last release.  ;-)
> 
> 							Thanx, Paul
> 
> >         Thanks, Akira
> > 
> > > 
> > > Hey, I said I had access to MacOS, not that I was at all competent at
> > > installing software on it.  ;-)
> > > 
> > > 							Thanx, Paul
> > > 
> > [...]
