Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbjBAWK4 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 1 Feb 2023 17:10:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3E973779
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 14:10:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A075DB821C8
        for <perfbook@vger.kernel.org>; Wed,  1 Feb 2023 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675289452;
        bh=N4HmErs3i7S6Tc0+MiixrV73zLn0Ks9HjLg7Gu2V+MU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LUmivP2cO8nkLwPKhOxLpMk2NlUyFnuOFeTRp8K+8cPOmiZTydrSEIzjTE9SJhaYE
         sx3ikjnMa3JtI+zl8kO3QH+ra7iSY0syjkiCARKRPhc8YYz8B0yZSSMNr/XXpFHQvY
         vJ7fX679uCzrc0YbF0KrQVlNxudvrUSqI5zBSW2WwOO3OTtzVw7ts9HFQJvegM5D2H
         qNmUBNmqcq784rM0cT9BEhDLAeOYEiZ4qovXelc9jcwJxNbYTKTrfAhUi5fr1Z69fx
         lBGqbbeumNBOxSxJDAygll7QvDrk4wQTDhJe9l9tSQyggRCx34I/azeC2f4IPIm+OM
         wQwcLPf0noJBg==
Date: Wed, 1 Feb 2023 14:10:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Perfbook : Thanks!
Message-ID: <20230201221051.GP2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <d49bc621da6f74e33cd41d5fc3d1e9ed17cba3bd.camel@gmail.com>
 <20230131214528.GY2948950@paulmck-ThinkPad-P17-Gen-1>
 <9718eb1362cd216f680694ff737360a2eb875cc5.camel@gmail.com>
 <20230201041534.GB2948950@paulmck-ThinkPad-P17-Gen-1>
 <093f3237c3dbfe0daa8a35040dcd5c114be153bb.camel@gmail.com>
 <20230201142318.GD2948950@paulmck-ThinkPad-P17-Gen-1>
 <8b74b3002d65c3e2db6c2fa3a1b00564998ad4b2.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8b74b3002d65c3e2db6c2fa3a1b00564998ad4b2.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Feb 01, 2023 at 05:29:20PM -0300, Leonardo Br=E1s wrote:
> On Wed, 2023-02-01 at 06:23 -0800, Paul E. McKenney wrote:
> > On Wed, Feb 01, 2023 at 01:21:05AM -0300, Leonardo Br=E1s wrote:
> > > On Tue, 2023-01-31 at 20:15 -0800, Paul E. McKenney wrote:
> > > > On Tue, Jan 31, 2023 at 11:19:02PM -0300, Leonardo Br=E1s wrote:
> > > > > Hello Paul,
> > > > >=20
> > > > > On Tue, 2023-01-31 at 13:45 -0800, Paul E. McKenney wrote:
> > > > > > On Tue, Jan 31, 2023 at 06:09:50PM -0300, Leonardo Br=E1s wrote:
> > > > > > > Hello Paul,
> > > > > > >=20
> > > > > > > I am a newbie Kernel Developer, and I was already a fan of yo=
ur work on memory-
> > > > > > > barriers.txt.=A0
> > > > > > >=20
> > > > > > > A couple weeks ago a friend of mine recommended reading perfb=
ook,=A0and sent me an
> > > > > > > older version (2011.01.02a). After reading a few pages I went=
 on and found that
> > > > > > > the book had newer releases and is often updated and maintain=
ed with git, which
> > > > > > > got me really impressed.
> > > > > > >=20
> > > > > > > (I had a lot of work gone to waste on other books I found err=
ors on, and
> > > > > > > perfbook's git workflow just make a lot of sense to me)
> > > > > > >=20
> > > > > > > Since it's a topic I am really interested in, and I noticed t=
he book has updates
> > > > > > > from a couple days ago, I decided to install texinfo packages=
 and compile a new
> > > > > > > version for me to start reading.=A0
> > > > > > >=20
> > > > > > > I then noticed it would be nice to keep reading the latest ve=
rsion whenever an
> > > > > > > update came by, so I created a gitlab-ci to re-generate the b=
ook after a new
> > > > > > > commit / push: https://gitlab.com/linux-kernel/perfbook
> > > > > > >=20
> > > > > > > Is that ok if I keep this gitlab repository re-generating the=
 book?
> > > > > > >=20
> > > > > > > Is a gitlab-ci of any use for you?
> > > > > > > If so, I can send it as a patch (a single .gitlab-ci.yaml fil=
e), and refine it
> > > > > > > according to your needs.
> > > > > > >=20
> > > > > > > Thanks for keeping the book updated!
> > > > > >=20
> > > > > > Hello, Leonardo, and glad you like the book!
> > > > > >=20
> > > > > > On the automated CI, I cant't think of a problems with it.  In =
fact, in
> > > > > > my experience, automated testing is usually a good thing.  I am=
 adding
> > > > > > the perfbook email list in case others have advice or other gui=
dance.
> > > > > >=20
> > > > > > Just out of curiosty, are you thinking of automating tests of t=
he
> > > > > > sample code as well as of the LaTeX builds?
> > > > >=20
> > > > > For now it only automates the LaTeX build of perfbook.pdf, perfbo=
ok-1c.pdf and
> > > > > perfbook-eb.pdf, but there should be no problem automating tests =
too. (I mean,
> > > > > once I understand how to run tests.)
> > > >=20
> > > > Good point, building the tests should be a matter of "cd CodeSample=
s;
> > > > make", but yes, the actual running of the tests is at the moment a =
matter
> > > > of a bunch of random .sh scripts.  I will think about the feasibili=
ty
> > > > or not of adding something like "make check" to those directories.
> > > >=20
> > > > 							Thanx, Paul
> > >=20
> > > That would be much easier to test!
> > >=20
> > > Whenever you have a desired testing procedure to run, please let me k=
now so I
> > > can add to the Gitlab-CI.
> >=20
> > It is on my list, thank you!
> >=20
> > In the meantime, simple build testing of the code samples would be of
> > value.
> >=20
> > 							Thanx, Paul
>=20
> Done!
> I just sent a patch on the list. It assumes the CodeSample test will come=
 before
> the PDF building.
>=20
> Please let me know if I got anything wrong.

I will give is a try!  I am assuming that github (as opposed to gitlab)
will ignore this, but if github complains when I try pushing to it,
I might need to revert your patch.  Let's see what happens...

							Thanx, Paul
