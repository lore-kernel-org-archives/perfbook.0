Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbjFBSWR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 2 Jun 2023 14:22:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 479231A1
        for <perfbook@vger.kernel.org>; Fri,  2 Jun 2023 11:22:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BAE5860D3A
        for <perfbook@vger.kernel.org>; Fri,  2 Jun 2023 18:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685730134;
        bh=jlR5NHDLRXsEVzDXdj4WhdIvCRUlr0E89MfKliA8qDQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=l7kNvIradPBpPAUn8oxFhjgEe+gGP/7Zm4Olgao9uEKz/yNlnFSqNKIRIaoZIP6Lx
         5tmwFd0MusLDZpBvdtJ2zyaWL30IcgOisRwCyUrahyd4F2eUWa2jlfRj12Hh/apT+I
         pwrwm8rUUaL1VHTSlFBBl2hdZSYbCCrcKY48p+/6HbOEf7PDrhLHC4FYK7zVkQIZvR
         qDfDtXen3mR3K1F8pUYzXbv4yC9nWSiQqsHrcpOJV5qwF2r51Zq5oRWAp/N1NneN66
         PJsjYzWPr8v3pZzuyqRGcf03IpYNG7l0T2Kwxdm9225ytxDHyJHXo59PuTlfKxSa5G
         hlfzR3IX8uQ0A==
Date: Fri, 2 Jun 2023 11:22:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] together: Fix the description of state traversal
Message-ID: <5cecd964-c3b4-4758-861b-407e93baebbe@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230528164020.15935-1-mmpgouride@gmail.com>
 <2821caa4-1212-41ee-b853-dc20e051113d@paulmck-laptop>
 <F67611BA-639A-40C6-9EA4-031B50D8B184@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <F67611BA-639A-40C6-9EA4-031B50D8B184@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Alan Huang <mmpgouride@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, May 30, 2023 at 11:19:51PM +0800, Alan Huang wrote:
> 
> > 2023年5月30日 08:40，Paul E. McKenney <paulmck@kernel.org> 写道：
> > 
> > On Sun, May 28, 2023 at 04:40:20PM +0000, Alan Huang wrote:
> >> There seem to be some issues with the description of state transitions.
> >> This patch fixes that.
> >> 
> >> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> >> ---
> >> together/applyrcu.tex | 7 ++++---
> >> 1 file changed, 4 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/together/applyrcu.tex b/together/applyrcu.tex
> >> index 09a265f7..dee027b9 100644
> >> --- a/together/applyrcu.tex
> >> +++ b/together/applyrcu.tex
> >> @@ -676,11 +676,12 @@ The normal path through this state machine traverses the states CLOSED,
> >> OPEN, CLOSING (with an invocation of \co{call_rcu()}), and back to CLOSED
> >> once the callback has been invoked.
> >> If \co{open()} is invoked before the grace period completes, the
> >> -state machine traverses the cycle OPEN, CLOSING (with an invocation
> >> -of \co{call_rcu()}), and back to CLOSED once the callback has been invoked.
> >> +state machine traverses the cycle OPEN, CLOSING (with
> >> +an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
> >> +callback has been invoked.
> >> If \co{open()} and then \co{close()} are invoked before the grace period
> >> completes, the state machine traverses the cycle OPEN, CLOSING (with
> >> -an invocation of \co{call_rcu()}), REOPENING, and back to OPEN once the
> >> +an invocation of \co{call_rcu()}), REOPENING, RECLOSING, and back to CLOSING once the
> >> callback has been invoked.
> > 
> > I took this patch (thank you!), but wonder if we should describe the
> > additional callback and additional transition to CLOSED, both here
> > and below.  Thoughts?
> 
> That would be more accurate. But the transition to CLOSED has already been
> described at the beginning of this paragraph. And omitting this description can
> encourage readers to engage in critical thinking and draw their own conclusions.
> 
> But others may prefer more accurate explanations :)
> 
> So, both descriptions work for me.

Fair enough, let's keep it as your patch has it for now.  ;-)

							Thanx, Paul

> Thanks,
> Alan
> 
> > 
> > Thanx, Paul
> > 
> >> Given an indefinite alternating sequence of \co{close()} and \co{open()}
> >> -- 
> >> 2.34.1
> >> 
> 
