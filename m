Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=N94Wzg4ytYYaoRcjazul6Uq18ApaHs+FyN5zjt31+SI=;
 b=MRrG3LsdfAe1Mmxkam6v7pgimXa41CrN7v/Ans/x9me38SSPrhch/5hNwkypHu1BTx
 SwNrcQwl/RHCLMfDvYsO9bP31X8Vo00E7ZhI1vwhSd2l3Y0pJMLpzT8q2MnCicVpSbRT
 eO7Sbm7yt543pLUY8VxOlVl1sA+uywbSVTpIAwtMcCPHNp6crNW6YqDykbsRyvFWli8f
 Id81GuXxaU8m1p3e89VADtrpqKjNgMkX/pGUfY7t1tqYl1d+ChJZbF+/Z4j4kInVd0Ez
 iZC8fH6LAytYIDsvmu86Pre001ldE2eRVOrg+zWtu6eUKOm0MhUHojTUZa7iUywx0Upa
 djAQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in qqz
Message-ID: <9b971ea3-e84c-b4e1-e75b-7c545b24f7e3@gmail.com>
Date: Sat, 11 Jun 2016 15:39:31 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1ff97081c713ff51d5bc2e15f8ba7649427fac4f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 11 Jun 2016 15:28:20 +0900
Subject: [PATCH] cpu: Fix numbers in Performance of Mechanisms table in qqz

Numbers given in 'Comms Fabric' and 'Global Comms' rows in
Table D.1 seem wrong.

Their costs are given in ns unit, so they should match those given
in Table 3.1.

Also, their ratio should be calculated by cost(ns)/0.36(ns).

This commit fixes those numbers.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 311c43e..0cf83f3 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -224,11 +224,11 @@ global agreement.
 	\hline
 	CAS cache miss		&          95.9	&         266.4 \\
 	\hline
-	Comms Fabric		&       4,500\textcolor{white}{.0}
-						&	7,500\textcolor{white}{.0} \\
+	Comms Fabric		&       3,000\textcolor{white}{.0}
+						&	8,330\textcolor{white}{.0} \\
 	\hline
-	Global Comms		& 195,000,000\textcolor{white}{.0}
-						& 324,000,000\textcolor{white}{.0} \\
+	Global Comms		& 130,000,000\textcolor{white}{.0}
+						& 361,000,000\textcolor{white}{.0} \\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
-- 
1.9.1

