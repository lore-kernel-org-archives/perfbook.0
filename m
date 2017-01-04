Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qd9IepF473qvwC8grJAi9xKa3mDVHhQ0BU4nzEE+zKE=;
 b=gIGiGpL91sbgvxTqmrKPgpsD2Lgy1H28MJA2iB04B9bnVTRxEiaPPHifBPoXxWNpB9
 nFO8+b5ZXbhbOewG8bpzaPISb/+YpFmpXTYYhb0rUzVbtQ8JcLYbUouu3DTT62E5DEO3
 bqaTRzCh6bwms6SGRHwWSBmbGMMgAgrg1u0+oZUNds8B5ilCyj0HS9Vr9qtNHiBR1cgi
 M10iQn4dzSGI6i0SUJK6IA/pwCk6SBcpC1QdLIDtGMqdoJSC1cGg1Rsz8dJzpCdP6f8K
 GVuFpqvHxr2QNlI++y9NDwcieTC54vTb6pAK2+LzG+mVbLzHNGMk9zze6MGIfqSJiaLv
 1hMQ==
Subject: [PATCH 07/13] memorybarriers: Use \verb in table 'Lock-Based Critical
 Sections'
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <667a79cf-5dc9-bc11-d522-1e95fc3544c6@gmail.com>
Date: Wed, 4 Jan 2017 10:25:47 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 63d69c9948baaf52f8dffb76f86f308b05050118 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 17:53:35 +0900
Subject: [PATCH 07/13] memorybarriers: Use \verb in table 'Lock-Based Critical Sections'

In this case, using \verb makes your life simpler.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 100b67d..6291097 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2685,23 +2685,23 @@ operations concurrently:
   \# & Ordering: legitimate or not? \\
   \hline
   \hline
-  1 & \co{*A; *B; LOCK; *C; *D; UNLOCK; *E; *F;} \\
+  1 & \verb|*A; *B; LOCK; *C; *D; UNLOCK; *E; *F;| \\
   \hline
-  2 & \tt{*A; \{*B; LOCK;\} *C; *D; UNLOCK; *E; *F;} \\
+  2 & \verb|*A; {*B; LOCK;} *C; *D; UNLOCK; *E; *F;| \\
   \hline
-  3 & \tt{\{*F; *A;\} *B; LOCK; *C; *D; UNLOCK; *E;} \\
+  3 & \verb|{*F; *A;} *B; LOCK; *C; *D; UNLOCK; *E;| \\
   \hline
-  4 & \tt{*A; *B; \{LOCK; *C;\} *D; \{UNLOCK; *E;\} *F;} \\
+  4 & \verb|*A; *B; {LOCK; *C;} *D; {UNLOCK; *E;} *F;| \\
   \hline
-  5 & \co{*B; LOCK; *C; *D; *A; UNLOCK; *E; *F;} \\
+  5 & \verb|*B; LOCK; *C; *D; *A; UNLOCK; *E; *F;| \\
   \hline
-  6 & \co{*A; *B; *C; LOCK; *D; UNLOCK; *E; *F;} \\
+  6 & \verb|*A; *B; *C; LOCK; *D; UNLOCK; *E; *F;| \\
   \hline
-  7 & \co{*A; *B; LOCK; *C; UNLOCK; *D; *E; *F;} \\
+  7 & \verb|*A; *B; LOCK; *C; UNLOCK; *D; *E; *F;| \\
   \hline
-  8 & \tt{\{*B; *A; LOCK;\} \{*D; *C;\} \{UNLOCK; *F; *E;\}} \\
+  8 & \verb|{*B; *A; LOCK;} {*D; *C;} {UNLOCK; *F; *E;}| \\
   \hline
-  9 & \tt{*B; LOCK; *C; *D; UNLOCK; \{*F; *A;\} *E; } \\
+  9 & \verb|*B; LOCK; *C; *D; UNLOCK; {*F; *A;} *E;| \\
 \end{tabular}
 \caption{Lock-Based Critical Sections}
 \label{tab:advsync:Lock-Based Critical Sections}
-- 
2.7.4


