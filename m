Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=zona0DWxmH3dVdhg+wEmenk9dog4UEejPKxy9dXs2+U=;
 b=Jt+H/7OZ6nMw/sTvpS8vTvNZ1h4637vJGPxMIF6vc9mPCawG6hKgFV6cszA/2RcCU+
 kL4eRJ18Wiq+2b/U2A6lUziqxg9u35obKkvQipqCi7SKRF2Kyp9C21U/NduWrjgd2oDQ
 P704qmRJ/wvFfVCBzh6hdpf9YaSYZOxVsBQCZTYPqny5l30Ffx5e6jth1G+QaD0PxMOc
 RQJGY3SoXD7vVMv4sWh5YdVXUx/EGBGYlXxlKQjqrnD5bgKAmyoOqGA36AUmjF31Tgyg
 jS6QALodzjumXReeepcSj0BYueGnTxk3oceqjmuS9zQtC/buoH8gkGScQD0ne6aXAdQP
 BHQQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Convert remaining code snippets in figures to
 listings
Message-ID: <dd46f6b1-a4d5-4c84-a24f-913db2de78ae@gmail.com>
Date: Mon, 18 Sep 2017 23:53:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5ea1ec3515ed44646c3337482ef2f0f6a7f5b4f2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 18 Sep 2017 23:33:39 +0900
Subject: [PATCH] memorder: Convert remaining code snippets in figures to listings

Line numbers are not touched. Conversion to auto-numbering scheme
can wait until renumbering becomes inevitable.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is for consistency in this chapter.
If it conflicts with changes on your side, I'll respin.

       Thanks, Akira
--
 memorder/memorder.tex | 58 +++++++++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f031857..0cbde1b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3089,7 +3089,7 @@ of the pointer itself.
 As soon as the compiler does that, the dependency is broken and all
 ordering is lost.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int reserve_int;
@@ -3105,10 +3105,10 @@ ordering is lost.
 \centering
 \theverbbox
 \caption{Breakable Dependencies With Comparisons}
-\label{fig:memorder:Breakable Dependencies With Comparisons}
-\end{figure}
+\label{lst:memorder:Breakable Dependencies With Comparisons}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int reserve_int;
@@ -3127,8 +3127,8 @@ ordering is lost.
 \centering
 \theverbbox
 \caption{Broken Dependencies With Comparisons}
-\label{fig:memorder:Broken Dependencies With Comparisons}
-\end{figure}
+\label{lst:memorder:Broken Dependencies With Comparisons}
+\end{listing}

 \begin{enumerate}
 \item	Although it is permissible to compute offsets from a
@@ -3141,7 +3141,7 @@ ordering is lost.
 	For example, if \co{a} and \co{b} are equal, \co{cp+a-b}
 	is an identity function, including preserving the dependency.
 \item	Comparisons can break dependencies.
-	Figure~\ref{fig:memorder:Breakable Dependencies With Comparisons}
+	Listing~\ref{lst:memorder:Breakable Dependencies With Comparisons}
 	shows how this can happen.
 	Here global pointer \co{gp} points to a dynamically allocated
 	integer, but if memory is low, it might instead point to
@@ -3150,7 +3150,7 @@ ordering is lost.
 	shown on lines~6 and~7 of the figure.
 	But the compiler could reasonably transform this code into
 	the form shown in
-	Figure~\ref{fig:memorder:Broken Dependencies With Comparisons},
+	Listing~\ref{lst:memorder:Broken Dependencies With Comparisons},
 	especially on systems where instructions with absolute
 	addresses run faster than instructions using addresses
 	supplied in registers.
@@ -3163,7 +3163,7 @@ ordering is lost.
 \QuickQuiz{}
 	Why can't you simply dereference the pointer before comparing it
 	to \co{&reserve_int} on line~6 of
