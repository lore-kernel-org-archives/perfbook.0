Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=70CO99OdlDIy4pl8xAayM52Q9V4WmHtdfXgP3pIeoAA=;
        b=A0d1JNIl4A0OL6ZoW6dcKAUAH738Lmiq2Xss8HefqQneVOmdhh9iueROOq0Nin9m4g
         sGJ7Qzq4bQG2dyMS1CWlI/vHYVaZ8pd6KF2qdv60A7kDOJIth1Ek5f0RgKO7cnVucRpB
         kHjWLLkzguQ2mcooAljJQpQmKaD8fVkqhlvE2J/dku98Sh76YItlYn350xzHg3ky/0Ut
         sPI//FTTCjT5u76HmuxS2N8vs4ESRtEVorJ8r6LT9elfMW0z0aaa700SvpN/DBHMPSZc
         cngK0WI1x3XqpVhlduGJKYxmx2jU5L6nalPdGNLJxR4Lv2YveQoxutU11sm78/ONshK5
         55Dg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] defer: Update Hlist RCU API tables
Message-ID: <92d5a836-db9d-1333-b2cf-9e2664c7744c@gmail.com>
Date: Sun, 2 Dec 2018 19:36:10 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ce79ac6df2f3d3fcb6d24b1b629ce78f69eea6f8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 2 Dec 2018 19:05:54 +0900
Subject: [PATCH 1/2] defer: Update Hlist RCU API tables

Current Linux kernel API does not have hlist_add_after_rcu()
but has hlist_add_behind_rcu().

It was renamed in the 3.17 development cycle due to swapping of
the arguments.

While we are here, add the missing category of "Hlist update"
and reference the table by the label instead of just saying
"the following table".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex         | 14 +++++++++-----
 defer/rcufundamental.tex |  4 ++--
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 5502092..8dc2cc3 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -439,8 +439,9 @@ their scope.
 \label{sec:defer:RCU has Publish-Subscribe and Version-Maintenance APIs}
 
 Fortunately, the RCU publish-subscribe and version-maintenance
-primitives shown in the following
-table apply to all of the variants of RCU discussed above.
+primitives shown in
+Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
+apply to all of the variants of RCU discussed above.
 This commonality can in some cases allow more code to be shared,
 which certainly reduces the API proliferation that would otherwise
 occur.
@@ -491,9 +492,12 @@ Hlist traversal &
 	\tco{hlist_for_each_entry_rcu()} &
 		2.6.8 &
 			Simple instructions (memory barrier on Alpha) \\
-&
-	\tco{hlist_add_after_rcu()} &
-		2.6.14 &
+\midrule
+Hlist Update &
+	\tco{hlist_add_behind_rcu()} &
+		\parbox[t][0.3in][t]{0.8in}{
+		    2.6.14 \\
+                    (renamed in 3.17)} &
 			Memory barrier \\
 &
 	\tco{hlist_add_before_rcu()} &
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index c4a8905..2660e7d 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -399,8 +399,8 @@ Lists     & \parbox[c][0.37in][c]{1.3in}{
 					& \tco{list_for_each_entry_rcu()} \\
 \midrule
 Hlists    & \parbox[c][0.5in][c]{1.3in}{
-		\co{hlist_add_after_rcu()} \\
-		\co{hlist_add_before_rcu()}  \\
+		\co{hlist_add_behind_rcu()} \\
+		\co{hlist_add_before_rcu()} \\
 		\co{hlist_add_head_rcu()} \\
 		\co{hlist_replace_rcu()} }
 			& \tco{hlist_del_rcu()}
-- 
2.7.4

