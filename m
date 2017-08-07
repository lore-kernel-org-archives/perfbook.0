Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36154 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751493AbdHGQ5V (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 7
 Aug 2017 12:57:21 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v77GsH1P128998
 for <perfbook@vger.kernel.org>; Mon, 7 Aug 2017 12:57:21 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2c6st9y3sy-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 07 Aug 2017 12:57:20 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 7 Aug 2017
 12:57:19 -0400
Date: Mon, 7 Aug 2017 09:57:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronization between two process without lock
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiNqJzKk747hHNLVUxKNBMveS5bO1B--BKrm05Xb-1Ncpw@mail.gmail.com>
 <CAJYFCiOE9MBj+t_biHVvzso6XZWvuYGH-xhxF3TKyKQVDqJRHw@mail.gmail.com>
 <20170804195049.GF3730@linux.vnet.ibm.com>
 <CAJYFCiN4dfU8aUy3ogBig2M+AeqqtM32wWKgCXyu7GdpnsnOmQ@mail.gmail.com>
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiP0u4pKn56e5mKJebgU5P6KjxjUkkb9FTkJXc_wvisXMA@mail.gmail.com>
Message-Id: <20170807165718.GW3730@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Aug 08, 2017 at 12:48:08AM +0800, Yubin Ruan wrote:
> 2017-08-05 9:02 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > 2017-08-05 3:50 GMT+08:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> >> On Fri, Aug 04, 2017 at 11:57:28PM +0800, Yubin Ruan wrote:
> >>> 2017-08-04 22:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> >>> > Hi,
> >>> > I am sure the subject explain my intention. I got two processes trying
> >>> > to modifying the same place. I want them to do it one after one, or,
> >>> > if their operations interleave, I would like to let them know that the
> >>> > content have been changed and polluted by the other so that the
> >>> > content should be given up. That is, I would rather give up the data,
> >>> > if polluted, than having a false one.
> >>> >
> >>> > I try to set a atomic ref counter, but it seems impossible to do that
> >>> > without a lock to synchronize.
> >>> >
> >>> > Note that I don't want a strict synchronization: the situation is a
> >>> > lot better. The data can be given up if that place has been polluted.
> >>>
> >>> Let's explain some of my reasoning: if process A use some flag to
> >>> indicate that it has entered the critical region, then if it crash
> >>> before it can reset the flag, all following processes cannot enter
> >>> that region. But if process A cannot use flag for indication, how to
> >>> other people know (how to synchronization)?
> >>
> >> The simplest approach is to guard the data with a lock.
> >
> > Indeed. But if a process get killed then it will have no chance to release
> > the lock...
> >
> > By the way, do you know whether there are any chances that a thread get
> > killed by another thread when doing some "small" things? I mean something
> > like this:
> >
> >     lock();
> >     some_mem_copying();
> >     unlock();
> >
> > Are there any chance that a thread get killed by another thread before it
> > can "unlock()", without the entire process going down?

Indeed, that is possible.  The pthread_kill() system call if nothing
else.

> pthread_mutexattr_setrobust(..) will help in this situation, although it is
> quite painful that nobody is maintaining the NPTL docs currently and you have
> to dive into the source code if you want to make sure the semantic is exactly
> what you want.

True on all counts.  But what exactly are you trying to achieve?
Note that killing a thread not holding any lock can be a problem, for
example, suppose the thread that is to place a new element gets killed
just before doing so.  How do you intend to handle that situation?

> Yubin
> 
> >> But if you don't want to do that, another approach is to restrict the
> >> data to one machine word minus one bit, with zero saying that the location
> >> is (as you say) unpolluted.  Then you can use a compare-and-swap loop
> >> to update the location only if it is unpolluted.
> >>
> >> But maybe you need more data.  If so, you can have the data separately
> >> (perhaps dynamically allocated, perhaps not, your choice), and then use
> >> the compare-and-swap method above where NULL says unpolluted.
> >
> > Good suggestion... although I think it would be pretty painful.

Well, if you are going for full-up fault tolerance, you are in for a
world of pain regardless.  Fault tolerance is non-trivial any way you
look at it.

Therefore, my advice is to very carefully work out what your users really
need, and implement exactly that.  Doing "just a bit more" in this area
usually means incurring a huge amount more pain, often incurred later
in the project.

							Thanx, Paul

