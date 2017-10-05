Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=srYIwHRPZ/9jkRLzRo9x6b822XHKrlN+Lv0razoMlLg=;
 b=TNNcP1G/MyZ0FcIC6Iq+1wfprgfe8fD4tkZeL5w1h8u0pLtzOZ+lZddBaEnlC7+Scx
 /CvjGepwmTx9TeCBNourfNYuWOoDjgungBYJdepIE08Jl3mjsTKkf8YXFIDeGf+vkDQX
 B6Odu+C1krEAH7GhzlFMRXuX8aMJdYvlQacP3gOWWXJQmr1hzYNxbxXbTs/qXQmTJmRO
 XtNJj5acSmQ86uf0pEG13IgQ5VkYtpbivZTe+klAm07pdWjjxtm8jnwgW0nK3xUsLKyq
 2Ye7SvgE6SSMDEKAje8Rvniwz/vogbSnri70nBlkqkStDntFfd9P+qJzJueGlfeXetCR
 ubXA==
Subject: [PATCH 01/10] debugging: Insert narrow space in front of percent
 symbol
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <054dc1b1-e923-8da3-ff6d-406d558215db@gmail.com>
Date: Fri, 6 Oct 2017 00:48:54 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b67d6df0f0621907e81f419784f6b63b09619e9a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Sep 2017 16:20:34 +0900
Subject: [PATCH 01/10] debugging: Insert narrow space in front of percent symbol

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 82 ++++++++++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 0199720..5747656 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -1025,19 +1025,19 @@ We therefore start with discrete tests.
 \subsection{Statistics for Discrete Testing}
 \label{sec:debugging:Statistics for Discrete Testing}

-Suppose that the bug had a 10\% chance of occurring in
+Suppose that the bug had a 10\,\% chance of occurring in
 a given run and that we do five runs.
 How do we compute that probability of at least one run failing?
 One way is as follows:

 \begin{enumerate}
-\item	Compute the probability of a given run succeeding, which is 90\%.
+\item	Compute the probability of a given run succeeding, which is 90\,\%.
 \item	Compute the probability of all five runs succeeding, which
-	is 0.9 raised to the fifth power, or about 59\%.
+	is 0.9 raised to the fifth power, or about 59\,\%.
 \item	There are only two possibilities: either all five runs succeed,
 	or at least one fails.
 	Therefore, the probability of at least one failure is
-	59\% taken away from 100\%, or 41\%.
+	59\,\% taken away from 100\,\%, or 41\,\%.
 \end{enumerate}

 However, many people find it easier to work with a formula than a series
@@ -1060,7 +1060,7 @@ The probability of failure is $1-S_n$, or:
 \QuickQuiz{}
 	Say what???
 	When I plug the earlier example of five tests each with a
-	10\% failure rate into the formula, I get 59,050\% and that
+	10\,\% failure rate into the formula, I get 59,050\,\% and that
 	just doesn't make sense!!!
 \QuickQuizAnswer{
 	You are right, that makes no sense at all.
@@ -1068,27 +1068,27 @@ The probability of failure is $1-S_n$, or:
 	Remember that a probability is a number between zero and one,
 	so that you need to divide a percentage by 100 to get a
 	probability.
-	So 10\% is a probability of 0.1, which gets a probability
-	of 0.4095, which rounds to 41\%, which quite sensibly
+	So 10\,\% is a probability of 0.1, which gets a probability
+	of 0.4095, which rounds to 41\,\%, which quite sensibly
 	matches the earlier result.
 } \QuickQuizEnd

-So suppose that a given test has been failing 10\% of the time.
-How many times do you have to run the test to be 99\% sure that
+So suppose that a given test has been failing 10\,\% of the time.
+How many times do you have to run the test to be 99\,\% sure that
 your supposed fix has actually improved matters?

 Another way to ask this question is ``How many times would we need
-to run the test to cause the probability of failure to rise above 99\%?''
+to run the test to cause the probability of failure to rise above 99\,\%?''
 After all, if we were to run the test enough times that the probability
-of seeing at least one failure becomes 99\%, if there are no failures,
-there is only 1\% probability of this being due to dumb luck.
+of seeing at least one failure becomes 99\,\%, if there are no failures,
+there is only 1\,\% probability of this being due to dumb luck.
 And if we plug $f=0.1$ into
 Equation~\ref{eq:debugging:Binomial Failure Rate} and vary $n$,
