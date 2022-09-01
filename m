Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232404AbiIAQmJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 1 Sep 2022 12:42:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C11EA74DE5
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 09:42:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53BEB61FA5
        for <perfbook@vger.kernel.org>; Thu,  1 Sep 2022 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662050527;
        bh=1vjBElejSzvN6WwTV6mEkJyc4HymwJO7KVzVjXSI88c=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=kGt3fQtPcWMBdLneSExWPd6PO6uwwttKZWNYUOH2IYse+IGEEsmZlBhj5l33CvrIT
         54dcGGhauBY9xJkly2qNQragl3u/OOoHsQpTMug5VtxJcShUiRaJsSwWk2t87L/JmH
         rerynkIYuLSuCOv5oBaUOH7kO+FacIs6+ksZNJRKbCC7HlNg1VL/gza0yeggW/xl2x
         eyJvIP2kjVpexTfMEAnj0oPFfmYPYbtl4HZPDik+XP8tp001MaFjwIhDyRxRWFRTIb
         JV8BU64OJk4jvEto9f0NW8VR/jY5hiq2GHA1h1RwYKsG/40LdV6HsBOwfeZsyAP+9l
         CniZYr5F1UBZg==
Date: Thu, 1 Sep 2022 09:42:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Message-ID: <20220901164207.GY6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
 <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
 <e03292ee-f379-c8c5-62af-766ac76644ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e03292ee-f379-c8c5-62af-766ac76644ed@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Sep 02, 2022 at 12:18:11AM +0900, Akira Yokosawa wrote:
> On Thu, 1 Sep 2022 22:47:22 +0900, Akira Yokosawa wrote:
> > Perfbook's convention is to put footnotes after punctuation marks.
> > There are a couple of footnotes placed in front of commas.
> > 
> > Fix them.
> > 
> > While here, fill in a missing comma in front of a footnote in datastruct
> > so that the phrase "even with today's large-memory systems" reads as such.
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > I'm thinking of adding rules to catch this sort of inconsistencies in
> > punctcheck.pl.
> > The one in datastuct would be hard for such a dumb script, though.
> > 
> >         Thanks, Akira
> > --
> >  datastruct/datastruct.tex     | 2 +-
> >  intro/intro.tex               | 4 ++--
> >  toolsoftrade/toolsoftrade.tex | 4 ++--
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index 714795f7c5ed..2b802e0518a5 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> > @@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
> >  Fortunately, the relatively large memories available on modern
> >  systems have allowed us to prioritize performance and simplicity
> >  over memory overhead.
> > -However, even with today's large-memory systems\footnote{
> > +However, even with today's large-memory systems,\footnote{
> >  	Smartphones with gigabytes of memory, anyone?}
> Paul, you might want to update the text of this footnote.
> Today's smartphones actually have gigabytes of memory...

Indeed, that was supposed to serve as an example.  For example, back
in the day, one might respond to the assertion "All ports serving
ocean-going ships are saltwater ports" with "Portland, Oregon, anyone?",
thus sarcastically pointing out the fact that the Columbia and Willamette
rivers between the Pacific Ocean and the Port of Portland's Terminal 6
can both accommodate the ocean-going ships of the 1970s.  (Probably not
today's much larger ships, though.  Plus the Port of Portland isn't what
it used to be.)

But you are right, that is not going to be at all clear to all native
English speakers, let alone non-native English speakers.

So I eliminated that footnote and rewrote that sentence as follows:

	However, even though the year~2022's pocket-sized smartphones
	sport many gigabytes of memory and its mid-range servers sport
	terabytes, it is sometimes necessary to take extreme measures
	to reduce memory overhead.

Does that help?

							Thanx, Paul

>         Thanks, Akira
> 
> >  it is sometimes necessary to take extreme measures to reduce
> >  memory overhead.
> [...]
