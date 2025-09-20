Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55922156A
	for <perfbook@vger.kernel.org>; Sat, 20 Sep 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758382309; cv=none; b=ekfL7mBT0xEWrH6+c3mZevQyEKu9wjNRtFBgUvFLb2gtOKcNfWYbYYmiXnFwV0u/PJEz+U8A/Kas6L4p9ohLphT2maO+JeZjZ23qt8ANrMyyoT8bPIdJTW5ltaP0NGjs2J5MLrB6PvgNgmlha+2/ntXa3onCgqgbloyxiRD06ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758382309; c=relaxed/simple;
	bh=P1A52kvce9Dv7DGjk8W0hb2P9iFz7XWkpikB6VvQyWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPfNn5Jmvj9WIuCeA9QhfxEzUbP+76yJIfRmir8yrHSAIgFbHWWzianTlBbqscEXZxiX2fjhRYRZ3NwUJeCcRFX+xeVXZAXL6I/sFjafT2KgUF4CBGtPKccZIRbCFQFa6mAJVvP/oaop49um46sJcOIVZhecaBj7ZVAkKzhbR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfBOWgwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfBOWgwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1985EC4CEF7;
	Sat, 20 Sep 2025 15:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758382308;
	bh=P1A52kvce9Dv7DGjk8W0hb2P9iFz7XWkpikB6VvQyWw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=hfBOWgwzOHsVGw86YGLxtpbcSoLowRlbpzV6zVpI6WrHiE3dV7X7VVHB4832E/lXi
	 nZ8BUhg/He9lG8jXtvJrMCmMppGXnfQxFOd6iH1YpNIlff5Z5QixLtbkSqlJh3fer3
	 2ahTosLMtrr+YazxJT53OE+dmujqP+J8qCX6R2X66nmTZUAgOhXTAT/RKjPMMOVkpU
	 aythUhF8ikImPb66A4S+jzDqLF2+17mryCOuGgViKOP1zs5/xXy8TFr+EaCwlwjeby
	 ash2UjFDozou+a9SX2IOnW4KkGM32W/GuSpwqCy6ae8xhRUuZxk3WhnLx8VNVCOA5C
	 rlSKaL8TwgMwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 263EECE0D09; Sat, 20 Sep 2025 08:31:46 -0700 (PDT)
Date: Sat, 20 Sep 2025 08:31:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org
Subject: Re: [PATCH -perfbook 1/2] treewide: Define \pct for percent sign and
 use it instead of "\,\%"
Message-ID: <13e97c16-7d3f-4d7c-b70b-11c4088c5fbd@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <5779e065-b5b0-4dc3-965f-dbabe56c0d2f@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5779e065-b5b0-4dc3-965f-dbabe56c0d2f@gmail.com>

On Sat, Sep 20, 2025 at 06:21:40PM +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook 1/2] treewide: Define \pct for percent sign and use it instead of "\,\%"
> 
> As mentioned below "---" in the patch submission of commit c6689857b6e6
> ("advsync: Add narrow space in front of percent sign") [1], in the hope
> of making similar issues less likely to happen in the future, define
> a macro for this pattern in the former way (\pct) and make use of it
> treewide.
> 
> Link: https://lore.kernel.org/perfbook/4884acc4-63b4-4b6f-b0bf-c236c193e2ae@gmail.com/ [1]
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you, Akira!

							Thanx, Paul

