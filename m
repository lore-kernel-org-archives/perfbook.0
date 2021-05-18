Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QutUzB50WxyptfEDnZtkqDsc+UGX1DpUcW5pzeX1lyU=;
        b=QuRJ2EU9Iy6+a+DiBgcufZuzY7eZRLxBU3awCarlT2xjiMHG+JoUcQVYGnkKPAhRA3
         M6I1HNmDBPNKhlwp9WE8p14MBbQCJUU0PHvUQ3MDuMS+dupIEfpAMNXhVfm4vdrxeTjt
         4/iYK103lzQ/T/zGFF/86Qs01L7vWdmZGJhCHYrhaR/Lk4OO5ImpDq29Iqv3K7U9c+C9
         sB21sPqXaJv3ZF38YD2gURp7p8RI8/ErHLCW5W6GYPXauoZ4Fkct0MxBuIjC84Q/zVVw
         Mof/+nzBguMXg28oHT4TWtzIoH64eGyP3cNIKbJhaf4vLzg8bSUdWrvGRUdvTkSceiRR
         hLaw==
Subject: [PATCH -perfbook 5/8] debugging: Employ \cref{} and its variants
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0944797a-6a00-ce7d-0ef8-8dac58a5c692@gmail.com>
Date: Tue, 18 May 2021 21:22:20 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 140 ++++++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 70 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 7d739a62..3a110c8f 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -32,25 +32,25 @@ of software, and is worth intensive study in its own right.
 However, this book is primarily about concurrency, so this chapter will do
 little more than scratch the surface of this critically important topic.
 
-Section~\ref{sec:debugging:Introduction}
+\Cref{sec:debugging:Introduction}
 introduces the philosophy of debugging.
-Section~\ref{sec:debugging:Tracing}
+\Cref{sec:debugging:Tracing}
 discusses tracing,
-Section~\ref{sec:debugging:Assertions}
+\cref{sec:debugging:Assertions}
 discusses assertions, and
-Section~\ref{sec:debugging:Static Analysis}
+\cref{sec:debugging:Static Analysis}
 discusses static analysis.
-Section~\ref{sec:debugging:Code Review}
+\Cref{sec:debugging:Code Review}
 describes some unconventional approaches to code review that can
 be helpful when the fabled 10,000 eyes happen not to be looking at your code.
-Section~\ref{sec:debugging:Probability and Heisenbugs}
+\Cref{sec:debugging:Probability and Heisenbugs}
 overviews the use of probability for validating parallel software.
 Because performance and scalability are first-class requirements
 for parallel programming,
-Section~\ref{sec:debugging:Performance Estimation} covers these
+\cref{sec:debugging:Performance Estimation} covers these
 topics.
 Finally,
-Section~\ref{sec:debugging:Summary}
+\cref{sec:debugging:Summary}
 gives a fanciful summary and a short list of statistical traps to avoid.
 
 But never forget that the three best debugging tools are a thorough
@@ -64,13 +64,13 @@ sleep!
 	  programming must be the process of putting them in.}
 	 {\emph{Edsger W.~Dijkstra}}
 
-Section~\ref{sec:debugging:Where Do Bugs Come From?}
+\Cref{sec:debugging:Where Do Bugs Come From?}
 discusses the sources of bugs, and
-Section~\ref{sec:debugging:Required Mindset}
+\cref{sec:debugging:Required Mindset}
 overviews the mindset required when validating software.
-Section~\ref{sec:debugging:When Should Validation Start?}
+\Cref{sec:debugging:When Should Validation Start?}
 discusses when you should start validation, and
-Section~\ref{sec:debugging:The Open Source Way} describes the
+\cref{sec:debugging:The Open Source Way} describes the
 surprisingly effective open-source regimen of code review and
 community testing.
 
@@ -383,13 +383,13 @@ This can work well, if properly organized.
 
 Some people might see vigorous validation as a form of torture, as
 depicted in
