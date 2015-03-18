Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:35994 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1750756AbbCRTIW (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 18 Mar 2015
 15:08:22 -0400
Received: from /spool/local	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Wed, 18 Mar
 2015 13:08:21 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id E80C83E4003F	for <perfbook@vger.kernel.org>; Wed, 18
 Mar 2015 13:08:19 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t2IJ8Sei43188464	for <perfbook@vger.kernel.org>; Wed, 18 Mar 2015 12:08:28
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t2IJ8JWa023320	for <perfbook@vger.kernel.org>; Wed, 18 Mar 2015 13:08:19
 -0600
Date: Wed, 18 Mar 2015 12:08:18 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] advsync/mb: fix wrong value of B in data dep example
Message-ID: <20150318190818.GC5312@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1426638622-8901-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426638622-8901-1-git-send-email-cota@braap.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Emilio G. Cota" <cota@braap.org>
Cc: perfbook@vger.kernel.org

On Tue, Mar 17, 2015 at 08:30:22PM -0400, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>

Applied, thank you!

							Thanx, Paul

> ---
>  advsync/memorybarriers.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index e512785..cc11323 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1667,65 +1667,65 @@ To deal with this, a data dependency barrier must be inserted between the
>  address load and the data load (again with initial values of
>  {\tt \{A = 1, B = 2, C = 3, P = \&A, Q = \&C\}}):
> 
>  \vspace{5pt}
>  \begin{minipage}[t]{\columnwidth}
>  \tt
>  \scriptsize
>  \begin{tabular}{l|p{1.5in}}
>  	CPU 1 &		CPU 2 \\
>  	\hline
>  	B = 4; & \\
>  	<write barrier> & \\
>  	P = \&B; &	\\
>  		&	Q = P; \\
>  		&	<data dependency barrier> \\
>  		&	D = *Q; \\
>  \end{tabular}
>  \end{minipage}
>  \vspace{5pt}
> 
>  This enforces the occurrence of one of the two implications, and prevents the
>  third possibility from arising.
> 
>  Note that this extremely counterintuitive situation arises most easily on
>  machines with split caches, so that, for example, one cache bank processes
>  even-numbered cache lines and the other bank processes odd-numbered cache
>  lines.
>  The pointer \co{P} might be stored in an odd-numbered cache line, and the
>  variable \co{B} might be stored in an even-numbered cache line.  Then, if the
>  even-numbered bank of the reading CPU's cache is extremely busy while the
>  odd-numbered bank is idle, one can see the new value of the
>  pointer \co{P} (which is \co{&B}),
> -but the old value of the variable \co{B} (which is 1).
> +but the old value of the variable \co{B} (which is 2).
> 
>  Another example of where data dependency barriers might by required is where a
>  number is read from memory and then used to calculate the index for an array
>  access with initial values
>  {\tt \{M[0] = 1, M[1] = 2, M[3] = 3, P = 0, Q = 3\}}:
> 
>  \vspace{5pt}
>  \begin{minipage}[t]{\columnwidth}
>  \tt
>  \scriptsize
>  \begin{tabular}{l|p{1.5in}}
>  	CPU 1 &		CPU 2 \\
>  	\hline
>  	M[1] = 4; & \\
>  	<write barrier> & \\
>  	P = 1;	&	\\
>  		&	Q = P; \\
>  		&	<data dependency barrier> \\
>  		&	D = M[Q]; \\
>  \end{tabular}
>  \end{minipage}
>  \vspace{5pt}
> 
>  The data dependency barrier is very important to the Linux kernel's
>  RCU system, for example,
>  see \co{rcu_dereference()} in \url{include/linux/rcupdate.h}.
>  This permits the current
>  target of an RCU'd pointer to be replaced with a new modified target, without
>  the replacement target appearing to be incompletely initialised.
> 
>  See also
>  Section~\ref{sec:advsync:Cache Coherency}
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe perfbook" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

