Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjHDSF0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 4 Aug 2023 14:05:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BC446BD
        for <perfbook@vger.kernel.org>; Fri,  4 Aug 2023 11:05:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 597D5620D7
        for <perfbook@vger.kernel.org>; Fri,  4 Aug 2023 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691172322;
        bh=u9zYhFZWrycBgXnH1UzS9ZaHYLrcwLZeTyg9lw2MHik=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=D4QTuSWQ/LL1XOCw11kzN0QPRB8/5FPQYaUEnL25fyeOX5N40ze5QWB41BZvHjjUu
         +5cyJmYqsNRYn/8epwB0ehS9xB860Ats2QDD+18m7OWQAaLBaxPOlUNvvDWjBVeKKy
         WBYdSxUeo16QNXMfI7iDS+857VYl/CQIF1vBCKTGkmr4cMcu42AO+JySSWa9MsOdKN
         Qg1z9fkjO+bpwOQP0CqORkeAVz71zdehl8cSrUUwErwTRRaq8NnqtJcNNewx2hoyg+
         rouzJ+wCVnuMhgGVESwtsxhaIkXvzXrEKNrNHffMOY7uPXkBVPJW3i1TuPc/gl/AGk
         cL2g48Kte7bSQ==
Date: Fri, 4 Aug 2023 11:05:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] utilities/gitlab-ci: Fully update system before building
Message-ID: <033be4b7-9403-4886-ab52-d704871d93ac@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230804174638.1142845-2-leobras.c@gmail.com>
 <d5e9d874f3c432e49c7c824160ced4cbd250f28e.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d5e9d874f3c432e49c7c824160ced4cbd250f28e.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Fri, Aug 04, 2023 at 02:53:04PM -0300, Leonardo Br=E1s wrote:
> On Fri, 2023-08-04 at 14:46 -0300, Leonardo Bras wrote:
> > Some recent CI errors come from the incompatibility between packages
> > pre-installed in the docker image and the ones installed via pacman.
> >=20
> > To avoid this, make a full system upgrade when installing the needed
> > packages.
> >=20
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > ---
> >  utilities/gitlab-ci.yml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > index 544b9373..bcda8712 100644
> > --- a/utilities/gitlab-ci.yml
> > +++ b/utilities/gitlab-ci.yml
> > @@ -9,7 +9,7 @@ test_codesamples:
> >      stage: test
> > =20
> >      before_script:
> > -        - pacman --noconfirm -Sy make gcc liburcu
> > +        - pacman --noconfirm -Syu make gcc liburcu
> > =20
> >      script:
> >          - make -C CodeSamples/
> > @@ -19,7 +19,7 @@ generate_pdfs:
> >      stage: build
> > =20
> >      before_script:
> > -        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript grap=
hviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-=
liberation
> > +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript gra=
phviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf=
-liberation
> >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.r=
egular.ttf ~/.local/share/fonts/ && fc-cache
> > =20
> >      script:
>=20
> Sorry about resending.=20
> I had an issue with credentials, please ignore the ones sent from my empl=
oyer
> account: the gmail is the correct one.

Ah, I queued the wrong one.  I updated it and pushed it out, could you
please double check?

							Thanx, Paul
