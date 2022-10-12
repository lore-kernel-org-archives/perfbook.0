Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiJLPP4 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Oct 2022 11:15:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E80C38
        for <perfbook@vger.kernel.org>; Wed, 12 Oct 2022 08:15:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A5B19B818F7
        for <perfbook@vger.kernel.org>; Wed, 12 Oct 2022 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665587752;
        bh=jAUks8rfCkXZTqm0a06rU6iH+PnELhM4PTmBcAewQvk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=L1a5rlQHdfrUXMSG5k87xZUUBFpH2tyJcxDane7LRAxzd+vK+5zDRCbai0IdgcAqG
         KzN+TJO3JPpi9Y6QSK61HbKApTc1XItaR7Lk0I+wur8Rdg8EZSE+rlqxx5HGjDU1Il
         NOxC5lzIX8LbzI3lcAU4/FL69dyTIGlqU1lspisUTatOGCEYrYFp3rEFAMNsB9psx9
         JwVbOy8IZH7SSTZwUhskrTukY/6urtfc1yRZ6PbDF56KXCgepKYz5alkJVla7hSRfi
         eoDmTBElU1BEds47yXl+TsgiKlv1B6UhHooBkKQ5WMdjKrO2Y1cMtGpcQsfwkVfqAr
         0hSuaZV14uoBw==
Date: Wed, 12 Oct 2022 08:15:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] memorder.tex: correct the transformed code by compiler.
Message-ID: <20221012151547.GS4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
 <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1>
 <599125ce-4fd9-b8dc-8628-197f90513c77@gmail.com>
 <20221012073015.GR4221@paulmck-ThinkPad-P17-Gen-1>
 <CANJ3EgE2Kb1qwQk6qK1tT5K6Oka7se_JyFkMzE_FSWeurJfBRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANJ3EgE2Kb1qwQk6qK1tT5K6Oka7se_JyFkMzE_FSWeurJfBRg@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Oct 12, 2022 at 04:02:43PM +0800, Patrick Yingxi Pan wrote:
> Thank you Paul and Akira!
> 
> Hmm, it seems that I successfully witnessed a force push onto an open
> repository. ;-p

That you did.  Like this:

	git rebase -i --onto cc128b0969f7 cc128b0969f7 master
	# for commit 520ad603b0f3 s/pick/reword/
	# in the editor add your Signed-off by
	git push perfbook +master
	git push github +master
	# The "perfbook" and "github" have no significance outside of
	# my local repository.

It is good practice to leave a branch behind, though I skipped that
this time because this was a simple transformation.  So you might do
"git branch old-master" before the "git rebase".  That allows you to
start over in case something breaks during the rebase.

							Thanx, Paul

> On Wed, Oct 12, 2022 at 3:30 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Wed, Oct 12, 2022 at 12:19:04PM +0900, Akira Yokosawa wrote:
> > > On Tue, 11 Oct 2022 02:02:08 -0700, Paul E. McKenney wrote:
> > > > On Tue, Oct 11, 2022 at 11:20:49AM +0800, Patrick Yingxi Pan wrote:
> > > >> Hello!
> > > >>
> > > >> I have added the missing READ_ONCE(). Please take a look. Thanks.
> > > >>
> > > >> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> > > >
> > > > Queued and pushed, thank you!
> > >
> > > Paul, somehow Patrick's S-o-b tag is lost in the amended changelog of
> > > commit 520ad603b0f3 ("memorder: Correct the transformed Listing 15.30
> > > code").
> > >
> > > I don't think it is mandatory in perfbook, but if you can, please fix
> > > up.
> >
> > Gah!  Thank you for catching this, fixed.
> >
> >                                                         Thanx, Paul
> >
> > > >> ---
> > > >>  memorder/memorder.tex | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > > >> index a0a87d0a..50ff2882 100644
> > > >> --- a/memorder/memorder.tex
> > > >> +++ b/memorder/memorder.tex
> > > >> @@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
> > > >> the compiler to (incorrectly)
> > > >>  conclude that both pointers are equivalent, when in fact they carry
> > > >>  different dependencies.
> > > >>  This means that the compiler might well transform \clnref{pc} to instead
> > > >> -be \co{r2 = q->c}, which might well cause the value 44 to be loaded
> > > >> +be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
> > > >>  instead of the expected value 144.
> > > >>  \end{fcvref}
> > > >>
> > > >>
> > > >> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> > > >> --
