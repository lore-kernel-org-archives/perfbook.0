Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240183AbjDFS1J (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 6 Apr 2023 14:27:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8524AD3A
        for <perfbook@vger.kernel.org>; Thu,  6 Apr 2023 11:26:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 414AD649AF
        for <perfbook@vger.kernel.org>; Thu,  6 Apr 2023 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680805615;
        bh=2FRPbLw9utzyAQ/SgwNEshzac7EHAyW8lhDg7RPbJWg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=LOeRKdTCbfRmwZR49gmNk1XLzMbNTLFMinc4MpeYe9E7Feoh1QdWPzwnb1LRDm0wg
         BszuIiBI5UH9Mb5HKimfWsi8ooVxU1UtB7pf+n/COIjrnro/PUhW5rW0+UPZPYyowD
         GpWixHhtogj0Zfedjzhl9thmUCY9Lz7bGMWk8nZ5kIVhWGWv3fm1sKTwEFyG32qSLU
         Rgk60n+7G1ihb+bKRzzI39+ez+PMuwifAtRK1XCbQH1Fdfl5VmiU9ohqvpv0/P+5dj
         ZoT9kcjolttV1v7FrHQ59+rJbmto5HKAsiaTwE8juHkyDq5LLGOx/xfaEy8FxKIMem
         H6YO/lNxD6H0g==
Date: Thu, 6 Apr 2023 11:26:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] CodeSamples/count: change full memory barrier to partial
 one
Message-ID: <1de8178e-a01e-4222-ba71-f876c2017e6f@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20230405165641.1326208-1-mmpgouride@gmail.com>
 <9a64ab8c-6894-ee88-91ae-1fa9b71bbf8a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a64ab8c-6894-ee88-91ae-1fa9b71bbf8a@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, perfbook@vger.kernel.org

On Thu, Apr 06, 2023 at 09:09:22AM +0900, Akira Yokosawa wrote:
> On Wed,  5 Apr 2023 12:56:41 -0400, Alan Huang wrote:
> > The original memory barriers in count_stat_eventual.c ensure
> > writing to global_count happens before writing to stopflag and
> > reading from stopflag happens before later reading from global_count.
> > 
> > Thus, smp_load_acquire and smp_store_release will suffice.
> > 
> > Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> > ---
> >  CodeSamples/count/count_stat_eventual.c | 6 ++----
> >  count/count.tex                         | 6 +++---
> >  2 files changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> > index 967644de..7157ee0e 100644
> > --- a/CodeSamples/count/count_stat_eventual.c
> > +++ b/CodeSamples/count/count_stat_eventual.c
> > @@ -51,8 +51,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
> >  		WRITE_ONCE(global_count, sum);
> >  		poll(NULL, 0, 1);
> >  		if (READ_ONCE(stopflag)) {
> > -			smp_mb();
> > -			WRITE_ONCE(stopflag, stopflag + 1);
> > +			smp_store_release(&stopflag, stopflag + 1);
> >  		}
> >  	}
> >  	return NULL;
> > @@ -73,9 +72,8 @@ void count_init(void)					//\lnlbl{init:b}
> >  void count_cleanup(void)				//\lnlbl{cleanup:b}
> >  {
> >  	WRITE_ONCE(stopflag, 1);
> > -	while (READ_ONCE(stopflag) < 3)
> > +	while (smp_load_acquire(&stopflag) < 3)
> >  		poll(NULL, 0, 1);
> > -	smp_mb();
> >  }							//\lnlbl{cleanup:e}
> >  //\end{snippet}
> >  
> > diff --git a/count/count.tex b/count/count.tex
> > index 80ada104..8ab67e2e 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -1013,9 +1013,9 @@ between passes.
> >  
> >  The \co{count_cleanup()} function on
> >  \clnrefrange{cleanup:b}{cleanup:e} coordinates termination.
> > -The calls to \co{smp_mb()} here and in \co{eventual()} ensure
> > -that all updates to \co{global_count} are visible to code following
> > -the call to \co{count_cleanup()}.
> > +The call to \co{smp_load_acquire()} here and the call to \co{smp_store_release()}
> > +in \co{eventual()} ensure that all updates to \co{global_count} are visible
> > +to code following the call to \co{count_cleanup()}.
> >  
> >  This approach gives extremely fast counter read-out while still
> >  supporting linear counter-update scalability.
> 
> Looks good to me!  Thanks.
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed with the inevitable wordsmithing, thank you both!

							Thanx, Paul
