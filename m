Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lJufbpcPWYt7OMYWEzKIsN71wPORn2pdut9ShHMKzpM=;
        b=dTJ8O+hUsfvQE4FwyQzjOL7fa9XzbWblgWNWCYXttIGOy5y8PTe1fATZjBk6UwfkSh
         Vhbsb01p9+7LnNljhmcLaqSsgPsOxjsGa3LTvOgxz7uIWmJctkM2v0zuR6jU1B0vTRKO
         xPKPW76MBtimxJMYV5v5PIYAUcq8eP+2xs4HGJ7g2dxN0Yb3KhZlQcgKjgTMHttt73+o
         ZQVIYUPhn+stvKCgyv3XN5ROhncP6PXkTXrIy8UdqDpdcV25AQej0TKdFlg5sBD/30jW
         fE9BvdWU5wo6O0kpB9gar7ztFLx1FtpISjgydVqljQLyV4/AeiZUTxBa9fcq0JAUMnEl
         ZJrw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH v2 4/4] debugging/debugging: s/remainder of a section/following sections/
Date: Sun, 12 Feb 2023 08:49:17 -0800
Message-Id: <20230212164917.25327-1-sj@kernel.org>
In-Reply-To: <655024e6-72fd-12bd-33f3-dc9700c42f44@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj38.park@gmail.com>, paulmck@kernel.org, perfbook@vger.kernel.org, sj@kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, 12 Feb 2023 21:29:40 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> On Sat, 11 Feb 2023 09:10:08 -0800, SeongJae Park wrote:
> > A sectence in 'Microbenchmarking' section is mentioning the remainder of
> > the section will look at ways for dealing with conflicts in measurement
> > error advices.  Because we don't distinguish section and subsection on
> > text, this makes it a little confused, whether it means remainder of the
> > subsection, or the following subsections of the section.  Make it a bit
> > more clear.
> > 
> > Suggedsted-by: Paul E. McKenney <paulmck@kernel.org>
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  debugging/debugging.tex | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index b7538620..170bf273 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -641,8 +641,8 @@ sure to take full advantage of any existing test suites available to
> >  you.
> >  Important as test development is, we must leave further discussion of it
> >  to books dedicated to that topic.
> > -The following sections therefore discuss locating bugs in your code given that
> > -you already have a good test suite.
> > +The remainder of this section (\cref{sec:debugging:Performance Estimation})
> > +looks at ways of resolving this conflict.
> 
> I think this hunk is misplaced. Existing text around here doesn't
> have any ambiguity. In other words, "The following sections" means
> Sections 11.2 through 11.7 (11.8 is a summary). 

Oh, you're right.  I may need more coffee, sorry.

> 
> >  
> >  \section{Tracing}
> >  \label{sec:debugging:Tracing}
> > @@ -2302,7 +2302,7 @@ to creep in, including:
> >  
> >  The first and fourth sources of interference provide conflicting advice,
> >  which is one sign that we are living in the real world.
> > -The remainder of this section looks at ways of resolving this conflict.
> > +The following sections look at ways of resolving this conflict.
> 
> To my eyes, this sentence now looks redundant as there already is an
> introduction to the following subsections below QQz 11.23.

I agree.  I will simply remove this sentence in the next spin.


Thanks,
SJ

> 
> >  
> >  \QuickQuiz{
> >  	But what about other sources of error, for example, due to
