Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xdhWXXZLyScLyJwG4p5+0NvYAV27KDsurKEqvSfU+kU=;
        b=qb9pNvloYuPj29CJ2E/UV50hwKWiEBZ4chv3R3IsNuy8RotmdTka/vNAziab2Ju2s6
         QvtquLIjITkAU3NXRfVJWATn/EoWE7+Jnz2WY94ClXzvEg/Zf+QB9KUxFcb51N9FlD9i
         VmKhs22UVO0CsSrJdAcx99XhtClJCQicla1kmszhjDCablGYynd1c+Pnc0EkacZiG9Nl
         N69SmvPy9bP5biG4EcbS6bbJyz55Z3jZwJ8ctzA2P0zo1l7clEL9CkX0d6qPLj1qYVX1
         VU/0FbrW+7IfNk9DvT/8VKM7xpa87Ipc38CHAmdoXbd2hfunQLAdAodpBFWzuk51XKC/
         gZsw==
Subject: [PATCH 6/7] memorder: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f1c12d86-890a-2ac5-31fe-2eb5ae2a3a45@gmail.com>
Date: Tue, 10 Aug 2021 13:48:12 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note: "ppc64" behind a colon is enclosed in plain {}.
This is to exclude it from checkscript.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 102 +++++++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 42 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 6cac66b7..1d810b51 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -62,7 +62,8 @@ provides some useful rules of thumb.
 	full rewrite!
 }\QuickQuizEnd
 
-\section{Ordering: Why and How?}
+\section{Ordering:
+		   Why and How?}
 \label{sec:memorder:Ordering: Why and How?}
 %
 \epigraph{Nothing is orderly till people take hold of it.
@@ -97,7 +98,8 @@ even on relatively strongly ordered systems such as x86.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-SB+o-o+o-o@whole.fcv}
-\caption{Memory Misordering: Store-Buffering Litmus Test}
+\caption{Memory Misordering:
+			     Store-Buffering Litmus Test}
 \label{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}
 \end{listing}
 
@@ -128,8 +130,8 @@ value 2 occurred less frequently, in this case, only 167 times.\footnote{
 	Please note that results are sensitive to the exact hardware
 	configuration,
 	how heavily the system is loaded, and much else besides.}
-The lesson here is clear: Increased counter-intuitivity does not necessarily
-imply decreased probability!
+The lesson here is clear:
+Increased counter-intuitivity does not necessarily imply decreased probability!
 % Run on June 23, 2017:
 % litmus7 -r 1000 -carch X86 C-SB+o-o+o-o.litmus
 % Test C-SB+o-o+o-o Allowed
@@ -182,10 +184,11 @@ from multiple CPUs to a set of shared variables.
 In cache-coherent systems, if the caches hold multiple copies of a given
 variable, all the copies of that variable must have the same value.
 This works extremely well for concurrent loads, but not so well for
-concurrent stores:  Each store must do something about all
-copies of the old value (another cache miss!), which, given the finite
-speed of light and the atomic nature of matter, will be slower
-than impatient software hackers would like.
+concurrent stores:
+Each store must do something about all copies of the old value
+(another cache miss!), which, given the finite speed of light and
+the atomic nature of matter, will be slower than impatient software
+hackers would like.
 
 \begin{figure}
 \centering
@@ -241,7 +244,8 @@ in turn cause serious confusion, as fancifully illustrated in
 	\bottomrule
 \end{tabular}
 }
-\caption{Memory Misordering: Store-Buffering Sequence of Events}
+\caption{Memory Misordering:
+			     Store-Buffering Sequence of Events}
 \label{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events}
 \end{table*}
 
@@ -283,8 +287,8 @@ each load immediately returns the cached value, which in both cases
 is zero.
 \end{fcvref}
 
-But the CPUs are not done yet: Sooner or later, they must empty their
-store buffers.
+But the CPUs are not done yet:
+Sooner or later, they must empty their store buffers.
 Because caches move data around in relatively large blocks called
 \emph{cachelines}, and because each cacheline can hold several
 variables, each CPU must get the cacheline into its own cache so
@@ -346,7 +350,8 @@ thus allowing you to stop reading this section.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o@whole.fcv}
-\caption{Memory Ordering: Store-Buffering Litmus Test}
+\caption{Memory Ordering:
+			  Store-Buffering Litmus Test}
 \label{lst:memorder:Memory Ordering: Store-Buffering Litmus Test}
 \end{listing}
 
@@ -402,7 +407,8 @@ barrier-free code in
 	\bottomrule
 \end{tabular}
 }
-\caption{Memory Ordering: Store-Buffering Sequence of Events}
+\caption{Memory Ordering:
+			  Store-Buffering Sequence of Events}
 \label{tab:memorder:Memory Ordering: Store-Buffering Sequence of Events}
 \end{table*}
 
