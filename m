Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38481 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752157AbdGFAqL (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 5
 Jul 2017 20:46:11 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v660hdCv086858
 for <perfbook@vger.kernel.org>; Wed, 5 Jul 2017 20:46:10 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2bgwemt9xk-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 05 Jul 2017 20:46:10 -0400
Received: from localhost by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 5 Jul 2017
 20:46:09 -0400
Date: Wed, 5 Jul 2017 17:46:09 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <030d74ba-e816-cde6-5c31-a0cf25a3b320@gmail.com>
Message-Id: <20170706004609.GP2393@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jul 06, 2017 at 07:40:45AM +0900, Akira Yokosawa wrote:
> On 2017/07/06 7:32, Paul E. McKenney wrote:
> > On Thu, Jul 06, 2017 at 07:15:24AM +0900, Akira Yokosawa wrote:
> >> On 2017/07/05 10:32:49 -0700, Paul E. McKenney wrote:
> > 
> > [ . . . ]
> > 
> >>>>> So I cannot go with "volatile", but let's see if I can do something
> >>>>> better than the gcc intrinsics.
> >>>>
> >>>> And if the litmus7 guys don't have anything for me, I can always write a
> >>>> script to do the conversions.  So either way, we will have kernel-style
> >>>> notation at some point.  ;-)
> >>>
> >>> And it turns out that the contents of a second "{}" in a litmus7 test
> >>> is pulled directly into the output code, so an easy change.  ;-)
> >>
> >> Good news!
> >>
> >> So __atomic_thread_fence() will also be replaced with smp_mb() in
> >> the litmus tests? That will reduce the width of the tables and eliminate
> >> the need for the hspece adjustments in one-column layout.
> > 
> > Oops, I forgot to push!  Done now.
> > 
> > And yes, there is now smp_mb() in the litmus tests and the tables.
> 
> I'll take a look later.
> As I mentioned earlier, __atomic_load_n() and __atomic_store_n() seem
> to have fairly large overheads (on x86). You might want to see the changes
> in the resulting statistics and reflect them in the text.

I am getting a fair amount of variance on the results, and thus a
fair amount of overlap in the number of times each scenario shows up.
Perhaps I should say that and also state that different hardware will
likely get different results?

							Thanx, Paul

