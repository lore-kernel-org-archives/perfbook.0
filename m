Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240530AbiAXASf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 23 Jan 2022 19:18:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087B0C06173B
        for <perfbook@vger.kernel.org>; Sun, 23 Jan 2022 16:18:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70A0F611EC
        for <perfbook@vger.kernel.org>; Mon, 24 Jan 2022 00:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642983513;
        bh=U9YYbNAGqjpVyOqIvvfNnt2RY8ZwXRL7nLziIX037EM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=sshJxvwkYybTRDZVFFmm8mP/b626Je1l17lwI9lbZzbjDSzWLeK9QfhQczC2fvedS
         haoWBT5CXyIthjtFdwlrk9fl6ZkZ/6KRN3Po5df7wHEdzPRUUtQNv9+B9lzOgA1b1L
         mVuG2jdV39E8GD7X2wMffMbEgsvAweB41Vh4zHDQuvWrtx9OWcfZpYrg2pwaoztoi9
         u+Vghary+Hle0iok+DM8pdQm1jNDi/unlalq+Jx/atzunXgIb2J5hsSelF5FmDFe0h
         zTlQvbyNImea4Mtc879rIsMbMZBQ4QrqExbLlrrIlL5l5SHDTc8HJfA0hHByYf43Aq
         smvy7AZTe2pMQ==
Date: Sun, 23 Jan 2022 16:18:33 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] bib/perfmeas: Fix doi of McKenney99b
Message-ID: <20220124001833.GD4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <9d07bd21-9988-9b1f-d7f1-c7dae07d7a51@gmail.com>
 <bbb86a86-1656-95c6-36a3-e7dbfa030d22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbb86a86-1656-95c6-36a3-e7dbfa030d22@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Zhouyi Zhou <zhouzhouyi@gmail.com>

On Mon, Jan 24, 2022 at 08:44:17AM +0900, Akira Yokosawa wrote:
> On Fri, 21 Jan 2022 22:32:13 +0900, Akira Yokosawa wrote:
> > Escape sequences of "%3C" and "%3E" in doi cause a build error when
> > "inlinelinks" option in alphapf.bst is set #0 (URLs explicit).
> > 
> > Fix the error by using non-escaped symbols of "<" and ">" instead.
> > 
> > Fixes: 62c6a33781d9 ("bib: url/doi updates")
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Paul,
> 
> You might be confused but I expected you would apply this fix as
> well.

You are quite right, I was confused!  I am not sure why I was confused,
but whatever the reason, I have now queued and pushed this patch.
Thank you both for the patch and for the reminder!

							Thanx, Paul

>         Thanks, Akira
> 
> > ---
> > Hi Zhouyi,
> > 
> > Prompted by your patch "RFC: make some bibliography items better",
> > I tested an option in alphapf.bst (bibliography style file of
> > perfbook), namely "inlinelinks".
> > By setting "#0" to inlinelink (URLs explicit), URL and DOI info
> > in .bib files should be printed in Bibliography.
> > 
> > However, the build failed with McKenney99b.
> > 
> > This patch should fix the build error.
> > 
> > You still need to manually edit alphapf.bst, but please try
> > setting "#0" to inlinelink.
> > 
> > As you will see, if a bibliography has DOI info, URL info in
> > the note field is redundant when the URL is the one reachable
> > via the DOI.
> > 
> >         Thanks, Akira
> > --
> >  bib/perfmeas.bib | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/bib/perfmeas.bib b/bib/perfmeas.bib
> > index 9ba80cfc..51f63bb7 100644
> > --- a/bib/perfmeas.bib
> > +++ b/bib/perfmeas.bib
> > @@ -83,7 +83,7 @@ Machine Language Rewriting",
> >   year = {1999},
> >   pages = {219-234},
> >   bibsource = {DBLP, http://dblp.uni-trier.de},
> > - doi = {10.1002/(SICI)1097-024X(199903)29:3%3C219::AID-SPE230%3E3.0.CO;2-0}
> > + doi = {10.1002/(SICI)1097-024X(199903)29:3<219::AID-SPE230>3.0.CO;2-0}
> >  }
> >  
> >  @Book{Menasce94,
> > 
> > base-commit: cd891db680ae978f5efa362cbdc074483f07042a
