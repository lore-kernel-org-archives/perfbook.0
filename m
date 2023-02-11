Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ONB2tFruyzlKCe7NLQfyyKibuweVUrZJOyJXsjkkrV4=;
        b=K+k5WdY5HZcl9EvK7iAaqhGkRh0a/94/a2nv5ZUw4fjMz2Tx1Gxd2JwBb6E2lU8wSt
         cT92a4W3VBpH9MSHmrlchsdYkzr+zwb/Z6GnUfE0FObEjmijGDMLNrtkaMIJoaidYdtj
         HgU8B0QjCag5XmfY1L05wtXlOF5TObi3vepFnvOaBVKlf7GhR9ZUr8z8TJaLZV6S1uh6
         4VS7SVPFKxzf2jigos1PokVLCFtYpU5Oc5iZOFQT/fC+/hPmXhK2QRL/XIHIkP2p+S5h
         g5Z1NN3j7R7GxSHFUppZYgdFx8rYWfpyC96ZsQ2fBOc2BGtM7eIoP0l2kzQQb/WwUeWY
         Briw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 1/5] debugging: Use \co{} for 'time' output examples
Date: Sat, 11 Feb 2023 09:03:15 -0800
Message-Id: <20230211170315.8850-1-sj@kernel.org>
In-Reply-To: <6745658a-5dde-fe09-29dd-4428c34d75f3@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,


Sorry for late response.

On Mon, 6 Feb 2023 11:31:55 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi SeongJae,
> 
> On Sun,  5 Feb 2023 10:21:24 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > A quick quiz answer in debugging.tex is wrapping 'time' example outputs
> > with `` and ''.  Use \co{} instead.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  debugging/debugging.tex | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index 4568f90a..3104bb95 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -257,8 +257,8 @@ validation is just job for you.
> >  		consumed in system mode by a CPU-bound program?
> >  	\item	Do you have a test case in which all three times
> >  		are zero?
> > -	\item	Do you have a test case in which the ``user'' and ``sys''
> > -		times sum to more than the ``real'' time?
> > +	\item	Do you have a test case in which the \co{user} and \co{sys}
> > +		times sum to more than the \co{real} time?
> >  		(This would of course be completely legitimate in
> >  		a multithreaded program.)
> >  	\item	Do you have a set of tests cases in which one of the
> > @@ -267,7 +267,7 @@ validation is just job for you.
> >  		times uses more than ten seconds?
> >  	\item	Do you have a set of test cases in which one of the
> >  		times has non-zero minutes?
> > -		(For example, ``15m36.342s''.)
> > +		(For example, \co{15m36.342s}.)
> >  	\item	Do you have a set of test cases in which one of the
> >  		times has a seconds value of greater than 60?
> >  	\item	Do you have a set of test cases in which one of the
> > @@ -279,21 +279,21 @@ validation is just job for you.
> >  		times has a positive minutes value but a negative
> >  		seconds value?
> >  	\item	Do you have a set of test cases in which one of the
> > -		times omits the ``m'' or the ``s''?
> > +		times omits the \co{m} or the \co{s}?
> >  	\item	Do you have a set of test cases in which one of the
> >  		times is non-numeric?
> > -		(For example, ``Go Fish''.)
> > +		(For example, \co{Go Fish}.)
> 
> My preference is to enclose \co{Go Fish} by quotation marks.
> That is easier for me to see it as a string.
> There is a convenient macro \qco{} for this purpose. You can say:
> 
>   +             (For example, \qco{Go Fish}.)
> 
> >  	\item	Do you have a set of test cases in which one of the
> >  		lines is omitted?
> > -		(For example, where there is a ``real'' value and
> > -		a ``sys'' value, but no ``user'' value.)
> > +		(For example, where there is a \co{real} value and
> > +		a \co{sys} value, but no \co{user} value.)
> >  	\item	Do you have a set of test cases where one of the
> >  		lines is duplicated?
> >  		Or duplicated, but with a different time value for
> >  		the duplicate?
> >  	\item	Do you have a set of test cases where a given line
> >  		has more than one time value?
> > -		(For example, ``real 0m0.132s 0m0.008s''.)
> > +		(For example, \co{real 0m0.132s 0m0.008s}.)
> 
> Ditto.
> 
> With them taken care of,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thank you for nice suggestions.  I will revise as you suggested.


Thanks,
SJ

> 
>         Thanks, Akira
> 
> >  	\item	Do you have a set of test cases containing random
> >  		characters?
> >  	\item	In all test cases involving invalid input, did you
