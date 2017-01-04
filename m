Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FnNJuBdibOMW66rnTseAFDkAfWScI9zoBDgmhNJGK4A=;
 b=KTL+tdrskDVpGysKeC8Jq71HzXTgmZrUa1vkk2LWEceyzsBvTPfHXPaMeggOm1E/M8
 h9ne608N6T0264cGOnfLDDQBO+OVYn90QQ+olbuCXII+b4rY6A4qw8y3AvM5yuD/8ZB3
 x2Rrxr0gsUrrAXReo4auNUbP8FjlPqsr4KLbISMgyDPBnENOP5Bp8lZbA3C0q05zxaaT
 bJ4YmROMkGzVycIYWHCeEhNe3OPtExi021k03vqWz6zvr2ml2I+c9wsE03qNCv1ompIZ
 clhmq5uEK9lJsun88PDJVhrd8d08/da1U5bkjPZptTAW0Qez8782D35zy0AW6nBLSQ5V
 Yu6w==
Subject: [PATCH 05/13] whichtochoose: Rewrite table 'Which Deferred Technique
 to Choose?'
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2d758c03-7486-b574-67a5-ce8677c31eaf@gmail.com>
Date: Wed, 4 Jan 2017 10:23:23 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 62c8c8b8060cc50f2c17e626723b801def90b29e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 15:57:59 +0900
Subject: [PATCH 05/13] whichtochoose: Rewrite table 'Which Deferred Technique to Choose?'

By using \tco{} command, this table can be more easily expressed
in "tabulary" environment. This commit also removes bogus "~"s and
reduces font size to footnotesize. It also appends short cut command
of extdash to compound words.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/whichtochoose.tex | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 11f3b0a..cf21341 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -5,10 +5,10 @@
 \label{sec:defer:Which to Choose?}

 \begin{table*}
-\small
-\centering
-\begin{tabular}{p{1.5in}||p{1.5in}|p{0.8in}|p{0.8in}|p{1.0in}}
-	~ ~ ~ ~ ~ ~ ~ ~ ~
+\footnotesize
+\centering\tymin=0.4in\tymax=2in
+\begin{tabulary}{5.3in}{L||L|L|L|L}
+
 		& Reference Counting
 			& Hazard Pointers
 				& Sequence Locks
@@ -34,17 +34,17 @@
 				& None
 					& None \\
 	\hline
-	Reader Per-Critical-Section Overhead
+	Reader Per\-/Critical\-/Section Overhead
 		& N/A
 			& N/A
-				& Two \co{smp_mb()}
+				& Two \tco{smp_mb()}
 					& Ranges from none to two
-					  \co{smp_mb()} \\
+					  \tco{smp_mb()} \\
 	\hline
 	Reader Per-Object Traversal Overhead
-		& Read-modify-write atomic operations, memory-barrier
+		& Read-modify-write atomic operations, memory\-/barrier
 		  instructions, and cache misses
-			& \co{smp_mb()}
+			& \tco{smp_mb()}
 				& None, but unsafe
 					& None (volatile accesses) \\
 	\hline
@@ -83,7 +83,7 @@
 			& 79
 				& 79
 					& 73 \\
-\end{tabular}
+\end{tabulary}
 \caption{Which Deferred Technique to Choose?}
 \label{tab:defer:Which Deferred Technique to Choose?}
 \end{table*}
-- 
2.7.4


