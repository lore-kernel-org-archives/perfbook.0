Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52050 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S964922AbdKCAUS (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu,
 2 Nov 2017 20:20:18 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA30JVGp157337
 for <perfbook@vger.kernel.org>; Thu, 2 Nov 2017 20:20:18 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2e0akgg905-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Thu,
 02 Nov 2017 20:20:17 -0400
Received: from localhost by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Thu, 2 Nov 2017
 20:20:16 -0400
Date: Thu, 2 Nov 2017 17:20:13 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [NOT A PATCH] Question on regression by bug fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <8c6af34c-7cc5-492d-14c6-d6bc990da24b@gmail.com>
 <20171102235344.GF3624@linux.vnet.ibm.com>
 <b760802f-7736-323f-c4c4-200989a0e1fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b760802f-7736-323f-c4c4-200989a0e1fc@gmail.com>
Message-Id: <20171103002013.GG3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 03, 2017 at 09:07:43AM +0900, Akira Yokosawa wrote:
> On 2017/11/02 16:53:44 -0700, Paul E. McKenney wrote:
> > On Thu, Nov 02, 2017 at 11:19:45PM +0900, Akira Yokosawa wrote:
> >> Hi Paul
> >>
> >> I couldn't follow the reasoning around the following _artificial_ hunk.
> >>
> >> diff --git a/formal/regression.tex b/formal/regression.tex
> >> index 29cb787..9831b9d 100644
> >> --- a/formal/regression.tex
> >> +++ b/formal/regression.tex
> >> @@ -387,6 +387,7 @@ To see this, keep in mind that on average, every six fixes introduces
> >>  a bug.
> >>  Therefore, fixing the 24 bugs, which had a combine mean time to failure
> >>  of about 40,000 years, will introduce three more bugs.
> >> +???
> >>  These three bugs most likely fail more often than once per 13,000 years,
> >>  so the reliability of the software has decreased.
> >>
> >> Where did the "once per 13,000 years" come from?
> >> 13,000 was derived from 40,000/3?
> >>
> >> But in this argument, original 24 bugs are fixed, and 3 new bugs are introduced.
> >> We have no idea what failure rate the new bugs would have, don't we???
> >>
> >> What am I missing?
> > 
> > You are not missing much, but it looks like I was thinking backwards.
> > For one thing, I was using an outdated bug-injection rate, more recent
> > figures are 7%.  I updated this, (hopefully) fixed and clarified the
> > reasoning, and added a citation for the 7%.  How does the patch below
> > look?
> 
> Nice clarification! Now the reasoning is easy to follow.
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Applied and pushed, thank you!

							Thanx, Paul

>       Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit b1efdff66eb050317232dd36bd4b1385ed24524d
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Thu Nov 2 16:50:44 2017 -0700
> > 
> >     formal: Update bug-injection rate and clarify reasoning
> >     
> >     New data says 7% instead of 1-of-6, and the math was backwards.
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/formal/regression.tex b/formal/regression.tex
> > index 29cb78709f76..479ae020b518 100644
> > --- a/formal/regression.tex
> > +++ b/formal/regression.tex
> > @@ -374,28 +374,68 @@ type of validation effort.
> >  Clearly, false positives are to be avoided.
> >  But even in the absense of false postives, there are bugs and there are bugs.
> >  
> > -For example, suppose that a software artifact had exactly 24 remaining
> > +For example, suppose that a software artifact had exactly 100 remaining
> >  bugs, each of which manifested on average once every million years
> >  of runtime.
> >  Suppose further that an omniscient formal-verification tool located
> > -all 24 bugs, which the developers duly fixed.
> > +all 100 bugs, which the developers duly fixed.
> >  What happens to the reliability of this software artifact?
> >  
> > -The reliability \emph{decreases}.
> > +The perhaps surprising answer is that the reliability \emph{decreases}.
> >  
> > -To see this, keep in mind that on average, every six fixes introduces
> > -a bug.
> > -Therefore, fixing the 24 bugs, which had a combine mean time to failure
> > -of about 40,000 years, will introduce three more bugs.
> > -These three bugs most likely fail more often than once per 13,000 years,
> > -so the reliability of the software has decreased.
> > +To see this, keep in mind that historical experience indicates that
> > +about 7\% of fixes introduce a new bug~\cite{RexBlack2012SQA}.
> > +Therefore, fixing the 100 bugs, which had a combined mean time to failure
> > +(MTBF) of about 10,000 years, will introduce seven more bugs.
> > +Historical statistics indicate that each new bug will have an MTBF
> > +much less than 70,000 years.
> > +This in turn suggests that the combined MTBF of these seven new bugs
> > +will most likely be much less than 10,000 years, which in turn means
> > +that the well-intentioned fixing of the original 100 bugs actually
> > +decreased the reliability of the overall software.
> > +
> > +\QuickQuiz{}
> > +	How do we know that the MTBFs of known bugs is a good estimate
> > +	of the MTBFs of bugs that have not yet been located?
> > +\QuickQuizAnswer{
> > +	We don't, but it does not matter.
> > +
> > +	To see this, note that the 7\% figure only applies to injected
> > +	bugs that were subsequently located: It necessarily ignores
> > +	any injected bugs that were never found.
> > +	Therefore, the MTBF statistics of known bugs is likely to be
> > +	a good approximation of that of the injected bugs that are
> > +	subsequently located.
> > +
> > +	A key point in this whole section is that we should be more
> > +	concerned about bugs that inconvenience users than about
> > +	other bugs that never actually manifest.
> > +	This of course is \emph{not} to say that we should completely
> > +	ignore bugs that have not yet inconvenienced users, just that
> > +	we should properly prioritize our efforts so as to fix the
> > +	most important and urgent bugs first.
> > +} \QuickQuizEnd
> > +
> > +\QuickQuiz{}
> > +	But the formal-verification tools should immediately find all the
> > +	bugs introduced by the fixes, so why is this a problem?
> > +\QuickQuizAnswer{
> > +	It is a problem because real-world formal-verification tools
> > +	(as opposed to those that exist only in the imaginations of
> > +	the more vociferous proponents of formal verification) are
> > +	not omniscient, and thus are only able to locate certain types
> > +	of bugs.
> > +	For but one example, formal-verification tools are unlikely to
> > +	spot a bug corresponding to an omitted assertion or, equivalently,
> > +	a bug corresponding to an omitted portion of the specification.
> > +} \QuickQuizEnd
> >  
> >  Worse yet, imagine another software artifact with one bug that fails
> > -once every day on average and 24 more that fail every million years
> > +once every day on average and 99 more that fail every million years
> >  each.
> > -Suppose that a formal-verification tool located the 24 million-year
> > +Suppose that a formal-verification tool located the 99 million-year
> >  bugs, but failed to find the one-day bug.
> > -Fixing the 24 bugs located will take time and effort, likely slightly
> > +Fixing the 99 bugs located will take time and effort, likely slightly
> >  decrease reliability, and do nothing at all about the pressing
> >  each-day failure that is likely causing much embarrassment and perhaps
> >  much worse besides.
> > 
> > 
> 