-we find that 43 runs gives us a 98.92\% chance of at least one test failing
-given the original 10\% per-test failure rate,
-while 44 runs gives us a 99.03\% chance of at least one test failing.
+we find that 43 runs gives us a 98.92\,\% chance of at least one test failing
+given the original 10\,\% per-test failure rate,
+while 44 runs gives us a 99.03\,\% chance of at least one test failing.
 So if we run the test on our fix 44 times and see no failures, there
-is a 99\% probability that our fix was actually a real improvement.
+is a 99\,\% probability that our fix was actually a real improvement.

 But repeatedly plugging numbers into
 Equation~\ref{eq:debugging:Binomial Failure Rate}
@@ -1110,7 +1110,7 @@ Finally the number of tests required is given by:
 Plugging $f=0.1$ and $F_n=0.99$ into
 Equation~\ref{eq:debugging:Binomial Number of Tests Required}
 gives 43.7, meaning that we need 44 consecutive successful test
-runs to be 99\% certain that our fix was a real improvement.
+runs to be 99\,\% certain that our fix was a real improvement.
 This matches the number obtained by the previous method, which
 is reassuring.

@@ -1135,9 +1135,9 @@ is reassuring.
 Figure~\ref{fig:debugging:Number of Tests Required for 99 Percent Confidence Given Failure Rate}
 shows a plot of this function.
 Not surprisingly, the less frequently each test run fails, the more
-test runs are required to be 99\% confident that the bug has been
+test runs are required to be 99\,\% confident that the bug has been
 fixed.
-If the bug caused the test to fail only 1\% of the time, then a
+If the bug caused the test to fail only 1\,\% of the time, then a
 mind-boggling 458 test runs are required.
 As the failure probability decreases, the number of test runs required
 increases, going to infinity as the failure probability goes to zero.
@@ -1145,18 +1145,18 @@ increases, going to infinity as the failure probability goes to zero.
 The moral of this story is that when you have found a rarely occurring
 bug, your testing job will be much easier if you can come up with
 a carefully targeted test with a much higher failure rate.
-For example, if your targeted test raised the failure rate from 1\%
-to 30\%, then the number of runs required for 99\% confidence
+For example, if your targeted test raised the failure rate from 1\,\%
+to 30\,\%, then the number of runs required for 99\,\% confidence
 would drop from 458 test runs to a mere thirteen test runs.

-But these thirteen test runs would only give you 99\% confidence that
+But these thirteen test runs would only give you 99\,\% confidence that
 your fix had produced ``some improvement''.
-Suppose you instead want to have 99\% confidence that your fix reduced
+Suppose you instead want to have 99\,\% confidence that your fix reduced
 the failure rate by an order of magnitude.
 How many failure-free test runs are required?

-An order of magnitude improvement from a 30\% failure rate would be
-a 3\% failure rate.
+An order of magnitude improvement from a 30\,\% failure rate would be
+a 3\,\% failure rate.
 Plugging these numbers into
 Equation~\ref{eq:debugging:Binomial Number of Tests Required} yields:

@@ -1178,14 +1178,14 @@ Section~\ref{sec:debugging:Hunting Heisenbugs}.
 But suppose that you have a continuous test that fails about three
 times every ten hours, and that you fix the bug that you believe was
 causing the failure.
-How long do you have to run this test without failure to be 99\% certain
+How long do you have to run this test without failure to be 99\,\% certain
 that you reduced the probability of failure?

 Without doing excessive violence to statistics, we could simply
-redefine a one-hour run to be a discrete test that has a 30\%
+redefine a one-hour run to be a discrete test that has a 30\,\%
 probability of failure.
 Then the results of in the previous section tell us that if the test
-runs for 13 hours without failure, there is a 99\% probability that
+runs for 13 hours without failure, there is a 99\,\% probability that
 our fix actually improved the program's reliability.

 A dogmatic statistician might not approve of this approach, but the
@@ -1216,10 +1216,10 @@ this book~\cite{McKenney2014ParallelProgramming-e1}.
 Let's try reworking the example from
 Section~\ref{sec:debugging:Abusing Statistics for Discrete Testing}
 using the Poisson distribution.
-Recall that this example involved a test with a 30\% failure rate per
+Recall that this example involved a test with a 30\,\% failure rate per
 hour, and that the question was how long the test would need to run
 error-free
-on a alleged fix to be 99\% certain that the fix actually reduced the
+on a alleged fix to be 99\,\% certain that the fix actually reduced the
 failure rate.
 In this case, $\lambda$ is zero, so that
 Equation~\ref{eq:debugging:Poisson Probability} reduces to:
