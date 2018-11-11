Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34266 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728742AbeKLBsx (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 11 Nov 2018 20:48:53 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wABFrfvG144732
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 10:59:57 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2npd3um4sd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sun, 11 Nov 2018 10:59:57 -0500
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 11 Nov 2018 15:59:56 -0000
Date: Sun, 11 Nov 2018 07:59:53 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] cpu: Fix typos
Reply-To: paulmck@linux.ibm.com
References: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
 <52e466f0-b57a-ed04-2ac5-7fb2022e82c7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52e466f0-b57a-ed04-2ac5-7fb2022e82c7@gmail.com>
Message-Id: <20181111155953.GR4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Sun, Nov 11, 2018 at 08:51:33AM +0900, Akira Yokosawa wrote:
> On 2018/11/10 20:49:21 +0800, Junchang Wang wrote:
> > Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> > ---
> > Hi Paul,
> > 
> > This is the only patch for Chapter CPU. Please take a look.
> > 
> > 
> > Thanks,
> > --Junchang
> > 
> > --
> >  cpu/overheads.tex | 4 ++--
> >  cpu/overview.tex  | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> > index 2474cfe..17b120b 100644
> > --- a/cpu/overheads.tex
> > +++ b/cpu/overheads.tex
> > @@ -155,7 +155,7 @@ displayed in
> >  Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
> >  This system's clock period rounds to 0.6\,ns.
> >  Although it is not unusual for modern microprocessors to be able to
> > -retire multiple instructions per clock period, the operations's costs are
> > +retire multiple instructions per clock period, the operations' costs are
> >  nevertheless normalized to a clock period in the third column, labeled
> >  ``Ratio''.
> >  The first thing to note about this table is the large values of many of
> > @@ -360,7 +360,7 @@ It is clear that the combination of speculative execution and cloud
> >  computing needs more than a bit of rework!
> >  
> >  A fifth hardware optimization is large caches, allowing individual
> > -CPUs to operate on larger datasets without incuring expensive cache
> > +CPUs to operate on larger datasets without incurring expensive cache
> >  misses.
> 
> Nice catches!

Indeed!!!  ;-)

> >  Although large caches can degrade energy efficiency and cache-miss
> >  latency, the ever-growing cache sizes on production microprocessors
> > diff --git a/cpu/overview.tex b/cpu/overview.tex
> > index 071cf7c..9e91a7b 100644
> > --- a/cpu/overview.tex
> > +++ b/cpu/overview.tex
> > @@ -15,7 +15,7 @@ where the race always goes to the swiftest.
> >  \ContributedBy{Figure}{fig:cpu:CPU Performance at its Best}{Melissa Broussard}
> >  \end{figure}
> >  
> > -Although there are a few CPU-bound benchmarks that approach the ideal
> > +Although there are a few CPU-bound benchmarks that approach the ideal case
> >  shown in Figure~\ref{fig:cpu:CPU Performance at its Best},
> 
> "ideal" can be used as a noun. I don't think this hunk is necessary.

This is quite true, but making it a bit less confusing to non-native
English speakers is worth something.  Not that I am volunteering to
confine myself to the 850-word vocabulary of Basic English, mind you!  ;-)

So Akira has a good point, but I will take Junchang's patch.

							Thanx, Paul

>         Thanks, Akira
> 
> >  the typical program more closely resembles an obstacle course than
> >  a race track.
> > 
> 

