Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57576 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751646AbdJ2DTW (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 28
 Oct 2017 23:19:22 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v9T3IkTm014890
 for <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 23:19:22 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2dvn74gb6r-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sat,
 28 Oct 2017 23:19:21 -0400
Received: from localhost by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sat, 28 Oct
 2017 23:19:20 -0400
Date: Sat, 28 Oct 2017 20:19:16 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] typo at Chp 7.
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171027092317.GA8509@HP> <20171027093317.GB8509@HP>
 <a15a6a6b-010b-6284-41fb-23ab36a39aa5@gmail.com>
 <20171027232408.GT3659@linux.vnet.ibm.com> <20171028133712.GD5742@HP>
 <20171028131703.GW3659@linux.vnet.ibm.com>
 <607333fa-febd-c0c6-0139-993928bf1e40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607333fa-febd-c0c6-0139-993928bf1e40@gmail.com>
Message-Id: <20171029031916.GA3659@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Yubin Ruan <ablacktshirt@gmail.com>, perfbook@vger.kernel.org

On Sun, Oct 29, 2017 at 07:29:13AM +0900, Akira Yokosawa wrote:
> On 2017/10/28 06:17:03 -0700, Paul E. McKenney wrote:
> > On Sat, Oct 28, 2017 at 09:37:20PM +0800, Yubin Ruan wrote:
> >> On Fri, Oct 27, 2017 at 04:24:08PM -0700, Paul E. McKenney wrote:
> >>> On Sat, Oct 28, 2017 at 12:18:47AM +0900, Akira Yokosawa wrote:
> >>>> On 2017/10/27 18:33, Yubin Ruan wrote:
> >>>>> And here are some more modification to some wording in chapter 7, but I am not
> >>>>> sure whether you like it or not.
> >>>>>
> >>>>> Anyway, chapter 7 makes me feel good ;-) It makes me know that home-brewing a
> >>>>> lock primitives with atomic instructions(which is what I was doing) is
> >>>>> something that is possible and used in production.
> >>>>>
> >>>>> Thanks,
> >>>>> Yubin
> >>>>>
> >>>>> diff --git a/locking/locking.tex b/locking/locking.tex
> >>>>> index 14db27d..a9f46f1 100644
> >>>>> --- a/locking/locking.tex
> >>>>> +++ b/locking/locking.tex
> >>>>> @@ -2166,8 +2166,8 @@ Signal-handler deadlocks can be explicitly avoided as follows:
> >>>>>  	of a signal handler.
> >>>>>  \item	If the application invokes the library function
> >>>>>  	while holding a lock acquired within a given signal
> >>>>> -	handler, then that signal must be blocked every time that the
> >>>>> -	library function is called outside of a signal handler.
> >>>>> +	handler, then that signal must be blocked every time that lock
> >>>>> +    is to be acquired outside of a signal handler.
> >>>>
> >>>> The talking point here is library function and signal handler. So something like:
> >>>>
> >>>> +	handler, then that signal must be blocked every time that one
> >>>> +	of related library functions is called outside of the signal handler.
> >>>>
> >>>> Thoughts?
> >>>
> >>> I believe that the major problem is that I didn't really specify the
> >>> situation and constraints.  How about the following?
> >>>
> >>> 							Thanx, Paul
> >>>
> >>> -----------------------------------------------------------------------
> >>>
> >>> commit 85025eaceff8cf10c9b674ba70d33dbd012e27ce
> >>> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >>> Date:   Fri Oct 27 16:21:33 2017 -0700
> >>>
> >>>     locking: Clarify explicit avoidance of signal-handler deadlocks
> >>>     
> >>>     Reported-by: Yubin Ruan <ablacktshirt@gmail.com>
> >>>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >>>
> >>> diff --git a/locking/locking.tex b/locking/locking.tex
> >>> index 14db27d1148b..025320b294ed 100644
> >>> --- a/locking/locking.tex
> >>> +++ b/locking/locking.tex
> >>> @@ -2157,7 +2157,17 @@ locks, the strategies in the next section may prove helpful.
> >>>  \subsubsection{Explicitly Avoid Signal-Handler Deadlocks}
> >>>  \label{sec:locking:Explicitly Avoid Signal-Handler Deadlocks}
> >>>  
> >>> -Signal-handler deadlocks can be explicitly avoided as follows:
> >>> +Suppose that a given library function is known to acquire locks,
> >>> +but does not block signals.
> >>> +Suppose further that it is necessary to invoke that function both from
> >>> +within and outside of a signal handler, and that it is not permissible
> >>> +to modify this library function.
> >>> +Of course, if no special action is taken, then if a signal arrives
> >>> +while that library function is holding its lock, deadlock can occur
> >>> +when the signal handler invokes that same library function,
> >>> +which in turn attempts to re-acquire that same lock.
> >>> +
> >>> +Such deadlocks can be avoided as follows:
> >>>  
> >>>  \begin{enumerate}
> >>>  \item	If the application invokes the library function from
> >>
> >> These all look good to me. Thank you Paul.
> > 
> > Very good, I will push it out.  May I have your Acked-by?
> > (As in "Acked-by: Yubin Ruan <ablacktshirt@gmail.com>".)
> > 
> > (If I don't hear otherwise in about 12 hours, I will just push it
> > out as is.)
> 
> Paul, please append
> 
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

Done, thank you!

							Thanx, Paul

