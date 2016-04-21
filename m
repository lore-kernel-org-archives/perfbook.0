Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=12Cc1mLAGS9JUjx/dXf6t5jYy6DNdnOo3Uudxv716HE=;
 b=PC1GlO3sqEqYGi/UpzbYs6xpaS7ekDDIDxAkLFVYAj3F0oQVdbdtNdTtai+nAw2CPT
 /PtWmXjOaUUxLsbf8VDoldHGLRjCEkFaB13lvlZyX9J1OvA7LqUxF6J7Seuu0JehR1z8
 CeK4g2eBLFZfGuUeSa72N1WvWdMUr3VfQ5HEVFTC2cGy0sWJms/e+dXvBAnUCJLlSlCV
 loLw8r8T3zalNS3Dj6rX1OansScymr51fUQSeR6Fv/YhbRBV0yi0uN27Yuk6SCSeZ4z/
 8FvLar1H0GlsbucEWV5CaatIHjAUa43wbhXifw0rG4KkA6t4BfC4CfMNs6V4PjNc8uzY
 Hvow==
Subject: [PATCH 2/2] runlatex.sh: Fix while loop condition
References: <5718E390.1090309@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5718E478.3000406@gmail.com>
Date: Thu, 21 Apr 2016 23:32:24 +0900
MIME-Version: 1.0
In-Reply-To: <5718E390.1090309@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a5cb77713f4720592f75db71394fcad784ca480e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Thu, 21 Apr 2016 22:11:06 +0900
Subject: [PATCH 2/2] runlatex.sh: Fix while loop condition

After commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
'make' becomes to terminate prematurely with warning messages such as

>   Latex Warning: There were undefined references
>   Latex Warning: There were multiply-defined labels.

This can be dealt with loosening loop condition in runlatex.sh
which is given to 'grep' command.
Also, This commit increases the iteration max count to accommodate
the required number of 'pdflatex' invocations caused by qqz cross-link.

Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 utilities/runlatex.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 8d2d77a..15d96c1 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -47,7 +47,7 @@ then
 		echo "No bibliography directory, skipping bibtex."
 	fi
 fi
-while grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
+while grep -q 'LaTeX Warning:' $basename.log
 do
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter"
@@ -56,7 +56,7 @@ do
 	then
 		echo "----- Fatal latex error, see $basename.log for details. -----"
 	fi
-	if test "$iter" -eq 4
+	if test "$iter" -eq 5
 	then
 		echo "Iteration limit: $iter passes through pdflatex"
 		exit 1
-- 
1.9.1

