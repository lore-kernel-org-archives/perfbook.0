Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9RcZGdZEPYaxfZO/LPsRWL8owyY080JwPgxP0TQHL54=;
        b=kmRuMu3bf1cQjZW8yzwyVEG+eS1/U53ftXAY7DOel+KiOTFHaKAPiEDNpmXCGQyoab
         jf96dajqZZXnsEfTYeRoKqRnZWaQoE4Q5h6igNtM5k/O61ko6ka3St2hIuCqpi74R9E7
         JgKRWf2rkdGls6IWYDTsRxAA2uCVe2wT8Chtxon1sZKHtgpvf/9PtJuV0tNvGlwr/D3x
         ILMLgDS2rbUk+buYacYFQr/Pf0NBXZXUnQDils0uRfHPngBqZfJUWw0a4OrK4SBnU7W4
         FR4H18XDdEOJz4lk6uUQV3GAR1av8hI3EWRk00zGhPAnBNVlvoPD5DfAWvwbZO07JMwP
         1cAw==
Subject: [PATCH -perfbook 2/6] locking: Break and capitalize after colon
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1cfd983d-1f82-650d-ca2b-76dc57983d64@gmail.com>
Date: Thu, 8 Jul 2021 19:42:39 +0900
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
 locking/locking-existence.tex |  4 +-
 locking/locking.tex           | 98 ++++++++++++++++++++---------------
 2 files changed, 58 insertions(+), 44 deletions(-)

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 86aeace7..feb18464 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -79,8 +79,8 @@ bugs involving implicit existence guarantees really can happen.
 }\QuickQuizEnd
 
 But the more interesting---and troublesome---guarantee involves
-heap memory: A dynamically allocated data structure will exist until it
-is freed.
+heap memory:
+A dynamically allocated data structure will exist until it is freed.
 The problem to be solved is to synchronize the freeing of the structure
 with concurrent accesses to that same structure.
 One way to do this is with \emph{explicit guarantees}, such as locking.
diff --git a/locking/locking.tex b/locking/locking.tex
index 8f19797d..580d8766 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -80,14 +80,16 @@ more serious sins.
 \begin{figure}
 \centering
 \resizebox{2in}{!}{\includegraphics{cartoons/r-2014-Locking-the-Slob}}
-\caption{Locking: Villain or Slob?}
+\caption{Locking:
+		  Villain or Slob?}
 \ContributedBy{Figure}{fig:locking:Locking: Villain or Slob?}{Melissa Broussard}
 \end{figure}
 
 \begin{figure}
 \centering
 \resizebox{2in}{!}{\includegraphics{cartoons/r-2014-Locking-the-Hero}}
-\caption{Locking: Workhorse or Hero?}
+\caption{Locking:
+		  Workhorse or Hero?}
 \ContributedBy{Figure}{fig:locking:Locking: Workhorse or Hero?}{Melissa Broussard}
 \end{figure}
 
@@ -176,7 +178,7 @@ that one of the threads be killed or that a lock be forcibly stolen from
 one of the threads.
 This killing and forcible stealing works well for transactions,
 but is often problematic for kernel and application-level use of locking:
-dealing with the resulting partially updated structures can be extremely
+Dealing with the resulting partially updated structures can be extremely
 complex, hazardous, and error-prone.
 
 Therefore, kernels and applications should instead avoid deadlocks.
@@ -397,8 +399,8 @@ the third containing Lock~D\@.
 
 Please note that it is not typically possible to mechanically
 change \co{cmp()} to use the new Lock~D\@.
-Quite the opposite: It is often necessary to make profound design-level
-modifications.
+Quite the opposite:
+It is often necessary to make profound design-level modifications.
 Nevertheless, the effort required for such modifications is normally
 a small price to pay in order to avoid deadlock.
 More to the point, this potential deadlock should preferably be detected
@@ -666,10 +668,10 @@ In an important special case of conditional locking, all needed
 locks are acquired before any processing is carried out, where
 the needed locks might be identified by hashing the addresses
 of the data structures involved.
-In this case, processing need not be idempotent: if it turns out
-to be impossible to acquire a given lock without first releasing
-one that was already acquired, just release all the locks and
-try again.
+In this case, processing need not be idempotent:
+If it turns out to be impossible to acquire a given lock without
+first releasing one that was already acquired, just release all
+the locks and try again.
 Only once all needed locks are held will any processing be carried out.
 
 However, this procedure can result in \emph{livelock}, which will
