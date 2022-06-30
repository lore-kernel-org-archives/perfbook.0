Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbiF3Of6 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 30 Jun 2022 10:35:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197B635874
        for <perfbook@vger.kernel.org>; Thu, 30 Jun 2022 07:26:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CBB0CB82B67
        for <perfbook@vger.kernel.org>; Thu, 30 Jun 2022 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656599176;
        bh=1viCjhumRanC7AGAeA40ir7TS7dDRJq67oAxuBTOjgc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=YrkWe3DlwhjBDqUqAWn0FAVTiuAsOPw1qAqDnawpqud/Er0FDR04442nAs3rN0yuD
         RYI+4V50HlR/0qWBOdeSnhPVA3XwgIS+KFBa3aR6uKD2Mxs1xEMf4qaOkp6PDQalLQ
         RQpQ7q1ADY2c8xfVxSFwoZ6KsVNUk3iDRWBBBVR2SoNrqFrH8ii5fgZR7oIXFqdFfy
         Ori9+eBVazF0MujPVkvmfkoq+ym7FVLk5sg3NQV+Jklg8UnV4HbYLoinWZrUVAPorr
         Nu8DpVqGEsY5uj5GzdrFR1FnQzZwq18f7nF02Y+1pBb0nk1TX7AtisG0o/5aK6h0uR
         qbNBL2soJXDCw==
Date: Thu, 30 Jun 2022 07:26:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Is parallel programing hard...
Message-ID: <20220630142616.GV1790663@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
 <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
 <20220630002720.GR1790663@paulmck-ThinkPad-P17-Gen-1>
 <aebf5e16-e85e-c2a6-77a0-c48a6f33cf3b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aebf5e16-e85e-c2a6-77a0-c48a6f33cf3b@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Snir, Marc" <snir@illinois.edu>, perfbook@vger.kernel.org

On Thu, Jun 30, 2022 at 11:18:46PM +0900, Akira Yokosawa wrote:
> On Wed, 29 Jun 2022 17:27:20 -0700, Paul E. McKenney wrote:
> > OK, MacTex worked much better for me, meaning that this time it did
> > not hang when I attempted to install it.  However, once installed,
> > it complains that it is missing xcrun, whatever that might be.
> 
> In search of "macOS 12 xcrun error", I got the following:
> 
> https://osxdaily.com/2021/07/19/fix-xcrun-error-invalid-active-developer-path-error-terminal-mac/
> 
> Is your issue similar to this one?
> 
> (I have no experience with macOS, so take this as just a hint.)

I have no idea, but I will give it a try later today, Pacific Time.
Either way, thank you for the hint!

> > My thought is to get a release out, then see what can be done about
> > making this build on MacOS.  Seem reasonable?
> 
> Sounds reasonable to me!

Very good, I believe I am a bit overdue for a release anyway.  After all,
we have 156 commits since the last release.  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > Hey, I said I had access to MacOS, not that I was at all competent at
> > installing software on it.  ;-)
> > 
> > 							Thanx, Paul
> > 
> [...]
