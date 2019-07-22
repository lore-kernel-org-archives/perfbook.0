Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40192 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727903AbfGVQ3S (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 22 Jul 2019 12:29:18 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6MGT85v094030
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 12:29:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2twft6ju9h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 12:29:15 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6MGT9bG094159
        for <perfbook@vger.kernel.org>; Mon, 22 Jul 2019 12:29:09 -0400
Date: Mon, 22 Jul 2019 09:28:16 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH 1/7] toyrcu: Convert Listing B.1 to new scheme
Message-ID: <20190722162816.GL14271@linux.ibm.com>
Reply-To: paulmck@linux.ibm.com
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
 <1cd27b04-dd6c-984a-9bce-56d3f6148e7d@gmail.com>
 <CABoNC80vzXtMx2_jW4Ln9c8JxSsAdT4uq2fxaFW=-HLvQtNhhA@mail.gmail.com>
 <20190722123407.GC14271@linux.ibm.com>
 <2ca1bb7b-531a-0ada-a0a8-8f4455888c93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca1bb7b-531a-0ada-a0a8-8f4455888c93@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Tue, Jul 23, 2019 at 12:12:04AM +0900, Akira Yokosawa wrote:
> On Mon, 22 Jul 2019 05:34:07 -0700, Paul E. McKenney wrote:
> > On Sun, Jul 21, 2019 at 08:07:11PM +0800, Junchang Wang wrote:
> >> Hi Akira,
> >>
> >> Thanks for the patch. The new scheme worked great as a good example of
> >> composing my commits. So,
> >>
> >> Acked-by: Junchang Wang <junchangwang@gmail.com>
> > 
> > Thank you both!  I have queued and pushed this series, with Junchang's
> > ack on this patch.
> 
> Paul, could you also pick up Junchang's other acks on patches 2/7 and 6/7 ?

Ah, I didn't see Acked-by on those two.

Junchang, you are OK with my adding your Acked-by on those as well?

