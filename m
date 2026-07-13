Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6721E4343E1
	for <perfbook@vger.kernel.org>; Mon, 13 Jul 2026 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783961007; cv=none; b=BLdT/IOuB4QfIuOmmrnAHoWzoNJenK+ah/vF7/1fV++E0HDt4Y7UioDUSQgxzfuzdKwku/NigG/ioQn2e4ZRJGqQ4S7zRAq+E54mi2Xe7wRDJPM3+Pi12Y4Kb/ByVRl87kd5eh1Lv/LsBNYhAW6RUAfzB35tKJPHGslcHrXR9SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783961007; c=relaxed/simple;
	bh=rVkWE22JqKNrfNLiSB8oo/aEB2VplUCy0Uv6jyLiDxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naVt7gG+R+LXoA3uq+uwkimax0bB5Nxc+6bLeUG+x0fHrL45rpGER05rw9gq3tNC+/Gqh/q+ZC4fsKLD9tQwLPJdLkJF6iesZn3D6QSz6agUXfuw6WPLVkL8sNV1ED0l7U6SvvO639y1riFtdc0fAYgA/c1XWJeG+nB4/dLFfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFH4YOeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFH4YOeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD131F000E9;
	Mon, 13 Jul 2026 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783961005;
	bh=5L5kwLeXL+qQQRN+U3OEHJPNU3DHgJHtvHppx+I2wfo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=iFH4YOeQOJUbhClLMZH9k8AET3YZxfaBmm7kweVQzgdmttxcyG1AGkk//F2bsk39i
	 rcJ5TYB01D0R/Q1W6oce3y1z0cYeePYrmhJdakYy9e1dicqVkCawrRIOlcYQFnCI+1
	 R2SjOYigG2iMOtIAbkzXapyEAnTzTa6b67jgaXQCqXnBhz17ROGWJRV4J9JPIlyvFF
	 VQ2qtOuheEDMj9DEaJUhoOYz6lVmI2WV4qj/9f+CuPhlHSQC1+h3Du9SyPL5b6AK69
	 PycQHrBpoepbm40y+C4fRR59hKanDw6Xnu0FX9nHbD458Anj5Hum59bSoTgLoucqO5
	 9e0Pfa9HoRa6Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1738DCE18E2; Mon, 13 Jul 2026 09:43:25 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:43:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/3] Enhance \clnref for multi-part listing and
 employ it
Message-ID: <6c84c284-efb5-4ec0-b842-dfb855f3b453@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bca22163-1a29-4680-a037-f895cf38d630@gmail.com>

