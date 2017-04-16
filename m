Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=INRc7Hz19025CFmSTWuQ2xY+GgROwLKQwrxakFvpWRE=;
 b=TnTt9MsL2/ReccIVaEHzy9metyhhvV4NKz8MBjfY2hX4EfDQZoLyTKot1psdZadhEs
 QzQUg8a5dxPEeC10Q71JxuhfLiCE2TFEsG+pEkLU2LOt2+yCCxBtDL/RBscGC0ArcCZY
 HeJ4pcSDiqBfq/0hqGyJvu9yt82lV08z7hzXgRyOvsjlgt9E56IleMJiXwOuOzo2nU1k
 aW0MSxjFO2/d3B1qGWt38ykfWNgH4ETBJ+n/jS7T6Taqo4aBK1NKIwSKEuspI2mzQ4uF
 iweGnKLC1h/KjM6n7ZaiDbyEHGq9WVPR/X6g/rEfq9+9nnENS/TGzATQ9aBWPr1hvMxl
 qgbA==
Subject: [PATCH 08/14] advsync: Add footnote to imply necessity of data
 dependency barrier
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <40285d36-4acd-2054-26ad-b7a94654c718@gmail.com>
Date: Mon, 17 Apr 2017 07:20:48 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 827f6c65b5fbae89edab6b86b70d39a7582d708d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 08:15:26 +0900
Subject: [PATCH 08/14] advsync: Add footnote to imply necessity of data dependency barrier

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 8173684..7b50511 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1244,7 +1244,15 @@ following results are possible:
 \vspace{5pt}

 Note that CPU~2 will never try and load~C into~D because the CPU will load~P
-into~Q before issuing the load of~*Q.
+into~Q before issuing the load of~*Q.\footnote{Although it might sound
+	counterintuitive, one of the results,
+	{\tt\scriptsize (Q~==~\&B) and (D~==~2)},
+	does not necessarily mean that CPU~1's
+	{\tt\scriptsize STORE B~=~4} was issued
+	{\em after} {\tt\scriptsize STORE P~=~\&B}.
+	To reach a consensus in ordering, we need a pair of memory barriers
+	as is described in
+	Section~\ref{sec:advsync:Data Dependency Barriers}.}

 \subsection{Device Operations}
 \label{sec:advsync:Device Operations}
-- 
2.7.4


