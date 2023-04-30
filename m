Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjD3A0D (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 29 Apr 2023 20:26:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E84A1711
        for <perfbook@vger.kernel.org>; Sat, 29 Apr 2023 17:26:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2923260A4E
        for <perfbook@vger.kernel.org>; Sun, 30 Apr 2023 00:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682814360;
        bh=2z3Li0b7/JmYnEjJpwSUlZSIxOns50VhF9p/tkKg+PA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=oBRIGz+jjro0Dp3YlfoBlKloUjUcBe9vjLAvslgX9Rx4YjrfD/c0smaPNNQcosfWk
         gLSaA5RhuoGY3e5vHt80ZKKWohoa71SVLPFva43Z3RlEhrRDrkN0LO0bUV+vwaAnCz
         jshUNcSy3eiAFa9n22lSbkoCvZsGTv1i6lhizKQZsOwRwYb263G9eD7mfjSU3DRHhC
         hmkdY7DXfX07SuvFThzydhq3vPzKGJ3zYVrQmmPh0Hfg+xlDAClFBZR7UTQ2Y8ZWxN
         uGVzvkCLEjov4zQLpmrC6zLHQlmNa+wlbrw8bnlV7zV4AtJA6efFBtwPNApjoqStkV
         bRY3KFbaDWrhQ==
Date: Sat, 29 Apr 2023 17:26:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook 2/7] formal/ppcmem: Use \qco{} as intended
Message-ID: <74e277ae-3c63-41bf-a3f1-f81510a47e04@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <46c02030-ceca-2547-7b68-1e8642ae18fa@gmail.com>
 <20230429234137.18677-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429234137.18677-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: SeongJae Park <sj38.park@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Sat, Apr 29, 2023 at 04:41:37PM -0700, SeongJae Park wrote:
> On Sun, 30 Apr 2023 08:07:18 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
> 
> > Commit f87fadc4c8ea ("formal/ppcmem: Use \qco{} instead of ``\co{}''")
> > did not use \qco{} in one of the hunks.
> > 
> > Use \qco{} as intended.
> 
> Nice catch!  Thank you for this fix!
> 
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > Cc: SeongJae Park <sj38.park@gmail.com>
> 
> Reviewed-by: SeongJae Park <sj38.park@gmail.com>

I pulled in these along with SeongJae's patches, thank you both!

							Thanx, Paul

> Thanks,
> SJ
> 
> > ---
> >  formal/ppcmem.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
> > index 10526bca88ae..9d7704fa43d0 100644
> > --- a/formal/ppcmem.tex
> > +++ b/formal/ppcmem.tex
> > @@ -99,7 +99,7 @@ exists						@lnlbl[assert:b]
> >  
> >  \begin{fcvref}[ln:formal:PPCMEM Litmus Test]
> >  In the example, \clnref{type} identifies the type of system (\qco{ARM} or
> > -\co{PPC}) and contains the title for the model.
> > +\qco{PPC}) and contains the title for the model.
> >  \Clnref{altname} provides a place for an
> >  alternative name for the test, which you will usually want to leave
> >  blank as shown in the above example.
> > -- 
> > 2.25.1
> > 
> > 
