Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343756AbiALSCx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Jan 2022 13:02:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D872EC061756
        for <perfbook@vger.kernel.org>; Wed, 12 Jan 2022 10:02:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78B236198E
        for <perfbook@vger.kernel.org>; Wed, 12 Jan 2022 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642010572;
        bh=MUHutAZ8gVv4H0gPaOa0IqRc8zGYqDMdZdulZ13FcsI=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=twA/bSnk5ckS4d0E/Y4uFNoUS9sMnJKdncLOrkEml4MUZWKNngJcsxkK03ZQO3PG4
         hY/yN8OlA2uTiISZ8rUxB6buuC3O2mJixlx/9QEKj+hDlt74tcPyp0AnB556RaATS3
         CjYmkUaoXCrux+ED/gzyLkwFhAHDRPFFe57TQQlLhlJa212CK2fQLFojSgg2s2pNvZ
         ycEOReV552mjVkGjw/Ht1fCXN4PULrmFeCL6l6lFcSjgXj1x66w41yhAktfBGi7lli
         /LQbEwSdOE5A5e/5SwiSxk7CkyiqISpPf+5ApDEeG8a09KLhs4yF+IBciNmYcr7fgz
         7WcfzFqEGNhvw==
Date: Wed, 12 Jan 2022 10:02:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH-perfbook] Fix a typo in Bibliography
Message-ID: <20220112180252.GN947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220112052352.29385-1-zhouzhouyi@gmail.com>
 <CAABZP2wg+PpJS7UZPJ8dXGyY4u=F+-_gZygh6En6UdfmzwoUpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2wg+PpJS7UZPJ8dXGyY4u=F+-_gZygh6En6UdfmzwoUpQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, Yang Lu <luyang.co@gmail.com>, perfbook@vger.kernel.org

On Wed, Jan 12, 2022 at 01:26:10PM +0800, Zhouyi Zhou wrote:
> Sorry to cc perfbook in the previous email
> 
> Sorry for the trouble
> Thanks
> Zhouyi
> 
> On Wed, Jan 12, 2022 at 1:24 PM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> >
> > Intel Itanium Architecture Software Developer's Manual
> > System Architecture should be Volume 2, Fix the typo
> > in Bibliography.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good eyes!!!  We really did have a bibliography that cited two different
volumes with the same number.  ;-)

Queued and pushed, thank you!

							Thanx, Paul

> > ---
> > Hi Paul and Akira
> >
> > I think Intel Itanium Architecture Software Developer's Manual
> > System Architecture should be Volume 2, and I fix the typo
> > in Bibliography.
> >
> > Thanks
> > Zhouyi
> > --
> >  bib/hw.bib | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/bib/hw.bib b/bib/hw.bib
> > index 8bee3f4c..b83b9256 100644
> > --- a/bib/hw.bib
> > +++ b/bib/hw.bib
> > @@ -491,7 +491,7 @@ Volume 3: Instruction Set Reference",
> >
> >  @manual{IntelItanium02v2,
> >   title="Intel Itanium Architecture Software Developer's Manual
> > -Volume 3: System Architecture",
> > +Volume 2: System Architecture",
> >   organization="{Intel Corporation}",
> >   year="2002",
> >   number="245318",
> > --
> > 2.25.1
> >