> ---
>  SMPdesign/SMPdesign.tex            |  2 +-
>  SMPdesign/beyond.tex               | 10 ++--
>  advsync/advsync.tex                | 10 ++--
>  advsync/rt.tex                     |  8 +--
>  appendix/styleguide/styleguide.tex |  2 +-
>  count/count.tex                    |  4 +-
>  cpu/hwfreelunch.tex                |  4 +-
>  debugging/debugging.tex            | 96 +++++++++++++++---------------
>  defer/rcuusage.tex                 |  2 +-
>  formal/dyntickrcu.tex              |  2 +-
>  formal/spinhint.tex                |  4 +-
>  future/formalregress.tex           |  4 +-
>  future/htm.tex                     |  2 +-
>  future/tm.tex                      |  4 +-
>  intro/intro.tex                    |  6 +-
>  perfbook-lt.tex                    |  3 +-
>  summary.tex                        |  2 +-
>  toolsoftrade/toolsoftrade.tex      |  2 +-
>  18 files changed, 84 insertions(+), 83 deletions(-)
> 
> diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
> index 0bc0bcb6..246182c2 100644
> --- a/SMPdesign/SMPdesign.tex
> +++ b/SMPdesign/SMPdesign.tex
> @@ -1264,7 +1264,7 @@ which fortunately is usually quite easy to do in actual
>  practice~\cite{McKenney01e}, especially given today's large memories.
>  For example, in most systems, it is quite reasonable to set
>  \co{TARGET_POOL_SIZE} to 100, in which case allocations and frees
> -are guaranteed to be confined to per-thread pools at least 99\,\% of
> +are guaranteed to be confined to per-thread pools at least 99\pct\ of
>  the time.
>  
>  As can be seen from the figure, the situations where the common-case
> diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
> index e90298ce..fa6218de 100644
> --- a/SMPdesign/beyond.tex
> +++ b/SMPdesign/beyond.tex
> @@ -462,8 +462,8 @@ resulting in large algorithmic superlinear speedups.
>  \end{figure}
>  
>  Further investigation showed that
> -PART sometimes visited fewer than 2\,\% of the maze's cells,
> -while SEQ and PWQ never visited fewer than about 9\,\%.
> +PART sometimes visited fewer than 2\pct\ of the maze's cells,
> +while SEQ and PWQ never visited fewer than about 9\pct.
>  The reason for this difference is shown by
>  \cref{fig:SMPdesign:Reason for Small Visit Percentages}.
>  If the thread traversing the solution from the upper left reaches
> @@ -545,11 +545,11 @@ optimizations are quite attractive.
>  Cache alignment and padding often improves performance by reducing
>  \IX{false sharing}.
>  However, for these maze-solution algorithms, aligning and padding the
> -maze-cell array \emph{degrades} performance by up to 42\,\% for 1000x1000 mazes.
> +maze-cell array \emph{degrades} performance by up to 42\pct\ for 1000x1000 mazes.
>  Cache locality is more important than avoiding
>  false sharing, especially for large mazes.
>  For smaller 20-by-20 or 50-by-50 mazes, aligning and padding can produce
> -up to a 40\,\% performance improvement for PART,
> +up to a 40\pct\ performance improvement for PART,
>  but for these small sizes, SEQ performs better anyway because there
>  is insufficient time for PART to make up for the overhead of
>  thread creation and destruction.
> @@ -580,7 +580,7 @@ between context-switch overhead and visit percentage.
>  As can be seen in
>  \cref{fig:SMPdesign:Partitioned Coroutines},
>  this coroutine algorithm (COPART) is quite effective, with the performance
> -on one thread being within about 30\,\% of PART on two threads
> +on one thread being within about 30\pct\ of PART on two threads
>  (\path{maze_2seq.c}).
>  
>  \subsection{Performance Comparison II}
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index 31731f61..df0d44f5 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -416,7 +416,7 @@ largely orthogonal to those that form the basis of real-time programming:
>  	bound.
>  \item	Real-time forward-progress guarantees are often
>  	probabilistic, as in the soft-real-time guarantee that
> -	``at least 99.9\,\% of the time, scheduling latency must
> +	``at least 99.9\pct\ of the time, scheduling latency must
>  	be less than 100 microseconds.''
>  	In contrast, many of NBS's forward-progress guarantees are
>  	unconditional, which can impose additional unnecessary complexity
> @@ -458,11 +458,11 @@ largely orthogonal to those that form the basis of real-time programming:
>  	As a rough rule of thumb, latency increases as the reciprocal
>  	of the idle time.
>  	In other words, if a nearly idle system has
> -	latency $T$, then a 50\,\% idle system will have latency $2 T$, a
> -	10\,\% idle (90\,\% utilized) system will have latency $10 T$, a 1\,\%
> -	idle system (99\,\% utilized) will have latency $100 T$, and so on.
> +	latency $T$, then a 50\pct\ idle system will have latency $2 T$, a
> +	10\pct\ idle (90\pct\ utilized) system will have latency $10 T$, a 1\pct\
> +	idle system (99\pct\ utilized) will have latency $100 T$, and so on.
>  	This situation means that many latency-sensitive systems will
> -	actively limit load, for example, to 50\,\%.
> +	actively limit load, for example, to 50\pct.
>  \item	In the not-uncommon case where a given computed result is nice
>  	to have rather than critically important, use of timeouts can
>  	cause a blocking operation to have non-blocking properties that
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index b154030f..9331f5c0 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -57,7 +57,7 @@ are clearly required.
>  We might therefore say that a given soft real-time application must meet
>  its response-time requirements at least some fraction of the time, for
>  example, we might say that it must execute in less than 20 microseconds
> -99.9\,\% of the time.
> +99.9\pct\ of the time.
>  
>  This of course raises the question of what is to be done when the application
>  fails to meet its response-time requirements.
> @@ -278,7 +278,7 @@ or even avoiding interrupts altogether in favor of polling.
>  
>  Overloading can also degrade response times due to queueing effects,
>  so it is not unusual for real-time systems to overprovision CPU bandwidth,
> -so that a running system has (say) 80\,\% idle time.
> +so that a running system has (say) 80\pct\ idle time.
>  This approach also applies to storage and networking devices.
>  In some cases, separate storage and networking hardware might be reserved
>  for the sole use of high-priority portions of the real-time application.
> @@ -362,7 +362,7 @@ on the hardware and software implementing those operations.
>  For each such operation, these constraints might include a maximum
>  response time (and possibly also a minimum response time) and a
>  probability of meeting that response time.
> -A probability of 100\,\% indicates that the corresponding operation
> +A probability of 100\pct\ indicates that the corresponding operation
>  must provide hard real-time service.
>  
>  In some cases, both the response times and the required probabilities of
> @@ -1719,7 +1719,7 @@ These constraints include:
>  	latencies are provided only to the highest-priority threads.
>  \item	Sufficient bandwidth to support the workload.
>  	An implementation rule supporting this constraint might be
> -	``There will be at least 50\,\% idle time on all CPUs
> +	``There will be at least 50\pct\ idle time on all CPUs
>  	during normal operation,''
>  	or, more formally, ``The offered load will be sufficiently low
>  	to allow the workload to be schedulable at all times.''
> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
> index 9df2535c..b52f97f2 100644
> --- a/appendix/styleguide/styleguide.tex
> +++ b/appendix/styleguide/styleguide.tex
> @@ -202,7 +202,7 @@ NIST style guide treats the percent symbol (\%) as the same as SI unit
>  symbols.
>  
>  \begin{quote}
> -  50\,\% possibility, rather than 50\% possibility.
> +  50\pct\ possibility, rather than 50\% possibility.
>  \end{quote}
>  
>  \subsubsection{Font Style}
> diff --git a/count/count.tex b/count/count.tex
> index 46b20e86..18619bfd 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -53,7 +53,7 @@ counting.
>  	whatever ``true value'' might mean in this context.
>  	However, the value read out should maintain roughly the same
>  	absolute error over time.
> -	For example, a 1\,\% error might be just fine when the count
> +	For example, a 1\pct\ error might be just fine when the count
>  	is on the order of a million or so, but might be absolutely
>  	unacceptable once the count reaches a trillion.
>  	See \cref{sec:count:Statistical Counters}.
> @@ -199,7 +199,7 @@ On my six-core x86 laptop, a short run invoked \co{inc_count()}
>  285,824,000 times, but the final value of the counter was only
>  35,385,525.
>  Although approximation does have a large place in computing, loss of
> -87\,\% of the counts is a bit excessive.
> +87\pct\ of the counts is a bit excessive.
>  
>  \QuickQuizSeries{%
>  \QuickQuizB{
> diff --git a/cpu/hwfreelunch.tex b/cpu/hwfreelunch.tex
> index a7c033c1..15bc3b2a 100644
> --- a/cpu/hwfreelunch.tex
> +++ b/cpu/hwfreelunch.tex
> @@ -170,13 +170,13 @@ excellent bragging rights, if nothing else!
>  Although the speed of light would be a hard limit, the fact is that
>  semiconductor devices are limited by the speed of electricity rather
>  than that of light, given that electric waves in semiconductor materials
> -move at between 3\,\% and 30\,\% of the speed of light in a vacuum.
> +move at between 3\pct\ and 30\pct\ of the speed of light in a vacuum.
>  The use of copper connections on silicon devices is one way to increase
>  the speed of electricity, and it is quite possible that additional
>  advances will push closer still to the actual speed of light.
>  In addition, there have been some experiments with tiny optical fibers
>  as interconnects within and between chips, based on the fact that
> -the speed of light in glass is more than 60\,\% of the speed of light
> +the speed of light in glass is more than 60\pct\ of the speed of light
>  in a vacuum.
>  One obstacle to such optical fibers is the inefficiency conversion
>  between electricity and light and vice versa, resulting in both
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 75226a46..f285ebc1 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -1287,18 +1287,18 @@ We therefore start with discrete tests.
>  \subsection{Statistics for Discrete Testing}
>  \label{sec:debugging:Statistics for Discrete Testing}
>  
> -Suppose a bug has a 10\,\% chance of occurring in a given run and that
> +Suppose a bug has a 10\pct\ chance of occurring in a given run and that
>  we do five runs.
>  How do we compute the probability of at least one run failing?
>  Here is one way:
>  
>  \begin{enumerate}
> -\item	Compute the probability of a given run succeeding, which is 90\,\%.
> +\item	Compute the probability of a given run succeeding, which is 90\pct.
>  \item	Compute the probability of all five runs succeeding, which
> -	is 0.9 raised to the fifth power, or about 59\,\%.
> +	is 0.9 raised to the fifth power, or about 59\pct.
>  \item	Because either all five runs succeed, or at least one fails,
> -	subtract the 59\,\% expected success rate from 100\,\%, yielding
> -	a 41\,\% expected failure rate.
> +	subtract the 59\pct\ expected success rate from 100\pct, yielding
> +	a 41\pct\ expected failure rate.
>  \end{enumerate}
>  
>  For those preferring formulas, call the probability of a single failure $f$.
> @@ -1318,36 +1318,36 @@ The probability of failure is $1-S_n$, or:
>  
>  \QuickQuiz{
>  	Say what???
> -	When I plug the earlier five-test 10\,\%-failure-rate example into
> -	the formula, I get 59,050\,\% and that just doesn't make sense!!!
> +	When I plug the earlier five-test 10\pct-failure-rate example into
> +	the formula, I get 59,050\pct\ and that just doesn't make sense!!!
>  }\QuickQuizAnswer{
>  	You are right, that makes no sense at all.
>  
>  	Remember that a probability is a number between zero and one,
>  	so that you need to divide a percentage by 100 to get a
>  	probability.
> -	So 10\,\% is a probability of 0.1, which gets a probability
> -	of 0.4095, which rounds to 41\,\%, which quite sensibly
> +	So 10\pct\ is a probability of 0.1, which gets a probability
> +	of 0.4095, which rounds to 41\pct, which quite sensibly
>  	matches the earlier result.
>  }\QuickQuizEnd
>  
> -So suppose that a given test has been failing 10\,\% of the time.
> -How many times do you have to run the test to be 99\,\% sure that
> +So suppose that a given test has been failing 10\pct\ of the time.
> +How many times do you have to run the test to be 99\pct\ sure that
>  your alleged fix actually helped?
>  
>  Another way to ask this question is ``How many times would we need
> -to run the test to cause the probability of failure to rise above 99\,\%?''
> +to run the test to cause the probability of failure to rise above 99\pct?''
>  After all, if we were to run the test enough times that the probability
> -of seeing at least one failure becomes 99\,\%, and none of these test
> +of seeing at least one failure becomes 99\pct, and none of these test
>  runs fail,
> -there is only 1\,\% probability of this ``success'' being due to dumb luck.
> +there is only 1\pct\ probability of this ``success'' being due to dumb luck.
>  And if we plug $f=0.1$ into
>  \cref{eq:debugging:Binomial Failure Rate} and vary $n$,
> -we find that 43 runs gives us a 98.92\,\% chance of at least one test failing
> -given the original 10\,\% per-test failure rate,
> -while 44 runs gives us a 99.03\,\% chance of at least one test failing.
> +we find that 43 runs gives us a 98.92\pct\ chance of at least one test failing
> +given the original 10\pct\ per-test failure rate,
> +while 44 runs gives us a 99.03\pct\ chance of at least one test failing.
>  So if we run the test on our fix 44 times and see no failures, there
> -is a 99\,\% probability that our fix really did help.
> +is a 99\pct\ probability that our fix really did help.
>  
>  But repeatedly plugging numbers into
>  \cref{eq:debugging:Binomial Failure Rate}
> @@ -1369,7 +1369,7 @@ Finally the number of tests required is given by:
>  Plugging $f=0.1$ and $F_n=0.99$ into
>  \cref{eq:debugging:Binomial Number of Tests Required}
>  gives 43.7, meaning that we need 44 consecutive successful test
> -runs to be 99\,\% certain that our fix was a real improvement.
> +runs to be 99\pct\ certain that our fix was a real improvement.
>  This matches the number obtained by the previous method, which
>  is reassuring.
>  
> @@ -1394,9 +1394,9 @@ is reassuring.
>  \Cref{fig:debugging:Number of Tests Required for 99 Percent Confidence Given Failure Rate}
>  shows a plot of this function.
>  Not surprisingly, the less frequently each test run fails, the more
> -test runs are required to be 99\,\% confident that the bug has been
> +test runs are required to be 99\pct\ confident that the bug has been
>  at least partially fixed.
> -If the bug caused the test to fail only 1\,\% of the time, then a
> +If the bug caused the test to fail only 1\pct\ of the time, then a
>  mind-boggling 458 test runs are required.
>  As the failure probability decreases, the number of test runs required
>  increases, going to infinity as the failure probability goes to zero.
> @@ -1404,18 +1404,18 @@ increases, going to infinity as the failure probability goes to zero.
>  The moral of this story is that when you have found a rarely occurring
>  bug, your testing job will be much easier if you can come up with
>  a carefully targeted test (or ``reproducer'') with a much higher failure rate.
> -For example, if your reproducer raised the failure rate from 1\,\%
> -to 30\,\%, then the number of runs required for 99\,\% confidence
> +For example, if your reproducer raised the failure rate from 1\pct\
> +to 30\pct, then the number of runs required for 99\pct\ confidence
>  would drop from 458 to a more tractable 13.
>  
> -But these thirteen test runs would only give you 99\,\% confidence that
> +But these thirteen test runs would only give you 99\pct\ confidence that
>  your fix had produced ``some improvement''.
> -Suppose you instead want to have 99\,\% confidence that your fix reduced
> +Suppose you instead want to have 99\pct\ confidence that your fix reduced
>  the failure rate by an order of magnitude.
>  How many failure-free test runs are required?
>  
> -An order of magnitude improvement from a 30\,\% failure rate would be
> -a 3\,\% failure rate.
> +An order of magnitude improvement from a 30\pct\ failure rate would be
> +a 3\pct\ failure rate.
>  Plugging these numbers into
>  \cref{eq:debugging:Binomial Number of Tests Required} yields:
>  
> @@ -1439,14 +1439,14 @@ These skills will be covered in
>  But suppose that you have a continuous test that fails about three
>  times every ten hours, and that you fix the bug that you believe was
>  causing the failure.
> -How long do you have to run this test without failure to be 99\,\% certain
> +How long do you have to run this test without failure to be 99\pct\ certain
>  that you reduced the probability of failure?
>  
>  Without doing excessive violence to statistics, we could simply
> -redefine a one-hour run to be a discrete test that has a 30\,\%
> +redefine a one-hour run to be a discrete test that has a 30\pct\
>  probability of failure.
>  Then the results of in the previous section tell us that if the test
> -runs for 13 hours without failure, there is a 99\,\% probability that
> +runs for 13 hours without failure, there is a 99\pct\ probability that
>  our fix actually improved the program's reliability.
>  
>  A dogmatic statistician might not approve of this approach, but the sad
> @@ -1476,9 +1476,9 @@ this book~\cite[Equations 11.8--11.26]{McKenney2014ParallelProgramming-e1}.
>  Let's rework the example from
>  \cref{sec:debugging:Statistics Abuse for Discrete Testing}
>  using the Poisson distribution.
> -Recall that this example involved an alleged fix for a bug with a 30\,\%
> +Recall that this example involved an alleged fix for a bug with a 30\pct\
>  failure rate per hour.
> -If we need to be 99\,\% certain that the fix actually reduced the failure
> +If we need to be 99\pct\ certain that the fix actually reduced the failure
>  rate, how long an error-free test run is required?
>  In this case, $m$ is zero, so that
>  \cref{eq:debugging:Poisson Probability} reduces to:
> @@ -1495,11 +1495,11 @@ to 0.01 and solving for $\lambda$, resulting in:
>  \end{equation}
>  
>  Because we get $0.3$ failures per hour, the number of hours required
> -is $4.6/0.3 = 14.3$, which is within 10\,\% of the 13 hours
> +is $4.6/0.3 = 14.3$, which is within 10\pct\ of the 13 hours
>  calculated using the method in
>  \cref{sec:debugging:Statistics Abuse for Discrete Testing}.
>  Given that you normally won't know your failure rate to anywhere near
> -10\,\%, the simpler method described in
> +10\pct, the simpler method described in
>  \cref{sec:debugging:Statistics Abuse for Discrete Testing}
>  is almost always good and sufficient.
>  
> @@ -1507,7 +1507,7 @@ However, those wanting to learn more about statistics for continuous
>  testing are encouraged to read on.
>  
>  More generally, if we have $n$ failures per unit time, and we want to
> -be $P$\,\% certain that a fix reduced the failure rate, we can use the
> +be $P$\pct\ certain that a fix reduced the failure rate, we can use the
>  following formula:
>  
>  \begin{equation}
> @@ -1518,7 +1518,7 @@ following formula:
>  \QuickQuiz{
>  	Suppose that a bug causes a test failure three times per hour
>  	on average.
> -	How long must the test run error-free to provide 99.9\,\%
> +	How long must the test run error-free to provide 99.9\pct\
>  	confidence that the fix significantly reduced the probability
>  	of failure by at least a little bit?
>  }\QuickQuizAnswer{
> @@ -1529,7 +1529,7 @@ following formula:
>  		T = - \frac{1}{3} \ln \frac{100 - 99.9}{100} = 2.3
>  	\end{equation}
>  
> -	If the test runs without failure for 2.3 hours, we can be 99.9\,\%
> +	If the test runs without failure for 2.3 hours, we can be 99.9\pct\
>  	certain that the fix reduced (by at least some small amount)
>  	the probability of failure.
>  }\QuickQuizEnd
> @@ -1580,7 +1580,7 @@ giving this result:
>  \end{equation}
>  
>  Continuing our example with $m=2$ and $\lambda=24$, this gives a confidence
> -of about 0.999999988, or equivalently, 99.9999988\,\%.
> +of about 0.999999988, or equivalently, 99.9999988\pct.
>  This level of confidence should satisfy all but the purest of purists.
>  
>  But what if we are interested not in ``some relationship'' to the bug,
> @@ -1588,7 +1588,7 @@ but instead in at least an order of magnitude \emph{reduction} in its
>  expected frequency of occurrence?
>  Then we divide $\lambda$ by ten, and plug $m=2$ and $\lambda=2.4$ into
>  \cref{eq:debugging:Possion Confidence},
> -which gives but a 90.9\,\% confidence level.
> +which gives but a 90.9\pct\ confidence level.
>  This illustrates the sad fact that increasing either statistical
>  confidence or degree of improvement, let alone both, can be quite
>  expensive.
> @@ -1648,10 +1648,10 @@ expensive.
>  
>  	Another approach is to recognize that in this real world,
>  	it is not all that useful to compute (say) the duration of a test
> -	having two or fewer errors that would give a 76.8\,\% confidence
> +	having two or fewer errors that would give a 76.8\pct\ confidence
>  	of a 349.2x improvement in reliability.
>  	Instead, human beings tend to focus on specific values, for
> -	example, a 95\,\% confidence of a 10x improvement.
> +	example, a 95\pct\ confidence of a 10x improvement.
>  	People also greatly prefer error-free test runs, and so should
>  	you because doing so reduces your required test durations.
>  	Therefore, it is quite possible that the values in
> @@ -1662,7 +1662,7 @@ expensive.
>  	error-free test duration in terms of the expected time for
>  	a single error to appear.
>  	So if your pre-fix testing suffered one failure per hour, and the
> -	powers that be require a 95\,\% confidence of a 10x improvement,
> +	powers that be require a 95\pct\ confidence of a 10x improvement,
>  	you need a 30-hour error-free run.
>  
>  	Alternatively, you can use the rough-and-ready method described in
> @@ -1991,7 +1991,7 @@ delay might be counted as a near miss.\footnote{
>  For example, a low-probability bug in RCU priority boosting occurred
>  roughly once every hundred hours of focused \co{rcutorture} testing.
>  Because it would take almost 500 hours of failure-free testing to be
> -99\,\% certain that the bug's probability had been significantly reduced,
> +99\pct\ certain that the bug's probability had been significantly reduced,
>  the \co{git bisect} process
>  to find the failure would be painfully slow---or would require an extremely
>  large test farm.
> @@ -2221,12 +2221,12 @@ much a bug as is incorrectness.
>  	Although I do heartily salute your spirit and aspirations,
>  	you are forgetting that there may be high costs due to delays
>  	in the program's completion.
> -	For an extreme example, suppose that a 30\,\% performance shortfall
> +	For an extreme example, suppose that a 30\pct\ performance shortfall
>  	from a single-threaded application is causing one person to die
>  	each day.
>  	Suppose further that in a day you could hack together a
>  	quick and dirty
> -	parallel program that ran 50\,\% faster on an eight-CPU system.
> +	parallel program that ran 50\pct\ faster on an eight-CPU system.
>  	This is of course horrible scalability, given that the seven
>  	additional CPUs provide only half a CPU's worth of additional
>  	performance.
> @@ -2698,7 +2698,7 @@ This script takes three optional arguments as follows:
>  \item	[\lopt{relerr}\nf{:}] Relative measurement error.
>  	The script assumes that values that differ by less than this
>  	error are for all intents and purposes equal.
> -	This defaults to 0.01, which is equivalent to 1\,\%.
> +	This defaults to 0.01, which is equivalent to 1\pct.
>  \item	[\lopt{trendbreak}\nf{:}] Ratio of inter-element spacing
>  	constituting a break in the trend of the data.
>  	For example, if the average spacing in the data accepted so far
> @@ -2769,7 +2769,7 @@ statistics.
>  }\QuickQuizAnswerB{
>  	Because mean and standard deviation were not designed to do this job.
>  	To see this, try applying mean and standard deviation to the
> -	following data set, given a 1\,\% relative error in measurement:
> +	following data set, given a 1\pct\ relative error in measurement:
>  
>  	\begin{quote}
>  		49,548.4 49,549.4 49,550.2 49,550.9 49,550.9 49,551.0
> @@ -2906,7 +2906,7 @@ estimated to have more than 20 billion instances running throughout
>  the world?
>  In that case, a bug that occurs once every million years on a single system
>  will be encountered more than 50 times per day across the installed base.
> -A test with a 50\,\% chance of encountering this bug in a one-hour run
> +A test with a 50\pct\ chance of encountering this bug in a one-hour run
>  would need to increase that bug's probability of occurrence by more than
>  ten orders of magnitude, which poses a severe challenge to
>  today's testing methodologies.
> diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
> index 3db94b21..6225c672 100644
> --- a/defer/rcuusage.tex
> +++ b/defer/rcuusage.tex
> @@ -1619,7 +1619,7 @@ number of ways, but most commonly by imposing spatial constraints:
>  
>  Of course, there are some reader-writer-locking use cases for which
>  RCU's weakened semantics are inappropriate, but experience in the Linux
> -kernel indicates that more than 80\% of reader-writer locks can in fact
> +kernel indicates that more than 80\pct\ of reader-writer locks can in fact
>  be replaced by RCU\@.
>  For example, a common reader-writer-locking use case computes some value
>  while holding the lock and then uses that value after releasing that lock.
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index efd1108d..e0b2d455 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -1112,7 +1112,7 @@ states, passing without errors.
>  	\end{quote}
>  
>  	This means that any attempt to optimize the production of code should
> -	place at least 66\,\% of its emphasis on optimizing the debugging process,
> +	place at least 66\pct\ of its emphasis on optimizing the debugging process,
>  	even at the expense of increasing the time and effort spent coding.
>  	Incremental coding and testing is one way to optimize the debugging
>  	process, at the expense of some increase in coding effort.
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index cc092bcf..17ee2a5d 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -290,7 +290,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
>  	run \co{top} in one window and \co{./pan} in another.
>  	Keep the focus on the \co{./pan} window so that you can quickly
>  	kill execution if need be.
> -	As soon as CPU time drops much below 100\,\%, kill \co{./pan}.
> +	As soon as CPU time drops much below 100\pct, kill \co{./pan}.
>  	If you have removed focus from the window running \co{./pan},
>  	you may wait a long time for the windowing system to grab
>  	enough memory to do anything for you.
> @@ -963,7 +963,7 @@ lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
>  \end{listing}
>  
>  \QuickQuiz{
> -	A compression rate of 0.48\,\% corresponds to a 200-to-1 decrease
> +	A compression rate of 0.48\pct\ corresponds to a 200-to-1 decrease
>  	in memory occupied by the states!
>  	Is the state-space search \emph{really} exhaustive???
>  }\QuickQuizAnswer{
> diff --git a/future/formalregress.tex b/future/formalregress.tex
> index b674d616..786fd7ad 100644
> --- a/future/formalregress.tex
> +++ b/future/formalregress.tex
> @@ -462,7 +462,7 @@ What happens to the reliability of this software artifact?
>  The answer is that the reliability \emph{decreases}.
>  
>  To see this, keep in mind that historical experience indicates that
> -about 7\,\% of fixes introduce a new bug~\cite{RexBlack2012SQA}.
> +about 7\pct\ of fixes introduce a new bug~\cite{RexBlack2012SQA}.
>  Therefore, fixing the 100 bugs, which had a combined mean time to failure
>  (MTBF) of about 10,000 years, will introduce seven more bugs.
>  Historical statistics indicate that each new bug will have an MTBF
> @@ -479,7 +479,7 @@ decreased the reliability of the overall software.
>  }\QuickQuizAnswerB{
>  	We don't, but it does not matter.
>  
> -	To see this, note that the 7\,\% figure only applies to injected
> +	To see this, note that the 7\pct\ figure only applies to injected
>  	bugs that were subsequently located:
>  	It necessarily ignores any injected bugs that were never found.
>  	Therefore, the MTBF statistics of known bugs is likely to be
> diff --git a/future/htm.tex b/future/htm.tex
> index c9e5467e..9a02225d 100644
> --- a/future/htm.tex
> +++ b/future/htm.tex
> @@ -1214,7 +1214,7 @@ by Siakavaras et al.~\cite{Siakavaras2017CombiningHA},
>  is to use RCU for read-only traversals and HTM
>  only for the actual updates themselves.
>  This combination outperformed other transactional-memory techniques by
> -up to 220\,\%, a speedup similar to that observed by
> +up to 220\pct, a speedup similar to that observed by
>  Howard and Walpole~\cite{PhilHoward2011RCUTMRBTree}
>  when they combined RCU with STM\@.
>  In both cases, the weak atomicity is implemented in software rather than
> diff --git a/future/tm.tex b/future/tm.tex
> index db08bcc6..db38ca80 100644
> --- a/future/tm.tex
> +++ b/future/tm.tex
> @@ -767,8 +767,8 @@ Simply manipulate the data structure representing the lock as part of
>  the transaction, and everything works out perfectly.
>  In practice, a number of non-obvious complications~\cite{Volos2008TRANSACT}
>  can arise, depending on implementation details of the TM system.
> -These complications can be resolved, but at the cost of a 45\,\% increase in
> -overhead for locks acquired outside of transactions and a 300\,\% increase
> +These complications can be resolved, but at the cost of a 45\pct\ increase in
> +overhead for locks acquired outside of transactions and a 300\pct\ increase
>  in overhead for locks acquired within transactions.
>  Although these overheads might be acceptable for transactional
>  programs containing small amounts of locking, they are often completely
> diff --git a/intro/intro.tex b/intro/intro.tex
> index e00462bd..ae47a528 100644
> --- a/intro/intro.tex
> +++ b/intro/intro.tex
> @@ -442,7 +442,7 @@ To see this, consider that the price of early computers was tens
>  of millions of dollars at
>  a time when engineering salaries were but a few thousand dollars a year.
>  If dedicating a team of ten engineers to such a machine would improve
> -its performance, even by only 10\,\%, then their salaries
> +its performance, even by only 10\pct, then their salaries
>  would be repaid many times over.
>  
>  One such machine was the CSIRAC, the oldest still-intact stored-program
> @@ -917,11 +917,11 @@ been extremely narrowly focused, and hence unable to demonstrate any
>  general results.
>  Furthermore, given that the normal range of programmer productivity
>  spans more than an order of magnitude, it is unrealistic to expect
> -an affordable study to be capable of detecting (say) a 10\,\% difference
> +an affordable study to be capable of detecting (say) a 10\pct\ difference
>  in productivity.
>  Although the multiple-order-of-magnitude differences that such studies
>  \emph{can} reliably detect are extremely valuable, the most impressive
> -improvements tend to be based on a long series of 10\,\% improvements.
> +improvements tend to be based on a long series of 10\pct\ improvements.
>  
>  We must therefore take a different approach.
>  
> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
> index 25f16ff0..1c7ea47e 100644
> --- a/perfbook-lt.tex
> +++ b/perfbook-lt.tex
> @@ -90,7 +90,7 @@
>  \setlength{\epigraphwidth}{2.6in}
>  \usepackage[xspace]{ellipsis}
>  \usepackage{braket} % for \ket{} macro in QC section
> -\usepackage{siunitx} % for \num{} macro
> +\usepackage{siunitx} % for \num{} macro and \unit{} (such as \percent)
>  \sisetup{group-minimum-digits=4,group-separator={,},group-digits=integer}
>  \usepackage{multirow}
>  \usepackage{noindentafter}
> @@ -612,6 +612,7 @@
>  \newcommand{\IRQ}{IRQ}
>  %\newcommand{\IRQ}{irq}      % For those who prefer "irq"
>  \newcommand{\rt}{\mbox{-rt}} % to prevent line break behind "-"
> +\newcommand{\pct}{\,\unit{\percent}}
>  
>  \let\epigraphorig\epigraph
>  \renewcommand{\epigraph}[2]{\epigraphorig{\biolinum\emph{#1}}{\biolinum\scshape\footnotesize #2}}
> diff --git a/summary.tex b/summary.tex
> index 18379692..15f17d0e 100644
> --- a/summary.tex
> +++ b/summary.tex
> @@ -243,7 +243,7 @@ And this book is also a salute to that unnamed panelist's unnamed employer.
>  Some years later, this employer choose to appoint someone with more
>  useful experience and fewer sound bites.
>  That someone was also on a panel, and during that session he looked
> -directly at me when he stated that parallel programming was perhaps 5\%
> +directly at me when he stated that parallel programming was perhaps 5\pct\
>  more difficult than sequential programming.
>  
>  For the rest of us, when someone tries to show us a solution to pressing
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index bb7c8cc2..e1b24f3e 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -911,7 +911,7 @@ thread must wait for all the other 447 threads to do their updates.
>  This situation will only get worse as you add CPUs.
>  Note also the logscale y-axis.
>  Even though the 10,000\,microsecond trace appears quite ideal, it has
> -in fact degraded by about 10\,\% from ideal.
> +in fact degraded by about 10\pct\ from ideal.
>  
>  \QuickQuizSeries{%
>  \QuickQuizB{
> 
> base-commit: c6689857b6e6efae214652baadb5fe2bdb8bd594
> -- 
> 2.43.0
> 
