Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJKI63 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 11 Oct 2022 04:58:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3D96D9DB
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 01:58:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 400936113B
        for <perfbook@vger.kernel.org>; Tue, 11 Oct 2022 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665478707;
        bh=YumRUN9mC+PHm9kDq6ibEZVznckZ09Swmzjn2IYxmgw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LtewjbAJmGz9qlHNgryZIlU5YQ4uceLQ2L27E8fgcaam3g+UJuN+sJ3U4WK50tGou
         0ebSyn4flx9blmeBHhrzNyQLXis7L3bCJhe9oxktbuqXSzlec3dGntWdqxnN3dxaIP
         Z/yHRVDaNLGj7i77gyt7Z9RVGUzTHWDr1teWLfoumwv2KT9MEjtEsM2YhiugjIkR9K
         B/JWWPmYJ5DUWW9C/+ck6l9GeZAMnDchr4mokIbGT4zFUpHfLsl6nPQYhELsBaBxea
         MIpuC5NQ0TCeKbcwcdLkA9OAIxv2/9ub1vXTFO30wFSa1nHS3BENQAa7uoSVMHIq8p
         +EVMijgzFcpMQ==
Date: Tue, 11 Oct 2022 01:58:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] memorder.tex: the exists clause in Listing 15.35 should
 never be satisfied.
Message-ID: <20221011085825.GE4221@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
 <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Patrick Yingxi Pan <pyxchina92929@gmail.com>, perfbook@vger.kernel.org

On Tue, Oct 11, 2022 at 05:37:55PM +0900, Akira Yokosawa wrote:
> [+CC: Paul]
> 
> Hi,
> 
> On Tue, 11 Oct 2022 11:17:25 +0800, Patrick Yingxi Pan wrote:
> > Hello!
> > 
> > According to the context and my understanding of locking primitives, I
> > suppose the 'exists' clause in the litmus test shouldn't be satisfied.
> 
> I agree with you in that section 15.4.2.2 is described as if the
> result were "Never".
> 
> However, if you run herd7 on the litmus test, you'll get:
> 
> ------------------------------------------------
> Test Lock-outside-across Allowed
> States 4
> 0:r1=0; 1:r1=0;
> 0:r1=0; 1:r1=1;
> 0:r1=1; 1:r1=0;
> 0:r1=1; 1:r1=1;
> Ok
> Witnesses
> Positive: 2 Negative: 12
> Condition exists (0:r1=0 /\ 1:r1=0)
> Observation Lock-outside-across Sometimes 2 12   <--
> Time Lock-outside-across 0.02
> Hash=06337358bba3d1ed44db8ea81cf1d236
> ------------------------------------------------
> 
> That said, I'm not in the position of deciding LKMM is right or not.

Thank you for checking, Akira!

This is the following litmus test?

CodeSamples/formal/herd/C-Lock-outside-across.litmus

							Thanx, Paul

> > Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> > ---
> >  memorder/memorder.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index a0a87d0a..9c1846d0 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -3452,7 +3452,7 @@ following subsequent critical sections?
> >  This question can be answered for the Linux kernel by referring to
> >  \cref{lst:memorder:Accesses Outside of Critical Sections}
> >  (\path{C-Lock-outside-across.litmus}).
> > -Running this litmus test yields the \co{Sometimes} result,
> > +Running this litmus test yields the \co{Never} result,
> >  which means that accesses in code leading up to a prior critical section
> >  is also visible to the current CPU or thread holding that same lock.
> >  Similarly, code that is placed after a subsequent critical section
> > 
> > base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> > --
