Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=kd9zirqGTL/KW/MpcNDZCy8Kmovh/mQjlul+HdsgOwE=;
 b=gwV1E5/Ppskl2eUgQSTUgSAVVe3IRAs2gO/5TXxzV+VFQNCisr6RgfST7+aLEMHng6
 JFqg6DKvbu/h9I5vvG819z8f01XI3BkUUvBmpwAem9O9BoHEJlYosOMUoBWtP+ZR6Lqs
 VuIlPgO/LE9pCGHWofV0/fc5Hj8iEoGUCPIOAyy/TEp2Tb7qcitu9JCKQv0NrCPBjW1V
 Vdv26k0v6Zba2hxMYd3Jame72HyBBgeM2bBL8PC4PaMZ5R/hbZcNCrU7UgrK00I4j9fp
 awDy8NbALjM3gxK1O43WCBOD7JoBYy7FMkyBEqEdumv/ixLHlXkDhXdA3LDCmIZledSa
 sX1g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] count: Use new scheme for updated 2 snippets
Message-ID: <2b7297a8-62d2-bcdb-0b41-e3bb1b270a6e@gmail.com>
Date: Sat, 15 Sep 2018 11:08:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "Palik, Imre" <imrep.amz@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e8d3761680aa3d5a978ddccf2b9c00b5920cd39e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 14 Sep 2018 22:11:18 +0900
Subject: [PATCH 1/2] count: Use new scheme for updated 2 snippets

Also use "static __inline__" for inlined function definitions.

Commit b1bab635598b ("Making the counter implementations safer")
introduced the __inline__ keyword. Inline functions defined in CodeSamples/api_pthreads/api-gcc.h have "static __inline__"
keywords. Such functions can not be used in functions which have
only __inline__. The commit avoided the mismatch by not adding
__inline__ to inc_count() in count_atomic.c.

Consistently using "static __inline__" should be a better
approach in this case.

Side effect: This change slightly increases height of code
snippets, and the "[bp]" placement specifier to
count_nonatomic.c originally appeared in commit 216744f9918e
("Add non-optimized counter material to the count chapter.")
back in 2009, which repeatedly swung among "[hp]", [tp], and
"[bp]" during 2016 and 2017, has finally become moot.
We can settle with the default "[tbp]".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
CC: Imre Palik <imrep.amz@gmail.com>
---
Imre, 

Changes in count_atomic.c and count_nonatomic.c should not affect
their performance so much. So all we need for now is the performance
data of count_nonatomic after applying the previous patch (now
commit c1e1273b3e17 in the repository.

Paul,

My plan is to take care of the other code under CodeSamples/count/
and update code snippets in Chapter 5 after the Figure 5.1 fix.

    Thanks, Akira
--
 CodeSamples/count/count_atomic.c    | 16 +++++++-----
 CodeSamples/count/count_nonatomic.c | 16 +++++++-----
 count/count.tex                     | 51 +++++++++----------------------------
 3 files changed, 30 insertions(+), 53 deletions(-)

diff --git a/CodeSamples/count/count_atomic.c b/CodeSamples/count/count_atomic.c
index fc73717..298f104 100644
--- a/CodeSamples/count/count_atomic.c
+++ b/CodeSamples/count/count_atomic.c
@@ -20,23 +20,25 @@

 #include "../api.h"

-atomic_t counter = ATOMIC_INIT(0);
+//\begin{snippet}[labelbase=ln:count:count_atomic:inc-read,commandchars=\\\[\]]
+atomic_t counter = ATOMIC_INIT(0);		//\lnlbl{counter}

-void inc_count(void)
+static __inline__ void inc_count(void)
 {
-	atomic_inc(&counter);
+	atomic_inc(&counter);			//\lnlbl{inc}
 }

-__inline__ long read_count(void)
+static __inline__ long read_count(void)
 {
-	return atomic_read(&counter);
+	return atomic_read(&counter);		//\lnlbl{read}
 }
+//\end{snippet}

-__inline__ void count_init(void)
+static __inline__ void count_init(void)
 {
 }

-__inline__ void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }

