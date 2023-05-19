Return-Path: <SRS0=lLgH=BI=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684477730; x=1687069730;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UP/lhQ7e7GorUJ5xO1KkvaYdajzUkOGHytaOtCJZf6k=;
        b=cDrMypPZGeKQn5iNAgk4wFKFnenHONteQEaad3X2LCC9l9OanfMs+Qv+/587jyvZgF
         f1z6ORhmwS0JRXQFv902EQieEH4laUh84wUpoiOXnjcm5GWP3e1Q2aqkn81gLcYtkrwb
         YnHThXtZ0p8DEYsPpdwb2uTmYuI5leJRKZ+/Ox8zU1zc4e5IHR3q6VlmkPLirDumM8cO
         EykvGEDFH03v1hKe4SgrkAcal+NZoSr5QWX+mWM3BhwYtFwhOLqfqUG7Na4GrFcuzvaU
         rrrTAYKS+VSBkfviy7GSE/2ZFKaY/ozPRDU0HI9icDSm7Xjnwfyn9GKW2QbV0YpAuF8C
         a9og==
Date: Fri, 19 May 2023 06:28:47 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: A question about QuickQuiz 5.46
Message-ID: <20230519062847.GA17791@haolee.io>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, May 18, 2023 at 10:50:51AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Wed, 17 May 2023 12:01:10 +0000, Hao Lee wrote:
> > Hi, Paul
> > 
> > I noticed that QuickQuiz 5.46 is causing confusion due to the fact that
> > balance_count() and flush_local_count() are both located within the
> > slowpath and are called sequentially. As a result, it is impossible for
> > them to compete for the counterandmax thread-local variable.
> 
> Right.
> And that's exactly what is mentioned in the answer to the quiz.
> 
> I guess it confused you because you didn't expect such an easy one,
> no ? :-)

In fact I'm confused about the question description.
I believe that this quiz should focus on the concurrency of global
variables, rather than on the concurrency of the atomic variable
`counterandmax`, which is currently the main focus of the description.

> 
>         Thanks, Akira
> 
> >                                                               Therefore,
> > I believe that this quiz may be referring to the global variables
> > globalcount and globalreserve.
> > 
> > Thanks,
> > Hao Lee