@@ -814,8 +816,9 @@ There are a large number of deadlock-avoidance strategies available to
 the shared-memory parallel programmer, but there are sequential
 programs for which none of them is a good fit.
 This is one of the reasons that expert programmers have more than
-one tool in their toolbox: locking is a powerful concurrency
-tool, but there are jobs better addressed with other tools.
+one tool in their toolbox:
+Locking is a powerful concurrency tool, but there are jobs better
+addressed with other tools.
 
 \QuickQuiz{
 	Given an object-oriented application that passes control freely
@@ -1035,8 +1038,8 @@ retry, as shown in
 		normally be in the microsecond or millisecond range.
 	\item	The code does not check for overflow.
 		On the other hand, this bug is nullified
-		by the previous bug: 32 bits worth of seconds is
-		more than 50 years.
+		by the previous bug:
+		32 bits worth of seconds is more than 50 years.
 	\end{enumerate}
 }\QuickQuizEnd
 
@@ -1101,9 +1104,9 @@ and often involve cache misses.
 As we saw in \cref{chp:Hardware and its Habits},
 these instructions are quite expensive, roughly two
 orders of magnitude greater overhead than simple instructions.
-This can be a serious problem for locking: If you protect a single
-instruction with a lock, you will increase the overhead by a factor
-of one hundred.
+This can be a serious problem for locking:
+If you protect a single instruction with a lock, you will increase
+the overhead by a factor of one hundred.
 Even assuming perfect scalability, \emph{one hundred} CPUs would
 be required to keep up with a single CPU executing the same code
 without locking.
@@ -1158,8 +1161,8 @@ and scoped locking (\cref{sec:locking:Scoped Locking}).
 \subsection{Exclusive Locks}
 \label{sec:locking:Exclusive Locks}
 
-\IXhpl{Exclusive}{lock} are what they say they are: only one thread may hold
-the lock at a time.
+\IXhpl{Exclusive}{lock} are what they say they are:
+Only one thread may hold the lock at a time.
 The holder of such a lock thus has exclusive access to all data protected
 by that lock, hence the name.
 
@@ -1178,9 +1181,12 @@ when needed rests with the developer.
 	Empty lock-based critical sections are rarely used, but they
 	do have their uses.
 	The point is that the semantics of exclusive locks have two
-	components: (1)~the familiar data-protection semantic and
-	(2)~a messaging semantic, where releasing a given lock notifies
+	components:
+	\begin{enumerate*}[(1)]
+	\item The familiar data-protection semantic and
+	\item A messaging semantic, where releasing a given lock notifies
 	a waiting acquisition of that same lock.
+	\end{enumerate*}
 	An empty critical section uses the messaging component without
 	the data-protection component.
 
@@ -1218,9 +1224,9 @@ when needed rests with the developer.
 	For example, each thread might correspond to one user of the
 	application, and thus be removed when that user logs out or
 	otherwise disconnects.
-	In many applications, threads cannot depart atomically: They must
-	instead explicitly unravel themselves from various portions of
-	the application using a specific sequence of actions.
+	In many applications, threads cannot depart atomically:
+	They must instead explicitly unravel themselves from various
+	portions of the application using a specific sequence of actions.
 	One specific action will be refusing to accept further requests
 	from other threads, and another specific action will be disposing
 	of any remaining units of work on its list, for example, by
@@ -1319,8 +1325,10 @@ when needed rests with the developer.
 
 It is important to note that unconditionally acquiring an exclusive lock
 has two effects:
-(1)~Waiting for all prior holders of that lock to release it, and
-(2)~Blocking any other acquisition attempts until the lock is released.
+\begin{enumerate*}[(1)]
+\item Waiting for all prior holders of that lock to release it, and
+\item Blocking any other acquisition attempts until the lock is released.
+\end{enumerate*}
 As a result, at lock acquisition time, any concurrent acquisitions of
 that lock must be partitioned into prior holders and subsequent
 holders.
@@ -1369,8 +1377,8 @@ implementation.
 The classic reader-writer lock implementation involves a set of
 counters and flags that are manipulated atomically.
 This type of implementation suffers from the same problem as does
-exclusive locking for short critical sections: The overhead of acquiring
-and releasing the lock
+exclusive locking for short critical sections:
+The overhead of acquiring and releasing the lock
 is about two orders of magnitude greater than the overhead
 of a simple instruction.
 Of course, if the critical section is long enough, the overhead of
