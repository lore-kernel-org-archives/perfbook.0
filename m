Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51930 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750882AbdFAET1 (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 1
 Jun 2017 00:19:27 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v514JLBT119339
 for <perfbook@vger.kernel.org>; Thu, 1 Jun 2017 00:19:26 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2at43r9w6v-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 01 Jun 2017 00:19:26 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 1 Jun 2017
 00:19:24 -0400
Date: Wed, 31 May 2017 21:19:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
 <20170531184655.GR3956@linux.vnet.ibm.com>
 <CABoNC81zFyS5e3dqDRGg9DMwAmzz2_eOYLr_5zQE0YZ4MKp83g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABoNC81zFyS5e3dqDRGg9DMwAmzz2_eOYLr_5zQE0YZ4MKp83g@mail.gmail.com>
Message-Id: <20170601041921.GX3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Thu, Jun 01, 2017 at 09:45:02AM +0800, Junchang Wang wrote:
> Hi Paul and Akira,
> 
> The code looks clear and easy to understand now :-).

Glad you like it!  I am sure that other code in there could use
similar help.

> While checking the patch, I have one question. Are there any technical
> reason that we prefer for(;;) instead of while(1) in CodeSamples? Just
> out of curiosity :-)

No.  Just thirty-five years of habit plus the preferences of the Linux
kernel community.  And the latter are probably because "while (1)"
has one more character than does "for (;;)".  ;-)

							Thanx, Paul

> Thanks
> 
> On Thu, Jun 1, 2017 at 2:46 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Tue, May 30, 2017 at 09:05:15PM +0900, Akira Yokosawa wrote:
> >> >From 489b5e3bdeba2f9b733dbe3d85390368dd159174 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Tue, 30 May 2017 20:44:52 +0900
> >> Subject: [RFC PATCH v2 0/2] CodeSamples: Cleanups and fixes
> >>
> >> Hi Paul,
> >>
> >> This is the respin of the latter two patches of v1. I'm keeping RFC
> >> because of some questions.
> >>
> >> "long" -> "intptr_t" changes in Patch 1 have no effect on a platform
> >> where "long" and "intptr_t" have the same width, but I think they
> >> are good in portability POV.
> >>
> >> WRITE_ONCE() in Patch 2 is placed under the assignment to the array
> >> because I could not translate post increment in any other way.
> >> Does the WRITE_ONCE() ensure the outer "while" capture the value?
> >
> > Wow, that loop is old code!!!  My current compiler creates an infinite
> > loop for it, so yes, there is more required.   Plus there are confusing
> > and redundant comparisons, so that it is not entirely clear to me that
> > the loop is guaranteed to terminate properly.
> >
> > So I took both patches, but rewrote the loop in the second patch as
> > shown below.
> >
> > If you are OK with this rewrite, I will push them.
> >
> >                                                         Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > commit 8a54d9aeeeefa1909db062dc893705ff8fefd702
> > Author: Akira Yokosawa <akiyks@gmail.com>
> > Date:   Tue May 30 20:40:04 2017 +0900
> >
> >     CodeSamples/defer: Rework loop in gettimestampmp.c
> >
> >     Add READ_ONCE() and WRITE_ONCE() ensure curtimestamp is read and written
> >     once in every iteration.  The READ_ONCE() is not optional, as modern
> >     compilers can (and do) emit an infinite loop for the earlier code.
> >
> >     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >     [ paulmck: Rework loop to eliminate redundant fetches and comparisons. ]
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> > diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
> > index 2abade42e233..8780b71f33d7 100644
> > --- a/CodeSamples/defer/gettimestampmp.c
> > +++ b/CodeSamples/defer/gettimestampmp.c
> > @@ -30,16 +30,19 @@ long curtimestamp = 0;
> >  void *collect_timestamps(void *mask_in)
> >  {
> >         long mask = (intptr_t)mask_in;
> > +       long cts;
> >
> > -       while (curtimestamp < MAX_TIMESTAMPS) {
> > -               while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
> > -                       continue;
> > -               if (curtimestamp >= MAX_TIMESTAMPS)
> > +       for (;;) {
> > +               cts = READ_ONCE(curtimestamp);
> > +               if (cts >= MAX_TIMESTAMPS)
> >                         break;
> > +               if ((cts & CURTIMESTAMP_MASK) != mask)
> > +                       continue;
> >
> >                 /* Don't need memory barrier -- no other shared vars!!! */
> >
> > -               ts[curtimestamp++] = get_timestamp();
> > +               ts[cts] = get_timestamp();
> > +               WRITE_ONCE(curtimestamp, cts + 1);
> >         }
> >         smp_mb();
> >         return (NULL);
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe perfbook" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

