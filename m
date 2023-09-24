Return-Path: <SRS0=FzRX=FI=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695570007; x=1696174807; darn=kernel.org;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=35dPvTMFJRnHG8BZCXkED3zLdMobf+ouKWSZqvhr1PA=;
        b=nVxCSs2uX40u03p00dPMO0h3GReM+DqeH8yaT/pUJs9lzK5P7UAsLbkaFeVhFXge5m
         737JdW9F7IGeLxSo8XFvyJq4TcHqkMsxDW9/O/rMMLx2NFcOsYGgoAOgAixERA7ws3oq
         e1zsq0cCGnhDuGDqUbjpWPNnzM3yCTIz4S/wFJAj/RpvkqBtyUcE8cHK25v7mJ/DAF+m
         5VYoSObp/xivK5AekgoI+Mgw4roRQoWv3yrO5bkVMvHisBoNxg3KCRJjzSBPCSwdTJih
         Dgg+BP2QGYscsyLjn4DHw5ZIiR9yaL35YXRHGrFN3Or878QQPiEB2Z6ZpajQU90cM6vg
         YbEA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 10/10] memorder: Fix wrong primitive names in a quick quizz
Date: Sun, 24 Sep 2023 08:40:04 -0700
Message-Id: <20230924154005.5114-1-sj@kernel.org>
In-Reply-To: <9783529e-b974-8f64-c2f0-4fc52b04746e@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Sun, 24 Sep 2023 09:02:53 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi,
> 
> On 2023/09/24 1:32, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > memorder.tex explains READ_ONCE() is having smp_mb(), but the following
> > quick quizz asks why it has mb() instead of rmb().  Fix the wrong names
> > in the quick quizz.
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  memorder/memorder.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 5c978fbe..b3acc14a 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -5491,7 +5491,7 @@ Alpha is the only CPU whose \co{READ_ONCE()} includes an \co{smp_mb()}.
> >  \QuickQuizSeries{%
> >  \QuickQuizB{
> >  	Why does Alpha's \co{READ_ONCE()} include an
> > -	\co{mb()} rather than \co{rmb()}?
> > +	\co{smp_mb()} rather than \co{smp_rmb()}?
> 
> Definition in Linux kernel's arch/alpha/include/asm/rwonce.h reads:
> 
> #define __READ_ONCE(x)							\
> ({									\
> 	__unqual_scalar_typeof(x) __x =					\
> 		(*(volatile typeof(__x) *)(&(x)));			\
> 	mb();								\
> 	(typeof(x))__x;							\
> })
> 
> So I don't think this change is needed.
> 
> As this quiz is talking about Alpha ISA, how about rewording the
> quiz to:
> 
>     Why does Alpha's \co{READ_ONCE()} include an
>     \co{mb} instruction rather than a \co{rmb}?
> 
>         Thanks, Akira
> 
> >  }\QuickQuizAnswerB{
> >  	Alpha has only \co{mb} and \co{wmb} instructions,
> >  	so \co{smp_rmb()} would be implemented by the Alpha \co{mb}
> > -- 
> > 2.17.1

That makes sense.  Thank you for nice review and suggestion!  I will make the
second version of this patch following your comment.


Thanks,
SJ
