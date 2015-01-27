Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:45555 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1754246AbbA0Vkm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Tue, 27 Jan 2015
 16:40:42 -0500
Received: from /spool/local	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Tue, 27 Jan
 2015 14:40:41 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp03.boulder.ibm.com
 (Postfix) with ESMTP id 98BF919D8040	for <perfbook@vger.kernel.org>; Tue, 27
 Jan 2015 14:31:50 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com
 [9.17.195.167])	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0)
 with ESMTP id t0RLdKfA21954614	for <perfbook@vger.kernel.org>; Tue, 27 Jan
 2015 14:39:20 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t0RLed4Y023449	for <perfbook@vger.kernel.org>; Tue, 27 Jan 2015 14:40:39
 -0700
Date: Tue, 27 Jan 2015 13:40:37 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: another typos in perfbook
Message-ID: <20150127214036.GE19109@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAGfuzXQO4MLgXk=g3cSM+JoKxMSPXm+BpibATYCdXO2Ouo_S_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAGfuzXQO4MLgXk=g3cSM+JoKxMSPXm+BpibATYCdXO2Ouo_S_Q@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Motohiro Kanda <kanda.motohiro@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Jan 27, 2015 at 10:37:22PM +0900, Motohiro Kanda wrote:
> Hi, this might sounds too picky, but here are another typos in perfbook.

Not at all, thank you for your careful review and feedback!

> In Quick Quiz 4.24 on page 46, it says,
> Linux-kernel equivalents to fork() and join()?
> You mean
> fork() and wait()?
> Table 4.1 already has pthread join.

Good catch, fixed!

> In Quick Quiz 5.60 on page 83 it says,
> update-side signals over read-side atomic operations
> 
> And in Section 5.6 Parallel Counting Discussion, on page 82, paragraph
> starting with
> "Figure 5.2 shows", it says
> penalty can be reduced by substituting read-side signals for
> update-side atomic operations.
> 
> These looks odd, because signal and atomic operations are both on update-side.

Good eyes!  The "read-side" and "update-side" weren't adding much aside
from confusion, so I removed them.  In addition, the Quick Quiz answer
was using outdated performance results, so I fixed that as well.

> add_count in Figure 5.18 has atomic_cmpxchg.
> add_count in Figure 5.25 calls flush_local_count, which sends a
> signal, wait until ready, and do the thieving.
> 
> So, they should read
> update-side signals over atomic operations
> and
> update-side signals for atomic operations.

I will stick with removing the "update-side" as well as the "read-side".  ;-)

> In section 5.4.1 Atomic Limit Counter Implementation, on page 69 says,
> Otherwise, line 11 combines an updated counter
> it should read
> line 12

Good catch, fixed!

> in Quick Quiz 5.43 on page 71, it says,
> What prevents concurrent execution of the fastpath of either atomic_add() or
> atomic_sub()
> 
> It should read add_count and sub_count.

Again, good catch, and again, fixed!

> In section 11.7.4 Microbenchmarking, on page 287, it says,
> The first and third sources of interference provide conflicting advice
> it should read
> The first and 4-th sources
> 
> because 4th item suggests reducing the number of iterations.

Good eyes, fixed!

> In section 15.3 Shaving the Mandelbrot Set, on page 390, in the second
> paragraph says,
> The to-be-shaven solution is to unconditionally acquire the locks in list order
> it should read
> in any order
> because third approach in the previous paragraph has already mentioned
> "list order" and
> the trick here is there are N threads and N+1 objects so no threads
> will be starved, right?

The "list order" is correct here.  If we allowed locks to be acquired
in any order, deadlock could still result because each thread must
acquire up to three locks, namely the predecessor, the element, and
the successor.  Suppose that Thread A must acquire the locks for elements
1, 2, and 3, and that Thread B must acquire the locks for elements 2, 3,
and 4.  If the two threads are allowed to acquire the locks in any order,
Thread A might acquire 3, then 2, then 1, while Thread B might acquire
2, then, 3, then 4.  This could result in deadlock, with thread A holding
3 and acquiring 2 and thread B holding 2 and acquiring 3.

> Finally, in section 11.7.1 Benchmarking on page 285, it says
> benchmarks serve three major purposes:
> and you mention four.
> 
> You might say that the fourth one, "as a marketing tool" should not be
> in "major purposes".
> Or, you might be playing the "Spanish Inquisition" sketch :-)

I guess I was inadvertently playing that sketch.  ;-)

Fixed!

> By the way, Japanese translation of Chapter 2 and 5, including their
> quick quiz answers
> has been completed.Chapter 9 is 70% done.

Nice!!!  You are translating the first edition, or some other version?

> I am not good at TeX publishing, so they are in plain text now.

Your choice on that one.  I am not sure how well LaTeX deals with
Japanese characters in any case!

							Thanx, Paul

> Regards,
> --
> Kanda Motohiro at
> https://sites.google.com/site/kandamotohiro/perfbook
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

