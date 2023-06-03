Return-Path: <SRS0=QwI4=BX=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685813254; x=1688405254;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3wpBZccrSslzWqm8VDY6+02nrm6V2sSc7QgDKVV5tec=;
        b=bknFt/6U64DjnkzzE/EvpMmMRZ821Wyi75C1Z9FZydyL1M2nGIMHmxratpU69rs8/l
         PLpBrc3hwkgJBp+l8fOUIgo4rvCRVxSREG3VL1gJEb0WyMKNyoO7zeJ7kannBreX28nH
         s/ZLJr6WbfiICYdZrzEyIIFAfOxusKj0jgnQxj4doz6pD4CMdU+GHHWgndPnxpFCc6sY
         vPl+NbEKme8n9zWB7eHW9hGuI3D7Y8Le9y4PlQEOAWpzyQd/XLxcvLjk+0X9T/vfF+s6
         v8qdJ1Yy0jQg3Q1Z8bavb1aVvdFDksddxMD3gAGYIpWJosFwHldgujGj8oiQli5cce1S
         HRtw==
Message-ID: <12ac915a7b0eb3563c1784375a5bed5ad91f607a.camel@gmail.com>
Subject: Re: [RFC PATCH 1/1] utilities/gitlab-ci: Fix gitlab-ci due to Arch
 Linux deprecating texlive-most
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Sat, 03 Jun 2023 14:27:32 -0300
In-Reply-To: <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
References: <20230601203816.996788-1-leobras.c@gmail.com>
	 <2274e683-8b17-f974-5f6c-2a2b51d13cff@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, 2023-06-03 at 14:02 +0900, Akira Yokosawa wrote:
> Hi Leo,
>=20
> Why is this "RFC" ??? :-)

Used the wrong script for generating patches :)

>=20
> On Thu,  1 Jun 2023 17:38:16 -0300, Leonardo Bras wrote:
> > Arch Linux folks deprecated the texlive-most package group in favor of
> > texlive-meta, which should contain the same packages with an aditional
> > tool.
> >=20
> > Fix this script to use texlive-meta, so the gitlab pipeline is able to
> > build the pdfs.
> >=20
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  utilities/gitlab-ci.yml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 42eda60f..6c3ec1e6 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -19,7 +19,7 @@ generate_pdfs:
> >      stage: build
> > =20
> >      before_script:
> > -        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript grap=
hviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-=
liberation
> > +        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript grap=
hviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-=
liberation
> >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.r=
egular.ttf ~/.local/share/fonts/ && fc-cache
> >          - wget https://sourceforge.net/projects/fig2ps/files/latest/do=
wnload -O /dev/shm/fig2ps.tbz
> >          - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /dev=
/shm/build --strip-components=3D1
>=20
> I don't think there is anybody who bothers with gitlab-ci
> other than you.  You can do whatever you'd like, I guess.
>=20
> FWIW,
>=20
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20

Thanks!

> Sidenote:
>=20
> Since commit 1f907f3d77dd ("Use fig2dev as fallback to fig2eps"),
> there is no need to install fig2ps in the container.
>=20
>         Thanks, Akira
>=20

Oh, nice!
I will=C2=A0write a patch on this to simplify the gitlab script.
Thanks!


