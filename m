Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=r/ppz89sytiAeTpsMPUJpsbgL1YlH495894w1g2v8Q0=;
 b=p05KltCZoQ1Z/GpkgQDx0srT9CLM9n7ASYQcpiPUprplCm8liVBk3TiXISD5lqHqyF
 iVz6MIoHwSp+fYTyFd8luqqaLq3/DBfSJa3iHmFgHohekdwaUJSPiFeCDFJ1Gi+ei7W6
 A4JAduTQ/FsnxOm2PxC0mUVadf2PvRy4lNd2IHgLh/X7CAkT4ZqVSX69rlHhLgAp2YUM
 3YcjSTXkutREtuSAgvw4PdzxlcrUCYEI0UXzRt1gaJMN83YxpmOckKHcrzo0NGyNo9il
 RW0nmzB4YntOpdUobZQjEGw64+RUaCoSBuIz7CLfiWpLkcuKyBEbpaANnD4hm8g8bVDF
 6QVg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal, memorder: Fix typo and spacing
Message-ID: <12a44ecc-999b-e753-271e-fc9097c97855@gmail.com>
Date: Sat, 4 Nov 2017 00:03:47 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6c10afe8a85c716b09038ee210530ef6005fc28e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 3 Nov 2017 23:54:07 +0900
Subject: [PATCH] formal, memorder: Fix typo and adjust spacing

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
NOTE: Addition of "%" in the Answer to Quick Quiz is to avoid any white
spaces to be recognized by TeX engine before the first sentence of the
answer.

 formal/formal.tex     |  2 +-
 formal/regression.tex |  6 +++---
 memorder/memorder.tex | 38 +++++++++++++++++++-------------------
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/formal/formal.tex b/formal/formal.tex
index 7c1aeac..670139f 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -162,7 +162,7 @@ The larger overarching software construct is of course validated by testing.
 One final approach is to consider the following two definitions and the
 consequence that they imply:

-\begin{description}
+\begin{description}[itemsep=0pt,labelindent=1em]
 \item[Definition:]	Bug-free programs are trivial programs.
 \item[Definition:]	Reliable programs have no known bugs.
 \item[Consequence:]	Any non-trivial reliable program contains at least
diff --git a/formal/regression.tex b/formal/regression.tex
index 479ae02..e541346 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -237,7 +237,7 @@ Listing~\ref{lst:formal:Emulating Locking with cmpxchg}
 Table~\ref{tab:formal:Emulating Locking: Performance (s)}
 compares the performance and scalability of using the model's
 \co{spin_lock()} and \co{spin_unlock()} against emulating these
-primitives as shown in the figure.
+primitives as shown in the listing.
 The difference is not insignificant: At four processes, the model
 is more than two orders of magnitude faster than emulation!

@@ -384,7 +384,7 @@ What happens to the reliability of this software artifact?
 The perhaps surprising answer is that the reliability \emph{decreases}.

 To see this, keep in mind that historical experience indicates that
-about 7\% of fixes introduce a new bug~\cite{RexBlack2012SQA}.
+about 7\,\% of fixes introduce a new bug~\cite{RexBlack2012SQA}.
 Therefore, fixing the 100 bugs, which had a combined mean time to failure
 (MTBF) of about 10,000 years, will introduce seven more bugs.
 Historical statistics indicate that each new bug will have an MTBF
