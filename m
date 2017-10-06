Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49554 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751639AbdJFTMx (ORCPT <rfc822;perfbook@vger.kernel.org>); Fri, 6
 Oct 2017 15:12:53 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v96JARgv073809
 for <perfbook@vger.kernel.org>; Fri, 6 Oct 2017 15:12:53 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2deeuqasfd-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Fri,
 06 Oct 2017 15:12:53 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Fri, 6 Oct 2017
 15:12:51 -0400
Date: Fri, 6 Oct 2017 12:12:50 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronize with a non-atomic flag
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <a6e4d3a9-74c9-17c5-5aef-fc0ec83cfb34@gmail.com>
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiMCnyZnP1kCBAQfpGGd4PBkoMz5ALnkH2K2aqsmwjs+SA@mail.gmail.com>
Message-Id: <20171006191250.GH3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Fri, Oct 06, 2017 at 08:35:00PM +0800, Yubin Ruan wrote:
> 2017-10-06 20:03 GMT+08:00 Akira Yokosawa <akiyks@gmail.com>:
> > On 2017/10/06 14:52, Yubin Ruan wrote:

[ . . . ]

> > I/O operations in printf() might make the situation trickier.
> 
> printf(3) is claimed to be thread-safe, so I think this issue will not
> concern us.
> 
> > In a more realistic case where you do something meaningful in
> > do_something() in both threads:
> >
> >     //process 1
> >     while(1) {
> >         if(READ_ONCE(flag) == 0) {
> >             do_something();
> >             WRITE_ONCE(flag, 1); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }
> >
> >     //process 2
> >     while(1) {
> >         if(READ_ONCE(flag) == 1) {
> >             do_something();
> >             WRITE_ONCE(flag, 0); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }

In the Linux kernel, there is control-dependency ordering between
the READ_ONCE(flag) and any stores in either the then-clause or
the else-clause.  However, I see no ordering between do_something()
and the WRITE_ONCE().

> > and if do_something() uses some shared variables other than "flag",
> > you need a couple of memory barriers to ensure the ordering of
> > READ_ONCE(), do_something(), and WRITE_ONCE() something like:
> >
> >     //process 1
> >     while(1) {
> >         if(READ_ONCE(flag) == 0) {
> >             smp_rmb();
> >             do_something();
> >             smp_wmb();
> >             WRITE_ONCE(flag, 1); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }
> >
> >     //process 2
> >     while(1) {
> >         if(READ_ONCE(flag) == 1) {
> >             smp_rmb();
> >             do_something();
> >             smp_wmb();
> >             WRITE_ONCE(flag, 0); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }

Here, the control dependency again orders the READ_ONCE() against later
stores, and the smp_rmb() orders the READ_ONCE() against any later
loads.  The smp_wmb() orders do_something()'s writes (but not its reads!)
against the WRITE_ONCE().

> > In Linux kernel memory model, you can use acquire/release APIs instead:
> >
> >     //process 1
> >     while(1) {
> >         if(smp_load_acquire(&flag) == 0) {
> >             do_something();
> >             smp_store_release(&flag, 1); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }
> >
> >     //process 2
> >     while(1) {
> >         if(smp_load_acquire(&flag) == 1) {
> >             do_something();
> >             smp_store_release(&flag, 0); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }

This is probably the most straightforward of the above approaches.

That said, if you really want a series of things to execute in a
particular order, why not just put them into the same process?

							Thanx, Paul

> Yes it could be tricky when `do_something()' really do something that
> involved other shared variable.
> 
> Yubin
> 
> > The intention of the code is easier to see when you use well-defined APIs.
> > Just my two cents.
> >
> >               Thanks, Akira
> >
> >>                                                That is because:
> >>
> >>     1) on X86/X64, load/store on 32-bits variable are atomic
> >>     2) I use READ_ONCE/WRITE_ONCE to prevent possibly harmful compiler
> >> optimization on `flag'.
> >>     3) I use only one variable to communicate between two processes,
> >> so there is no need for any kind of barrier.
> >>
> >> Does anyone have any objection at that?
> >>
> >> I know using a lock or atomic operation will save me a lot of
> >> argument, but I think those things are unnecessary at this
> >> circumstance, and it matter where performance matter, so I am picky
> >> here...
> >>
> >> Yubin
> >>
> >> [1]: https://software.intel.com/en-us/blogs/2013/01/06/benign-data-races-what-could-possibly-go-wrong
> >> [2]: https://www.usenix.org/conference/osdi10/ad-hoc-synchronization-considered-harmful
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >
> 