diff --git a/CodeSamples/count/count_nonatomic.c b/CodeSamples/count/count_nonatomic.c
index 50df475..d5582b1 100644
--- a/CodeSamples/count/count_nonatomic.c
+++ b/CodeSamples/count/count_nonatomic.c
@@ -21,23 +21,25 @@

 #include "../api.h"

-unsigned long counter = 0;
+//\begin{snippet}[labelbase=ln:count:count_nonatomic:inc-read,commandchars=\\\[\]]
+unsigned long counter = 0;				//\lnlbl{counter}

-__inline__ void inc_count(void)
+static __inline__ void inc_count(void)
 {
-	WRITE_ONCE(counter, READ_ONCE(counter) + 1);
+	WRITE_ONCE(counter, READ_ONCE(counter) + 1);	//\lnlbl{inc}
 }

-__inline__ unsigned long read_count(void)
+static __inline__ unsigned long read_count(void)
 {
-	return READ_ONCE(counter);
+	return READ_ONCE(counter);			//\lnlbl{read}
 }
+//\end{snippet}

-__inline__ void count_init(void)
+static __inline__ void count_init(void)
 {
 }

-__inline__ void count_cleanup(void)
+static __inline__ void count_cleanup(void)
 {
 }

diff --git a/count/count.tex b/count/count.tex
index b9cd888..cfdacb5 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -165,24 +165,8 @@ are more appropriate for advanced students.
 \section{Why Isn't Concurrent Counting Trivial?}
 \label{sec:count:Why Isn't Concurrent Counting Trivial?}

-\begin{listing}[bp]
-{ \scriptsize
-\begin{verbbox}
-  1 long counter = 0;
-  2 
-  3 void inc_count(void)
-  4 {
-  5   counter++;
-  6 }
-  7 
-  8 long read_count(void)
-  9 {
- 10   return counter;
- 11 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_nonatomic@inc-read.fcv}
 \caption{Just Count!}
 \label{lst:count:Just Count!}
 \end{listing}
@@ -190,9 +174,11 @@ are more appropriate for advanced students.
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
 Listing~\ref{lst:count:Just Count!} (\path{count_nonatomic.c}).
-Here, we have a counter on line~1, we increment it on line~5, and we
-read out its value on line~10.
+\begin{lineref}[ln:count:count_nonatomic:inc-read]
+Here, we have a counter on line~\lnref{counter}, we increment it on
+line~\lnref{inc}, and we read out its value on line~\lnref{read}.
 What could be simpler?
+\end{lineref}

 This approach has the additional advantage of being blazingly fast if
 you are doing lots of reading and almost no incrementing, and on small
@@ -243,23 +229,7 @@ accuracies far greater than 50\,\% are almost always necessary.
 } \QuickQuizEnd

 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 atomic_t counter = ATOMIC_INIT(0);
-  2 
-  3 void inc_count(void)
-  4 {
-  5   atomic_inc(&counter);
-  6 }
-  7 
-  8 long read_count(void)
-  9 {
- 10   return atomic_read(&counter);
- 11 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_atomic@inc-read.fcv}
 \caption{Just Count Atomically!}
 \label{lst:count:Just Count Atomically!}
 \end{listing}
@@ -274,8 +244,11 @@ accuracies far greater than 50\,\% are almost always necessary.
 The straightforward way to count accurately is to use atomic operations,
 as shown in
 Listing~\ref{lst:count:Just Count Atomically!} (\path{count_atomic.c}).
-Line~1 defines an atomic variable, line~5 atomically increments it, and
-line~10 reads it out.
+\begin{lineref}[ln:count:count_atomic:inc-read]
+Line~\lnref{counter} defines an atomic variable,
+line~\lnref{inc} atomically increments it, and
+line~\lnref{read} reads it out.
+\end{lineref}
 Because this is atomic, it keeps perfect count.
 However, it is slower: on a Intel Core Duo laptop, it is about
 six times slower than non-atomic increment
-- 
2.7.4

