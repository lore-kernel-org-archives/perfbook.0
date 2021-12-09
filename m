Return-Path: <SRS0=jiRn=Q2=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/FUz2rHpXN4/kLka/Cb6BwwCMKSnALeX7YrxiPQtkZc=;
        b=n4ftFpE0coier5+N987m7TdK058NkNxxPjsR31hpVV+LsiI3VYiDziFP9Te2bR0aSb
         i7idJRSGrdWdJW/DTmkY3NO/h21iOjwW4MHS1ZFVkqlqBJk9ssMvBM5QrACua5/zDM5P
         DWFBSAXGFBqDqMCZnx7YgFdmH94GrRixhvLQApCGzvwReBfoI0lYOXEnGQZ8M+ny/LkR
         TFmm3Ki3T5mAq3LKroeJ1rrSmTzvgQ1HbPn23bn88mBLKKAPS96xKX+1dOACBjUjnkop
         pS1D+WKvZ1TJvImSfnZXLC4ywIvSsNvkYi+POoxjFL1sx1y7+zEdXNnFyierEsD7bsCu
         7rHg==
MIME-Version: 1.0
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
 <20211208195547.GY641268@paulmck-ThinkPad-P17-Gen-1> <fe2d7604-8263-357b-a3c7-0ff59038e67a@gmail.com>
 <20211208235858.GA641268@paulmck-ThinkPad-P17-Gen-1> <7ab89db4-75eb-8e40-7601-a302cf1865d3@gmail.com>
In-Reply-To: <7ab89db4-75eb-8e40-7601-a302cf1865d3@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Thu, 9 Dec 2021 14:28:47 +0800
Message-ID: <CAABZP2xZk_4=Ncc901Vyf-8t+nyZW44O-Qtijx4QaXcz3nk8vw@mail.gmail.com>
Subject: Re: [PATCH -perfbook 0/4] Address potential widowing of headings
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Thu, Dec 9, 2021 at 9:30 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Wed, 8 Dec 2021 15:58:58 -0800, Paul E. McKenney wrote:
> > On Thu, Dec 09, 2021 at 07:20:20AM +0900, Akira Yokosawa wrote:
> [...]
> >> So the diff below looks somewhat out of context, because the Quiz
> >> part of QQ A.2 is "How could there be such a large gap between
> >> successive consumer reads?".
> >>
> >> ----
> >> @@ -175,7 +175,7 @@ seq    & \multicolumn{1}{c}{time (seconds)} & delta~  &  a &  b &  c \\
> >>         consumer reads?
> >>         See \path{timelocked.c} for full code.
> >>  }\QuickQuizAnswer{
> >> -       Here are possible scenarios:
> >> +       Here are a few of the errors:
> >>
> >>         \begin{enumerate}
> >>         \item   The consumer might be preempted for long time periods.
> >> ----
> >>
> >> Thoughts?
> >
> > I changed this to "Here are a few reasons for such gaps:".  Does
> > that work for you?
>
> Works for me!

Works for me too ;-)
>
>         Thanks, Akira
>
> >
> >                                               Thanx, Paul
> >
> >>         Thanks, Akira
> [...]
Thanks, Zhouyi
