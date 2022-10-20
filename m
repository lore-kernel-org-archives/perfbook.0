Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiJTXoe (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 20 Oct 2022 19:44:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275961F2CD
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 16:44:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 55BEA61D5E
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 23:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666309468;
        bh=7iR8dsEE7sap2pi1Lzgd7KwrPsn9wIUTJmKVbO1JGa8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=hQbtLpuswskOGiFsPxBUEwkYAsDTIjlpukNhzQsvuOco7lY1iQDuFdI6WwudcP9FB
         k3/x46Orhb37gtW5vyuqQyWN3g0Q9GBsDq1B7fZXHQMCMx3aCWdL/cAWZTAAXDgdH9
         nxywP71F7rLEJdHVSKoZHK7IsHc1JU+vFA5pAbPa0a3p7NBz6v9HPDOo7sblKrFImI
         UygRb4RzXImHTVPNcGc3gC9F6W1ZLuv7ERMWzxeIa6s+FPrzOeiX7b3u53L72xyuC8
         vx5VMCIsxYVtQus/nEocT+0hqx2WQnU3PJjm6BoGTC1MEkpc+D1D1HQ0sJ6apRWCjN
         UixocyimudJRw==
Date: Thu, 20 Oct 2022 16:44:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] memorder: fix a typo in Listing 15.25's caption
Message-ID: <20221020234428.GE5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20221019084442.8025-1-zhouzhouyi@gmail.com>
 <fdb0fd83-5cbc-eda2-c127-3d4a26ded8ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fdb0fd83-5cbc-eda2-c127-3d4a26ded8ad@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>, perfbook@vger.kernel.org, luyang.co@gmail.com

On Wed, Oct 19, 2022 at 09:47:11PM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Wed, 19 Oct 2022 16:44:42 +0800, Zhouyi Zhou wrote:
> > Caption of Listing 15.25 should be "Z6.2 Release-Acquire Chain (Ordering?)"
> > instead of "Z6.0 Release-Acquire Chain (Ordering?)"
> > 
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Hi Paul and Akira:
> > 
> > I guess there is a typo in caption of listing 15.25
> 
> Nice catch!
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you both!

							Thanx, Paul

> > Many thanks
> > Zhouyi
> > --
> >  memorder/memorder.tex | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 28319bfb..0c96d43b 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -2325,14 +2325,14 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
> >  
> >  \begin{listing}
> >  \input{CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o@whole.fcv}
> > -\caption{Z6.0 Release-Acquire Chain (Ordering?)}
> > -\label{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}
> > +\caption{Z6.2 Release-Acquire Chain (Ordering?)}
> > +\label{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}
> >  \end{listing}
> >  
> >  \QuickQuiz{
> >  	Suppose we have a short release-acquire chain along with one
> >  	load-to-store link and one store-to-store link, like that shown in
> > -	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)}.
> > +	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)}.
> >  	Given that there is only one of each type of non-store-to-load
> >  	link, the \co{exists} cannot trigger, right?
> >  }\QuickQuizAnswer{
> > @@ -2345,7 +2345,7 @@ prevents the \co{exists} clause on \clnref{exists} from triggering.
> >  	thereof, it is necessary to have at least one full barrier
> >  	(\co{smp_mb()} or better) between each non-store-to-load link.
> >  	In
> > -	\cref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)},
> > +	\cref{lst:memorder:Z6.2 Release-Acquire Chain (Ordering?)},
> >  	preventing the \co{exists} clause from triggering therefore requires
> >  	an additional full barrier between either \co{P0()}'s or
> >  	\co{P1()}'s accesses.
