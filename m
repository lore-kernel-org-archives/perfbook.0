Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849700;
	b=tp+7ugasDzRx7DsTzH+s1gfD8r7Mp5vUH5gTo9L3qRz3B5sRsU7kxjVd0IiOnQbhiNcd
	 pJYMMj7ENblwAf7TxB4zSSUjXGQSRP6gygsJzm/dVVccrIwVWqt5g47J7yhXziisFcbup
	 nkNc+gWmpcDqFAzFgNqcj0Sb1BtN4REZ3hzkwVIhBxb0WkG97e7wV7wo9EdSxwQnx4mFQ
	 fhaEO1/UjeWMn/d+6qS6lR1BZjD1oIypOaU2P2ZR9F9D2RBfm38p1QO6hrqE5vXzerVF7
	 oaSm1fEg4+p5TVjKJ0FDD73lzLhjAyPxGQ5kvs58ZvEfGDZ93QbWI6kdcFQUDxBvknw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849700;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=rafcGpU5xPbzItgsKSFcmVJ/3H1XBA8RDgIOLCzUNMY=;
	b=D247WFzbkCcjfmBpA0bHpJg3MiznRP6/NpRYRKOYjGrMMvjtHyjdyNBri+tCzn+3yfoG
	 7PdjjYFBG2fj3RStV2twlRsO3XEk5r7QVl7Q3dWPAyBrKsYGRFneeSEYlEqC2SHkqUtLu
	 EwHJubqRJ8Z8VQVk9RTTVJqRYruRCdRVt7UG+Rw9tlC2Wb4TURII5W5JJYk4igUe6ySOz
	 lvBbS1vkF+JXyn24z2y0BZ6jV9WYVA244hQHmIFrqtBB8Rgt5Cll31UtBrHwDgOnr9ikT
	 jymjqKf0sZSfNMqeGFtOcJQ3xUf1H1zbyx3F3NPJe9QJd7XBw/B7CpeVjhRPsiO68cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=fejes.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF7606A33D
	for <perfbook@vger.kernel.org>; Mon, 16 Nov 2026 17:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BCF7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fejes.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so5110526c88.0
        for <perfbook@vger.kernel.org>; Mon, 16 Nov 2026 09:21:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849699; x=1795454499;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rafcGpU5xPbzItgsKSFcmVJ/3H1XBA8RDgIOLCzUNMY=;
        b=fWz+V5YtWbXS4qZFdDQLhlI5tVcMwe/qW9rv28lCMW7gA33Bk3qSMHEapH4qaQ+4ho
         3PkMY71mJfLSr9+hswp/1+LN7eGiahvdqXMErUpAF8OPQ6DaU6mX429YrEWZHYOoYU2N
         cHr3QtfyDI64duVG6b5NECk+zgtUNRUofm8o0SKEowJdIQOs1P8i7IkBFF8hW5GMw4Yz
         I+bkoliBY8y976DtiVgVVELh2iPdRb5yWvhKsTOb6KeNuGjN51PJfMdCYuuGMngBjTIC
         mB5BT5U75A263YoHlB8Tx4S3GA/+S/pTk8y/tzhIVU1mHLnn+Fw/T+4jlSLI3XFI8Kat
         R4vQ==
X-Forwarded-Encrypted: i=1; AL+hErE1fitFdtQsBSaJPCBFyJMTDBH3fE8bYeR1TrcWmzG0Beo0kPcq3heqJt/GgC2b8hE5yBVeFSudcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9fGKqqp6pHHN9ouChoraT2kbmCJa7oe38Bp3OOaZARZ1u1N6aF
	ygsP3bwwmoDppoJhvhb8/Bkg1+UW9eLSrjmdbfBNPhTN1IzdEzeUuNwM
X-Gm-Gg: AYBFou3xuptAzkzMatPX/KPRZe91gkbynKieG8qNSL/qY/ShfXjcnGzoVMv3XcKTkmG
	rlNEss1cZz6zV/EkgBloXYxwq6PGgfjFJLsI8fz2ntK48qUu9a4eM349qg63vhht0eaQcoZr2cH
	TKZekg1/bT0JIY2GbhcAakprAi5MUg2Or1pj1d8im5PeLY+gjnfL+jyINjgzad3xv0XjPywNDqP
	wQmK5NhyNI6InxCXZ9Sznom5oh0GtpFA9HeoAJG9il0xKieJF2TYjE9IyufMWb8QOrVgOLk/kSc
	hmWaKecDTL2WWfM1uHR37SIAQhzldTKSjxCou2AwHrkSnaDALf9pL7bTw4f5NGmsQTIvFvvpM5u
	BadV1JkID6dwbC45FLI/pAqlZrl6TYSVQ+BxGJMJE+sOaCJZDzu5iBGseCpVarcHofiTYtHeOi1
	gBVQS3tRz51RLsJe4jMDfxX2ckBlONSGWTgPcoNIr717txgbT4hPxF97w++wQF8Kjw5q232/RhQ
	7iReeEJTbXmYGbDT1prjLKPU0FN9FfFDNWgveOD82SOoLj7fVAI3RJP1P9MBcdUGV95qU/AFyFg
	o8RCXsi7e+3/gJl7568lRuyznTBt36k/M+SvBhWBcln53crSYB6NkK/bghBVYafTGG2G4JKM8nW
	5RshyJWt02Slmu1t3gcPr5eCXprEmd3/8pCqVUA4d4AT8dceB8JHvU6zPgoEUtX0fb9O/Lz5aO+
	/SOLdTjZnH1OOCdorY0d2zFvMEg1W5UgKNnZEgpT2+AzGpEpcbGSVPQaMaCbmNNGR8rq3qGg==
