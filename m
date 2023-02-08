Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbjBHWP0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 8 Feb 2023 17:15:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 823231166E
        for <perfbook@vger.kernel.org>; Wed,  8 Feb 2023 14:15:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 28D0DB81F37
        for <perfbook@vger.kernel.org>; Wed,  8 Feb 2023 22:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675894522;
        bh=YryRFamj7xsp/s6zgZusSCq1VQs7M4jxmiB4vdP7omk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=F6MrH5/aSUdRnphorsiT7WKidY9QJMB60/JhCN2mdQYTeLtlecQoH7r7YfY36M4kx
         unywTh9ov75FRbavcO+2fOsNKoaFo/uteGezm3TS14nQ3r0bYd8Dt0tbZ7QRvGZjzC
         NGk+54FkFAA55GxyaXGSGn6WbFK3X/Om4t/NkHzoZg75vwYA/R2YzSeMXaraCtomrw
         qrUKrT9h5cMRBekW9j9Sb/mGLxj8w7MicmxQX0xXo33MF45y24rIWX1ID6cp8tmy1H
         KdHlYIZDRVCUdLqTdmz29dZd5fzBYIQxcPHvn9ip6AvmXPvv/zk7omUwHv1j4Kyw5k
         A72o/2yHFkhvA==
Date: Wed, 8 Feb 2023 14:15:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about Table E.1
Message-ID: <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Wed, Feb 08, 2023 at 07:26:58PM +0900, Akira Yokosawa wrote:
> On Wed, 8 Feb 2023 17:47:31 +0900, Akira Yokosawa wrote:
> > Hi,
> >=20
> > On Tue, 7 Feb 2023 19:41:02 -0800, Paul E. McKenney wrote:
> >> On Wed, Feb 08, 2023 at 12:07:20AM -0300, Leonardo Br=E1s wrote:
> >>> Hello Paul,
> >>>
> >>> I have been reading the book, until I stumbled on Quick Quiz 3.7,
> >>> Table E.1: Performance of Synchronization Mechanisms
> >>> on 16-CPU 2.8 GHz Intel X5550 (Nehalem) System
> >>>
> >>> <Copying from source, since the PDF is a little tricky>
> >>>
> >>> The first part looks like:
> >>>
> >>>         Clock period            &           0.4 &           1.0 \\
> >>>         Same-CPU CAS            &          12.2 &          33.8 \\
> >>>         Same-CPU lock           &          25.6 &          71.2 \\
> >>>         Blind CAS               &          12.9 &          35.8 \\
> >>>         CAS                     &           7.0 &          19.4 \\
> >>> =20
> >>> In this case, what would be the last lines "Blind CAS" and "CAS" refe=
rring to ?=20
> >>>
> >>> (For a second I thought it could be "In-Core Blind CAS" and "In-Core =
CAS" like
> >>> in Table 3.1, but that would not make sense: This "CAS" is faster tha=
n the
> >>> previous "Same-CPU CAS". )
> >>
> >> I was surprised myself, but those measurements are quite real.  My best
> >> guess is that the two threads in the core are able to overlap their
> >> accesses, while the single CPU must do everything sequentially.
> >=20
> > Paul, do you remember how you obtained the data set?
> > There are several data sets under CodeSamples/cpu/data/, but I don't
> > see the one corresponds to the table.
> >=20
> > The code for collecting these data was added in CodeSamples/cpu/
> > by commit 81989d7483e2 ("cpu: Reproduce the old cache-to-cache
> > latency measurement code") in 2020. And the next commit 2fc05ca07edc
> > ("api-pthreads.h: Use clock_gettime() and check sched_setaffinity()")
> > improved the stability of reproduced code.
> >=20
> > This table was first added in commit 38fd945ff401 ("Fill out CPU
> > chapter, including adding Nehalem data.") in 2009.
> > The data have never been updated since.
> >=20
> > I'm kind of suspecting the "7.0 us" which surprised you at the time
> I mean,                      "7.0 ns"
>=20
>         Thanks, Akira
>=20
> > might have been an outlier due to some disturbance discussed in
> > Appendix A.3 "What Time Is It?".
> >=20
> > I'm not sure, just guessing...

My surprise caused me to beat on it, and it was persistent.

But I cannot find the raw data, either, so maybe I should delete that
table.  Though I really do like the fact that it is surprising, based
on a hope that it convinces readers to expect the unexpected.

							Thanx, Paul

> >         Thanks, Akira
> >=20
> >>
> >> Strange, but whatever the reason, true!  ;-)
> >>
> >> 							Thanx, Paul
