Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zLsyxSiwygpCdc01SgOL182pqnOO41BYGAiPYY9Hwds=;
 b=iapL4FBOt1usYCNF3Hl+upkEXyFhNy1n9ZRJ8Nn+g7Pu97Oyqv8iCVQbOtLnP2YcG4
 E4jFTDyG6NzHuNDO12tOeKHDUdo+NThnNLjaSA+nYu6/EWeayrlYH6UfAmgJ4QwUL3EP
 d4UQ9xbMDy0mDWH0mezxLH4QEcw5l+WMrNgeOYDr0PVDVH1Tm5qwt1wPV+OqDF1OcXPx
 wXuHgoHdbD7W9Fzk+BDM7u8p4u/PrpR1WnMVTTF7jQpIZRixFK0Il7JY4nXnddKxQDwd
 RFL6g5/ijO1j+P698LG/hDMqqgegyJCz0/JttF3fGdjyYC4GVLUXlnLo6qZYh86I8UnW
 4m+Q==
Subject: [PATCH 1/4] runlatex.sh: Refactor by defining functions
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f6c14b4-3655-ff0b-3a63-963977d90f32@gmail.com>
Date: Mon, 13 Mar 2017 00:38:23 +0900
MIME-Version: 1.0
In-Reply-To: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 74dd23d3ef2ea8f62339e33fb118845bfccb5cb6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Mar 2017 20:26:51 +0900
Subject: [PATCH 1/4] runlatex.sh: Refactor by defining functions

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 80 ++++++++++++++++++++++-----------------------------
 1 file changed, 34 insertions(+), 46 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index a577a0c..0fa6633 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -23,11 +23,37 @@
 # http://www.gnu.org/licenses/gpl-2.0.html.
 #
 # Copyright (C) IBM Corporation, 2012
-# Copyright (C) Akira Yokosawa, 2016
+# Copyright (C) Akira Yokosawa, 2016, 2017
 #
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
 #          Akira Yokosawa <akiyks@gmail.com>

+diff_warning () {
+	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+	then
+		echo "No more improvement is expected, giving up."
+		return 0 ;
+	else
+#		echo "Some improvements are observed, continuing."
+		return 1 ;
+	fi
+}
+
+iterate_latex () {
+	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
+	if grep -q '! Emergency stop.' $basename.log
+	then
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
+	if test -r $basename-warning.log
+	then
+		mv -f $basename-warning.log $basename-warning-prev.log
+	fi
+	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+	return 0 ;
+}
+
 if test -z "$1"
 then
 	echo No latex file specified, aborting.
@@ -43,75 +69,37 @@ then
 		exit 1
 	fi
 	echo "pdflatex 1 for $basename.pdf"
-	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
-	if grep -q '! Emergency stop.' $basename.log
-	then
-		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 1
-	fi
-	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+	iterate_latex
 fi
 rm -f $basename-first.log
 iter=2
 echo "pdflatex 2 for $basename.pdf # for possible bib update"
-pdflatex $basename > /dev/null 2>&1 < /dev/null || :
-if grep -q '! Emergency stop.' $basename.log
-then
-    echo "----- Fatal latex error, see $basename.log for details. -----"
-    exit 1
-fi
-grep 'LaTex Warning:' $basename.log > $basename-warning.log
+iterate_latex
 while grep -q 'LaTeX Warning: There were undefined references' $basename.log
 do
 	if test -r $basename-warning-prev.log
 	then
-		if test "$iter" -gt 2 && diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+		if test "$iter" -gt 2 && diff_warning
 		then
-			echo "No more improvement is expected, giving up."
 			break
-#		else
-#			echo "Some improvements are observed, continuing."
 		fi
 	fi
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
-	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
-	if grep -q '! Emergency stop.' $basename.log
-	then
-		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 1
-	fi
-	if test -r $basename-warning.log
-	then
-		mv -f $basename-warning.log $basename-warning-prev.log
-	fi
-	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+	iterate_latex
 done
 while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
 do
-	if test -r $basename-warning-prev.log;
+	if test -r $basename-warning-prev.log
 	then
-		if test "$iter" -gt 3 && diff -q $basename-warning.log $basename-warning-prev.log >/dev/null
+		if test "$iter" -gt 3 && diff_warning
 		then
-			echo "No more improvement is expected, giving up."
 			break
-#		else
-#			echo "Some improvements are observed, continuing."
 		fi
 	fi
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter for $basename.pdf # label(s) may have been changed"
-	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
-	if grep -q '! Emergency stop.' $basename.log
-	then
-		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 1
-	fi
-	if test -r $basename-warning.log
-	then
-		mv -f $basename-warning.log $basename-warning-prev.log
-	fi
-	grep 'LaTex Warning:' $basename.log > $basename-warning.log
+	iterate_latex
 done
 if grep "LaTeX Warning:" $basename.log
 then
-- 
2.7.4


