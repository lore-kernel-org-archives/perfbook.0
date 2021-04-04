Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229861AbhDDQkr (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 4 Apr 2021 12:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617554442;
        bh=9tXokcIMbrkImd3bueHa+0RINZmUi5A//Ss4qM5jp8A=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=bnW0MkJQA1sAilEXkg+cEDpeUkJd4L7Lo4jI1jB3TVHyHECykb2CGKPt1ZiT06Pqp
         5w8+vkm+nyoeehro8NCe2N5MijRy86vD872hiZpBolROX+vCqDGWJh1R0NHzwxnkxu
         GoS7u65URoKfZwS48nJHINz1PhtaJHeJqhO2R4uCfwWAbs2DgYwV10hD29UJ2I2ndM
         hBJiMKM2yKdyZfrfugSqO0wiD/cxkLQBhZOqSFKfYId5Ze3Vj+TSRe0ATniL8cOPr5
         uNadW+tKoqnjG9xi2obeCvoC+3luSGVMrzfsa8doYd/Vc+rWls3WghtyuSYufGHY4B
         GCA7STn6eoDhA==
Date: Sun, 4 Apr 2021 09:40:42 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3 1/4] howto: Use '\cref' and '\Cref' consistently
Message-ID: <20210404164042.GY2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20210404111044.27774-1-sj38.park@gmail.com>
 <20210404111044.27774-2-sj38.park@gmail.com>
 <6380a2ed-086a-eeb2-4851-15915ee1b8c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6380a2ed-086a-eeb2-4851-15915ee1b8c4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

On Sun, Apr 04, 2021 at 08:29:18PM +0900, Akira Yokosawa wrote:
> On Sun, 4 Apr 2021 13:10:41 +0200, SeongJae Park wrote:
> > This commit replaces 'Chapter~\ref', 'Listing~\ref', and 'Appendix~\ref'
> > with smart alternatives, '\cref' and '\Cref'.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  howto/howto.tex | 52 ++++++++++++++++++++++++-------------------------
> >  1 file changed, 26 insertions(+), 26 deletions(-)
> > 
> 
> Looks good to me!
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you both!

I also queued and pushed the other three patches, in one case with
minor wordsmithing.  Again, thank you!

							Thanx, Paul

>         Thanks, Akira
> 
> > diff --git a/howto/howto.tex b/howto/howto.tex
> > index 7de1dbd9..b60e3a9a 100644
> > --- a/howto/howto.tex
> > +++ b/howto/howto.tex
> > @@ -56,22 +56,22 @@ that it has brought to us!
> >  This book is a handbook of widely applicable and heavily
> >  used design techniques, rather than
> >  a collection of optimal algorithms with tiny areas of applicability.
> > -You are currently reading Chapter~\ref{chp:How To Use This Book}, but
> > +You are currently reading \cref{chp:How To Use This Book}, but
> >  you knew that already.
> > -Chapter~\ref{chp:Introduction} gives a high-level overview of parallel
> > +\Cref{chp:Introduction} gives a high-level overview of parallel
> >  programming.
> >  
> 
> [...]
