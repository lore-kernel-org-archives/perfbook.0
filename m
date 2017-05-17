Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47458 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1753558AbdEQXHO (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Wed, 17 May 2017 19:07:14 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v4HN5NcU000800
 for <perfbook@vger.kernel.org>; Wed, 17 May 2017 19:07:14 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2agyfk8uxd-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 17 May 2017 19:07:13 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 17 May
 2017 19:07:13 -0400
Date: Wed, 17 May 2017 16:07:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] count_stat_eventual: Remove unnecessary READ_ONCE()
 and smp_mb()
Reply-To: paulmck@linux.vnet.ibm.com
References: <1494949452-12455-1-git-send-email-junchangwang@gmail.com>
 <20170516173331.GF3956@linux.vnet.ibm.com>
 <CABoNC82QTdg1_xDK+iJ_KeqiP=D9M07q+v4ggfvOBXQjKp4U4A@mail.gmail.com>
 <b2058a50-3932-a9e2-69ad-f59fbfb7eb66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2058a50-3932-a9e2-69ad-f59fbfb7eb66@gmail.com>
Message-Id: <20170517230710.GO3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Thu, May 18, 2017 at 07:44:10AM +0900, Akira Yokosawa wrote:
> On 2017/05/17 11:39:41 +0800, Junchang Wang wrote:
> > On Wed, May 17, 2017 at 1:33 AM, Paul E. McKenney
> > <paulmck@linux.vnet.ibm.com> wrote:
> >> On Tue, May 16, 2017 at 11:44:12PM +0800, Junchang Wang wrote:
> >>> In function eventual(), if the value of stopflag become larger than zero (the
> >>> ''if'' branch is taken), then only the "eventual( )" thread updates stopflag.
> >>> So, the READ_ONCE() within the WRITE_ONCE() is not necessary. Remove it.
> >>>
> >>> In function count_cleanup(), there is no need to run smp_mb( ) in between
> >>> statement writing to and statement reading from the same variable, stopflag.
> >>> Remove smp_mb().
> >>>
> >>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> >>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> >>
> >> Removing the memory barrier is good.  Removing the stopflag_l local
> >> variable is presumably intended to remove one load instruction per pass
> >> through the outer loop, assuming that the stopflag_l variable is kept
> >> in a register.
> >>
> >> Is the performance benefit actually visible?  My guess is "no".
> >> If the performance is not substantial, my thought would be to keep
> >> the code simpler, given that this is a textbook.
> >>
> > 
> > Hi Paul,
> > 
> > Agree. Thanks for the note. Anyway, let's submit a new patch on
> > smp_mb(), which makes the code correct. For simplifying stopflag, we
> > can consider submitting a new patch later. How does that sound like?
> 
> Hi Jason & Paul,
> 
> For a material in Chapter 5, I agree that removing excess READ_ONCE()
> is not necessary.
> 
> Such optimizations could be discussed somewhere (maybe a Quick Quiz)
> in Chapter 14, but I'm not sure. 
> 
> So, the revised patch just removing a smp_mb() looks good to me.

Very good, queued and pushed.  Thank you both!

							Thanx, Paul

>                 Thanks, Akira.
> 
> > 
> > 
> > Thanks,
> > --Jason
> > 
> > 
> >> And yes, there might be other performance-neutral simplifications possible,
> >> and I would welcome patches to that effect.
> >>
> >>                                                         Thanx, Paul
> >>
> >>> ---
> >>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
> >>> index 464de30..1365168 100644
> >>> --- a/CodeSamples/count/count_stat_eventual.c
> >>> +++ b/CodeSamples/count/count_stat_eventual.c
> >>> @@ -40,16 +40,17 @@ void *eventual(void *arg)
> >>>  {
> >>>       int t;
> >>>       unsigned long sum;
> >>> +     int stopflag_l = 0;
> >>>
> >>> -     while (READ_ONCE(stopflag) < 3) {
> >>> +     while (stopflag_l < 3) {
> >>>               sum = 0;
> >>>               for_each_thread(t)
> >>>                       sum += READ_ONCE(per_thread(counter, t));
> >>>               WRITE_ONCE(global_count, sum);
> >>>               poll(NULL, 0, 1);
> >>> -             if (READ_ONCE(stopflag)) {
> >>> +             if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
> >>>                       smp_mb();
> >>> -                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
> >>> +                     WRITE_ONCE(stopflag, ++stopflag_l);
> >>>               }
> >>>       }
> >>>       return NULL;
> >>> @@ -68,7 +69,6 @@ void count_init(void)
> >>>  void count_cleanup(void)
> >>>  {
> >>>       WRITE_ONCE(stopflag, 1);
> >>> -     smp_mb();
> >>>       while (READ_ONCE(stopflag) < 3)
> >>>               poll(NULL, 0, 1);
> >>>       smp_mb();
> >>> --
> >>> 2.7.4
> >>>
> >>
> > 
> 

