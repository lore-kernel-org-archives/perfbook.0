Return-Path: <SRS0=AwJw=56=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L7nWx2+mMlsTDXiIiUSS+wFYgdQ7pMDQRzJGeg6ucWY=;
        b=YD27LUWQZ27ggU+Cq/BjR78+cGD+FJE5QiFsxqkYpdblrv51Z+VFQ/wDBEFlLSA5kp
         y+Eww/OcaRjNN1S3j+tPpN9swRNxg/If11LaqFayF7n+TDh94fxtArPlh0uFgzgM14EJ
         MHi5z60ez8SoZXMsOP2Wb4rQYeSh6puEato0IrTNgMeO68okniCKko3xvH70QmGEs4K1
         TFG8endywKosq4xgpheZFcIfmG1IajSU0Pw0pAOQ1SYPsdyANAZwGGNoLsw/TIMANckG
         KKqY/0mnU5zyIyzO1i0+9T2tiTK9gR1SFWrfcRTlBu5ZRsh6rO4RMu2c1l7PttFYW8oU
         fZ8g==
Message-ID: <6d5631cba7e39887d8b1e1e786cc994f61f3d438.camel@gmail.com>
Subject: Re: [PATCH] Add .gitlab-ci.yml for pdf generation and testing on
 Gitlab.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Wed, 01 Feb 2023 23:05:58 -0300
In-Reply-To: <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230201201529.901316-1-leobras.c@gmail.com>
	 <20230201221302.GQ2948950@paulmck-ThinkPad-P17-Gen-1>
	 <ac90780e-b399-ba82-253d-da66447fab07@gmail.com>
	 <20230202015337.GR2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, 2023-02-01 at 17:53 -0800, Paul E. McKenney wrote:
> On Thu, Feb 02, 2023 at 10:49:15AM +0900, Akira Yokosawa wrote:
> > Hi,
> >=20
> > On Wed, 1 Feb 2023 14:13:02 -0800, Paul E. McKenney wrote:
> > > On Wed, Feb 01, 2023 at 05:15:29PM -0300, Leonardo Bras wrote:
> > > > Having this file merged on the main repository will trigger the Git=
lab-CI
> > > > on the mirror: https://gitlab.com/linux-kernel/perfbook/ after each=
 push.
> > > >=20
> > > > The way it works:
> > > > - Compile-test CodeSamples
> > > > - IF pass, build PDFs: regular, 1c, eb
> > > >=20
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > >=20
> > > Queued and pushed, thank you!  Let's see how github (as oppoed to you=
r
> > > gitlab) reacts to this.  ;-)
> >=20
> > I happen to have a perfbook repo at gitlab where CI is not set up.
> > When I pushed this change, I got a mail from gitlab saying:
> >=20
> > >  Subject: perfbook | Failed pipeline for gitlab-ci | 55c81b9b
> > >=20
> > >  Pipeline #764856510 has failed!

That's odd, I wonder why have it failed.

> >=20
> > I don't think it is reasonable for Paul's repo to have gitlab
> > specific settings like this.
> >=20
> > Paul, can you please revert this?
>=20
> Done, and apologies!
>=20
> Leonardo, would another approach be to create a separate branch in your
> repo that contained this file, then automatically cherry-pick or merge it
> with each perfbook update?
>=20
> 							Thanx, Paul

Sure, that would work much better, but I need to find out how to do this on
Gitlab side.

I will reply here when I find any answers.

Thanks!

