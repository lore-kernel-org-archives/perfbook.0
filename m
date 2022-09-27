Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbiI0UFg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 27 Sep 2022 16:05:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094AC12C68F
        for <perfbook@vger.kernel.org>; Tue, 27 Sep 2022 13:04:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C8C2B81D55
        for <perfbook@vger.kernel.org>; Tue, 27 Sep 2022 20:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664309087;
        bh=pH+I672Z007Eef3dlhOHYAODy7zHsfrUrbWDjKmUjsE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=dqGoNMoul+5u4S8WP5QIucQrQ14DPughMthShtmOSSBCLyY53QVvCnvVHVzTGpSWz
         m1kOlhRNAAfQDKoPLd96BpHhgZydmk/tUfr9lwQr6axPLgX0ACnuAgLOzHiAX4LCMJ
         0e4sPCPWUXraMFD73qDKg6A2wM5OfmOzgieWiRjp13V9GBVyP7YbGj4PzwaDxslN+F
         RFy2AJCmdfpYIl/AyQA8RPfKe2sIwlj7Zh0oHfnzn0k2iRpdWxpYFP55J0zAvOS11G
         reXrjyICfHBjvnpuaKVXhpLwycTO55sV0paUGdPla+UVKsfli8JQBCywFf5cPOhBIs
         lJzD0jkPnC5YQ==
Date: Tue, 27 Sep 2022 13:04:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Comments on Section 7.1
Message-ID: <20220927200446.GW4196@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FVkC51pkG_cO-bBgfYq1pcug9B=ECEkmcNHLg+3HDbB4A@mail.gmail.com>
 <20220927190617.GV4196@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FWoudBKmKBuxfU-hNfcqOq7As75Q8NB732N5-hHpyp7ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FWoudBKmKBuxfU-hNfcqOq7As75Q8NB732N5-hHpyp7ng@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

That sounds like a reasonable approach to me!

							Thanx, Paul

On Tue, Sep 27, 2022 at 03:12:51PM -0400, Elad Lahav wrote:
> I'll try to come up with a patch that combines 1 and 2. So keep the
> qsort() example, but then add something along the lines of:
> 
> "If you are not convinced that qsort requires locking in the library,
> consider the following example..."
> 
> and then
> 
> "Note the dangerous situation as the library releases its locks prior
> to invoking the user's callback function..."
> 
> --Elad
> 
> On Tue, 27 Sept 2022 at 15:06, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Sep 26, 2022 at 09:48:33PM -0400, Elad Lahav wrote:
> > > This started out as a longer email, but it looks like at least two of
> > > the problems I spotted were already fixed in the latest version.
> > >
> > > 1. I think the recommendation to release all locks before invoking a
> > > user-supplied function should come with a BIG FLASHING WARNING SIGN
> > > (or the PDF equivalent). Whenever I review code that releases and
> > > re-acquires a lock I look for the faulty assumptions it makes about
> > > state being preserved from before the lock was released. 9 out of 10
> > > times I find a bug.
> >
> > Good point!
> >
> > Left to myself, I would add another infamous Quick Quiz.  But would
> > you like to send a patch proposing something?
> >
> > > 2. qsort() may not be the best example to use in this section, as,
> > > even assuming there is some version of it that requires locks, the
> > > reader may fail to see any problems. While I'm no fan of nftw(), it
> > > may be easier to see why you would need a lock in the library (to
> > > prevent changes to the directory), as well as why releasing and
> > > re-acquiring the lock can be dangerous (the iterator can become
> > > invalid).
> >
> > This does sound better than qsort, so if no one has a better suggestion, I
> > would be tempted to go with that.  In the absence of a better suggestion,
> > would you be willing to supply some sample code, preferably buildable
> > and executable?
> >
> > > 3. Page 106, first paragraph: "an pointer" should be "a pointer".
> >
> > This one was easy, so I applied it with your Reported-by.  Good eyes,
> > by the way, and thank you!
> >
> >                                                         Thanx, Paul
