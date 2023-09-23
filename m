Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486851;
	bh=HmshB8cK0ikH8qPWTS7bZG0YqFefsqJ5TGw9A7ojGTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ghOpnvQqZ3Jv0JqOo3GsQokhaZ960YHehP3kWJv1y+D8dS4QXJ3zHPLKKH/lhNhyE
	 TE9X9YUBAetX/8kKI/7Ugq0WoNIzV2i+LxEwH6j/pKuC3Sz23H8Hn0W0xdXfs9r1nO
	 npyi/uRGrFaXkVO4Np87qf67ymq7/RciP9QVzBh2nh6NjZ7QJSge+0IYC0QpL7KWmJ
	 gZ5mIaLJ2d8tw6tQUqr16CtMexT2WB7wo2wvHVXp/21O7ZrFe/CPBV24PjPJhhKBsF
	 rV81H6qGJAY1o9QAiJrpJLzoowuczItBhAAHL7dwTHeaDLTjSgtLothR/jDrw9aPwy
	 eLPG2U2DJgFEQ==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 06/10] memorder: Consistently use \co{} instead of {\tt } for code
Date: Sat, 23 Sep 2023 09:32:00 -0700
Message-Id: <20230923163204.14558-7-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Some sentences in memorder.tex are using {\tt } for some code, while
others use \co{}.  Consistently use \co{}.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index b5887764..b7699129 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -5265,7 +5265,7 @@ of reordering memory optimizations across the barriers.
 }\QuickQuizEnd
 
 These primitives generate code only in SMP kernels, however, several
-have UP versions ({\tt mb()}, {\tt rmb()}, and {\tt wmb()},
+have UP versions (\co{mb()}, \co{rmb()}, and \co{wmb()},
 respectively) that generate a memory barrier even in UP kernels.
 The \co{smp_} versions should be used in most cases.
 However, these latter primitives are useful when writing drivers,
@@ -5486,8 +5486,8 @@ struct el *search(long searchkey)
 \end{listing}
 
 The Linux memory-barrier primitives took their names from the Alpha
-instructions, so \co{smp_mb()} is {\tt mb}, \co{smp_rmb()} is {\tt rmb},
-and \co{smp_wmb()} is {\tt wmb}.
+instructions, so \co{smp_mb()} is \co{mb}, \co{smp_rmb()} is \co{rmb},
+and \co{smp_wmb()} is \co{wmb}.
 Alpha is the only CPU whose \co{READ_ONCE()} includes an \co{smp_mb()}.
 
 \QuickQuizSeries{%
@@ -5657,17 +5657,17 @@ Itanium offers a \IXh{weak}{consistency}
 model, so that in absence of explicit
 memory-barrier instructions or dependencies, Itanium is within its rights
 to arbitrarily reorder memory references~\cite{IntelItanium02v2}.
-Itanium has a memory-fence instruction named {\tt mf}, but also has
+Itanium has a memory-fence instruction named \co{mf}, but also has
 ``half-memory fence'' modifiers to loads, stores, and to some of its atomic
 instructions~\cite{IntelItanium02v3}.
-The {\tt acq} modifier prevents subsequent memory-reference instructions
-from being reordered before the {\tt acq}, but permits
-prior memory-reference instructions to be reordered after the {\tt acq},
+The \co{acq} modifier prevents subsequent memory-reference instructions
+from being reordered before the \co{acq}, but permits
+prior memory-reference instructions to be reordered after the \co{acq},
 similar to the \ARMv8 load-acquire instructions.
-Similarly, the {\tt rel} modifier prevents prior memory-reference
-instructions from being reordered after the {\tt rel}, but allows
+Similarly, the \co{rel} modifier prevents prior memory-reference
+instructions from being reordered after the \co{rel}, but allows
 subsequent memory-reference instructions to be reordered before
-the {\tt rel}.
+the \co{rel}.
 
 These half-memory fences are useful for critical sections, since
 it is safe to push operations into a critical section, but can be
@@ -5796,7 +5796,7 @@ void synchronize_rcu(void)
 \end{fcvref}
 }\QuickQuizEnd
 
-The Itanium {\tt mf} instruction is used for the \co{smp_rmb()},
+The Itanium \co{mf} instruction is used for the \co{smp_rmb()},
 \co{smp_mb()}, and \co{smp_wmb()} primitives in the Linux kernel.
 Despite persistent rumors to the contrary, the \qco{mf} mnemonic stands
 for ``memory fence''.
@@ -5887,7 +5887,7 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
 	loads.
 	The \co{lwsync} instruction may be used to implement
 	load-acquire and store-release operations.
-	Interestingly enough, the {\tt lwsync} instruction enforces
+	Interestingly enough, the \co{lwsync} instruction enforces
 	the same within-CPU ordering as does x86, z~Systems, and coincidentally,
 	SPARC TSO\@.
 	However, placing the \co{lwsync} instruction between each
@@ -5903,7 +5903,7 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
 	were wondering) causes all preceding cacheable stores to appear
 	to have completed before all subsequent stores.
 	However, stores to cacheable memory are ordered separately from
