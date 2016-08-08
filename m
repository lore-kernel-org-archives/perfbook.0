Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=xddioFnK8wA884BPvVUhTQ0v9DpscXXLOXlGrAFbRs0=;
 b=Yiavp2+yPPqLuRIb4TbiOUw+8CQZi6ZKmIQQ8TnbJOtdHtELvN9LfeFPQKIZxvMU/I
 4ibmiWNYei1ugym8nwBZTbd0AQAgURKxEXe9UZYl23cxtZLmMvy53txxhgA9Df8zSwDW
 OMc70RIp3tLA8Lzt1omKvGpzX1yJBXpcndxKS8Do+p8PEnrKP8xBVkp7RMTPFDLnnyDQ
 EbmtTj49qcUO0+uTmf5GvH1ujGQlVdzryvDNqp2YMrQurMPe+OPsEKjVz2Ir20tlVetY
 cJQ2zkY9shGX7q4othjp7WeqhzapIdWhoVs6K4vbl3YiuDITc1QGlBWfc+wSW3dYbKfk
 oU8A==
Subject: [PATCH 4/5] Use \ldots for ellipsis
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2f80189a-8d50-5803-fdf3-4b5e26d386a1@gmail.com>
Date: Tue, 9 Aug 2016 00:06:08 +0900
MIME-Version: 1.0
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d57d8335c9aef3801ee1c3719987266567760729 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Aug 2016 11:14:23 +0900
Subject: [PATCH 4/5] Use \ldots for ellipsis

This commit replaces "..." with \ldots with enhancement provided
by the "ellipsis" package. This way is said to be better looking.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/partexercises.tex          | 4 ++--
 advsync/memorybarriers.tex           | 2 +-
 appendix/rcuhist/RCUinLinux.tex      | 2 +-
 appendix/whymb/whymemorybarriers.tex | 2 +-
 locking/locking.tex                  | 2 +-
 perfbook.tex                         | 2 ++
 rt/rt.tex                            | 2 +-
 7 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 9773c23..ca16dea 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -274,9 +274,9 @@ so that the first element left-enqueued into an empty queue is numbered
 zero and the first element right-enqueued into an empty queue is numbered
 one.
 A series of elements left-enqueued into an otherwise-idle queue would
-be assigned decreasing numbers (-1, -2, -3, ...), while a series of
+be assigned decreasing numbers (-1, -2, -3, \ldots), while a series of
 elements right-enqueued into an otherwise-idle queue would be assigned
-increasing numbers (2, 3, 4, ...).
+increasing numbers (2, 3, 4, \ldots).
 A key point is that it is not necessary to actually represent a given
 element's number, as this number will be implied by its position in
 the queue.
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index efbd4a2..27180a7 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -207,7 +207,7 @@ greatly \emph{increase} the probability of failure in this run.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Great...  So how do I fix it?
+	Great \ldots So how do I fix it?
 \QuickQuizAnswer{
 	The easiest fix is to replace each of the \co{barrier()}s on
 	line~12 and line~20 with an \co{smp_mb()}.
diff --git a/appendix/rcuhist/RCUinLinux.tex b/appendix/rcuhist/RCUinLinux.tex
index fa62087..faecf61 100644
--- a/appendix/rcuhist/RCUinLinux.tex
+++ b/appendix/rcuhist/RCUinLinux.tex
@@ -180,7 +180,7 @@ Other changes include:
 	Therefore, if someone ever wants to run Linux on a system with
 	16,777,216 CPUs, RCU is ready for them!
 	Give or take the response-time implications of scanning
-	through 16 million per-CPU data elements...
+	through 16 million per-CPU data elements \ldots
 \end{enumerate}

 \subsection{2.6.34 Linux Kernel}
diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 0351407..101f5e7 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1682,7 +1682,7 @@ of course, all bets are off.

 Furthermore,
 all of Linux's locking primitives (spinlocks, reader-writer locks,
-semaphores, RCU, ...) include any needed barrier primitives.
+semaphores, RCU, \ldots) include any needed barrier primitives.
 So if you are working with code that uses these primitives, you don't
 even need to worry about Linux's memory-ordering primitives.

diff --git a/locking/locking.tex b/locking/locking.tex
index 4d4b94b..9eafcf5 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1142,7 +1142,7 @@ rests with the developer.
 	``gray magic.''\footnote{
 		Thanks to Alexey Roytman for this decription.}
 	As such, empty critical sections are almost never used in practice.
-	Nevertheless, pressing on into this gray area...
+	Nevertheless, pressing on into this gray area \ldots

 	One historical use of empty critical sections appeared in the
 	networking stack of the 2.4 Linux kernel.
diff --git a/perfbook.tex b/perfbook.tex
index 35d6ced..bdd42ad 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -33,6 +33,8 @@
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{epigraph}
 \setlength{\epigraphwidth}{2.3in}
+\usepackage[xspace]{ellipsis}
+
 % custom packages

 \usepackage{qqz}
diff --git a/rt/rt.tex b/rt/rt.tex
index f1ed929..1fe1e7c 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -282,7 +282,7 @@ real-time systems.
 	And isn't worst-case response time all that most
 	real-time systems really care about?
 \QuickQuizAnswer{
-	Yes, but...
+	Yes, but \ldots

 	Those queueing-theory results assume infinite ``calling populations'',
 	which in the Linux kernel might correspond to an infinite number
-- 
1.9.1