@@ -1478,9 +1486,9 @@ of scalable high-performance special-purpose alternatives to locking.
 \label{tab:locking:VAX/VMS Distributed Lock Manager Policy}
 \end{table}
 
-Reader-writer locks and exclusive locks differ in their admission
-policy: exclusive locks allow at most one holder, while reader-writer
-locks permit an arbitrary number of read-holders (but only one write-holder).
+Reader-writer locks and exclusive locks differ in their admission policy:
+Exclusive locks allow at most one holder, while reader-writer locks
+permit an arbitrary number of read-holders (but only one write-holder).
 There is a very large number of possible admission policies, one of
 which is that of the VAX/VMS distributed lock
 manager (DLM)~\cite{Snaman87}, which is shown in
@@ -1892,9 +1900,9 @@ location, including both test-and-set locks and ticket locks,
 suffer from performance problems at high contention levels.
 The problem is that the thread releasing the lock must update the
 value of the corresponding memory location.
-At low contention, this is not a problem: The corresponding cache line
-is very likely still local to and writeable by the thread holding
-the lock.
+At low contention, this is not a problem:
+The corresponding cache line is very likely still local to and
+writeable by the thread holding the lock.
 In contrast, at high levels of contention, each thread attempting to
 acquire the lock will have a read-only copy of the \IX{cache line}, and
 the lock holder will need to invalidate all such copies before it
@@ -2083,7 +2091,8 @@ roll-your-own efforts is that the standard primitives are typically
 
 \input{locking/locking-existence}
 
-\section{Locking: Hero or Villain?}
+\section{Locking:
+		  Hero or Villain?}
 \label{sec:locking:Locking: Hero or Villain?}
 %
 \epigraph{You either die a hero or you live long enough to see yourself
@@ -2098,7 +2107,8 @@ parallelizing existing sequential libraries are extremely unhappy.
 The following sections discuss some reasons for these differences in
 viewpoints.
 
-\subsection{Locking For Applications: Hero!}
+\subsection{Locking For Applications:
+				      Hero!}
 \label{sec:locking:Locking For Applications: Hero!}
 
 When writing an entire application (or entire kernel), developers have
@@ -2128,7 +2138,8 @@ Given careful design, use of a good combination of synchronization
 mechanisms, and good tooling, locking works quite well for applications
 and kernels.
 
-\subsection{Locking For Parallel Libraries: Just Another Tool}
+\subsection{Locking For Parallel Libraries:
+					    Just Another Tool}
 \label{sec:locking:Locking For Parallel Libraries: Just Another Tool}
 
 Unlike applications and kernels, the designer of a library cannot
@@ -2287,11 +2298,12 @@ yourself a favor by looking into alternative designs first.
 \label{sec:locking:Explicitly Avoid Callback Deadlocks}
 
 The basic rule behind this strategy was discussed in
-\cref{sec:locking:Local Locking Hierarchies}: ``Release all
-locks before invoking unknown code.''
+\cref{sec:locking:Local Locking Hierarchies}:
+``Release all locks before invoking unknown code.''
 This is usually the best approach because it allows the application to
-ignore the library's locking hierarchy: the library remains a leaf or
-isolated subtree of the application's overall locking hierarchy.
+ignore the library's locking hierarchy:
+The library remains a leaf or isolated subtree of the application's
+overall locking hierarchy.
 
 In cases where it is not possible to release all locks before invoking
 unknown code, the layered locking hierarchies described in
@@ -2382,7 +2394,8 @@ in general.
 The cases where \co{pthread_atfork()} works best are cases where the data structure
 in question can simply be re-initialized by the child.
 
-\subsubsection{Parallel Libraries: Discussion}
+\subsubsection{Parallel Libraries:
+				   Discussion}
 \label{sec:locking:Parallel Libraries: Discussion}
 
 Regardless of the strategy used, the description of the library's API
@@ -2391,7 +2404,8 @@ should interact with that strategy.
 In short, constructing parallel libraries using locking is possible,
 but not as easy as constructing a parallel application.
 
-\subsection{Locking For Parallelizing Sequential Libraries: Villain!}
+\subsection{Locking For Parallelizing Sequential Libraries:
+							    Villain!}
 \label{sec:locking:Locking For Parallelizing Sequential Libraries: Villain!}
 
 With the advent of readily available low-cost multicore systems,
-- 
2.17.1