-Figure~\ref{fig:debugging:Validation and the Geneva Convention}.\footnote{
+\cref{fig:debugging:Validation and the Geneva Convention}.\footnote{
 	The cynics among us might question whether these people are
 	afraid that validation will find bugs that they will then be
 	required to fix.}
 Such people might do well to remind themselves that, Tux cartoons aside,
 they are really torturing an inanimate object, as shown in
-Figure~\ref{fig:debugging:Rationalizing Validation}.
+\cref{fig:debugging:Rationalizing Validation}.
 Rest assured that those who fail to torture their code are doomed to be
 tortured by it!
 
@@ -414,8 +414,8 @@ by design.
 But why wait until you have code before validating your design?\footnote{
 	The old saying ``First we must code, then we have incentive to
 	think'' notwithstanding.}
-Hopefully reading Chapters~\ref{chp:Hardware and its Habits}
-and~\ref{chp:Tools of the Trade} provided you with the information
+Hopefully reading \cref{chp:Hardware and its Habits,%
+chp:Tools of the Trade} provided you with the information
 required to avoid some regrettably common design flaws,
 but discussing your design with a colleague or even simply writing it
 down can help flush out additional flaws.
@@ -483,7 +483,7 @@ you will waste coding those design bugs.
 	than the word ``testing''.
 	The word ``validation'' includes formal methods as well as
 	testing, for more on which please see
-	Chapter~\ref{chp:Formal Verification}.
+	\cref{chp:Formal Verification}.
 
 	But as long as we are bringing up things that everyone should
 	know, let's remind ourselves that Darwinian evolution is
@@ -662,7 +662,7 @@ fastpath to tell you what is going wrong, namely, these tools often have
 excessive overheads.
 There are special tracing technologies for this purpose, which typically
 leverage data ownership techniques
-(see Chapter~\ref{chp:Data Ownership})
+(see \cref{chp:Data Ownership})
 to minimize the overhead of runtime data collection.
 One example within the Linux kernel is
 ``trace events''~\cite{StevenRostedt2010perfTraceEventP1,StevenRostedt2010perfTraceEventP2,StevenRostedt2010perfTraceEventP3,StevenRostedt2010perfHP+DeathlyMacros},
@@ -670,8 +670,8 @@ which uses per-CPU buffers to allow data to be collected with
 extremely low overhead.
 Even so, enabling tracing can sometimes change timing enough to
 hide bugs, resulting in \emph{heisenbugs}, which are discussed in
-Section~\ref{sec:debugging:Probability and Heisenbugs}
-and especially Section~\ref{sec:debugging:Hunting Heisenbugs}.
+\cref{sec:debugging:Probability and Heisenbugs}
+and especially \cref{sec:debugging:Hunting Heisenbugs}.
 In the kernel, BPF can do data reduction in the kernel, reducing
 the overhead of transmitting the needed information from the kernel
 to userspace~\cite{BrendanGregg2019BPFperftools}.
@@ -1167,7 +1167,7 @@ of it occurring on the one hand, having fixed only one of several
 related bugs on the other hand, or made some ineffectual unrelated
 change on yet a third hand.
 In short, what is the answer to the eternal question posed by
-Figure~\ref{fig:cpu:Passed-the-stress-test}?
+\cref{fig:cpu:Passed-the-stress-test}?
 
 Unfortunately, the honest answer is that an infinite amount of testing
 is required to attain absolute certainty.
@@ -1205,7 +1205,7 @@ is required to attain absolute certainty.
 	\end{enumerate}
 	Of course, if your code is small enough, formal validation
 	may be helpful, as discussed in
-	Chapter~\ref{chp:Formal Verification}.
+	\cref{chp:Formal Verification}.
 	But beware: formal validation of your code will not find
 	errors in your assumptions, misunderstanding of the
 	requirements, misunderstanding of the software or hardware
@@ -1309,7 +1309,7 @@ After all, if we were to run the test enough times that the probability
 of seeing at least one failure becomes 99\,\%, if there are no failures,
 there is only 1\,\% probability of this ``success'' being due to dumb luck.
 And if we plug $f=0.1$ into
-Equation~\ref{eq:debugging:Binomial Failure Rate} and vary $n$,
+\cref{eq:debugging:Binomial Failure Rate} and vary $n$,
 we find that 43 runs gives us a 98.92\,\% chance of at least one test failing
 given the original 10\,\% per-test failure rate,
 while 44 runs gives us a 99.03\,\% chance of at least one test failing.
@@ -1317,7 +1317,7 @@ So if we run the test on our fix 44 times and see no failures, there
 is a 99\,\% probability that our fix really did help.
 
 But repeatedly plugging numbers into
-Equation~\ref{eq:debugging:Binomial Failure Rate}
+\cref{eq:debugging:Binomial Failure Rate}
 can get tedious, so let's solve for $n$:
 
 \begin{eqnarray}
@@ -1334,14 +1334,14 @@ Finally the number of tests required is given by:
 \end{equation}
 
 Plugging $f=0.1$ and $F_n=0.99$ into
-Equation~\ref{eq:debugging:Binomial Number of Tests Required}
+\cref{eq:debugging:Binomial Number of Tests Required}
 gives 43.7, meaning that we need 44 consecutive successful test
 runs to be 99\,\% certain that our fix was a real improvement.
 This matches the number obtained by the previous method, which
 is reassuring.
 
 \QuickQuiz{
-	In Equation~\ref{eq:debugging:Binomial Number of Tests Required},
+	In \cref{eq:debugging:Binomial Number of Tests Required},
 	are the logarithms base-10, base-2, or base-$\euler$?
 }\QuickQuizAnswer{
 	It does not matter.
@@ -1358,7 +1358,7 @@ is reassuring.
 \label{fig:debugging:Number of Tests Required for 99 Percent Confidence Given Failure Rate}
 \end{figure}
 
-Figure~\ref{fig:debugging:Number of Tests Required for 99 Percent Confidence Given Failure Rate}
+\Cref{fig:debugging:Number of Tests Required for 99 Percent Confidence Given Failure Rate}
 shows a plot of this function.
 Not surprisingly, the less frequently each test run fails, the more
 test runs are required to be 99\,\% confident that the bug has been
@@ -1384,7 +1384,7 @@ How many failure-free test runs are required?
 An order of magnitude improvement from a 30\,\% failure rate would be
 a 3\,\% failure rate.
 Plugging these numbers into
-Equation~\ref{eq:debugging:Binomial Number of Tests Required} yields:
+\cref{eq:debugging:Binomial Number of Tests Required} yields:
 
 \begin{equation}
 	n = \frac{\log\left(1 - 0.99\right)}{\log\left(1 - 0.03\right)} = 151.2
@@ -1397,7 +1397,7 @@ This is why making tests run more quickly and making failures more
 probable are essential skills in the development of highly reliable
 software.
 These skills will be covered in
-Section~\ref{sec:debugging:Hunting Heisenbugs}.
+\cref{sec:debugging:Hunting Heisenbugs}.
 
 \subsection{Statistics Abuse for Discrete Testing}
 \label{sec:debugging:Statistics Abuse for Discrete Testing}
@@ -1440,7 +1440,7 @@ intuitive derivation may be found in the first edition of
 this book~\cite[Equations 11.8--11.26]{McKenney2014ParallelProgramming-e1}.
 
 Let's try reworking the example from
-Section~\ref{sec:debugging:Statistics Abuse for Discrete Testing}
+\cref{sec:debugging:Statistics Abuse for Discrete Testing}
 using the Poisson distribution.
 Recall that this example involved a test with a 30\,\% failure rate per
 hour, and that the question was how long the test would need to run
@@ -1448,7 +1448,7 @@ error-free
 on a alleged fix to be 99\,\% certain that the fix actually reduced the
 failure rate.
 In this case, $m$ is zero, so that
-Equation~\ref{eq:debugging:Poisson Probability} reduces to:
+\cref{eq:debugging:Poisson Probability} reduces to:
 
 \begin{equation}
 	F_0 =  \euler^{-\lambda}
@@ -1464,10 +1464,10 @@ to 0.01 and solving for $\lambda$, resulting in:
 Because we get $0.3$ failures per hour, the number of hours required
 is $4.6/0.3 = 14.3$, which is within 10\,\% of the 13 hours
 calculated using the method in
-Section~\ref{sec:debugging:Statistics Abuse for Discrete Testing}.
+\cref{sec:debugging:Statistics Abuse for Discrete Testing}.
 Given that you normally won't know your failure rate to anywhere near
 10\,\%, the simpler method described in
-Section~\ref{sec:debugging:Statistics Abuse for Discrete Testing}
+\cref{sec:debugging:Statistics Abuse for Discrete Testing}
 is almost always good and sufficient.
 
 More generally, if we have $n$ failures per unit time, and we want to
@@ -1487,7 +1487,7 @@ following formula:
 	of failure?
 }\QuickQuizAnswer{
 	We set $n$ to $3$ and $P$ to $99.9$ in
-	Equation~\ref{eq:debugging:Error-Free Test Duration}, resulting in:
+	\cref{eq:debugging:Error-Free Test Duration}, resulting in:
 
 	\begin{equation}
 		T = - \frac{1}{3} \ln \frac{100 - 99.9}{100} = 2.3
@@ -1508,7 +1508,7 @@ failures in the second run was due to random chance?
 In other words, how confident should we be that the fix actually
 had some effect on the bug?
 This probability may be calculated by summing
-Equation~\ref{eq:debugging:Poisson Probability} as follows:
+\cref{eq:debugging:Poisson Probability} as follows:
 
 \begin{equation}
 	F_0 + F_1 + \dots + F_{m - 1} + F_m =
@@ -1551,7 +1551,7 @@ that the fix actually had some relationship to the bug.\footnote{
 
 	In particular, the \co{bfloat(cdf_poisson(2,24));} command
 	results in \co{1.181617112359357b-8}, which matches the value
-	given by Equation~\ref{eq:debugging:Possion CDF}.
+	given by \cref{eq:debugging:Possion CDF}.
 
 \begin{table}
 \renewcommand*{\arraystretch}{1.25}
@@ -1597,14 +1597,14 @@ that the fix actually had some relationship to the bug.\footnote{
 	you need a 30-hour error-free run.
 
 	Alternatively, you can use the rough-and-ready method described in
-	Section~\ref{sec:debugging:Statistics Abuse for Discrete Testing}.
+	\cref{sec:debugging:Statistics Abuse for Discrete Testing}.
 }\QuickQuizEndB
 %
 \QuickQuizE{
 	But wait!!!
 	Given that there has to be \emph{some} number of failures
 	(including the possibility of zero failures), shouldn't
-	Equation~\ref{eq:debugging:Possion CDF}
+	\cref{eq:debugging:Possion CDF}
 	approach the value $1$ as $m$ goes to infinity?
 }\QuickQuizAnswerE{
 	Indeed it should.
@@ -1686,7 +1686,7 @@ These are followed by discussion in
 \label{sec:debugging:Add Delay}
 
 Consider the count-lossy code in
-Section~\ref{sec:count:Why Isn't Concurrent Counting Trivial?}.
+\cref{sec:count:Why Isn't Concurrent Counting Trivial?}.
 Adding \co{printf()} statements will likely greatly reduce or even
 eliminate the lost counts.
 However, converting the load-add-store sequence to a load-add-delay-store
@@ -1906,7 +1906,7 @@ and a subsequent wait for an RCU callback to be
 invoked after completion of the RCU grace period.
 This distinction between an \co{rcutorture} error and near miss is
 shown in
-Figure~\ref{fig:debugging:RCU Errors and Near Misses}.
+\cref{fig:debugging:RCU Errors and Near Misses}.
 To qualify as a full-fledged error, an RCU read-side critical section
 must extend from the \co{call_rcu()} that initiated a grace period,
 through the remainder of the previous grace period, through the
@@ -1957,9 +1957,9 @@ changes you make to add debugging code.
 
 The alert reader might have noticed that this section was fuzzy and
 qualitative, in stark contrast to the precise mathematics of
-Sections~\ref{sec:debugging:Statistics for Discrete Testing},
-~\ref{sec:debugging:Statistics Abuse for Discrete Testing},
-and~\ref{sec:debuggingStatistics for Continuous Testing}.
+\cref{sec:debugging:Statistics for Discrete Testing,%
+sec:debugging:Statistics Abuse for Discrete Testing,%
+sec:debuggingStatistics for Continuous Testing}.
 If you love precision and mathematics, you may be disappointed to
 learn that the situations to which this section applies are far
 more common than those to which the preceding sections apply.
@@ -1972,7 +1972,7 @@ In this all-too-common case, statistics cannot help you.\footnote{
 	Although if you know what your program is supposed to do and
 	if your program is small enough (both less likely that you
 	might think), then the formal-verification tools described in
-	Chapter~\ref{chp:Formal Verification}
+	\cref{chp:Formal Verification}
 	can be helpful.}
 That is to say, statistics cannot help you \emph{directly}.
 But statistics can be of great indirect help---\emph{if} you have the
@@ -2285,11 +2285,11 @@ The remainder of this section looks at ways of resolving this conflict.
 
 The following sections discuss ways of dealing with these measurement
 errors, with
-Section~\ref{sec:debugging:Isolation}
+\cref{sec:debugging:Isolation}
 covering isolation techniques that may be used to prevent some forms of
 interference,
 and with
-Section~\ref{sec:debugging:Detecting Interference}
+\cref{sec:debugging:Detecting Interference}
 covering methods for detecting interference so as to reject measurement
 data that might have been corrupted by that interference.
 
@@ -2381,7 +2381,7 @@ interference.
 	Nevertheless, if for some reason you must keep the code under
 	test within the application, you will very likely need to use
 	the techniques discussed in
-	Section~\ref{sec:debugging:Detecting Interference}.
+	\cref{sec:debugging:Detecting Interference}.
 }\QuickQuizEnd
 
 Of course, if it is in fact the interference that is producing the
@@ -2396,9 +2396,9 @@ as described in the next section.
 
 If you cannot prevent interference, perhaps you can detect it
 and reject results from any affected test runs.
-Section~\ref{sec:debugging:Detecting Interference Via Measurement}
+\Cref{sec:debugging:Detecting Interference Via Measurement}
 describes methods of rejection involving additional measurements,
-while Section~\ref{sec:debugging:Detecting Interference Via Statistics}
+while \cref{sec:debugging:Detecting Interference Via Statistics}
 describes statistics-based rejection.
 
 \subsubsection{Detecting Interference Via Measurement}
@@ -2450,7 +2450,7 @@ int runtest(void)
 Opening and reading files is not the way to low overhead, and it is
 possible to get the count of context switches for a given thread
 by using the \co{getrusage()} system call, as shown in
-Listing~\ref{lst:debugging:Using getrusage() to Detect Context Switches}.
+\cref{lst:debugging:Using getrusage() to Detect Context Switches}.
 This same system call can be used to detect minor page faults (\co{ru_minflt})
 and major page faults (\co{ru_majflt}).
 
@@ -2504,7 +2504,7 @@ Otherwise, the remainder of the list is rejected.
 \label{lst:debugging:Statistical Elimination of Interference}
 \end{listing}
 
-Listing~\ref{lst:debugging:Statistical Elimination of Interference}
+\Cref{lst:debugging:Statistical Elimination of Interference}
 shows a simple \co{sh}/\co{awk} script implementing this notion.
 Input consists of an x-value followed by an arbitrarily long list of y-values,
 and output consists of one line for each input line, with fields as follows:
@@ -2541,50 +2541,50 @@ This script takes three optional arguments as follows:
 
 \begin{fcvref}[ln:debugging:datablows:whole]
 \Clnrefrange{param:b}{param:e} of
-Listing~\ref{lst:debugging:Statistical Elimination of Interference}
+\cref{lst:debugging:Statistical Elimination of Interference}
 set the default values for the parameters, and
 \clnrefrange{parse:b}{parse:e} parse
 any command-line overriding of these parameters.
 \end{fcvref}
 \begin{fcvref}[ln:debugging:datablows:whole:awk]
-The \co{awk} invocation on line~\lnref{invoke} sets the values of the
+The \co{awk} invocation on \clnref{invoke} sets the values of the
 \co{divisor}, \co{relerr}, and \co{trendbreak} variables to their
 \co{sh} counterparts.
 In the usual \co{awk} manner,
 \clnrefrange{copy:b}{end} are executed on each input
 line.
-The loop spanning lines~\lnref{copy:b} and~\lnref{copy:e} copies
+The loop spanning \clnref{copy:b,copy:e} copies
 the input y-values to the
-\co{d} array, which line~\lnref{asort} sorts into increasing order.
-Line~\lnref{comp_i} computes the number of trustworthy y-values
+\co{d} array, which \clnref{asort} sorts into increasing order.
+\Clnref{comp_i} computes the number of trustworthy y-values
 by applying \co{divisor} and rounding up.
 
 \Clnrefrange{delta}{comp_max:e} compute the \co{maxdelta}
 lower bound on the upper bound of y-values.
-To this end, line~\lnref{maxdelta} multiplies the difference in values over
+To this end, \clnref{maxdelta} multiplies the difference in values over
 the trusted region of data by the \co{divisor}, which projects the
 difference in values across the trusted region across the entire
 set of y-values.
 However, this value might well be much smaller than the relative error,
-so line~\lnref{maxdelta1} computes the absolute error (\co{d[i] * relerr})
+so \clnref{maxdelta1} computes the absolute error (\co{d[i] * relerr})
 and adds
 that to the difference \co{delta} across the trusted portion of the data.
-Lines~\lnref{comp_max:b} and~\lnref{comp_max:e} then compute the maximum of
+\Clnref{comp_max:b,comp_max:e} then compute the maximum of
 these two values.
 
 Each pass through the loop spanning \clnrefrange{add:b}{add:e}
 attempts to add another
 data value to the set of good data.
 \Clnrefrange{chk_engh}{break} compute the trend-break delta,
-with line~\lnref{chk_engh} disabling this
+with \clnref{chk_engh} disabling this
 limit if we don't yet have enough values to compute a trend,
-and with line~\lnref{mul_avr} multiplying \co{trendbreak} by the average
+and with \clnref{mul_avr} multiplying \co{trendbreak} by the average
 difference between pairs of data values in the good set.
-If line~\lnref{chk_max} determines that the candidate data value would exceed the
+If \clnref{chk_max} determines that the candidate data value would exceed the
 lower bound on the upper bound (\co{maxdelta}) \emph{and}
 that the difference between the candidate data value
 and its predecessor exceeds the trend-break difference (\co{maxdiff}),
-then line~\lnref{break} exits the loop: We have the full good set of data.
+then \clnref{break} exits the loop: We have the full good set of data.
 
 \Clnrefrange{comp_stat:b}{comp_stat:e} then compute and print
 statistics.
@@ -2615,7 +2615,7 @@ statistics.
 
 	Of course, it is possible to create a script similar to
 	that in
-	Listing~\ref{lst:debugging:Statistical Elimination of Interference}
+	\cref{lst:debugging:Statistical Elimination of Interference}
 	that uses standard deviation rather than absolute difference
 	to get a similar effect,
 	and this is left as an exercise for the interested reader.
@@ -2641,9 +2641,9 @@ statistics.
 Although statistical interference detection can be quite useful, it should
 be used only as a last resort.
 It is far better to avoid interference in the first place
-(Section~\ref{sec:debugging:Isolation}), or, failing that,
+(\cref{sec:debugging:Isolation}), or, failing that,
 detecting interference via measurement
-(Section~\ref{sec:debugging:Detecting Interference Via Measurement}).
+(\cref{sec:debugging:Detecting Interference Via Measurement}).
 
 \section{Summary}
 \label{sec:debugging:Summary}
@@ -2655,7 +2655,7 @@ Although validation never will be an exact science, much can be gained
 by taking an organized approach to it, as an organized approach will
 help you choose the right validation tools for your job, avoiding
 situations like the one fancifully depicted in
-Figure~\ref{fig:debugging:Choose Validation Methods Wisely}.
+\cref{fig:debugging:Choose Validation Methods Wisely}.
 
 \begin{figure}
 \centering
@@ -2671,11 +2671,11 @@ Problem~\cite{AlanMTuring1937HaltingProblem,GeoffreyKPullum2000HaltingProblem}.
 Fortunately for us, there is a huge number of special cases in which
 we can not only work out whether a program will halt, but also
 estimate how long it will run before halting, as discussed in
-Section~\ref{sec:debugging:Performance Estimation}.
+\cref{sec:debugging:Performance Estimation}.
 Furthermore, in cases where a given program might or might not work
 correctly, we can often establish estimates for what fraction of the
 time it will work correctly, as discussed in
-Section~\ref{sec:debugging:Probability and Heisenbugs}.
+\cref{sec:debugging:Probability and Heisenbugs}.
 
 Nevertheless, unthinking reliance on these estimates is brave to the
 point of foolhardiness.
@@ -2735,7 +2735,7 @@ ten orders of magnitude, which poses a severe challenge to
 today's testing methodologies.
 One important tool that can sometimes be applied with good effect to
 such situations is formal verification, the subject of the next chapter,
-and, more speculatively, Section~\ref{sec:future:Formal Regression Testing?}.
+and, more speculatively, \cref{sec:future:Formal Regression Testing?}.
 
 The topic of choosing a validation plan, be it testing, formal
 verification, or both, is taken up by
-- 
2.17.1


