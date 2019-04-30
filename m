Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TT2Sr2QYeKrsRV+uZ38M9AZbmzOJQVp9jCv5FtGFycc=;
        b=DyCB6tnEnOUG03ffK1jYWvliqH+s3aqzmZaDqeAB2TtCpbAvDM96cAGKi/wXEsJYDg
         D1P4/nhH4r86ljpe03Gdh1UmuyA4b+LtmSbKj6acKRbJk4Yl1q9LBLLn2MmnOSwTEmaU
         EX1unqdZzuKPAABcbh5BReGwh2wcVXB/ygGkL9CvrrjslMNjSv9zA1K442kFaPwmgKAE
         0kYTMMqSqw+eyXW9NHJ3IwVXCARcpPcHx2SxYPalFxgPsNl7+P/iG47IMf23FkjeNw7x
         9UhB/YY+d/zwhApfEFsCJu7IL4w8z8SW7nU4foWlJpS2IG0vU9BYO1RCb/2Ju4Jou3uN
         zAVg==
MIME-Version: 1.0
References: <1556548724-17844-1-git-send-email-junchangwang@gmail.com> <899d284e-bace-d53a-0e17-5f841885943e@gmail.com>
In-Reply-To: <899d284e-bace-d53a-0e17-5f841885943e@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Tue, 30 Apr 2019 10:43:41 +0800
Message-ID: <CABoNC83=j7r5vapzgDHcoeeVp9=y_VWdGv668-NScaFLQnhj6g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Toyrcu: replace plain accesses with READ_ONCE()
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Mon, Apr 29, 2019 at 11:38 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Mon, 29 Apr 2019 22:38:42 +0800, Junchang Wang wrote:
> > Hi list,
> >
> > Variable rcu_gp_ctr is accessed concurrently by the updater and readers,
> > and hence should be protected by READ_ONCE() and WRITE_ONCE(). This patch
> > set updates rcu and rcu_qs.
> >
> > The tex file is updated accordingly. And a new scheme, which is suggested
> > by Akira and can extract code snippets from the source code, has been
> > applied.
> >
> > Please note that rcu_nest also needs to be updated. I will first make sure
> > that I'm fully understand how it works, and then submit a patch for it.
> >
>
> Hi Junchang,
>
> Thanks for doing all this.
> One thing I'd like you to be aware of is that when a patch is updated heavily
> like this, Reviewed-by: tags should be dropped.

Got it. Thanks, Akira.

--Junchang

> I'll review this patch set in a few days. Please give me a little while.
>
>         Thanks, Akira
>
> > --
> > Junchang Wang (2):
> >   rcu: Use READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr
> >   rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared variable
> >     rcu_gp_ctr
> >
> >  CodeSamples/defer/rcu.c    |  30 ++++---
> >  CodeSamples/defer/rcu.h    |  21 +++--
> >  CodeSamples/defer/rcu_qs.c |  29 ++++---
> >  CodeSamples/defer/rcu_qs.h |  42 ++++-----
> >  appendix/toyrcu/toyrcu.tex | 207 +++++++++++++++++----------------------------
> >  5 files changed, 146 insertions(+), 183 deletions(-)
> >
>

