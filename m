Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z0fXE1s0qkOO16VK+fAS5DQ0DBgKyhLZy58ifBMeC/4=;
        b=X8qhp1lWfatfm2BJlW6RyAKcXwigtgb6TOtfamYAy7QlyjXlVJlaP9Ox4D4QAGnr8f
         cH1Xj/4+pgER2C1PplQ+FuchlIJY8yCEr5UObgjwYXFRvs9HUko9AutHvJ4rJ5oMs2WF
         HDy/qx6oDtp3rgrcgPRuVr0FFjbiXF+uBZEb6qVAe4sK8QzCjmLt6a4IEg6wWNllrETm
         y8aEdS7XWMQ8zLGKtDgturNWcnBzC/Dt1vMm6YVmvBYxNAqcJxMFCnMNlBDc9soPXRmy
         EqcGEOhWdDrMNKRVlb0z8cQEQQiLRyyfIp9Qr2c81V5xOy+M5sO44+SyuEiJN/Fcv2cj
         IAzA==
Subject: [PATCH 2/7] toyrcu: Extract Listing B.15 from rcu_nest.h
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e6cd44c9-6561-3a71-159c-dc2ffe7d312c@gmail.com>
Date: Sun, 21 Jul 2019 09:03:27 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d89573cab1299a8b8dfc731caa24057249c88296 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Jun 2019 23:55:49 +0900
Subject: [PATCH 2/7] toyrcu: Extract Listing B.15 from rcu_nest.h

Commit b9696a4a456f ("rcu_nest: Update description of rcu_nest.[hc]")
updated B.16 to reflect the changes in rcu_nest.[hc]. For consistency,
extract Listing B.15 from rcu_nest.h.

Cc: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu_nest.h |  2 ++
 appendix/toyrcu/toyrcu.tex   | 13 +------------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/CodeSamples/defer/rcu_nest.h b/CodeSamples/defer/rcu_nest.h
index 19a09568..3c5a5207 100644
--- a/CodeSamples/defer/rcu_nest.h
+++ b/CodeSamples/defer/rcu_nest.h
@@ -24,6 +24,7 @@
 #define ULONG_CMP_GE(a, b)      (ULONG_MAX / 2 >= (a) - (b))
 #define ULONG_CMP_LT(a, b)      (ULONG_MAX / 2 < (a) - (b))
 
+//\begin{snippet}[labelbase=ln:defer:rcu_nest:define,commandchars=\%\@\$]
 DEFINE_SPINLOCK(rcu_gp_lock);
 #define RCU_GP_CTR_SHIFT 7
 #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
@@ -31,6 +32,7 @@ DEFINE_SPINLOCK(rcu_gp_lock);
 #define MAX_GP_ADV_DISTANCE (RCU_GP_CTR_NEST_MASK << 8)
 unsigned long rcu_gp_ctr = 0;	/* increment by RCU_GP_CTR_BOTTOM_BIT each gp. */
 DEFINE_PER_THREAD(unsigned long, rcu_reader_gp);
+//\end{snippet}
 
 static inline int rcu_gp_ongoing(int cpu)
 {
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index d876595b..81f222c6 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1360,18 +1360,7 @@ variables.
 \label{sec:app:toyrcu:Nestable RCU Based on Free-Running Counter}
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 DEFINE_SPINLOCK(rcu_gp_lock);
-  2 #define RCU_GP_CTR_SHIFT 7
-  3 #define RCU_GP_CTR_BOTTOM_BIT (1 << RCU_GP_CTR_SHIFT)
-  4 #define RCU_GP_CTR_NEST_MASK (RCU_GP_CTR_BOTTOM_BIT - 1)
-  5 long rcu_gp_ctr = 0;
-  6 DEFINE_PER_THREAD(long, rcu_reader_gp);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/rcu_nest@define.fcv}
 \caption{Data for Nestable RCU Using a Free-Running Counter}
 \label{lst:app:toyrcu:Data for Nestable RCU Using a Free-Running Counter}
 \end{listing}
-- 
2.17.1


