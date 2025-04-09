Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C615D1A5BA4
	for <perfbook@vger.kernel.org>; Wed,  9 Apr 2025 23:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744242463; cv=none; b=pQ3BwIXFrd7yoxmUwD87osZRzLz3r4XBCsq/Nkzti9kV8m1xYdPA1QRMXGeArMo5xwW0MJUIe4SECHyIGcshqVtTxbxrHZX4K/UXCl4QmiN+MLW0UaSOrO/U4zH4qsbAHWCFdi8wVFGc7BuvbhNQa2hHNmja+c67s+c40UjMkRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744242463; c=relaxed/simple;
	bh=qe+l8QgFBv4HJSBe0wFJOlOcwpUWI2ECa6UBiiiM99A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XfavngyKm4gJ0Z6roqr/tQUMD/MN7XJuZOUC2GaRrRIBFWLuDLd08iOc9R7dsp8JmiW1NqJ8S0Iwn+CH9uEZ62JFw6pE8kdNxB9sAIBXX+H/vWxmvbsWL+9fNXCg0oV2Rt2F8iRwfQdLJG970/ElBtfZNHRSOBkwrKNu/YALxNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVFbamUx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVFbamUx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62C8C4CEE2;
	Wed,  9 Apr 2025 23:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744242463;
	bh=qe+l8QgFBv4HJSBe0wFJOlOcwpUWI2ECa6UBiiiM99A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WVFbamUxHfvYG8hdXvL/o/MZliwEqBWPfu452qXsoe8bEnMQ4NVtOr/EQ6iGSPPct
	 HSHlYhtXsO6duLrAVHyvsj6lIx/b3VVq1ARMb68ne+q0dD5WBB+AsHKrMQYdH8dVkK
	 enfnJHAjNVTy4NRarzyAr0wIzGTmAwCDbELQWvmFJ5u7kMrq7svw+n7KCKOJk4WUAh
	 2HyUy/Nu90380nroTTMrux9CMXy4NtCYLHJBybQ1AYzt8kFy5i95SKmfojfmJRBpYa
	 ycH0G7Exx+5RW2orYzGqoAmtf9i1XFzZMADMvvT/9TbgHJq+H5SG9na4JHe9oU1aUR
	 Nc+p4AIs+sB5g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4EB50CE0565; Wed,  9 Apr 2025 16:47:43 -0700 (PDT)
Date: Wed, 9 Apr 2025 16:47:43 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH perfbook 1/3] Refactor indexing of "multi-copy
 atomic(ity)"
Message-ID: <2f281fdf-41a8-4cfa-a2a3-7047803e11d4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e57996f3-2a63-4de8-8a83-c1a6156a1e76@gmail.com>
 <53b7f24f-b0e4-40bf-aa10-dc681816e6d2@paulmck-laptop>
 <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c49b57-b7e5-4b3e-b06f-d69a5fb1678c@gmail.com>

