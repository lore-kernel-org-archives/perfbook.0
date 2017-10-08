Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47514 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751308AbdJHQHm (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 8 Oct 2017 12:07:42 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v98G3rIA027003
 for <perfbook@vger.kernel.org>; Sun, 8 Oct 2017 12:07:41 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dfpcmhm49-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 08 Oct 2017 12:07:41 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 8 Oct 2017
 12:07:41 -0400
Date: Sun, 8 Oct 2017 09:07:38 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: synchronize with a non-atomic flag
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJYFCiMix3XfQ0Z=BMUO39eNssYcVLR-Y1zHee+QT9cBsVS3KA@mail.gmail.com>
 <CAJYFCiMpx4Y++K2C0yWbxKO7UqNY-MOgJWRsA6hipPWQc17wxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAJYFCiMpx4Y++K2C0yWbxKO7UqNY-MOgJWRsA6hipPWQc17wxg@mail.gmail.com>
Message-Id: <20171008160738.GZ3521@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On Sun, Oct 08, 2017 at 05:12:18PM +0800, Yubin Ruan wrote:
> 2017-10-06 13:52 GMT+08:00 Yubin Ruan <ablacktshirt@gmail.com>:
> > Hi,
> > I saw lots of discussions on the web about possible race when doing
> > synchronization between multiple threads/processes with lock or atomic
> > operations[1][2]. From my point of view most them are over-worrying.
> > But I want to point out some particular issue here to see whether
> > anyone have anything to say.
> >
> > Imagine two processes communicate using only a uint32_t variable in
> > shared memory, like this:
> >
> >     // uint32_t variable in shared memory
> >     uint32_t flag = 0;
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
> >             printf("process 2 running...\n");
> >             WRITE_ONCE(flag, 0); // let another process to run
> >         } else {
> >             continue;
> >         }
> >     }
> >
> > On X86 or X64, I expect this code to run correctly, that is, I will
> > got the two `printf' to printf one after one. That is because:
> >
> >     1) on X86/X64, load/store on 32-bits variable are atomic
> 
> Ah...this assumption is wrong at the first place. Atomic access on
> 4-bytes integers is guaranteed only when these integer is aligned on a
> 4-bytes memory address boundary...

Indeed, accesses crossing cachelines normally won't guarantee you
much of anything other than painful debugging sessions.  ;-)

						Thanx, Paul

> Yubin
> 
> >     2) I use READ_ONCE/WRITE_ONCE to prevent possibly harmful compiler
> > optimization on `flag'.
> >     3) I use only one variable to communicate between two processes,
> > so there is no need for any kind of barrier.
> >
> > Does anyone have any objection at that?
> >
> > I know using a lock or atomic operation will save me a lot of
> > argument, but I think those things are unnecessary at this
> > circumstance, and it matter where performance matter, so I am picky
> > here...
> >
> > Yubin
> >
> > [1]: https://software.intel.com/en-us/blogs/2013/01/06/benign-data-races-what-could-possibly-go-wrong
> > [2]: https://www.usenix.org/conference/osdi10/ad-hoc-synchronization-considered-harmful
> 

