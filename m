Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32936 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1754850AbdKNTJh (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 14
 Nov 2017 14:09:37 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAEJ8bdo077665
 for <perfbook@vger.kernel.org>; Tue, 14 Nov 2017 14:09:36 -0500
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2e83bea8r5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 14 Nov 2017 14:09:36 -0500
Received: from localhost by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 14 Nov
 2017 14:09:34 -0500
Date: Tue, 14 Nov 2017 11:09:30 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] memorder: Use litmus test in section 'control dependency
 calamity'
Reply-To: paulmck@linux.vnet.ibm.com
References: <50409a82-e3d0-c5cb-92a3-db4b42e3a7ed@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50409a82-e3d0-c5cb-92a3-db4b42e3a7ed@gmail.com>
Message-Id: <20171114190930.GZ3624@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Nov 14, 2017 at 09:07:06PM +0900, Akira Yokosawa wrote:
> >From 9b53814671df7e54b294599959b739f592196258 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Tue, 14 Nov 2017 20:57:08 +0900
> Subject: [PATCH] memorder: Use litmus test in section 'control dependency calamity'
> 
> Also substitute "cumulativity" for "transitivity".

Applied and pushed, good catch, thank you!

							Thanx, Paul

> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  memorder/memorder.tex | 139 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 94 insertions(+), 45 deletions(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index f028789..180a721 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3957,54 +3957,103 @@ invoked by those two clauses), not to code following that ``\co{if}''.
>  Finally, control dependencies do \emph{not} provide cumulativity.\footnote{
>  	Refer to Section~\ref{sec:memorder:Cumulativity} for
>  	the meaning of cumulativity.}
> -This is demonstrated by two related examples, with the initial values
> -of~\co{x} and~\co{y} both being zero:
> +This is demonstrated by two related litmus tests, namely
> +Listings~\ref{lst:memorder:LB Litmus Test With Control Dependency}
> +and~\ref{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
> +with the initial values
> +of~\co{x} and~\co{y} both being zero.
> 
> -\vspace{5pt}
> -\begin{minipage}[t]{\columnwidth}
> -\tt
> -\scriptsize
> -\begin{tabular}{l|p{1.5in}}
> -	\nf{CPU 0} &	\nf{CPU 1} \\
> -	\hline
> -	\tco{r1 = READ_ONCE(x);} &
> -		\tco{r2 = READ_ONCE(y);} \\
> -	if (r1 > 0) &
> -		if (r2 > 0) \\
> -	~~~\tco{WRITE_ONCE(y, 1);} &
> -		~~~\tco{WRITE_ONCE(x, 1);} \\
> -	\multicolumn{2}{l}{~} \\
> -	\multicolumn{2}{l}{\tco{assert(!(r1 == 1 && r2 == 1));}} \\
> -\end{tabular}
> -\end{minipage}
> -\vspace{5pt}
> +\begin{listing}
> +{ \scriptsize
> +\begin{verbbox}[\LstLineNo]
> +C C-LB+o-cgt-o+o-cgt-o
> +{
> +}
> 
> -The above two-CPU example will never trigger the \co{assert()}.
> -However, if control dependencies guaranteed transitivity (which they do
> -not), then adding the following CPU would guarantee a related assertion:
> +P0(int *x, int *y)
> +{
> +  int r1;
> 
> -\vspace{5pt}
> -\begin{minipage}[t]{\columnwidth}
> -\tt
> -\scriptsize
> -\begin{tabular}{l}
> -	\nf{CPU 2} \\
> -	\hline
> -	\tco{WRITE_ONCE(x, 2);} \\
> -	\multicolumn{1}{l}{~} \\
> -	\multicolumn{1}{l}{\tco{assert(!(r1 == 2 && r2 == 1 && x == 2));}} \\
> -\end{tabular}
> -\end{minipage}
> -\vspace{5pt}
> +  r1 = READ_ONCE(*x);
> +  if (r1 > 0)
> +    WRITE_ONCE(*y, 1);
> +}
> +
> +P1(int *x, int *y)
> +{
> +  int r2;
> +
> +  r2 = READ_ONCE(*y);
> +  if (r2 > 0)
> +    WRITE_ONCE(*x, 1);
> +}
> +
> +exists (0:r1=1 /\ 1:r2=1)
> +\end{verbbox}
> +}
> +\centering
> +\theverbbox
> +\caption{LB Litmus Test With Control Dependency}
> +\label{lst:memorder:LB Litmus Test With Control Dependency}
> +\end{listing}
> +
> +The \co{exists} clause in the two-thread example of
> +Listing~\ref{lst:memorder:LB Litmus Test With Control Dependency}
> +(\path{C-LB+o-cgt-o+o-cgt-o.litmus})
> +will never trigger.
> +If control dependencies guaranteed cumulativity (which they do
> +not), then adding a thread to the example as in
> +Listing~\ref{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
> +(\path{C-WWC+o-cgt-o+o-cgt-o+o.litmus})
> +would guarantee the related \co{exists} clause never to trigger.
> +
> +\begin{listing}
> +{ \scriptsize
> +\begin{verbbox}[\LstLineNo]
> +C C-WWC+o-cgt-o+o-cgt-o+o
> +{
> +}
> +
> +P0(int *x, int *y)
> +{
> +  int r1;
> +
> +  r1 = READ_ONCE(*x);
> +  if (r1 > 0)
> +    WRITE_ONCE(*y, 1);
> +}
> +
> +P1(int *x, int *y)
> +{
> +  int r2;
> +
> +  r2 = READ_ONCE(*y);
> +  if (r2 > 0)
> +    WRITE_ONCE(*x, 1);
> +}
> +
> +P2(int *x)
> +{
> +  WRITE_ONCE(*x, 2);
> +}
> +
> +exists (0:r1=2 /\ 1:r2=1 /\ x=2)
> +\end{verbbox}
> +}
> +\centering
> +\theverbbox
> +\caption{WWC Litmus Test With Control Dependency (Cumulativity?)}
> +\label{lst:memorder:WWC Litmus Test With Control Dependency (Cumulativity?)}
> +\end{listing}
> 
> -But because control dependencies do \emph{not} provide transitivity, the above
> -assertion can fail after the combined three-CPU example completes.
> -If you need the three-CPU example to provide ordering, you will need
> -\co{smp_mb()} between the loads and stores in the CPU~0 and CPU~1 code
> -fragments, that is, just before or just after the ``\co{if}'' statements.
> -Furthermore, the original two-CPU example is very fragile and should be avoided.
> +But because control dependencies do \emph{not} provide cumulativity, the
> +\co{exists} clause in the three-thread litmus test can trigger.
> +If you need the three-thread example to provide ordering, you will need
> +\co{smp_mb()} between the loads and stores in threads \co{P0()} and \co{P1()},
> +that is, just before or just after the ``\co{if}'' statements.
> +Furthermore, the original two-thread example is very fragile and should be avoided.
> 
> -The two-CPU example is known as LB (load buffering) and the three-CPU
> +The two-thread example is known as LB (load buffering) and the three-thread
>  example as WWC~\cite{Maranget2012TutorialARMPower}.
> 
>  The following list of rules summarizes the lessons of this section:
> @@ -4053,8 +4102,8 @@ The following list of rules summarizes the lessons of this section:
>  \item	Control dependencies pair normally with other types of
>  	memory-ordering operations.
> 
> -\item	Control dependencies do \emph{not} provide transitivity.
> -	If you need transitivity, use \co{smp_mb()}.
> +\item	Control dependencies do \emph{not} provide cumulativity.
> +	If you need cumulativity, use \co{smp_mb()}.
>  \end{enumerate}
> 
>  In short, many popular languages were designed primarily with
> -- 
> 2.7.4
> 