One labor-saving device you can use is something like this:

	For 1/7, 2/7, and 6/7:

	Acked-by: Your Name <your@email.address>

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> > 							Thanx, Paul
> > 
> >> Thanks,
> >> --Junchang
> >>
> >> On Sun, Jul 21, 2019 at 8:02 AM Akira Yokosawa <akiyks@gmail.com> wrote:
> >>>
> >>> From 245899f43fd007aa344180c0089515cd90f84db2 Mon Sep 17 00:00:00 2001
> >>> From: Akira Yokosawa <akiyks@gmail.com>
> >>> Date: Sat, 27 Apr 2019 21:04:40 +0900
> >>> Subject: [PATCH 1/7] toyrcu: Convert Listing B.1 to new scheme
> >>>
> >>> This commit was originally presented to Junchang as an example where
> >>> code fragments extracted from two source files under CodeSamples/ are
> >>> merged into a code snippet.
> >>>
> >>> Junchan employed this scheme in commits 686f3f3b721c ("rcu: Use
> >>> READ_ONCE() and WRITE_ONCE() for shared variable rcu_gp_ctr"),
> >>> a26c1625bb0d ("rcu_qs: Use READ_ONCE() AND WRITE_ONCE() for shared
> >>> variable rcu_gp_ctr"), and b9696a4a456f ("rcu_nest: Update description
> >>> of rcu_nest.[hc]").
> >>>
> >>> Extra vertical space needs to be canceled by the \vspace*{} command
> >>> between the two \input{} commands.
> >>> \fvset{firstnumber=last} is to continue line numbering.
> >>> \fvset{firstnumber=auto} restores the default setting.
> >>>
> >>> Also tweak positioning option of the listing environment.
> >>>
> >>> Cc: Junchang Wang <junchangwang@gmail.com>
> >>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>> ---
> >>>  CodeSamples/defer/rcu_lock.c |  2 ++
> >>>  CodeSamples/defer/rcu_lock.h |  2 ++
> >>>  appendix/toyrcu/toyrcu.tex   | 26 ++++----------------------
> >>>  3 files changed, 8 insertions(+), 22 deletions(-)
> >>>
> >>> diff --git a/CodeSamples/defer/rcu_lock.c b/CodeSamples/defer/rcu_lock.c
> >>> index 8d45ac89..08b87fbd 100644
> >>> --- a/CodeSamples/defer/rcu_lock.c
> >>> +++ b/CodeSamples/defer/rcu_lock.c
> >>> @@ -20,12 +20,14 @@
> >>>
> >>>  #include "../api.h"
> >>>  #include "rcu_lock.h"
> >>> +//\begin{snippet}[labelbase=ln:defer:rcu_lock:synchronize,commandchars=\\\[\]]
> >>>
> >>>  void synchronize_rcu(void)
> >>>  {
> >>>         spin_lock(&rcu_gp_lock);
> >>>         spin_unlock(&rcu_gp_lock);
> >>>  }
> >>> +//\end{snippet}
> >>>
> >>>  #ifdef TEST
> >>>  #include "rcutorture.h"
> >>> diff --git a/CodeSamples/defer/rcu_lock.h b/CodeSamples/defer/rcu_lock.h
> >>> index 224ea0e4..bf6f9b3c 100644
> >>> --- a/CodeSamples/defer/rcu_lock.h
> >>> +++ b/CodeSamples/defer/rcu_lock.h
> >>> @@ -26,6 +26,7 @@ static void rcu_init(void)
> >>>  {
> >>>  }
> >>>
> >>> +//\begin{snippet}[labelbase=ln:defer:rcu_lock:lock_unlock,commandchars=\\\[\]]
> >>>  static void rcu_read_lock(void)
> >>>  {
> >>>         spin_lock(&rcu_gp_lock);
> >>> @@ -35,5 +36,6 @@ static void rcu_read_unlock(void)
> >>>  {
> >>>         spin_unlock(&rcu_gp_lock);
> >>>  }
> >>> +//\end{snippet}
> >>>
> >>>  extern void synchronize_rcu(void);
> >>> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> >>> index 0e84b058..d876595b 100644
> >>> --- a/appendix/toyrcu/toyrcu.tex
> >>> +++ b/appendix/toyrcu/toyrcu.tex
> >>> @@ -30,29 +30,11 @@ provides a summary and a list of desirable RCU properties.
> >>>
> >>>  \section{Lock-Based RCU}
> >>>  \label{sec:app:toyrcu:Lock-Based RCU}
> >>> +\NoIndentAfterThis
> >>>
> >>> -\begin{listing}[bp]
> >>> -{ \scriptsize
> >>> -\begin{verbbox}
> >>> -  1 static void rcu_read_lock(void)
> >>> -  2 {
> >>> -  3   spin_lock(&rcu_gp_lock);
> >>> -  4 }
> >>> -  5
> >>> -  6 static void rcu_read_unlock(void)
> >>> -  7 {
> >>> -  8   spin_unlock(&rcu_gp_lock);
> >>> -  9 }
> >>> - 10
> >>> - 11 void synchronize_rcu(void)
> >>> - 12 {
> >>> - 13   spin_lock(&rcu_gp_lock);
> >>> - 14   spin_unlock(&rcu_gp_lock);
> >>> - 15 }
> >>> -\end{verbbox}
> >>> -}
> >>> -\centering
> >>> -\theverbbox
> >>> +\begin{listing}[htbp]
> >>> +\input{CodeSamples/defer/rcu_lock@lock_unlock.fcv}\vspace*{-11pt}\fvset{firstnumber=last}
> >>> +\input{CodeSamples/defer/rcu_lock@synchronize.fcv}\fvset{firstnumber=auto}
> >>>  \caption{Lock-Based RCU Implementation}
> >>>  \label{lst:app:toyrcu:Lock-Based RCU Implementation}
> >>>  \end{listing}
> >>> --
> >>> 2.17.1
> >>>
> >>>
> >>
> > 
> 
