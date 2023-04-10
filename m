Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbjDJBVb (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 9 Apr 2023 21:21:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6471830FA
        for <perfbook@vger.kernel.org>; Sun,  9 Apr 2023 18:21:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E64ED60BF9
        for <perfbook@vger.kernel.org>; Mon, 10 Apr 2023 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681089689;
        bh=BWa37CnPKeNA3OaV2+kyYv/9j/bSHoV1F8oksa1PvSc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=WoxL/4cukM3pM1WRsOgsFwqUvitH/WZFuG49EM+rUQ6tzhrlqaTmbwN88jnGBogQz
         ykGCSD1evyb0Zr3GtMmhK6rWfkwXSI9WUfMmVcWsEIrg6AqrKh+3d74Kdx3EkDaXH3
         iwbUHy8I5VNKci7y+KksvxGgdEDbvRdBdERgTlrNERJb/4GPwKlgB1JKbDaOzNCquq
         f4BzrYjvLvMCos29jXQAb64kKAf+qbmeY+Pg/ctOx4uh2y1e3MY31YWrHkmLmQiLat
         NIpbeDXx+xllbc5uIDfM3IekjdSj0I97APTbAPRVQ8yla96QytV0xy5oqZPJ6lvk3f
         iNjWYvsoBcE4Q==
Date: Sun, 9 Apr 2023 18:21:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v4] CodeSamples/count: Remove unnecessary memory barriers
Message-ID: <c2cec773-0968-414b-b88f-c4e4f113fabc@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230408055753.1335821-1-mmpgouride@gmail.com>
 <d5b2fb69-9da7-68dc-ac2a-bc0d8fac368f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5b2fb69-9da7-68dc-ac2a-bc0d8fac368f@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, perfbook@vger.kernel.org

On Sat, Apr 08, 2023 at 06:54:14PM +0900, Akira Yokosawa wrote:
> On Sat,  8 Apr 2023 01:57:53 -0400, Alan Huang wrote:
> > In count_lim_sig.c, there is only one ordering required, that is
> > writing to counter happens before setting theft to THEFT_READY in
> > add_count/sub_count's fast path. Therefore, partial memory barrier
> > will suffice.
> > 
> > Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> 
> v3 of this patch already has this, but to be clear,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you both!

I was worried about the removal of smp_mb() from the end of
flush_local_count_sig(), but I cannot see any problem that can arise
from this, so full speed ahead!  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > ---
> >  CodeSamples/count/count_lim_sig.c | 10 +++-------
> >  count/count.tex                   | 12 ++++++------
> >  2 files changed, 9 insertions(+), 13 deletions(-)
> > 
> > diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
> > index 59da8077..c2f61197 100644
> > --- a/CodeSamples/count/count_lim_sig.c
> > +++ b/CodeSamples/count/count_lim_sig.c
> > @@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
> >  {
> >  	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
> >  		return;				//\lnlbl{flush_sig:return:n}
> > -	smp_mb();				//\lnlbl{flush_sig:mb:1}
> >  	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
> >  	if (!counting) {			//\lnlbl{flush_sig:check:fast}
> > -		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
> > +		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
> >  	}
> > -	smp_mb();
> >  }						//\lnlbl{flush_sig:e}
> >  
> >  static void flush_local_count(void)			//\lnlbl{flush:b}
> > @@ -125,8 +123,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
> >  	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
> >  	barrier();					//\lnlbl{barrier:3}
> >  	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
> > -		smp_mb();				//\lnlbl{mb}
> > -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
> > +		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
> >  	}
> >  	if (fastpath)
> >  		return 1;				//\lnlbl{return:fs}
> > @@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
> >  	WRITE_ONCE(counting, 0);
> >  	barrier();
> >  	if (READ_ONCE(theft) == THEFT_ACK) {
> > -		smp_mb();
> > -		WRITE_ONCE(theft, THEFT_READY);
> > +		smp_store_release(&theft, THEFT_READY);
> >  	}
> >  	if (fastpath)
> >  		return 1;
> > diff --git a/count/count.tex b/count/count.tex
> > index 8ab67e2e..bb24631c 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -2425,12 +2425,11 @@ handler used in the theft process.
> >  \Clnref{check:REQ,return:n} check to see if
> >  the \co{theft} state is REQ, and, if not
> >  returns without change.
> > -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the sampling
> > -of the theft variable happens before any change to that variable.
> >  \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
> >  \clnref{check:fast} sees that
> >  this thread's fastpaths are not running, \clnref{set:READY} sets the \co{theft}
> > -state to READY\@.
> > +state to READY, with the release store ensuring any change to \co{counter} in
> > +the fastpath happens before the change of \co{theft} to READY\@.
> >  \end{fcvref}
> >  
> >  \begin{listing}
> > @@ -2595,9 +2594,10 @@ handlers to undertake theft.
> >  \Clnref{barrier:3} again disables compiler reordering, and then
> >  \clnref{check:ACK}
> >  checks to see if the signal handler deferred the \co{theft}
> > -state-change to READY, and, if so, \clnref{mb} executes a memory
> > -barrier to ensure that any CPU that sees \clnref{READY} setting state to
> > -READY also sees the effects of \clnref{add:f}.
> > +state-change to READY, and, if so, \clnref{READY} changes \co{theft} to
> > +READY with the release store ensuring that
> > +any CPU that sees the READY state also sees the effects
> > +of \clnref{add:f}.
> >  If the fastpath addition at \clnref{add:f} was executed, then
> >  \clnref{return:fs} returns
> >  success.
