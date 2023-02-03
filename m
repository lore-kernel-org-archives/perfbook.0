Return-Path: <SRS0=drfo=57=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lVwnZ3W5kGoGm+oqFSqp+VGDqRVRT8dK0OxeoPLeH4E=;
        b=Xyi1rt2cJ31vm/AxxCu04KOwMyuQDbl2fVcput8jC0EeSeCJ//1Sv12V3iLMR3LUo8
         mOZbVe1nyrsOUMTrlCQikL3m5i7qmc4n7LBX4cINwLMH/272/GxSwHHJ/7FkgWq4JorX
         KT8cMf0AcVviVeSLUExzYRQ26BBQJBeNT/656GuKQfVt5Z/PW8G6dRaHgkwkXBSlt/nf
         MM7NGqSrtc2u67TPMI3roFMiBV2w27jst1Xa4fCZ/KV0JbZElGVpfg+mNajK7vrdpw8Y
         GxBfsMMu0lx70/00+DE3NVgoFxepwS6iufyELmnDTwdjEuv1uUtW34Z0w0gWIo1+dMw/
         8ICw==
Message-ID: <739868dfa9bea65089a42220278c6fa6ef028f68.camel@gmail.com>
Subject: Re: [PATCH v2] Add utilities/gitlab-ci.yml for pdf generation and
 testing on Gitlab.
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Fri, 03 Feb 2023 02:30:04 -0300
In-Reply-To: <20230203044833.GG2948950@paulmck-ThinkPad-P17-Gen-1>
References: <20230203021853.34207-1-leobras.c@gmail.com>
	 <265b0793-78bc-d8b4-5a4a-8198854b2f01@gmail.com>
	 <20230203044833.GG2948950@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, 2023-02-02 at 20:48 -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2023 at 12:03:18PM +0900, Akira Yokosawa wrote:
> > On Thu,  2 Feb 2023 23:18:55 -0300, Leonardo Bras wrote:
> > > For Gitlab repositories mirroring the original repository, trigger th=
e
> > > Gitlab-CI after every push to the original repo.
> > >=20
> > > For the pipeline to run, the Gitlab repo needs to configure:
> > > - Settings -> CI/CD -> General Pipelines -> CI/CD configuration file =
to
> > >   utilities/gitlab-ci.yml
> > >=20
> > > What the pipeline does:
> > > - Compile-test CodeSamples
> > > - IF pass, build PDFs: regular, 1c, eb
> > >=20
> > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > ---
> > >  utilities/gitlab-ci.yml | 33 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 33 insertions(+)
> > >  create mode 100644 utilities/gitlab-ci.yml
> >=20
> > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> Queued and pushed, thank you both!
>=20

Thank you guys for accepting it!

The last commit automatically got mirrored to my Gitlab repo, and triggered=
 the
pipeline, which succeed.=C2=A0

The following link points all pipelines ran and their results:
https://gitlab.com/linux-kernel/perfbook/-/pipelines

For downloading the pdfs generated, you only need to click the rightmost bu=
tton
for the pipeline, then "generate_pdfs:archive".

I just checked and the commit number seems correct now with the full git cl=
one.

Best regards,
Leo

> 							Thanx, Paul
>=20
> > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > new file mode 100644
> > > index 00000000..acc12fb2
> > > --- /dev/null
> > > +++ b/utilities/gitlab-ci.yml
> > > @@ -0,0 +1,33 @@
> > > +image: archlinux:latest
> > > +
> > > +stages:
> > > +  - test
> > > +  - build
> > > +
> > > +test_codesamples:
> > > +    stage: test
> > > +
> > > +    before_script:
> > > +        - pacman --noconfirm -Sy make gcc liburcu
> > > +
> > > +    script:
> > > +        - make -C CodeSamples/
> > > +
> > > +generate_pdfs:
> > > +    stage: build
> > > +
> > > +    before_script:
> > > +        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript gr=
aphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
> > > +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic=
.regular.ttf ~/.local/share/fonts/ && fc-cache
> > > +        - wget https://sourceforge.net/projects/fig2ps/files/latest/=
download -O /dev/shm/fig2ps.tbz
> > > +        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C /d=
ev/shm/build --strip-components=3D1
> > > +        - make install -C /dev/shm/build
> > > +
> > > +    script:
> > > +        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> > > +
> > > +    artifacts:
> > > +      paths:
> > > +          - perfbook.pdf
> > > +          - perfbook-1c.pdf
> > > +          - perfbook-eb.pdf
> >=20
> >=20

