Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WfdjFqj0n1lEULIXIr72RQWaQGoacyZ0eFuuHr3TP6c=;
        b=nccr1GkYd6TT153wS1rhEh27ihhj9W0ZmgC3TtmcN+64xKT6pGzESBtV4KeTNTA1Um
         ilWRJz64ovJ95gy0kZIrGEm2sWfBBwjh30B1Ntf/KSvC7ESQbx861H1FWD6UPF1tFElA
         ofQHsWbTDPJaFWKGKIodHcUAHg6itni7AuAOrV0IHTxJIOKr7dCcaAkPF7oqPV4HbbSU
         2w1mhhA47EFqiFnLTmBoui9WjcOapZMA4Z8z1tsYyp8Oqy4Sa3Y67SYRjbez2jrrJgiT
         iNz3RotCRXJ9I0+a4+6aZX2MzOiCRRqAsOcdjoN9bVOZsFkn4Co9v5Ts0q+C5hzRr6dO
         GD8Q==
MIME-Version: 1.0
References: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
 <52e466f0-b57a-ed04-2ac5-7fb2022e82c7@gmail.com> <20181111155953.GR4170@linux.ibm.com>
In-Reply-To: <20181111155953.GR4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Mon, 12 Nov 2018 10:25:45 +0800
Message-ID: <CABoNC80DF6OBeK8K=tXqBNyZ5OvRZ-FM9i2EUWAPpadfenx_yQ@mail.gmail.com>
Subject: Re: [PATCH] cpu: Fix typos
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Nov 11, 2018 at 11:59 PM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sun, Nov 11, 2018 at 08:51:33AM +0900, Akira Yokosawa wrote:
> > On 2018/11/10 20:49:21 +0800, Junchang Wang wrote:
> > > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > > ---
> > > Hi Paul,
> > >
> > > This is the only patch for Chapter CPU. Please take a look.
> > >
> > >
> > > Thanks,
> > > --Junchang
> > >
> > > --
> > >  cpu/overheads.tex | 4 ++--
> > >  cpu/overview.tex  | 2 +-
> > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > > index 2474cfe..17b120b 100644
> > > --- a/cpu/overheads.tex
> > > +++ b/cpu/overheads.tex
> > > @@ -155,7 +155,7 @@ displayed in
> > >  Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
> > >  This system's clock period rounds to 0.6\,ns.
> > >  Although it is not unusual for modern microprocessors to be able to
> > > -retire multiple instructions per clock period, the operations's costs are
> > > +retire multiple instructions per clock period, the operations' costs are
> > >  nevertheless normalized to a clock period in the third column, labeled
> > >  ``Ratio''.
> > >  The first thing to note about this table is the large values of many of
> > > @@ -360,7 +360,7 @@ It is clear that the combination of speculative execution and cloud
> > >  computing needs more than a bit of rework!
> > >
> > >  A fifth hardware optimization is large caches, allowing individual
> > > -CPUs to operate on larger datasets without incuring expensive cache
> > > +CPUs to operate on larger datasets without incurring expensive cache
> > >  misses.
> >
> > Nice catches!
>
> Indeed!!!  ;-)
>
> > >  Although large caches can degrade energy efficiency and cache-miss
> > >  latency, the ever-growing cache sizes on production microprocessors
> > > diff --git a/cpu/overview.tex b/cpu/overview.tex
> > > index 071cf7c..9e91a7b 100644
> > > --- a/cpu/overview.tex
> > > +++ b/cpu/overview.tex
> > > @@ -15,7 +15,7 @@ where the race always goes to the swiftest.
> > >  \ContributedBy{Figure}{fig:cpu:CPU Performance at its Best}{Melissa Broussard}
> > >  \end{figure}
> > >
> > > -Although there are a few CPU-bound benchmarks that approach the ideal
> > > +Although there are a few CPU-bound benchmarks that approach the ideal case
> > >  shown in Figure~\ref{fig:cpu:CPU Performance at its Best},
> >
> > "ideal" can be used as a noun. I don't think this hunk is necessary.
>

Hi Akira,

You are right. I never realized this until you helped point this out.
I checked my dictionary which says that ideal can be used as a noun
and means 'a perfect example of what something should be like'; in
this respect, word 'case' is unnecessary. Thank you so much. Happy
learning :-)

> This is quite true, but making it a bit less confusing to non-native
> English speakers is worth something.  Not that I am volunteering to
> confine myself to the 850-word vocabulary of Basic English, mind you!  ;-)
>
> So Akira has a good point, but I will take Junchang's patch.

Hi Paul,

Thanks. Then I will explicitly mark this type of patches as
suggestions if there are any in the future. It is a great pleasure to
help improve the book.


Best Regards,
--Junchang


>
>                                                         Thanx, Paul
>
> >         Thanks, Akira
> >
> > >  the typical program more closely resembles an obstacle course than
> > >  a race track.
> > >
> >
>

