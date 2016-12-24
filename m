Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=u8YT/VLbE+U6SOSTNB6xvCdDcYj+DZlv1n98huGJjg8=;
 b=YjueVelTTv3oE7CoQvBiZCj4skSIZrnRCRxr1cLiHIyIxT47xj5bX+m9vluYrMwbpb
 ZDau73uwzDGWQL7UMiKYLWLO6nL+g5O820Wj5ShYiNqO7UbxeEoHfRyICg5+X+XD748+
 wbv9W04fvqs+dfVB2QE14rohv+g3cL3GxR9KePp2ahDH3APvw/eb6XFKDYm/CVFiQwtS
 3XFX7vUK9aQWh+8kcEtMYKtpomOpfS4edcxls28PoEsWj2dCfxLNNC1WsB49PuCKYWAf
 97qean38WnoC4zK/L/14utuHJnLYLNY8npFQf9oKXC0jMED/x2Tk4cirum0Z39rqzvvY
 mZWA==
Subject: [PATCH 1/2] advsync/memorybarriers: Use non-confusing variable names
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
 <20161223185842.GB3742@linux.vnet.ibm.com>
 <c7b39cad-90b4-140b-1e62-8d4ddc84f8ff@gmail.com>
 <20161224002217.GE3742@linux.vnet.ibm.com>
 <4d1151a1-49c0-45ad-e4fb-5ee8120e352e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a4f30c9e-0c51-bcf9-6b09-563c9172eedb@gmail.com>
Date: Sat, 24 Dec 2016 13:24:01 +0900
MIME-Version: 1.0
In-Reply-To: <4d1151a1-49c0-45ad-e4fb-5ee8120e352e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 22918af5495588c6e80e6249c7c57a6e88a18c5c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Dec 2016 12:30:35 +0900
Subject: [PATCH 1/2] advsync/memorybarriers: Use non-confusing variable names

Variable name of "a" requires quotation marks to avoid confusion.
By using other single letter names, we can remove quotation marks
around them.
This commit uses x, y, and z instead of "a", "b", and "c".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 98 +++++++++++++++++++++++-----------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 4ecee71..b344364 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1783,10 +1783,10 @@ Consider the following bit of code:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  1 q = READ_ONCE(a);
+  1 q = READ_ONCE(x);
   2 if (q) {
   3   <data dependency barrier>
-  4   q = READ_ONCE(b);
+  4   q = READ_ONCE(y);
   5 }
 \end{verbatim}
 \end{minipage}
@@ -1795,17 +1795,17 @@ Consider the following bit of code:
 This will not have the desired effect because there is no actual data
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
-the load from ``\co{b}'' as having happened before the load from ``\co{a}''.
+the load from \co{y} as having happened before the load from \co{x}.
 In such a case what's actually required is:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  1 q = READ_ONCE(a);
+  1 q = READ_ONCE(x);
   2 if (q) {
   3   <read barrier>
-  4   q = READ_ONCE(b);
+  4   q = READ_ONCE(y);
   5 }
 \end{verbatim}
 \end{minipage}
@@ -1819,9 +1819,9 @@ dependencies, as in the following example:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  1 q = READ_ONCE(a);
+  1 q = READ_ONCE(x);
   2 if (q)
-  3   WRITE_ONCE(b, 1);
+  3   WRITE_ONCE(y, 1);
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
@@ -1830,13 +1830,13 @@ Control dependencies pair normally with other types of barriers.
 That said, please note that neither \co{READ_ONCE()} nor \co{WRITE_ONCE()}
 are optional!
 Without the \co{READ_ONCE()}, the compiler might combine the load
-from ``\co{a}'' with other loads from ``\co{a}''.
+from \co{x} with other loads from \co{x}.
 Without the \co{WRITE_ONCE()}, the compiler might combine the store to
-``\co{b}'' with other stores to ``\co{b}''.
+\co{y} with other stores to \co{y}.
 Either can result in highly counterintuitive effects on ordering.

 Worse yet, if the compiler is able to prove (say) that the value of
-variable ``\co{a}'' is always non-zero, it would be well within its rights
+variable \co{x} is always non-zero, it would be well within its rights
 to optimize the original example by eliminating the ``\co{if}'' statement
 as follows:

@@ -1844,8 +1844,8 @@ as follows:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-  1 q = READ_ONCE(a);
-  2 WRITE_ONCE(b, 1); /* BUG: CPU can reorder!!! */
+  1 q = READ_ONCE(x);
+  2 WRITE_ONCE(y, 1); /* BUG: CPU can reorder!!! */
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
@@ -1857,14 +1857,14 @@ branches of the ``\co{if}'' statement as follows:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 if (q) {
  3   barrier();
- 4   WRITE_ONCE(b, 1);
+ 4   WRITE_ONCE(y, 1);
  5   do_something();
  6 } else {
  7   barrier();
- 8   WRITE_ONCE(b, 1);
+ 8   WRITE_ONCE(y, 1);
  9   do_something_else();
 10 }
 \end{verbatim}
