Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=umpPQVRahJQU/39/jo0IJs1pwf2KZN3MgJ/RrhNXQ1g=;
 b=XfWjDPqpNwIiuAnH1DuNzCf2Og8k76wZQxHPxatkAUzPATQdSSQiuZEhJujrBg/ZRe
 7M5S2GL5Hi8zPJY26IVDBRD0CRffcf2RKCBxYk1v/V/OVxfg/fAoBYWuYl8VCykv7YJp
 wW1zEXmhr3iDWp0Hp5ezzGI9XmM0aZC42AB4h7TDzZdO7bB38r+dnWOEnpNUxrNai9JZ
 +R6VMMp+CnvjvQsgCkZrjTKa3A3FhF3F5umg7NQq76KoO5UWL6s5fQ8INlirEhIsJcGO
 lFmB5Fo/V9XC8+hgkOBcjEysiK8PSZ5iOPcdIUGzO8xdJ7NbHCpc7lD8ZYH9ZMHHuWt+
 5KNw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/5] memorder: Use zSeries name consistently
Date: Tue, 17 Oct 2017 11:20:54 +0900
Message-Id: <20171017022054.32680-5-sj38.park@gmail.com>
In-Reply-To: <20171017022054.32680-1-sj38.park@gmail.com>
References: <20171017022054.32680-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Table for `Summary of Memory Ordering` is using term `z Systems` while a
subsection about its description calls it `zSeries`.  Because the
subsection is referencing the table, it would be confuse.  This commit
modifies the table to use `zSeries` term consistently.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 28faeec..df4d74c 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3753,11 +3753,11 @@ dependencies.
 		\rotatebox{90}{x86}
 	  \end{picture}
 	& \begin{picture}(6,60)(0,0)
-		\rotatebox{90}{z~Systems}
+		\rotatebox{90}{z~Series}
 	  \end{picture}
 	\\
 	\cmidrule(r){1-2} \cmidrule{3-13}
-%		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Systems
+%		 Alpha ARMv8 ARMv7 Itanium MIPS PA-RISC -CPUs PPC SPARC x86 z Series
 \cellcolor{white}
 	Memory Ordering
 	& Loads Reordered After Loads or Stores?
-- 
2.10.0

