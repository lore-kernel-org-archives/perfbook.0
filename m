Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjBAEPj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 31 Jan 2023 23:15:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB977577F7
        for <perfbook@vger.kernel.org>; Tue, 31 Jan 2023 20:15:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 328CF60C3E
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 04:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675224934;
        bh=41nwwODt/za/3iDChHqxtmYD05hrovxP1BjtBhcCMtA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iEpsTd5HV1Vuw2sZ7dPd9IUGzKpC4pUBiUVAdCgwkug9pZsf6hwn5sLoTVyOqbHht
         6AN8vtaJ+awWU1B2Zj3nHY54XfDldFekAaxuBzoHHJS+ANDsLVvAW+xeLviRSue29r
         dGmdGacQCcknsMfi9h71Unbsx4YGia8HJTxRyIjGn9DlAOBHwc4FMZu1sPYSA64ob9
         qXhkq1nIIIP5IJvW5dqhtOn4mSVQPq07xRBaHU8dii088KsEuIrwRBFLRT9bwIkmuv
         rVfq/ZReKn2HF9urw0le/KzK4t02WBUcKdpB0+fr2lS2Ugwil6IZVpW1GoqXzoY5zO
         K6NEVW+f9/b/A==
Date: Tue, 31 Jan 2023 20:15:34 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Perfbook : Thanks!
Message-ID: <20230201041534.GB2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
 <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
 <9718eb1362cd216f680694ff737360a2eb875cc5.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9718eb1362cd216f680694ff737360a2eb875cc5.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 31, 2023 at 11:19:02PM -0300, Leonardo Br=E1s wrote:
> Hello Paul,
>=20
> On Tue, 2023-01-31 at 13:45 -0800, Paul E. McKenney wrote:
> > On Tue, Jan 31, 2023 at 06:09:50PM -0300, Leonardo Br=E1s wrote:
> > > Hello Paul,
> > >=20
> > > I am a newbie Kernel Developer, and I was already a fan of your work =
on memory-
> > > barriers.txt.=A0
> > >=20
> > > A couple weeks ago a friend of mine recommended reading perfbook,=A0a=
nd sent me an
> > > older version (2011.01.02a). After reading a few pages I went on and =
found that
> > > the book had newer releases and is often updated and maintained with =
git, which
> > > got me really impressed.
> > >=20
> > > (I had a lot of work gone to waste on other books I found errors on, =
and
> > > perfbook's git workflow just make a lot of sense to me)
> > >=20
> > > Since it's a topic I am really interested in, and I noticed the book =
has updates
> > > from a couple days ago, I decided to install texinfo packages and com=
pile a new
> > > version for me to start reading.=A0
> > >=20
> > > I then noticed it would be nice to keep reading the latest version wh=
enever an
> > > update came by, so I created a gitlab-ci to re-generate the book afte=
r a new
> > > commit / push: https://gitlab.com/linux-kernel/perfbook
> > >=20
> > > Is that ok if I keep this gitlab repository re-generating the book?
> > >=20
> > > Is a gitlab-ci of any use for you?
> > > If so, I can send it as a patch (a single .gitlab-ci.yaml file), and =
refine it
> > > according to your needs.
> > >=20
> > > Thanks for keeping the book updated!
> >=20
> > Hello, Leonardo, and glad you like the book!
> >=20
> > On the automated CI, I cant't think of a problems with it.  In fact, in
> > my experience, automated testing is usually a good thing.  I am adding
> > the perfbook email list in case others have advice or other guidance.
> >=20
> > Just out of curiosty, are you thinking of automating tests of the
> > sample code as well as of the LaTeX builds?
>=20
> For now it only automates the LaTeX build of perfbook.pdf, perfbook-1c.pd=
f and
> perfbook-eb.pdf, but there should be no problem automating tests too. (I =
mean,
> once I understand how to run tests.)

Good point, building the tests should be a matter of "cd CodeSamples;
make", but yes, the actual running of the tests is at the moment a matter
of a bunch of random .sh scripts.  I will think about the feasibility
or not of adding something like "make check" to those directories.

							Thanx, Paul
