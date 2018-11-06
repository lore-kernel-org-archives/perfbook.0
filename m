Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4In1dXdCvMH54mFQlgiyGFfTo0STpDO2VCoMiVKcR+w=;
        b=WeIYp3WTdC5gCKFsOx8y4C9UPlncLLehKWXs6eI6EOuBaVHjGfMsweElJZv169dMxZ
         6dMsdJqi0jgeWN6rQOAneM9cBCkE7yijpUDA7VRjiloUusTVXq3Brgytj2Hjk9xcVdy7
         LEr1qtXCX6AVNuZXhKv9alsIpdomDHvVXrJzMiq44OkF6/q5vpfheagtHDEoJ99iefu3
         hCP9ChC/DCOKG2hGuxxiuJWZHrikdDT7l3Vh9kYWQMRgB8PPdM7DCEvl/TERGPNsfaRa
         BSVdaE3erW4F+nI0mCnLEIP72he0i0YFKK/8ugDy+D8BUGb5xWpeoXvC/dfqiA4t8UMH
         hy5w==
MIME-Version: 1.0
References: <1541413782-2876-1-git-send-email-junchangwang@gmail.com>
 <00bc1afe-fea1-cb02-cc6d-137b592528a6@gmail.com> <20181105213801.GD4170@linux.ibm.com>
In-Reply-To: <20181105213801.GD4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 6 Nov 2018 14:43:03 +0800
Message-ID: <CABoNC826XYJBTMnK-qUPk85cTCOChhwGD5=Q_qNNXAXUMgEQpw@mail.gmail.com>
Subject: Re: [PATCH] memorder.tex: Fix typos in description of litmus test C-ISA2+o-r+a-r+a-r+a-o
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Tue, Nov 6, 2018 at 5:38 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Mon, Nov 05, 2018 at 09:15:38PM +0900, Akira Yokosawa wrote:
> > >From 0e43c93660383b7560c55131754dbc4bfaf13052 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Mon, 5 Nov 2018 20:27:02 +0900
> > Subject: [PATCH] memorder: Fix line numbers by applying new scheme to C-ISA2+o-r+a-r+a-r+a-o
> >
> > Line numbers referring to Listing 15.23 don't match the line counts
> > in the snippet. Fix this by putting labels in the source of the litmus
> > test and referring them by \lnref{} macros.
> >
> > Reported-by: Junchang Wang <junchangwang@gmail.com>
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > On 2018/11/05 18:29:42 +0800, Junchang Wang wrote:
> > > This is the only patch for the second half of Chapter Memory Ordering. Please
> > > take a look. Thanks.
> > >
> >
> > Good catch!
> >
> > While we are here, why not apply the new scheme for snippets to this litmus
> > test?  Labeling lines in the source code can prevent such mismatches.
> >
> > For the new scheme to support litmus tests, please see commit log of
> > 69a75a84d7c3 ("future/formalregress: Example of extraction of snippet from
> > .litmus file")
>
> Indeed, good catch!!!  And here I -thought- that I proof-read this stuff...
>
> Junchang, does Akira's approach look good to you?
>

Hi Paul,

Sorry for the late response. The new scheme is the right approach in
comparison to hard-coding line numbers; Akira's approach looks good to
me.

@Akira Yokosawa  Thanks a lot for pointing me to the right scheme,
which looks nice. I believe we programmers tend to hard-coding line
numbers/variables at the very beginning of drafting/coding; that's a
nice tradeoff between efficiency and portability :-) . I can help
check and apply the new scheme in reading through other chapters.

Thanks,
--Junchang



