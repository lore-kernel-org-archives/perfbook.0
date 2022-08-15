Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbiHOD6K (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 14 Aug 2022 23:58:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C2DDED8
        for <perfbook@vger.kernel.org>; Sun, 14 Aug 2022 20:58:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A05656101C
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 03:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660535888;
        bh=EsC4FkUWUX6QzWi5/QeAxR1SZnid7LoIV2Aj1wBoag8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XRkxRMskpENS2G2OsUBGKp/ZFGWOZIHzVTeuJG0uiyq0MHEbIuUFTs5A06/S1pAAW
         RX7WU4gU2MF8vhLEQOdahC8dQ/6gqNBaxHLljfe2OIxCh1+1AVHRHke0xn/hv6x58F
         1YZ5RPWqHeDW7fAyoW3OG6LtfGDyO+LedUVMNNQyP0vUhHf1s6k3JTAeyLWoMvL2VJ
         FOc/OSdNnFG/bOTuAOjnUrzFhJQ1iM2Ydto4P71oeZxZ701bZyyfDCKiAw7Y7hEFO9
         BZQdem5d1TSrFhl3Ov1/CGv+LcdQnKmz7avOAK2rspDe4tx9+LeOq3wPfL5jVYwT3c
         u7DwfcaeCy84Q==
Date: Sun, 14 Aug 2022 20:58:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples: Enable building on QNX
Message-ID: <20220815035807.GS2125313@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220814102135.2141663-1-e2lahav@gmail.com>
 <ed00a63b-1d65-16e5-700e-19137871118f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed00a63b-1d65-16e5-700e-19137871118f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Aug 14, 2022 at 06:24:58AM -0400, Elad Lahav wrote:
> On 2022-08-14 06:21, Elad Lahav wrote:
> > +#elif defined (__QNX__)
> > +    uintptr_t runmask;
> > +    int ret;
> > +
> > +    runmask = (1UL << cpu);
> > +    ret = ThreadCtl(_NTO_TCTL_RUNMASK, (void *)runmask);
> > +	if (ret) {
> > +		perror("sched_setaffinity");
> > +		abort();
> > +	}
> 
> Argh, I've just noticed the mix of tabs and spaces here. What's the protocol
> for updating a patch?

Since I have not pulled it in yet, just resend it with "v2" after the
"PATCH" in the subject line.

But given that we are adding another OS type, it would be good to have a
more organized way of dealing with this.  Those #ifdefs are OK at first,
but get ugly quickly.

Would you be willing to propose something that co-locates the OS-specific
code?  For example, one file for the QNX code and a parallel file
for Linux/POSIX code?  Maybe a .h file, or maybe a separate .c file.
That way, the same functions names are invoked and the code specific to
a given OS is easily located.

Thoughts?

							Thanx, Paul
