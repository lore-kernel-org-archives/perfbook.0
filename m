Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:60396 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhLPPXF (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 16 Dec 2021 10:23:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 46D0161E53
        for <perfbook@vger.kernel.org>; Thu, 16 Dec 2021 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639668184;
        bh=47p3luaQei8zwDWF9yFQ0JnVGLagFv4CUguZxcsNhZU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HxKuGZNeSsxr9tClBzOBKFx5oQdH5Rn3KUGoozJ8VhKiBbVsjjk47hUJwZpwaZTeO
         f6jggDH6UBtGBSj5XmJkzy7kXnNOy5h1jObXJ2gJmePeUORDkWw9c8V3UEc4bePnPE
         7Uoc6vLqEjdYipWpZRrYQ5BGsyGW5txk2UAAlKLUaFuiCQOoJCWikPoU86nB4UQp6a
         5W/mgoRvGN66dNdueWCP7NV6V58uNUsVXIsXnqdNvw0PinZSA5Mkmeyeu1soRnZ9ra
         IJtO0u1+WFBX/1pH26BPxzjIX8XbTaw0TjPTnq3XgF55L+DoAjiWi74KQ4bHuLSd1r
         wRMtDp4w1nj5Q==
Date: Thu, 16 Dec 2021 07:23:04 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] defer: Retouch RCUusecases.svg by Inkscape
 1.1.1
Message-ID: <20211216152304.GL641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <df989143-2daf-1f80-7800-d514a21c9607@gmail.com>
 <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3d0475-50aa-28dd-92a0-56ad7ba4dca1@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 16, 2021 at 11:06:45PM +0900, Akira Yokosawa wrote:
> On Thu, 16 Dec 2021 16:59:13 +0900, Akira Yokosawa wrote:
> > Some of texts in the figure are lost when rendered by Inkscape
> > 1.1.1 on Fedora 35.
> > Those texts are placed far left from the viewBox of the figure
> > when opened in Inkscape 1.1.1.
> > 
> > This issue is similar to the one resolved by commit 36b07176210d
> > ("defer: Make RCUspacetime.svg compatible with Inkscape 1.0 and
> > later").
> > 
> > Ungroup and adjust x-coordinates of those texts by Inkscape 1.1.1.
> > 
> > Resulting SVG is compatible with Inkscape 0.92.x on Ubuntu 18.04
> > and Ubuntu 20.04 as well as Inkscape >=1.0.
> 
> Well, Firefox still has trouble with this.... (much better, but
> still)
> 
> Paul, please wait for v2.

Idiot here forgot to do the inkscape editing on his Fedora system,
apologies!

Let me try that.

Ah, and I am expecting to do a release before the end of this year,
preferably sooner.  This is not a big deal at all:  Release rather
than edition!

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi Paul,
> > 
> > So I said you are safe as far as you don't rotate texts.
> > Apparently I was wrong!
> > 
> > I'm suspecting the cause of the incompatibility is likely related to
> > grouping of texts and doing some operation on the grouped text.
> > 
> > In this retouch, I did ungrouping only.  So you might need to do
> > proper grouping if you need further edit.
> > 
> >         Thanks, Akira
> > --
> >  defer/RCUusecases.svg | 1406 +++++++++++++++++++----------------------
> >  1 file changed, 656 insertions(+), 750 deletions(-)
> > 
> > diff --git a/defer/RCUusecases.svg b/defer/RCUusecases.svg
> [...]