@@ -1308,9 +1314,11 @@ in pre-v4.15 Linux kernels.
 	lst:memorder:S Address-Dependency Litmus Test}?
 }\QuickQuizAnswerB{
 	Answering this requires identifying three major groups of platforms:
-	(1)~Total-store-order (TSO) platforms,
-	(2)~Weakly ordered platforms, and
-	(3)~DEC Alpha.
+	\begin{enumerate*}[(1)]
+	\item Total-store-order (TSO) platforms,
+	\item Weakly ordered platforms, and
+	\item DEC Alpha.
+	\end{enumerate*}
 
 	\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
 	The TSO platforms order all pairs of memory references except for
@@ -1333,8 +1341,8 @@ in pre-v4.15 Linux kernels.
 	unrelated accesses.
 	However, the address dependencies in
 	\cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15),%
-	lst:memorder:S Address-Dependency Litmus Test}
-	are not unrelated: There is an address dependency.
+	lst:memorder:S Address-Dependency Litmus Test} are not unrelated:
+	There is an address dependency.
 	The hardware tracks dependencies and maintains the needed
 	ordering.
 
@@ -1388,9 +1396,10 @@ be fragile and easily broken by compiler optimizations, as discussed in
 A \emph{data dependency} occurs when the value returned by a load
 instruction is used to compute the data stored by a later store
 instruction.
-Note well the ``data'' above: If the value returned by a load
-was instead used to compute the address used by a later store
-instruction, that would instead be an address dependency.
+Note well the ``data'' above:
+If the value returned by a load was instead used to compute the address
+used by a later store instruction, that would instead be an address
+dependency.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-LB+o-r+o-data-o@whole.fcv}
@@ -1458,8 +1467,8 @@ compiler from breaking them.
 A \emph{control dependency} occurs when the value returned by a load
 instruction is tested to determine whether or not a later store instruction
 is executed.
-Note well the ``later store instruction'': Many platforms do not respect
-load-to-load control dependencies.
+Note well the ``later store instruction'':
+Many platforms do not respect load-to-load control dependencies.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o@whole.fcv}
@@ -1754,7 +1763,8 @@ line} to carry this new value to them.
 	\bottomrule
 \end{tabular}
 }
-\caption{Memory Ordering: WRC Sequence of Events}
+\caption{Memory Ordering:
+			  WRC Sequence of Events}
 \label{tab:memorder:Memory Ordering: WRC Sequence of Events}
 \end{table*}
 
@@ -2015,7 +2025,7 @@ The cycle in
 goes through \co{P0()} (\clnref{P0:st,P0:sr}), \co{P1()} (\clnref{P1:la,P1:ld}),
 \co{P2()} (\clnref{P2:st,P2:mb,P2:ld}), and back to \co{P0()} (\clnref{P0:st}).
 The \co{exists} clause delineates this cycle:
-the \co{1:r1=1} indicates that the \co{smp_load_acquire()} on \clnref{P1:la}
+The \co{1:r1=1} indicates that the \co{smp_load_acquire()} on \clnref{P1:la}
 returned the value stored by the \co{smp_store_release()} on \clnref{P0:sr},
 the \co{1:r2=0} indicates that the \co{WRITE_ONCE()} on \clnref{P2:st} came
 too late to affect the value returned by the \co{READ_ONCE()} on \clnref{P1:ld},
@@ -2286,7 +2296,8 @@ as shown in
 As with the previous example, \co{smp_store_release()}'s cumulativity
 combined with the temporal nature of the release-acquire chain
 prevents the \co{exists} clause on \clnref{exists} from triggering.
-But beware: Adding a second store-to-store step would allow the correspondingly
+But beware:
+Adding a second store-to-store step would allow the correspondingly
 updated \co{exists} clause to trigger.
 \end{fcvref}
 
