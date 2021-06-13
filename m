Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231844AbhFMP70 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 13 Jun 2021 11:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623599845;
        bh=FXr5ti41PF9OOK/hPOhOWp7/SBy1EV381l5S567TqNY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Qfn+XVKjUl265oTVXajhvClKVB8fr2MQ+9P2eJUSV1kvgDkY9+qNCuUCq7xDeClcU
         8/bfuoJIwG4DMt+gCJ23ckSdyLuc/V6dVy7qokZCoTYdiwuaSIIo2INsHr43F0uoPl
         3F0Ui+e+pNze3t7lwuPP3xxCERricjH8ss6G8jctbW4UpedGvJg6RUBEgUA6TgPZDy
         Oi8rQesxLONVgudCCovc2pAbasis/N7/mjdcBZWYOF4HdfahYdG2Br9IEalpWt4+Zj
         8PtdxBuDs2tdJuj8XeePKP7bBHx5K2MOhY0Jr2dgJOMsxZlT9f4p1BJxvUwOoR9Ocy
         WEUBcdE2I2Ofg==
Date: Sun, 13 Jun 2021 08:57:25 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v2 -perfbook] howto, intro, cpu: Break and capitalize
 after colon
Message-ID: <20210613155725.GM4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
 <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
 <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
 <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
 <b94fd29f-66a5-b4c8-cca5-6f81a75f20a7@gmail.com>
 <e6b2532d-3059-d6e4-5ae1-15feb70067f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b2532d-3059-d6e4-5ae1-15feb70067f6@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jun 12, 2021 at 03:14:52PM +0900, Akira Yokosawa wrote:
> Fix violations detected by the check scripts at hand.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I have pulled this in, thank you very much!

There is one mistake I made in my previous reply, and I have fixed
this.  Please see below.

> ---
>  cpu/cpu.tex         |  5 +++--
>  cpu/hwfreelunch.tex | 18 +++++++++++-------
>  cpu/overheads.tex   |  8 +++++---
>  cpu/overview.tex    |  8 +++++---
>  cpu/swdesign.tex    |  2 +-
>  howto/howto.tex     | 23 ++++++++++++++---------
>  intro/intro.tex     | 30 +++++++++++++++---------------
>  7 files changed, 54 insertions(+), 40 deletions(-)
> 
> diff --git a/cpu/cpu.tex b/cpu/cpu.tex
> index 183feb8c..8a4afc69 100644
> --- a/cpu/cpu.tex
> +++ b/cpu/cpu.tex
> @@ -54,8 +54,9 @@ So, to sum up:
>  \begin{enumerate}
>  \item	The good news is that multicore systems are inexpensive and
>  	readily available.
> -\item	More good news:  The overhead of many synchronization operations
> -	is much lower than it was on parallel systems from the early 2000s.
> +\item	More good news:
> +	The overhead of many synchronization operations is much lower
> +	than it was on parallel systems from the early 2000s.
>  \item	The bad news is that the overhead of cache misses is still high,
>  	especially on large systems.
>  \end{enumerate}
> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
> index 92f04f16..68c6dd5f 100644
> --- a/cpu/hwfreelunch.tex
> +++ b/cpu/hwfreelunch.tex
> @@ -167,8 +167,9 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>  \label{sec:cpu:Novel Materials and Processes}
>  
>  Stephen Hawking is said to have claimed that semiconductor manufacturers
> -have but two fundamental problems: (1) the finite speed of light and
> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> +have but two fundamental problems:
> +(1)~The finite speed of light and
> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.

I should have capitalized the "the" in this last line.  I did so before
applying your patch.

							Thanx, Paul

