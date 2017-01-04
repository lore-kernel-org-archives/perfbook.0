Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=C5nZh2cXxJgZkTo3libIsyKRO5YEYvmduk9ET5gTu5o=;
 b=rtUYPWyJe43sHThf14J3aqdonOXp2MrLcsuCSMaTTk/iowpgoYVITr35BPJe1LYHRL
 C8SBgPR6iB3lvOwWukOZOKSaud2p2IsLR8U/pPNTC7nm44AC+o+135LGgUi07/yEt4J0
 9NWdvBDKtBJhH5HENHDOLkbj2iGEEHSE3NMCPE/jd8obRDeK+zNyiehyXvc56gzF/DJz
 d0+8CRulAwIPhYscgb4DjMRb/msCW28NTjGbCXxDW/gMfD0S/9G5aqTrru7Q9rutSPAK
 lXHV1NOljMvoCvVBMQ6qqR/a6AsYmsMG38MFwrB9djgPNskC7fWtN5RqWPLnrTqf0Fiu
 7kMw==
Subject: [PATCH 08/13] whymemorybarriers: Remove \co{} in tabular env
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <61c89e6d-c587-e676-c904-56b9cd5ede1b@gmail.com>
Date: Wed, 4 Jan 2017 10:26:51 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7ca309f9799fd412cc4c09adcf98e46ec4aea61a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 2 Jan 2017 08:44:33 +0900
Subject: [PATCH 08/13] whymemorybarriers: Remove \co{} in tabular env

By setting typewriter font as default, this commit removes \co{}
commands. It also proactively uses escapes by "\" for a single
"_" in API.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 52 ++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 2b6fc97..f97160a 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1355,20 +1355,20 @@ Each of ``a'', ``b'', and ``c'' are initially zero.

 \begin{table*}
 \small
-\centering
+\centering{\tt
 \begin{tabular}{l|l|l}
 	\multicolumn{1}{c|}{CPU~0} &
 		\multicolumn{1}{c|}{CPU~1} &
 			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
-	\co{a = 1;}	 &		& \\
-	\co{smp_wmb();} & \co{while (b == 0)}; & \\
-	\co{b = 1;}	 & \co{c = 1;} & \co{z = c;} \\
-			 &		& \co{smp_rmb();} \\
-			 &		& \co{x = a;} \\
-			 &		& \co{assert(z == 0 || x == 1);} \\
-\end{tabular}
+	a = 1;		 &		& \\
+	smp\_wmb(); 	 & while (b == 0); & \\
+	b = 1;		 & c = 1;	& z = c; \\
+			 &		& smp\_rmb(); \\
+			 &		& x = a; \\
+			 &		& assert(z == 0 || x == 1); \\
+\end{tabular}}
 \caption{Memory Barrier Example 1}
 \label{tab:app:whymb:Memory Barrier Example 1}
 \end{table*}
@@ -1415,19 +1415,19 @@ Both ``a'' and ``b'' are initially zero.

 \begin{table*}
 \small
-\centering
+\centering{\tt
 \begin{tabular}{l|l|l}
 	\multicolumn{1}{c|}{CPU~0} &
 		\multicolumn{1}{c|}{CPU~1} &
 			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
-	\co{a = 1;} & \co{while (a == 0)}; & \\
-		     & \co{smp_mb();}	& \co{y = b;} \\
-		     & \co{b = 1;}	& \co{smp_rmb();} \\
-		     &			& \co{x = a;} \\
-		     &			& \co{assert(y == 0 || x == 1);} \\
-\end{tabular}
+	a = 1;	     & while (a == 0); & \\
+		     & smp\_mb();	& y = b; \\
+		     & b = 1;		& smp\_rmb(); \\
+		     &			& x = a; \\
+		     &			& assert(y == 0 || x == 1); \\
+\end{tabular}}
 \caption{Memory Barrier Example 2}
 \label{tab:app:whymb:Memory Barrier Example 2}
 \end{table*}
@@ -1457,23 +1457,23 @@ All variables are initially zero.

 \begin{table*}
 \scriptsize
-\centering
+\centering{\tt
 \begin{tabular}{r|l|l|l}
 	& \multicolumn{1}{c|}{CPU~0} &
 		\multicolumn{1}{c|}{CPU~1} &
 			\multicolumn{1}{c}{CPU~2} \\
 	\hline
 	\hline
- 1 &	\co{a = 1;} &			& \\
- 2 &	\co{smb_wmb();} &		& \\
- 3 &	\co{b = 1;} & \co{while (b == 0)}; & \co{while (b == 0)}; \\
- 4 &		     & \co{smp_mb();}	& \co{smp_mb();} \\
- 5 &		     & \co{c = 1;}	& \co{d = 1;} \\
- 6 &	\co{while (c == 0);} &		& \\
- 7 &	\co{while (d == 0);} &		& \\
- 8 &	\co{smp_mb();} &		& \\
- 9 &	\co{e = 1;} &			& \co{assert(e == 0 || a == 1);} \\
-\end{tabular}
+ 1 &	a = 1; &			& \\
+ 2 &	smb\_wmb();	&		& \\
+ 3 &	b = 1;		& while (b == 0); & while (b == 0); \\
+ 4 &			& smp\_mb();	& smp\_mb(); \\
+ 5 &			& c = 1;	& d = 1; \\
+ 6 &	while (c == 0); &		& \\
+ 7 &	while (d == 0); &		& \\
+ 8 &	smp\_mb();	&		& \\
+ 9 &	e = 1; &			& assert(e == 0 || a == 1); \\
+\end{tabular}}
 \caption{Memory Barrier Example 3}
 \label{tab:app:whymb:Memory Barrier Example 3}
 \end{table*}
-- 
2.7.4


