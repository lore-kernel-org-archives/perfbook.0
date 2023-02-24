Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBXRcB (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Feb 2023 12:32:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6036E4FCBE
        for <perfbook@vger.kernel.org>; Fri, 24 Feb 2023 09:31:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06C7FB81CA3
        for <perfbook@vger.kernel.org>; Fri, 24 Feb 2023 17:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677259916;
        bh=El2PpHQvqtvgBtq11AJ3HSLgTD0uDTqdFag0L80Uf8k=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=IEiiJRoRKq36alqH0QvKaegtAjAoIgd4kSmeI764Of8jqc9BDt7utVOudmf30CIZr
         VosafpTi9tYsNc84myiK0bl31DnGIAa4eGXA7DPGZbYdVbe8kL9KKpw9Zl0AtCN4DV
         iWptPPPq5pIbbM5n0UYm4yuzbL7x1nLw6ybbB7Zql/oeDxAG/AstQjaW5XPSw2CMT2
         VyjlFk93h0hDO/sHTNtsFLYovZmTyUAXL3hnl9/gPRrlqRSs1byEoiLrsSpC7/s/wx
         9cLYkHHs0kC0/YvqP/UozAt0dkDabEZn/700BrEKnVXJOGB0YHzne7lXrV+ba/bbzo
         gru0UjNR9KBEg==
Date: Fri, 24 Feb 2023 09:31:56 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20230224173156.GA631574@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
 <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
 <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
 <aebf5e16-e85e-c2a6-77a0-c48a6f33cf3b@gmail.com>
 <20220630142616.GV1790663@paulmck-ThinkPad-P17-Gen-1>
 <20220701001909.GA2898500@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701001909.GA2898500@paulmck-ThinkPad-P17-Gen-1>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Snir, Marc" <snir@illinois.edu>, perfbook@vger.kernel.org

On Thu, Jun 30, 2022 at 05:19:09PM -0700, Paul E. McKenney wrote:
> On Thu, Jun 30, 2022 at 07:26:16AM -0700, Paul E. McKenney wrote:
> > On Thu, Jun 30, 2022 at 11:18:46PM +0900, Akira Yokosawa wrote:
> > > On Wed, 29 Jun 2022 17:27:20 -0700, Paul E. McKenney wrote:
> > > > OK, MacTex worked much better for me, meaning that this time it did
> > > > not hang when I attempted to install it.  However, once installed,
> > > > it complains that it is missing xcrun, whatever that might be.
> > > 
> > > In search of "macOS 12 xcrun error", I got the following:
> > > 
> > > https://osxdaily.com/2021/07/19/fix-xcrun-error-invalid-active-developer-path-error-terminal-mac/
> > > 
> > > Is your issue similar to this one?
> > > 
> > > (I have no experience with macOS, so take this as just a hint.)
> > 
> > I have no idea, but I will give it a try later today, Pacific Time.
> > Either way, thank you for the hint!
> 
> OK, it does take some time to install.  But I at least started the
> process today.  ;-)

And some colleagues who use MacBooks swear by something called Overleaf:

https://www.overleaf.com/

They use free accounts, which limit you to six projects.  No idea myself,
just passing this on.

							Thanx, Paul


> > > > My thought is to get a release out, then see what can be done about
> > > > making this build on MacOS.  Seem reasonable?
> > > 
> > > Sounds reasonable to me!
> > 
> > Very good, I believe I am a bit overdue for a release anyway.  After all,
> > we have 156 commits since the last release.  ;-)
> > 
> > 							Thanx, Paul
> > 
> > >         Thanks, Akira
> > > 
> > > > 
> > > > Hey, I said I had access to MacOS, not that I was at all competent at
> > > > installing software on it.  ;-)
> > > > 
> > > > 							Thanx, Paul
> > > > 
> > > [...]
