Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/BJ3VDIT3LilH58dMxsjmrXI6fUtIGYltnRsCnw3I6Q=;
 b=V/jNeHIMCEuDhpUHvxeW1JXBlCkKpTjp9wHk+9ILQOR4NPsLbyCR5ctNkdJo0Wbv/i
 UkcWwniJsw45h4jpbljsjFThvjzaA2r0wfgHHaSBh66LUqoxdUV3MOgt79IAILLsD0La
 UqIl4Z/dSMErbBKiKxSw4dZ9HsWQTz/ID3rtpYBWWVLQh+DDC9HTXzzA5gwfqz6+v1fo
 Z92TUBIxkoGWwjUWJ5On4nVnWTSq3bf7FmIZ2ELs/qK377HwPHj55HxSp40+D+fRU/q/
 r/oJrEZenMQcPD2DUyBkBuGI3X+1VLuzj/CVYejI3Bh0HPnM2zzc1fE86WXUNpm1qHv3
 otMQ==
Subject: [PATCH 04/14] advsync: Backport upstream commits regarding reordering
 example
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6b134896-5b7e-bdba-6a4e-83880435f95a@gmail.com>
Date: Mon, 17 Apr 2017 07:17:25 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1c166a002fcdc1a7f1d417a0d81b7400cd7a80fe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 07:42:52 +0900
Subject: [PATCH 04/14] advsync: Backport upstream commits regarding reordering example

Backport following commits for memory-barriers.txt in upstream

  o 615cc2c9cf95 ("Documentation/memory-barriers.txt: fix important
    typo re memory barriers")
  o 8ab8b3e1837f ("documentation: memory-barriers.txt: Correct
    example for reorderings")

Also reword the leading sentence to clarify 'A' and 'B' are shared,
and reword the closing sentence to clarify 'x' and 'y' are local.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 299c436..fc361ad 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1152,7 +1152,7 @@ interface between the CPU and rest of the system (the dotted lines).


 For example, consider the following sequence of events given the
-initial values {\tt \{A~=~1, B~=~2\}}:
+initial values of shared variables {\tt \{A~=~1, B~=~2\}}:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
@@ -1161,8 +1161,8 @@ initial values {\tt \{A~=~1, B~=~2\}}:
 \begin{tabular}{l|l}
 	\nf{CPU 1} &	\nf{CPU 2} \\
 	\hline
-	A = 3; &	x = A; \\
-	B = 4; &	y = B; \\
+	A = 3; &	x = B; \\
+	B = 4; &	y = A; \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -1176,30 +1176,30 @@ denoted by ``st'':
 \tt
 \scriptsize
 \begin{tabular}{llll}
-	st A=3, & st B=4, & x=ld A$\rightarrow$3, & y=ld B$\rightarrow$4 \\
-	st A=3, & st B=4, & y=ld B$\rightarrow$4, & x=ld A$\rightarrow$3 \\
-	st A=3, & x=ld A$\rightarrow$3, & st B=4, & y=ld B$\rightarrow$4 \\
-	st A=3, & x=ld A$\rightarrow$3, & y=ld B$\rightarrow$2, & st B=4 \\
-	st A=3, & y=ld B$\rightarrow$2, & st B=4, & x=ld A$\rightarrow$3 \\
-	st A=3, & y=ld B$\rightarrow$2, & x=ld A$\rightarrow$3, & st B=4 \\
-	st B=4, & st A=3, & x=ld A$\rightarrow$3, & y=ld B$\rightarrow$4 \\
+	st A=3, & st B=4, & x=ld B$\rightarrow$3, & y=ld A$\rightarrow$4 \\
+	st A=3, & st B=4, & y=ld A$\rightarrow$4, & x=ld B$\rightarrow$3 \\
+	st A=3, & x=ld B$\rightarrow$3, & st B=4, & y=ld A$\rightarrow$4 \\
+	st A=3, & x=ld B$\rightarrow$3, & y=ld A$\rightarrow$2, & st B=4 \\
+	st A=3, & y=ld A$\rightarrow$2, & st B=4, & x=ld B$\rightarrow$3 \\
+	st A=3, & y=ld A$\rightarrow$2, & x=ld B$\rightarrow$3, & st B=4 \\
+	st B=4, & st A=3, & x=ld B$\rightarrow$3, & y=ld A$\rightarrow$4 \\
 	st B=4, & ... & & \\
 	... & & & \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}

-and can thus result in four different combinations of values:
+and can thus result in four different combinations of local values:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt
 \scriptsize
 \begin{tabular}{ll}
-	x == 1, & y == 2 \\
-	x == 1, & y == 4 \\
-	x == 3, & y == 2 \\
-	x == 3, & y == 4 \\
+	x == 2, & y == 1 \\
+	x == 2, & y == 3 \\
+	x == 4, & y == 1 \\
+	x == 4, & y == 3 \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


