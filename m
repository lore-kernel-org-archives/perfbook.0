Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=mhy1doRiQSFg+DgSmy7lSpxpFthuZXjAtKJWbxn2t4Y=;
 b=uXyNgHgYSITSqHNNh2BNeeOGEXtOtEVq3u8YcOKvRzwB2Sw8DNiqUYqgIrQsXQ02MM
 cnlg2pXJc9JhOriW3FUngzr3Vvq4Xmm+ZEthhOHf4ccfd/H3JdQUQGJk7fzyCbZ93abC
 TXNvmPkm401gXcquGk28Qy5hVPfEt/aCnPGbLGNA00PaS+nS76LeZF2nJeV7yLNOoEDO
 jCLGBACBgqIn3L5V3omeFLmmvJzoYKyH8I6o1CEO78FRqGABdrRzFN2835sKNyUr4CJb
 mH9ND7tuywC+lNrNWLJgUpSnrSr2M00czw7oOJQMBy290fdyAPhDF+Y+VdOYh3Grc8BI
 4oxQ==
Subject: [RFC PATCH 1/7] advsync: Import 'TRANSITIVITY' section from
 memory-barriers.txt
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <145e0c85-7cf8-5433-3da1-ecf13be09ecf@gmail.com>
Date: Sat, 25 Mar 2017 18:35:50 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9df6a5d3eb65c67b79f8d15ee7928d617eae2c47 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:42:06 +0900
Subject: [RFC PATCH 1/7] advsync: Import 'TRANSITIVITY' section from memory-barriers.txt

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 175 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 15ed1f6..efc2cbd 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2536,6 +2536,181 @@ as shown in Figure~\ref{fig:advsync:Speculative Loads Cancelled by Barrier}.
 \ContributedBy{Figure}{fig:advsync:Speculative Loads Cancelled by Barrier}{David Howells}
 \end{figure*}

