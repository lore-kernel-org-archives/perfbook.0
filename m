Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbiDSRbg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 19 Apr 2022 13:31:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94FA6D7A
        for <perfbook@vger.kernel.org>; Tue, 19 Apr 2022 10:28:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 545BAB81992
        for <perfbook@vger.kernel.org>; Tue, 19 Apr 2022 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650389331;
        bh=OK2aimNtRY4u86ldMmMyIY6/76Xs01tFvRQMhepMY0I=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HYfrNZz37urE1SwMGE7NNC/bTkEzaOARPHjTo9JqGlMZw5eRh+S5T9TWKQRGh14LM
         DxLxAa2mbBrNzFvyJGJEhUcO8hUniLLc3+U4MJ+VRNCyzC7sElO9rbab+Eu9GNGXYf
         Udyr9WYP19/Y1/s1lCtPTiJXrYXTcO8iLNqvRhNcP/SYoDbWmyVG2nDl7XsGyzEr1S
         2FIVtrVF8NNoOQyjKr5wNvi4mJzRS6Gu4Pktfr+A+9+XPLJKZQ2t755DHt4iAI8AzI
         8DsPXJry03elHeapqbGHpiu9X6IR0i7YKvyj9WY8VMQOgc0D6bKGquaidp6PQCexRR
         SeknPeR7x5X7g==
Date: Tue, 19 Apr 2022 10:28:50 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: The answer of Quiz C.8 is not quite reasonable
Message-ID: <20220419172850.GO4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220414174225.GA29861@haolee.io>
 <20220417174454.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <20220418080117.GC12176@haolee.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220418080117.GC12176@haolee.io>
List-ID: <perfbook.vger.kernel.org>
To: Hao Lee <haolee.swjtu@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Apr 18, 2022 at 08:01:17AM +0000, Hao Lee wrote:
> On Sun, Apr 17, 2022 at 10:44:54AM -0700, Paul E. McKenney wrote:
> > On Thu, Apr 14, 2022 at 05:42:25PM +0000, Hao Lee wrote:
> > > Hi,
> > > 
> > > At the beginning of C.3.3 we have supposed the cache line containing "a"
> > > resides _only_ in _CPU1’s_ cache. I think this is why _CPU0_ has to send
> > > a "_read_ invalidate message" to _retrieve_ the cache line and invalid
> > > CPU1's cache line.
> > > 
> > > However, the answer says the reason is the cache line in question
> > > contains more than just the variable a. I can't understand the logical
> > > relationship between this answer and the question. Am I missing
> > > something here? Thanks.
> > 
> > I added the commit shown below.  Does that help?
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 36fe14d5ebe406e331a5d89533fe3187d2019898
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Sun Apr 17 10:41:33 2022 -0700
> > 
> >     appendix/whymb: Clarify QQ C.8
> >     
> >     More clearly note the presence of data other than the variable a.
> >     
> >     Reported-by: Hao Lee <haolee.swjtu@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > index 8f607e35..43f1307b 100644
> > --- a/appendix/whymb/whymemorybarriers.tex
> > +++ b/appendix/whymb/whymemorybarriers.tex
> > @@ -821,9 +821,14 @@ Then the sequence of operations might be as follows:
> >  	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
> >  	why does CPU~0 need to issue a ``read invalidate''
> >  	rather than a simple ``invalidate''?
> > +	After all, \co{foo()} will overwrite \co{a} in any case, so why
> > +	should it care about the old value of \co{a}?
> 
> Totally clear!
> 
> And we may also need to add some details to C.3.1:
> 
> 	With the addition of these store buffers, CPU 0 can simply
> 	record its write in its store buffer and continue executing.
> 	When the cache line does finally make its way from CPU 1 to CPU
> 	0, the data will be moved from the store buffer to the cache
> 	line.
> 
> This passage explains why we need a store buffer, but I think the data
> in store buffer won't be moved directly to the cache line.
> Instead, the store buffer must be merged with the cache line responded
> by CPU1, and only after that can it be moved to CPU0's cache line.

You lost me here.

Ah, maybe the missing point is that store buffers do not necessarily
maintain full cache lines, but only the data that was actually stored.
Or, if the store buffer does contain full cache lines, it also contains
a mask to indicate what portions of the cache line need to be updated.

Does that help, or am I missing your point?

							Thanx, Paul

> Thanks,
> Hao Lee
> 
> >  }\QuickQuizAnswer{
> > -	Because the cache line in question contains more than just the
> > +	Because the cache line in question contains more data than just the
> >  	variable \co{a}.
> > +	Issuing ``invalidate'' instead of the needed ``read invalidate''
> > +	would cause that other data to be lost, which would constitute
> > +	a serious bug in the hardware.
> >  }\QuickQuizEnd
> >  
> >  The hardware designers cannot help directly here, since the CPUs have
