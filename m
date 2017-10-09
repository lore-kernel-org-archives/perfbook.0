Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34148 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751561AbdJICOg (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 8
 Oct 2017 22:14:36 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v992EUuA015481
 for <perfbook@vger.kernel.org>; Sun, 8 Oct 2017 22:14:36 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dftuj0ne0-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 08 Oct 2017 22:14:36 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 8 Oct 2017
 22:14:34 -0400
Date: Sun, 8 Oct 2017 19:14:33 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronize with a non-atomic flag
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <CAJYFCiMpx4Y++K2C0yWbxKO7UqNY-MOgJWRsA6hipPWQc17wxg@mail.gmail.com>
 <20171008160738.GZ3521@linux.vnet.ibm.com> <20171009084009.GA5758@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171009084009.GA5758@HP>
Message-Id: <20171009021433.GB3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On Mon, Oct 09, 2017 at 04:40:11PM +0800, Yubin Ruan wrote:
> On Sun, Oct 08, 2017 at 09:07:38AM -0700, Paul E. McKenney wrote:
> > On Sun, Oct 08, 2017 at 05:12:18PM +0800, Yubin Ruan wrote:
> > > 2017-10-06 13:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > > > Hi,
> > > > I saw lots of discussions on the web about possible race when doing
> > > > synchronization between multiple threads/processes with lock or atomic
> > > > operations[1][2]. From my point of view most them are over-worrying.
> > > > But I want to point out some particular issue here to see whether
> > > > anyone have anything to say.
> > > >
> > > > Imagine two processes communicate using only a uint32_t variable in
> > > > shared memory, like this:
> > > >
> > > >     // uint32_t variable in shared memory
> > > >     uint32_t flag = 0;
> > > >
> > > >     //process 1
> > > >     while(1) {
> > > >         if(READ_ONCE(flag) == 0) {
> > > >             do_something();
> > > >             WRITE_ONCE(flag, 1); // let another process to run
> > > >         } else {
> > > >             continue;
> > > >         }
> > > >     }
> > > >
> > > >     //process 2
> > > >     while(1) {
> > > >         if(READ_ONCE(flag) == 1) {
> > > >             printf("process 2 running...\n");
> > > >             WRITE_ONCE(flag, 0); // let another process to run
> > > >         } else {
> > > >             continue;
> > > >         }
> > > >     }
> > > >
> > > > On X86 or X64, I expect this code to run correctly, that is, I will
> > > > got the two `printf' to printf one after one. That is because:
> > > >
> > > >     1) on X86/X64, load/store on 32-bits variable are atomic
> > > 
> > > Ah...this assumption is wrong at the first place. Atomic access on
> > > 4-bytes integers is guaranteed only when these integer is aligned on a
> > > 4-bytes memory address boundary...
> > 
> > Indeed, accesses crossing cachelines normally won't guarantee you
> > much of anything other than painful debugging sessions.  ;-) 
> 
> I see similar interfaces in the Linux kernel source[1]:
> 
> 	#define atomic_set(v, i)	((v)->counter = (i))
> 	#define atomic_read(v)	((v)->counter)
> 
> which set and read 'atomically' from a atomic variable, and by `atomic', they
> simply mean:
> 
>     The setting is atomic in that the return values of the atomic operations by
>     all threads are guaranteed to be correct reflecting either the value that
>     has been set with this operation or set with another operation.
> 
>     The read is atomic in that the return value is guaranteed to be one of the
>     values initialized or modified with the interface operations if a proper
>     implicit or explicit memory barrier is used after possible runtime
>     initialization by any other thread and the value is modified only with the
>     interface operations.
> (but still, the compare-and-swap operations still involve lock)
> 
> Are those operations atomic because the `atomic_t' is defined as a struct
> 
> 	typedef struct { int counter; } atomic_t;
> 
> and therefore proper alignment and atomic attribute is guaranteed by the
> compiler and the CPU?

Yes, unless you take explicit action to force unalignment, usually
by allocating a block of memory and constructing an unaligned pointer
to the middle of it, but this is almost never a good thing to do.

>                       If I do something like this:
> 
>     atomic_t v = ATOMIC_INIT(0); // globally visible
> 
>     atomic_set(&v, 1); //process 1
> 
>     atomic_set(&v, 2); //process 2
> 
>     int i = atomic_read(&v); // process 3
> 
> will process 3 see any intermediate value between 1 and 2?

Given this code, process 3 should see only the values 0, 1, and 2.

							Thanx, Paul

> Yubin
> 
> [1]: Documentation/core-api/atomic_ops.rst
> 

