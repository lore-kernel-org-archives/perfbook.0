Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qqHiSIWjLLGl3HIYR34xD3ZwvtM735xInfQi6cIehvc=;
        b=pLRYWt3Udg8UYImx2swjOLjXDX34hkRWpGAclX91PIjM+scmtPrIYhZ/eRQISPRds/
         dv4R+Ni58WgEZyKp9XpDFgmu/LqefOJCB/oB2HPbwodO9sz8Q0B55XENG24FMdosCs4A
         TmBv8EmNlnEim0APK+kx3ESmaWpbWUxWZYl+gj92O9DXvhnXW3dgWgVv4lyv4A32Sblq
         joThw3m/9ahq7+FoRE+ZKTX3F8y3yMsSqmfn1dbY1WwHiofxXH//GVSD5RS5gQzGgVAc
         iJf8S00UZXREhLKmBX2l5Jj0pF+1O4DKL/0kWVRP/lurQ3vPyK5+DkCe0nBAc7Y3SMxe
         NDEQ==
Subject: [PATCH -perfbook 3/6] defer: Break and capitalize after colon
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <955e3b89-a4d3-b188-1fd2-524421edc8c8@gmail.com>
Date: Thu, 8 Jul 2021 19:43:38 +0900
MIME-Version: 1.0
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/hazptr.tex         |  9 +++++----
 defer/rcufundamental.tex | 29 ++++++++++++++++-------------
 defer/rcuintro.tex       |  6 ++++--
 defer/rcuusage.tex       | 34 +++++++++++++++++++++-------------
 defer/seqlock.tex        | 12 ++++++++----
 defer/whichtochoose.tex  | 19 ++++++++++++-------
 6 files changed, 66 insertions(+), 43 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 47acb0ac..08e133dc 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -96,9 +96,9 @@ invocations, \clnref{htr:race2} indicates failure.
 	element.
 }\QuickQuizEnd
 
-The \co{hp_record()} function is quite straightforward: It repeatedly
-invokes \co{hp_try_record()} until the return value is something other
-than \co{HAZPTR_POISON}.
+The \co{hp_record()} function is quite straightforward:
+It repeatedly invokes \co{hp_try_record()} until the return value
+is something other than \co{HAZPTR_POISON}.
 
 \QuickQuiz{
 	Why bother with \co{hp_try_record()}?
@@ -361,7 +361,8 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 }\QuickQuizEndB
 %
 \QuickQuizE{
-	The paper ``Structured Deferral: Synchronization via
+	The paper ``Structured Deferral:
+	Synchronization via
 	Procrastination''~\cite{McKenney:2013:SDS:2483852.2483867}
 	shows that hazard pointers have near-ideal performance.
 	Whatever happened in
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 7435b885..0378b673 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -94,9 +94,9 @@ mechanism will be required to mediate among multiple concurrent
 In the Linux kernel, locking is the mechanism of choice, but pretty
 much any synchronization mechanism may be used.
 An example of a particularly lightweight synchronization mechanism is
-\cref{chp:Data Ownership}'s data ownership: If each pointer is
-owned by a particular thread, then that thread may execute
-\co{rcu_assign_pointer()} on that pointer with no additional
+\cref{chp:Data Ownership}'s data ownership:
+If each pointer is owned by a particular thread, then that thread may
+execute \co{rcu_assign_pointer()} on that pointer with no additional
 synchronization overhead.
 
 \QuickQuiz{
@@ -298,12 +298,14 @@ This would mean that an RCU read-side critical section had completely
 overlapped a grace period, which is forbidden (or at the very least
 constitutes a bug in RCU).
 RCU's wait-for-readers guarantee therefore has two parts:
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
 This definition is sufficient for almost all RCU-based algorithms, but
 for those wanting more,
 simple executable formal models of RCU are available
@@ -434,8 +436,8 @@ way get a valid result.
 Of course, a closer look at
 \cref{fig:defer:Insertion With Concurrent Readers}
 shows that calls to \co{ins_route()} can also result in concurrent
-readers seeing different versions: Either the initial empty list
-or the newly inserted \co{route} structure.
+readers seeing different versions:
+Either the initial empty list or the newly inserted \co{route} structure.
 Note that both reference counting
 (\cref{sec:defer:Reference Counting})
 and hazard pointers
@@ -535,9 +537,10 @@ and with increasing use of hazard pointers in other projects, demonstrates
 that tolerance for such inconsistencies is more common than one might
 imagine.
 This is especially the case given that single-item lookups are much more
-common than traversals:  After all, (1)~concurrent updates are less likely
-to affect a single-item lookup than they are a full traversal, and
-(2)~an isolated single-item lookup cannot detect such inconsistencies.
+common than traversals:
+After all, (1)~concurrent updates are less likely to affect a single-item
+lookup than they are a full traversal, and (2)~an isolated single-item
+lookup cannot detect such inconsistencies.
 
 From a more theoretical viewpoint, there are even some special cases where
 RCU readers can be considered to be fully ordered with updaters, despite
@@ -661,13 +664,13 @@ This section has described the three fundamental components of RCU-based
 algorithms:
 
 \begin{enumerate}
-\item	a publish-subscribe mechanism for adding new data,
+\item	A publish-subscribe mechanism for adding new data,
 
-\item	a way of waiting for pre-existing RCU readers to finish
+\item	A way of waiting for pre-existing RCU readers to finish
 	(see \cref{sec:memorder:RCU} for more detail),
 	and
 
-\item	a discipline of maintaining multiple versions to permit
+\item	A discipline of maintaining multiple versions to permit
 	change without harming or unduly delaying concurrent RCU readers.
 \end{enumerate}
 
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index a3c9cc58..9b327afa 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -302,7 +302,8 @@ This is a classic deadlock situation, and this \IX{deadlock} is avoided
 by forbidding blocking while holding a spinlock.
 
 Again, this same constraint is imposed on reader threads dereferencing
-\co{gptr}: such threads are not allowed to block until after
+\co{gptr}:
+Such threads are not allowed to block until after
 they are done using the pointed-to data item.
 Returning to the second row of
 \cref{fig:defer:Deletion With Concurrent Readers},
@@ -322,7 +323,8 @@ state shown at the bottom of
 \begin{figure}
 \centering
 \resizebox{3in}{!}{\includegraphics{defer/QSBRGracePeriod}}
-\caption{QSBR: Waiting for Pre-Existing Readers}
+\caption{QSBR\@:
+		 Waiting for Pre-Existing Readers}
 \label{fig:defer:QSBR: Waiting for Pre-Existing Readers}
 \end{figure}
 
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index b3d79d13..0e5ad511 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -637,7 +637,8 @@ harmless, including use of the asynchronous interfaces where available
 is a major reason for the rule of thumb that RCU be used in read-mostly
 situations.
 
-\paragraph{Code: Reader-Writer Locking vs.\@ RCU Code}
+\paragraph{Code:
+		 Reader-Writer Locking vs.\@ RCU Code}
 
 In the best case, the conversion from reader-writer locking to RCU
 is quite simple, as shown in
@@ -663,7 +664,8 @@ Wikipedia~\cite{WikipediaRCU}.
 }
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \IfEbookSize{\hspace*{-1.05in}}{}\theverbbox
-\caption{Converting Reader-Writer Locking to RCU: Data}
+\caption{Converting Reader-Writer Locking to RCU\@:
+						    Data}
 \label{lst:defer:Converting Reader-Writer Locking to RCU: Data}
 \end{listing*}
 
@@ -689,7 +691,8 @@ Wikipedia~\cite{WikipediaRCU}.
 }
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \IfEbookSize{\hspace*{-1.05in}}{}\theverbbox
-\caption{Converting Reader-Writer Locking to RCU: Search}
+\caption{Converting Reader-Writer Locking to RCU\@:
+						    Search}
 \label{lst:defer:Converting Reader-Writer Locking to RCU: Search}
 \end{listing*}
 