>  It is possible that semiconductor manufacturers are approaching these
>  limits, but there are nevertheless a few avenues of research and
>  development focused on working around these fundamental limits.
> @@ -228,8 +229,9 @@ general-purpose CPU will normally use a loop (possibly unrolled)
>  with a loop counter.
>  Decoding the instructions, incrementing the loop counter, testing this
>  counter, and branching back to the
> -top of the loop are in some sense wasted effort: the real goal is
> -instead to multiply corresponding elements of the two vectors.
> +top of the loop are in some sense wasted effort:
> +The real goal is instead to multiply corresponding elements of the
> +two vectors.
>  Therefore, a specialized piece of hardware designed specifically to
>  multiply vectors could get the job done more quickly and with less
>  energy consumed.
> @@ -263,10 +265,12 @@ These hardware accelerators are often used for media decoding,
>  so much so that a high-end MP3 player might be able to play audio
>  for several minutes---with its CPU fully powered off the entire time.
>  The purpose of these accelerators is to improve energy efficiency
> -and thus extend battery life: special purpose hardware can often
> -compute more efficiently than can a general-purpose CPU\@.
> +and thus extend battery life:
> +Special purpose hardware can often compute more efficiently than
> +can a general-purpose CPU\@.
>  This is another example of the principle called out in
> -\cref{sec:intro:Generality}: \IX{Generality} is almost never free.
> +\cref{sec:intro:Generality}:
> +\IX{Generality} is almost never free.
>  
>  Nevertheless, given the end of \IXaltr{Moore's-Law}{Moore's Law}-induced
>  single-threaded performance increases, it seems safe to assume that
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 80d60d9d..4aeae6cd 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -500,8 +500,9 @@ cycles, as shown in the ``Global Comms'' row.
>  	use several rolls (or multiple cases) of toilet paper to represent
>  	the communications latency.
>  
> -	Important safety tip: make sure to account for the needs of
> -	those you live with when appropriating toilet paper, especially
> +	Important safety tip:
> +	Make sure to account for the needs of those you live with when
> +	appropriating toilet paper, especially
>  	in 2020 or during a similar time when store shelves are free of
>  	toilet paper and much else besides.
>  
> @@ -584,7 +585,8 @@ exceedingly efficiently, and is the subject of
>  \begin{figure}
>  \centering
>  \resizebox{3in}{!}{\includegraphics{cartoons/Data-chasing-light-wave}}
> -\caption{Hardware and Software: On Same Side}
> +\caption{Hardware and Software:
> +				On Same Side}
>  \ContributedBy{Figure}{fig:cpu:Hardware and Software: On Same Side}{Melissa Broussard}
>  \end{figure}
>  
> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index d1d23b36..33918e49 100644
> --- a/cpu/overview.tex
> +++ b/cpu/overview.tex
> @@ -5,8 +5,9 @@
>  \section{Overview}
>  \label{sec:cpu:Overview}
>  %
> -\epigraph{Mechanical Sympathy: Hardware and software working together in
> -	  harmony.}{\emph{Martin Thompson}}
> +\epigraph{Mechanical Sympathy:
> +	  Hardware and software working together in harmony.}
> +	 {\emph{Martin Thompson}}
>  
>  Careless reading of computer-system specification sheets might lead one
>  to believe that CPU performance is a footrace on a clear track, as
> @@ -335,7 +336,8 @@ as illustrated by
>  \cref{fig:cpu:CPU Waits for I/O Completion}.
>  
>  This is one of the differences between shared-memory and distributed-system
> -parallelism: shared-memory parallel programs must normally deal with no
> +parallelism:
> +Shared-memory parallel programs must normally deal with no
>  obstacle worse than a cache miss, while a distributed parallel program
>  will typically incur the larger network communication latencies.
>  In both cases, the relevant latencies can be thought of as a cost of
> diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
> index 63b6222f..75541229 100644
> --- a/cpu/swdesign.tex
> +++ b/cpu/swdesign.tex
> @@ -82,7 +82,7 @@ be extremely infrequent and to enable very large quantities of processing.
>  }\QuickQuizEnd
>  
>  The lesson should be quite clear:
> -parallel algorithms must be explicitly designed with these hardware
> +Parallel algorithms must be explicitly designed with these hardware
>  properties firmly in mind.
>  One approach is to run nearly independent threads.
>  The less frequently the threads communicate, whether by \IX{atomic} operations,
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 0f0ba293..8bc9e8e5 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -46,11 +46,16 @@ that it has brought to us!
>  \section{Roadmap}
>  \label{sec:howto:Roadmap}
>  %
> -\epigraph{Cat: Where are you going? \\
> -	  Alice: Which way should I go? \\
> -	  Cat: That depends on where you are going. \\
> -	  Alice: I don't know. \\
> -	  Cat: Then it doesn't matter which way you go.}
> +\epigraph{Cat:
> +		Where are you going? \\
> +	  Alice:
> +		Which way should I go? \\
> +	  Cat:
> +		That depends on where you are going. \\
> +	  Alice:
> +		I don't know. \\
> +	  Cat:
> +		Then it doesn't matter which way you go.}
>  	 {\emph{Lewis Carroll, Alice in Wonderland}}
>  
>  This book is a handbook of widely applicable and heavily
> @@ -359,8 +364,8 @@ Fortunately, there are many alternatives available to you:
>  	thorough and accessible introduction with a good set of
>  	examples.
>  \item	If you are interested in C++11, you might like
> -	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action: Practical
> -	Multithreading''~\cite{AnthonyWilliams2012,AnthonyWilliams2019}.
> +	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action:
> +	Practical Multithreading''~\cite{AnthonyWilliams2012,AnthonyWilliams2019}.
>  \item	If you are interested in C++, but in a Windows environment,
>  	you might try \ppl{Herb}{Sutter}'s ``Effective Concurrency''
>  	series in
> @@ -528,8 +533,8 @@ namely that you are certifying that:
>  
>  This is quite similar to the Developer's Certificate of Origin (DCO)
>  1.1 used by the Linux kernel.
> -You must use your real name:  I unfortunately cannot accept pseudonymous or
> -anonymous contributions.
> +You must use your real name:
> +I unfortunately cannot accept pseudonymous or anonymous contributions.
>  
>  The language of this book is American English, however, the open-source
>  nature of this book permits translations, and I personally encourage them.
> diff --git a/intro/intro.tex b/intro/intro.tex
> index 5f2690fc..b185a7f7 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -23,11 +23,11 @@ However, new technologies that are difficult to use at introduction
>  invariably become easier over time.
>  For example, the once-rare ability to drive a car is now
>  commonplace in many countries.
> -This dramatic change came about for two basic reasons: (1)~cars became
> -cheaper and more readily available, so that more people had the
> -opportunity to learn to drive, and (2)~cars became easier to operate
> -due to automatic transmissions, automatic chokes, automatic starters,
> -greatly improved reliability,
> +This dramatic change came about for two basic reasons:
> +(1)~Cars became cheaper and more readily available, so that
> +more people had the opportunity to learn to drive,
> +and (2)~Cars became easier to operate due to automatic transmissions,
> +automatic chokes, automatic starters, greatly improved reliability,
>  and a host of other technological improvements.
>  
>  The same is true for many other technologies, including computers.
> @@ -155,8 +155,8 @@ as discussed in \cref{sec:cpu:Hardware Free Lunch?}.
>  	how could a large number of open-source projects, ranging from Apache
>  	to MySQL to the Linux kernel, have managed to master it?
>  
> -	A better question might be: ``Why is parallel programming {\em
> -	perceived} to be so difficult?''
> +	A better question might be:
> +	``Why is parallel programming \emph{perceived} to be so difficult?''
>  	To see the answer, let's go back to the year 1991.
>  	Paul McKenney was walking across the parking lot to Sequent's
>  	benchmarking center carrying six dual-80486 Sequent Symmetry CPU
> @@ -311,8 +311,8 @@ Each of these goals is elaborated upon in the following sections.
>  \label{sec:intro:Performance}
>  
>  Performance is the primary goal behind most parallel-programming effort.
> -After all, if performance is not a concern, why not do yourself
> -a favor:  Just write sequential code, and be happy?
> +After all, if performance is not a concern, why not do yourself a favor:
> +Just write sequential code, and be happy?
>  It will very likely be easier
>  and you will probably get done much more quickly.
>  
> @@ -657,8 +657,8 @@ configuration, or other setup.
>  	Those who indulge in excessive generality will therefore fail to set
>  	the productivity bar high enough to succeed near the top of the
>  	software stack.
> -	This fact of life even has its own acronym: YAGNI, or ``You
> -	Ain't Gonna Need It.''
> +	This fact of life even has its own acronym:
> +	YAGNI, or ``You Ain't Gonna Need It.''
>  }\QuickQuizEnd
>  
>  Unfortunately, a system that does the job required by user~1 is
> @@ -928,7 +928,7 @@ each of which is covered in the following sections.
>  \label{sec:intro:Work Partitioning}
>  
>  Work partitioning is absolutely required for parallel execution:
> -if there is but one ``glob'' of work, then it can be executed by at
> +If there is but one ``glob'' of work, then it can be executed by at
>  most one CPU at a time, which is by definition sequential execution.
>  However, partitioning the work requires great care.
>  For example, uneven partitioning can result in sequential execution
> @@ -939,9 +939,9 @@ available hardware and restore performance and scalabilty.
>  Although partitioning can greatly improve performance and scalability,
>  it can also increase complexity.
>  For example, partitioning can complicate handling of global
> -errors and events: A parallel
> -program may need to carry out non-trivial synchronization in order
> -to safely process such global events.
> +errors and events:
> +A parallel program may need to carry out non-trivial synchronization
> +in order to safely process such global events.
>  More generally, each partition requires some sort of communication:
>  After all, if
>  a given thread did not communicate at all, it would have no effect and
> -- 
> 2.17.1
> 
> 
