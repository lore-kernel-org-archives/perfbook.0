Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=8OV9bC+pJeyZZWOmxi7ACV7UcyVaBoYj3NcTDFyJchU=;
 b=fErM97tVSLJSOpXTkf5oG4ANBIbato2vEVyTEoxHpFKbmPLZCaBm+UXA9W4dUqDJJu
 pwWLFjTrRUjRzpCIGSjNtoMVPug9usWOYyZk2F246IsLQGqa0EQJNQphwSgpXWvjwjFG
 /sHgE56rlKAW56E2sKNgImIUmRpFDPfa94o09D/ULrwd1YMLc0NmRZDtbnoiccfOCBQ7
 3IR/haWEVPYSaQjzvTKCKZ1C9jFq/TvSPf1j+r2R6Me+JuuJbU8TSeWqAiA2PP4TwvLb
 EAo8eIVdVzgkBtheAulQMNOQE308hdxm4oDEN4oo5K5dXtLnqiNCauWiFV+Hpdptm1GL
 LUcA==
From: SeongJae Park <sj38.park@gmail.com>
Date: Sun, 22 Jul 2018 03:20:52 +0900 (KST)
Subject: Re: [PATCH] toolsoftrade: Fix a mistake about line number pointing
In-Reply-To: <20180721180941.GF12945@linux.vnet.ibm.com>
Message-ID: <alpine.DEB.2.20.1807220319400.1230@hxeon>
References: <20180721180410.20353-1-sj38.park@gmail.com>
 <20180721180941.GF12945@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On Sat, 21 Jul 2018, Paul E. McKenney wrote:

> On Sun, Jul 22, 2018 at 03:04:10AM +0900, SeongJae Park wrote:
> > Fixes: c88cc9eba7a5 ("toolsoftrade: Give a forward reference for READ_ONCE() and WRITE_ONCE()")
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>
> Hmmm...  There is both a READ_ONCE() and a WRITE_ONCE() on line 41, so
> the original is accurate.  That said, this might be an indication that the
> question is confusing.  If so, would you like to take a shot at rewording?

Oops, obviously my fault.  sorry.  Ignore the patch, please.


Thnaks,
SeongJae Park
>
> 							Thanx, Paul
>
> > ---
> >  toolsoftrade/toolsoftrade.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > index 00db182..f02d339 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -629,7 +629,7 @@ primitives.
> >  } \QuickQuizEnd
> >
> >  \QuickQuiz{}
> > -	What is the \co{READ_ONCE()} on lines~17 and~41 and the
> > +	What is the \co{READ_ONCE()} on lines~17 and the
> >  	\co{WRITE_ONCE()} on line~41 of
> >  	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}?
> >  \QuickQuizAnswer{
> > --
> > 2.10.0
> >
>
>

