Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiL0A0w (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 26 Dec 2022 19:26:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC3B2675
        for <perfbook@vger.kernel.org>; Mon, 26 Dec 2022 16:26:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6465260F59
        for <perfbook@vger.kernel.org>; Tue, 27 Dec 2022 00:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672100810;
        bh=+B0WSm39RpZasl+baQIIeMVlejQqpOISNnopTR6Iy9g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=p4mokPMBdBhJ54zHM/KgkSc/eBgbuqvMgr6gjazoVxwyYorRJg+G7bgvsB2xeSTDc
         UkATuVNDte9SyaUoHggLeltS32so5edXJvPguhk0aEm+zaAuqat4SnEyA7daZPu88y
         OKK4jxggUNvsMPMlSeV9JXERnKIAkX469eN2zjMORJ2gwYZ4PHMkId1Sxf0xKpeCsn
         ywlz5qnfriL0Nj2MIHUGMiZ1LKDHnFhK7oPjwvqxoyb+Z0f2ZcE4er7rpaetQy0K4J
         HhXGZCVC+0Yd62cksdThk/ui/XzEY634O95AQ7IGx+gsC/Pu/+keGiSFJZPA/CucBb
         U3ec3Rdx9l+Ag==
Date: Mon, 26 Dec 2022 16:26:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/4] datastruct: Add missed unbreakable spaces
Message-ID: <20221227002650.GF4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221226181639.10795-1-sj@kernel.org>
 <20221226181639.10795-3-sj@kernel.org>
 <c85aa561-e046-b666-bce2-42c5648822d5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85aa561-e046-b666-bce2-42c5648822d5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

On Tue, Dec 27, 2022 at 08:41:10AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Mon, 26 Dec 2022 10:16:32 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > Add missing unbreakable spaces for 'CPUs' and 'elements'.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>

I queued and pushed, 1/4, 3/4, and 4/4, thank you!

Please do send an updated version of 2/4.

							Thanx, Paul

> > ---
> >  datastruct/datastruct.tex | 25 ++++++++++++-------------
> >  1 file changed, 12 insertions(+), 13 deletions(-)
> > 
> > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > index 99c92d9a..40ea6995 100644
> > --- a/datastruct/datastruct.tex
> > +++ b/datastruct/datastruct.tex
> [...]
> > @@ -775,8 +775,8 @@ to about half again faster than that of either QSBR or RCU\@.
> >  
> >  	Still unconvinced?
> >  	Then look at the log-log plot in
> > -	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
> > -	which shows performance for 448 CPUs as a function of the
> > +	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448~CPUs; Varying Table Size},
> > +	which shows performance for 448~CPUs as a function of the
> >  	hash-table size, that is, number of buckets and maximum number
> >  	of elements.
> >  	A hash-table of size 1,024 has 1,024~buckets and contains
> 
> This hunk caused an error for me.
> 
> -----
> l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
>                                                   ,
> ? 
> ! Emergency stop.
> <to be read again> 
>                    \protect 
> l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
>                                                   ,
> End of file on the terminal!
> -----
> 
> Please remove the unbreakable space in \cref{}.
> 
>         Thanks, Akira
> 
> [...]
> 
