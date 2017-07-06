Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45949 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751751AbdGFSUU (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Thu, 6 Jul 2017 14:20:20 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v66IEEgG062923
 for <perfbook@vger.kernel.org>; Thu, 6 Jul 2017 14:20:14 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bhqu86scd-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 06 Jul 2017 14:20:14 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 6 Jul 2017
 14:20:13 -0400
Date: Thu, 6 Jul 2017 11:20:10 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync: Fix store-buffering sequence table
Reply-To: paulmck@linux.vnet.ibm.com
References: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
 <20170704222138.GR2393@linux.vnet.ibm.com>
 <73696d24-1e3d-68cf-5bc2-f15390883bdc@gmail.com>
 <20170705154024.GU2393@linux.vnet.ibm.com>
 <20170705155004.GB29379@linux.vnet.ibm.com>
 <20170705173249.GA22308@linux.vnet.ibm.com>
 <81458845-cd7c-1cf0-cb45-d346846d14d7@gmail.com>
 <20170705223218.GH2393@linux.vnet.ibm.com>
 <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
 <f1f201bd-0108-f328-b606-b1d95b4998b9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1f201bd-0108-f328-b606-b1d95b4998b9@gmail.com>
Message-Id: <20170706182010.GL2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 06, 2017 at 09:09:05PM +0900, Akira Yokosawa wrote:
> On 2017/07/06 7:40 +0900, Akira Yokosawa wrote:
> > On 2017/07/06 7:32, Paul E. McKenney wrote:
> >> On Thu, Jul 06, 2017 at 07:15:24AM +0900, Akira Yokosawa wrote:
> >>> On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
> >>
> >> [ . . . ]
> >>
> >>>>>> So I cannot go with "volatile", but let's see if I can do something
> >>>>>> better than the gcc intrinsics.
> >>>>>
> >>>>> And if the litmus7 guys don't have anything for me, I can always write a
> >>>>> script to do the conversions.  So either way, we will have kernel-style
> >>>>> notation at some point.  ;-)
> >>>>
> >>>> And it turns out that the contents of a second "{}" in a litmus7 test
> >>>> is pulled directly into the output code, so an easy change.  ;-)
> >>>
> >>> Good news!
> >>>
> >>> So __atomic_thread_fence() will also be replaced with smp_mb() in
> >>> the litmus tests? That will reduce the width of the tables and eliminate
> >>> the need for the hspece adjustments in one-column layout.
> >>
> >> Oops, I forgot to push!  Done now.
> >>
> >> And yes, there is now smp_mb() in the litmus tests and the tables.
> > 
> > I'll take a look later.
> > As I mentioned earlier, __atomic_load_n() and __atomic_store_n() seem
> > to have fairly large overheads (on x86). You might want to see the changes
> > in the resulting statistics and reflect them in the text.
> 
> Hi Paul,
> 
> The definition of READ_ONCE() and WRITE_ONCE() given in the updated litmus
> tests is inconsistent with kernel API. They are accepting pointers such
> as x0 and x1.
> 
> In the article at LWN (https://lwn.net/Articles/720550/), litmus tests use the
> same definition as kernel API. They take the value expression such as *x0 and *x1.
> 
> My preference is to accept pointers as arguments as is the way in C functions,
> but the kernel community have chosen otherwise. We should be consist here.
> 
> So the definition should be:
> 
> ---
> #define READ_ONCE(x) __atomic_load_n(&(x), __ATOMIC_RELAXED)
> #define WRITE_ONCE(x, v) __atomic_store_n(&(x), (v), __ATOMIC_RELAXED)
> #define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
> ---
> 
> Or am I misreading?

No, you are correct!  I added a commit to fix this, and also added
a disclaimer as you suggested in your earlier email.

							Thanx, Paul

