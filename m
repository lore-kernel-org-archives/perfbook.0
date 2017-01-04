Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=gLZBNNx0XqRF9Uklu7g1HeiP3qVcCGBMEkGzk28OEvk=;
 b=W8kHjTuR9+X2WJTlNQEbzeFmDY0igaJmc9VXgAZbDLXhU/KifcIvSog5LoOtDUXVqq
 ftDwQEPv7KXn9nZORp0ts2J3j61JAAfF0l+dEztvy+RUyyjE35XFJAaJxfh8/vtQyRh+
 c22zuPU7pcVRvBfHIa0Db4LcrwnQ0N755RIfxXMrDH/4sfy/ZtTGL7h44TBGk8n/8rCH
 vdmr3NxPcUCOJXdY5vCOR9SrykAbyiSKzyUF/RNKsunVvWijg79MzJdcmIdVh3Vx/9Za
 jOzLN33rbkUy6fFPKxCb6BSgLdhflPliwm+BconmMUn0eY1znvVlzLO2R65aODhMESnO
 4GVw==
Subject: [PATCH 04/13] rcuapi: Rewrite table 'RCU Publish-Subscribe and
 Version Maintenance APIs'
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0e84d26f-6ea9-af72-8f56-1fdf0083b0d3@gmail.com>
Date: Wed, 4 Jan 2017 10:21:49 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5c513c2e5b0b9978093475d91cc55c634002aa84 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 15:56:01 +0900
Subject: [PATCH 04/13] rcuapi: Rewrite table 'RCU Publish-Subscribe and Version Maintenance APIs'

By using \tco{} command, this table can be easily expressed in
normal tabular environment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 43 ++++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 8a678f6..f2aa3ff 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -456,8 +456,8 @@ that Linux supports~\cite{Spraul01}.

 \begin{table*}[tb]
 \footnotesize
-\centering\tymin=1.0in\tymax=1.6in
-\begin{tabulary}{5in}{l|L|l|L}
+\centering
+\begin{tabular}{l|l|l|p{1.2in}}
 Category &
 	Primitives &
 		Availability &
@@ -465,69 +465,66 @@ Category &
 \hline
 \hline
 List traversal &
-	\co{list_for_each_entry_rcu()} &
+	\tco{list_for_each_entry_rcu()} &
 		2.5.59 &
-			{ \raggedright
-			  Simple instructions (memory barrier on Alpha) } \\
+			Simple instructions (memory barrier on Alpha) \\
 \hline
 List update &
-	\co{list_add_rcu()} &
+	\tco{list_add_rcu()} &
 		2.5.44 &
 			Memory barrier \\
 &
-	\co{list_add_tail_rcu()} &
+	\tco{list_add_tail_rcu()} &
 		2.5.44 &
 			Memory barrier \\
 &
-	\co{list_del_rcu()} &
+	\tco{list_del_rcu()} &
 		2.5.44 &
 			Simple instructions \\
 &
-	\co{list_replace_rcu()} &
+	\tco{list_replace_rcu()} &
 		2.6.9 &
 			Memory barrier \\
 &
-	\co{list_splice_init_rcu()} &
+	\tco{list_splice_init_rcu()} &
 		2.6.21 &
 			Grace-period latency \\
 \hline
 Hlist traversal &
-	\co{hlist_for_each_entry_rcu()} &
+	\tco{hlist_for_each_entry_rcu()} &
 		2.6.8 &
-			{ \raggedright
-			  Simple instructions (memory barrier on Alpha) } \\
+			Simple instructions (memory barrier on Alpha) \\
 &
-	\co{hlist_add_after_rcu()} &
+	\tco{hlist_add_after_rcu()} &
 		2.6.14 &
 			Memory barrier \\
 &
-	\co{hlist_add_before_rcu()} &
+	\tco{hlist_add_before_rcu()} &
 		2.6.14 &
 			Memory barrier \\
 &
-	\co{hlist_add_head_rcu()} &
+	\tco{hlist_add_head_rcu()} &
 		2.5.64 &
 			Memory barrier \\
 &
-	\co{hlist_del_rcu()} &
+	\tco{hlist_del_rcu()} &
 		2.5.64 &
 			Simple instructions \\
 &
-	\co{hlist_replace_rcu()} &
+	\tco{hlist_replace_rcu()} &
 		2.6.15 &
 			Memory barrier \\
 \hline
 Pointer traversal &
-	\co{rcu_dereference()} &
+	\tco{rcu_dereference()} &
 		2.6.9 &
-			{ \raggedright
-			  Simple instructions (memory barrier on Alpha) } \\
+			Simple instructions (memory barrier on Alpha) \\
 \hline
 Pointer update &
-	\co{rcu_assign_pointer()} &
+	\tco{rcu_assign_pointer()} &
 		2.6.10 &
 			Memory barrier \\
-\end{tabulary}
+\end{tabular}
 \caption{RCU Publish-Subscribe and Version Maintenance APIs}
 \label{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
 \end{table*}
-- 
2.7.4


