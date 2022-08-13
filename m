Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiHMXPR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 19:15:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DB54384
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 16:15:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF2CCB80AD3
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 23:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660432512;
        bh=ok/0b4b2fo6V/bJs3Z1Fg5gXTtJlsMZvaNgh7ajUtc8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=VKXgv5JuITyJG9M5844sSZ0S1Dk8LKsryn3vmSNx2ITIed1tyYUiVzFKBJmips0N4
         v6LHiVhs7AoGNr45f0y/Tf2V6Rdk5pgGAlwJf9DFJUC2KdEvbdfZ9QCPNTZBMl9hrJ
         vaRUBx84NTCn+ta349N3T+ZUNFnaowvOUVQHGc1Xhj0g82aHLlJ7vKltBNMcZHpvYb
         UYJdk6S7EphbhW7cPlTfIXX0BI91RfuMtF06pYWBfYIkTmd1qPj5BICUFfHKqEyfca
         w0EckpxzHYzXf+AF6Q0TLO84zB0zKgOUXl9tuZYpfZ9xHh5LolXrPoQHBCAOiOXimk
         TsZ4ZAoE8cgJQ==
Date: Sat, 13 Aug 2022 16:15:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Comments on chapter 5
Message-ID: <20220813231512.GN2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAJbg=FUxuy++utmmuGpetP2wMk_Hc8UVYu74JWucmw9kxdM57A@mail.gmail.com>
 <20220812010827.GZ2125313@paulmck-ThinkPad-P17-Gen-1>
 <c62b5d02-aa91-2587-c214-1ddbdc863cd3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c62b5d02-aa91-2587-c214-1ddbdc863cd3@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>

On Sat, Aug 13, 2022 at 09:47:44AM -0400, Elad Lahav wrote:
> On 2022-08-11 21:08, Paul E. McKenney wrote:
> > > 5.3.2: "references only per-thread variables, and should not incur any
> > > cache misses" - except that the thread can migrate to other cores and
> > > can thus incur cache misses.
> > 
> > Perhaps adding "in the common case" to that sentence?  Or did you have
> > something else in mind?
> 
> Pandora, meet can of worms (are mixed metaphors still frowned upon these
> days?).
> 
> Do you assume that in the common case threads tend to stick to the same
> core? If so, that's an interesting discussion, as I have changed my mind on
> the subject (or, rather, had the change forced on me) a few times.

In the immortal words of practitioners of engineering since recorded
history began, "It depends."

But you can usually characterize some number of preemptions per unit
time for a given workload, and my guess is that this is usually well
in excess of a microsecond, which would mean that short pieces of code
should not be preempted frequently.  (Famous last words...)

							Thanx, Paul
