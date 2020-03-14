Return-Path: <SRS0=cZgG=47=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5EyzA6xAggmw/32iRxu1yMO7/CyUYJ4nRZKrVl/On1A=;
        b=bslyrXKH0avWc8W8/mGxwlflsdFtDzugRmTEh1zUsfEB9vZ0q1IUyB3X39iMra5RTj
         pNADuQHZZmkKP6asevjSdRN07VtsPn2kFp6IPD+Fko75Aara8AmK4d5X8a3I+FRydGDK
         SFTbvE27w5khGAk4XFTeq0JnWxgcVlL4G3z8I2K3qNQPQlohQf3m3CcGfDXN0dtrENib
         Od3fOUPjCrxU7Fb5YaOfzIxVk5FHMVas3Ba04moA0IHx7FpTEZtTV5eI1ZC4SvlfL9C3
         zBGqe0bi55b6a+tdET8dYVhSddD5ovjAADo76QyGR704BudM3qIHK4uqAqHkDWjz7nub
         s3pA==
Subject: [PATCH 3/4] Remove '(R)' and '(TM)'
References: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8dfa497d-2ffa-a6df-f05b-b5cf18217119@gmail.com>
Date: Sun, 15 Mar 2020 00:16:27 +0900
MIME-Version: 1.0
In-Reply-To: <9bb674ac-62c8-f046-5ed1-412c9d200e6c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b887d5dd9d9c839c74c34f7e7d146ef14b233afb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 14 Mar 2020 19:08:53 +0900
Subject: [PATCH 3/4] Remove '(R)' and '(TM)'

These were copy'n pasted from /proc/cpuinfo.
They are not supposed to be required in this type of textbook.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex |  8 ++++----
 cpu/overheads.tex                  | 22 +++++++++++-----------
 cpu/swdesign.tex                   |  6 +++---
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 00fa249d..b6b343e0 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -1333,14 +1333,14 @@ as a reference to be consulted when new tables are added in the text.
 	Global Comms		& 195 000 000	& 409 500 000   \\
 	\bottomrule
 \end{tabular}
-\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
-\label{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
+\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
+\label{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
 \end{table}
 
 In
-\cref{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10GHz}
+\cref{tab:app:styleguide:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
 (corresponding to
-\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}),
+\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}),
 the ``S'' column specifiers provided
 by the ``siunitx'' package are used to align numbers.
 
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index e3fa42bf..2bac760f 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -161,13 +161,13 @@ optimization.
 	Global Comms	& 195 000 000 & 409 500 000 & \\
 	\bottomrule
 \end{tabular}
-\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs @ 2.10\,GHz}
-\label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+\caption{CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10\,GHz}
+\label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 \end{table*}
 
 The overheads of some common operations important to parallel programs are
 displayed in
-Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}.
+Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}.
 This system's clock period rounds to 0.5\,ns.
 Although it is not unusual for modern microprocessors to be able to
 retire multiple instructions per clock period, the operations' costs are
@@ -234,7 +234,7 @@ That said, the overhead of these operations are similar to single-CPU
 CAS and lock, respectively.
 
 \QuickQuiz{}
-	\Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+	\Cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	shows CPU~0 sharing a core with CPU~224.
 	Shouldn't that instead be CPU~1???
 \QuickQuizAnswer{
@@ -344,16 +344,16 @@ thousand clock cycles.
 	10\,GHz.
 
 	In addition,
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	on
-	page~\pageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+	page~\pageref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	represents a reasonably large system with no fewer 448~hardware
 	threads.
 	Smaller systems often achieve better latency, as may be seen in
 	Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
 	which represents a much smaller system with only 16 hardware threads.
 	A similar view is provided by the rows of
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	down to and including the two ``Off-core'' rows.
 
 \begin{table*}
@@ -385,19 +385,19 @@ thousand clock cycles.
 	Global Comms	& 195 000 000 & 429 000 000 & \\
 	\bottomrule
 \end{tabular}
-\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20\,GHz}
-\label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz}
+\caption{CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20\,GHz}
+\label{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20GHz}
 \end{table*}
 
 	Furthermore, newer small-scale single-socket systems such
 	as the laptop on which I am typing this also have more
 	reasonable latencies, as can be seen in
-	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz}.
+	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20GHz}.
 
 	Alternatively, a 64-CPU system in the mid 1990s had
 	cross-interconnect latencies in excess of five microseconds,
 	so even the eight-socket 448-hardware-thread monster shown in
-	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+	Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	represents more than a five-fold improvement over its
 	25-years-prior counterparts.
 
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index 2a9daa95..c885c3cb 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -12,7 +12,7 @@
 	 {\emph{Ella Wheeler Wilcox}}
 
 The values of the ratios in
-Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 are critically important, as they limit the
 efficiency of a given parallel application.
 To see this, suppose that the parallel application uses CAS
@@ -50,9 +50,9 @@ be extremely infrequent and to enable very large quantities of processing.
 	\item	Large shared-memory systems tend to have much longer
 		cache-miss latencies than do smaller system.
 		To see this, compare
-		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel(R) Xeon(R) Platinum 8176 CPUs at 2.10GHz}
+		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 		with
-		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz}.
+		\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 12-CPU Intel Core i7-8750H CPU @ 2.20GHz}.
 	\item	The distributed-systems communications latencies do
 		not necessarily consume the CPU, which can often allow
 		computation to proceed in parallel with message transfer.
-- 
2.17.1


