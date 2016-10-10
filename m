Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lD8zmPIfTe4OxasAV2kjce18lxuLBykMHRlQ8gy9rnQ=;
 b=Iu5tPQyiwOUw+4gVhnDhzywBpQtGRcBswd7/SsP5R9j6QXlX0Ugm/FX41pVo/pANEQ
 KpXX1KE69DTlUGsiccjomtPrk4PcwK325BZZqevykDpu4DGpODufOQIJJFdckZiHTQAj
 7xfiWqkRYrK/5fXiTRllLuj8WNuBB/TwBN7D1iRXrUPS41Vuy4Lwgc6fe7HlYUKxdSPT
 Yw/f1qfxiHvkD6DYccYU/eFQC0F+1D8nHorMfqD/LPZVCeWg7d6dcGVqt4+8LtwMHnDE
 4OvmHLMAykOlDqFw1i/40QqlaKw8bO8ZuGD5m5+NI55HrHR4EYho3gH9BGdFZpLBilKY
 9bmQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/8] together: Add missing NBSPs for line numbers
Date: Tue, 11 Oct 2016 08:07:31 +0900
Message-Id: <20161010230738.14452-2-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds few missed NBSP(Non-Breaking Space)s for line number
quotations.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 6 +++---
 together/refcnt.tex   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 15039f645acc..659928877c00 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -208,17 +208,17 @@ Lines~10-13 show \co{inc_count()}, which is unchanged from
 Figure~\ref{fig:count:Per-Thread Statistical Counters}.

 Lines~15-29 show \co{read_count()}, which has changed significantly.
-Lines~21 and 27 substitute \co{rcu_read_lock()} and
+Lines~21 and~27 substitute \co{rcu_read_lock()} and
 \co{rcu_read_unlock()} for acquisition and release of \co{final_mutex}.
 Line~22 uses \co{rcu_dereference()} to snapshot the
 current \co{countarray} structure into local variable \co{cap}.
 Proper use of RCU will guarantee that this \co{countarray} structure
 will remain with us through at least the end of the current RCU
 read-side critical section at line~27.
-Line 23 initializes \co{sum} to \co{cap->total}, which is the
+Line~23 initializes \co{sum} to \co{cap->total}, which is the
 sum of the counts of threads that have previously exited.
 Lines~24-26 add up the per-thread counters corresponding to currently
-running threads, and, finally, line 28 returns the sum.
+running threads, and, finally, line~28 returns the sum.

 The initial value for \co{countarrayp} is
 provided by \co{count_init()} on lines~31-39.
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 778ad8e9da24..587a067f7501 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -504,7 +504,7 @@ Line~6 invokes \co{rcu_read_lock()}, which
 enters an RCU read-side critical section.
 The callback function from any subsequent \co{call_rcu()} primitive
 will be deferred until a matching \co{rcu_read_unlock()} is reached
-(line~10 or 14 in this example).
+(line~10 or~14 in this example).
 Line~7 looks up the file structure corresponding to the file
 descriptor specified by the \co{fd} argument, as will be
 described later.
-- 
2.10.0