-	Figure~\ref{fig:memorder:Breakable Dependencies With Comparisons}?
+	Listing~\ref{lst:memorder:Breakable Dependencies With Comparisons}?
 \QuickQuizAnswer{
 	For first, it might be necessary to invoke
 	\co{handle_reserve()} before \co{do_something_with()}.
@@ -3182,7 +3182,7 @@ ordering is lost.
 	comparison?
 \QuickQuizAnswer{

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int *gp1;
@@ -3200,10 +3200,10 @@ ordering is lost.
 \centering
 \theverbbox
 \caption{Breakable Dependencies With Non-Constant Comparisons}
-\label{fig:memorder:Breakable Dependencies With Non-Constant Comparisons}
-\end{figure}
+\label{lst:memorder:Breakable Dependencies With Non-Constant Comparisons}
+\end{listing}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 int *gp1;
@@ -3224,15 +3224,15 @@ ordering is lost.
 \centering
 \theverbbox
 \caption{Broken Dependencies With Non-Constant Comparisons}
-\label{fig:memorder:Broken Dependencies With Non-Constant Comparisons}
-\end{figure}
+\label{lst:memorder:Broken Dependencies With Non-Constant Comparisons}
+\end{listing}

 	Unfortunately, the compiler really can learn enough to
 	break your dependency chain, for example, as shown in
-	Figure~\ref{fig:memorder:Breakable Dependencies With Non-Constant Comparisons}.
+	Listing~\ref{lst:memorder:Breakable Dependencies With Non-Constant Comparisons}.
 	The compiler is within its rights to transform this code
 	into that shown in
-	Figure~\ref{fig:memorder:Broken Dependencies With Non-Constant Comparisons},
+	Listing~\ref{lst:memorder:Broken Dependencies With Non-Constant Comparisons},
 	and might well make this transformation due to register pressure
 	if \co{handle_equality()} was inlined and needed a lot of registers.
 	Line~10 of this transformed code uses \co{q}, which although
@@ -3932,14 +3932,14 @@ hacker.

 The difference between Alpha and the other CPUs is illustrated by the
 code shown in
-Figure~\ref{fig:memorder:Insert and Lock-Free Search}.
+Listing~\ref{lst:memorder:Insert and Lock-Free Search}.
 This \co{smp_wmb()} on line~9 of this figure
 guarantees that the element initialization
 in lines~6-8 is executed before the element is added to the
 list on line~10, so that the lock-free search will work correctly.
 That is, it makes this guarantee on all CPUs {\em except} Alpha.

-\begin{figure}
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct el *insert(long key, long data)
@@ -3973,12 +3973,12 @@ That is, it makes this guarantee on all CPUs {\em except} Alpha.
 \centering
 \theverbbox
 \caption{Insert and Lock-Free Search}
-\label{fig:memorder:Insert and Lock-Free Search}
-\end{figure}
+\label{lst:memorder:Insert and Lock-Free Search}
+\end{listing}

 Alpha has extremely weak memory ordering
 such that the code on line~20 of
-Figure~\ref{fig:memorder:Insert and Lock-Free Search} could see the old
+Listing~\ref{lst:memorder:Insert and Lock-Free Search} could see the old
 garbage values that were present before the initialization on lines~6-8.

 Figure~\ref{fig:memorder:Why smp-read-barrier-depends() is Required}
@@ -3987,13 +3987,13 @@ an aggressively parallel machine with partitioned caches, so that
 alternating cache lines are processed by the different partitions
 of the caches.
 For example, the load of \co{head.next} on line~17 of
-Figure~\ref{fig:memorder:Insert and Lock-Free Search}
+Listing~\ref{lst:memorder:Insert and Lock-Free Search}
 might access cache bank~0,
 and the load of \co{p->key} on line~20 and of \co{p->next} on line~23
 might access cache bank~1.
 On Alpha, the \co{smp_wmb()} will guarantee that the cache invalidations
 performed by lines~6-8 of
-Figure~\ref{fig:memorder:Insert and Lock-Free Search}
+Listing~\ref{lst:memorder:Insert and Lock-Free Search}
 (for \co{p->next}, \co{p->key}, and \co{p->data}) will reach
 the interconnect before that of line~10 (for \co{head.next}), but
 makes absolutely no guarantee about the order of
@@ -4034,10 +4034,10 @@ Itanium, PPC, and SPARC) that respect data dependencies on the read side.
 A \co{smp_read_barrier_depends()} primitive has therefore been added to the
 Linux kernel to eliminate overhead on these systems.
 This primitive could be inserted in place of line~19 of
-Figure~\ref{fig:memorder:Insert and Lock-Free Search},
+Listing~\ref{lst:memorder:Insert and Lock-Free Search},
 but it is better to use the \co{rcu_dereference()} wrapper macro
 as shown on lines~17 and~22 of
-Figure~\ref{fig:memorder:Safe Insert and Lock-Free Search}.
+Listing~\ref{lst:memorder:Safe Insert and Lock-Free Search}.

 It is also possible to implement a software barrier
 that could be used in place of \co{smp_wmb()}, which would force
@@ -4059,7 +4059,7 @@ fades off into the sunset, but as of 2017 there is a surprisingly
 large number of people who run recent Linux kernels on their lovingly
 preserved DEC Alpha systems.

-\begin{figure}
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1  struct el *insert(long key, long data)
@@ -4092,8 +4092,8 @@ preserved DEC Alpha systems.
 \centering
 \theverbbox
 \caption{Safe Insert and Lock-Free Search}
-\label{fig:memorder:Safe Insert and Lock-Free Search}
-\end{figure}
+\label{lst:memorder:Safe Insert and Lock-Free Search}
+\end{listing}

 The Linux memory-barrier primitives took their names from the Alpha
 instructions, so \co{smp_mb()} is {\tt mb}, \co{smp_rmb()} is {\tt rmb},
-- 
2.7.4

