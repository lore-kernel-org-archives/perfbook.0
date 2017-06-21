Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50235 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750981AbdFUXG0 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 21
 Jun 2017 19:06:26 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5LN4Kok113288
 for <perfbook@vger.kernel.org>; Wed, 21 Jun 2017 19:06:25 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2b7w13e2t8-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 21 Jun 2017 19:06:25 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 21 Jun
 2017 19:06:24 -0400
Date: Wed, 21 Jun 2017 16:06:21 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
Reply-To: paulmck@linux.vnet.ibm.com
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
 <1d238a3f-1c64-e731-f344-5c4b86455bd0@gmail.com>
 <6130a59b-a467-a83f-ecf5-40a52036c745@gmail.com>
 <20170621174541.GJ3721@linux.vnet.ibm.com>
 <21fca4d8-6b10-7e0f-bf49-5ce8a05545ff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21fca4d8-6b10-7e0f-bf49-5ce8a05545ff@gmail.com>
Message-Id: <20170621230621.GV3721@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 22, 2017 at 07:46:57AM +0900, Akira Yokosawa wrote:
> On 2017/06/21 10:45:41 -0700, Paul E. McKenney wrote:
> > On Wed, Jun 21, 2017 at 07:55:34AM +0900, Akira Yokosawa wrote:
> >> On 2017/06/20 23:28, Akira Yokosawa wrote:
> >>> >From db0fd6b383b551eabecb12dfa21e42093f338b2f Mon Sep 17 00:00:00 2001
> >>> From: Akira Yokosawa <akiyks@gmail.com>
> >>> Date: Mon, 19 Jun 2017 23:55:31 +0900
> >>> Subject: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> ---
> >>>  appendix/toyrcu/toyrcu.tex | 12 ++++++------
> >>>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> >>> index 79fbe33..a7bf6ca 100644
> >>> --- a/appendix/toyrcu/toyrcu.tex
> >>> +++ b/appendix/toyrcu/toyrcu.tex
> >>> @@ -524,10 +524,10 @@ by complementing the value of \co{rcu_idx}, as in \co{rcu_idx = !rcu_idx}.
> >>>  Suppose that the old value of \co{rcu_idx} was zero, so that the new
> >>>  value is one.
> >>>  New readers that arrive after the complement operation will increment
> >>> -\co{rcu_idx[1]}, while the old readers that previously incremented
> >>> -\co{rcu_idx[0]} will decrement \co{rcu_idx[0]} when they exit their
> >>> +\co{rcu_refcnt[1]}, while the old readers that previously incremented
> >>> +\co{rcu_refcnt[0]} will decrement \co{rcu_refcnt[0]} when they exit their
> >>>  RCU read-side critical sections.
> >>> -This means that the value of \co{rcu_idx[0]} will no longer be incremented,
> >>> +This means that the value of \co{rcu_refcnt[0]} will no longer be incremented,
> >>>  and thus will be monotonically decreasing.\footnote{
> >>>  	There is a race condition that this ``monotonically decreasing''
> >>>  	statement ignores.
> >>> @@ -616,11 +616,11 @@ Lines~6 and 19 acquire and release \co{rcu_gp_lock} in order to
> >>>  prevent more than one concurrent instance of \co{synchronize_rcu()}.
> >>>  Lines~7-8 pick up the value of \co{rcu_idx} and complement it,
> >>>  respectively, so that subsequent instances of \co{rcu_read_lock()}
> >>> -will use a different element of \co{rcu_idx} that did preceding
> >>> +will use a different element of \co{rcu_refcnt} that did preceding
> >>>  instances.
> >>
> >> I have a little trouble with this sentence. Do you mean:
> >>
> >>              ..., so that subsequent instances of \co{rcu_read_lock()}
> >> will use a different element of \co{rcu_refcnt} from the one did preceding
> >> instances.                                      
> > 
> > Just to fully illustrate:
> > 
> > 1.	Suppose that rcu_idx is initially zero.
> > 
> > 2.	Any rcu_read_lock() invocations running at this point will
> > 	therefore be incrementing rcu_refcnt[0].
> > 
> > 3.	A synchronize_srcu() instance now complements rcu_idx, so that
> > 	its new value is one.
> > 
> > 4.	Any rcu_read_lock() invocations from step 2 that fetched rcu_idx
> > 	before step 3 completed will still increment rcu_refcnt[0].
> > 
> > 5.	However, any subsequent rcu_read_lock() invocations will instead
> > 	increment rcu_refcnt[1].  (At least until the next invocation
> > 	of synchronize_rcu().)
> > 
> > Does that help, or am I missing the point of your question?
> 
> Thanks. This is what I guessed you mean.
> 
> So what bothered me was the structure of the clause. I rarely see a sentence like:
> 
>     I will buy a different model of PC that did you.
> 
> I can't figure out the grammatical role of "that" here.

Color me blind!!!  The "that" should be "than".  My brain autocorrected on
first reading, so I couldn't even see it.  I queued the following patch.

							Thanx, Paul

------------------------------------------------------------------------

commit ed403934aeff63a46db4412d6a485f42d39daabd
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Wed Jun 21 16:03:43 2017 -0700

    toyrcu: Typo s/that/than/
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index a7bf6ca25616..3f19662aa1c2 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -616,7 +616,7 @@ Lines~6 and 19 acquire and release \co{rcu_gp_lock} in order to
 prevent more than one concurrent instance of \co{synchronize_rcu()}.
 Lines~7-8 pick up the value of \co{rcu_idx} and complement it,
 respectively, so that subsequent instances of \co{rcu_read_lock()}
-will use a different element of \co{rcu_refcnt} that did preceding
+will use a different element of \co{rcu_refcnt} than did preceding
 instances.
 Lines~10-12 then wait for the prior element of \co{rcu_refcnt} to
 reach zero, with the memory barrier on line~9 ensuring that the check

