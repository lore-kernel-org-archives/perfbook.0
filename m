Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235489AbhLQPpq (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 17 Dec 2021 10:45:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6CAC061574
        for <perfbook@vger.kernel.org>; Fri, 17 Dec 2021 07:45:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33DFA62279
        for <perfbook@vger.kernel.org>; Fri, 17 Dec 2021 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639755944;
        bh=4ra5/EKvWTPbZCCjpVhVyW3ySTprFZ9Y55q24uikKws=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rmVKL83kdzAOCX/u5youhtsJbU7amMYerfAFTX3jRpp5gBdv70VewWDxu7/CBH1gY
         n+ZJdQyb92TaGy/nWCvMFmgL63wPVaGczh2M/9Gz64I9s6WyIleSoNep7C5MAyykTf
         Fu6ZH4q8Ql3hKjPnn6i9zW9rkVUG8GO0orlsZf/sZpnO8BJJDBFup5jC1G+nu5txAF
         1WNWVq0wbJy259UHPbSZX+81f5JU1DhmE3MIUGu6dax2gWFjbry7lq/tl80hKTw9sC
         2VS5rXiNVZxVtQh5J9Wt0uPloL3LWPO0EhXH2z9KQGrWZ00GTCJ9l78R8ute+qK07Q
         KUcTKgplhtPIw==
Date: Fri, 17 Dec 2021 07:45:44 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape
 1.1.1
Message-ID: <20211217154544.GR641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
 <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
 <20211216152304.GL641268@paulmck-ThinkPad-P17-Gen-1>
 <f7e2e4d6-09bb-a173-c3e8-3246577a943d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7e2e4d6-09bb-a173-c3e8-3246577a943d@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 17, 2021 at 10:17:40AM +0900, Akira Yokosawa wrote:
> On Thu, 16 Dec 2021 07:23:04 -0800, Paul E. McKenney wrote:
> > On Thu, Dec 16, 2021 at 11:06:45PM +0900, Akira Yokosawa wrote:
> >> On Thu, 16 Dec 2021 16:59:13 +0900, Akira Yokosawa wrote:
> >>> Some of texts in the figure are lost when rendered by Inkscape
> >>> 1.1.1 on Fedora 35.
> >>> Those texts are placed far left from the viewBox of the figure
> >>> when opened in Inkscape 1.1.1.
> >>>
> >>> This issue is similar to the one resolved by commit 36b07176210d
> >>> ("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
> >>> later").
> >>>
> >>> Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.
> >>>
> >>> Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
> >>> and Ubuntu 20.04 as well as Inkscape >=1.0.
> >>
> >> Well, Firefox still has trouble with this.... (much better, but
> >> still)
> >>
> >> Paul, please wait for v2.
> > 
> > Idiot here forgot to do the inkscape editing on his Fedora system,
> > apologies!
> > 
> > Let me try that.
> > 
> 
> I'm seeing the refined SVG in Firefox, and it still lacks some of
> texts.
> 
> Now I'm opening the SVG in a text editor...
> 
> Oh, there actually are a dozen of "transform="rotate(90)"
> and "transform="rotate(-90)" directives.
> So you did rotate those texts, didn't you?

When I opened the diagram under Fedora, the text at the tops of many of
the boxes was displaced to the left by a couple of page widths worth.

All I did was go into the top-level group, make like I was going to change
the text of one of the affected text boxes, add a couple of rectangles,
and then delete them.  The idea was to force inkscape to save the diagram.

> For perfbook, web-browser compatibility is not an issue,
> but it might bite you when you reuse this figure in an
> html page.
> 
> And I've now noticed that RCUspacetime.svg is not rendered
> right in Firefox, either.
> 
> Let me see if there is a way to make them browser compatible.

I will pull in your patches and see what it looks like.  I had not
considered it before, but I do agree that having a browser-compatible
.svg is a very good thing, so thank you for checking up on this.

For my part, what I have done is to uninstall inkscape on the problematic
system.  This should help prevent future instances of corruption.  :-/

Again, thank you for checking up on this and debugging it!

> > Ah, and I am expecting to do a release before the end of this year,
> > preferably sooner.  This is not a big deal at all:  Release rather
> > than edition!
> 
> Nice!
> I'll review new contents in rcuusage.tex this weekend.

Looking forward to it!

							Thanx, Paul

>         Thanks, Akira
> 
> 
> > 
> > 							Thanx, Paul
> > 
> >>         Thanks, Akira
> >>
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> ---
> >>> Hi Paul,
> >>>
> >>> So I said you are safe as far as you don't rotate texts.
> >>> Apparently I was wrong!
> >>>
> >>> I'm suspecting the cause of the incompatibility is likely related to
> >>> grouping of texts and doing some operation on the grouped text.
> >>>
> >>> In this retouch, I did ungrouping only.  So you might need to do
> >>> proper grouping if you need further edit.
> >>>
> >>>         Thanks, Akira
> >>> --
> >>>  defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
> >>>  1 file changed, 656 insertions(+), 750 deletions(-)
> >>>
> >>> diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
> >> [...]
