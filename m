Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43934 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751546AbeDIV5u (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 9 Apr 2018 17:57:50 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w39LvUqd065414
 for <perfbook@vger.kernel.org>; Mon, 9 Apr 2018 17:57:50 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2h8euruu02-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Mon, 09 Apr 2018 17:57:49 -0400
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 9 Apr 2018
 17:57:49 -0400
Date: Mon, 9 Apr 2018 14:58:48 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] Fix labeling of appendix and section
Reply-To: paulmck@linux.vnet.ibm.com
References: <d3ea21c4-ba6f-46e3-15da-cd35d450b59d@gmail.com>
 <c07a5add-15e7-0c0a-b2ef-af96bbde7059@gmail.com>
 <20180409172133.GL3948@linux.vnet.ibm.com>
 <36926eec-8b4a-76e9-15a1-f4fc354875cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36926eec-8b4a-76e9-15a1-f4fc354875cc@gmail.com>
Message-Id: <20180409215848.GS3948@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Apr 10, 2018 at 06:32:32AM +0900, Akira Yokosawa wrote:
> On 2018/04/09 10:21:33 -0700, Paul E. McKenney wrote:
> > On Tue, Apr 10, 2018 at 12:44:58AM +0900, Akira Yokosawa wrote:
> >> >From d9d064c4aac8758ccaa435444ff0e60a16a9d6d2 Mon Sep 17 00:00:00 2001
> >> From: Akira Yokosawa <akiyks@gmail.com>
> >> Date: Tue, 10 Apr 2018 00:30:08 +0900
> >> Subject: [PATCH v2] Fix labeling of appendix and section
> >>
> >> These are a couple of labels which don't match the current
> >> context due to movement to/from appendix.
> >>
> >> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >> ---
> >> Change from v1:
> >>     Fixed typo in commit log.
> > 
> > Good eyes, applied and queued, thank you!  I changed one additional
> > "appendix" to section, please see below for the updated commit, and
> > please let me know if I messed anything up.
> 
> Ah, I knew I missed something ;-)
> I wouldn't be surprised if there were other similar cases.

Nor would I.  ;-)

							Thanx, Paul

>        Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit 15e646185e3f404c6d84af4947e598278e53d22d
> > Author: Akira Yokosawa <akiyks@gmail.com>
> > Date:   Tue Apr 10 00:30:08 2018 +0900
> > 
> >     Fix labeling of appendix and section
> >     
> >     These are a couple of labels which don't match the current
> >     context due to movement to/from appendix.
> >     
> >     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> > index a796401e8d0c..c0a45a85ca03 100644
> > --- a/appendix/toyrcu/toyrcu.tex
> > +++ b/appendix/toyrcu/toyrcu.tex
> > @@ -2,7 +2,7 @@
> >  
> >  \QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}
> >  
> > -The toy RCU implementations in this section are designed not for
> > +The toy RCU implementations in this appendix are designed not for
> >  high performance, practicality, or any kind of production use,\footnote{
> >  	However, production-quality user-level RCU implementations
> >  	are available~\cite{MathieuDesnoyers2009URCU,MathieuDesnoyers2012URCU}.}
> > @@ -15,7 +15,7 @@ Chapters~\ref{chp:Introduction},
> >  and~\ref{chp:Deferred Processing}
> >  for even these toy RCU implementations to be easily understandable.
> >  
> > -This section provides a series of RCU implementations in order of
> > +This appendix provides a series of RCU implementations in order of
> >  increasing sophistication, from the viewpoint of solving the
> >  existence-guarantee problem.
> >  Section~\ref{sec:app:toyrcu:Lock-Based RCU} presents a rudimentary
> > diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> > index 079840425ca3..40fe3a4919f0 100644
> > --- a/memorder/memorder.tex
> > +++ b/memorder/memorder.tex
> > @@ -4179,7 +4179,7 @@ dependencies.
> >  
> >  \section{Hardware Specifics}
> >  \label{sec:memorder:Hardware Specifics}
> > -\OriginallyPublished{Appendix}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}
> > +\OriginallyPublished{Section}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}
> >  
> >  \begin{table*}[tbh]
> >  \rowcolors{4}{}{lightgray}
> > 
> 

