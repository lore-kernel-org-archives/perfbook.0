Return-Path: <SRS0=QwI4=BX=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685813280; x=1688405280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QJZzdg9rwCFoXJ4Ho7PaDzWVd3ahu4/ev6kyGHGRfik=;
        b=p6GBzxyFbTj/kMfX0BfdD7qWe4tWo3zU36h3A4CSr0o14DX0my+MRBSMI2GG430gR8
         +feYgwKNiZ7RKW8iYyUejMyVfR+ZNQAE5AazYoEnfUFCPn9uaFdSpvluZUIboFmuYFjT
         YVHhjdTl9fqGsxnFVlLI1lmuBX2AONeHRfecy92pbOylTtAARc9CRKnjefbqDH7WSyHB
         cdQMFs5VfJoEbHxuXEoKWjQRQhYxmQb1G/LlZR0y4xpbgF7ebXLszXp2ZAV2Lzi9shvc
         IpAMULQsBH2obnPvDdKU3awk1ujwGLeXgxIbB/wuhXyKnB9h2QE36bc9UAoLPcM48KIG
         /8Dw==
Message-ID: <3f2766875c6f768c646d2d10eded173c9345bc59.camel@gmail.com>
Subject: Re: [RFC PATCH 1/1] utilities/gitlab-ci: Fix gitlab-ci due to Arch
 Linux deprecating texlive-most
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Sat, 03 Jun 2023 14:27:57 -0300
In-Reply-To: <ae32471b-28cc-48b7-97fe-b3fddb99bbd5@paulmck-laptop>
References: <20230601203816.996788-1-leobras.c@gmail.com>
	 <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
	 <ae32471b-28cc-48b7-97fe-b3fddb99bbd5@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, 2023-06-03 at 08:22 -0700, Paul E. McKenney wrote:
> On Sat, Jun 03, 2023 at 02:02:23PM +0900, Akira Yokosawa wrote:
> > Hi Leo,
> >=20
> > Why is this "RFC" ??? :-)
> >=20
> > On Thu,  1 Jun 2023 17:38:16 -0300, Leonardo Bras wrote:
> > > Arch Linux folks deprecated the texlive-most package group in favor o=
f
> > > texlive-meta, which should contain the same packages with an aditiona=
l
> > > tool.
> > >=20
> > > Fix this script to use texlive-meta, so the gitlab pipeline is able t=
o
> > > build the pdfs.
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > ---
> > >  utilities/gitlab-ci.yml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > index 42eda60f..6c3ec1e6 100644
> > > --- a/utilities/gitlab-ci.yml
> > > +++ b/utilities/gitlab-ci.yml
> > > @@ -19,7 +19,7 @@ generate_pdfs:
> > >      stage: build
> > > =20
> > >      before_script:
> > > -        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript gr=
aphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts tt=
f-liberation
> > > +        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript gr=
aphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts tt=
f-liberation
> > >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic=
.regular.ttf ~/.local/share/fonts/ && fc-cache
> > >          - wget https://sourceforge.net/projects/fig2ps/files/latest/=
download -O /dev/shm/fig2ps.tbz
> > >          - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /d=
ev/shm/build --strip-components=3D1
> >=20
> > I don't think there is anybody who bothers with gitlab-ci
> > other than you.  You can do whatever you'd like, I guess.
> >=20
> > FWIW,
> >=20
> > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> Queued and pushed, thank you both!
>=20
> 							Thanx, Paul

Thanks Paul!

>=20
> > Sidenote:
> >=20
> > Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
> > there is no need to install fig2ps in the container.
> >=20
> >         Thanks, Akira
> >=20

