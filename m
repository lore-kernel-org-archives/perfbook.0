Return-Path: <SRS0=89ej=AU=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682811495; x=1685403495;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r0LwMpTgDM0mmbdLrX//rB6NgYF28nIWy4arGjhyn1E=;
        b=SSmZIHJ8kz7sVwGQ/KYHrNmNV6SBCxGHz+k8LARiHpSRxrs+mOLFKyJjfc0433kvj2
         FvYE7v4ca6Ulu9P4AMLMABxDL0aii3p+1+LSknvwV2ZNuyrueOT6o3tt183ss+oTI+ny
         yalvJxIAggtOMzlvGuoG11tVXW5ZlQ0HwnaqQGR21Fw16UT6MB1xzpf7GI2Q3Jye2V8A
         T2HHrLppQiCSW/1N/l+VFQ9+/RYnt9w6a4MHvg/tbo74sfURD9mZv5Z9MibDDVuHUxc4
         ZWQzcavWlQ4NZ1ty0Hq44id328pAo4nhHlRE3ny7PE+o88LCBpmrJm74G5SavzOX7mdr
         nngA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 1/2] together/refcnt: Use \tco{} for code quoting
Date: Sat, 29 Apr 2023 16:38:12 -0700
Message-Id: <20230429233812.18478-1-sj@kernel.org>
In-Reply-To: <cf2f6f7e-b5cd-02eb-9c67-9ef9c1778e7b@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Sun, 30 Apr 2023 07:20:48 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi,
> 
> On Sat, 29 Apr 2023 10:02:25 -0700, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > Some sentences in refcnt.tex is using only quote for some code words.
> > Use \tco{} instead, as it is intended to be used for the case.
> 
> \tco{} doesn't put quotes around it.
> Didn't you mean \qco{} ?

You're correct, I was out of my mind.  I also mistakenly used an email account
that different from what I signed patches off.  I will send a new spin
tomorrow.


Thanks,
SJ

> 
>         Thanks, Akira
> 
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  together/refcnt.tex | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/together/refcnt.tex b/together/refcnt.tex
> > index 56caed67..4abe1c60 100644
> > --- a/together/refcnt.tex
> > +++ b/together/refcnt.tex
> > @@ -467,15 +467,15 @@ as shown below.
> >  
> >  \QuickQuiz{
> >  	Why can't the check for a zero reference count be
> > -	made in a simple ``if'' statement with an atomic
> > -	increment in its ``then'' clause?
> > +	made in a simple \tco{if} statement with an atomic
> > +	increment in its \tco{then} clause?
> >  }\QuickQuizAnswer{
> > -	Suppose that the ``if'' condition completed, finding
> > +	Suppose that the \tco{if} condition completed, finding
> >  	the reference counter value equal to one.
> >  	Suppose that a release operation executes, decrementing
> >  	the reference counter to zero and therefore starting
> >  	cleanup operations.
> > -	But now the ``then'' clause can increment the counter
> > +	But now the \tco{then} clause can increment the counter
> >  	back to a value of one, allowing the object to be
> >  	used after it has been cleaned up.
> >  