X-Received: by 2002:a05:7023:a42:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b5030a3490mr9706952c88.10.1794849698598;
        Mon, 16 Nov 2026 09:21:38 -0800 (PST)
Received: from ?IPv6:2001:67c:370:128:4595:f7da:56c1:448d? ([2001:67c:370:128:4595:f7da:56c1:448d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm28986360c88.1.2026.11.16.09.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:21:37 -0800 (PST)
Message-ID: <73c4092d6771e0c8786576f1e577d20ddf207df9.camel@fejes.dev>
Subject: Re: [RFC PATCH 0/7] Add reflowable HTML and EPUB3 build target
From: Ferenc Fejes <ferenc@fejes.dev>
To: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Leonardo Bras
	 <leobras.c@gmail.com>
Date: Mon, 16 Nov 2026 18:21:36 +0100
In-Reply-To: <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
References: <20261115210138.229034-1-ferenc@fejes.dev>
	 <11691935-1665-4d70-a606-56782d0819b2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Post: <mailto:perfbook@vger.kernel.org>
List-Help: <mailto:perfbook+help@vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
List-Owner: <mailto:perfbook+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 13:41 +0900, Akira Yokosawa wrote:
> Hi!
>=20
> On 11/16/26 06:01, Ferenc Fejes wrote:
> > Hi!
> >=20
> > This RFC series adds experimental reflowable EPUB3 and HTML build
> > targets
> > ("make epub", "make epub-endnotes", and "make html") derived from
> > the
> > ebook-size variant via TeX Live's lwarp package and Pandoc, without
> > modifying any of the book's existing .tex or .sty files.
> >=20
> > Overview of the pipeline:
> >=20
> > - reflow.ltx hooks into the generated perfbook-epub.tex wrapper to
> > adapt
> > =C2=A0 print-oriented macros, listings, tables, figures, equations,
> > footnotes,
> > =C2=A0 Quick Quizzes, and cross-references for HTML/EPUB output.
> > - Makefile stages SVG figures in parallel under epub-figs/ and
> > invokes
> > =C2=A0 utilities/runlwarp.sh to run lwarp, render math SVGs via lwarpmk=
,
> > =C2=A0 package the chapter-split EPUB3 with Pandoc, and run structural
> > =C2=A0 validation checks (plus epubcheck when installed).
> > - utilities/epub-fixhtml.pl and utilities/epub.css perform post-
> > Pandoc
> > =C2=A0 XHTML/SVG/CSS adjustments tested in KOReader and Foliate,
> > including
> > =C2=A0 EPUB3 popup footnotes and Quick Quiz answers (and a plain endnot=
e
> > =C2=A0 variant in perfbook-endnotes.epub for readers without popup
> > support).
> >=20
> > This is an RFC so I would be happy to hear ideas how I can improve
> > this
> > experiment. Few things:
> >=20
> > 1. Does this non-invasive lwarp + Pandoc approach look acceptable
> > for
> > =C2=A0=C2=A0 maintaining experimental EPUB support alongside the PDF bu=
ilds?
> > 2. Is it worth keeping both perfbook.epub (popup footnotes/quizzes)
> > and
> > =C2=A0=C2=A0 perfbook-endnotes.epub (linked chapter endnotes), or would=
 a
> > single
> > =C2=A0=C2=A0 target be preferable?
> > 3. Are the Dockerfile package additions and non-blocking GitLab CI
> > job
> > =C2=A0=C2=A0 (allow_failure: true) aligned with how you would like this
> > tested?
> >=20
> > AI: This RFC generated by language models and I verified the result
> > on
> > my physical epub reader and on Linux in Foliate and KOReader epub
> > readers. I used several models and refined the set for months, and
> > with
> > the latest and greatest frontier I was unable to trim ot further.
> > The downside
> > of this work is that I cannot tell with full confidence this is the
> > simplest form. With more knowledge it might be improved further.
> >=20
> > I tried three approach to get to a working epub target:
> > - tex4ht: it required heavy modifications of the already existing
> > LaTeX
> > =C2=A0 source so I abandoned this approach. After aroung 2k LoC change
> > it was
> > =C2=A0 able to produce a reasonable HTML and ePUB, but it was too
> > intrusive
> > =C2=A0 for my taste
> > - lwrap (this one): this felt the best and required the least
> > change
> > =C2=A0 compared to the upstream. It hooks into the build flow in the
> > right
> > =C2=A0 spot so no changes required in the upstream LaTeX code
> > - LateXML: this is what arXiv uses to compile the paper sources to
> > HTML
> > =C2=A0 and they improve it in quite a fast pace. This target was
> > intrusive
> > =C2=A0 and a reasonable looking output required many small changes in
> > the
> > =C2=A0 upstream source and what worse, in the LateXML toolchain. I
> > abandoned
> > =C2=A0 this approach as well
> > These trials executed 2-3 months ago, and lwrap was the winner, but
> > models might improved since making LateXML feasible. In the past
> > months
> > I only improved the lwrap based approach, resulting this RFC.
>=20
> Sounds interesting!
>=20
> That said, I couldn't complete "make epub" with debian/testing's TeX
> Live.

Sorry for that, I'm using Debian unstable which is a little bit ahead
of tasting. I compiled it on Ubuntu 26.04 as well, but AFAIR there I
have to install lwrap from source.

>=20
> In perfbook-epub_html.log, there are a couple of warnings from lwarp
> as follows:
>=20
> -----
> (/usr/share/texlive/texmf-dist/tex/latex/fancyvrb/fancyvrb.sty
> Package: fancyvrb 2026/08/13 4.7 verbatim text (tvz,hv)
> \FV@CodeLineNo=3D\count416
> \FV@InFile=3D\read5
> \FV@TabBox=3D\box69
> \c@FancyVerbLine=3D\count417
> \FV@StepNumber=3D\count418
> \FV@OutFile=3D\write7
> )
>=20
> Package lwarp Warning: A definition has changed:
> (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 fancyvrb: \FV@ListProcessLine
> (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (9A9947A55E3D6D1C92E99F16EDC0BC68)
> (lwarp)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on input line 118.
> -----
>=20
> , and at the bottom of the log:
>=20
> --------------------------------
> Package verifycommand Warning: Definitions have changed.
> Patches for the following macros may need to be updated.
> See the previous warnings for line numbers.
>=20
> Syntax:=C2=A0 Patching pkg -> Defining pkg: Macro (checksum)
> -----
> (verifycommand)=C2=A0 lwarp -> fancyvrb: \FV@ListProcessLine
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (9A9947A55E3D6D1C92E99F16EDC0BC68)
> -----
> Look for updates to these packages.
> --------------------------------
>=20
> FYI, fancyvrb of upstream TeX Live is v4.8 released on
> 2026/10/20, which does not satisty lwarp ...
>=20
> Which version of fancyvrb does lwarp expect?
> ("lwarpmk --version" says: lwarpmk: v0.922)

Same for me: v0.922 like you have and=C2=A0

share/doc/texlive-doc/latex/fancyvrb/Changes head say:
--- fancyvrb.sty
4.8  2026/10/20   - fix for line references with \cref

Its strange the same versions not working on your env. Will take a look
in debian testing docker and lets see if I can do something with it.

>=20
> I tried debian/testing because lwarpmk in debian/latest
> is v0.918.

Here I have texlive-latex-recommended (2026.20261111-1) installed which
include compatible versions.

>=20
> Thanks, Akira
>=20
> >=20
> > Thanks,
> > Ferenc
> >=20
> > Ferenc Fejes (7):
> > =C2=A0 reflow.ltx: Add LaTeX-to-HTML shims for lwarp builds
> > =C2=A0 utilities: Add EPUB3 post-processor and stylesheet
> > =C2=A0 utilities/runlwarp.sh: Add lwarp and Pandoc build driver
> > =C2=A0 Makefile, .gitignore: Add epub and html build targets
> > =C2=A0 epub: Add endnote variant for readers without popup footnotes
> > =C2=A0 FAQ-BUILD.txt: Document HTML and EPUB build targets
> > =C2=A0 docker, gitlab-ci: Add EPUB build dependencies and CI job
> >=20
> > =C2=A0.gitignore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 ++
> > =C2=A0FAQ-BUILD.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 45 ++++++
> > =C2=A0Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 68 ++++++++-
> > =C2=A0docker/Dockerfile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 2 +-
> > =C2=A0reflow.ltx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 255 ++++++++++++++++++++++++++++++++
> > =C2=A0utilities/epub-fixhtml.pl |=C2=A0 93 ++++++++++++
> > =C2=A0utilities/epub.css=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 63 ++++++++
> > =C2=A0utilities/gitlab-ci.yml=C2=A0=C2=A0 |=C2=A0 17 +++
> > =C2=A0utilities/runlwarp.sh=C2=A0=C2=A0=C2=A0=C2=A0 | 299
> > ++++++++++++++++++++++++++++++++++++++
> > =C2=A09 files changed, 852 insertions(+), 4 deletions(-)
> > =C2=A0create mode 100644 reflow.ltx
> > =C2=A0create mode 100755 utilities/epub-fixhtml.pl
> > =C2=A0create mode 100644 utilities/epub.css
> > =C2=A0create mode 100644 utilities/runlwarp.sh
> >=20
> >=20
> > base-commit: 94d572e236ab8e26fa79ff0776a3bba221647315
> > --
> > 2.55.0
>=20

Ferenc
