Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35130 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726316AbfDFCFo (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 5 Apr 2019 22:05:44 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x3623kIb146986
        for <perfbook@vger.kernel.org>; Fri, 5 Apr 2019 22:05:43 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rpg9559qj-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Fri, 05 Apr 2019 22:05:42 -0400
Received: from localhost
        by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 6 Apr 2019 03:05:42 +0100
Date: Fri, 5 Apr 2019 19:05:39 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] formal/dyntickrcu: Mitigate ugliness of tall inline
 snippets
Reply-To: paulmck@linux.ibm.com
References: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
Message-Id: <20190406020539.GY14111@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Apr 06, 2019 at 09:31:03AM +0900, Akira Yokosawa wrote:
> >From 8f49523f66fb2281b4337ce57f6502400f0dcb9c Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 6 Apr 2019 08:53:12 +0900
> Subject: [PATCH] formal/dyntickrcu: Mitigate ugliness of tall inline snippets
> 
> In two-column layout, frames around snippets by \VerbatimN cause
> column breaks of snippets look somewhat ugly.
> 
> As a mitigation, disable frame of \VerbatimN in this particular
> section. Also use \VerbatimU for patch snippets to prevent
> them from breaking other inline snippets in one-column layout.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I know this is not ideal for you, but in one-column layout, the
> column breaks of long snippets does not disturb me so much.
> 
> So this patch disables frame around \VerbatimN for two-column layout
> to restore the looks in the old scheme.
> 
> Isn't this approach acceptable to you, at least as a workaround?

Looks good for now, thank you!  Longer term, I need to break up the
longer listings, but in the short term I need to finish several
changes that I have started.

							Thanx, Paul

>         Thanks, Akira
> --
>  formal/dyntickrcu.tex | 67 ++++++++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 29 deletions(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index c73cdd2f..94093ee9 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1,5 +1,14 @@
>  % formal/dyntickrcu.tex
>  
> +% Disable frame around VerbatimN in two-column layout
> +\IfTwoColumn{
> +\RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
> +{numbers=left,numbersep=5pt,xleftmargin=10pt,xrightmargin=0pt,frame=none}
> +\AtBeginEnvironment{VerbatimN}{%
> +\renewcommand{\lnlbl}[1]{\raisebox{0pt}{\phantomsection\label{\lnlblbase:#1}}}%
> +}
> +}{}
> +
>  \subsection{Promela Parable: dynticks and Preemptible RCU}
>  \label{sec:formal:Promela Parable: dynticks and Preemptible RCU}
>  
> @@ -1114,10 +1123,19 @@ states, passing without errors.
>  
>  \subsubsection{Lessons (Re)Learned}
>  \label{sec:formal:Lessons (Re)Learned}
> -\NoIndentAfterThis
>  
> -\begin{listing}[tbp]
> -\begin{VerbatimL}[numbers=none]
> +This effort provided some lessons (re)learned:
> +
> +\begin{enumerate}
> +\item	{\bf Promela and Spin can verify interrupt\slash NMI\-/handler
> +	interactions.}
> +\item	{\bf Documenting code can help locate bugs.}
> +	In this case, the documentation effort located
> +	a misplaced memory barrier in
> +	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> +	as shown by the following patch.
> +
> +\begin{VerbatimU}
>   static inline void rcu_enter_nohz(void)
>   {
>  +       mb();
> @@ -1131,38 +1149,20 @@ states, passing without errors.
>          __get_cpu_var(dynticks_progress_counter)++;
>  +       mb();
>   }
> -\end{VerbatimL}
> -\caption{Memory-Barrier Fix Patch}
> -\label{lst:formal:Memory-Barrier Fix Patch}
> -\end{listing}
> -
> -\begin{listing}[tbp]
> -\begin{VerbatimL}[numbers=none]
> --       if ((curr - snap) > 2 || (snap & 0x1) == 0)
> -+       if ((curr - snap) > 2 || (curr & 0x1) == 0)
> -\end{VerbatimL}
> -\caption{Variable-Name-Typo Fix Patch}
> -\label{lst:formal:Variable-Name-Typo Fix Patch}
> -\end{listing}
> -
> -This effort provided some lessons (re)learned:
> +\end{VerbatimU}
>  
> -\begin{enumerate}
> -\item	{\bf Promela and Spin can verify interrupt\slash NMI\-/handler
> -	interactions.}
> -\item	{\bf Documenting code can help locate bugs.}
> -	In this case, the documentation effort located
> -	a misplaced memory barrier in
> -	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
> -	as shown by the patch in
> -	Listing~\ref{lst:formal:Memory-Barrier Fix Patch}.
>  \item	{\bf Validate your code early, often, and up to the point
>  	of destruction.}
>  	This effort located one subtle bug in
>  	\co{rcu_try_flip_waitack_needed()}
>  	that would have been quite difficult to test or debug, as
> -	shown by the patch in
> -	Listing~\ref{lst:formal:Variable-Name-Typo Fix Patch}.
> +	shown by the following patch.
> +
> +\begin{VerbatimU}
> +-       if ((curr - snap) > 2 || (snap & 0x1) == 0)
> ++       if ((curr - snap) > 2 || (curr & 0x1) == 0)
> +\end{VerbatimU}
> +
>  \item	{\bf Always verify your verification code.}
>  	The usual way to do this is to insert a deliberate bug
>  	and verify that the verification code catches it.  Of course,
> @@ -1621,3 +1621,12 @@ where an NMI might change shared state at any point during execution of
>  the \IRQ\ functions.
>  
>  Verification can be a good thing, but simplicity is even better.
> +
> +% Restore frame around VerbatimN in two-column layout
> +\IfTwoColumn{
> +\RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
> +{numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
> +\AtBeginEnvironment{VerbatimN}{%
> +\renewcommand{\lnlbl}[1]{\raisebox{9pt}{\phantomsection\label{\lnlblbase:#1}}}%
> +}
> +}{}
> -- 
> 2.17.1
> 

