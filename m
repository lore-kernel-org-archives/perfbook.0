Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=bgWMpncTMkeBPF7vJknUDgjd6vQgoyJKq5pGk31CS0g=;
 b=o1sYtAA4ZC8bLBeTz8GnB9pZxxqNwNvKBjsbcU89hDimGRKNVLGE85B5M9T8qq3kc4
 MM1JDm1yJzWrUonNmeBatblYaK/RYweYUVzZbLMu+GLoEMLwuuu6pUvD3AxSWVqb1p49
 +4EwO6P28+qutoFs/LhClyT+wS9PvuVFj0op81cAeAkXOmsHJPE7q9bYmr6Ro0ZoAztJ
 vq8dQ8tZm5WkwmC/k3YR3Nl41owYelbf/BzXx/xeScNK/NjgdbQ3XAQBrvxCmPWdylex
 Sa0Ry8p+M1ZSjw+dhL3lFAr8Q/qcg3ppo+SV5WL4Rhz2ltGr/6MdgQkRenT7Nncrh4ra
 gO8w==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] cpu: Fix typos
Date: Sat, 10 Nov 2018 20:49:21 +0800
Message-Id: <1541854161-4556-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>


Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
Hi Paul,

This is the only patch for Chapter CPU. Please take a look.


Thanks,
--Junchang

--
 cpu/overheads.tex | 4 ++--
 cpu/overview.tex  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 2474cfe..17b120b 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -155,7 +155,7 @@ displayed in
 Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}.
 This system's clock period rounds to 0.6\,ns.
 Although it is not unusual for modern microprocessors to be able to
-retire multiple instructions per clock period, the operations's costs are
+retire multiple instructions per clock period, the operations' costs are
 nevertheless normalized to a clock period in the third column, labeled
 ``Ratio''.
 The first thing to note about this table is the large values of many of
@@ -360,7 +360,7 @@ It is clear that the combination of speculative execution and cloud
 computing needs more than a bit of rework!

 A fifth hardware optimization is large caches, allowing individual
-CPUs to operate on larger datasets without incuring expensive cache
+CPUs to operate on larger datasets without incurring expensive cache
 misses.
 Although large caches can degrade energy efficiency and cache-miss
 latency, the ever-growing cache sizes on production microprocessors
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 071cf7c..9e91a7b 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -15,7 +15,7 @@ where the race always goes to the swiftest.
 \ContributedBy{Figure}{fig:cpu:CPU Performance at its Best}{Melissa Broussard}
 \end{figure}

-Although there are a few CPU-bound benchmarks that approach the ideal
+Although there are a few CPU-bound benchmarks that approach the ideal case
 shown in Figure~\ref{fig:cpu:CPU Performance at its Best},
 the typical program more closely resembles an obstacle course than
 a race track.
-- 
2.7.4