@@ -1878,9 +1878,9 @@ optimization levels:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 barrier();
- 3 WRITE_ONCE(b, 1);  /* BUG: No ordering!!! */
+ 3 WRITE_ONCE(y, 1);  /* BUG: No ordering!!! */
  4 if (q) {
  5   do_something();
  6 } else {
@@ -1890,8 +1890,8 @@ optimization levels:
 \end{minipage}
 \vspace{5pt}

-Now there is no conditional between the load from ``\co{a}'' and the store to
-``\co{b}'', which means that the CPU is within its rights to reorder them:
+Now there is no conditional between the load from \co{x} and the store to
+\co{y}, which means that the CPU is within its rights to reorder them:
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
@@ -1901,12 +1901,12 @@ memory barriers, for example, a release store:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 if (q) {
- 3   smp_store_release(&b, 1);
+ 3   smp_store_release(&y, 1);
  4   do_something();
  5 } else {
- 6   smp_store_release(&b, 1);
+ 6   smp_store_release(&y, 1);
  7   do_something_else();
  8 }
 \end{verbatim}
@@ -1914,10 +1914,10 @@ memory barriers, for example, a release store:
 \vspace{5pt}

 The initial \co{READ_ONCE()} is still required to prevent the compiler from
-proving the value of ``\co{a}''.
+proving the value of \co{x}.

 In addition, you need to be careful what you do with the local variable
-``\co{q}'',
+\co{q},
 otherwise the compiler might be able to guess the value and again remove
 the needed conditional.
 For example:
@@ -1926,12 +1926,12 @@ For example:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 if (q % MAX) {
- 3   WRITE_ONCE(b, 1);
+ 3   WRITE_ONCE(y, 1);
  4   do_something();
  5 } else {
- 6   WRITE_ONCE(b, 2);
+ 6   WRITE_ONCE(y, 2);
  7   do_something_else();
  8 }
 \end{verbatim}
@@ -1946,15 +1946,15 @@ transform the above code into the following:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
- 2 WRITE_ONCE(b, 1);
+ 1 q = READ_ONCE(x);
+ 2 WRITE_ONCE(y, 1);
  3 do_something_else();
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}

 Given this transformation, the CPU is not required to respect the ordering
-between the load from variable ``\co{a}'' and the store to variable ``\co{b}''.
+between the load from variable \co{x} and the store to variable \co{y}.
 It is tempting to add a \co{barrier()} to constrain the compiler,
 but this does not help.
 The conditional is gone, and the barrier won't bring it back.
@@ -1965,20 +1965,20 @@ that \co{MAX} is greater than one, perhaps as follows:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 BUILD_BUG_ON(MAX <= 1);
  3 if (q % MAX) {
- 4   WRITE_ONCE(b, 1);
+ 4   WRITE_ONCE(y, 1);
  5   do_something();
  6 } else {
- 7   WRITE_ONCE(b, 2);
+ 7   WRITE_ONCE(y, 2);
  8   do_something_else();
  9 }
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}

-Please note once again that the stores to ``\co{b}'' differ.
+Please note once again that the stores to \co{y} differ.
 If they were identical, as noted earlier, the compiler could pull this
 store outside of the ``\co{if}'' statement.

@@ -1989,9 +1989,9 @@ Consider this example:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 if (q || 1 > 0)
- 3   WRITE_ONCE(b, 1);
+ 3   WRITE_ONCE(y, 1);
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
@@ -2004,8 +2004,8 @@ defeating control dependency:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
- 2 WRITE_ONCE(b, 1);
+ 1 q = READ_ONCE(x);
+ 2 WRITE_ONCE(y, 1);
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}
@@ -2025,22 +2025,22 @@ not necessarily apply to code following the if-statement:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 q = READ_ONCE(a);
+ 1 q = READ_ONCE(x);
  2 if (q) {
- 3   WRITE_ONCE(b, 1);
+ 3   WRITE_ONCE(y, 1);
  4 } else {
- 5   WRITE_ONCE(b, 2);
+ 5   WRITE_ONCE(y, 2);
  6 }
- 7 WRITE_ONCE(c, 1);  /* BUG: No ordering. */
+ 7 WRITE_ONCE(z, 1);  /* BUG: No ordering. */
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}

 It is tempting to argue that there in fact is ordering because the
 compiler cannot reorder volatile accesses and also cannot reorder
-the writes to ``\co{b}'' with the condition.
+the writes to \co{y} with the condition.
 Unfortunately for this line
-of reasoning, the compiler might compile the two writes to ``\co{b}'' as
+of reasoning, the compiler might compile the two writes to \co{y} as
 conditional-move instructions, as in this fanciful pseudo-assembly
 language:

@@ -2048,18 +2048,18 @@ language:
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
- 1 ld r1,a
+ 1 ld r1,x
  2 cmp r1,$0
  3 cmov,ne r4,$1
  4 cmov,eq r4,$2
- 5 st r4,b
- 6 st $1,c
+ 5 st r4,y
+ 6 st $1,z
 \end{verbatim}
 \end{minipage}
 \vspace{5pt}

 A weakly ordered CPU would have no dependency of any sort between the load
-from ``\co{a}'' and the store to ``\co{c}''.
+from \co{x} and the store to \co{z}.
 The control dependencies would extend
 only to the pair of cmov instructions and the store depending on them.
 In short, control dependencies apply only to the stores in the ``\co{then}''
@@ -2068,7 +2068,7 @@ invoked by those two clauses), not to code following that ``\co{if}''.

 Finally, control dependencies do \emph{not} provide transitivity.
 This is demonstrated by two related examples, with the initial values of
-``\co{x}'' and ``\co{y}'' both being zero:
+\co{x} and \co{y} both being zero:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
-- 
2.7.4


