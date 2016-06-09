Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=BUVIhD2p1R9q/ELmcYyMsCRrobfRYCFb7sSmWuG1fuI=;
 b=XyfnKQNLsHxJmxiVenS2rfn/OCQi0huMNC8mAOpCfRz1/F4SkiARdtMPQ/u2LOKluE
 PrU4ThfyE/48MyH3lh38tvuxmN/qjXo9oJ4z5picjBKSLqYRDXqS9vqov/O+5lnyvjGh
 Rzbq31p+sOmE83z7Lsl+PhckhmQoUqMbQMc2b7A5J+i5bJzX/KP/aA1PqTzqXyw+BMGp
 XZveCAGqFyX4E8a1fWm1mkSO3zh50i25bxIN9HTLW1pLd3movHmgs9yYql6rqREhzCmM
 WVwSrjSRvdI0a8YRzPv86Zw1w6zb3vR2mmzcbhhf4Z4tfWoyVZme/X+KxHV8hm/SsG/S
 WzqA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] cpu: Align numbers at decimal points in tables
Message-ID: <5bed2a7b-7390-7aed-b91f-b83fb799bddc@gmail.com>
Date: Fri, 10 Jun 2016 00:19:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5e22d5cb28e5db204c95386ea4427bacc985a7c9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 10 Jun 2016 00:02:59 +0900
Subject: [PATCH] cpu: Align numbers at decimal points in tables

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 56 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 82853a8..2c89830 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -111,24 +111,26 @@ This simplified sequence is just the beginning of a discipline called

 \begin{table}
 \centering
-\begin{tabular}{l||r|r}
-				& 	 	& Ratio \\
-	Operation		& Cost (ns) 	& (cost/clock) \\
+\begin{tabular}{l||r@{.}l|r@{.}l}
+				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
+	Operation		& \multicolumn{2}{r}{Cost (ns)}	& \multicolumn{2}{r}{(cost/clock)} \\
 	\hline
 	\hline
-	Clock period		&           0.6	&           1.0 \\
+	Clock period		&           0 & 6 &         1 & 0 \\
 	\hline
-	Best-case CAS		&          37.9	&          63.2 \\
+	Best-case CAS		&          37 & 9 &        63 & 2 \\
 	\hline
-	Best-case lock		&          65.6	&         109.3 \\
+	Best-case lock		&          65 & 6 &       109 & 3 \\
 	\hline
-	Single cache miss	&         139.5	&         232.5 \\
+	Single cache miss	&         139 & 5 &       232 & 5 \\
 	\hline
-	CAS cache miss		&         306.0	&         510.0 \\
+	CAS cache miss		&         306 & 0 &       510 & 0 \\
 	\hline
-	Comms Fabric		&       3,000	&       5,000 \\
+	Comms Fabric		& \multicolumn{1}{r@{ }}{3,000} & &
+	\multicolumn{1}{r@{ }}{5,000} & \\
 	\hline
-	Global Comms		& 130,000,000	& 216,000,000 \\
+	Global Comms		& \multicolumn{1}{r@{ }}{130,000,000} & &
+	\multicolumn{1}{r@{ }}{216,000,000} & \\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
@@ -193,36 +195,38 @@ global agreement.

 \begin{table}
 \centering
-\begin{tabular}{l||r|r}
-				& 	 	& Ratio \\
-	Operation		& Cost (ns) 	& (cost/clock) \\
+\begin{tabular}{l||r@{.}l|r@{.}l}
+				& \multicolumn{2}{r}{} & \multicolumn{2}{r}{Ratio} \\
+	Operation		& \multicolumn{2}{r}{Cost (ns)} & \multicolumn{2}{r}{(cost/clock)} \\
 	\hline
 	\hline
-	Clock period		&           0.4	&           1.0 \\
+	Clock period		&           0 & 4 &         1 & 0 \\
 	\hline
-	``Best-case'' CAS	&          12.2	&          33.8 \\
+	``Best-case'' CAS	&          12 & 2 &        33 & 8 \\
 	\hline
-	Best-case lock		&          25.6	&          71.2 \\
+	Best-case lock		&          25 & 6 &        71 & 2 \\
 	\hline
-	Single cache miss	&          12.9	&          35.8 \\
+	Single cache miss	&          12 & 9 &        35 & 8 \\
 	\hline
-	CAS cache miss		&           7.0	&          19.4 \\
+	CAS cache miss		&           7 & 0 &        19 & 4 \\
 	\hline
-	Off-Core		&		&		\\
+	Off-Core		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
 	\hline
-	Single cache miss	&          31.2	&          86.6 \\
+	Single cache miss	&          31 & 2 &        86 & 6 \\
 	\hline
-	CAS cache miss		&          31.2	&          86.5 \\
+	CAS cache miss		&          31 & 2 &        86 & 5 \\
 	\hline
-	Off-Socket		&		&		\\
+	Off-Socket		& \multicolumn{1}{r@{ }}{} & & \multicolumn{1}{r@{ }}{} & \\
 	\hline
-	Single cache miss	&          92.4	&         256.7 \\
+	Single cache miss	&          92 & 4 &       256 & 7 \\
 	\hline
-	CAS cache miss		&          95.9	&         266.4 \\
+	CAS cache miss		&          95 & 9 &       266 & 4 \\
 	\hline
-	Comms Fabric		&       4,500	&       7,500 \\
+	Comms Fabric		& \multicolumn{1}{r@{ }}{4,500}	& &
+	\multicolumn{1}{r@{ }}{7,500} & \\
 	\hline
-	Global Comms		& 195,000,000	& 324,000,000 \\
+	Global Comms		& \multicolumn{1}{r@{ }}{195,000,000} & &
+	\multicolumn{1}{r@{ }}{324,000,000} & \\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
-- 
1.9.1

