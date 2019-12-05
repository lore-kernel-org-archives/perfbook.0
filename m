Return-Path: <SRS0=ldQa=Z3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3xW2tlfT9Y63qnVg8yx1YdC5dlqb/M97BbfGutBfokk=;
        b=QgFkzTfEDoZPafy2m1/t7MMtDVtDa+MTZxpzHTgd27aOjZaNAPYWIuvKqCv4IM9S+r
         5aQniSRqH8N/oD83eWnJsl+/VQgF3ftsg5+r49UgOlWeFA1HPKmA6pkrYa4p7CxZwsQ9
         8+TMKQy57ryCVSgKaTnjmOJ1zeczfagL9eJzrVyFLRaUVv+VEkAyAvLLFXQ7LYe8dYle
         qMTxT5/zRYl1OkUD+TBvzdNtkLQtAOjdJi9c2NnOfbtMjYTbOd2eBsosEFTflKdpyeIF
         l7EEN6Z6qvorLZtOR/pdbwTaKkcvQKtTJOvvwAAUCsD4f+ysgjlByqIAYL4lmHtKnKKV
         5xyg==
Subject: [PATCH 2/3] treewide: Use endash for ranges
References: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ea339da6-f01d-9d0c-ff52-70af378fd4f9@gmail.com>
Date: Fri, 6 Dec 2019 00:17:05 +0900
MIME-Version: 1.0
In-Reply-To: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 65bc89f244d1442f65e9aba2c178905eada8ee5d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 4 Dec 2019 19:39:57 +0900
Subject: [PATCH 2/3] treewide: Use endash for ranges

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex                       | 2 +-
 appendix/toyrcu/toyrcu.tex           | 2 +-
 appendix/whymb/whymemorybarriers.tex | 2 +-
 cpu/overheads.tex                    | 2 +-
 datastruct/datastruct.tex            | 6 +++---
 defer/hazptr.tex                     | 2 +-
 easy/easy.tex                        | 2 +-
 future/formalregress.tex             | 2 +-
 legal.tex                            | 2 +-
 locking/locking.tex                  | 4 ++--
 10 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 86e6d378..e5ec1bd9 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -1335,7 +1335,7 @@ which as of early 2015 involves something like the following:
 $ echo 0f > /proc/irq/44/smp_affinity
 \end{VerbatimU}
 
-This command would confine interrupt \#44 to CPUs~0-3.
+This command would confine interrupt \#44 to CPUs~0--3.
 Note that scheduling-clock interrupts require special handling, and are
 discussed later in this section.
 
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 549b3f06..9dff9f8a 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1492,7 +1492,7 @@ shows the implementation of \co{synchronize_rcu()}, which is
 quite similar to that of the preceding sections.
 
 This implementation has blazingly fast read-side primitives, with
-an \co{rcu_read_lock()}-\co{rcu_read_unlock()} round trip incurring
+an \co{rcu_read_lock()}--\co{rcu_read_unlock()} round trip incurring
 an overhead of roughly 50~\emph{picoseconds}.
 The \co{synchronize_rcu()} overhead ranges from about 600~nanoseconds
 on a single-CPU \Power{5} system up to more than 100~microseconds on
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 8071af29..cc5b2648 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1472,7 +1472,7 @@ other CPUs.
 Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.
 
 \QuickQuiz{}
