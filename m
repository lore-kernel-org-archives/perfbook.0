Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhFJV2O (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 10 Jun 2021 17:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623360377;
        bh=EtcgUnhFKPWev1StugIWvQJIMGFyQ8NcIH6a+EP35yU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=fP/YhGwy1tuUFFZLtj8L1uIOwhUPRB2cKBYKQ4oUiBvuCd0B43LyaZ9tbrWMGYBoE
         VaCnCpGXKvZWz/Ncf5vYK33JrYB7gTzncPjn2awbwmg5BtYcKXpHywZ+xNob644FXN
         IwYQ2wPD91a2i1DTtA8ifg6sKPcXQ3NUXZcWZphd0/KjCjcGl26ORgl+3/7gZ6wqSM
         GO3EPnAGiWtUninBb4hh08GjhWTzcJXw4vxTOtC2tFKx5AWnsXRuN0Uu1Jvuj6ThI4
         7i3hZzFco73Ok1rMNiGd7d16ybis6S3x1l95zBlfEDTFTpiuyoCp3OUxk+Q8MdCoqA
         nj/0RsAV+cvZQ==
Date: Thu, 10 Jun 2021 14:26:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Add checks with regard to punctuation marks
Message-ID: <20210610212617.GW4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <70a41d88-1892-3937-3af5-d3db3657d74c@gmail.com>
 <20210609192347.GJ4397@paulmck-ThinkPad-P17-Gen-1>
 <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a213855a-3357-0217-0973-cc76b11d40ad@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jun 10, 2021 at 10:28:35AM +0900, Akira Yokosawa wrote:
> On Wed, 9 Jun 2021 12:23:47 -0700, Paul E. McKenney wrote:
> > On Wed, Jun 09, 2021 at 11:59:42AM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> It took a while for me to sort out the spacing width after punctuation
> >> marks.
> > 
> > Thank you very much for doing all of this!
> > 
> [...]
> >> All the offending patterns in LaTeX sources have fixed.
> >>
> >> Finally "make" will run both periodcheck and cleverefcheck.
> > 
> > Very good!!!
> > 
> >> As for colons, I'm not sure what is your preference with regard
> >> to capitalization of the next words and the spacing width after
> >> them, so no check is done at the moment.
> >>  
> >> If you have some preference, I can update the scripts to enforce
> >> it.
> > 
> > In this case, I prefer the simple British approach to that of my
> > homeland, so please unconditionally capitalize after a colon.
> > 
> > (Instead of the American approach of doing so only if the word following
> > the colon begins a complete sentence, which is not something I want to
> > be checking manually, let alone via a script!)
> 
> Please find a tentative patch below showing you how the changes would
> look like.
> 
> Does this look reasonable to you?
> 
> A couple of notes:
> 
> o In epigraph of Alice in Wonderland, I see trailing "\\"s
>   can indicate the rule to put ":"s at the end of lines is
>   knowingly broken.  I can add a rule to ignore any violations
>   on a line who has trailing "\\" (even in a comment area).

Could the "\\"s could be moved to the beginning of the next line?

> o One of the hunks in cpu/hwfreelunch.tex
> 
> > @@ -167,8 +167,8 @@ That said, they may be necessary steps on the path to the late Jim Gray's
> >  \label{sec:cpu:Novel Materials and Processes}
> >  
> >  Stephen Hawking is said to have claimed that semiconductor manufacturers
> > -have but two fundamental problems: (1) the finite speed of light and
> > -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> > +have but two fundamental problems:\@ (1)~the finite speed of light and

Now that you mention it, would it work to just put a linebreak after the
":"?

> > +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.
> >  It is possible that semiconductor manufacturers are approaching these
> >  limits, but there are nevertheless a few avenues of research and
> > development focused on working around these fundamental limits.
> 
> keeps lower-case words after (1) and (2) as they are just short
> phrases.

But it would be fine to capitalize those two instances of "the" and
probably simpler all around.

> And the space after the colon is normal-width.
> Do you like capital words and double spacing?

I am not worried about spacing unless it is a monospace font, but
other than comments in code, we should have few if any instances of
end-of-sentence punctuation set in monospace fonts.

>         Thanks, Akira
> 
> -----------8<-----------
> Subject: [PATCH] howto, intro, cpu: Capitalize words after colon
> 
> And make colons at the end of input lines.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  cpu/cpu.tex         |  5 +++--
>  cpu/hwfreelunch.tex | 17 ++++++++++-------
>  cpu/overheads.tex   |  5 +++--
>  cpu/overview.tex    |  8 +++++---
>  howto/howto.tex     |  8 ++++----
>  intro/intro.tex     | 28 ++++++++++++++--------------
>  6 files changed, 39 insertions(+), 32 deletions(-)
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

Looks good!

>  \item	The bad news is that the overhead of cache misses is still high,
>  	especially on large systems.
>  \end{enumerate}
> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
> index 92f04f16..01d3dddd 100644
> --- a/cpu/hwfreelunch.tex
> +++ b/cpu/hwfreelunch.tex
> @@ -167,8 +167,8 @@ That said, they may be necessary steps on the path to the late Jim Gray's
>  \label{sec:cpu:Novel Materials and Processes}
>  
>  Stephen Hawking is said to have claimed that semiconductor manufacturers
> -have but two fundamental problems: (1) the finite speed of light and
> -(2) the atomic nature of matter~\cite{BryanGardiner2007}.
> +have but two fundamental problems:\@ (1)~the finite speed of light and
> +(2)~the atomic nature of matter~\cite{BryanGardiner2007}.

This would be just fine:

	Stephen Hawking is said to have claimed that semiconductor
	manufacturers have but two fundamental problems:
	(1) The finite speed of light and
	(2) the atomic nature of matter~\cite{BryanGardiner2007}.

>  It is possible that semiconductor manufacturers are approaching these
>  limits, but there are nevertheless a few avenues of research and
>  development focused on working around these fundamental limits.
> @@ -228,8 +228,9 @@ general-purpose CPU will normally use a loop (possibly unrolled)
>  with a loop counter.
>  Decoding the instructions, incrementing the loop counter, testing this
>  counter, and branching back to the
> -top of the loop are in some sense wasted effort: the real goal is
> -instead to multiply corresponding elements of the two vectors.
> +top of the loop are in some sense wasted effort:
> +The real goal is instead to multiply corresponding elements of the
> +two vectors.

Looks good!

>  Therefore, a specialized piece of hardware designed specifically to
>  multiply vectors could get the job done more quickly and with less
>  energy consumed.
> @@ -263,10 +264,12 @@ These hardware accelerators are often used for media decoding,
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

Looks good!

>  Nevertheless, given the end of \IXaltr{Moore's-Law}{Moore's Law}-induced
>  single-threaded performance increases, it seems safe to assume that
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 80d60d9d..8cf1e94a 100644
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

Looks good!

> diff --git a/cpu/overview.tex b/cpu/overview.tex
> index d1d23b36..96eecb6f 100644
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
> +	{\emph{Martin Thompson}}

Looks good!

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

Looks good!

>  In both cases, the relevant latencies can be thought of as a cost of
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 0f0ba293..54447c4e 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -50,7 +50,7 @@ that it has brought to us!
>  	  Alice: Which way should I go? \\
>  	  Cat: That depends on where you are going. \\
>  	  Alice: I don't know. \\
> -	  Cat: Then it doesn't matter which way you go.}
> +	  Cat: Then it doesn't matter which way you go.} % \\
>  	 {\emph{Lewis Carroll, Alice in Wonderland}}

Would this work?

	  Alice: Which way should I go? \\
	  \\ Cat: That depends on where you are going.
	  \\ Alice: I don't know.
	  \\ Cat: Then it doesn't matter which way you go.}
	 {\emph{Lewis Carroll, Alice in Wonderland}}

>  This book is a handbook of widely applicable and heavily
> @@ -359,7 +359,7 @@ Fortunately, there are many alternatives available to you:
>  	thorough and accessible introduction with a good set of
>  	examples.
>  \item	If you are interested in C++11, you might like
> -	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action: Practical
> +	\ppl{Anthony}{Williams}'s ``C++ Concurrency in Action:\@ Practical
>  	Multithreading''~\cite{AnthonyWilliams2012,AnthonyWilliams2019}.

A line break after the colon in the title would be just fine.

>  \item	If you are interested in C++, but in a Windows environment,
>  	you might try \ppl{Herb}{Sutter}'s ``Effective Concurrency''
> @@ -528,8 +528,8 @@ namely that you are certifying that:
>  
>  This is quite similar to the Developer's Certificate of Origin (DCO)
>  1.1 used by the Linux kernel.
> -You must use your real name:  I unfortunately cannot accept pseudonymous or
> -anonymous contributions.
> +You must use your real name:
> +I unfortunately cannot accept pseudonymous or anonymous contributions.

Looks good!

>  The language of this book is American English, however, the open-source
>  nature of this book permits translations, and I personally encourage them.
> diff --git a/intro/intro.tex b/intro/intro.tex
> index 5f2690fc..6835c107 100644
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

Looks good!

>  The same is true for many other technologies, including computers.
> @@ -155,8 +155,8 @@ as discussed in \cref{sec:cpu:Hardware Free Lunch?}.
>  	how could a large number of open-source projects, ranging from Apache
>  	to MySQL to the Linux kernel, have managed to master it?
>  
> -	A better question might be: ``Why is parallel programming {\em
> -	perceived} to be so difficult?''
> +	A better question might be:
> +	``Why is parallel programming \emph{perceived} to be so difficult?''

Looks good!

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

Looks good!

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

Looks good!

>  }\QuickQuizEnd
>  
>  Unfortunately, a system that does the job required by user~1 is
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

Looks good!

							Thanx, Paul

>  More generally, each partition requires some sort of communication:
>  After all, if
>  a given thread did not communicate at all, it would have no effect and
> -- 
> 2.17.1
> 
> 
