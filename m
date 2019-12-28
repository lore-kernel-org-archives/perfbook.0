Return-Path: <SRS0=q0D/=2S=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=If+llt5s9TM1kEi5gqMFX+/KYr2+cSKHB5eakLqUBlc=;
        b=e3z4SJjUgp84BYAFWMkZHsPMlRDEhAHFWFeIypPCnTtiRn+JC9PGcZ9c+j/HvHh8Fp
         wFf2prjpblFE/RNyktyHtvbiN/qNrSqM97oeaMjpQF4tMJQBlN8NWFB6CnR1YXL5+jbx
         whgn+tjKs19ge8IDGLpyed6vKwBpKycm62y722Q0bIc9BIEJr0m2rFqd7kxmqtfxXWcr
         08z7GRVSX/bqBZxePmvq1kZSsejkX8o8UhR0ryalGMc7WRxNVDr2tYjpX0J9fh45FuYW
         aLXt246PEbxFB2uBfwaWM+oIrAMMcvLWtFGuA6QR8ftOrk2h99rEDPUMN3PGR3ENrhwX
         pIqw==
Subject: [PATCH 1/2] appendix/questions: Fix 'cleveref' macro usage in
 ordering section
References: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a9a91de5-0cac-adef-f4d2-4bf6050bdf9d@gmail.com>
Date: Sun, 29 Dec 2019 08:33:35 +0900
MIME-Version: 1.0
In-Reply-To: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1e4d76525b1b02fc567b42bbc226a9ea3cc17759 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Dec 2019 07:49:14 +0900
Subject: [PATCH 1/2] appendix/questions: Fix 'cleveref' macro usage in ordering section

Notes:
  - \Cref{} is for the beginning of a sentence (or after a ":").
  - \cref{} should be used elsewhere.
  - \cref{}/\Cref{} can handle a comma-separated list of labels as
    long as they are of a same type/level.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/ordering.tex | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
index 88cf4dc3..43df44a9 100644
--- a/appendix/questions/ordering.tex
+++ b/appendix/questions/ordering.tex
@@ -22,7 +22,7 @@ its performance and scalablity.
 If these suffice, the system is good and sufficient, and no more need
 be done.
 Otherwise, undertake careful analysis
-(see \Cref{sec:debugging:Performance Estimation})
+(see \cref{sec:debugging:Performance Estimation})
 and attack the bottleneck located thereby.
 
 This approach can work very well, especially in contrast to the
@@ -38,8 +38,7 @@ redesigns and rewrites of other parts of the system.
 Perhaps even worse is the approach, also common, of starting with a
 fast but unreliable system and then playing whack-a-mole with an endless
 succession of concurrency bugs, though in the latter case,
-Chapters~\ref{chp:Validation}
-and~\ref{chp:Formal Verification}
+\cref{chp:Validation,chp:Formal Verification}
 are always there for you.
 
 It would be better to have design-time tools to determine which portions
@@ -59,9 +58,9 @@ world can usually feature weak ordering, given that speed-of-light delays
 will force the within-system state to lag behind the outside world.
 There is often no point in incurring large overheads to force a consistent
 view of data that is inherently out of date.
-In these cases, the methods of \Cref{chp:Deferred Processing} can be
+In these cases, the methods of \cref{chp:Deferred Processing} can be
 quite helpful, as can some of the data structures described in
-\Cref{chp:Data Structures}.
+\cref{chp:Data Structures}.
 
 Nevertheless, it is wise to adopt some meaningful semantics that are
 visible to those accessing the data, for example, a given function's
@@ -72,13 +71,13 @@ return value might be:
 	to the function and the conceptual value at the time of the
 	return from that function.
 	For example, see the statistical counters discussed in
-	\Cref{sec:count:Statistical Counters}, keeping in mind that such
+	\cref{sec:count:Statistical Counters}, keeping in mind that such
 	counters are normally monotonic, at least between consecutive
 	overflows.
 \item	The actual value at some time between the call to and the return
 	from that function.
 	For example, see the single-variable atomic counter shown in
-	\Cref{lst:count:Just Count Atomically!}.
+	\cref{lst:count:Just Count Atomically!}.
 \item	If the values used by that function remain unchanged during the
 	time between that function's call and return, the expected
 	value, otherwise some approximation to the expected value.
@@ -86,7 +85,7 @@ return value might be:
 	be quite challenging.
 	For example, consider a function combining values from
 	different elements of an RCU-protected linked data structure,
-	as described in \Cref{sec:datastruct:Read-Mostly Data Structures}.
+	as described in \cref{sec:datastruct:Read-Mostly Data Structures}.
 \end{enumerate}
 
 In short, weaker ordering usually entails weaker consistency, and
@@ -106,9 +105,9 @@ than the semantics given by the options above.
 	able to provide greater consistency among sets of calls to
 	functions accessing a given data structure.
 	For example, compare the atomic counter of
-	\Cref{lst:count:Just Count Atomically!}
+	\cref{lst:count:Just Count Atomically!}
 	to the statistical counter of
-	\Cref{sec:count:Statistical Counters}.
+	\cref{sec:count:Statistical Counters}.
 	Suppose that one thread is adding the value 3 and another is
 	adding the value 5, while two other threads are concurrently
 	reading the counter's value.
@@ -144,7 +143,7 @@ is released.
 The computed result clearly becomes at best an approximation as soon as
 the lock is released, which suggests computing the result approximately
 in the first place, possibly permitting use of weaker ordering.
-To this end, \Cref{chp:Counting} covers numerous approximate methods
+To this end, \cref{chp:Counting} covers numerous approximate methods
 for counting.
 
 Great care is required, however.
@@ -160,12 +159,12 @@ or that using a computed value past lock release proved to be a bug.
 What then?
 
 One approach is to partition the system, as discussed in
-\Cref{cha:Partitioning and Synchronization Design}.
+\cref{cha:Partitioning and Synchronization Design}.
 Partititioning can provide excellent scalability and in its more
 extreme form, per-CPU performance rivaling that of a sequential program,
-as discussed in \Cref{chp:Data Ownership}.
+as discussed in \cref{chp:Data Ownership}.
 Partial partitioning is often mediated by locking, which is the subject of
-\Cref{chp:Locking}.
+\cref{chp:Locking}.
 
 \subsection{None of the Above?}
 \label{sec:app:questions:None of the Above?}
@@ -175,13 +174,13 @@ and scalability, sometimes using weaker ordering and sometimes not.
 But the plain fact is that multicore systems are under no compunction
 to make life easy.
 But perhaps the advanced topics covered in
-Chapter~\ref{sec:advsync:Advanced Synchronization}
-and~\ref{chp:Advanced Synchronization: Memory Ordering}
+\cref{sec:advsync:Advanced Synchronization,%
+chp:Advanced Synchronization: Memory Ordering}
 will prove helpful.
 
 But please proceed with care, as it is all too easy to destabilize
 your codebase optimizing non-bottlenecks.
-Once again, \Cref{sec:debugging:Performance Estimation} can help.
+Once again, \cref{sec:debugging:Performance Estimation} can help.
 It might also be worth your time to review other portions of this
 book, as it contains much information on handling a number of tricky
 situations.
-- 
2.17.1