>                                                         Thanx, Paul
>
> >         Thanks. Akira
> >
> > --
> >  .../formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus    | 22 ++++-----
> >  memorder/memorder.tex                              | 52 +++-------------------
> >  2 files changed, 19 insertions(+), 55 deletions(-)
> >
> > diff --git a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> > index 343fded..b899369 100644
> > --- a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> > +++ b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> > @@ -1,15 +1,16 @@
> >  C C-ISA2+o-r+a-r+a-r+a-o
> > +//\begin[snippet][labelbase=ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole,commandchars=\\\@\$]
> >  {
> >  }
> >
> > -{
> > -#include "api.h"
> > -}
> > -
> > +{                            //\fcvexclude
> > +#include "api.h"             //\fcvexclude
> > +}                            //\fcvexclude
> > +                             //\fcvexclude
> >  P0(int *x0, int *x1)
> >  {
> >       WRITE_ONCE(*x0, 2);
> > -     smp_store_release(x1, 2);
> > +     smp_store_release(x1, 2);       //\lnlbl[P0:rel]
> >  }
> >
> >
> > @@ -17,16 +18,16 @@ P1(int *x1, int *x2)
> >  {
> >       int r2;
> >
> > -     r2 = smp_load_acquire(x1);
> > -     smp_store_release(x2, 2);
> > +     r2 = smp_load_acquire(x1);      //\lnlbl[P1:acq]
> > +     smp_store_release(x2, 2);       //\lnlbl[P1:rel]
> >  }
> >
> >  P2(int *x2, int *x3)
> >  {
> >       int r2;
> >
> > -     r2 = smp_load_acquire(x2);
> > -     smp_store_release(x3, 2);
> > +     r2 = smp_load_acquire(x2);      //\lnlbl[P2:acq]
> > +     smp_store_release(x3, 2);       //\lnlbl[P2:rel]
> >  }
> >
> >  P3(int *x3, int *x0)
> > @@ -34,8 +35,9 @@ P3(int *x3, int *x0)
> >       int r1;
> >       int r2;
> >
> > -     r1 = smp_load_acquire(x3);
> > +     r1 = smp_load_acquire(x3);      //\lnlbl[P3:acq]
> >       r2 = READ_ONCE(*x0);
> >  }
> >
> > +//\end[snippet]
> >  exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 8e11e92..d92d1e5 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -2841,49 +2841,7 @@ from the passage of time, so that no matter how many threads are
> >  involved, the corresponding \co{exists} clause cannot trigger.
> >
> >  \begin{listing}[tbp]
> > -{ \scriptsize
> > -\begin{verbbox}[\LstLineNo]
> > -C C-ISA2+o-r+a-r+a-r+a-o
> > -{
> > -}
> > -
> > -P0(int *x0, int *x1)
> > -{
> > -  WRITE_ONCE(*x0, 2);
> > -  smp_store_release(x1, 2);
> > -}
> > -
> > -
> > -P1(int *x1, int *x2)
> > -{
> > -  int r2;
> > -
> > -  r2 = smp_load_acquire(x1);
> > -  smp_store_release(x2, 2);
> > -}
> > -
> > -P2(int *x2, int *x3)
> > -{
> > -  int r2;
> > -
> > -  r2 = smp_load_acquire(x2);
> > -  smp_store_release(x3, 2);
> > -}
> > -
> > -P3(int *x3, int *x0)
> > -{
> > -  int r1;
> > -  int r2;
> > -
> > -  r1 = smp_load_acquire(x3);
> > -  r2 = READ_ONCE(*x0);
> > -}
> > -
> > -exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
> > -\end{verbbox}
> > -}
> > -\centering
> > -\theverbbox
> > +\input{CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o@whole.fcv}
> >  \caption{Long ISA2 Release-Acquire Chain}
> >  \label{lst:memorder:Long ISA2 Release-Acquire Chain}
> >  \end{listing}
> > @@ -2899,16 +2857,20 @@ shows a three-step release-acquire chain, but where \co{P3()}'s
> >  final access is a \co{READ_ONCE()} from \co{x0}, which is
> >  accessed via \co{WRITE_ONCE()} by \co{P0()}, forming a non-temporal
> >  load-to-store link between these two processes.
> > -However, because \co{P0()}'s \co{smp_store_release()} (line~12)
> > +\begin{lineref}[ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole]
> > +However, because \co{P0()}'s \co{smp_store_release()} (line~\lnref{P0:rel})
> >  is cumulative, if \co{P3()}'s \co{READ_ONCE()} returns zero,
> >  this cumulativity will force the \co{READ_ONCE()} to be ordered
> >  before \co{P0()}'s \co{smp_store_release()}.
> > -In addition, the release-acquire chain (lines~12, 20, 21, 28, 29, and~37)
> > +In addition, the release-acquire chain
> > +(lines~\lnref{P0:rel}, \lnref{P1:acq}, \lnref{P1:rel}, \lnref{P2:acq},
> > +\lnref{P2:rel}, and~\lnref{P3:acq})
> >  forces \co{P3()}'s \co{READ_ONCE()} to be ordered after \co{P0()}'s
> >  \co{smp_store_release()}.
> >  Because \co{P3()}'s \co{READ_ONCE()} cannot be both before and after
> >  \co{P0()}'s \co{smp_store_release()}, either or both of two things must
> >  be true:
> > +\end{lineref}
> >
> >  \begin{enumerate}
> >  \item        \co{P3()}'s \co{READ_ONCE()} came after \co{P0()}'s
> > --
> > 2.7.4
> >
>