-	stores to non-cacheable memory, which means that {\tt eieio}
+	stores to non-cacheable memory, which means that \co{eieio}
 	will not force an MMIO store to precede a spinlock release.
 	This instruction may well be unique in having a five-vowel mnemonic.
 \item	[\tco{isync}] forces all preceding instructions to appear to have
@@ -5964,7 +5964,7 @@ Thankfully, few people write self-modifying code these days, but JITs
 and compilers do it all the time.
 Furthermore, recompiling a recently run program looks just like
 self-modifying code from the CPU's viewpoint.
-The {\tt icbi} instruction (instruction cache block invalidate)
+The \co{icbi} instruction (instruction cache block invalidate)
 invalidates a specified cache line from
 the instruction cache, and may be used in these situations.
 
@@ -6018,12 +6018,12 @@ However, the heavier-weight \qco{membar #MemIssue} must be used when
 a write to a given MMIO register affects the value that will next be
 read from {\em some other} MMIO register.
 
-SPARC requires a {\tt flush} instruction be used between the time that
+SPARC requires a \co{flush} instruction be used between the time that
 the instruction stream is modified and the time that any of these
 instructions are executed~\cite{SPARC94}.
 This is needed to flush any prior value for that location from
 the SPARC's instruction cache.
-Note that {\tt flush} takes an address, and will flush only that address
+Note that \co{flush} takes an address, and will flush only that address
 from the instruction cache.
 On SMP systems, all CPUs' caches are flushed, but there is no
 convenient way to determine when the off-CPU flushes complete,
@@ -6044,7 +6044,7 @@ primitive to be a no-op for the CPU~\cite{IntelXeonV3-96a}.
 Of course, a compiler directive was also required to prevent optimizations
 that would reorder across the \co{smp_wmb()} primitive.
 In ancient times, certain x86 CPUs gave no ordering guarantees for loads, so
-the \co{smp_mb()} and \co{smp_rmb()} primitives expanded to {\tt lock;addl}.
+the \co{smp_mb()} and \co{smp_rmb()} primitives expanded to \co{lock;addl}.
 This atomic instruction acts as a barrier to both loads and stores.
 
 But those were ancient times.
@@ -6074,14 +6074,14 @@ For example, if you write a program where one CPU atomically increments
 a byte while another CPU executes a 4-byte atomic increment on
 that same location, you are on your own.
 
-Some SSE instructions are weakly ordered ({\tt clflush}
+Some SSE instructions are weakly ordered (\co{clflush}
 and non-temporal move instructions~\cite{IntelXeonV2b-96a}).
 Code that uses these non-temporal move instructions
-can also use {\tt mfence} for \co{smp_mb()},
-{\tt lfence} for \co{smp_rmb()}, and {\tt sfence} for \co{smp_wmb()}.
+can also use \co{mfence} for \co{smp_mb()},
+\co{lfence} for \co{smp_rmb()}, and \co{sfence} for \co{smp_wmb()}.
 A few older variants of the x86 CPU have a mode bit that enables out-of-order
 stores, and for these CPUs, \co{smp_wmb()} must also be defined to
-be {\tt lock;addl}.
+be \co{lock;addl}.
 
 Although newer x86 implementations accommodate self-modifying code
 without any special instructions, to be fully compatible with
-- 
2.17.1

