Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhLSRss (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 19 Dec 2021 12:48:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9431AC061574
        for <perfbook@vger.kernel.org>; Sun, 19 Dec 2021 09:48:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33D9760ED7
        for <perfbook@vger.kernel.org>; Sun, 19 Dec 2021 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639936127;
        bh=kKcDNCORYKi6ihHdr3HgrQNh1AxnvxvJxb9dHsclHZQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=F6fUlvqAl0puobl0t1wPh+hBscoTg5kGJN77i6cKk3IyOac9Yuo+XZykanMUoJVUx
         3y/VJNFbFFYn9hnddNXP6wblvOf2GTCCJImCrJ00Gfge2uMLBd/50r8vyDQWOUSkpV
         VOAM18WVvS1hhWnkNUgVa+wZ26v70FrnxDl9y12ZGitIC+pfK8htBu4nwbFzAeHmH9
         OlgfX4mRrGF3TIfeNiPoAnAsEAl1qHED6AeFhLQkaDKPhKU8LeD2d6hhoc1LsyOY4J
         Z0Kvb48jy0JGy/bNN5a275FonE84IkFWoJ7kC1x+leb/cw6tdYCu2osQ+HGmjr9XXw
         jyZ54BX1scxEA==
Date: Sun, 19 Dec 2021 09:48:47 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Simplify SVG files for compatibility
 with browsers
Message-ID: <20211219174847.GS641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <713d5a73-f4ea-f415-fe25-a42c11d248ac@gmail.com>
 <20211217172315.GW641268@paulmck-ThinkPad-P17-Gen-1>
 <7242e6ef-4533-47ae-95a6-8cbb21786c7e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7242e6ef-4533-47ae-95a6-8cbb21786c7e@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 19, 2021 at 01:31:54PM +0900, Akira Yokosawa wrote:
> On Fri, 17 Dec 2021 09:23:15 -0800, Paul E. McKenney wrote:
> > On Fri, Dec 17, 2021 at 11:14:50PM +0900, Akira Yokosawa wrote:
> >> RCUspacetime.svg and RCUusecases.svg are not properly rendered
> >> in a browser.
> >>
> >> By reverse converting from properly-rendered PDF, we are lucky to
> >> obtain browser-compatible SVGs of these figures.
> >>
> >> Steps of reverse conversion (example for defer/RCUusecases.svg):
> >>
> >>   1. Generate a properly rendered PDF with fixsvgfonts.sh applied:
> >>
> >>         make defer/RCUusecases.pdf
> >>
> >>   2. Confirm the PDF looks OK.
> >>   3. Export as plain-SVG from PDF (Inkscape >= 1.0):
> >>
> >>         inkscape -l -o defer/RCUusecases.svg defer/RCUusecases.pdf
> >>
> >>      ,or with Inkscape < 1.0:
> >>
> >>         inkscape -l defer/RCUusecases.svg defer/RCUusecases.pdf
> >>
> >>   4. Confirm the plain-SVG looks OK in a browser.
> >>   5. Confirm that the plain-SVG can be edited by Inkscape.
> >>
> >> Note: Plain-SVG is a SVG format where Inkscape-specific attributes
> >>     and UI settings are removed.  It is meant for portability across
> >>     different SVG editors.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > 
> > Queued and pushed, thank you!
> > 
> >> ---
> >> Hi Paul,
> >>
> >> You might want to call this "Inkscape black magic!".
> >> But it works as far as these two figures are concerned.
> >>
> >> It's up to you whether or not taking this.
> >> At least this change reduces their sizes almost by half.
> > 
> > Even better!
> > 
> >> Note that simply saving a problematic SVG as a plain-SVG by
> >> Inkscape, exported SVG is still not compatible with browsers.
> > 
> > Ouch!!!
> > 
> >> As a matter of fact, texts in RCUusecases.svg at current master can
> >> not be edited in Inkscape 1.1.1 in my test even after upgrouping
> >> texts.  For example, font size can not be changed.
> >>
> >> After the reverse conversion to plain-SVG, their font sizes become
> >> changeable.
> > 
> > And editing is significantly less cranky, so thank you again!
> 
> Well, changing font sizes might be possible, but the result is not
> what you would expect.
> 
> When Inkscape imports PDF, texts are divided into words and
> each letter in a word has explicit x-position specified.
> All spaces are lost along the way.
> 
> This means when you increase font size or change font style,
> position of each letter does not change, resulting in bad looking
> texts.
> 
> So I'm beginning to think that this patch should be reverted
> despite the browser incompatibility.
> 
> I'll see further for the way to make these SVGs both editable
> and browser compatible, maybe after the upcoming release of
> perfbook.

It looks fine as is, so agreed, browser compatibility is not at all
urgent.  If someone gets annoyed by it in the short term, we can always
ask them for help, right?  ;-)

> Sorry for making noise by proposing the crude approach of
> PDF -> SVG conversion.

Not a problem, no need to apologize!  It does appear that inkscape
version compatibility is a bit more challenging than one might hope.

> List of commits to be reverted:
>   89115b70dc0f ("defer: Update RCUusecases.svg grouping")
>   305b778abcb8 ("defer: Simplify SVG files for compatibility with browsers")

Done!

What I did was to download the inkscape v1.1 .AppImage, mark it
executable, and place it in my bin directory.

Convenient!  Though .AppImage files will of course turn into just as
ugly a security hole as the old self-extracting .EXE files.  Can't have
everything!  ;-)

And in theory, it is no safer to download an RPP or DEB and install
it than it is to download an executable...

							Thanx, Paul

>         Thanks, Akira
> --
> > 
> > I adjusted grouping and fixed a pre-existing alignment issue.
> > The resulting .svg rendered fine in Chrome, so here is hoping!
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> 