@@ -400,7 +400,7 @@ decreased the reliability of the overall software.
 \QuickQuizAnswer{
 	We don't, but it does not matter.

-	To see this, note that the 7\% figure only applies to injected
+	To see this, note that the 7\,% figure only applies to injected
 	bugs that were subsequently located: It necessarily ignores
 	any injected bugs that were never found.
 	Therefore, the MTBF statistics of known bugs is likely to be
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 446f480..3ba4d3a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2809,25 +2809,25 @@ int z = 0;

 P0(int *x, int *y)
 {
-	WRITE_ONCE(*x, 1);
-	smp_store_release(y, 1);
+  WRITE_ONCE(*x, 1);
+  smp_store_release(y, 1);
 }

 P1(int *y, int *z)
 {
-	int r1;
+  int r1;

-	r1 = smp_load_acquire(y);
-	WRITE_ONCE(*z, 1);
+  r1 = smp_load_acquire(y);
+  WRITE_ONCE(*z, 1);
 }

 P2(int *z, int *x)
 {
-	int r3;
+  int r3;

-	WRITE_ONCE(*z, 2);
-	smp_mb();
-	r2 = READ_ONCE(*x);
+  WRITE_ONCE(*z, 2);
+  smp_mb();
+  r2 = READ_ONCE(*x);
 }

 exists(1:r1=1 /\ 2:r2=0 /\ z=2)
@@ -2855,7 +2855,7 @@ exists(1:r1=1 /\ 2:r2=0 /\ z=2)
 	thereof, it is necessary to have at least one full barrier
 	(\co{smp_mb()} or better) between each non-store-to-load link.
 	In
-	Figure~\ref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)},
+	Listing~\ref{lst:memorder:Z6.0 Release-Acquire Chain (Ordering?)},
 	preventing the \co{exists} clause from triggering therefore requires
 	an additional full barrier between either \co{P0()}'s or
 	\co{P1()}'s accesses.
@@ -3327,7 +3327,7 @@ ordering is lost.
 	integer, but if memory is low, it might instead point to
 	the \co{reserve_int} variable.
 	This \co{reserve_int} case might need special handling, as
-	shown on lines~6 and~7 of the figure.
+	shown on lines~6 and~7 of the listing.
 	But the compiler could reasonably transform this code into
 	the form shown in
 	Listing~\ref{lst:memorder:Broken Dependencies With Comparisons},
@@ -3361,7 +3361,7 @@ ordering is lost.
 	of either, so how can it possibly learn anything from the
 	comparison?
 \QuickQuizAnswer{
-
+%
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
@@ -3381,8 +3381,8 @@ ordering is lost.
 \theverbbox
 \caption{Breakable Dependencies With Non-Constant Comparisons}
 \label{lst:memorder:Breakable Dependencies With Non-Constant Comparisons}
-\end{listing}
-
+\end{listing}%
+%
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
@@ -3405,8 +3405,8 @@ ordering is lost.
 \theverbbox
 \caption{Broken Dependencies With Non-Constant Comparisons}
 \label{lst:memorder:Broken Dependencies With Non-Constant Comparisons}
-\end{listing}
-
+\end{listing}%
+%
 	Unfortunately, the compiler really can learn enough to
 	break your dependency chain, for example, as shown in
 	Listing~\ref{lst:memorder:Breakable Dependencies With Non-Constant Comparisons}.
@@ -3511,7 +3511,7 @@ pointers:

 Pointer comparisons can be quite tricky, and so it is well worth working
 through the example shown in
-Figure~\ref{lst:memorder:Broken Dependencies With Pointer Comparisons}.
+Listing~\ref{lst:memorder:Broken Dependencies With Pointer Comparisons}.
 This example uses a simple \co{struct foo} shown on lines~1-5 and
 two global pointers, \co{gp1} and \co{gp2}, shown on lines~6 and~7,
 respectively.
@@ -3525,7 +3525,7 @@ assigns the pointer to \co{gp1}.
 Lines~19 and~20 then update two of the structure's fields, and does
 so \co{after} line~18 has made those fields visible to readers.
 Please note that unsynchronized update of reader-visible fields
-often constitutes a but.
+often constitutes a bug.
 Although there are legitmate use cases doing just this, such use cases
 require more care than is exercised in this example.

@@ -4206,7 +4206,7 @@ hacker.
 The dependent-load difference between Alpha and the other CPUs is
 illustrated by the code shown in
 Listing~\ref{lst:memorder:Insert and Lock-Free Search}.
-This \co{smp_wmb()} on line~9 of this figure
+This \co{smp_wmb()} on line~9 of this listing
 guarantees that the element initialization
 in lines~6-8 is executed before the element is added to the
 list on line~10, so that the lock-free search will work correctly.
-- 
2.7.4