On Mon, Jul 13, 2026 at 06:52:41PM +0900, Akira Yokosawa wrote:
> Line counts in multi-part listings are printed in the form of "A1"
> and "B2".  While \clnref{} prints "line 1" and "line 2", rather
> than "line A1" and "line B2".
> 
> To make \clnref{} able to put prefix strings in line counts, define
> a macro "\lnpref" and add it in the definition of "\lnref{}".
> 
> For ease of setting \lnpref in the middle of a paragraph, provide
> \setlnpref{}, which prevents extra white spaces around it.
> "\setlnpref{A}" inside a "fcvref" env will set "A" to \lnpref.
> It may be used multiple times in a "fcvref" env for switching to
> other prefix(es).  It has no effect outside of said "fcvref" env.
> 
> \lnpref is not related to \myfvline of VerbatimT env.
> In other words, you need to do \setlnpref{} every time in
> front of \clnref{}.
> 
> Apply the new scheme in multi-part listings added up to commit
> 688d07e98e61 ("toolsoftrade: Wordsmith shenanigans QQ and add
> another").
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Technically speaking, it should be possible to embed a prefix string
> along with each line label; and use it in \lnref{} without any need
> of \sellnpref{}.  This will be the ultimate goal!

Still a nice improvement, and thank you!  I need to apply this to my
recent changes, and will do so.  It might take me some time to get there.

Queued!!!

							Thanx, Paul

> --
>  defer/rcuintro.tex            | 105 +++++++++++++---------
>  perfbook-lt.tex               |   5 +-
>  toolsoftrade/toolsoftrade.tex | 158 +++++++++++++++++++++-------------
>  3 files changed, 169 insertions(+), 99 deletions(-)
> 
> diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
> index 46625c67..b9b7c8fc 100644
> --- a/defer/rcuintro.tex
> +++ b/defer/rcuintro.tex
> @@ -72,31 +72,36 @@ that would normally be used in single-threaded code.
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
>  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = gp;
> - do_something_with(p->a);
> - do_something_with(p->b);
> +\begin{fcvlabel}[ln:defer:Compilers Can Reload Values]
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = gp;				\lnlbl[A1]
> + do_something_with(p->a);		\lnlbl[A2]
> + do_something_with(p->b);		\lnlbl[A3]
>  \end{VerbatimT}
>  Might be transformed to:
>  \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = gp;
> - do_something_with(p->a);
> - p = gp;
> - do_something_with(p->b);
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = gp;				\lnlbl[B1]
> + do_something_with(p->a);		\lnlbl[B2]
> + p = gp;				\lnlbl[B3]
> + do_something_with(p->b);		\lnlbl[B4]
>  \end{VerbatimT}
>  The compiler assumes normal variables do not spontaneously change,
>  \co{do_something_with()} might use many machine registers, and this
>  transformation reduces register pressure.
> -But if some other thread changes \co{gp} between lines~B1 and~B3 of the
> +\begin{fcvref}[ln:defer:Compilers Can Reload Values]
> +\setlnpref{B}
> +But if some other thread changes \co{gp} between \clnref{B1,B3} of the
>  transformed code, the values of \co{p->a} and \co{p->b} will be mismatched.
> +\end{fcvref}
>  Prevent this by using \co{rcu_dereference()} as follows:
>  \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = rcu_dereference(gp);
> - do_something_with(p->a);
> - do_something_with(p->b);
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = rcu_dereference(gp);		\lnlbl[C1]
> + do_something_with(p->a);		\lnlbl[C2]
> + do_something_with(p->b);		\lnlbl[C3]
>  \end{VerbatimT}
> +\end{fcvlabel}
>  \end{adjustwidth}
>  \caption{Compilers Can Reload Values}
>  \label{lst:defer:Compilers Can Reload Values}
> @@ -106,70 +111,90 @@ Prevent this by using \co{rcu_dereference()} as follows:
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
>  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = malloc(sizeof(*p));
> - p->a = compute_value();
> - p->b = 42;
> - gp = p;
> +\begin{fcvlabel}[ln:defer:Compilers Can Reorder Accesses]
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = malloc(sizeof(*p));		\lnlbl[A1]
> + p->a = compute_value();		\lnlbl[A2]
> + p->b = 42;				\lnlbl[A3]
> + gp = p;				\lnlbl[A4]
>  \end{VerbatimT}
>  Might be transformed to:
>  \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = malloc(sizeof(*p));
> - gp = p;
> - p->a = compute_value();
> - p->b = 42;
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = malloc(sizeof(*p));		\lnlbl[B1]
> + gp = p;				\lnlbl[B2]
> + p->a = compute_value();		\lnlbl[B3]
> + p->b = 42;				\lnlbl[B4]
>  \end{VerbatimT}
>  The compiler assumes normal variables are not concurrently accessed,
>  and thus that the order of stores does not matter.
>  If \co{compute_value()} was inlined, this transformation might produce
>  better code.
> +\begin{fcvref}[ln:defer:Compilers Can Reorder Accesses]
> +\setlnpref{B}
>  In this example, if some other thread loads \co{gp} immediately after
> -line~B2 of the transformed code, that thread might see pre-initialization
> -garbage in \co{p->a} and \co{p->b}.
> +\clnref{B2} of the transformed code, that thread might see
> +pre-initialization garbage in \co{p->a} and \co{p->b}.
> +\end{fcvref}
>  Prevent this by using \co{rcu_assign_pointer()} as follows:
>  \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> - p = malloc(sizeof(*p));
> - p->a = compute_value();
> - p->b = 42;
> - rcu_assign_pointer(gp, p);
> +\begin{VerbatimT}[commandchars=\\\[\]]
> + p = malloc(sizeof(*p));		\lnlbl[C1]
> + p->a = compute_value();		\lnlbl[C2]
> + p->b = 42;				\lnlbl[C3]
> + rcu_assign_pointer(gp, p);		\lnlbl[C4]
>  \end{VerbatimT}
> +\end{fcvlabel}
>  \end{adjustwidth}
>  \caption{Compilers Can Reorder Accesses}
>  \label{lst:defer:Compilers Can Reorder Accesses}
>  \end{listing}
>  
> -To see the need for \co{rcu_dereference()}, please see lines~A1--A3 of
> +\begin{fcvref}[ln:defer:Compilers Can Reload Values]
> +\setlnpref{A}
> +To see the need for \co{rcu_dereference()}, please see
> +\clnrefrange{A1}{A3} of
>  \cref{lst:defer:Compilers Can Reload Values}.
>  Here, the compiler may assume that \co{gp} retains the same value
>  throughout.
> +\setlnpref{B}
>  If \co{do_something_with()} uses many machine registers, then the
> -compiler might transform this code to the form shown in lines~B1--B4 of
> +compiler might transform this code to the form shown in
> +\clnrefrange{B1}{B4} of
>  this listing, thus avoiding the need to dedicate a register to the value
>  loaded from \co{gp}, but also possibly passing values from two
>  different structures to the pair of calls to \co{do_something_with()}
> -on lines~B2 and~B4.
> +on \clnref{B2,B4}.
>  This transformation would fatally confuse any implementation of
>  \co{do_something_with()} that assumed that it was being passed values
>  from the same structure.
> +\setlnpref{C}
>  To prevent this transformation, use \co{rcu_dereference()} as
> -shown on lines~C1--C3 of this listing, thus informing the compiler of the
> +shown on \clnrefrange{C1}{C3} of this listing,
> +thus informing the compiler of the
>  possibility of concurrent updates to \co{gp}.
> +\end{fcvref}
>  
> -To see the need for \co{rcu_assign_pointer()}, please see lines~A1--A4 of
> +\begin{fcvref}[ln:defer:Compilers Can Reorder Accesses]
> +\setlnpref{A}
> +To see the need for \co{rcu_assign_pointer()}, please see
> +\clnrefrange{A1}{A4} of
>  \cref{lst:defer:Compilers Can Reorder Accesses},
>  in which the compiler may assume that \co{gp} is not concurrently accessed
>  at all.
>  If \co{compute_value()} is inlined, the compiler might generate better
> -code by pulling the assignment to \co{gp} from line~A4 to follow line~A1,
> -as shown in the transformed code on lines~B1--B4.
> +code by pulling the assignment to \co{gp} from
> +\clnref{A4} to follow \clnref{A1},
> +\setlnpref{B}
> +as shown in the transformed code on \clnrefrange{B1}{B4}.
>  If some other thread were to load fields \co{gp->a} or \co{gp->b} between
> -the store on line~B2 and the initializations on lines~B3 and~B4, that
> +the store on \clnref{B2} and the initializations on \clnref{B3,B4}, that
>  other thread's acceses would return pre-initialization garbage.
> +\setlnpref{C}
>  You can prevent this transformation by using \co{rcu_assign_pointer()}
> -as shown on lines~C1--C4, thus informing the compiler of the possibility
> +as shown on \clnrefrange{C1}{C4}, thus informing the compiler of the possibility
>  of concurrent accesses to \co{gp} and of the need to preserve ordering.
> +\end{fcvref}
>  
>  Reviewing \cref{fig:defer:Insertion With Concurrent Readers}
>  from the viewpoint of readers, in the first three states all readers
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index f6d6efc2..6f0b224f 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -714,8 +714,11 @@
>  \renewcommand{\lnlbl}[1]{%
>  \raisebox{\lnlblraise}{\phantomsection\label{\lnlblbase:#1}}}%
>  }
> +
>  \newcommand{\lnrefbase}{}
> -\newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
> +\newcommand{\lnpref}{}
> +\newcommand{\setlnpref}[1]{\ignorespaces\renewcommand{\lnpref}{#1}\ignorespaces}
> +\newcommand{\lnref}[1]{\lnpref\ref{\lnrefbase:#1}}
>  \newcommand{\lnrefraw}[1]{\ref{#1}}
>  
>  \newenvironment{fcvlabel}[1][]{\renewcommand{\lnlblbase}{#1}%
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 5ad57269..c864c484 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -1488,32 +1488,37 @@ A short answer to this question is ``they lived dangerously''.
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
>  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -ptr = global_ptr;
> -if (ptr != NULL && ptr < high_address)
> -	do_low(ptr);
> +\begin{fcvlabel}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +ptr = global_ptr;			\lnlbl[A1]
> +if (ptr != NULL && ptr < high_address)	\lnlbl[A2]
> +	do_low(ptr);			\lnlbl[A3]
>  \end{VerbatimT}
>  Might be transformed to:
>  \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -if (global_ptr != NULL &&
> -    global_ptr < high_address)
> -	do_low(global_ptr);
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +if (global_ptr != NULL &&		\lnlbl[B1]
> +    global_ptr < high_address)		\lnlbl[B2]
> +	do_low(global_ptr);		\lnlbl[B3]
>  \end{VerbatimT}
> +\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
>  The compiler assumes normal variables do not spontaneously change,
>  the surrounding code  might use many machine registers, and this
>  transformation reduces register pressure.
> +\setlnpref{B}
>  But if some other thread changes \co{global_ptr} from non-\co{NULL}
> -to \co{NULL} between lines~B1 and~B2 of the transformed code, the
> +to \co{NULL} between \clnref{B1,B2} of the transformed code, the
>  two comparisons will be against different variables, possibly passing
>  \co{do_low} a \co{NULL} pointer.
>  Prevent this by using \co{READ_ONCE()} as follows:
> +\end{fcvref}
>  \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -ptr = READ_ONCE(global_ptr);
> -if (ptr != NULL && ptr < high_address)
> -	do_low(ptr);
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +ptr = READ_ONCE(global_ptr);			\lnlbl[C1]
> +if (ptr != NULL && ptr < high_address)		\lnlbl[C2]
> +	do_low(ptr);				\lnlbl[C3]
>  \end{VerbatimT}
> +\end{fcvlabel}
>  \end{adjustwidth}
>  \caption{Living Dangerously Early 1990s Style}
>  \label{lst:toolsoftrade:Living Dangerously Early 1990s Style}
> @@ -1524,32 +1529,42 @@ present-day compilers.
>  In (say) the early 1990s, compilers did fewer optimizations, in part
>  because there were fewer compiler writers and in part due to the
>  relatively small memories of that era.
> -Nevertheless, problems did arise, as shown in lines~A1--A3 of
> +\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +Nevertheless, problems did arise, as shown in
> +\setlnpref{A}
> +\clnrefrange{A1}{A3} of
>  \cref{lst:toolsoftrade:Living Dangerously Early 1990s Style},
> +\setlnpref{B}
>  which the compiler is within its rights to transform into
> -lines~B1--B3.
> -As you can see, the temporary on line~A1 has been optimized away, so
> +\clnrefrange{B1}{B3}.
> +\setlnpref{A}
> +As you can see, the temporary on \clnref{A1} has been optimized away, so
>  that \co{global_ptr} will be loaded up to three times.
> -This can be prevented using \co{READ_ONCE()} as shown on line~C1,
> +\setlnpref{C}
> +This can be prevented using \co{READ_ONCE()} as shown on \clnref{C1},
>  as is explained in detail in
>  \cref{sec:toolsoftrade:A Volatile Solution}.
> +\end{fcvref}
>  
>  \QuickQuiz{
>  	What is wrong with loading
>  	\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style}'s
>  	\co{global_ptr} up to three times?
>  }\QuickQuizAnswer{
> +	\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +	\setlnpref{B}
>  	Suppose that \co{global_ptr} is initially non-\co{NULL},
>  	but that some other thread sets \co{global_ptr} to \co{NULL}.
> -	Suppose further that line~B1 of the transformed code
> +	Suppose further that \clnref{B1} of the transformed code
>  	(\cref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
>  	executes just before \co{global_ptr} is set to \co{NULL} and
> -	line~B2 just after.
> -	Then line~B1 will conclude that \co{global_ptr} is non-\co{NULL},
> -	and line~B2  will conclude that it is less than
> +	\clnref{B2} just after.
> +	Then \clnref{B1} will conclude that \co{global_ptr} is non-\co{NULL},
> +	and \clnref{B2}  will conclude that it is less than
>  	\co{high_address},
> -	so that line~B3 passes \co{do_low()} a \co{NULL} pointer,
> +	so that \clnref{B3} passes \co{do_low()} a \co{NULL} pointer,
>  	which \co{do_low()} just might not be prepared to deal with.
> +	\end{fcvref}
>  
>  	Your editor made exactly this mistake in the DYNIX/ptx
>  	kernel's memory allocator in the early 1990s.
> @@ -1598,10 +1613,13 @@ below.
>  \begin{description}[labelsep=.4em]
>  \item[Load tearing] occurs when the compiler uses multiple load
>  instructions for a single access.
> +\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +\setlnpref{A}
>  For example, the compiler could in theory compile the load from
> -\co{global_ptr} (see line~A1 of
> +\co{global_ptr} (see \clnref{A1} of
>  \cref{lst:toolsoftrade:Living Dangerously Early 1990s Style})
>  as a series of one-byte loads.
> +\end{fcvref}
>  If some other thread was concurrently setting \co{global_ptr} to
>  \co{NULL}, the result might have all but one byte of the pointer
>  set to zero, thus forming a ``wild pointer''.
> @@ -1614,8 +1632,11 @@ a given pointer.
>  Because the C standard must support all manner of systems, the standard
>  cannot rule out load tearing in the general case.
>  
> -However, adding a \co{READ_ONCE()} as shown on line~C1 prevents load
> +\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +\setlnpref{C}
> +However, adding a \co{READ_ONCE()} as shown on \clnref{C1} prevents load
>  tearing on modern systems in most situations.
> +\end{fcvref}
>  
>  \item[Store tearing] occurs when the compiler uses multiple store
>  instructions for a single access.
> @@ -1651,25 +1672,27 @@ prevent store tearing.
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
>  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -while (!need_to_stop)
> -	do_something_quickly();
> +\begin{fcvlabel}[ln:toolsoftrade:Infinite Load Fusing]
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +while (!need_to_stop)			\lnlbl[A1]
> +	do_something_quickly();		\lnlbl[A2]
>  \end{VerbatimT}
>  Might be transformed to:
>  \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -if (!need_to_stop)
> -	for (;;)
> -		do_something_quickly();
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +if (!need_to_stop)			\lnlbl[B1]
> +	for (;;)			\lnlbl[B2]
> +		do_something_quickly();	\lnlbl[B3]
>  \end{VerbatimT}
>  The compiler assumes normal variables do not spontaneously change,
>  and might thus load \co{need_to_stop} only the one time.
>  Prevent this by using \co{READ_ONCE()} as follows:
>  \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -while (!READ_ONCE(need_to_stop))
> -	do_something_quickly();
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +while (!READ_ONCE(need_to_stop))	\lnlbl[C1]
> +	do_something_quickly();		\lnlbl[C2]
>  \end{VerbatimT}
> +\end{fcvlabel}
>  \end{adjustwidth}
>  \caption{Infinite Load Fusing}
>  \label{lst:toolsoftrade:Infinite Load Fusing}
> @@ -1700,37 +1723,43 @@ For example, suppose that it is necessary to invoke a function
>  named \co{do_something_quickly()} repeatedly until the variable
>  \co{need_to_stop} was set, and that the compiler can see that
>  \co{do_something_quickly()} does not store to \co{need_to_stop}.
> -One (unsafe) way to code this is shown on lines~A1--A2 of
> +\begin{fcvref}[ln:toolsoftrade:Infinite Load Fusing]
> +\setlnpref{A}
> +One (unsafe) way to code this is shown on \clnrefrange{A1}{A2} of
>  \cref{lst:toolsoftrade:Infinite Load Fusing}.
> -Because line~A1 does a plain load and because the compiler knows that
> +Because \clnref{A1} does a plain load and because the compiler knows that
>  \co{do_something_quickly()} does not store to \co{need_to_stop}, the
>  compiler could quite reasonably decide to check this variable only once,
> -resulting in the code shown on lines~B1--B3 of the listing.
> +\setlnpref{B}
> +resulting in the code shown on \clnrefrange{B1}{B3} of the listing.
>  Once entered, the loop on will never exit, regardless of how
>  many times some other thread stores a non-zero value to \co{need_to_stop}.
>  The result will at best be consternation, and might well also entail
>  severe physical damage.
> +\setlnpref{C}
>  You can prevent such disasters by using \co{READ_ONCE()} as shown
> -on line~C1.
> +on \clnref{C1}.
> +\end{fcvref}
>  
>  \begin{listing}[tb]
>  \begin{adjustwidth}{10pt}{5pt}
>  \footnotesize
> +\begin{fcvlabel}[ln:toolsoftrade:Finite Load Fusing]
>  \renewcommand{\myfvline}{A\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -while (!nonvolatile_atomic_load(need_to_stop))
> -	do_something_quickly();
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +while (!nonvolatile_atomic_load(need_to_stop))  \lnlbl[A1]
> +	do_something_quickly();			\lnlbl[A2]
>  \end{VerbatimT}
>  Might be transformed to:
>  \renewcommand{\myfvline}{B\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -if (!nonvolatile_atomic_load(need_to_stop))
> -	for (;;) {
> -		do_something_quickly();
> -		do_something_quickly();
> -		do_something_quickly();
> -		do_something_quickly();
> -	}
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +if (!nonvolatile_atomic_load(need_to_stop))	\lnlbl[B1]
> +	for (;;) {				\lnlbl[B2]
> +		do_something_quickly();		\lnlbl[B3]
> +		do_something_quickly();		\lnlbl[B4]
> +		do_something_quickly();		\lnlbl[B5]
> +		do_something_quickly();		\lnlbl[B6]
> +	}					\lnlbl[B7]
>  \end{VerbatimT}
>  In the absence of ordering in \co{do_something_quickly()}, the compiler is
>  permitted to do finite load fusing, in this case combining four adjacent
> @@ -1740,10 +1769,11 @@ might result in a failure to meet loop-exit latency constraints after
>  some other thread stores to \co{need_to_stop}.
>  Prevent this by using \co{READ_ONCE()} as follows:
>  \renewcommand{\myfvline}{C\arabic{FancyVerbLine}}
> -\begin{VerbatimT}
> -while (!READ_ONCE(need_to_stop))
> -	do_something_quickly();
> +\begin{VerbatimT}[commandchars=\\\[\]]
> +while (!READ_ONCE(need_to_stop))	\lnlbl[C1]
> +	do_something_quickly();		\lnlbl[C2]
>  \end{VerbatimT}
> +\end{fcvlabel}
>  \end{adjustwidth}
>  \caption{Finite Load Fusing}
>  \label{lst:toolsoftrade:Finite Load Fusing}
> @@ -1754,14 +1784,17 @@ language's non-volatile atomics, which often provide a nice compromise
>  between reasonable guarantees and decent optimization.
>  These optimizations can be especially effective when
>  \co{do_something_quickly()} is an inline function.
> +\begin{fcvref}[ln:toolsoftrade:Finite Load Fusing]
> +\setlnpref{A}
>  Because the C language provides only volatile atomic operations,
> -line~A1 of
> +\clnref{A1} of
>  \cref{lst:toolsoftrade:Finite Load Fusing}
>  indicates this with the mythical \co{nonvolatile_atomic_load()} operation.
>  
> +\setlnpref{B}
>  However, those working on real-time code must take care because finite
>  load fusing is permitted, which can lead to finite loop unrolling,
> -as as exemplified by the four-way unrolling on lines~B1-B7 of
> +as as exemplified by the four-way unrolling on \clnrefrange{B1}{B7} of
>  the listing.
>  Although this loop unrolling does not cause a functional failure, the
>  unrolled loop might cause the \co{do_something_quickly()} function to be
> @@ -1770,8 +1803,10 @@ a non-zero value to \co{need_to_stop} and the time that the loop exits.
>  These additional executions of \co{do_something_quickly()} might result
>  in failures to meet loop-exit latency constraints, especially given that
>  the value of ``finite'' can be extremely large.
> +\setlnpref{C}
>  Prevent this latency-degrading unrolling by using \co{READ_ONCE()}
> -as shown on line~C1.
> +as shown on \clnref{C1}.
> +\end{fcvref}
>  
>  \QuickQuiz{
>  	Why does it matter whether \co{do_something_quickly()} in
> @@ -1783,11 +1818,14 @@ as shown on line~C1.
>  	would have to assume that this function might change the value
>  	of \co{need_to_stop}.  Or that this function might include
>  	ordering constraints and accesses to other shared variables.
> +	\begin{fcvref}[ln:toolsoftrade:Finite Load Fusing]
> +	\setlnpref{A}
>  	These possibilities would force the compiler to reload
> -	\co{need_to_stop} on each pass through the loop on lines~A1--A2,
> +	\co{need_to_stop} on each pass through the loop on \clnrefrange{A1}{A2},
>  	thus preventing the compiler from unrolling the loop, or,
>  	alternatively, from omitting the load and test when unrolling
>  	the loop.
> +	\end{fcvref}
>  	The compiler's ignorance, coupled with the fact that the compiler
>  	understood that it was ignorant, would force the per-iteration
>  	reload from \co{need_to_stop}, which would in turn prevent the
> @@ -2268,10 +2306,14 @@ complex, and are left aside for the time being.
>  
>  So how does \apic{volatile} stack up against the earlier examples?
>  
> -Using \apik{READ_ONCE()} on line~A1 of
> +\begin{fcvref}[ln:toolsoftrade:Living Dangerously Early 1990s Style]
> +\setlnpref{A}
> +Using \apik{READ_ONCE()} on \clnref{A1} of
>  \cref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
>  avoids invented loads,
> -resulting in the code shown on lines~C1--C3.
> +\setlnpref{C}
> +resulting in the code shown on \clnrefrange{C1}{C3}.
> +\end{fcvref}
>  
>  \begin{listing}
>  \begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
> 
> base-commit: 5fa9e33570b14bc460ae59c3177563478ba93d75
> -- 
> 2.43.0
> 
