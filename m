Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3wwD8ZjX31Jeet7pX8BLnhFHkYmIbNATpns5m6CE5sY=;
        b=IlmDd24ovv+rowlIlKzDjbd8oCbxkDgOrfebNneGI9Uwvg/0eVWVA0tHibbf3Gkaf0
         xVoeFtphZ5KVhPYiNgbPVBORlMF7zjV3dI/EOTtkpMCkYA56UjUPoUBMmfYUA9jLgAZl
         eXJg1s8CqGrMRxpdBndwO9nZ8Ix/Gy/DD4nfiVYu1WY3SrOyBnRbamb7VPtB1Zib66II
         VWh74j4/Okq5Re4Wb1XF9IqCryNrcRRG2spj7BGyAJAEVxF6BYzfbNaWWa9rCxOS7aik
         bGksOUKbV5/HJL45Zl0xTkjLVg874fF34Ce954HoIgKwJmOIcTa6zdmdvi651mR7ed0K
         IezQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: Re: [PATCH 4/5] debugging: Remove unnecessary space in a sentence
Date: Sat, 11 Feb 2023 09:05:22 -0800
Message-Id: <20230211170522.9059-1-sj@kernel.org>
In-Reply-To: <8e71d5af-7da0-29ce-977a-531800616d68@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, paulmck@kernel.org, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

On Mon, 6 Feb 2023 11:53:54 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:

> On Date:   Sun,  5 Feb 2023 10:21:27 -0800, SeongJae Park wrote:
> > From: SeongJae Park <sj38.park@gmail.com>
> > 
> > Two spaces are usually used between sentences, but a sentence in
> > debugging is using two spaces inside a sentence.  Make it uses only one
> > space for consistency.
> 
> FWIW, in perfbook's .tex source files, sentence ending periods must
> be at the end of lines. Violation to this rule is flagged by
> "make punctcheck" now a days.

Thank you for letting me know that.  So, this is just a note rather than a
change request to this patch, right?  I will make no change for this patch on
the next spin if so.


Thanks,
SJ

> 
>         Thanks, Akira
> 
> > 
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  debugging/debugging.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> > index 1903c5db..53c7fb94 100644
> > --- a/debugging/debugging.tex
> > +++ b/debugging/debugging.tex
> > @@ -2153,7 +2153,7 @@ serve four major purposes:
> >  	against your competitors' offerings.
> >  \end{enumerate}
> >  
> > -Of course,  the only completely fair framework is the intended
> > +Of course, the only completely fair framework is the intended
> >  application itself.
> >  So why would anyone who cared about fairness in benchmarking
> >  bother creating imperfect benchmarks rather than simply