@@ -2589,8 +2600,9 @@ if (p == &reserve_int) {
 	supplied in registers.
 	However, there is clearly no ordering between the pointer
 	load on \clnref{deref1} and the dereference on \clnref{deref2}.
-	Please note that this is simply an example: There are a great
-	many other ways to break dependency chains with comparisons.
+	Please note that this is simply an example:
+	There are a great many other ways to break dependency chains
+	with comparisons.
 	\end{fcvref}
 \end{enumerate}
 
@@ -3285,12 +3297,14 @@ As described in
 \cref{sec:defer:RCU Fundamentals},
 the fundamental property of RCU grace periods is this straightforward
 two-part guarantee:
-(1)~If any part of a given RCU read-side critical section precedes
+\begin{enumerate*}[(1)]
+\item If any part of a given RCU read-side critical section precedes
 the beginning of a given grace period, then the entirety of that
 critical section precedes the end of that grace period.
-(2)~If any part of a given RCU read-side critical section follows
+\item If any part of a given RCU read-side critical section follows
 the end of a given grace period, then the entirety of that
 critical section follows the beginning of that grace period.
+\end{enumerate*}
 These guarantees are summarized in
 \cref{fig:memorder:RCU Grace-Period Ordering Guarantees},
 where the grace period is denoted by the dashed arrow between the
@@ -3370,8 +3384,8 @@ In particular, despite their names, they do not act like locks, as can
 be seen in
 \cref{lst:memorder:RCU Readers Provide No Lock-Like Ordering}
 (\path{C-LB+rl-o-o-rul+rl-o-o-rul.litmus}).
-This litmus test's cycle is allowed: Both instances of the \co{r1}
-register can have final values of 1.
+This litmus test's cycle is allowed:
+Both instances of the \co{r1} register can have final values of 1.
 
 \begin{listing}
 \input{CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul@whole.fcv}
@@ -3414,7 +3428,8 @@ This should be no surprise given the information presented in
 \label{lst:memorder:RCU Updaters Provide Full Ordering}
 \end{listing}
 
-\subsubsection{RCU Readers: Before and After}
+\subsubsection{RCU Readers:
+			    Before and After}
 \label{sec:memorder:RCU Readers: Before and After}
 
 Before reading this section, it would be well to reflect on the distinction
@@ -3690,9 +3705,10 @@ makes it clear that adding a third reader would allow the cycle.
 This is because this third reader could end before the end of \co{P0()}'s
 grace period, and thus start before the beginning of that same grace
 period.
-This in turn suggests the general rule, which is:  In these sorts of RCU-only
-litmus tests, if there are at least as many RCU grace periods as there
-are RCU read-side critical sections, the cycle is forbidden.\footnote{
+This in turn suggests the general rule, which is:
+In these sorts of RCU-only litmus tests, if there are at least as many
+RCU grace periods as there are RCU read-side critical sections,
+the cycle is forbidden.\footnote{
 	Interestingly enough, Alan Stern proved that within the context
 	of LKMM, the two-part fundamental property of RCU expressed
 	in \cref{sec:defer:RCU Fundamentals} actually implies
@@ -4253,7 +4269,8 @@ different set of memory-barrier instructions~\cite{ARMv7A:2010}:
 	restricted to only writes (similar to the Alpha \co{wmb}
 	and the \Power{} \co{eieio} instructions).
 	In addition, \ARM\ allows \IX{cache coherence} to have one of three
-	scopes: single processor, a subset of the processors
+	scopes:
+	Single processor, a subset of the processors
 	(``inner'') and global (``outer'').
 \item	[\tco{DSB}] (data synchronization barrier) causes the specified
 	type of operations to actually complete before any subsequent
@@ -4633,8 +4650,9 @@ Unfortunately, none of these instructions line up exactly with Linux's
 {\tt wmb()} primitive, which requires {\em all} stores to be ordered,
 but does not require the other high-overhead actions of the {\tt sync}
 instruction.
-But there is no choice: ppc64 versions of {\tt wmb()} and {\tt mb()} are
-defined to be the heavyweight {\tt sync} instruction.
+But there is no choice:
+{ppc64} versions of {\tt wmb()} and {\tt mb()} are defined to be the
+heavyweight {\tt sync} instruction.
 However, Linux's \co{smp_wmb()} instruction is never used for MMIO
 (since a driver must carefully order MMIOs in UP as well as
 SMP kernels, after all), so it is defined to be the lighter weight
@@ -4867,7 +4885,7 @@ this, keeping in mind that the C11 standard's memory model does \emph{not}
 fully respect dependencies.
 Therefore, a dependency leading to a load must be headed by
 a \co{READ_ONCE()} or an \co{rcu_dereference()}:
-a plain C-language load is not sufficient.
+A plain C-language load is not sufficient.
 In addition, carefully review
 \cref{sec:memorder:Address- and Data-Dependency Difficulties,%
 sec:memorder:Control-Dependency Calamities}, because
@@ -4945,8 +4963,8 @@ example of a reads-from (rf) link, a load-to-store link is an example
 of a from-reads (fr) link, and a store-to-store link is an example of
 a coherence (co) link.
 
-One final word of advice: Use of raw memory-ordering primitives is
-a last resort.
+One final word of advice:
+Use of raw memory-ordering primitives is a last resort.
 It is almost always better to use existing primitives, such as locking
 or RCU, thus letting those primitives do the memory ordering for you.
 
-- 
2.17.1


