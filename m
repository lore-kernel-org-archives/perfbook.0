Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=phjhX2dKoSCEzeo2vOqIaArb2cgIkngMdRfy9psLzi0=;
        b=Mlj6mLPooxUs4udi25ErD6AHocThJ7/sLoASCBfmPgZFjNh7E3nXGPWHqUYQX+rDxF
         olt12eO0hvnxCzZ7/BMG/tcnzClBnfzF4GpsUIkfiVQXEABa50ozuz4HvdLLJ54VYgUr
         zInWZFtYT786/sLnkP5K4L0mjVHQDEU9vPB/GF9e4Qe6ZEpGwnu5oLN6eWqzGmGWjGNa
         jib0OchPdOqbCPf2ntYKgvjQO6w2tBeJQywSepDIGncbyAr+/sTAoAAxDoKbda8xKtRh
         AmCeYxZwIq4fQuZ3u99epJ7kO+FMC698uqCB1ki86wuAA5wUB/mAJWQT1+3BsMhWML4d
         Vf9g==
MIME-Version: 1.0
References: <20210404075010.15858-1-sj38.park@gmail.com> <20210404075010.15858-2-sj38.park@gmail.com>
 <64aca3cc-3f4a-93d7-0c95-ff44114163a7@gmail.com>
In-Reply-To: <64aca3cc-3f4a-93d7-0c95-ff44114163a7@gmail.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Sun, 4 Apr 2021 11:56:12 +0200
Message-ID: <CAEjAshqa0BoxnEP+ShDuK7-vQn0rg9r6ugg_gv4v+cAZpOuqJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] howto: Use '\cref' consistently
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello Akira,

On Sun, Apr 4, 2021 at 11:39 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Hello SeongJae,
>
> On Sun, 4 Apr 2021 09:50:07 +0200, SeongJae Park wrote:
> > 'howto' chapter is using mix of '\cref' and 'Chapter~\ref'.  This commi=
t
> > makes it to consistently use the shorter one, '\cref'.
> >
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  howto/howto.tex | 38 +++++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/howto/howto.tex b/howto/howto.tex
> > index 7de1dbd9..4a00bb3c 100644
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
> > +\cref{chp:Introduction} gives a high-level overview of parallel
>
> Please use \Cref{} at the beginning of a sentence.
>
> This does not matter at the moment, but in the long run,
> once we finish the conversion to \cref{}/\Cref{}s,
> cleveref will allow us to choose other convention of
>
>     Figure 1 ..., Fig. 2 ...
>
> ,or
>
>     Figure 1 ..., fig. 2 ...
>
> to save some paper/display area.
>
> Excerpt of cleveref's user manual:
>
>     If you just want to get going quickly with cleveref, and
>     come back later to read up on all the features it provides
>     in more detail, here=E2=80=99s what you need to do. Wherever you
>     would previously have used \ref, use \cref instead.
>     (Except at the beginning of a sentence, where you should
>     use \Cref.)
>
> >  programming.
> >
> > -Chapter~\ref{chp:Hardware and its Habits} introduces shared-memory
> > +\cref{chp:Hardware and its Habits} introduces shared-memory
>
> Ditto.  And there are same patterns below.
>
> Can you fix them and resend the series?

Sure, I will do so soon.


Thanks,
SeongJae Park
[...]
