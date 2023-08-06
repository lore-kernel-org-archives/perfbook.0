Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjHFEzC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 6 Aug 2023 00:55:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463D81FE4
        for <perfbook@vger.kernel.org>; Sat,  5 Aug 2023 21:55:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09D7160EC3
        for <perfbook@vger.kernel.org>; Sun,  6 Aug 2023 04:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691297699;
        bh=o73cpT/pJtoM17QB9qPDO/D+LVebcfTpdy5+KDsbir4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=XqMuqlQxfvZp2Dkto5UBDaBnC53ZtJ334DTOmZ7DGFzNVP0ivBCxk+H3hG3pd96OQ
         pADsr1hLqJ+lObjBJW7RgtH5tECLBCmO5Z86Lcf6qSHtnXlVWHg7c9EL3v0unZtXjX
         zGjMsLaJ+bnENWfrZeBjab418vspeE6r9gp7N7Zs+dzo5RIowbGoE10i0U64trgCvX
         O67E6FzOxqK06oMPxEHWdzrFxGtBYwJQCe6hfOFmexGg9ifM/t0EqGCuqkn01RLfX/
         3EhbXg+NmPZCBrE/MPVkH6kRnsgFMADLL2qKrzcpYPHPJ2GzTP2+nR/E0ieWbI80zB
         XPbFFp+QmEOkQ==
Date: Sat, 5 Aug 2023 21:54:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] utilities/gitlab-ci: Fully update system before building
Message-ID: <fbf1bc6f-892e-4cda-b78c-e551a2c88cd2@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230804174638.1142845-2-leobras.c@gmail.com>
 <d5e9d874f3c432e49c7c824160ced4cbd250f28e.camel@gmail.com>
 <033be4b7-9403-4886-ab52-d704871d93ac@paulmck-laptop>
 <71946ccabc9534a3de1ded5cf659d90ee72285e7.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <71946ccabc9534a3de1ded5cf659d90ee72285e7.camel@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Aug 05, 2023 at 12:16:04AM -0300, Leonardo Br=E1s wrote:
> On Fri, 2023-08-04 at 11:05 -0700, Paul E. McKenney wrote:
> > On Fri, Aug 04, 2023 at 02:53:04PM -0300, Leonardo Br=E1s wrote:
> > > On Fri, 2023-08-04 at 14:46 -0300, Leonardo Bras wrote:
> > > > Some recent CI errors come from the incompatibility between packages
> > > > pre-installed in the docker image and the ones installed via pacman.
> > > >=20
> > > > To avoid this, make a full system upgrade when installing the needed
> > > > packages.
> > > >=20
> > > > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> > > > ---
> > > >  utilities/gitlab-ci.yml | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> > > > index 544b9373..bcda8712 100644
> > > > --- a/utilities/gitlab-ci.yml
> > > > +++ b/utilities/gitlab-ci.yml
> > > > @@ -9,7 +9,7 @@ test_codesamples:
> > > >      stage: test
> > > > =20
> > > >      before_script:
> > > > -        - pacman --noconfirm -Sy make gcc liburcu
> > > > +        - pacman --noconfirm -Syu make gcc liburcu
> > > > =20
> > > >      script:
> > > >          - make -C CodeSamples/
> > > > @@ -19,7 +19,7 @@ generate_pdfs:
> > > >      stage: build
> > > > =20
> > > >      before_script:
> > > > -        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript =
graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts =
ttf-liberation
> > > > +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript=
 graphviz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts=
 ttf-liberation
> > > >          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-com=
ic.regular.ttf ~/.local/share/fonts/ && fc-cache
> > > > =20
> > > >      script:
> > >=20
> > > Sorry about resending.=20
> > > I had an issue with credentials, please ignore the ones sent from my =
employer
> > > account: the gmail is the correct one.
> >=20
> > Ah, I queued the wrong one.  I updated it and pushed it out, could you
> > please double check?
>=20
> Yeap, it's correct. Thanks!
>=20
> (Sorry about the overhead)

No problem, as long as we have it set up correctly.  ;-)

							Thanx, Paul
