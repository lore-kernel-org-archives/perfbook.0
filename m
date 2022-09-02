Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235949AbiIBLIn (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 2 Sep 2022 07:08:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3FDCE336
        for <perfbook@vger.kernel.org>; Fri,  2 Sep 2022 04:08:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C974BB82A53
        for <perfbook@vger.kernel.org>; Fri,  2 Sep 2022 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662116919;
        bh=xfkgxbY8IfInqfDq6Kqug78yoaozsrp+IF4kktfAClk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rlJpigqqPQAbfxZ3W5wE3iLZrYCnNkM4kNh4oME8oFVSCXyL9uBu5ewCJO4xm3RxH
         8BOVNt7UXYVjaOgCQgMfXdGYH74BoQCKjAdQygR+0/RXrawZ7CE70N8DvNbr7Q3VPL
         xQQZubP5To6RtCk5LQdlJ/rtKvFx/p3wanpcnp9pfeOGabwlCCrQfPHkuQPBCdH2hb
         0Lr/OhGnkJTfRuQ/sUj3UZ4lvlBRdIR1VAghHaQm+jhaNhK8Vi6BfIZjkGn/fdEgtI
         cYzETt+UEr0Xt8icWBT/OHplAgbMZKIfEBNwNQOqVlL2jSpfPoNPIQoy7tADvps2uu
         QhlTZshd5tdKA==
Date: Fri, 2 Sep 2022 04:08:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/2] Fix punctuation around footnotes
Message-ID: <20220902110839.GE6159@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <1d99f4ec-b5a5-52ad-df97-cddaee9f98a5@gmail.com>
 <1d8f63ca-1c10-5b35-6634-3c2351af1943@gmail.com>
 <e03292ee-f379-c8c5-62af-766ac76644ed@gmail.com>
 <20220901164207.GY6159@paulmck-ThinkPad-P17-Gen-1>
 <b815fab4-295a-a0e9-b92a-92a5f71359db@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b815fab4-295a-a0e9-b92a-92a5f71359db@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Sep 02, 2022 at 10:00:24AM +0900, Akira Yokosawa wrote:
> On Thu, 1 Sep 2022 09:42:07 -0700, Paul E. McKenney wrote:
> > On Fri, Sep 02, 2022 at 12:18:11AM +0900, Akira Yokosawa wrote:
> >> On Thu, 1 Sep 2022 22:47:22 +0900, Akira Yokosawa wrote:
> [...]
> >>> --- a/datastruct/datastruct.tex
> >>> +++ b/datastruct/datastruct.tex
> >>> @@ -2132,7 +2132,7 @@ the one hand, and performance and simplicity on the other.
> >>>  Fortunately, the relatively large memories available on modern
> >>>  systems have allowed us to prioritize performance and simplicity
> >>>  over memory overhead.
> >>> -However, even with today's large-memory systems\footnote{
> >>> +However, even with today's large-memory systems,\footnote{
> >>>  	Smartphones with gigabytes of memory, anyone?}
> >> Paul, you might want to update the text of this footnote.
> >> Today's smartphones actually have gigabytes of memory...
> > 
> > Indeed, that was supposed to serve as an example.  For example, back
> > in the day, one might respond to the assertion "All ports serving
> > ocean-going ships are saltwater ports" with "Portland, Oregon, anyone?",
> > thus sarcastically pointing out the fact that the Columbia and Willamette
> > rivers between the Pacific Ocean and the Port of Portland's Terminal 6
> > can both accommodate the ocean-going ships of the 1970s.  (Probably not
> > today's much larger ships, though.  Plus the Port of Portland isn't what
> > it used to be.)
> Ah, now I think I see the sarcasm.
> 
> > 
> > But you are right, that is not going to be at all clear to all native
> > English speakers, let alone non-native English speakers.
> 
> Looking at the git history, this particular footnote once read:
> 
>     Smartphones with hundreds of gigabytes of memory, anyone?
> 
> after commit 6d4f16cc4c5b ("datastruct: Update an outdated footnote").
> You reverted the change in commit 0d4e8640abf ("datastruct: Updates
> and wordsmithing, take two.").
> 
> Weren't you confused when you took 6d4f16cc4c5b ???

Let's see...

This January 2017 webpage announces an 8GB smartphone:

https://www.tweaktown.com/news/55754/zenfone-ar-worlds-first-smartphone-8gb-ram/index.html

And this smartphone history page repeats a claim that the first 1GB
smartphone was in 2011:

https://www.androidauthority.com/smartphone-firsts-946979/

So when I took that patch in late 2018, that footnote was definitely
in need of an update.  On the other hand, I am still a little surprised
that even 100MB would fit into my pocket and run off of a tiny battery.

Except that for someone like me, who once used a refrigerator-sized
computer having ferrite-core memory with 4K of 12-bit words, the "hundreds
of megabytes" is more effective than the "gigabytes".  Except that
most people reading this book won't have been alive when I last used
that system, and for them a smartphone with less than a gigabyte would
probably be ridiculous in the extreme, and thus sarcastic, but in the
opposite sense than I intended.

So maybe you are right about me having been confused when I took that
patch back in 2018, when I did that wordsmithing back in 2021, and
whenever it changed back to "gigabytes".  And perhaps that confusion
was me thinking that it was OK to keep a footnote that is so subject to
change over time and so vulnerable to difference in interpretation.  ;-)

> > So I eliminated that footnote and rewrote that sentence as follows:
> > 
> > 	However, even though the year~2022's pocket-sized smartphones
> > 	sport many gigabytes of memory and its mid-range servers sport
> > 	terabytes, it is sometimes necessary to take extreme measures
> > 	to reduce memory overhead.
> > 
> > Does that help?
> 
> Yes. It is clearer now and no worry of confusion.

Very good, and thank you for your review and comments.

							Thanx, Paul

> >>>  it is sometimes necessary to take extreme measures to reduce
> >>>  memory overhead.
> >> [...]
