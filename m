Return-Path: <SRS0=s+9n=4Z=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xth0ziV1bdtAPI1bmUWJaVujy4pumqEDHX6LP1ZGfkU=;
        b=l311OWm+drKQf1XbOQJul1781R/ZOwD72oB3clpFBmsWCxCWs3GE+2SB2ynmfX+tL8
         aOdyczxNkrNad4QxXWnrfgvNYsAT/sdzAXkXAs+0BYMUUJ7eiW2IALJNodWlIlzcD2Sw
         FbAUo0FA5WivAx15ega02T+PKYluXrvGPGiLznebCIw/BieTKMpJGrYgVt9ZTWuHag3T
         TQT598R031lCedqkvxeiqA23WTB2xSPb4lpiZd9uk+RZdCt5iKjtioezx0LpchohVC3J
         Lbc8Nia/k7OrT5JwpxMkh/rb/Tv+ptU9u6Iygif5QxeC9yC5FtvHhmrHjlixodY6WL6u
         kjBA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 2/4] datastruct: Add missed unbreakable spaces
Date: Tue, 27 Dec 2022 08:04:31 -0800
Message-Id: <20221227160431.16434-1-sj@kernel.org>
In-Reply-To: <20221227002650.GF4001@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, SeongJae Park <sj@kernel.org>, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Mon, 26 Dec 2022 16:26:50 -0800 "Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Tue, Dec 27, 2022 at 08:41:10AM +0900, Akira Yokosawa wrote:
> > Hi,
> > 
> > On Mon, 26 Dec 2022 10:16:32 -0800, SeongJae Park wrote:
> > > From: SeongJae Park <sj38.park@gmail.com>
> > > 
> > > Add missing unbreakable spaces for 'CPUs' and 'elements'.
> > > 
> > > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> 
> I queued and pushed, 1/4, 3/4, and 4/4, thank you!
> 
> Please do send an updated version of 2/4.

Thank you, and sorry for my mistake.  I will send the updated version right
now.


Thanks,
SJ

> 
> 							Thanx, Paul
> 
> > > ---
> > >  datastruct/datastruct.tex | 25 ++++++++++++-------------
> > >  1 file changed, 12 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> > > index 99c92d9a..40ea6995 100644
> > > --- a/datastruct/datastruct.tex
> > > +++ b/datastruct/datastruct.tex
> > [...]
> > > @@ -775,8 +775,8 @@ to about half again faster than that of either QSBR or RCU\@.
> > >  
> > >  	Still unconvinced?
> > >  	Then look at the log-log plot in
> > > -	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
> > > -	which shows performance for 448 CPUs as a function of the
> > > +	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448~CPUs; Varying Table Size},
> > > +	which shows performance for 448~CPUs as a function of the
> > >  	hash-table size, that is, number of buckets and maximum number
> > >  	of elements.
> > >  	A hash-table of size 1,024 has 1,024~buckets and contains
> > 
> > This hunk caused an error for me.
> > 
> > -----
> > l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
> >                                                   ,
> > ? 
> > ! Emergency stop.
> > <to be read again> 
> >                    \protect 
> > l.6047 ...r's Zoo at 448~CPUs; Varying Table Size}
> >                                                   ,
> > End of file on the terminal!
> > -----
> > 
> > Please remove the unbreakable space in \cref{}.
> > 
> >         Thanks, Akira
> > 
> > [...]
