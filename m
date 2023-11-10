Return-Path: <perfbook-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C93C4332F
	for <perfbook@archiver.kernel.org>; Fri, 10 Nov 2023 18:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbjKJS1C (ORCPT <rfc822;perfbook@archiver.kernel.org>);
        Fri, 10 Nov 2023 13:27:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbjKJSZ1 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 Nov 2023 13:25:27 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B047D98
        for <perfbook@vger.kernel.org>; Thu,  9 Nov 2023 22:47:17 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DBFC433D9;
        Fri, 10 Nov 2023 04:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699591963;
        bh=J4qGYDQMV1SmU4IkkzxyjL6PFWSnAHQTAPEtMr2yWxc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=TaJeqwpXeGtjMNgHG5qwyEiyAmHxxKhBSgeRdaEMhSr6vgAg607zhRce8w95HKy+4
         k+p17I7fNmB6h+ZulQhzIvRKuglvgZZs8d2CY6I6K3WXaO2D6nv0dqY+goZsCu8onQ
         8fJpdQ5At9gU3grQKjXAXdNhUPrCCstiNzttD62/rkOtleUhSjG11bmZzhE9JeeoXP
         ZRbtq9mOA/rFLi7OFXNtzJiBnTQg+bYfsRxtFD241otyBUsMJcXm9pf+4+e0nREvsL
         cjeOllJ2YRQOuLKcWq/CTpO5drNwqxzeuh+R+huH6se65HnfudZa7WMLU8M1Dcayz+
         Z06xy5nWnqU3g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id C2621CE1999; Thu,  9 Nov 2023 20:52:41 -0800 (PST)
Date:   Thu, 9 Nov 2023 20:52:41 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     perfbook@vger.kernel.org
Subject: Re: Set PDF metadata from LaTeX title/author commands?
Message-ID: <a7aca0c0-8d08-4314-8840-284321a21219@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e50d0627-9e73-4afa-b097-ac3de3949cee@paulmck-laptop>
 <d6d15279-b2f6-46d1-9d2f-84f9a21985b0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d15279-b2f6-46d1-9d2f-84f9a21985b0@gmail.com>
Precedence: bulk
List-ID: <perfbook.vger.kernel.org>
X-Mailing-List: perfbook@vger.kernel.org

On Fri, Nov 10, 2023 at 12:15:26PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On 2023/11/10 9:48, Paul E. McKenney wrote:
> > Hello, Akira,
> > 
> > Is the patch shown below reasonable, or would this mess things up?
> > 
> > It is nice seeing the title at the top of the "evince" window, but not
> > so nice that we should risk anything going wrong.  And I vaguely recall
> > this being discussed, but do not see any emails or commits mentioning
> > pdfusetitle, so I figured I should ask.  ;-)
> 
> I don't remember any discussion about pdfusetitle.
> 
> As far as I see, this shouldn't do any harm.
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thank you for checking!  I have queued and pushed this with your
Reviewed-by.

							Thanx, Paul

>         Thanks, Akira
> 
> 
> > 
> > 						Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 3edff9639ae80c03f0be9e506f053dd3096b74d8
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Thu Nov 9 16:43:48 2023 -0800
> > 
> >     perfbook-lt: Set PDF metadata from LaTeX title and author
> >     
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> > index 3b8cb1cd..ec457599 100644
> > --- a/perfbook-lt.tex
> > +++ b/perfbook-lt.tex
> > @@ -76,7 +76,7 @@
> >  \usepackage[nottoc]{tocbibind}
> >  \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
> >  \usepackage{parnotes} % for footnotes in tabularx
> > -\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
> > +\usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all,pdfusetitle]{hyperref}
> >  \usepackage{footnotebackref} % to enable cross-ref of footnote
> >  \usepackage[all]{hypcap} % for going to the top of figure and table
> >  \usepackage{mfirstuc}[=v2.07] % v2.08 or later is not compatible with our
