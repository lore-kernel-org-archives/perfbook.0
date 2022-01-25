Return-Path: <SRS0=opCU=SJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gvSmRpTdW0r2iiTVO9VQAy7CuC/rlxE/mOGUoOggykc=;
        b=ksNiykgPzZlcNIVX+H9P2VlUls/j76RmwhEQ5Wf6BL2LZrDcUD7GN2k2DcIRypCYL0
         FnQnI1CCvvCBhJjgyCLmqzZXa1DbQijKxvcOw/0QOryy/KD4bYN79PwaCfZ52F/lEONJ
         dlpT+DX+NBkro6vwPU2ro1NSJlzXkISu4+Mi7ijHlI1CvwYM4XL2WSvHjeAHUnF6W+4e
         ZNGgg2Oc0P3k4GdSAl7TVeBUS4Z2V4q3UabwpGueJRQCigc7oe0ijh3/ytZESZr1Xw+4
         L01Z9QK7PVF2b1iVMljTgdNv/+WvXtqTut3HlaH/QnAhOZmYJUeGhQMNFL9wexQHRczC
         UF/g==
Message-ID: <24161b8f-6502-3c0c-8a8f-5df72939a686@gmail.com>
Date: Tue, 25 Jan 2022 19:10:22 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 6/6] index: Reform indexing tags related to 'memory
 consistency'
Content-Language: en-US
References: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <5baa07e6-7936-4d3a-d2be-75508899f8ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hierarchical indices of "sequential consistency", "process
consistency", and "weak consistency" are under "memory consistency".

However, "Memory consistency, sequential" would indicate the term
"Sequential memory consistency" were preferred to "Sequential
consistency".

Improve the organization by putting those terms under "Consistency"
alongside "memory consistency" and avoid such a false impression.

Also add several "see xxxxx" references in indexsee.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/formalregress.tex | 2 +-
 glossary.tex             | 6 +++---
 indexsee.tex             | 7 +++++++
 memorder/memorder.tex    | 4 ++--
 together/seqlock.tex     | 3 +--
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index 12d3e5d8..e33c5161 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -139,7 +139,7 @@ It is critically important that formal-verification tools correctly
 model their environment.
 One all-too-common omission is the memory model, where a great
 many formal-verification tools, including Promela/spin, are
-restricted to \IXalth{sequential consistency}{sequential}{memory consistency}.
+restricted to \IXh{sequential}{consistency}.
 The QRCU experience related in
 \cref{sec:formal:Is QRCU Really Correct?}
 is an important cautionary tale.
diff --git a/glossary.tex b/glossary.tex
index 1d4a2404..f0cb33e3 100644
--- a/glossary.tex
+++ b/glossary.tex
@@ -386,7 +386,7 @@
 	caches, and store buffers in which values might be stored.
 	However, this term is often used to denote the main memory
 	itself, excluding caches and store buffers.
-\item[\IXG{Memory Consistency}:]
+\item[\IXGh{Memory}{Consistency}:]
 	A set of properties that impose constraints on the order in
 	which accesses to groups of variables appear to occur.
 	Memory consistency models range from sequential consistency,
@@ -493,7 +493,7 @@
 	A source-code memory access that simply mentions the name of
 	the object being accessed.
 	(See ``Marked access''.)
-\item[\IXGalth{Process Consistency}{process}{memory consistency}:]
+\item[\IXGh{Process}{Consistency}:]
 	A memory-consistency model in which each CPU's stores appear to
 	occur in program order, but in which different CPUs might see
 	accesses from more than one CPU as occurring in different orders.
@@ -607,7 +607,7 @@
 \item[\IXGh{Sequence}{Lock}:]
 	A reader-writer synchronization mechanism in which readers
 	retry their operations if a writer was present.
-\item[\IXGalth{Sequential Consistency}{sequential}{memory consistency}:]
+\item[\IXGh{Sequential}{Consistency}:]
 	A memory-consistency model where all memory references appear to occur
 	in an order consistent with
 	a single global order, and where each CPU's memory references
diff --git a/indexsee.tex b/indexsee.tex
index 2331966b..1fc2d8b5 100644
--- a/indexsee.tex
+++ b/indexsee.tex
@@ -1,6 +1,7 @@
 \index{Associativity|see{Cache associativity}}
 \index{Associativity miss|see{Cache miss, associativity}}
 \index{Bounded wait free|see{Wait free, bounded}}
+\index{Bounded population-oblivious wait free|see{Wait free, bounded population-oblivious}}
 \index{Capacity miss|see{Cache miss, capacity}}
 \index{Code locking|see{Locking, code}}
 \index{Communication miss|see{Cache miss, communication}}
@@ -8,8 +9,14 @@
 \index{Direct-mapped cache|see{Cache, direct-mapped}}
 \index{Exclusive lock|see{Lock, exclusive}}
 \index{Fully associative cache|see{Cache, fully associative}}
+\index{Memory-barrier overhead|see{Overhead, memory-barrier}}
+\index{Memory consistency|see{Consistency, memory}}
+\index{Process consistency|see{Consistency, process}}
+\index{RCU read-side critical section|see{Critical section, RCU read-side}}
 \index{Read-side critical section|see{Critical section, read-side}}
 \index{Reader-writer lock|see{Lock, reader-writer}}
 \index{Sequence lock|see{Lock, sequence}}
+\index{Sequencial consistency|see{Consistency, sequencial}}
+\index{Weak consistency|see{Consistency, weak}}
 \index{Write miss|see{Cache miss, write}}
 \index{Write-side critical section|see{Critical section, write-side}}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 3793c233..865eff95 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4313,7 +4313,7 @@ architecture-specific code or synchronization primitives.
 Besides, they say that a little knowledge is a very dangerous thing.
 Just imagine the damage you could do with a lot of knowledge!
 For those who wish to understand more about individual CPUs'
-\IX{memory consistency} models, the next sections describe those of a few
+\IXh{memory}{consistency} models, the next sections describe those of a few
 popular and prominent CPUs.
 Although there is no substitute for actually reading a given CPU's
 documentation, these sections do give a good overview.
@@ -4672,7 +4672,7 @@ defined its memory ordering with an executable formal model~\cite{ARMv8A:2017}.
 \subsection{Itanium}
 \label{sec:memorder:Itanium}
 
-Itanium offers a \IXalth{weak consistency}{weak}{memory consistency}
+Itanium offers a \IXh{weak}{consistency}
 model, so that in absence of explicit
 memory-barrier instructions or dependencies, Itanium is within its rights
 to arbitrarily reorder memory references~\cite{IntelItanium02v2}.
diff --git a/together/seqlock.tex b/together/seqlock.tex
index a00103ef..b8acbe3d 100644
--- a/together/seqlock.tex
+++ b/together/seqlock.tex
@@ -132,8 +132,7 @@ notably in the dcache subsystem~\cite{NeilBrown2015RCUwalk}.
 Note that it is likely that similar schemes also work with hazard
 pointers.
 
-This approach provides \IXalth{sequential consistency}{sequential}
-{memory consistency} to successful readers,
+This approach provides \IXh{sequential}{consistency} to successful readers,
 each of which will either see the effects of a given update or not,
 with any partial updates resulting in a read-side retry.
 Sequential consistency is an extremely strong guarantee, incurring equally
-- 
2.17.1


