Return-Path: <SRS0=AwJw=56=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w1YaShzHLOe6/D52yz260CzHrHpsTbLZ3zacVsR2zsU=;
        b=m4nBxtkzTOauW4rCLKFCsIjKoTZQeN7VY8yiJWjkJR++BlpFzoLw8Biuwb/jLkdsSG
         mm4bsl0GQX5kdUjvWEwvSNOQ04eAStUiKfhQTKteuH+uRQufx9r2bKJcSS14GRE2rB4D
         rbFBJir++lqT+/ZShhx39oPHF4foppjwC898zIe48KxaaNiJ2nRGB1UdIVGe3ijNuRqW
         2zaANNIm4mRa7IurHIL2tFePGu+sFXGTERaH066FCklPbZ0ffHmyvFuj25x+m6Sjr6wv
         GpIllqya5nxWewV3405qvW+q+b2VXkhi5rrNTJA2kEZzE+uID7mnnA9nkH0yqmbdgZTv
         HILA==
Message-ID: <ee2eb78d9575b53080a265c46775d01f0da37214.camel@gmail.com>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Thu, 02 Feb 2023 01:37:02 -0300
In-Reply-To: <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
References: <20230201201529.901316-1-leobras.c@gmail.com>
	 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
	 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
	 <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, 2023-02-01 at 23:05 -0300, Leonardo Br=C3=A1s wrote:
> On Wed, 2023-02-01 at 17:53 -0800, Paul E. McKenney wrote:
> > On Thu, Feb 02, 2023 at 10:49:15AM +0900, Akira Yokosawa wrote:
> > > Hi,
> > >=20
> > > On Wed, 1 Feb 2023 14:13:02 -0800, Paul E. McKenney wrote:
> > > > On Wed, Feb 01, 2023 at 05:15:29PM -0300, Leonardo Bras wrote:
> > > > > Having this file merged on the main repository will trigger the G=
itlab-CI
> > > > > on the mirror: https://gitlab.com/linux-kernel/perfbook/ after ea=
ch push.
> > > > >=20
> > > > > The way it works:
> > > > > - Compile-test CodeSamples
> > > > > - IF pass, build PDFs: regular, 1c, eb
> > > > >=20
> > > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > >=20
> > > > Queued and pushed, thank you!  Let's see how github (as oppoed to y=
our
> > > > gitlab) reacts to this.  ;-)
> > >=20
> > > I happen to have a perfbook repo at gitlab where CI is not set up.
> > > When I pushed this change, I got a mail from gitlab saying:
> > >=20
> > > >  Subject: perfbook | Failed pipeline for gitlab-ci | 55c81b9b
> > > >=20
> > > >  Pipeline #764856510 has failed!
>=20
> That's odd, I wonder why have it failed.
>=20
> > >=20
> > > I don't think it is reasonable for Paul's repo to have gitlab
> > > specific settings like this.
> > >=20
> > > Paul, can you please revert this?
> >=20
> > Done, and apologies!
> >=20
> > Leonardo, would another approach be to create a separate branch in your
> > repo that contained this file, then automatically cherry-pick or merge =
it
> > with each perfbook update?
> >=20
> > 							Thanx, Paul
>=20
> Sure, that would work much better, but I need to find out how to do this =
on
> Gitlab side.
>=20
> I will reply here when I find any answers.
>=20
> Thanks!
>=20

It looks like it can be done by "Running CI/CD for external repositories".

I removed my previous repository and then imported perfbook again using the
above mentioned mode. According to the man page, it will run CI for the pro=
ject
whenever a new push to the referenced repository happens.

So it's just a matter of waiting a new commit getting push'ed to see if it =
will
be working.

Best regards,
Leo
