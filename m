Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39662 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726021AbeJaH3a (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 31 Oct 2018 03:29:30 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w9UMY70P083692
        for <perfbook@vger.kernel.org>; Tue, 30 Oct 2018 18:34:08 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nex0tcyhm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 30 Oct 2018 18:34:08 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 30 Oct 2018 22:33:59 -0000
Date: Tue, 30 Oct 2018 15:33:56 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: Release/edition plans
Reply-To: paulmck@linux.ibm.com
References: <20181018203414.GA19175@linux.ibm.com>
 <929eef9a-f1c7-22a8-b5bc-f95f6f573b4c@gmail.com>
 <20181028171645.GM4170@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181028171645.GM4170@linux.ibm.com>
Message-Id: <20181030223356.GA9149@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 28, 2018 at 10:16:45AM -0700, Paul E. McKenney wrote:
> On Mon, Oct 29, 2018 at 12:19:56AM +0900, Akira Yokosawa wrote:
> > On 2018/10/18 13:34:14 -0700, Paul E. McKenney wrote:
> > > Hello!
> > > 
> > > I would normally have done a perfbook release by now, given that the last
> > > one was in November 2017.  My lame excuse is that creating 340 RCU/LKMM
> > > patches thus far this year turned out to be a bit harder than it looks.
> > > 
> > > My current thought is to get a release out in the next month or two,
> > > and to get the second edition out in 2019.
> > > 
> > > Thoughts?
> > 
> > I'd like to know your rough plan to reflect the LKMM/RCU updates to
> > perfbook. Those updates affect mostly Chapter 15 and Section 9.5.
> > 
> > I understand that perfbook will keep slightly out-of-date because of
> > the always moving goal post. ;-)
> 
> Indeed!  My thought was to add the locking portions of LKMM once plain
> accesses have been added, but please see below.  I don't believe that
> perfbook's wording was precise enough to care about the release-acquire
> strengthening.  SRCU and reader-writer locking are on the way, but it
> might be some time.  Anything else that I am missing?

Alpha now respects dependent reads, so I am also updating this.  ;-)

> I guess I should add RCU litmus tests to the formal-verification chapter
> under the Axiomatic Approaches section, with forward references to the
> memory-ordering chapter, and ditto for locking.  I would then add forward
> references from the locking chapter and RCU section to this material.

Which are now there.

							Thanx, Paul

> On RCU itself, I need to reflect the merging of the bh, preempt, and
> sched flavors (and also provide an updated LWN article on the RCU API).
> Also the disappearance of synchronize_rcu_mult().  I would also like to
> get some material from the Issaquah Challenge incorporated, though no
> promises on that one.  Anything else?  (Yes, I review the Linux-kernel
> API each time to find things.)
> 
> I would not delay a release for any of the above, but I should have a
> fair fraction done for the edition.  There is always a reason to delay,
> so some balance is required.
> 
> > Also, update of Style Guide is in my todo list to explain the new scheme
> > of code snippet handled by fancyvrb.  Hopefully, that can be done in a month
> > or so.  
> > 
> > OTOH, actual conversion of code snippets can take much longer. Labeling
> > lines in snippets is not trivial and can only be done one by one.
> > No need to harry in this respect, I suppose.
> 
> I would not delay a release for either of these, though my travel
> plans make it unlikely that I will release before the end of November
> in any case.  I hope to get significant time to work on perfbook near
> the end of the year as well.
> 
> I expect to release an electronic edition first, then a print edition
> a few months later.  The electronic edition convinces some people to
> take a close look, and their feedback improves the print edition.  At
> least that is what happened last time.
> 
> Thoughts?
> 
> 							Thanx, Paul

