Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=onCKSGRnroHDpKtHtFq/201ub0L7/yqBPu+FBU+kTyc=;
 b=Di6DOk6+JqyqiGHh59pikkYdU/TPCgFPVniga/da8vgzOeVMSEt6XZ0iExfX4VACYm
 tGK4fOp4EJ2pu/pzK9R//ppo0qM6vpAG5wg8ID7VlBEEe16/y9CPzweKSfKhs73XYo7m
 JpFvgFYMRqHDQz9ZqUH6iYWWrcyR2v5ev1RsZNYxkFIqj2NV+WcDqftEICEOAMscj9GY
 DoJVicr73ln6F9BcHuP0aohWeCW9cufkXQcpFtybSGyi03tOnUlM3DDAIwUSPcVSLaNq
 l0z930wQjSxzMItQLpUTKI3CzltHG3py9WHChy2jNN9N9UtBYy7ZDp6VnkjG/Vr2pToE
 zQHg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Align numbers in Performance of Mechanisms table in qqz
Message-ID: <0b81c12a-e11c-4a3a-142a-207dd813e901@gmail.com>
Date: Sat, 11 Jun 2016 08:09:59 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c40b0d66448dd0065130a5042e2c42cb8b68258f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 10 Jun 2016 20:45:50 +0900
Subject: [PATCH] Align numbers in Performance of Mechanisms table in qqz

This commit does the same tweaks to the table in qqz as commit
b17af1e7c121 ("Align numbers in Performance of Mechanisms table").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overheads.tex | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 7d33c48..311c43e 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -224,9 +224,11 @@ global agreement.
 	\hline
 	CAS cache miss		&          95.9	&         266.4 \\
 	\hline
-	Comms Fabric		&       4,500	&       7,500 \\
+	Comms Fabric		&       4,500\textcolor{white}{.0}
+						&	7,500\textcolor{white}{.0} \\
 	\hline
-	Global Comms		& 195,000,000	& 324,000,000 \\
+	Global Comms		& 195,000,000\textcolor{white}{.0}
+						& 324,000,000\textcolor{white}{.0} \\
 \end{tabular}
 \caption{Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
 \label{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
-- 
1.9.1

