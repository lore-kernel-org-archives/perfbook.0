Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e17.ny.us.ibm.com ([129.33.205.207]:48543 "EHLO
 e17.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752300AbcD3BFv (ORCPT	<rfc822;perfbook@vger.kernel.org>); Fri, 29 Apr 2016
 21:05:51 -0400
Received: from localhost	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Fri, 29 Apr
 2016 21:05:50 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 30E4538C8039
 for <perfbook@vger.kernel.org>; Fri, 29 Apr 2016 21:05:49 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3U15nv235782878	for <perfbook@vger.kernel.org>; Sat, 30 Apr 2016 01:05:49
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3U15msU025121	for <perfbook@vger.kernel.org>; Fri, 29 Apr 2016 21:05:49
 -0400
Date: Fri, 29 Apr 2016 18:05:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Some questions
Message-ID: <20160430010547.GI3686@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <2b39d2d5-962b-ce05-aa59-5569abdc4049@gmail.com>
 <20160427225022.GK4967@linux.vnet.ibm.com>
 <b8f3c36c-3e3b-ebb4-11b3-2abed5ca2083@gmail.com>
 <20160427232807.GL4967@linux.vnet.ibm.com>
 <428ce2d3-6d21-a97f-ce60-4b0635a7cbd6@gmail.com>
 <20160428162827.GJ4609@linux.vnet.ibm.com>
 <4cbb1be0-8d65-2f37-716f-f90723ab4cd7@gmail.com>
 <bce4d958-0333-6611-7e81-5461ecebaebd@gmail.com>
 <20160429171525.GA3686@linux.vnet.ibm.com>
 <225137b1-6cf3-7884-a508-66baec1519be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <225137b1-6cf3-7884-a508-66baec1519be@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 30, 2016 at 07:06:39AM +0900, Akira Yokosawa wrote:
> On 2016/04/30 2:15, Paul E. McKenney wrote:
> > On Sat, Apr 30, 2016 at 01:00:29AM +0900, Akira Yokosawa wrote:
> >> On 2016/04/29 8:05, Akira Yokosawa wrote:
> >>> On 2016/04/29 1:28, Paul E. McKenney wrote:
> >>>> On Fri, Apr 29, 2016 at 12:39:09AM +0900, Akira Yokosawa wrote:
> >>>>> On 2016/04/27 16:28:07 -0700, Paul E. McKenney wrote:
> >>>>>> On Thu, Apr 28, 2016 at 08:01:31AM +0900, Akira Yokosawa wrote:
> >>>>>>> On 2016/04/27 15:50:22 -0700, Paul E. McKenney wrote:
> >>>>>>>> On Thu, Apr 28, 2016 at 07:15:05AM +0900, Akira Yokosawa wrote:
> >>>>>>>>> On 2016/04/27 09:53:57 -0700, Paul E. McKenney wrote:
> >>>>> [snip.
> >>>>>>>>>> Please see attached for what it looks like to me.
> >>>>>>>>>
> >>>>>>>>> Well, this is identical to the one I built.
> >>>>>>>>> So, do you intend to explicitly put numbers which show up fairly long time, and
> >>>>>>>>> leave other cells blank even below changes of values denoted by (n) in italics?
> >>>>>>>>
> >>>>>>>> The blank cells represent cache misses.  The CPU is waiting for a read
> >>>>>>>> to complete during that time.  A non-blank cell corresponds to a CPU
> >>>>>>>> actually completing a read.
> >>>>>>>
> >>>>>>> Oh, I see. But this should be explained in the text, I think.
> >>>>>>
> >>>>>> Good point!  I also added several other possibilities, including
> >>>>>> interrupts and preemption.
> >>>>>>
> >>>>>
> >>>>> So, I have a few questions regarding to the added explanation of blank cells.
> >>>>>
> >>>>> According to the text, trace data used to create the table are said to be 
> >>>>> obtained by a program that contains the code fragment shown in Figure 14.4.
> >>>>> The loop in the code fragment will exit once it sees state.variable != mycpu.
> >>>>> That means the actual program you used has an outer loop to record the
> >>>>> changes of state.valuable for each cpu in the system, I suppose.
> >>>>> Am I guessing right?
> >>>>
> >>>> IIRC, the program just stuffed timestamps and values into a set of per-CPU
> >>>> big arrays, then printed them out.  A script took these values as input,
> >>>> and compacted identical state.
> >>>>
> >>>>> If I am, (n)'s in the table denoting modification of variables must be
> >>>>> entries in the trace data which were output from the outer loop, I think.
> >>>>
> >>>> The (n)'s mark changes in value for a given CPU.
> >>>>
> >>>>> However, in the table, there are a number of cases where (n)'s are followed
> >>>>> by blanks just below itself. Does this mean fetched state.variables stay in
> >>>>> the cache very briefly, but are (almost immediately) invalidated by a cache
> >>>>> coherence mechanism? I can see interrupts and preemption would also cause the
> >>>>> trace output to be suspended for a while.
> >>>>
> >>>> It marks places where a given CPU saw a value momentarily.  As you say,
> >>>> this could be due to cache invalidation, interrupts, preemption, etc.
> >>>>
> >>>>> I'm not sure I have made out what the table means thus far, but am I seeing
> >>>>> something close enough to what you intend the table to represent?
> >>>>
> >>>> The main point is that different CPUs can disagree on the value of a given
> >>>> variable at a given point in time.  The following diagram shows that
> >>>> this disagreement is nevertheless bounded, in that all CPUs must agree
> >>>> on the ordering of values for that variable.
> >>>
> >>> Yes, of course that's the main point.
> >>> I should have asked in a different way.
> >>>
> >>> There should be the same kind of situations in Figure 14.5.
> >>> But you didn't depict them in the figure.
> >>>
> >>> Why did you put the blank cells in the table in the first place?
> >>>
> >>> I'm a little bit distracted by those blank cells, and began questioning
> >>> about them.
> >>>
> >>> Isn't it enough to just do the same way in Table 14.2 as in Figure 14.5?
> >>>
> >>> Or, could the blank cell situation be explained in the form of an answer
> >>> of a quick quiz?  It would be much easier for me to grasp the main point
> >>> of this section "Variables Can Have More Than One Value" while reading the
> >>> body of the text.
> >>>
> >>> Thoughts?
> >>>
> >>>                                                    Thanks, Akira
> >>>
> >>>>
> >>>> 							Thanx, Paul
> >>>>
> >>>>
> >>>
> >>
> >> So I drew 2 figures based on Table 14.2.
> >> No, I didn't actually drew them but wrote a rough program to generate .fig
> >> format files from the value changes of each CPU extracted from Table 14.2.
> >> I ignored the blank cells in the table just as in Figure 4.5.
> >> Appended is a tar ball of two files.
> >> out.fig is the overall diagram, and out-2.fig is a zoomed in view of
> >> the beginning part.
> >> I think they can provide a fairly interesting view of what's going on.
> >>
> >> Please give a look at them.
> > 
> > Not bad, actually!
> > 
> > The solid black areas need to be hatched or grey, otherwise it is a bit
> > hard on printers.  The colored areas look OK to me, though that does
> > not necessarily count for much.  ;-)
> 
> I'll see what I can.
> 
> > 
> > Would you like to send a patch replacing the table with these diagrams
> > and updating the text appropriately?
> 
> I'd love to!
> And may I remove the explanation of the "white cell situation" for now?
> Or do you want to keep those info in another set of diagrams which would
> depict the unresponsive periods in some way (translucent hatch or something)
> so that you could refer to them in a quick quiz you might come up with
> some day? 

I could add a quick quiz to the effect of "What about cache-miss latency?"

Let's start with the simple diagram and see how it looks.

							Thanx, Paul

