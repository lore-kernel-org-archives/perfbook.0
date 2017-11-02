Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56686 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S933888AbdKBCxE (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed,
 1 Nov 2017 22:53:04 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vA22mdFK058689
 for <perfbook@vger.kernel.org>; Wed, 1 Nov 2017 22:53:03 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2dyrjb6kmv-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Wed,
 01 Nov 2017 22:53:03 -0400
Received: from localhost by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Wed, 1 Nov 2017
 22:53:02 -0400
Date: Wed, 1 Nov 2017 19:52:59 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ARMv8 != arm64
Reply-To: paulmck@linux.vnet.ibm.com
References: <2ce74586-5ac7-db14-f4e0-2aad297d8481@gmail.com>
 <20171101225251.GZ3659@linux.vnet.ibm.com>
 <73ab3c41-132f-56e0-8647-9fe1ee526d58@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73ab3c41-132f-56e0-8647-9fe1ee526d58@gmail.com>
Message-Id: <20171102025259.GA3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 02, 2017 at 08:22:46AM +0900, Akira Yokosawa wrote:
> On 2017/11/01 15:52:51 -0700, Paul E. McKenney wrote:
> > On Thu, Nov 02, 2017 at 07:34:28AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> In Section 15.4.3, you are treating ARMv8 as 64-bit CPU.
> >> However, ARMv8 has 32-bit modes A32 and T32.
> >> Instructions for load-acquire/store-release are also available in A32
> >> and T32 modes of ARMv8.
> >>
> >> The opening paragraph of Section 15.4.3 needs some rework, I guess.
> > 
> > Ah, thank you!  How about the following?
> 
> Looks good to me!
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Glad you like it, added your ack and pushed it.  ;-)

							Thanx, Paul

>     Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 1a41fa1352ff77c3a09a4d182649e571735d7f1c
> > Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > Date:   Wed Nov 1 15:51:06 2017 -0700
> > 
> >     memorder: ARMv8 includes 32-bit capability
> >     
> >     Reported-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 94e125ab3412..446f4804af53 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -4485,10 +4485,11 @@ lines~3 and~4 would enforce ordering between lines~1 and~5.
> >  \ContributedBy{Figure}{fig:memorder:Half Memory Barrier}{Melissa Brossard}
> >  \end{figure}
> >  
> > -ARMv8 is ARM's 64-bit CPU~\cite{ARMv8A:2017},
> > -in contrast to their 32-bit CPU described in
> > +ARMv8 is ARM's new CPU family~\cite{ARMv8A:2017}
> > +which includes 64-bit capabilities,
> > +in contrast to their 32-bit-only CPU described in
> >  Section~\ref{sec:memorder:ARMv7-A/R}.
> > -ARMv8's memory model closely resembles its 32-bit counterpart,
> > +ARMv8's memory model closely resembles its ARMv7 counterpart,
> >  but adds load-acquire (\co{LDLARB}, \co{LDLARH}, and \co{LDLAR})
> >  and store-release (\co{STLLRB}, \co{STLLRH}, and \co{STLLR})
> >  instructions.
> > @@ -4569,7 +4570,7 @@ being weakly ordered by default, but respecting dependencies.
> >  MIPS has a wide variety of memory-barrier instructions, but ties them
> >  not to hardware considerations, but rather to the use cases provided
> >  by the Linux kernel and the C++11 standard~\cite{RichardSmith2015N4527}
> > -in a manner similar to the ARM64 additions:
> > +in a manner similar to the ARMv8 additions:
> >  
> >  \begin{description}[style=nextline]
> >  \item[\tco{SYNC}]
> > 
> > 
> 

