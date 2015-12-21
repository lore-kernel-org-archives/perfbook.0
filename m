Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e38.co.us.ibm.com ([32.97.110.159]:38733 "EHLO
 e38.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750965AbbLUPoU (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 21 Dec 2015
 10:44:20 -0500
Received: from localhost	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Mon, 21 Dec
 2015 08:44:19 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id DFDB11FF0042	for <perfbook@vger.kernel.org>; Mon, 21
 Dec 2015 08:32:27 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBLFiHit26804246	for <perfbook@vger.kernel.org>; Mon, 21 Dec 2015 08:44:17
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBLFiG4i009005	for <perfbook@vger.kernel.org>; Mon, 21 Dec 2015 08:44:16
 -0700
Date: Mon, 21 Dec 2015 07:28:08 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Approximate structure-allocation limit problem improvement
Message-ID: <20151221152808.GJ4054@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CABy3NjQQF+Kr+9MYmWVHY=b-d=NdOjTpiHMaKhuZzBECyDzOCA@mail.gmail.com>
 <20151218180346.GQ4054@linux.vnet.ibm.com>
 <CABy3NjQsQqO12v3H76ejk6-3iaBK5fjkXOUsaLuexPzM1himSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABy3NjQsQqO12v3H76ejk6-3iaBK5fjkXOUsaLuexPzM1himSw@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Colin Pitrat <colin.pitrat@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Dec 21, 2015 at 04:18:56PM +0100, Colin Pitrat wrote:
> In fact, my point is exactly that we don't want to compare against
> zero, we're just doing it to not underflow our counters ! That's why
> in the code of the "Approximate structure-allocation limit problem",
> sub_count handles 0 in a way that is symmetrical to the way add_count
> handles the allocation limit that we want to enforce.
> 
> The issue is that it raise the following question: what to do when
> both the thread counter (_ counter _) and the globalized counter (_
> global_count _) are too small to substract delta ? It necessarly means
> that some other thread counter is non-zero and the sum of all counters
> is greater than delta, as we know a structure of size delta is still
> allocated.
> 
> This issue is highlighted in the book in paragraph 5.3.3 Simple Limit
> Counter discussion, with the sentence "Similarly, sub_ count() can
> fail even when the aggregate value of the counter is nowhere near
> zero."
> 
> For example, just after program starts (all counters are 0): thread A
> allocates a structure of size 10. Counter of thread A is 10, global
> counter and counter of thread B are both 0. The structure ownership is
> passed to thread B that wants to deallocate it. But sub_count finds
> that thread B counter is 0 so it takes the slow path, checking global
> counter that is also 0. It therefore fails. What should the program do
> in this case ? Keep the structure and try to deallocate it later ?
> 
> My proposition is to add a global "deallocated_size". In the slow path
> of sub_count, if delta cannot be substracted then it is added to
> deallocated_size and sub_count always succeeds. On the next
> globalize_count, deallocated_size will be reduced as much as possible.
> 
> Are my explanation clearer (sorry if not !) ? Am I missing a flow with
> this proposal ?

This explanation is very clear, thank you!  I had forgotten that the
solution in the book checks for both zero and the limit.

I would welcome a patch containing code and text for a solution that
checks only the limit.  The current solution could then be placed in
the answer to a Quick Quiz that asked about checking for limits and
also checking for bugs due to underflow (which might happen due to
double free -- though to your point, there are better ways of checking
for double free).

							Thanx, Paul

> Regards,
> Colin
> 
> 2015-12-18 19:03 GMT+01:00 Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> > On Wed, Dec 16, 2015 at 02:21:45PM +0100, Colin Pitrat wrote:
> >> Hello,
> >>
> >> in chapter 5 (Counting), in the paragraph concerning "Approximate
> >> structure-allocation limit problem", it is said:
> >>
> >> "Similarly, sub_count() can fail even when the aggregate value of the
> >> counter is nowhere near zero. In many cases, this is unacceptable."
> >>
> >> In the case of the Quick Quiz 5.3 question, it's true that it's quite
> >> a problem if it means freeing the structure fails because the counter
> >> cannot be updated ! And freeing it without updating the counter means
> >> the counter shifts from reality.
> >>
> >> However, the very existence of the structure is a guarantee that the
> >> real (total) counter value cannot be 0 or less than delta, so couldn't
> >> we imagine to always succeed the sub_count operation by keeping a
> >> global negative offset ? In the slow path, after globalize_count, if
> >> the global count is lower than delta then we set it to 0 and we
> >> increment the negative offset by what remains.
> >>
> >> On the next slow path operation during a add_count, this negative
> >> offset can be removed (or reduced) by reducing the local counter of
> >> the thread by the same value.
> >>
> >> This improvement over the proposed solution make it an acceptable
> >> answer for the quick quiz 5.3 whereas it isn't without.
> >>
> >> What do you think ?
> >> Should I spend a bit of time writing a paragraph and a code sample about it ?
> >
> > I must confess that I have read this message a few times, and still don't
> > understand what you are getting at.  Part of my trouble is that I am
> > not sure why you are comparing against zero -- the structure-allocation
> > problem only needs to compare against the limit.  But you might mean
> > zero after offset, or you might be talking about some related problem.
> >
> > So perhaps a paragraph and sample code would help me understand the
> > problem you are looking at and your example solution.
> >
> >                                                         Thanx, Paul
> >
> 