On Wed, Apr 09, 2025 at 11:56:42PM +0900, Akira Yokosawa wrote:
> Glossary pages now have definitions of "Multi-Copy Atomic",
> "Non-Multi-Copy Atomic", and "Other Multi-Copy Atomic".
> 
> For consistency, change the latter to "Other-Multi-Copy Atomic".
> 
> Index markers added in commit 0685b56dfb58 ("memorder: Add index
> markers for "multicopy atomicity"") result in different items
> in Index pages:
> 
>     - Multicopy atomicity
>         - full
>         - non-
>         - other-
> 
> Change them so that they land under "Multi-copy atomic".
> 
> Also, as "full(y) multi-copy atomic" is synonymous with "multi-copy atomic",
> make their index markers plain "Multi-copy atomic".
> 
> After this change, Index pages will have just:
> 
>     - Multi-copy atomic
>         - non-
> 	- other-
> 
> In single-level index pages (with the initial value of boolean
> "indexhier" changed to "false" in perfbook-lt.tex), there were
> terms with an extra space as listed below:
> 
>     - Anti- heisenbug
>     - Non- multicopy atomicity
>     - Other- multicopy atomicity
> 
> To suppress those spaces, Define \IXhy, \IXalthy, and their variants
> and use them for index marking.  The "hy" comes from "_hy_phen".
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed the series, thank you very much!

							Thanx, Paul

> ---
>  debugging/debugging.tex |  3 +--
>  glossary.tex            |  8 ++++----
>  indexsee.tex            |  2 ++
>  memorder/memorder.tex   | 24 +++++++++++++-----------
>  perfbook-lt.tex         |  8 ++++++++
>  5 files changed, 28 insertions(+), 17 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 0fcf4541..169626bd 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1701,8 +1701,7 @@ more easily reproduced!
>  If the field of physics inspired the name of this problem, it is only
>  fair that the field of physics should inspire the solution.
>  Fortunately, particle physics is up to the task:
> -Why not create an \IXBalth{anti-heisenbug}{anti-}{heisenbug}
> -to annihilate the heisenbug?
> +Why not create an \IXBhy{anti-}{heisenbug} to annihilate the heisenbug?
>  Or, perhaps more accurately, to annihilate the heisen-ness of
>  the heisenbug?
>  Although producing an anti-heisenbug for a given heisenbug is more an
> diff --git a/glossary.tex b/glossary.tex
> index 2d295acf..9ded12f8 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -482,7 +482,7 @@
>  	Note that this means that if a CPU does a write to a given
>  	location followed immediately by a read from that same location,
>  	it might take significant time for that read to complete.
> -	(See also ``other multi-copy atomic'' and ``non-multi-copy atomic''.)
> +	(See also ``other-multi-copy atomic'' and ``non-multi-copy atomic''.)
>  \item[\IXG{Mutual-Exclusion Mechanism}:]
>  	A software abstraction that regulates threads' access to
>  	``critical sections'' and corresponding data.
> @@ -512,11 +512,11 @@
>  	of the stronger forward-progress guarantees, usually wait free or
>  	lock free, but sometimes also obstruction free.
>  	(See ``Non-blocking''.)
> -\item[\IXG{Non-Multi-Copy Atomic}:]
> +\item[\IXGhy{Non-}{Multi-Copy Atomic}:]
>  	A memory-consistency model in which, in the absence of explicit
>  	memory-ordering instructions, writes to memory may appear to
>  	occur in different orders from the perspective of different CPUs.
> -	(See also ``multi-copy atomic'' and ``other multi-copy atomic''.)
> +	(See also ``multi-copy atomic'' and ``other-multi-copy atomic''.)
>  \item[NUCA:]\glsuseriii{nuca}
>  	Non-uniform cache architecture, where groups of CPUs share
>  	caches and/or store buffers.
> @@ -539,7 +539,7 @@
>  	A forward-progress guarantee in which, in the absence of
>  	contention, every thread makes progress within a finite
>  	period of time.
> -\item[\IXG{Other Multi-Copy Atomic}:]
> +\item[\IXGhy{Other-}{Multi-Copy Atomic}:]
>  	A memory-consistency model in which a given set of writes to
>  	memory appear to occur in an order consistent with a single
>  	global order, but only from the perspective of CPUs that did
> diff --git a/indexsee.tex b/indexsee.tex
> index a77e9d64..85527197 100644
> --- a/indexsee.tex
> +++ b/indexsee.tex
> @@ -22,6 +22,8 @@
>  \index{Memory-barrier latency|see{Latency, memory-barrier}}
>  \index{Memory-barrier overhead|see{Overhead, memory-barrier}}
>  \index{Message latency|see{Latency, message}}
> +\index{Non-multi-copy atomic|see{Multi-copy atomic, non-}}
> +\index{Other-multi-copy atomic|see{Multi-copy atomic, other-}}
>  \index{Process consistency|see{Consistency, process}}
>  \index{RCU read-side critical section|see{Critical section, RCU read-side}}
>  \index{Read memory barrier|see{Memory barrier, read}}
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 1a367509..3fab79a5 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -2273,7 +2273,8 @@ accommodate only one store at a time, then any pair of CPUs would
>  agree on the order of all stores that they observed.
>  Unfortunately, building a computer system as shown in the figure, without
>  store buffers or even caches, would result in glacially slow computation.
> -Most CPU vendors interested in providing \IXB{multicopy atomicity} therefore
> +Most CPU vendors interested in providing
> +\IXBalt{multicopy atomicity}{multi-copy atomic} therefore
>  instead provide the slightly weaker
>  \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
>  which excludes the CPU doing a given store from the requirement that all
> @@ -2287,7 +2288,7 @@ CPUs agree on the order of all stores.\footnote{
>  	\cpageref{tab:memorder:Summary of Memory Ordering}.}
>  This means that if only a subset of CPUs are doing stores, the
>  other CPUs will agree on the order of stores, hence the ``other''
> -in ``\IXBalth{other-multicopy atomicity}{other-}{multicopy atomicity}''.
> +in ``\IXBalthy{other-multicopy atomicity}{other-}{multi-copy atomic}''.
>  Unlike multicopy-atomic platforms, within other-multicopy-atomic platforms,
>  the CPU doing the store is permitted to observe its
>  store early, which allows its later loads to obtain the newly stored
> @@ -2332,7 +2333,7 @@ value directly from the store buffer, which improves performance.
>  
>  Perhaps there will come a day when all platforms provide some flavor
>  of multi-copy atomicity, but
> -in the meantime, \IXalth{non-multicopy-atomic}{non-}{multicopy atomicity}
> +in the meantime, \IXalthy{non-multicopy-atomic}{non-}{multi-copy atomic}
>  platforms do exist, and so software must deal with them.
>  
>  \begin{listing}
> @@ -3448,7 +3449,7 @@ If you wish, you can click on ``Undo'' to explore other options or
>  click on ``Reset'' to start over.
>  It can be very helpful to carry out these steps in different orders
>  to better understand how a
> -\IXalth{non-multicopy-atomic}{non-}{multicopy atomicity}
> +\IXalthy{non-multicopy-atomic}{non-}{multi-copy atomic}
>  architecture operates.
>  
>  \QuickQuiz{
> @@ -5366,13 +5367,14 @@ sequential consistency.
>  Performance considerations have dictated that no modern mainstream
>  system is sequentially consistent.
>  
> -The next three rows cover \IX{multicopy atomicity}, which was defined in
> +The next three rows cover \IXalt{multicopy atomicity}{multi-copy atomic},
> +which was defined in
>  \cref{sec:memorder:Multicopy Atomicity}.
>  The first is full-up (and rare)
> -\IXalth{multicopy atomicity}{full}{multicopy atomicity}, the second is the
> -weaker \IXalth{other-multicopy atomicity}{other-}{multicopy atomicity},
> +\IXalt{multicopy atomicity}{multi-copy atomic}, the second is the
> +weaker \IXalthy{other-multicopy atomicity}{other-}{multi-copy atomic},
>  and the third is the weakest
> -\IXalth{non-multicopy atomicity}{non-}{multicopy atomicity}.
> +\IXalthy{non-multicopy atomicity}{non-}{multi-copy atomic}.
>  
>  The next row, ``Non-Cache Coherent'', covers accesses from multiple
>  threads to a single variable, which was discussed in
> @@ -6075,7 +6077,7 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
>  	order of these stores.
>  	Not so on PowerPC, even with an \co{lwsync} instruction between each
>  	pair of memory-reference instructions, because PowerPC is
> -	\IXalth{non-multicopy atomic}{non-}{multicopy atomicity}.
> +	\IXalthy{non-multicopy atomic}{non-}{multi-copy atomic}.
>  \item	[\tco{eieio}] (enforce in-order execution of I/O, in case you
>  	were wondering) causes all preceding cacheable stores to appear
>  	to have completed before all subsequent stores.
> @@ -6238,7 +6240,7 @@ would indicate.
>  This exception to the total ordering is needed to allow important
>  hardware optimizations involving store buffers.
>  In addition, x86 provides
> -\IXalth{other-multicopy atomicity}{other-}{multicopy atomicity}, for example,
> +\IXalthy{other-multicopy atomicity}{other-}{multi-copy atomic}, for example,
>  so that if CPU~0 sees a store by CPU~1, then CPU~0 is guaranteed to see
>  all stores that CPU~1 saw prior to its store.
>  Software may use atomic operations to override these hardware optimizations,
> @@ -6293,7 +6295,7 @@ It also has strong memory-ordering semantics, as shown in
>  \cref{tab:memorder:Summary of Memory Ordering}.
>  In particular, all CPUs will agree on the order of unrelated stores from
>  different CPUs, that is, the z~Systems CPU family is
> -\IXalth{fully multicopy atomic}{full}{multicopy atomicity},
> +\IXalt{fully multicopy atomic}{multi-copy atomic},
>  and is the only commercially available system with this property.
>  
>  As with most CPUs, the z~Systems architecture does not guarantee a
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 580d1f01..fdcb5e8d 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -214,10 +214,12 @@
>  }
>  \IfIndexHier{
>  \newcommand{\indexh}[3]{\ucindexh{#2}{#3}}
> +\newcommand{\indexhy}[3]{\ucindexh{#2}{#3}}
>  \newcommand{\indexhr}[3]{\indexhraw{#2}{#3}}
>  \newcommand{\indexhmr}[3]{\ucindexhm{#2}{#3}}
>  }{
>  \newcommand{\indexh}[3]{\ucindex{#3 #2}}
> +\newcommand{\indexhy}[3]{\ucindex{#3#2}}
>  \newcommand{\indexhr}[3]{\index{#1}}
>  \newcommand{\indexhmr}[3]{\index{#1}}
>  }
> @@ -235,7 +237,9 @@
>  \newcommand{\IXhrpl}[2]{\indexhr{#1 #2}{#2}{#1}\hlindex{#1 #2s}}
>  \newcommand{\IXhmr}[2]{\indexhmr{#1 #2}{#2}{#1}\hlindex{#1 #2}}
>  \newcommand{\IXhmrpl}[2]{\indexhmr{#1 #2}{#2}{#1}\hlindex{#1 #2s}}
> +\newcommand{\IXhy}[2]{\indexhy{#1#2}{#2}{#1}\hlindex{#1#2}}
>  \newcommand{\IXalth}[3]{\indexh{#1}{#3}{#2}\hlindex{#1}}
> +\newcommand{\IXalthy}[3]{\indexhy{#1}{#3}{#2}\hlindex{#1}}
>  \newcommand{\IXalthr}[3]{\indexhr{#1}{#3}{#2}\hlindex{#1}}
>  \newcommand{\IXalthmr}[3]{\indexhmr{#1}{#3}{#2}\hlindex{#1}}
>  % page number in bold face
> @@ -253,7 +257,9 @@
>  \newcommand{\IXBhrpl}[2]{\indexhr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
>  \newcommand{\IXBhmr}[2]{\indexhmr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2}}
>  \newcommand{\IXBhmrpl}[2]{\indexhmr{#1 #2|BF}{#2|BF}{#1}\hlindex{#1 #2s}}
> +\newcommand{\IXBhy}[2]{\indexhy{#1#2|BF}{#2|BF}{#1}\hlindex{#1#2}}
>  \newcommand{\IXBalth}[3]{\indexh{#1|BF}{#3|BF}{#2}\hlindex{#1}}
> +\newcommand{\IXBalthy}[3]{\indexhy{#1|BF}{#3|BF}{#2}\hlindex{#1}}
>  \newcommand{\IXBalthr}[3]{\indexhr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
>  \newcommand{\IXBalthmr}[3]{\indexhmr{#1|BF}{#3|BF}{#2}\hlindex{#1}}
>  % page number for Glossary items or the likes
> @@ -271,7 +277,9 @@
>  \newcommand{\IXGhrpl}[2]{\indexhr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2s}}
>  \newcommand{\IXGhmr}[2]{\indexhmr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2}}
>  \newcommand{\IXGhmrpl}[2]{\indexhmr{#1 #2|GL}{#2|GL}{#1}\hlindex{#1 #2s}}
> +\newcommand{\IXGhy}[2]{\indexhy{#1#2|GL}{#2|GL}{#1}\hlindex{#1#2}}
>  \newcommand{\IXGalth}[3]{\indexh{#1|GL}{#3|GL}{#2}\hlindex{#1}}
> +\newcommand{\IXGalthy}[3]{\indexhy{#1|GL}{#3|GL}{#2}\hlindex{#1}}
>  \newcommand{\IXGalthr}[3]{\indexhr{#1|GL}{#3|GL}{#2}\hlindex{#1}}
>  \newcommand{\IXGalthmr}[3]{\indexhmr{#1|GL}{#3|GL}{#2}\hlindex{#1}}
>  %
> -- 
> 2.34.1
> 
> 
