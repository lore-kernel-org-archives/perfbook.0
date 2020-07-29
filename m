Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w+GUfsDhGp4LiTG57C38+Tp5kF2bIG+wwr/jStokYRo=;
        b=R1klZ+rnkxQ0y2yiBJ8cd5swYdEK+/ekQTEJzsVnHaoHaCltxqgA9jrsCaQOx+1hgx
         876lHTjcRfiBMNB02sVdVA68hQpgyFFz7QCAvxJxzsF2cBkbPiWMWCc5Fns/BpztI8DW
         97poMSdl6xSmTZxw/nVHt+A6a+FR7rg8qDe3ud94vC2bPWVr5woyowq9jDs4U4Qoi5PG
         r6q8qwh136qknTxWplDOKhadxO26KYLcqh5DynTWDgTUS6J3rwaTALjRHLu/kvEpj369
         naP2HM6zFsQxRjS/Uea52gzCd5OeuXxuT2qIrJzwTgJyAMu8a+sFyEIi3MZzoe8hJaLD
         GHtg==
Subject: [PATCH 5/5] formal: Retouch Table E.4
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <497efc26-6ac8-82bb-9f22-c749a685c8c8@gmail.com>
Date: Thu, 30 Jul 2020 00:20:18 +0900
MIME-Version: 1.0
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1316c9e3a238686385e8483bc0047d07c5e24d34 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 28 Jul 2020 16:10:22 +0900
Subject: [PATCH 5/5] formal: Retouch Table E.4

Use structured headers instead of tall rotated headers.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 494ea967..46a27708 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -205,23 +205,29 @@ And in this case, the \co{herd} tool's output features the string
 	executions that fail to acquire the lock.
 
 \begin{table}[tb]
-\rowcolors{2}{}{lightgray}
+\rowcolors{10}{}{lightgray}
 \small
 \centering
-\newcommand{\lockfml}[1]{\multicolumn{1}{c}{\begin{picture}(6,150)(0,0)\rotatebox{90}{#1}\end{picture}}}
+\newcommand{\lockfml}[1]{\multicolumn{1}{c}{\begin{picture}(6,8)(0,0)\rotatebox{90}{#1}\end{picture}}}
 \begin{tabular}{rrrrrr}
-	\lockfml{\# Processes}
-	& \lockfml{Model}
-	& \lockfml{Emulate: \tco{cmpxchg_acquire()}, \tco{filter}}
-	& \lockfml{Emulate: \tco{xchg_acquire()}, \tco{filter}}
-	& \lockfml{Emulate: \tco{cmpxchg_acquire()}, \tco{exists}}
-	& \lockfml{Emulate: \tco{xchg_acquire()}, \tco{exists}}
+	\toprule
+	& Model & \multicolumn{4}{c}{Emulate} \\
+	\cmidrule(l){2-2} \cmidrule(l){3-6}
+	& & \multicolumn{2}{c}{\tco{filter}} & \multicolumn{2}{c}{\tco{exists}} \\
+	\cmidrule(l){3-4} \cmidrule(l){5-6}
+	\lockfml{\# Proc.}
+	& 
+	& \tco{cmpxchg}
+	& \tco{xchg}
+	& \tco{cmpxchg}
+	& \tco{xchg}
 	\\
-	\midrule
+	\cmidrule{1-1} \cmidrule(l){2-2} \cmidrule(l){3-4} \cmidrule(l){5-6}
 	2 & 0.004 &  0.022 &  0.027 &   0.039 &   0.058 \\
 	3 & 0.041 &  0.743 &  0.968 &   1.653 &   3.203 \\
-	4 & 0.374 & 59.565 & 74.818 & 151.962 & 500.96  \\
+	4 & 0.374 & 59.565 & 74.818 & 151.962 & 500.960 \\
 	5 & 4.905 \\
+	\bottomrule
 \end{tabular}
 \caption{Locking: Modeling vs. Emulation Time (s)}
 \label{tab:formal:Locking: Modeling vs. Emulation Time (s)}
-- 
2.17.1


