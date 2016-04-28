Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e36.co.us.ibm.com ([32.97.110.154]:46883 "EHLO
 e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752893AbcD1Q1y (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 28 Apr 2016
 12:27:54 -0400
Received: from localhost	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 28 Apr
 2016 10:27:53 -0600
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id
 019473E4003F	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 10:27:51 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3SGRoqB42729476	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 16:27:50
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3SGRoJV021087	for <perfbook@vger.kernel.org>; Thu, 28 Apr 2016 12:27:50
 -0400
Date: Thu, 28 Apr 2016 09:28:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some questions
Message-ID: <20160428162827.GJ4609@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <c95dbdd5-69f5-76f3-b678-08e78032ffd2@gmail.com>
 <20160427165357.GD4967@linux.vnet.ibm.com>
 <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
 <20160427225022.GK4967@linux.vnet.ibm.com>
 <b8f3c36c-3e3b-ebb4-11b3-2abed5ca2083@gmail.com>
 <20160427232807.GL4967@linux.vnet.ibm.com>
 <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Apr 29, 2016 at 12:39:09AM +0900, Akira Yokosawa wrote:
> On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
> > On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
> >> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
> >>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
> >>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
> [snip.
> >>>>> Please see attached for what it looks like to me.
> >>>>
> >>>> Well, this is identical to the one I built.
> >>>> So, do you intend to explicitly put numbers which show up fairly long time, and
> >>>> leave other cells blank even below changes of values denoted by (n) in italics?
> >>>
> >>> The blank cells represent cache misses.  The CPU is waiting for a read
> >>> to complete during that time.  A non-blank cell corresponds to a CPU
> >>> actually completing a read.
> >>
> >> Oh, I see. But this should be explained in the text, I think.
> > 
> > Good point!  I also added several other possibilities, including
> > interrupts and preemption.
> > 
> 
> So, I have a few questions regarding to the added explanation of blank cells.
> 
> According to the text, trace data used to create the table are said to be 
> obtained by a program that contains the code fragment shown in Figure 14.4.
> The loop in the code fragment will exit once it sees state.variable != mycpu.
> That means the actual program you used has an outer loop to record the
> changes of state.valuable for each cpu in the system, I suppose.
> Am I guessing right?

IIRC, the program just stuffed timestamps and values into a set of per-CPU
big arrays, then printed them out.  A script took these values as input,
and compacted identical state.

> If I am, (n)'s in the table denoting modification of variables must be
> entries in the trace data which were output from the outer loop, I think.

The (n)'s mark changes in value for a given CPU.

> However, in the table, there are a number of cases where (n)'s are followed
> by blanks just below itself. Does this mean fetched state.variables stay in
> the cache very briefly, but are (almost immediately) invalidated by a cache
> coherence mechanism? I can see interrupts and preemption would also cause the
> trace output to be suspended for a while.

It marks places where a given CPU saw a value momentarily.  As you say,
this could be due to cache invalidation, interrupts, preemption, etc.

> I'm not sure I have made out what the table means thus far, but am I seeing
> something close enough to what you intend the table to represent?

The main point is that different CPUs can disagree on the value of a given
variable at a given point in time.  The following diagram shows that
this disagreement is nevertheless bounded, in that all CPUs must agree
on the ordering of values for that variable.

							Thanx, Paul