@@ -717,7 +720,8 @@ Wikipedia~\cite{WikipediaRCU}.
 }
 \hspace*{0.9in}\OneColumnHSpace{-0.5in}
 \IfEbookSize{\hspace*{-1.05in}}{}\theverbbox
-\caption{Converting Reader-Writer Locking to RCU: Deletion}
+\caption{Converting Reader-Writer Locking to RCU\@:
+						    Deletion}
 \label{lst:defer:Converting Reader-Writer Locking to RCU: Deletion}
 \end{listing*}
 
@@ -741,7 +745,8 @@ More-elaborate cases of replacing reader-writer locking with RCU
 may be found
 elsewhere~\cite{NeilBrown2015PathnameLookup,NeilBrown2015RCUwalk}.
 
-\paragraph{Semantics: Reader-Writer Locking vs.\@ RCU Semantics}
+\paragraph{Semantics:
+		      Reader-Writer Locking vs.\@ RCU Semantics}
 
 Reader-writer locking semantics can be roughly and informally summarized
 by the following three temporal constraints:
@@ -937,7 +942,7 @@ waits for any previously acquired references to be released.
 	What gives?
 }\QuickQuizAnswer{
 	This is an effect of the Law of Toy Examples:
-	beyond a certain point, the code fragments look the same.
+	Beyond a certain point, the code fragments look the same.
 	The only difference is in how we think about the code.
 	However, this difference can be extremely important.
 	For but one example of the importance, consider that if we think
@@ -1049,10 +1054,13 @@ misleading.
 Perhaps the best way to think of the relationship between RCU
 and automatic garbage collectors (GCs) is that RCU resembles
 a GC in that the \emph{timing} of collection is automatically
-determined, but that RCU differs from a GC in that: (1)~the programmer
-must manually indicate when a given data structure is eligible
-to be collected, and (2)~the programmer must manually mark the
-RCU read-side critical sections where references might be held.
+determined, but that RCU differs from a GC in that:
+\begin{enumerate*}[(1)]
+\item The programmer must manually indicate when a given data
+structure is eligible to be collected, and
+\item The programmer must manually mark the RCU read-side critical
+sections where references might be held.
+\end{enumerate*}
 
 Despite these differences, the resemblance does go quite deep.
 In fact, the first RCU-like mechanism I am aware of used a
@@ -1528,9 +1536,9 @@ was shown in the previous sections.
 At its core, RCU is nothing more nor less than an API that provides:
 
 \begin{enumerate}
-\item	a publish-subscribe mechanism for adding new data,
-\item	a way of waiting for pre-existing RCU readers to finish, and
-\item	a discipline of maintaining multiple versions to permit change
+\item	A publish-subscribe mechanism for adding new data,
+\item	A way of waiting for pre-existing RCU readers to finish, and
+\item	A discipline of maintaining multiple versions to permit change
 	without harming or unduly delaying concurrent RCU readers.
 \end{enumerate}
 
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 3eec7b2f..a2649b15 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -378,9 +378,12 @@ Both the read-side and write-side critical sections of a sequence lock
 can be thought of as transactions, and sequence locking therefore
 can be thought of as a limited form of transactional memory, which
 will be discussed in \cref{sec:future:Transactional Memory}.
-The limitations of sequence locking are: (1)~Sequence locking restricts
-updates and (2)~sequence locking does not permit traversal of pointers
+The limitations of sequence locking are:
+\begin{enumerate*}[(1)]
+\item Sequence locking restricts updates and
+\item Sequence locking does not permit traversal of pointers
 to objects that might be freed by updaters.
+\end{enumerate*}
 These limitations are of course overcome by transactional memory, but
 can also be overcome by combining other synchronization primitives
 with sequence locking.
@@ -393,8 +396,9 @@ in writer-heavy workloads.\footnote{
 	\url{http://www.1024cores.net/home/lock-free-algorithms/reader-writer-problem/improved-lock-free-seqlock}.}
 On the other hand, in the absence of writers, sequence-lock readers are
 reasonably fast and scale linearly.
-It is only human to want the best of both worlds: fast readers without
-the possibility of read-side failure, let alone starvation.
+It is only human to want the best of both worlds:
+Fast readers without the possibility of read-side failure,
+let alone starvation.
 In addition, it would also be nice to overcome sequence locking's limitations
 with pointers.
 The following section presents a synchronization mechanism with exactly
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 30e5bfa4..2f8a343b 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -25,7 +25,8 @@ hazard pointers, sequence locking, and RCU\@.
 This discussion should help you to make an informed choice between
 these techniques.
 
-\subsection{Which to Choose? (Overview)}
+\subsection{Which to Choose?
+			      (Overview)}
 \label{sec:defer:Which to Choose? (Overview)}
 
 \begin{table*}
@@ -70,7 +71,8 @@ these techniques.
 	\bottomrule
 \end{tabularx}
 }
-\caption{Which Deferred Technique to Choose? (Overview)}
+\caption{Which Deferred Technique to Choose?
+					     (Overview)}
 \label{tab:defer:Which Deferred Technique to Choose? (Overview)}
 \end{table*}
 
@@ -166,7 +168,8 @@ Nevertheless, this table should be of great help when choosing between
 these techniques.
 But those wishing more detail should continue on to the next section.
 
-\subsection{Which to Choose? (Details)}
+\subsection{Which to Choose?
+			     (Details)}
 \label{sec:defer:Which to Choose? (Details)}
 
 \begin{table*}
@@ -248,7 +251,8 @@ But those wishing more detail should continue on to the next section.
 	\bottomrule
 \end{tabularx}
 }
-\caption{Which Deferred Technique to Choose?  (Details)}
+\caption{Which Deferred Technique to Choose?
+					     (Details)}
 \label{tab:defer:Which Deferred Technique to Choose?  (Details)}
 \end{table*}
 
@@ -378,8 +382,8 @@ RCU grace periods can also be short, which limits the memory footprint.
 For the few data elements that need longer-lived references, reference
 counting is used.
 This means that the complexity of reference-acquisition failure only
-needs to be dealt with for those few data elements:  The bulk of
-the reference acquisitions are unconditional, courtesy of RCU\@.
+needs to be dealt with for those few data elements:
+The bulk of the reference acquisitions are unconditional, courtesy of RCU\@.
 See \cref{sec:together:Refurbish Reference Counting}
 for more information on combining reference counting with other
 synchronization mechanisms.
@@ -419,7 +423,8 @@ and in combination, the rules of thumb laid out in this section will
 need to be refined.
 However, this section does reflect the current state of the art.
 
-\subsection{Which to Choose? (Production Use)}
+\subsection{Which to Choose?
+			     (Production Use)}
 \label{sec:defer:Which to Choose? (Production Use)}
 
 This section points out a few publicly visible production uses of
-- 
2.17.1


