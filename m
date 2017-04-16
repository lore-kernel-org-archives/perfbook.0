Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1R3WfUn5N5LUcLlASYspLu9roLiyDnpCIIatsoi5ls8=;
 b=nP6hZFGp/aBeTIqFEPlfZnLqlu53y92A26JcAaw/QHajPIFI1yvXHGGN6aPZvq7irg
 g66jbb3RMhahDgct1JrLfAef+Q8uzCugOjclT4wdFLvQaLuaRzKg8iKrHI/lhG42vDwi
 3AVM3SOn9WfRuPnJ1UfSwTCWsk1g7J5qaQD0hgS09liOtQMUiOGwJ47zOSXB4+89RtQP
 A/dOIqMGuunrUCBqTsXUWMTKdWvLX86YTlYJfKMzg1z7YOZEDwRPuHpkDLbHLPxQXYu9
 IilDfR6wa2LFbi3CYmclri2gPbEo+3JLKf/MipMr6aZaKSZDHr75cYEhcJZcXuq/e68w
 M7Zw==
Subject: [PATCH 03/14] advsync: Use pseudo asm in sequence in 'Review of
 Locking Impl'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <afbee5b5-6f8a-257a-273c-988bb79f0c88@gmail.com>
Date: Mon, 17 Apr 2017 07:15:47 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 81c2ce55ce99ede156f407c869b18289366917e4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 00:01:10 +0900
Subject: [PATCH 03/14] advsync: Use pseudo asm in sequence in 'Review of Locking Impl'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 173380a..299c436 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1060,16 +1060,16 @@ the sequence of operations might be as follows:
 \begin{minipage}[t]{\columnwidth}
 \tt \scriptsize
 \begin{tabular}{l|l}
-	\nf{CPU 1} &		\nf{CPU 2} \\
+	\nf{CPU 1}		& \nf{CPU 2} \\
 	\hline
-	(critical section) &	\tco{atomic_xchg(&lck->a, 1)->1} \\
-	\tco{smp_mb();}    &	lck->a->1 \\
-	lck->a=0;	   &	lck->a->1 \\
-	&			lck->a->0 \\
-	&			(implicit \tco{smp_mb()} 1) \\
-	&			\tco{atomic_xchg(&lck->a, 1)->0} \\
-	&			(implicit \tco{smp_mb()} 2) \\
-	&			(critical section) \\
+	(critical section)	& \tco{atomic_xchg(&lck->a, 1)} $\rightarrow$1 \\
+	<memory barrier>	& LOAD lck->a $\rightarrow$1 \\
+	STORE lck->a = 0	& LOAD lck->a $\rightarrow$1 \\
+				& LOAD lck->a $\rightarrow$0 \\
+				& (implicit memory barrier \#1) \\
+				& \tco{atomic_xchg(&lck->a, 1)} $\rightarrow$0 \\
+				& (implicit memory barrier \#2) \\
+				& (critical section) \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


