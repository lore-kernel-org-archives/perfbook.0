Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GRfpS7X6bokH0UJFiY0bTYIhKZH9WY5zltTb7XWy3ZY=;
 b=NyBN5XOqAUg8ltWecbfLSJGtepUtTIY3JxC0YhBhowH9aMEGxS6C6YOrVPICgqabuv
 JZtTzpCfbzRYWtLdAK3eC9kQJLdO5ZA6ySvZB+l5M+NUjy0Wa861NWTx6816Wv2HMXjr
 77pjC2RH3WnDS+ljOIFLvN8VW24AnPdv34+NZUyIRj5lnQV4QrMJ1S2tbGrguYqN487n
 kdTYc20UHPFDzw6KTVqrJisDOLALduw51cLn9KmcB/YYtQPlB2FlSpKtgq7avKyW2BCf
 +4jdgFghDwspC+f0YOEVAC3DBv0pQMp2HKwIlZn23zCkGWRDeCashLf+x//wkSM4En+O
 MRKw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/4] defer: Fix typos
Date: Sat, 16 Jul 2016 16:58:48 +0900
Message-Id: <1468655930-9894-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 defer/seqlock.tex  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 7796a0d..8812c25 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -186,7 +186,7 @@ ideal synchronization-free workload, as desired.
 	The \co{rcu_dereference()} primitive does constrain the
 	compiler's optimizations somewhat, which can result in
 	slightly slower code.
-	This would effect would normally be insignificant, but
+	This effect would normally be insignificant, but
 	each search is taking on average about 13~nanoseconds,
 	which is short enough for small differences in code
 	generation to make their presence felt.
diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 23e69fb..f379439 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -389,7 +389,7 @@ increment of the sequence number on line~44, then releases the lock.
 So what happens when sequence locking is applied to the Pre-BSD
 routing table?
 Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Lookup}
-shows the data structures and \co{route_lookup()}, adn
+shows the data structures and \co{route_lookup()}, and
 Figure~\ref{fig:defer:Sequence-Locked Pre-BSD Routing Table Add/Delete}
 shows \co{route_add()} and \co{route_del()} (\path{route_seqlock.c}).
 This implementation is once again similar to its counterparts in earlier
-- 
1.9.1

