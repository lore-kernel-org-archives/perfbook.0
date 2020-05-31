Return-Path: <SRS0=wHCD=7N=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YH0HbZOCu5KCdwaYDxN83pJ75IX2egCnMnyVMfChX3A=;
        b=DgwxckEoje61lcYf0UogVdQaaEdTxAOkzpZvz5/bOBVMwb4DyxPyEyXrW+ozvhPM3W
         CFnS1rjsxmA54IOaA6LBzOPKNnEY2B/7QPTB7UfJ3P9DOJJ2ngyWBni+B7Bi9/ZHgGSO
         B6L+gz6TNmd5GO3LxRROlaNzn8d09RFLBvoT5RJOkN6ahVDIOsAWxfRn19qxkTRdEzO/
         t1z+276K/ZaXC0R1AToDt7yaQe5znvshFJCHAY6tYzWT/a8Rqa6YjZkGW4cCqJooTr63
         RgzqZ2KMxdvVHpVkKvefguQAtK17XuLgXPIuGpaKN9lx+jqeIiE4WzCWdGWWkI+9J9MF
         7/bw==
Subject: [PATCH 3/3] runlatex.sh: Give up early on undefined refs
References: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1a1cc3cf-a557-bb04-1569-e68ee95f9951@gmail.com>
Date: Sun, 31 May 2020 09:35:35 +0900
MIME-Version: 1.0
In-Reply-To: <64483a19-eee6-f406-7456-01feb232d019@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 073429a7f9e68b4b7f51c9b766bf8aa24da83081 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 31 May 2020 08:18:34 +0900
Subject: [PATCH 3/3] runlatex.sh: Give up early on undefined refs

Successive "undefined refs"s mean true missing/misspelled labels/refs.

Add code to detect second "undefined refs" and to give up early.

Also add code to skip an unnecessary pdflatex run when .aux and
.bbl files are up-to-date.
This can happen when you run "make" after removing perfbook.pdf,
e.g., with a different LATEX_OPT setting.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 2aef9e2c..9687be95 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -51,6 +51,18 @@ identical_warnings () {
 	return 1 ;
 }
 
+exerpt_warnings () {
+	if grep -q "LaTeX Warning:" $basename.log
+	then
+		echo "----- Excerpt around remaining warning messages -----"
+		grep -B 8 -A 5 "LaTeX Warning:" $basename.log | tee $basename-warning.log
+		echo "----- You can see $basename-warning.log for the warnings above. -----"
+		echo "----- If you need to, see $basename.log for details. -----"
+		rm -f $basename-warning-prev.log
+		exit 1
+	fi
+}
+
 iterate_latex () {
 	pdflatex $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
@@ -83,26 +95,30 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 
 if ! test -r $basename-first.log
 then
-	if ! sh utilities/mpostcheck.sh
-	then
-		exit 1
-	fi
+	echo "No need to update aux and bbl files."
 	echo "pdflatex 1 for $basename.pdf"
-	iterate_latex
+	iter=1
+else
+	rm -f $basename-first.log
+	echo "pdflatex 2 for $basename.pdf # for possible bib update"
+	iter=2
 fi
-rm -f $basename-first.log
-iter=2
-echo "pdflatex 2 for $basename.pdf # for possible bib update"
 iterate_latex
 min_iter=2
 while grep -q 'LaTeX Warning: There were undefined references' $basename.log
 do
+	if test $undefined_refs
+	then
+		echo "Undefined refs remain, giving up."
+		exerpt_warnings
+	fi
 	if identical_warnings
 	then
 		break
 	fi
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
+	undefined_refs=1
 	iterate_latex
 done
 min_iter=3
@@ -116,15 +132,7 @@ do
 	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
 	iterate_latex
 done
-if grep -q "LaTeX Warning:" $basename.log
-then
-	echo "----- Excerpt around remaining warning messages -----"
-	grep -B 8 -A 5 "LaTeX Warning:" $basename.log | tee $basename-warning.log
-	echo "----- You can see $basename-warning.log for the warnings above. -----"
-	echo "----- If you need to, see $basename.log for details. -----"
-	rm -f $basename-warning-prev.log
-	exit 1
-fi
+exerpt_warnings
 rm -f $basename-warning.log $basename-warning-prev.log
 echo "'$basename.pdf' is ready."
 # cleveref version check (Ubuntu 18.04 LTS has buggy one
-- 
2.17.1


