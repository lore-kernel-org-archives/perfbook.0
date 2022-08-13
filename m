Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMCTZ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 12 Aug 2022 22:19:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFEA43E7D
        for <perfbook@vger.kernel.org>; Fri, 12 Aug 2022 19:19:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE0FCB8255C
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 02:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660357161;
        bh=IbOn9sZR07e0VtCSn8YgV9D7PxMSkxK4BLU+iTmPR24=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=DfdNp3PgdKRMuEK96V3TY9PNTLML7bMQQh97CHcE9mCLw9eWPoh5ppJwlSyjWVilA
         czGlLRoQHb2HFQsYdU+xEmrxJ5Cv+hmyzBpDSOM10ZeCyWFk2t+Tia/5HUpFEI4S6D
         OE+b9I79X98t3+yQmmqOrqA37mzF3w4eCFTvVtOYd612O1eQMIt267S8vRfOrllky2
         fquxq1Fr4jQ2aXqo5yGU0nh2r69wWkNTfPHatxM2fny53B6ElZbs+2A9Nq+mAZwtGh
         yHSIpVhV9pvAYadcZgeb/H5T3fmbOnpBhvLxYbChjBd4mHFWGvUl9nJfkCiJJil22V
         qu8oxQFOBpYVQ==
Date: Fri, 12 Aug 2022 19:19:21 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] count: The fast path is for the write side
Message-ID: <20220813021921.GG2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FV_ngVf2dKkaTMD0QM1713ppDBj-yfQJTOuqmnUUyOncw@mail.gmail.com>
 <20220812211508.GF2125313@paulmck-ThinkPad-P17-Gen-1>
 <e5a0ed28-c925-aea5-00fe-56cef7940362@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5a0ed28-c925-aea5-00fe-56cef7940362@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Elad Lahav <e2lahav@gmail.com>, perfbook@vger.kernel.org

On Sat, Aug 13, 2022 at 11:12:07AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> A minor nit:
> 
> On Fri, 12 Aug 2022 14:15:08 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 12, 2022 at 02:38:06PM -0400, Elad Lahav wrote:
> >> Sent as an attachment because I'm behind a corporate firewall and can
> >> only use Gmail's ^$*&^@# web interface. If that's not acceptable I'll
> >> find another method to send a Real Text Email, just like mother nature
> >> intended it to be.
> > 
> > For the time being, it is fine.  Longer term, it would be good to find
> > a way to send a Real Text Email, for old time's sake.  ;-)
> > 
> > Queued and pushed, thank you!
> > 
> > 							Thanx, Paul
> > 
> >> --Elad
> > 
> >> From 153cd4261fe58ed7f26bb0b1232eae2de43070ad Mon Sep 17 00:00:00 2001
> >> From: Elad Lahav <elahav@qnx.com>
> >> Date: Fri, 12 Aug 2022 13:04:08 -0400
> >> Subject: [PATCH] count: The fast path is for the write side, not the read
> >>  side.
> >>
> >> Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> 
> So, the email addresses in From: and S-o-b: tags don't match.
> 
> Technically speaking, this commit does not have its author's S-o-b:,
> which means the lack of "Developer's Certificate of Origin".
> 
> I think in this case, Paul can amend the author field of the commit
> and force push.

Good eyes, and thank you!

I have adjusted the From: to match the Signed-of-by.  Elad, does that
match what you had in mind?

> As for me, in my early contributions to perfbook, I misconfigured
> git's user.email, and ended up in dozens of commits with S-o-b of
> a non-reachable email address during April--May of 2016.  :-/

I managed to do some very odd things when I started up with git as
well.  We all do.  ;-)

							Thanx, Paul

>         Thanks, Akira 
> 
> >> ---
> >>  count/count.tex | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/count/count.tex b/count/count.tex
> >> index 7e74d58f..523789e2 100644
> >> --- a/count/count.tex
> >> +++ b/count/count.tex
> >> @@ -2262,7 +2262,7 @@ be run all the way to either of its limits, but it does so at the
> >>  expense of adding atomic operations to the fastpaths, which slow down
> >>  the fastpaths significantly on some systems.
> >>  Although some workloads might tolerate this slowdown, it is worthwhile
> >> -looking for algorithms with better read-side performance.
> >> +looking for algorithms with better write-side performance.
> >>  One such algorithm uses a signal handler to steal counts from other
> >>  threads.
> >>  Because signal handlers run in the context of the signaled thread,
> >> -- 
> >> 2.25.1
> >>
> > 
