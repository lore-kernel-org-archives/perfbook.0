Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbjE0Kkk (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 May 2023 06:40:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3860ED8
        for <perfbook@vger.kernel.org>; Sat, 27 May 2023 03:40:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C897A60BC8
        for <perfbook@vger.kernel.org>; Sat, 27 May 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685184038;
        bh=xaB1UnpDaHIX9dMDT4Jo94c9syTUqI2EU/5CDufKqL8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GJhseZcGRsXGXvSjih2qKVArG0JRBenLVXdBKHqBHKd3RsSxVdWryaoa3LX3DSJBB
         mXS022Pl0OLOjeiBT/Z00lssxdo0BNN7B3/ffdsh36G6WwpZFd8CGGfcmRmi182Dvk
         F4XydsUueGtrYrOamavvXZ6PDJ7/NygVziH6T22eeSqYFcWdMxIQrxum59PuIvWjL+
         VjEJb2nozqJyxDGJNm16RsQOoCv40uz77YAObzx52fMn0/xydrXk6i/s0wMykAeRc+
         BVODu2vR9y3sdyYc+f1WGIxTFts89HGhZvnNVYA9nLAKHZdWkPFH83Yvg7bY/uNVOR
         SVs51Y5R8x/4g==
Date: Sat, 27 May 2023 03:40:35 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] formal: Fix references
Message-ID: <060cf4e3-ef35-4c71-bf99-b52240dc70da@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230521162417.3751-1-mmpgouride@gmail.com>
 <8712984b-8cf9-8cfe-c5f5-fa1ff9d726de@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8712984b-8cf9-8cfe-c5f5-fa1ff9d726de@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>

On Fri, May 26, 2023 at 10:48:49PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> On 2023/05/22 1:24, Alan Huang wrote:
> > The two references are misplaced, this patch fixes that.
> > 
> > Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> 
> Looks like you've lost this one.
> Please holler if you need a resend.

Ah, thank you for the reminder!  I have queued and pushed it with
your Fixes and Reviewed-by.  Thank you both!!!

And "Hello!" from the Brussels airport.  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > ---
> >  formal/dyntickrcu.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> > index 42c0c55c..2d118e69 100644
> > --- a/formal/dyntickrcu.tex
> > +++ b/formal/dyntickrcu.tex
> > @@ -1132,7 +1132,7 @@ This effort provided some lessons (re)learned:
> >  	In this case, the documentation effort located
> >  	a misplaced memory barrier in
> >  	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> > -	as shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
> > +	as shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
> >  
> >  \begin{VerbatimU}
> >   static inline void rcu_enter_nohz(void)
> > @@ -1155,7 +1155,7 @@ This effort provided some lessons (re)learned:
> >  	This effort located one subtle bug in
> >  	\co{rcu_try_flip_waitack_needed()}
> >  	that would have been quite difficult to test or debug, as
> > -	shown by the following patch~\cite{PaulEMcKenney2008commit:ae66be9b71b1}.
> > +	shown by the following patch~\cite{PaulEMcKenney2008commit:d7c0651390b6}.
> >  
> >  \begin{VerbatimU}
> >  -       if ((curr - snap) > 2 || (snap & 0x1) == 0)
