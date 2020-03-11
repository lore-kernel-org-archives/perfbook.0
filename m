Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729511AbgCKQaN (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 11 Mar 2020 12:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583944213;
        bh=Mnqao/QbykPnwMd4X3ayD9EI06+FgfMhBXcXEFT2eZc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=RzINTAwkMIDQl13q9uSslYmFgNqSsxxqTMjcO6h0To6hsGMVDrEOqZ+StLdEFxbUW
         JsS5Tikl09Y9IKW3C305TiTmy6zVP2XZjvVB3vY0A474rqCtsDH91rWzRSfk29JtMd
         GIfFne2UNArUl+dMDCzeGnUvnHsyw1NOCK/KEBD4=
Date: Wed, 11 Mar 2020 09:30:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/2] cpu/overheads: Typo fixes and wording improvement
Message-ID: <20200311163012.GS2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <db66a177-0ae2-14a2-0ec7-854531a2a62a@gmail.com>
 <77c7810f-4a8d-811d-eddb-8fff92dafe65@gmail.com>
 <6a95f31e-facf-b856-3bea-0aaa44fc381b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a95f31e-facf-b856-3bea-0aaa44fc381b@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Mar 12, 2020 at 12:31:45AM +0900, Akira Yokosawa wrote:
> On Wed, 11 Mar 2020 20:49:10 +0900, Akira Yokosawa wrote:
> > From 9256445a646099df48b3f6af7ad232dd228f3039 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Tue, 10 Mar 2020 22:12:45 +0900
> > Subject: [PATCH 2/2] cpu/overheads: Typo fixes and wording improvement
> > 
> > Also flag suspicious raws in Table E.1 as comments.
> 
> Obvious typo:
>                    ... rows ...
> > 
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi Paul,
> > 
> > Think of this as a reminder rather than a patch to be applied as is.
> 
> So I'm not submitting v2 of this one.
> 
>         Thanks, Akira
> 
> > Updated Table E.1 looks inconsistent to me.

Same numbers as before, and yes, the in-core numbers look strange.
The story I heard was that it was an artifact of instruction scheduling.
My understanding is that the between-cores numbers benefit from
instruction look-ahead, so that the load is aware that the cmpxchg is
on its way.

I applied the other two hunks and removed the "raws" sentence, thank
you very much!

							Thanx, Paul

> >         Thanks, Akira
> > --
> >  cpu/overheads.tex | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > index d1b4f596..e5ea0803 100644
> > --- a/cpu/overheads.tex
> > +++ b/cpu/overheads.tex
> > @@ -189,7 +189,7 @@ atomic operations on the lock data structure, one for acquisition and
> >  the other for release.
> >  
> >  In-core operations involving interactions between the hardware threads
> > -sharing a single core are about the same cost and same-CPU operations.
> > +sharing a single core are about the same cost as same-CPU operations.
> >  This should not be too surprising, given that these two hardware threads
> >  also share the full cache hierarchy.
> >  CAS stands for an atomic compare-and-swap operation, where the hardware
> > @@ -198,9 +198,9 @@ compares the contents of the specified memory location to a specified
> >  in which case the CAS operation is said to have succeeded.
> >  If they compare unequal, the memory location keeps its (unexpected) value,
> >  and the CAS operation is said to have failed.
> > -The operation is atomic is that the hardware guarantees that the memory
> > +The operation is atomic in that the hardware guarantees that the memory
> >  location will not be changed between the compare and the store.
> > -CAS functionality is provided by the x86 \co{lock;cmpxchg} instruction.
> > +CAS functionality is provided by the \co{lock;cmpxchg} instruction on x86.
> >  
> >  In the case of the blind CAS, the software specifies the old value
> >  without looking at the memory location.
> > @@ -317,15 +317,15 @@ thousand clock cycles.
> >  	Clock period		&           0.4	&           1.0 \\
> >  	Same-CPU CAS		&          12.2	&          33.8 \\
> >  	Same-CPU lock		&          25.6	&          71.2 \\
> > -	Blind CAS		&          12.9	&          35.8 \\
> > -	CAS			&           7.0	&          19.4 \\
> > +	Blind CAS		&          12.9	&          35.8 \\ % CAS?
> > +	CAS			&           7.0	&          19.4 \\ % Blind CAS?
> >  	\midrule
> >  	Off-Core		&		&		\\
> > -	Blind CAS		&          31.2	&          86.6 \\
> > +	Blind CAS		&          31.2	&          86.6 \\ % Realy Blind?
> >  	CAS			&          31.2	&          86.5 \\
> >  	\midrule
> >  	Off-Socket		&		&		\\
> > -	Blind CAS		&          92.4	&         256.7 \\
> > +	Blind CAS		&          92.4	&         256.7 \\ % Realy Blind?
> >  	CAS			&          95.9	&         266.4 \\
> >  	\midrule
> >  	Off-System		&		&		\\
> > 
