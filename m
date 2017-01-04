Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ct+Bx/CJQEV4NiEKd8RzTY4kzq6rze57Q0POHc3+vN0=;
 b=UCvrjsdMlBNTxGSuoFcGTKcMKj5bJUeQgOEkO/3pNib6btxQxGeXcQEEZfKseIXzt5
 fBIxrlCEmeMhAs3m03TuQafPp6K1CzrirXYPbm9JDzxYTQ3NeMIocLFQvo9X1gtkc2Ip
 Dl+8+m/Tmz7yMDBZy4gAKCXMxbrEjidIXtVR80u5D0NXWTH6Oavvh3ROPVdLETeHSOZ0
 HKkcmRfDLbVNPSJfI9No9paeqkkQ4jLpYhmMtryCTGEzzG01cejQwmOV9Z4hG+RvEVxW
 Ha99uOjPSu7avHn6fyBYYq4oX+7rlzbQQvRt+PSZcSlCafuyl2k/7ZyfwKDKcbtIszRn
 FWKA==
Subject: [PATCH 12/13] whymemorybarriers: Add \nf{} command to table header
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8b67d49d-e537-b9d4-47f7-0b7d26bb16bf@gmail.com>
Date: Wed, 4 Jan 2017 10:31:51 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bfed77e57f50ca1e4068f46c3b5b3ded1070287e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 13:11:42 +0900
Subject: [PATCH 12/13] whymemorybarriers: Add \nf{} command to table header

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index f97160a..bb8808d 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1357,9 +1357,9 @@ Each of ``a'', ``b'', and ``c'' are initially zero.
 \small
 \centering{\tt
 \begin{tabular}{l|l|l}
-	\multicolumn{1}{c|}{CPU~0} &
-		\multicolumn{1}{c|}{CPU~1} &
-			\multicolumn{1}{c}{CPU~2} \\
+	\multicolumn{1}{c|}{\nf{CPU~0}} &
+		\multicolumn{1}{c|}{\nf{CPU~1}} &
+			\multicolumn{1}{c}{\nf{CPU~2}} \\
 	\hline
 	\hline
 	a = 1;		 &		& \\
@@ -1417,9 +1417,9 @@ Both ``a'' and ``b'' are initially zero.
 \small
 \centering{\tt
 \begin{tabular}{l|l|l}
-	\multicolumn{1}{c|}{CPU~0} &
-		\multicolumn{1}{c|}{CPU~1} &
-			\multicolumn{1}{c}{CPU~2} \\
+	\multicolumn{1}{c|}{\nf{CPU~0}} &
+		\multicolumn{1}{c|}{\nf{CPU~1}} &
+			\multicolumn{1}{c}{\nf{CPU~2}} \\
 	\hline
 	\hline
 	a = 1;	     & while (a == 0); & \\
@@ -1459,9 +1459,9 @@ All variables are initially zero.
 \scriptsize
 \centering{\tt
 \begin{tabular}{r|l|l|l}
-	& \multicolumn{1}{c|}{CPU~0} &
-		\multicolumn{1}{c|}{CPU~1} &
-			\multicolumn{1}{c}{CPU~2} \\
+	& \multicolumn{1}{c|}{\nf{CPU~0}} &
+		\multicolumn{1}{c|}{\nf{CPU~1}} &
+			\multicolumn{1}{c}{\nf{CPU~2}} \\
 	\hline
 	\hline
  1 &	a = 1; &			& \\
-- 
2.7.4


