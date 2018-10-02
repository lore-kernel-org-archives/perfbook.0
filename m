Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=SuzQAISUbwj9wTvbNs52aD5gWbQb6XiFLamE2oBXn3M=;
        b=H4c96HKIi/h0zoNSI8kE0JYzXEge+DEqAtlgsYxXDSF6cFMRKqa+Qe8gPU2u+Tl8mT
         2jmIgHa+ynQvo1mDooEtUQSdIOHeoN/kSZmU0usfSXnMUAOSELnQoaktPiR29z0l5McC
         nG+mR3wr/2SZi7RP1o8k8dSFnacrUxYcp/bpKBumrlBOgUvv1TBveFPS1Lo476sANQrB
         ERMgZuLge4dKwKZaK1HIpUkD139kAFIrgPiqhpLR/8ZlaYIpiu4pn66bExjiIzAzwMta
         zd2tvvduuGY6AwZgEcQL6KAxcgu5D1a++gvMDSSPQAisR6tsz1dFtBnR8CQoJgEvGTDD
         GwOg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] count: Employ new scheme for snippet from count_stat.c
Message-ID: <afb11222-c68a-22e6-a95c-bfb4d4b9344d@gmail.com>
Date: Wed, 3 Oct 2018 00:15:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 047e2e2aa09633f5605111119e2f45fd43f6febc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 2 Oct 2018 23:54:33 +0900
Subject: [PATCH 1/2] count: Employ new scheme for snippet from count_stat.c

Also add necessary READ_ONCE()/WRITE_ONCE() as par.
the rule of where to use them provided by Paul as an
outline on perfbook mail-list [1].

[1]: https://www.spinics.net/lists/perfbook/msg01788.html

Suggested by: Paul E. McKenney <paulmck@linux.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_stat.c | 22 +++++++++++++---------
 count/count.tex                | 33 ++++++++-------------------------
 2 files changed, 21 insertions(+), 34 deletions(-)

diff --git a/CodeSamples/count/count_stat.c b/CodeSamples/count/count_stat.c
index 1d72f99..0675320 100644
--- a/CodeSamples/count/count_stat.c
+++ b/CodeSamples/count/count_stat.c
@@ -20,28 +20,32 @@
 
 #include "../api.h"
 
-DEFINE_PER_THREAD(unsigned long, counter);
+//\begin{snippet}[labelbase=ln:count:count_stat:inc-read,commandchars=\\\[\]]
+DEFINE_PER_THREAD(unsigned long, counter);		//\lnlbl{define}
 
-void inc_count(void)
+static __inline__ void inc_count(void)			//\lnlbl{inc:b}
 {
-	__get_thread_var(counter)++;
-}
+	unsigned long *p_counter = &__get_thread_var(counter);
+
+	WRITE_ONCE(*p_counter, *p_counter + 1);
+}							//\lnlbl{inc:e}
 
-__inline__ unsigned long read_count(void)
+static __inline__ unsigned long read_count(void)	//\lnlbl{read:b}
 {
 	int t;
 	unsigned long sum = 0;
 
 	for_each_thread(t)
-		sum += per_thread(counter, t);
+		sum += READ_ONCE(per_thread(counter, t));
 	return sum;
-}
+}							//\lnlbl{read:e}
+//\end{snippet}
 
-__inline__ void count_init(void)
+void count_init(void)
 {
 }
 
-__inline__ void count_cleanup(void)
+void count_cleanup(void)
 {
 }
 
diff --git a/count/count.tex b/count/count.tex
index a7d4c9d..4f760a4 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -477,28 +477,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 DEFINE_PER_THREAD(long, counter);
-  2 
-  3 void inc_count(void)
-  4 {
-  5   __get_thread_var(counter)++;
-  6 }
-  7 
-  8 long read_count(void)
-  9 {
- 10   int t;
- 11   long sum = 0;
- 12 
- 13   for_each_thread(t)
- 14     sum += per_thread(counter, t);
- 15   return sum;
- 16 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_stat@inc-read.fcv}
 \caption{Array-Based Per-Thread Statistical Counters}
 \label{lst:count:Array-Based Per-Thread Statistical Counters}
 \end{listing}
@@ -506,22 +485,26 @@ thread (presumably cache aligned and padded to avoid false sharing).
 Such an array can be wrapped into per-thread primitives, as shown in
 Listing~\ref{lst:count:Array-Based Per-Thread Statistical Counters}
 (\path{count_stat.c}).
-Line~1 defines an array containing a set of per-thread counters of
+\begin{lineref}[ln:count:count_stat:inc-read]
+Line~\lnref{define} defines an array containing a set of per-thread counters of
 type \co{long} named, creatively enough, \co{counter}.
 
-Lines~3-6 show a function that increments the counters, using the
+Lines~\lnref{inc:b}-\lnref{inc:e}
+show a function that increments the counters, using the
 \co{__get_thread_var()} primitive to locate the currently running
 thread's element of the \co{counter} array.
 Because this element is modified only by the corresponding thread,
 non-atomic increment suffices.
 
-Lines~8-16 show a function that reads out the aggregate value of the counter,
+Lines~\lnref{read:b}-\lnref{read:e}
+show a function that reads out the aggregate value of the counter,
 using the \co{for_each_thread()} primitive to iterate over the list of
 currently running threads, and using the \co{per_thread()} primitive
 to fetch the specified thread's counter.
 Because the hardware can fetch and store a properly aligned \co{long}
 atomically, and because \GCC\ is kind enough to make use of this capability,
 normal loads suffice, and no special atomic instructions are required.
+\end{lineref}
 
 \QuickQuiz{}
 	What other choice does \GCC\ have, anyway???
-- 
2.7.4

