Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbgCLSH3 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 12 Mar 2020 14:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584036448;
        bh=RFv7XY1H8u+ULLX2udyZio9Qk4a1RwukfKYxw8VC5J4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=0WGHuq79RGXPC56lXwlOkP4d3T37CuleJMW/9FlLl+i9pVXlbWXN7nHvZfDTzz38j
         77/wU5A/j0WHF/CL7eSZGUSQLKwKz4ky1Uz+4FBx/YChcmWjLfqM2xFKcupSh4PgRq
         UKxATwNGI47tSQ6RW49GHzfsQwgXcgQqeD3TD+Mw=
Date: Thu, 12 Mar 2020 11:07:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] treewide: Use trademark symbols for Intel processor
 families
Message-ID: <20200312180728.GH3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <2842e044-f9b9-2e0f-682b-faeff99338ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2842e044-f9b9-2e0f-682b-faeff99338ef@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Mar 13, 2020 at 12:53:20AM +0900, Akira Yokosawa wrote:
> >From e4d5b404bcc00b6f9ae0325623fccb6e15c178e7 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Fri, 13 Mar 2020 00:30:47 +0900
> Subject: [PATCH] treewide: Use trademark symbols for Intel processor families
> 
> As per Intel's guideline [1] of trademark usage, put (R) and (TM)
> marks in captions and their first references from text within a chapter.
> Update legal.tex accordingly.
> 
> [1]: https://www.intel.com/content/www/us/en/trademarks/usage-guidelines.html
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> Having seen the (R) and (TM) marks in the updated tables in cpu/overheads,
> this patch puts similar marks in other "Intel Xeon", "Intel Core", and "Intel"
> trademarks.

Ah, I should have included my explanation.  I simply copied that string
directly out of /proc/cpuinfo, "(R)" and "(TM)" and all.

> I guess we should also take care of other trademarks of IBM, Arm, MIPS, SPARC,
> etc.
> 
> I remember submitting a patch to remove those marks saying that they are covered
> by the Legal page, but it was not the right thing to do if I had read the
> guidelines of those trademark owners carefully.

Hmmm...  What do other textbooks do?

> If you are OK, I'll prepare a patch set for other trademarks.

I am OK either way, but I am not yet convinced we need markings
throughout.  However, I agree that if there is doubt, the safe thing to
do is to apply the markings.

							Thanx, Paul

> Thoughts?
> 
>         Thanks, Akira
> --
>  appendix/styleguide/styleguide.tex |  2 +-
>  count/count.tex                    |  2 +-
>  cpu/overheads.tex                  | 10 +++++-----
>  legal.tex                          |  4 ++--
>  perfbook.tex                       |  4 ++--
>  toolsoftrade/toolsoftrade.tex      |  2 +-
>  6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index 00fa249d..db7cde24 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -1333,7 +1333,7 @@ as a reference to be consulted when new tables are added in the text.
>  	Global Comms		& 195 000 000	& 409 500 000   \\
>  	\bottomrule
>  \end{tabular}
> -\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
> +\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel\RTM\ Xeon\RTM\ Platinum 8176 CPUs @ 2.10GHz}
>  \label{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
>  \end{table}
>  
> diff --git a/count/count.tex b/count/count.tex
> index a7426e53..244bd004 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -259,7 +259,7 @@ line~\lnref{inc} atomically increments it, and
>  line~\lnref{read} reads it out.
>  \end{fcvref}
>  Because this is atomic, it keeps perfect count.
> -However, it is slower: on a Intel Core Duo laptop, it is about
> +However, it is slower: on a Intel\RTM\ Core\TM\ Duo laptop, it is about
>  six times slower than non-atomic increment
>  when a single thread is incrementing, and more than \emph{ten times}
>  slower if two threads are incrementing.\footnote{
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index e3fa42bf..702e7cfe 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -161,7 +161,7 @@ optimization.
>  	Global Comms	& 195 000 000 & 409 500 000 & \\
>  	\bottomrule
>  \end{tabular}
> -\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10\,GHz}
> +\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel\RTM\ Xeon\RTM\ Platinum 8176 CPUs @ 2.10\,GHz}
>  \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
>  \end{table*}
>  
> @@ -333,8 +333,8 @@ thousand clock cycles.
>  	Global Comms		& 195 000 000	& 542 000 000   \\
>  	\bottomrule
>  \end{tabular}
> -\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel X5550 (Nehalem) System}
> -\label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
> +\caption{Performance of Synchronization Mechanisms on 16-CPU 2.8\,GHz Intel\RTM\ X5550 (Nehalem) System}
> +\label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel(R) X5550 (Nehalem) System}
>  \end{table}
>  
>  	The first problem limits raw speed, and the second limits
> @@ -350,7 +350,7 @@ thousand clock cycles.
>  	represents a reasonably large system with no fewer 448~hardware
>  	threads.
>  	Smaller systems often achieve better latency, as may be seen in
> -	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
> +	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel(R) X5550 (Nehalem) System},
>  	which represents a much smaller system with only 16 hardware threads.
>  	A similar view is provided by the rows of
>  	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
> @@ -385,7 +385,7 @@ thousand clock cycles.
>  	Global Comms	& 195 000 000 & 429 000 000 & \\
>  	\bottomrule
>  \end{tabular}
> -\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20\,GHz}
> +\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel\RTM\ Core\TM\ i7-8750H CPU @ 2.20\,GHz}
>  \label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz}
>  \end{table*}
>  
> diff --git a/legal.tex b/legal.tex
> index 21b9263f..a6329c9f 100644
> --- a/legal.tex
> +++ b/legal.tex
> @@ -13,8 +13,8 @@ Trademarks:
>  	of International Business Machines Corporation in the United
>  	States, other countries, or both.
>  \item	Linux is a registered trademark of Linus Torvalds.
> -\item	i386 is a trademark of Intel Corporation or its subsidiaries
> -	in the United States, other countries, or both.
> +\item	Intel, Intex Xeon, and Intel Core are trademarks of Intel Corporation
> +	or its subsidiaries in the United States, other countries, or both.
>  \item	Other company, product, and service names may be trademarks or
>  	service marks of such companies.
>  \end{itemize}
> diff --git a/perfbook.tex b/perfbook.tex
> index a5ac180b..61b57ad0 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -277,8 +277,8 @@
>  \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
>  \newcommand{\mytexttrademark}{}
>  \newcommand{\mytextregistered}{}
> -%\newcommand{\mytexttrademark}{\textsuperscript\texttrademark}
> -%\newcommand{\mytextregistered}{\textsuperscript\textregistered}
> +\newcommand{\TM}{\textsuperscript\texttrademark}
> +\newcommand{\RTM}{\textsuperscript\textregistered}
>  
>  \newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
>  
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 79d6c2cd..3c59760a 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2600,7 +2600,7 @@ As a rough rule of thumb, use the simplest tool that will get the job done.
>  If you can, simply program sequentially.
>  If that is insufficient, try using a shell script to mediate parallelism.
>  If the resulting shell-script \co{fork()}/\co{exec()} overhead
> -(about 480 microseconds for a minimal C program on an Intel Core Duo
> +(about 480 microseconds for a minimal C program on an Intel\RTM\ Core\TM\ Duo
>  laptop) is too
>  large, try using the C-language \co{fork()} and \co{wait()} primitives.
>  If the overhead of these primitives (about 80 microseconds for a minimal
> -- 
> 2.17.1
> 