@@ -1236,17 +1236,17 @@ to 0.01 and solving for $\lambda$, resulting in:
 \end{equation}

 Because we get $0.3$ failures per hour, the number of hours required
-is $4.6/0.3 = 14.3$, which is within 10\% of the 13 hours
+is $4.6/0.3 = 14.3$, which is within 10\,\% of the 13 hours
 calculated using the method in
 Section~\ref{sec:debugging:Abusing Statistics for Discrete Testing}.
-Given that you normally won't know your failure rate to within 10\%,
+Given that you normally won't know your failure rate to within 10\,\%,
 this indicates that the method in
 Section~\ref{sec:debugging:Abusing Statistics for Discrete Testing}
 is a good and sufficient substitute for the Poisson distribution in
 a great many situations.

 More generally, if we have $n$ failures per unit time, and we want to
-be P\% certain that a fix reduced the failure rate, we can use the
+be P\,\% certain that a fix reduced the failure rate, we can use the
 following formula:

 \begin{equation}
@@ -1257,7 +1257,7 @@ following formula:
 \QuickQuiz{}
 	Suppose that a bug causes a test failure three times per hour
 	on average.
-	How long must the test run error-free to provide 99.9\%
+	How long must the test run error-free to provide 99.9\,\%
 	confidence that the fix significantly reduced the probability
 	of failure?
 \QuickQuizAnswer{
@@ -1268,7 +1268,7 @@ following formula:
 		T = - \frac{1}{3} \log \frac{100 - 99.9}{100} = 2.3
 	\end{equation}

-	If the test runs without failure for 2.3 hours, we can be 99.9\%
+	If the test runs without failure for 2.3 hours, we can be 99.9\,\%
 	certain that the fix reduced the probability of failure.
 } \QuickQuizEnd

@@ -1616,7 +1616,7 @@ delay might be counted as a near miss.\footnote{
 For example, a low-probability bug in RCU priority boosting occurred
 roughly once every hundred hours of focused rcutorture testing.
 Because it would take almost 500 hours of failure-free testing to be
-99\% certain that the bug's probability had been significantly reduced,
+99\,\% certain that the bug's probability had been significantly reduced,
 the \co{git bisect} process
 to find the failure would be painfully slow---or would require an extremely
 large test farm.
@@ -1782,12 +1782,12 @@ much a bug as is incorrectness.
 	Although I do heartily salute your spirit and aspirations,
 	you are forgetting that there may be high costs due to delays
 	in the program's completion.
-	For an extreme example, suppose that a 40\% performance shortfall
+	For an extreme example, suppose that a 40\,\% performance shortfall
 	from a single-threaded application is causing one person to die
 	each day.
 	Suppose further that in a day you could hack together a
 	quick and dirty
-	parallel program that ran 50\% faster on an eight-CPU system
+	parallel program that ran 50\,\% faster on an eight-CPU system
 	than the sequential version, but that an optimal parallel
 	program would require four months of painstaking design, coding,
 	debugging, and tuning.
@@ -2265,7 +2265,7 @@ This script takes three optional arguments as follows:
 \item	[\tco{--relerr}\nf{:}] Relative measurement error.  The script assumes
 	that values that differ by less than this error are for all
 	intents and purposes equal.
-	This defaults to 0.01, which is equivalent to 1\%.
+	This defaults to 0.01, which is equivalent to 1\,\%.
 \item	[\tco{--trendbreak}\nf{:}] Ratio of inter-element spacing constituting
 	a break in the trend of the data.
 	For example, if the average spacing in the data accepted so far
@@ -2322,7 +2322,7 @@ Lines~44-52 then compute and print the statistics for the data set.
 \QuickQuizAnswer{
 	Because mean and standard deviation were not designed to do this job.
 	To see this, try applying mean and standard deviation to the
-	following data set, given a 1\% relative error in measurement:
+	following data set, given a 1\,\% relative error in measurement:

 	\begin{quote}
 		49,548.4 49,549.4 49,550.2 49,550.9 49,550.9 49,551.0
@@ -2452,7 +2452,7 @@ about a billion instances throughout the world?
 In that case, a bug that would be encountered once every million years
 will be encountered almost three times per day across the installed
 base.
-A test with a 50\% chance of encountering this bug in a one-hour run
+A test with a 50\,\% chance of encountering this bug in a one-hour run
 would need to increase that bug's probability of occurrence by more
 than nine orders of magnitude, which poses a severe challenge to
 today's testing methodologies.
-- 
2.7.4


