Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58116 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750807AbdEAUqx (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 1 May 2017 16:46:53 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v41KXhSK099561
 for <perfbook@vger.kernel.org>; Mon, 1 May 2017 16:46:53 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2a6afv49a4-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Mon,
 01 May 2017 16:46:52 -0400
Received: from localhost by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 1 May 2017
 16:46:52 -0400
Date: Mon, 1 May 2017 13:46:53 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some question about memory model(consistency)
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170425130222.GA21476@master>
 <b95b7fe7-e8c0-465c-d9a2-7d94b15e68ab@gmail.com>
 <0cfad406-340d-7c92-095e-f9d2eaa9f167@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0cfad406-340d-7c92-095e-f9d2eaa9f167@gmail.com>
Message-Id: <20170501204653.GN3956@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
To: Yubin Ruan <ablacktshirt@gmail.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org

On Wed, Apr 26, 2017 at 11:49:33AM +0800, Yubin Ruan wrote:
> On 2017=E5=B9=B404=E6=9C=8825=E6=97=A5 23:19, Akira Yokosawa wrote:
> >On 2017/04/25 21:02:22 +0800, Yubin Ruan wrote:
> >>Hi,
> >>long time no see :)
> >
> >Hi Yubin,
> >
> >I'm afraid this is not a direct answer to your question.
> >But I'll try.
> >
> >>
> >>This email relates to some confusion about computer system memory mod=
el.
> >>Recently I spent sometime reading stuff about momery model and finall=
y I get
> >>to the subject of safety properties of concurrent data structure. Whe=
n
> >>discussing concurrent data structures, three important properties are=
 proposed:
> >>    1. quiescent consistency

This can be thought of a a weaker form of eventual consistency, which
is described here: http://queue.acm.org/detail.cfm?id=3D1466448

A rough description is that if everything goes quiet for some time,
everyone has a consistent view of the data.

> >>    2. sequential consistency

All CPUs agree on the order of all memory operations.

> >>    3. linearizability

Roughly similar to sequential consistency, but at a higher level.
Sequential consistency applies to memory accesses, but linearizability
applies to API calls for a given data structure.

However, there is -no- guarantee that data structure accessed on a
sequentially consistent system will be linearizable.

> >>But...hmm...I don't fully understand them. sad :(
> >>I know there might be someone in this lists to discuss these question=
s with, so
> >>I try to post them here. Any feedback is welcome.
> >>
> >>Let's start with some simple concepts to make this communication vali=
d.
> >>
> >>1. what exactly counts as a "Quiescence"?
> >>-------
> >>I understand the concept of quiescent consistency: An execution of a
> >>concurrent program is quiescently consistent if the method calls can =
be
> >>correctly arranged while still retaining the mutual order of calls
> >>separated by quiescence, a period of time where no method is being
> >>called in any thread
> >>
> >>Basically it can be illustrated very vividedly by the following figur=
es:
> >>
> >>    Program order specified:
> >>        <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
> >>                              ~~~~~~~
> >>                          (quiescence point)
> >>
> >>    Real execution order:
> >>        <--A--> <--C--> <--B-->   <--E--> <--D--> <--F-->
> >>                              ~~~~~~~
> >>                          (quiescence point)
> >>
> >>The above model is quiescent consistent because there is no execution
> >>reordering across the quiescence point. But this one is not:
> >>
> >>    Program order specified:
> >>        <--A--> <--B--> <--C-->   <--D--> <--E--> <--F-->
> >>                              ~~~~~~~
> >>                          (quiescence point)
> >>
> >>    Real execution order:
> >>        <--A--> <--B--> <--D-->   <--C--> <--E--> <--F-->
> >>                              ~~~~~~~
> >>                          (quiescence point)
> >>
> >>This one is NOT quiescent consistent because the reordering of D and =
E
> >>across the quiescent point.
> >>
> >>But, in real world program, how can we identify those quiescent point=
s?
> >>I mean, in a program like this:
> >>
> >>  1: q.enqueue(something)
> >>  2:
> >>  3: q.enqueue(something)
> >>  4:
> >>  5: k.enqueue(something)
> >>  6:
> >>  7: k.dequeue(something)
> >>
> >>which is a quiescent point/period? Is it 2 or 4 or 6?
> >
> >It depends on which set of API you use to enqueue and dequeue.
> >
> >Have you read through Section 9.5 "Read-Copy Update" in perfbook?
> >Especially, Figure 9.19 "RCU QSBR: Waiting for Pre-Existing Readers"
> >depicts "quiescent state based reclamation (QSBR)".
> >
> >Also, Section 9.5.5.9 "RCU Based on Quiescent States" explains its toy
> >implementation.
> >
> >On thing you might be missing here is that a quiescent state is *not*
> >necessarily a global state but can be a state local to an object to
> >be updated.
> >
> >Hope this could be a starting point for you.

Akira has it right.  And the definition of quiescence gets much more
tricky when you have multiple threads all accessing the same data
structure.  When only a single thread is accessing a given data structure=
,
it is almost always the case that the time periods between consecutive
pairs of API calls will all be quiscent states.

With multiple threads, things get much fuzzier because of the time
required for state changes to propagate through the system.  Yes, today's
computers are small and fast, but their size is not zero and the speed
of light is still finite.  ;-)

> Thanks for replying.
>=20
> I think I mix these concepts with real world implementation. From what =
I
> have read so far, these properties are only constraints that may or may
> *not* be respected by CPUs and compilers. CPUs/compilers are free to
> reorder instructions for optimization reasons, thus violating those
> consistency constraints. But in real world implementation, we have
> special techniques that we can use to "implement" those consistency
> constraints(e.g memory barriers, locks, etc).

That we do!

> Back to the question above, those quiescent point/period can be defined
> by ourselves, as long as we can carry out some implementations that
> respect the consistency constraints we want.

We can define them pretty much however we want.  But getting a -useful-
definition, now that is the trick!

> Hmm...maybe that is the so-called "consequence of knowing too much"...
> And I'd better go read more :)

If a little knowledge is a very dangerous thing, just imagine what you
could do with a lot of knowledge!  ;-)

							Thanx, Paul

> Thanks,
> Yubin
>=20
> >>
> >>I am not so a hardware guy and I don't have so much experience with m=
emory
> >>model. But I am really interested in these models because I think it
> >>provides foundation for concurrent programming and distributed system
> >>building, which is what I interested in.
> >>
> >>Any feedback is welcome :)
> >>
> >>Thanks
> >>Yubin
> >>--
> >>To unsubscribe from this list: send the line "unsubscribe perfbook" i=
n
> >>the body of a message to majordomo@vger.kernel.org
> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> >
>=20