-	Suppose that lines~3-5 for CPUs~1 and 2 in
+	Suppose that lines~3--5 for CPUs~1 and~2 in
 	\cref{lst:app:whymb:Memory Barrier Example 3}
 	are in an interrupt
 	handler, and that the CPU~2's line~9 runs at process level.
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 99abee89..1b6a4e54 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -297,7 +297,7 @@ cycles, as shown in the ``Global Comms'' row.
 \QuickQuizAnswer{
 	Get a roll of toilet paper.
 	In the USA, each roll will normally have somewhere around
-	350-500 sheets.
+	350--500 sheets.
 	Tear off one sheet to represent a single clock cycle, setting it aside.
 	Now unroll the rest of the roll.
 
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c84f3384..8290e284 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -382,11 +382,11 @@ Furthermore, going from 8192 buckets to 16,384 buckets produced almost
 no increase in performance.
 Clearly something else is going on.
 
-The problem is that this is a multi-socket system, with CPUs~0-7
-and~32-39 mapped to the first socket as shown in
+The problem is that this is a multi-socket system, with CPUs~0--7
+and~32--39 mapped to the first socket as shown in
 Figure~\ref{fig:datastruct:NUMA Topology of System Under Test}.
 Test runs confined to the first eight CPUs therefore perform quite
-well, but tests that involve socket~0's CPUs~0-7 as well as
+well, but tests that involve socket~0's CPUs~0--7 as well as
 socket~1's CPU~8 incur the overhead of passing data across
 socket boundaries.
 This can severely degrade performance, as was discussed in
diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index df426026..2579ec4f 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -206,7 +206,7 @@ indication to the caller.
 If the call to \co{hp_try_record()} raced with deletion, line~\lnref{deleted}
 branches back to line~\lnref{retry}'s \co{retry} to re-traverse the list
 from the beginning.
-The \co{do}-\co{while} loop falls through when the desired element is
+The \co{do}--\co{while} loop falls through when the desired element is
 located, but if this element has already been freed, line~\lnref{abort}
 terminates the program.
 Otherwise, the element's \co{->iface} field is returned to the caller.
diff --git a/easy/easy.tex b/easy/easy.tex
index b4ca210a..edc8455b 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -58,7 +58,7 @@ things are covered in the next section.
 % Rusty is OK with this: July 19, 2006.
 
 This section is adapted from portions of Rusty Russell's 2003 Ottawa Linux
-Symposium keynote address~\cite[Slides 39-57]{RustyRussell2003OLSkeynote}.
+Symposium keynote address~\cite[Slides~39--57]{RustyRussell2003OLSkeynote}.
 Rusty's key point is that the goal should not be merely to make an API
 easy to use, but rather to make the API hard to misuse.
 To that end, Rusty proposed his ``Rusty Scale'' in decreasing order
diff --git a/future/formalregress.tex b/future/formalregress.tex
index da69273d..8a4f3d2f 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -51,7 +51,7 @@ are invaluable design aids, if you need to formally regression-test
 your C-language program, you must hand-translate to Promela each time
 you would like to re-verify your code.
 If your code happens to be in the Linux kernel, which releases every
-60-90 days, you will need to hand-translate from four to six times
+60--90 days, you will need to hand-translate from four to six times
 each year.
 Over time, human error will creep in, which means that the verification
 won't match the source code, rendering the verification useless.
diff --git a/legal.tex b/legal.tex
index 7c827795..21b9263f 100644
--- a/legal.tex
+++ b/legal.tex
@@ -41,4 +41,4 @@ for the exact licenses.
 If you are unsure of the license for a given code fragment,
 you should assume GPLv2-only.
 
-Combined work {\textcopyright}~2005-\commityear\ by Paul E. McKenney.
+Combined work {\textcopyright}~2005--\commityear\ by Paul E. McKenney.
diff --git a/locking/locking.tex b/locking/locking.tex
index e8a0d310..189d5adc 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -985,11 +985,11 @@ for example, as shown in
 Figure~\ref{fig:lock:System Architecture and Lock Unfairness}.
 If CPU~0 releases a lock that all the other CPUs are attempting
 to acquire, the interconnect shared between CPUs~0 and~1 means that
-CPU~1 will have an advantage over CPUs~2-7.
+CPU~1 will have an advantage over CPUs~2--7.
 Therefore CPU~1 will likely acquire the lock.
 If CPU~1 hold the lock long enough for CPU~0 to be requesting the
 lock by the time CPU~1 releases it and vice versa, the lock can
-shuttle between CPUs~0 and~1, bypassing CPUs~2-7.
+shuttle between CPUs~0 and~1, bypassing CPUs~2--7.
 
 \QuickQuiz{}
 	Wouldn't it be better just to use a good parallel design
-- 
2.17.1


