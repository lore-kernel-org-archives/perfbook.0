Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Kg7bxRUsbruVC61+PYk0823PQQE3BGoGalK0wpyjWUk=;
 b=FYwdRDZUbQja6/MKUgzvRm7hh8xMOVwjxI33KgnBVY57aO7mkpPX/Z1ko3iW3N1s3i
 x4pz6kMkvNc5ak4ul1o+w1/YqFUfJfeGIVVxcjOG1vN8XjIu3g0Ms0aVa4XOHzRkuRof
 Nbu/wALbY7RXA42qCZLQ4qStc2hI22+OyFHcaGjSer1Blr0SCs+XauD965d58A2/PmnO
 UcqQVgCGKsN/7cVjWKKht1cVXV2pVVWqPP7rDIeijmGyDw4W3SB9gCGj2hJrM+Zn8vEz
 nOEq+vYaCOX2aswOfjAw0zaQ8o+o3hVQjeACLHwkOXJbsBbbsz9EqNROnwhVRYyXJk6f
 QcBw==
Subject: [PATCH 02/13] rcufundamental: Rewrite table 'RCU Publish and
 Subscribe Primitives'
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <96810300-15a9-0e84-e815-7141365f08be@gmail.com>
Date: Wed, 4 Jan 2017 10:19:23 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5644ba4f62ce26df9c531e72f2a6a630ae80ce5c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 13:13:18 +0900
Subject: [PATCH 02/13] rcufundamental: Rewrite table 'RCU Publish and Subscribe Primitives'

By using \tco{}, this commit removes bogus "~"s.
It also tweaks layout options of parboxes for better looks.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 0c97b8c..11d8d55 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -386,24 +386,24 @@ circular list:
 Category  & Publish	& Retract	& Subscribe \\
 \hline
 \hline
-Pointers  & \co{rcu_assign_pointer()}
-			& \co{rcu_assign_pointer(..., NULL)}~~
-					& \co{rcu_dereference()} \\
+Pointers  & \tco{rcu_assign_pointer()}
+			& \tco{rcu_assign_pointer(..., NULL)}
+					& \tco{rcu_dereference()} \\
 \hline
-Lists     & \parbox{1.5in}{
+Lists     & \parbox[c][0.37in][c]{1.3in}{
 		\co{list_add_rcu()} \\
 		\co{list_add_tail_rcu()} \\
 		\co{list_replace_rcu()} }
-			& \co{list_del_rcu()}
-					& \co{list_for_each_entry_rcu()}~~~ \\
+			& \tco{list_del_rcu()}
+					& \tco{list_for_each_entry_rcu()} \\
 \hline
-Hlists    & \parbox{1.5in}{
+Hlists    & \parbox[c][0.5in][c]{1.3in}{
 		\co{hlist_add_after_rcu()} \\
 		\co{hlist_add_before_rcu()}  \\
 		\co{hlist_add_head_rcu()} \\
 		\co{hlist_replace_rcu()} }
-			& \co{hlist_del_rcu()}
-					& \co{hlist_for_each_entry_rcu()}~~~~~
+			& \tco{hlist_del_rcu()}
+					& \tco{hlist_for_each_entry_rcu()}
 \end{tabular}
 \caption{RCU Publish and Subscribe Primitives}
 \label{tab:defer:RCU Publish and Subscribe Primitives}
-- 
2.7.4


