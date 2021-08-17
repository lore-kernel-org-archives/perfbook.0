Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bXGo/UwATYLYP3LrFdqQ+aGO9D5xHDvSVw7+cSTNBfg=;
        b=rviaEP8pqmYidqNsQLOxoDhNKCpV8yhRa7daFOk+EHv1qCitk+zcbKcQ4nuY02YoBe
         j95TiKEgWOQ4Qv7qdvymgN7NnmRDxEA1gMvI1MnoFQHz1ZOMhKiEVEjBAulxfaLSf/dy
         JxZ4OQY/jYSxc16L/C3APXczQDkM0Bb+Dbiz+KLAYLNcj1OT7JZ2VGPfcfcRQ9WoGjpa
         xWbcrsZXd/226o4FwgIVRySD7wdvC5T+pUmffgS0S9hIHuFP+z0subrL7HHwWgQbtWRX
         8oRclfDlLOYH2v/TOcmdk2hPHsWoq+j7SGyyRxBnpFcvtspjHQ+/4Db+p9hpP7yCU72Q
         hjdw==
Subject: [PATCH -perfbook 01/11] appendix, glossary: Break and capitalize
 after colon
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <825fec8b-9803-b9b0-dd3f-13eba2cfb0a1@gmail.com>
Date: Tue, 17 Aug 2021 19:16:34 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/after.tex         |  2 +-
 appendix/toyrcu/toyrcu.tex           | 11 ++++++-----
 appendix/whymb/whymemorybarriers.tex | 24 ++++++++++++------------
 glossary.tex                         | 14 ++++++++------
 4 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 195179d9..bd7c46b5 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -130,7 +130,7 @@ These locks cause the code segments in
 each other, in other words, to run atomically with respect to each other.
 This is represented in
 \cref{fig:app:questions:Effect of Locking on Snapshot Collection}:
-the locking prevents any of the boxes of code from overlapping in time, so
+The locking prevents any of the boxes of code from overlapping in time, so
 that the consumer's timestamp must be collected after the prior
 producer's timestamp.
 The segments of code in each box in this figure are termed
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index fd3f8c6d..b84755e3 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -533,8 +533,9 @@ checking of \co{rcu_refcnt}.
 	read-side critical section to see the recently removed
 	data element.
 
-	Exercise for the reader: use a tool such as Promela/spin
-	to determine which (if any) of the memory barriers in
+	Exercise for the reader:
+	Use a tool such as Promela/spin to determine which (if any) of
+	the memory barriers in
 	\cref{lst:app:toyrcu:RCU Update Using Global Reference-Count Pair}
 	are really needed.
 	See \cref{chp:Formal Verification}
@@ -590,9 +591,9 @@ checking of \co{rcu_refcnt}.
 		section was still referencing.
 	\end{sequence}
 
-	Exercise for the reader: What happens if \co{rcu_read_lock()}
-	is preempted for a very long time (hours!\@) just after
-	\clnref{r:lock:cur:b}?
+	Exercise for the reader:
+	What happens if \co{rcu_read_lock()} is preempted for a very long
+	time (hours!\@) just after \clnref{r:lock:cur:b}?
 	Does this implementation operate correctly in that case?
 	Why or why not?
 	The first correct and complete response will be credited.
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index c476730e..25d2c8f5 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -21,10 +21,10 @@ of how CPU caches work, and especially what is required to make
 caches really work well.
 The following sections:
 \begin{enumerate}
-\item	present the structure of a cache,
-\item	describe how cache-coherency protocols ensure that CPUs agree
+\item	Present the structure of a cache,
+\item	Describe how cache-coherency protocols ensure that CPUs agree
 	on the value of each location in memory, and, finally,
-\item	outline how store buffers and invalidate queues help
+\item	Outline how store buffers and invalidate queues help
 	caches and cache-coherency protocols achieve high performance.
 \end{enumerate}
 We will see that memory barriers are a necessary evil that is required
@@ -99,7 +99,8 @@ The size (32 cache lines in this case) and the
 this case) are collectively called the cache's
 ``\IXalt{geometry}{cache geometry}''.
 Since this cache is implemented in hardware, the hash function is
-extremely simple: extract four bits from the memory address.
+extremely simple:
+Extract four bits from the memory address.
 
 \begin{figure}
 \centering
@@ -385,11 +386,10 @@ levels of the system architecture.
 	What happens if two CPUs attempt to invalidate the
 	same cache line concurrently?
 }\QuickQuizAnswerB{
-	One of the CPUs gains access
-	to the shared bus first,
-	and that CPU ``wins''.  The other CPU must invalidate its copy of the
-	cache line and transmit an ``invalidate acknowledge'' message
-	to the other CPU\@.
+	One of the CPUs gains access to the shared bus first,
+	and that CPU ``wins''.
+	The other CPU must invalidate its copy of the cache line and
+	transmit an ``invalidate acknowledge'' message to the other CPU\@.
 
 	Of course, the losing CPU can be expected to immediately issue a
 	``read invalidate'' transaction, so the winning CPU's victory will
@@ -1436,9 +1436,9 @@ the assertion.
 	CPU~1's accesses, so the assertion could still fail.
 	However, all mainstream computer systems provide one mechanism
 	or another to provide ``transitivity'', which provides
-	intuitive causal ordering: if B saw the effects of A's accesses,
-	and C saw the effects of B's accesses, then C must also see
-	the effects of A's accesses.
+	intuitive causal ordering:
+	If B saw the effects of A's accesses, and C saw the effects of
+	B's accesses, then C must also see the effects of A's accesses.
 	In short, hardware designers have taken at least a little pity
 	on software developers.
 }\QuickQuizEnd
diff --git a/glossary.tex b/glossary.tex
index 60993be2..12dc7529 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -106,23 +106,25 @@
 	that CPU's cache.
 	The data might be missing because of a number of reasons,
 	including:
-	(1) this CPU has never accessed the data before
+	\begin{enumerate*}[(1)]
+	\item This CPU has never accessed the data before
 	(``startup'' or ``warmup'' miss),
-	(2) this CPU has recently accessed more
+	\item This CPU has recently accessed more
 	data than would fit in its cache, so that some of the older
 	data had to be removed (``capacity'' miss),
-	(3) this CPU
+	\item This CPU
 	has recently accessed more data in a given set\footnote{
 		In hardware-cache terminology, the word ``set''
 		is used in the same way that the word ``bucket''
 		is used when discussing software caches.}
 	than that set could hold (``associativity'' miss),
-	(4) some other CPU has written to the data (or some other
+	\item Some other CPU has written to the data (or some other
 	data in the same cache line) since this CPU has accessed it
 	(``communication miss''), or
-	(5) this CPU attempted to write to a cache line that is
+	\item This CPU attempted to write to a cache line that is
 	currently read-only, possibly due to that line being replicated
 	in other CPUs' caches.
+	\end{enumerate*}
 \item[\IXalth{Capacity Miss}{capacity}{cache miss}:]
 	A cache miss incurred because the corresponding CPU has recently
 	accessed more data than will fit into the cache.
@@ -462,7 +464,7 @@
 	is a pre-existing writer, any threads attempting to write must
 	wait for the writer to release the lock.
 	A key concern for reader-writer locks is ``fairness'':
-	can an unending stream of readers starve a writer or vice versa.
+	Can an unending stream of readers starve a writer or vice versa.
 \item[\IX{Real Time}:]
 	A situation in which getting the correct result is not sufficient,
 	but where this result must also be obtained within a given amount
-- 
2.17.1