+\subsubsection{Transitivity}
+\label{sec:advsync:Transitivity}
+
+``Transitivity'' is a deeply intuitive notion about ordering that is not
+always provided by real computer systems.  The following example
+demonstrates transitivity with initial values of
+{\tt \{X = 0, Y = 0\}}:
+
+\vspace{5pt}
+\begin{minipage}[t]{\columnwidth}
+\tt
+\scriptsize
+\begin{tabular}{l|l|l}
+	\nf{CPU 1}	& \nf{CPU 2}		& \nf{CPU 3} \\
+	\hline
+	X = 1;		& LOAD X		& Y = 1; \\
+			& <general barrier>	& <general barrier> \\
+			& LOAD Y		& LOAD X \\
+\end{tabular}
+\end{minipage}
+\vspace{5pt}
+
+Suppose that CPU~2's load from~\co{X} returns~1 and its load from~\co{Y} returns~0.
+This indicates that CPU~2's load from~\co{X} in some sense follows CPU~1's
+store to~\co{X} and that CPU~2's load from~\co{Y} in some sense preceded CPU~3's
+store to~\co{Y}.  The question is then ``Can CPU~3's load from~\co{X} return~0?''
+
+Because CPU~2's load from~\co{X} in some sense came after CPU~1's store, it
+is natural to expect that CPU~3's load from~\co{X} must therefore return~1.
+This expectation is an example of transitivity: if a load executing on
+CPU~A follows a load from the same variable executing on CPU~B, then
+CPU~A's load must either return the same value that CPU~B's load did,
+or must return some later value.
+
+In the Linux kernel, use of general memory barriers guarantees
+transitivity.  Therefore, in the above example, if CPU~2's load from~\co{X}
+returns~1 and its load from~\co{Y} returns~0, then CPU~3's load from~\co{X} must
+also return~1.
+
+However, transitivity is {\em not} guaranteed for read or write barriers.
+For example, suppose that CPU~2's general barrier in the above example
+is changed to a read barrier as shown below with the same initial values of
+{\tt \{X = 0, Y = 0\}}:
+
+\vspace{5pt}
+\begin{minipage}[t]{\columnwidth}
+\tt
+\scriptsize
+\begin{tabular}{l|l|l}
+	\nf{CPU 1}	& \nf{CPU 2}		& \nf{CPU 3} \\
+	\hline
+	X = 1;		& LOAD X		& Y = 1; \\
+			& <read barrier>	& <general barrier> \\
+			& LOAD Y		& LOAD X \\
+\end{tabular}
+\end{minipage}
+\vspace{5pt}
+
+This substitution destroys transitivity: in this example, it is perfectly
+legal for CPU~2's load from~\co{X} to return~1, its load from~\co{Y} to return~0,
+and CPU~3's load from~\co{X} to return~0.
+
+The key point is that although CPU~2's read barrier orders its pair
+of loads, it does not guarantee to order CPU~1's store.  Therefore, if
+this example runs on a system where CPUs~1 and~2 share a store buffer
+or a level of cache, CPU~2 might have early access to CPU~1's writes.
+General barriers are therefore required to ensure that all CPUs agree
+on the combined order of CPU~1's and CPU~2's accesses.
+
+General barriers provide ``global transitivity'', so that all CPUs will
+agree on the order of operations.  In contrast, a chain of release-acquire
+pairs provides only ``local transitivity'', so that only those CPUs on
+the chain are guaranteed to agree on the combined order of the accesses.
+For example, switching to C code in deference to Herman Hollerith:
+
+{\scriptsize
+\begin{verbatim}
+   1 int u, v, x, y, z;
+   2
+   3 void cpu0(void)
+   4 {
+   5   r0 = smp_load_acquire(&x);
+   6   WRITE_ONCE(u, 1);
+   7   smp_store_release(&y, 1);
+   8 }
+   9
+  10 void cpu1(void)
+  11 {
+  12   r1 = smp_load_acquire(&y);
+  13   r4 = READ_ONCE(v);
+  14   r5 = READ_ONCE(u);
+  15   smp_store_release(&z, 1);
+  16 }
+  17
+  18 void cpu2(void)
+  19 {
+  20   r2 = smp_load_acquire(&z);
+  21   smp_store_release(&x, 1);
+  22 }
+  23
+  24 void cpu3(void)
+  25 {
+  26   WRITE_ONCE(v, 1);
+  27   smp_mb();
+  28   r3 = READ_ONCE(u);
+  29 }
+\end{verbatim}
+}
+
+Because \co{cpu0()}, \co{cpu1()}, and \co{cpu2()} participate in a local transitive
+chain of \co{smp_store_release()}-\co{smp_load_acquire()} pairs, the following
+outcome is prohibited:
+
+{\scriptsize
+\begin{verbatim}
+  r0 == 1 && r1 == 1 && r2 == 1
+\end{verbatim}
+}
+
+Furthermore, because of the release-acquire relationship between \co{cpu0()}
+and \co{cpu1()}, \co{cpu1()} must see \co{cpu0()}'s writes, so that the following
+outcome is prohibited:
+
+{\scriptsize
+\begin{verbatim}
+  r1 == 1 && r5 == 0
+\end{verbatim}
+}
+
+However, the transitivity of release-acquire is local to the participating
+CPUs and does not apply to \co{cpu3()}.  Therefore, the following outcome
+is possible:
+
+{\scriptsize
+\begin{verbatim}
+  r0 == 0 && r1 == 1 && r2 == 1 && r3 == 0 && r4 == 0
+\end{verbatim}
+}
+
+As an aside, the following outcome is also possible:
+
+{\scriptsize
+\begin{verbatim}
+  r0 == 0 && r1 == 1 && r2 == 1 && r3 == 0 && r4 == 0
+          && r5 == 1
+\end{verbatim}
+}
+
+Although \co{cpu0()}, \co{cpu1()}, and \co{cpu2()} will see their respective reads and
+writes in order, CPUs not involved in the release-acquire chain might
+well disagree on the order.  This disagreement stems from the fact that
+the weak memory-barrier instructions used to implement \co{smp_load_acquire()}
+and \co{smp_store_release()} are not required to order prior stores against
+subsequent loads in all cases.  This means that \co{cpu3()} can see \co{cpu0()}'s
+store to~\co{u} as happening {\em after} \co{cpu1()}'s load from~\co{v}, even though
+both \co{cpu0()} and \co{cpu1()} agree that these two operations occurred in the
+intended order.
+
+However, please keep in mind that \co{smp_load_acquire()} is not magic.
+In particular, it simply reads from its argument with ordering.  It does
+{\em not} ensure that any particular value will be read.  Therefore, the
+following outcome is possible:
+
+{\scriptsize
+\begin{verbatim}
+  r0 == 0 && r1 == 0 && r2 == 0 && r5 == 0
+\end{verbatim}
+}
+
+Note that this outcome can happen even on a mythical sequentially
+consistent system where nothing is ever reordered.
+
+To reiterate, if your code requires global transitivity, use general
+barriers throughout.
+
 \subsection{Locking Constraints}
 \label{sec:advsync:Locking Constraints}

-- 
2.7.4


