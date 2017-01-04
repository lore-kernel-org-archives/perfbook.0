Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Dyjtqb3uc7PBwhB4X1eHWLO9pa/8vhxnrpZMeRs9nuQ=;
 b=SG+S9hgU9VeFgAH8Hh4a1OgDuxCx+oigxhN9pNYI7iQ86H7x3lvCKPNpEjgZ4/ZT4D
 8U2Ov03Hao89EqSjneS6y/8mdQ/tn3b7Q3gudzXloJam3zKoxTqGe4+yRzyS2M7+oANQ
 ZvEiPy4rDTOKqYQP5pCcJlA9gcu+Ccl5tAz2gGa4wB30K65mkU2fWndIcTTGHin2ThEJ
 JXMtRVimB2emzFzFYnU78azujHnoliMsIiWcz1CFmbXteKxJ2nINxw1FfW2ddpK89HaI
 A//nDwGML0O8uK3v01ZR6SRh3Vb4Cjl1JojNsQEbdnNjIF5j+k+46fYvdKB2Ru+Ceg2n
 f+Zw==
Subject: [PATCH 13/13] memorybarriers: Add \nf{} command to descriptive words
 in table
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f5bbe7f5-1fb9-d1d7-4de6-7b0dfa0c0de2@gmail.com>
Date: Wed, 4 Jan 2017 10:32:56 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d07bf0df57c597c22de9a7c159f10b0247cea8c2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 14:02:06 +0900
Subject: [PATCH 13/13] memorybarriers: Add \nf{} command to descriptive words in table

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 7f1c3c8..74d4f7b 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2276,8 +2276,8 @@ loads.  Consider the following sequence of events with initial values
 	B = 2; & \\
 	<write barrier> & \\
 	C = \&B; & 	LOAD X\\
-	D = 4;	&	LOAD C (gets \&B) \\
-		&	LOAD *C (reads B) \\
+	D = 4;	&	LOAD C \nf{(gets \tco{&B})} \\
+		&	LOAD *C \nf{(reads \tco{B})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2312,9 +2312,9 @@ values of {\tt \{B = 7, X = 9, Y = 8, C = \&Y\}}:
 	B = 2; & \\
 	<write barrier> & \\
 	C = \&B; & 	LOAD X\\
-	D = 4;	&	LOAD C (gets \&B) \\
+	D = 4;	&	LOAD C \nf{(gets \tco{&B})} \\
 		&	<data dependency barrier> \\
-		&	LOAD *C (reads B) \\
+		&	LOAD *C \nf{(reads \tco{B})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
@@ -2408,9 +2408,9 @@ with the same initial values of
 	<write barrier> & \\
 	B = 2; & \\
 		&	LOAD B \\
-		&	LOAD A (1\textsuperscript{st}) \\
+		&	LOAD A \nf{(1\textsuperscript{st})} \\
 		&	<read barrier> \\
-		&	LOAD A (2\textsuperscript{nd}) \\
+		&	LOAD A \nf{(2\textsuperscript{nd})} \\
 \end{tabular}
 \end{minipage}
 \vspace{5pt}
-- 
2.7.4


