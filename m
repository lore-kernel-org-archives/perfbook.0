Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239787AbiHMX3E (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:29:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8818A7F3
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:29:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7FE460F13
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660433342;
        bh=ZKne4eECf3HLiCv68i4SiXNuSkp2CDY345gGDI0xsqs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oNQZYU5Z33gIBSwBifn+zKsDYUGu/bk4muj9Pgds+UQkIC4K/ga0yZg/eT8xFAJP0
         51Y8f6MCuSLp2CNBrWg6m3qLzxn4+4KPq4BtFChP7DzI9j46+OhfVlyTyKx66Og0oa
         3hmnqf/dC6aAv4irvbi2A+Q6D+N6GxxI8zOOofCsl7zL5viJZOxrWj8PNBRIOhoH6h
         X3aS3wc2tbT2MAQr/33mpRQhLiSfLtzeX8gTrG2GZGouZ1CmlzzY2YTEGbnU3wgp0f
         0wIQQxzpZP8ezc5hVtxT55zK7s56+iAEeq7ZUg7yz6+ZuCJEqzVpmZZ9IOUYMzzsPh
         wvTXo40yYFwSQ==
Date: Sat, 13 Aug 2022 16:29:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Message-ID: <20220813232901.GP2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220813114559.2082323-1-e2lahav@gmail.com>
 <4a072f55-a780-d69b-9a74-a5d5aba63b7a@gmail.com>
 <20220813231240.GM2125313@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJbg=FXKFnVwoyvRw=xhjTpkzp7ScGngb8yc9VwwTY7FeYJobw@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Aug 13, 2022 at 07:23:40PM -0400, Elad Lahav wrote:
> I believe that performance is statistically the same, but I will
> double check. I assume both GCC and C11 end up using the same
> underlying mechanism for thread-local storage:
> 
> https://uclibc.org/docs/tls.pdf
> 
> If not implemented, TLS falls back on pthread_[gs]et_specific(), but
> again it would be the same for __thread and _Thread_local.

Sounds likely to me, but I have been surprised before.

> I was about to run all benchmarks on a cute 16-core aarch64 machine I
> recently bought for testing the scalability of my latest kernel work,
> but the code requires linking against urcu, and now I'm going down the
> rabbit hole of building that for QNX. Does the counter code really
> need this library?

Only for one of the count programs, count_end_rcu.c.  If you comment that
one out of the Makefile, you should be fine.  Some other adjustments to
other files might be needed, for example, CodeSamples/Makefile.

Probably about the same amount of work to wean CodeSamples/count from
that library as to get it working on QNX.  Murphy would of course argue
that whichever path you choose will be the harder of the two.

							Thanx, Paul

> --Elad
> 
> On Sat, 13 Aug 2022 at 19:12, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Aug 13, 2022 at 07:49:27AM -0400, Elad Lahav wrote:
> > > On 2022-08-13 07:45, Elad Lahav wrote:
> > > > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
> > > > ---
> > >
> > > This one will probably require some back-and-forth. If we change it here, do
> > > other places need to be updated? Have I now removed the explanation of GCC's
> > > __thread storage class, which will impact the readability of other sections?
> > > Or are you ready to take the plunge and convert all code snippets?
> > >
> > > For the record, I did build and test count_end.c.
> >
> > As long as you continue building and testing, checking the descriptions in
> > text of the code snippets (in case there is a mention of __thread there),
> > and verifying that the PDF still builds, as fast as you are willing to go!
> >
> > Are you seeing the same performance with the new as with the old on
> > your hardware?  (No statistically significant difference on my laptop,
> > but figured I should ask.)
> >
> >                                                         Thanx, Paul
