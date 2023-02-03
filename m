Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjBCFnR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 3 Feb 2023 00:43:17 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CC6D53E
        for <perfbook@vger.kernel.org>; Thu,  2 Feb 2023 21:43:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80B13B828B2
        for <perfbook@vger.kernel.org>; Fri,  3 Feb 2023 05:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675402989;
        bh=yY6GcMse6KKE3ltZjNUWjrjfpDjVY3l9/V0JIH99moM=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=nwSg6yLONSYR+zNlynb4SixT6V9mBsVPq1W2JClUKtEgnGnk8KTlL6HPrm+sFfcbP
         PGiJBEn8TXjRutPycv9++4jVVW+ianQq8vZ3X8lZ1379cV/Bm8cAnZf5mWZUnxmx8L
         ol2gVKFPvVngMuIl47dxX26R+8GjoExg/smdSO1CSOwUyJcwyPtSVfsgrhqcLA5yNq
         CDp3kUGzzTz3Fjvh95aLDY0GpirJqfm/bQjfwm+um0u6BJ5SDSXjof7nVgcVjbpB7P
         j+kMdAWEmEwk6xmuqukGMXz/wcLmldgQ98qkRz2JbEpXqrRxJeM7Aoa01Ns4N3L09Z
         dR6ELiFHoiUKA==
Date: Thu, 2 Feb 2023 21:43:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2] Add utilities/gitlab-ci.yml for pdf generation and
 testing on Gitlab.
Message-ID: <20230203054308.GI2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230203021853.34207-1-leobras.c@gmail.com>
 <265b0793-78bc-d8b4-5a4a-8198854b2f01@gmail.com>
 <20230203044833.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <739868dfa9bea65089a42220278c6fa6ef028f68.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <739868dfa9bea65089a42220278c6fa6ef028f68.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Fri, Feb 03, 2023 at 02:30:04AM -0300, Leonardo Br=E1s wrote:
> On Thu, 2023-02-02 at 20:48 -0800, Paul E. McKenney wrote:
> > On Fri, Feb 03, 2023 at 12:03:18PM +0900, Akira Yokosawa wrote:
> > > On Thu,  2 Feb 2023 23:18:55 -0300, Leonardo Bras wrote:
> > > > For Gitlab repositories mirroring the original repository, trigger =
the
> > > > Gitlab-CI after every push to the original repo.
> > > >=20
> > > > For the pipeline to run, the Gitlab repo needs to configure:
> > > > - Settings -> CI/CD -> General Pipelines -> CI/CD configuration fil=
e to
> > > >   utilities/gitlab-ci.yml
> > > >=20
> > > > What the pipeline does:
> > > > - Compile-test CodeSamples
> > > > - IF pass, build PDFs: regular, 1c, eb
> > > >=20
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > > ---
> > > >  utilities/gitlab-ci.yml | 33 +++++++++++++++++++++++++++++++++
> > > >  1 file changed, 33 insertions(+)
> > > >  create mode 100644 utilities/gitlab-ci.yml
> > >=20
> > > Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> >=20
> > Queued and pushed, thank you both!
> >=20
>=20
> Thank you guys for accepting it!
>=20
> The last commit automatically got mirrored to my Gitlab repo, and trigger=
ed the
> pipeline, which succeed.=A0
>=20
> The following link points all pipelines ran and their results:
> https://gitlab.com/linux-kernel/perfbook/-/pipelines
>=20
> For downloading the pdfs generated, you only need to click the rightmost =
button
> for the pipeline, then "generate_pdfs:archive".
>=20
> I just checked and the commit number seems correct now with the full git =
clone.

Good to hear!

							Thanx, Paul

> Best regards,
> Leo
>=20
> > 							Thanx, Paul
> >=20
> > > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > > new file mode 100644
> > > > index 00000000..acc12fb2
> > > > --- /dev/null
> > > > +++ b/utilities/gitlab-ci.yml
> > > > @@ -0,0 +1,33 @@
> > > > +image: archlinux:latest
> > > > +
> > > > +stages:
> > > > +  - test
> > > > +  - build
> > > > +
> > > > +test_codesamples:
> > > > +    stage: test
> > > > +
> > > > +    before_script:
> > > > +        - pacman --noconfirm -Sy make gcc liburcu
> > > > +
> > > > +    script:
> > > > +        - make -C CodeSamples/
> > > > +
> > > > +generate_pdfs:
> > > > +    stage: build
> > > > +
> > > > +    before_script:
> > > > +        - pacman --noconfirm -Sy texlive-most fig2dev ghostscript =
graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts
> > > > +        - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-com=
ic.regular.ttf ~/.local/share/fonts/ && fc-cache
> > > > +        - wget https://sourceforge.net/projects/fig2ps/files/lates=
t/download -O /dev/shm/fig2ps.tbz
> > > > +        - mkdir /dev/shm/build && tar -xjf /dev/shm/fig2ps.tbz -C =
/dev/shm/build --strip-components=3D1
> > > > +        - make install -C /dev/shm/build
> > > > +
> > > > +    script:
> > > > +        - make perfbook.pdf perfbook-1c.pdf perfbook-eb.pdf
> > > > +
> > > > +    artifacts:
> > > > +      paths:
> > > > +          - perfbook.pdf
> > > > +          - perfbook-1c.pdf
> > > > +          - perfbook-eb.pdf
> > >=20
> > >=20
>=20
