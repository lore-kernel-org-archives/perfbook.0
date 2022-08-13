Return-Path: <SRS0=E7NT=YR=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=DhGChAZY0vDrDPRI9MRKJRE/I0YBlZYKiMMRNwnsBAg=;
        b=bziR7kDXTTSIpi84js1QwpXIzdpJzGuAG1MXDoq42kfvfR86Bn5m9pHYLKARHya3dl
         TxHc+BGmXg91AeHUoQzx5vaw4TT3w4ee8W5XLzaxDwBJmvyS/t57MxZdYt3JkXs/HTyM
         GqPFuzAwMj3cvQawBXxLziSbhT88FMAmk3MgP97fyMYwEhvTy4E6dUAXEjT3JF7fW92z
         RthMhQHC1cvT/DhqvtDASUmx3RouJyrnUl1VAsB/R6tH6jDgEgvsh1fOW7TDs9b9NvnQ
         iAeQK7Rd3WYcHnEG+3DMZ3j/CA2A9zToRfGuo7Q1SWMPe+0ynscC/jVtOonC6wrMLxnO
         gGUg==
MIME-Version: 1.0
References: <20220813114559.2082323-1-e2lahav@gmail.com> <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20220813230800.GL2125313@paulmck-ThinkPad-P17-Gen-1>
From: Elad Lahav <e2lahav@gmail.com>
Date: Sat, 13 Aug 2022 19:12:48 -0400
Message-ID: <CAJbg=FX+X_oC36Zt_FYoC1VTjn_Yy3qbkkoij4+0ZtxbR0u48A@mail.gmail.com>
Subject: Re: [PATCH] count: Switch from GCC to C11 thread-local storage
Content-Type: text/plain; charset="UTF-8"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Yes, I thought about a footnote along the lines of "previous versions
of this book used GCC extensions..." but wasn't sure if you'd approve.
I can certainly add that.

--Elad

On Sat, 13 Aug 2022 at 19:08, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sat, Aug 13, 2022 at 07:45:59AM -0400, Elad Lahav wrote:
> > Signed-off-by: Elad Lahav <e2lahav@gmail.com>
>
> Nice, thank you!
>
> But did you verify that none of the text describing count_end.c needed
> changing?  (It seems unlikely that any would, but could you please check?)
>
> > ---
> >  CodeSamples/count/count_end.c | 12 ++++++------
> >  count/count.tex               |  4 ++--
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
> > index 722ad2f7..5e7b9ee1 100644
> > --- a/CodeSamples/count/count_end.c
> > +++ b/CodeSamples/count/count_end.c
> > @@ -1,6 +1,6 @@
> >  /*
> >   * count_end.c: Per-thread statistical counters that provide sum at end.
> > - *   Uses __thread for each thread's counter.
> > + *   Uses _Thread_local for each thread's counter.
> >   *
> >   * This program is free software; you can redistribute it and/or modify
> >   * it under the terms of the GNU General Public License as published by
> > @@ -23,17 +23,17 @@
> >  #include "../api.h"
> >
> >  //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
> > -unsigned long __thread counter = 0;          //\lnlbl{var:b}
> > +unsigned long _Thread_local counter = 0;             //\lnlbl{var:b}
> >  unsigned long *counterp[NR_THREADS] = { NULL };
> >  unsigned long finalcount = 0;
> >  DEFINE_SPINLOCK(final_mutex);                        //\lnlbl{var:e}
> >
> > -static __inline__ void inc_count(void)               //\lnlbl{inc:b}
> > +static inline void inc_count(void)           //\lnlbl{inc:b}
> >  {
> >       WRITE_ONCE(counter, counter + 1);
> >  }                                            //\lnlbl{inc:e}
> >
> > -static __inline__ unsigned long read_count(void)
> > +static inline unsigned long read_count(void)
> >  {
> >       int t;
> >       unsigned long sum;
> > @@ -48,7 +48,7 @@ static __inline__ unsigned long read_count(void)
> >  }
> >
> >  #ifndef FCV_SNIPPET
> > -__inline__ void count_init(void)
> > +inline void count_init(void)
> >  {
> >  }
> >  #endif /* FCV_SNIPPET */
> > @@ -73,7 +73,7 @@ void count_unregister_thread(int nthreadsexpected)  //\lnlbl{unreg:b}
> >  }                                                    //\lnlbl{unreg:e}
> >  //\end{snippet}
> >
> > -__inline__ void count_cleanup(void)
> > +inline void count_cleanup(void)
> >  {
> >  }
> >
> > diff --git a/count/count.tex b/count/count.tex
> > index 523789e2..173b964c 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -721,8 +721,8 @@ This is the topic of the next section.
> >  \subsection{Per-Thread-Variable-Based Implementation}
> >  \label{sec:count:Per-Thread-Variable-Based Implementation}
> >
> > -\GCC\ provides an \apig{__thread} storage class that provides
> > -per-thread storage.
> > +The C language, since C11, features a \apig{_Thread_local} storage class that
> > +provides per-thread storage.
>
> Could you please mention __thread as the old way?  Either in the text
> directly, in parentheses, as a footnote, or as a quick quiz, your choice.
>
>                                                         Thanx, Paul
>
> >  This can be used as shown in
> >  \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
> >  to implement
> > --
> > 2.25.1
> >
