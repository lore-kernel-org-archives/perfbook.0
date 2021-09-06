Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:44442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229977AbhIFT2C (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Mon, 6 Sep 2021 15:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630956417;
        bh=hQeGZEAPrPxn2kOUVWQGSvMaDzFaEepuv3ZQ9+QTGno=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JPlgSLRTO8dECK6HCB5f2M+ITKOUQvG4JshRB6cb8ztzRo6J8t0JGaziX6HkIVvrJ
         w7awtY84P0i+U8RWkAUB3/otzyMRqLPEGhDLdjRoBwRzOzIrogWDHwZ3ZtixBzt0Ea
         gj0kEUY4VrKBDxhVK8aCaqo2pgWp8PGvzisoUeHXPBiE5HwmxLsZTjTz12DNYLDrCG
         xNv8yRcfxsI6LgHWcW5ng9MWHsqoGz1ZRSaj4lXjzy06cHadPT7rE692iD572GUSUM
         G++VW7lJi+PEmpXZ9ikpUxV69bm05sE8KUgoaUNH3l42dED2IusudHw+nUdq/+LfIZ
         411RJCU9VmB1A==
Date: Mon, 6 Sep 2021 12:26:57 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [Suggestion -perfbook] Abandon font embedding by gnuplot
Message-ID: <20210906192657.GA4156@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
 <8385ce6a-f313-6c8a-d171-bf5a5f868ec9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8385ce6a-f313-6c8a-d171-bf5a5f868ec9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Sep 05, 2021 at 08:05:44PM +0900, Akira Yokosawa wrote:
> On Fri, 3 Sep 2021 17:45:13 +0900, Akira Yokosawa wrote:
> > Hi Paul,
> > 
> [...]
> > 
> > I think the fontfile option is for embedding font data into .eps
> > files.
> > 
> > Now we are doing .eps -> .pdf conversion via a2ping (or ghostscript),
> > so I don't think font embedding is necessary.
> > 
> > Furthermore, gnuplot's default of Helvetica font is overridden on-the-fly
> > by fixfonts.sh and its friends.
> > 
> > So there is no concern of embedding Helvetica font in the generated
> > pdf figures.
> > 
> > In the test on my side, generated pdf figures have the same font
> > properties regardless of the fontfile option.
> > 
> > So I'd like to ask you if it is ok to remove those fontfile options
> > in the plot scripts under CodeSamples/.
> > Removing them will reduce .eps file size and hopefully might reduce
> > time of (the lots of) .eps -> .pdf conversions.
> 
> Well, in reality, eps -> .pdf conversion takes longer when
> the fontfile option is removed.
> I guess this is because ghostscript needs to fetch a proper font
> file on the system to embed used font data into PDF.
> 
> So, I'm retracting this suggestion.
> 
> Sorry for the noise.

Not a problem, in fact, thank you for trying it out.

> > Side note: plot.sh under formal/data should be moved under
> > CodeSamples/formal/ for the sake of consistency, I suppose.
> 
> I'll try this directory move.

Sounds good, and I am looking forward to seeing the patch.

							Thanx, Paul
