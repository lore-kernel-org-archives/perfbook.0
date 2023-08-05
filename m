Return-Path: <SRS0=s686=DW=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691205368; x=1691810168;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XdqQh7KrrngwzkCwJ5sXDpRiMh78yJ08knAfAKK0XtA=;
        b=oIIin/tH8gWfeb0es/06rZiwv+XHwXZ90yxxjYuXwUcrewZrxvPQq+XpMKgg4mTfEb
         ZMksO8M1X24Ggak9A6Gk6kHhy16s/c2Rjp69RMg35SFkbUkbjI+31WicK4bUi4slAfjy
         Xfl2uKzylDXbjmT7Roil1s0s+xIG1JKpgxK1azzgVcuKDO2tDDAWn8ruImyQzpKeut3E
         psx8QXH5Pkpse8Sup86/VJT6dBmf2BS0zoSusF+dCRRhv6QwgUq3mndPIL7v3InWk65Z
         1x2BWOlIP6AjVDn6PsaE0+EiA8z1B5iqMVMrvlY5RlK8QMjTz9l0hp35g8JUNazDXcKC
         iCBg==
Message-ID: <71946ccabc9534a3de1ded5cf659d90ee72285e7.camel@gmail.com>
Subject: Re: [PATCH] utilities/gitlab-ci: Fully update system before building
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Sat, 05 Aug 2023 00:16:04 -0300
In-Reply-To: <033be4b7-9403-4886-ab52-d704871d93ac@paulmck-laptop>
References: <20230804174638.1142845-2-leobras.c@gmail.com>
	 <d5e9d874f3c432e49c7c824160ced4cbd250f28e.camel@gmail.com>
	 <033be4b7-9403-4886-ab52-d704871d93ac@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 2023-08-04 at 11:05 -0700, Paul E. McKenney wrote:
> On Fri, Aug 04, 2023 at 02:53:04PM -0300, Leonardo Br=C3=A1s wrote:
> > On Fri, 2023-08-04 at 14:46 -0300, Leonardo Bras wrote:
> > > Some recent CI errors come from the incompatibility between packages
> > > pre-installed in the docker image and the ones installed via pacman.
> > >=20
> > > To avoid this, make a full system upgrade when installing the needed
> > > packages.
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > ---
> > >  utilities/gitlab-ci.yml | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > index 544b9373..bcda8712 100644
> > > --- a/utilities/gitlab-ci.yml
> > > +++ b/utilities/gitlab-ci.yml
> > > @@ -9,7 +9,7 @@ test_codesamples:
> > >      stage: test
> > > =20
> > >      before_script:
> > > -        - pacman --noconfirm -Sy make gcc liburcu
> > > +        - pacman --noconfirm -Syu make gcc liburcu
> > > =20
> > >      script:
> > >          - make -C CodeSamples/
> > > @@ -19,7 +19,7 @@ generate_pdfs:
> > >      stage: build
> > > =20
> > >      before_script:
> > > -        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript gr=
aphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts tt=
f-liberation
> > > +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript g=
raphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts t=
tf-liberation
> > >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic=
.regular.ttf ~/.local/share/fonts/ && fc-cache
> > > =20
> > >      script:
> >=20
> > Sorry about resending.=20
> > I had an issue with credentials, please ignore the ones sent from my em=
ployer
> > account: the gmail is the correct one.
>=20
> Ah, I queued the wrong one.  I updated it and pushed it out, could you
> please double check?

Yeap, it's correct. Thanks!

(Sorry about the overhead)


Leo

>=20
> 							Thanx, Paul

