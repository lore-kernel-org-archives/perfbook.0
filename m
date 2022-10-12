Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiJLHaU (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 12 Oct 2022 03:30:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77C35C363
        for <perfbook@vger.kernel.org>; Wed, 12 Oct 2022 00:30:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 824C961329
        for <perfbook@vger.kernel.org>; Wed, 12 Oct 2022 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665559818;
        bh=Ikjfk6NQZouv2lpMIc8fMZP748kz3Mfgmms/dT/vUAQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=r+/DpocpBOD4lshcMoNmEaD/AQqDLtMzweQYhXlESa5h7u4VaGdGtmQS9UpRPAEZh
         eOAGa/RlIqDAIWpkYSp351BQ8I9Qw3JK2WUwnG3cap17MPyG4ls11r1VSTEoEdn68O
         RHvFh/Hv9bGK7qsK5r/SB4+PTeBQ/KVyYICei2NTKD/t39g4+9RpJBZwHAplpFClOA
         gd6yZLxA51grknr5TiLNDmYFM1kKkhrzsL/ejguhHYn9TQg05e//gcA4Y9k2FL/k5r
         zLOIl4Zk5XWfeJNdXMKLFcRaKkyrd9N0n/2xp22BG7C3IrGRBJaT0Hp0fo9T4wbCAr
         bCckBv5ALHeEQ==
Date: Wed, 12 Oct 2022 00:30:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] memorder.tex: correct the transformed code by compiler.
Message-ID: <20221012073015.GR4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANJ3EgF8SzbAy8Wd7JANT20DCMtC7U3Z6Pzix3z9zJ-A3hYn+Q@mail.gmail.com>
 <20221011090208.GF4221@paulmck-ThinkPad-P17-Gen-1>
 <599125ce-4fd9-b8dc-8628-197f90513c77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <599125ce-4fd9-b8dc-8628-197f90513c77@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Patrick Yingxi Pan <pyxchina92929@gmail.com>

On Wed, Oct 12, 2022 at 12:19:04PM +0900, Akira Yokosawa wrote:
> On Tue, 11 Oct 2022 02:02:08 -0700, Paul E. McKenney wrote:
> > On Tue, Oct 11, 2022 at 11:20:49AM +0800, Patrick Yingxi Pan wrote:
> >> Hello!
> >>
> >> I have added the missing READ_ONCE(). Please take a look. Thanks.
> >>
> >> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> > 
> > Queued and pushed, thank you!
> 
> Paul, somehow Patrick's S-o-b tag is lost in the amended changelog of
> commit 520ad603b0f3 ("memorder: Correct the transformed Listing 15.30
> code").
> 
> I don't think it is mandatory in perfbook, but if you can, please fix
> up.

Gah!  Thank you for catching this, fixed.

							Thanx, Paul

> >> ---
> >>  memorder/memorder.tex | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> >> index a0a87d0a..50ff2882 100644
> >> --- a/memorder/memorder.tex
> >> +++ b/memorder/memorder.tex
> >> @@ -2869,7 +2869,7 @@ An equals comparison on \clnref{equ} might lead
> >> the compiler to (incorrectly)
> >>  conclude that both pointers are equivalent, when in fact they carry
> >>  different dependencies.
> >>  This means that the compiler might well transform \clnref{pc} to instead
> >> -be \co{r2 = q->c}, which might well cause the value 44 to be loaded
> >> +be \co{r2 = READ_ONCE(q->c)}, which might well cause the value 44 to be loaded
> >>  instead of the expected value 144.
> >>  \end{fcvref}
> >>
> >>
> >> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> >> --
