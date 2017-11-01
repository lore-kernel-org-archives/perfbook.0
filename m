Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45160 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751852AbdKAUPw (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 1
 Nov 2017 16:15:52 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA1KAhhm136448
 for <perfbook@vger.kernel.org>; Wed, 1 Nov 2017 16:15:51 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dyn0bggrx-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 01 Nov 2017 16:15:51 -0400
Received: from localhost by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 1 Nov 2017
 16:15:49 -0400
Date: Wed, 1 Nov 2017 13:15:46 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Is WRITE_ONCE() enough to prevent invention of stores?
Reply-To: paulmck@linux.vnet.ibm.com
References: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
 <20170917010730.GY3521@linux.vnet.ibm.com>
 <e802cd64-22d9-7ef4-a2b8-95d4779d6c3d@gmail.com>
 <20170917215508.GD3521@linux.vnet.ibm.com>
 <fb1ab164-36a7-1ed7-4eea-5668f5ada155@gmail.com>
 <20171030181423.GA3659@linux.vnet.ibm.com>
 <28b4b464-d8d3-6000-e30d-eb99291d5d7d@gmail.com>
 <20171031162718.GK3659@linux.vnet.ibm.com>
 <0b97b08a-243c-9d0a-2349-a6a2b949dc01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b97b08a-243c-9d0a-2349-a6a2b949dc01@gmail.com>
Message-Id: <20171101201546.GX3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Nov 01, 2017 at 07:25:29AM +0900, Akira Yokosawa wrote:
> On 2017/11/01 1:27, Paul E. McKenney wrote:
> > On Wed, Nov 01, 2017 at 12:36:13AM +0900, Akira Yokosawa wrote:
> >> On 2017/10/30 11:14:23 -0700, Paul E. McKenney wrote:
> >>> On Mon, Sep 18, 2017 at 07:51:29AM +0900, Akira Yokosawa wrote:
> >>>> On 2017/09/17 14:55:08 -0700, Paul E. McKenney wrote:
> >>>>> On Sun, Sep 17, 2017 at 08:04:21PM +0900, Akira Yokosawa wrote:
> >>>>>> On 2017/09/16 18:07:30 -0700, Paul E. McKenney wrote:
> >>>>>>> On Sat, Sep 16, 2017 at 08:01:45PM +0900, Akira Yokosawa wrote:
> > 
> > [ . . . ]
> > 
> >>>>>> Adding this example in the text might be too verbose.
> >>>>>> Would a Quick Quiz be reasonable?
> >>>>>
> >>>>> Might be good in the section on protecting memory references, and putting
> >>>>> it into a quick quiz or two makes a lot of sense.
> >>>>
> >>>> It's up to you where to put it.
> >>>>
> >>>> And I now realize using READ_ONCE() and WRITE_ONCE() is quite tricky.
> >>>> Missing one might not cause a problem today, but a smarter compiler
> >>>> can expose the bug in the future...
> >>>>
> >>>> This is scary.
> >>>
> >>> Section 15.3.1 is supposed to cover READ_ONCE() and WRITE_ONCE().
> >>> There is one final paragraph added just now, but if you get a chance,
> >>> please let me know what you think.
> >>
> >> It looks OK to me. Some minor nitpicks.
> >>
> >> * On exact exceptions and exact interrupts:
> >>
> >> IIRC, I've heard from you that there is an exceptional architecture
> >> which requires explicit memory barriers in exception/interrupt handlers.
> >> Was it Itanium?
> > 
> > For interrupts from kernel code, it is sometimes the case that the
> > kernel needs other CPUs to see the accesses in the code before the
> > interrupt handler, the code within the interrupt handler, and the code
> > after the interrupt handler to have happened in order.  In that case,
> > the interrupt entry/exit code might well need full memory barriers.
> > 
> > There are other ways to organize this that do not require interrupt
> > entry/exit memory barriers, for example, the convention could be that
> > locking be used.
> 
> Makes sense.
> 
> And I was somewhat confused here.
> By "exact exceptions and exact interrupts", you are talking about
> _instruction stream_ reordering.
> Now I recall that my question at the time was "Do interrupts/
> exceptions behave as memory barriers?".
> So they are distinct point of view. If an architecture didn't
> provide "exact exceptions and exact interrupts", it should be
> quite tricky to return from exceptions/interrupts.

Back in the old days, there were architectures with inexact interrupts
that dumped hardware state onto the stack.  The supposed benefit was
the ability to make progress without requiring that all pages used by
a particular instruction be mapped simultaneously.  But OS writers
really hated it, especially since the size of hardware state varied
based on all sorts of things.  ;-)

> Thanks for the clarification.
> 
> > 
> >> * On the final paragraph of Section 15.3.1:
> >>
> >> "Nevertheless" appears twice in this paragraph. You might want to
> >> reword one of them.
> > 
> > Good point, how about the following?
> > 
> > 	Nevertheless, it is quite possible to overdo use of READ_ONCE()
> > 	and WRITE_ONCE(). For example, if you have prevented a given
> > 	variable from changing (perhaps by holding the lock guarding
> > 	all updates to that variable), there is no point in using
> > 	READ_ONCE(). Similarly, if you have prevented any other CPUs or
> > 	threads from reading a given variable (perhaps because you are
> > 	initializing that variable before any other CPU or thread has
> > 	access to it), there is no point in using WRITE_ONCE(). However,
> > 	my experience is that developers need to use things like
> > 	READ_ONCE() and WRITE_ONCE() more often than they think that
> > 	they do, the overhead of unnecessary uses is quite low, and the
> > 	penalty for failing to use them when needed is quite high.
> 
> The clause added to the last sentence makes the point more obvious.
> This looks more than enough.

Glad you like it!

							Thanx, Paul

>       Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >>> And if you are scared, you might actually have a good understanding
> >>> of the true situation.  ;-)
> >>
> >> Whew!!!
> >>
> >>      Thanks, Akira
> >>
> >>>
> >>> 							Thanx, Paul
> >>>
> >>>>          Thanks, Akira
> >>>>
> >>>>>
> >>>>> 							Thanx, Paul
> >>>>>
> >>>>>>         Thanks, Akira
> >>>>>>
> >>>>>>>
> >>>>>>> 							Thanx, Paul
> >>>>>>>
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>
> >>>
> >>
> > 
> > 
> 

