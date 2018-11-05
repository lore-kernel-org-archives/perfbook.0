Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:42522 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387441AbeKFG7t (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 6 Nov 2018 01:59:49 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA5LSjPT085872
        for <perfbook@vger.kernel.org>; Mon, 5 Nov 2018 16:38:06 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2nju4t7f6j-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Mon, 05 Nov 2018 16:38:06 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 5 Nov 2018 21:38:05 -0000
Date: Mon, 5 Nov 2018 13:38:01 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] memorder.tex: Fix typos in description of litmus test
 C-ISA2+o-r+a-r+a-r+a-o
Reply-To: paulmck@linux.ibm.com
References: <1541413782-2876-1-git-send-email-junchangwang@gmail.com>
 <00bc1afe-fea1-cb02-cc6d-137b592528a6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00bc1afe-fea1-cb02-cc6d-137b592528a6@gmail.com>
Message-Id: <20181105213801.GD4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org

On Mon, Nov 05, 2018 at 09:15:38PM +0900, Akira Yokosawa wrote:
> >From 0e43c93660383b7560c55131754dbc4bfaf13052 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 5 Nov 2018 20:27:02 +0900
> Subject: [PATCH] memorder: Fix line numbers by applying new scheme to C-ISA2+o-r+a-r+a-r+a-o
> 
> Line numbers referring to Listing 15.23 don't match the line counts
> in the snippet. Fix this by putting labels in the source of the litmus
> test and referring them by \lnref{} macros.
> 
> Reported-by: Junchang Wang <junchangwang@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> On 2018/11/05 18:29:42 +0800, Junchang Wang wrote:
> > This is the only patch for the second half of Chapter Memory Ordering. Please
> > take a look. Thanks.
> > 
> 
> Good catch!
> 
> While we are here, why not apply the new scheme for snippets to this litmus
> test?  Labeling lines in the source code can prevent such mismatches.
> 
> For the new scheme to support litmus tests, please see commit log of
> 69a75a84d7c3 ("future/formalregress: Example of extraction of snippet from
> .litmus file")

Indeed, good catch!!!  And here I -thought- that I proof-read this stuff...

Junchang, does Akira's approach look good to you?

							Thanx, Paul

>         Thanks. Akira
> 
> --
>  .../formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus    | 22 ++++-----
>  memorder/memorder.tex                              | 52 +++-------------------
>  2 files changed, 19 insertions(+), 55 deletions(-)
> 
> diff --git a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> index 343fded..b899369 100644
> --- a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> +++ b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
> @@ -1,15 +1,16 @@
>  C C-ISA2+o-r+a-r+a-r+a-o
> +//\begin[snippet][labelbase=ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole,commandchars=\\\@\$]
>  {
>  }
> 
> -{
> -#include "api.h"
> -}
> -
> +{				//\fcvexclude
> +#include "api.h"		//\fcvexclude
> +}				//\fcvexclude
> +				//\fcvexclude
>  P0(int *x0, int *x1)
>  {
>  	WRITE_ONCE(*x0, 2);
> -	smp_store_release(x1, 2);
> +	smp_store_release(x1, 2);	//\lnlbl[P0:rel]
>  }
> 
> 
> @@ -17,16 +18,16 @@ P1(int *x1, int *x2)
>  {
>  	int r2;
> 
> -	r2 = smp_load_acquire(x1);
> -	smp_store_release(x2, 2);
> +	r2 = smp_load_acquire(x1);	//\lnlbl[P1:acq]
> +	smp_store_release(x2, 2);	//\lnlbl[P1:rel]
>  }
> 
>  P2(int *x2, int *x3)
>  {
>  	int r2;
> 
> -	r2 = smp_load_acquire(x2);
> -	smp_store_release(x3, 2);
> +	r2 = smp_load_acquire(x2);	//\lnlbl[P2:acq]
> +	smp_store_release(x3, 2);	//\lnlbl[P2:rel]
>  }
> 
>  P3(int *x3, int *x0)
> @@ -34,8 +35,9 @@ P3(int *x3, int *x0)
>  	int r1;
>  	int r2;
> 
> -	r1 = smp_load_acquire(x3);
> +	r1 = smp_load_acquire(x3);	//\lnlbl[P3:acq]
>  	r2 = READ_ONCE(*x0);
>  }
> 
> +//\end[snippet]
>  exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 8e11e92..d92d1e5 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2841,49 +2841,7 @@ from the passage of time, so that no matter how many threads are
>  involved, the corresponding \co{exists} clause cannot trigger.
> 
>  \begin{listing}[tbp]
> -{ \scriptsize
> -\begin{verbbox}[\LstLineNo]
> -C C-ISA2+o-r+a-r+a-r+a-o
> -{
> -}
> -
> -P0(int *x0, int *x1)
> -{
> -  WRITE_ONCE(*x0, 2);
> -  smp_store_release(x1, 2);
> -}
> -
> -
> -P1(int *x1, int *x2)
> -{
> -  int r2;
> -
> -  r2 = smp_load_acquire(x1);
> -  smp_store_release(x2, 2);
> -}
> -
> -P2(int *x2, int *x3)
> -{
> -  int r2;
> -
> -  r2 = smp_load_acquire(x2);
> -  smp_store_release(x3, 2);
> -}
> -
> -P3(int *x3, int *x0)
> -{
> -  int r1;
> -  int r2;
> -
> -  r1 = smp_load_acquire(x3);
> -  r2 = READ_ONCE(*x0);
> -}
> -
> -exists (1:r2=2 /\ 2:r2=2 /\ 3:r1=2 /\ 3:r2=0)
> -\end{verbbox}
> -}
> -\centering
> -\theverbbox
> +\input{CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o@whole.fcv}
>  \caption{Long ISA2 Release-Acquire Chain}
>  \label{lst:memorder:Long ISA2 Release-Acquire Chain}
>  \end{listing}
> @@ -2899,16 +2857,20 @@ shows a three-step release-acquire chain, but where \co{P3()}'s
>  final access is a \co{READ_ONCE()} from \co{x0}, which is
>  accessed via \co{WRITE_ONCE()} by \co{P0()}, forming a non-temporal
>  load-to-store link between these two processes.
> -However, because \co{P0()}'s \co{smp_store_release()} (line~12)
> +\begin{lineref}[ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole]
> +However, because \co{P0()}'s \co{smp_store_release()} (line~\lnref{P0:rel})
>  is cumulative, if \co{P3()}'s \co{READ_ONCE()} returns zero,
>  this cumulativity will force the \co{READ_ONCE()} to be ordered
>  before \co{P0()}'s \co{smp_store_release()}.
> -In addition, the release-acquire chain (lines~12, 20, 21, 28, 29, and~37)
> +In addition, the release-acquire chain
> +(lines~\lnref{P0:rel}, \lnref{P1:acq}, \lnref{P1:rel}, \lnref{P2:acq},
> +\lnref{P2:rel}, and~\lnref{P3:acq})
>  forces \co{P3()}'s \co{READ_ONCE()} to be ordered after \co{P0()}'s
>  \co{smp_store_release()}.
>  Because \co{P3()}'s \co{READ_ONCE()} cannot be both before and after
>  \co{P0()}'s \co{smp_store_release()}, either or both of two things must
>  be true:
> +\end{lineref}
> 
>  \begin{enumerate}
>  \item	\co{P3()}'s \co{READ_ONCE()} came after \co{P0()}'s
> -- 
> 2.7.4
> 

