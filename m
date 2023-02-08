Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjBHDlM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 7 Feb 2023 22:41:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960DA31E1C
        for <perfbook@vger.kernel.org>; Tue,  7 Feb 2023 19:41:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 232D061497
        for <perfbook@vger.kernel.org>; Wed,  8 Feb 2023 03:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675827664;
        bh=hBFp4fm+DnMdxr1/PqbZvXT7CnLKyz+cDI7MGYcvXEs=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=AltFAzQPACfzWySjAgbL5f5lnirU9U3ECmF1MsGBtLJh4Obha0NSBBwM7DgP+cnfc
         uTCDxNEANXiNVvXDoUpiUz3MtA6e9QInT+ejWLAs64JowfeGj/PMi8CNoReljubcrq
         QYZFPnAGYZTrkXdt1I6+v/JXNxnYhfCI4jxRCAJB+YWxZ29EjfPOXnkB9KrtWGzAuk
         ehiWES8xtsGo4gjuRSNhM4j8QAogvfhq8IPKV+kuC14UBnxzOuDbXXpDd8nruuphq1
         fEmGULN2xLIem2HTCXGGXHVE5xNxEYkx59Q2e3LMYcxlqn2pczPEp6XhH0WHiNMbdj
         2a9letXmbCM1Q==
Date: Tue, 7 Feb 2023 19:41:02 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Question about Table E.1
Message-ID: <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 08, 2023 at 12:07:20AM -0300, Leonardo Br=E1s wrote:
> Hello Paul,
>=20
> I have been reading the book, until I stumbled on Quick Quiz 3.7,
> Table E.1: Performance of Synchronization Mechanisms
> on 16-CPU 2.8 GHz Intel X5550 (Nehalem) System
>=20
> <Copying from source, since the PDF is a little tricky>
>=20
> The first part looks like:
>=20
>         Clock period            &           0.4 &           1.0 \\
>         Same-CPU CAS            &          12.2 &          33.8 \\
>         Same-CPU lock           &          25.6 &          71.2 \\
>         Blind CAS               &          12.9 &          35.8 \\
>         CAS                     &           7.0 &          19.4 \\
> =20
> In this case, what would be the last lines "Blind CAS" and "CAS" referrin=
g to ?=20
>=20
> (For a second I thought it could be "In-Core Blind CAS" and "In-Core CAS"=
 like
> in Table 3.1, but that would not make sense: This "CAS" is faster than the
> previous "Same-CPU CAS". )

I was surprised myself, but those measurements are quite real.  My best
guess is that the two threads in the core are able to overlap their
accesses, while the single CPU must do everything sequentially.

Strange, but whatever the reason, true!  ;-)

							Thanx, Paul
