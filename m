Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53916 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752443AbdKLB3I (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 11
 Nov 2017 20:29:08 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAC1T34B019684
 for <perfbook@vger.kernel.org>; Sat, 11 Nov 2017 20:29:08 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e6apsb9k9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 11 Nov 2017 20:29:08 -0500
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 11 Nov
 2017 20:29:06 -0500
Date: Sat, 11 Nov 2017 17:29:03 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross
 compiling
Reply-To: paulmck@linux.vnet.ibm.com
References: <d39e4d4f-4c4a-b72a-0fcf-8e244aa91c1e@gmail.com>
 <61f6fcf3-480c-8ba4-a4b2-4af17546b53f@gmail.com>
 <488587ce-a895-3079-0578-ff31f128f7ea@gmail.com>
 <20171111164438.GU3624@linux.vnet.ibm.com>
 <20171111165723.GA26014@linux.vnet.ibm.com>
 <af50453a-e7a8-77a7-275e-8dbdcc797fea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af50453a-e7a8-77a7-275e-8dbdcc797fea@gmail.com>
Message-Id: <20171112012903.GX3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 12, 2017 at 08:26:21AM +0900, Akira Yokosawa wrote:
> On 2017/11/11 08:57:23 -0800, Paul E. McKenney wrote:
> > On Sat, Nov 11, 2017 at 08:44:38AM -0800, Paul E. McKenney wrote:
> >> On Sat, Nov 11, 2017 at 08:56:01AM +0900, Akira Yokosawa wrote:
> >>> On 2017/11/11 08:41:54 +0900, Akira Yokosawa wrote:
> >>>> >From 6ecff66f2b5f95e914d90e29b6d0a2eb4d8901cc Mon Sep 17 00:00:00 2001
> >>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>> Date: Sat, 11 Nov 2017 08:25:34 +0900
> >>>> Subject: [PATCH 3/3] CodeSamples/formal: Get rid of warnings in cross compiling
> >>>>
> >>>> Also fix corresponding code snippet.
> >>>>
> >>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>> ---
> >>>>  CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus | 2 --
> >>>
> >>> By the way Paul, didn't you have a plan to mention these "C-2+2W" litmus tests
> >>> somewhere in the memorder chapter?
> >>
> >> Good point, it is an odd corner case that is worth at least a quick quiz.
> >> How about the following?
> > 
> > My fingers just keep automatically typing "Figure", so please see a
> > corrected patch below.  Presumably my fingers will get with the program
> > in a few months.  ;-)
> 
> ;-) ;-)
> 
> Please see inline (nitpicking) comments below.
> 
> Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit ac730edc868b6c8a9a71637fd205553e7ba88df2
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Sat Nov 11 08:41:47 2017 -0800
> > 
> >     memorder: Add a quick quiz for the 2+2W litmus tests
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 7d8e4978fa6d..2ef8363fba6a 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -2455,7 +2455,103 @@ same variable is not necessarily the store that started last.
> >  This should not come as a surprise to anyone who carefully examined
> >  Figure~\ref{fig:memorder:A Variable With More Simultaneous Values}.
> >  
> > -But sometimes time is on our side, as shown in the next section.
> > +\begin{listing}[tbp]
> > +{ \scriptsize
> > +\begin{verbbox}[\LstLineNo]
> > +C C-2+2W+o-wmb-o+o-wmb-o
> > +{
> > +}
> > +
> > +{
> > +#include "api.h"
> > +}
> 
> 2nd parentheses should be removed in code snippets.
> 
> > +
> > +P0(int *x0, int *x1)
> > +{
> > +	WRITE_ONCE(*x0, 1);
> > +	smp_wmb();
> > +	WRITE_ONCE(*x1, 2);
> > +}
> 
> Need to convert "tab" -> "  ".

Good catches, fixed.

> > +
> > +
> > +P1(int *x0, int *x1)
> > +{
> > +	WRITE_ONCE(*x1, 1);
> > +	smp_wmb();
> > +	WRITE_ONCE(*x0, 2);
> > +}
> > +
> > +exists (x0=1 /\ x1=1)
> > +\end{verbbox}
> > +}
> > +\centering
> > +\theverbbox
> > +\caption{2+2W Litmus Test With Write Barriers}
> > +\label{lst:memorder:2+2W Litmus Test With Write Barriers}
> > +\end{listing}
> > +
> > +\QuickQuiz{}
> > +	But for litmus tests having only ordered stores, as shown in
> > +	Listing~\ref{lst:memorder:2+2W Litmus Test With Write Barriers}
> > +	(\path{C-2+2W+o-wmb-o+o-wmb-o.litmus}),
> > +	research shows that the cycle is prohibited, even in weakly
> > +	ordered systems such as ARM and Power~\cite{test6-pdf}.
> > +	Given that, are store-to-store really \emph{always}
> > +	counter-temporal???
> > +\QuickQuizAnswer{
> > +	This litmus test is indeed a very interesting curiosity.
> > +	Its ordering apparently occurs naturally given typical
> > +	weakly ordered hardware design, which would normally be
> > +	considered a great gift from the relevant laws of physics
> > +	and cache-coherency-protocol mathematics.
> > +
> > +	Unfortunately, no one has been able to come up with a software use
> > +	case for this gift that does not have a much better alternative
> > +	implementation.
> > +	Therefore, neither the C11 nor the Linux kernel memory models
> > +	provide any guarantee corresponding to
> > +	Listing~\ref{lst:memorder:2+2W Litmus Test With Write Barriers}.
> 
> And the exists clause triggers by herd7 verification. (Redundant???)

Good point, added.

> > +
> > +\begin{listing}[tbp]
> > +{ \scriptsize
> > +\begin{verbbox}[\LstLineNo]
> > +C C-2+2W+o-o+o-o
> > +{
> > +}
> > +
> > +{
> > +#include "api.h"
> > +}
> 
> Ditto.
> 
> > +
> > +P0(int *x0, int *x1)
> > +{
> > +	WRITE_ONCE(*x0, 1);
> > +	WRITE_ONCE(*x1, 2);
> 
> Ditto.

And these.

> > +}
> > +
> > +
> > +P1(int *x0, int *x1)
> > +{
> > +	WRITE_ONCE(*x1, 1);
> > +	WRITE_ONCE(*x0, 2);
> > +}
> > +
> > +exists (x0=1 /\ x1=1)
> > +\end{verbbox}
> > +}
> > +\centering
> > +\theverbbox
> > +\caption{2+2W Litmus Test Without Write Barriers}
> > +\label{lst:memorder:2+2W Litmus Test Without Write Barriers}
> > +\end{listing}%
> > +%
> 
> These "%"s have no effect because of the blank line above the
> "listing" environment. You can remove them if you are OK with
> the following sentence starting a new paragraph.

OK, I removed them.  So we only need the "%"s if we want the figure
in the middle of a paragraph?

							Thanx, Paul

> > +	Of course, without the barrier, there are no ordering
> > +	guarantees, even on real weakly ordered hardware, as shown in
> > +	Listing~\ref{lst:memorder:2+2W Litmus Test Without Write Barriers}
> > +	(\path{C-2+2W+o-o+o-o.litmus}).
> > +} \QuickQuizEnd
> > +
> > +But sometimes time really is on our side.  Read on!
> >  
> >  \subsubsection{Happens-Before}
> >  \label{sec:memorder:Happens-Before}
> > 
> > 
> 

