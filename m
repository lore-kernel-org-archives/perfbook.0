Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fYH5xg9PQd9z22u+Nzi3AIiVxlwLJY2yqpJ5sGyeN68=;
        b=aL2//WOuNQYuYiD6Krs2t0u06Ic25nD91kBfWCSHfdj/hBRF9JfmV/A1MoaeGLDwrG
         wn5g4RFRNkisnn/hWaqiW3VkPTIjYiMehvfsgAon70GpB7Tr5TVWfbQJrwsCDuk+rX7h
         suKxd7OaSs9SqXgpPmi4RgKBLl1uBFIjCDNf4htpEkaY+otELDBBIKe2e41l+onYDhOX
         QdM93wqBVs88zJqjCjv3lYTjVsXkZZO5GhUzcc9J75xSHOF2+jCVurwBGyGgzzEIksCG
         Y1Mq+UTpElhhdp7Yr2RPSk/2jzbOL1h/Svc+SrD7o6xo/zrO1hPX/AGsV5nvmD6kf7uD
         QVkA==
Message-ID: <ad9badd2-08a9-9c0f-36a1-4e4b4844434a@gmail.com>
Date: Mon, 11 Apr 2022 17:03:48 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 6/7] run(first)latex.sh: Catch error exit of LATEX
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

LATEX command can abort in its early stages of execution due to
(1) mis-configuration of TeX Live, (2) regression in TeX Live updates,
or (3) missing fonts.
Catch exit code of LATEX command and print the tail of .log when
LATEX command aborted.

Also increment the exit code of these script when some error condition
is detected in the .log file.

  exit code 0: success
  exit code 1: remaining warning(s) in .log
  exit code 2: error detected in .log
  other: exit code from LATEX

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 12 +++++++++---
 utilities/runlatex.sh      | 12 +++++++++---
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index f5504f88..b92895f3 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -70,7 +70,13 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 : ${LATEX:-pdflatex}
 
 echo "$LATEX 1 for $basename.pdf"
-$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
+exitcode=$?
+if [ $exitcode -ne 0 ]; then
+	tail -n 20 $basename.log
+	echo "\n!!! $LATEX aborted !!!"
+	exit $exitcode
+fi
 if grep -q 'LaTeX Warning: You have requested' $basename.log
 then
 	grep -A 4 'LaTeX Warning: You have requested' $basename.log
@@ -85,13 +91,13 @@ if grep -q '! Emergency stop.' $basename.log
 then
 	grep -B 15 -A 5 '! Emergency stop.' $basename.log
 	echo "----- Fatal latex error, see $basename.log for details. -----"
-	exit 1
+	exit 2
 fi
 if grep -q '!pdfTeX error:' $basename.log
 then
 	grep -A 2 '!pdfTeX error:' $basename.log
 	echo "----- Fatal latex error, see $basename.log for details. -----"
-	exit 1
+	exit 2
 fi
 grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 touch $basename-first.log
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index db196ad2..b7d553ab 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -76,18 +76,24 @@ iterate_latex () {
 		exit 1
 	fi
 	makeglossaries $basename > /dev/null 2>&1
-	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null || :
+	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
+	exitcode=$?
+	if [ $exitcode -ne 0 ]; then
+		tail -n 20 $basename.log
+		echo "\n!!! $LATEX aborted !!!"
+		exit $exitcode
+	fi
 	if grep -q '! Emergency stop.' $basename.log
 	then
 		grep -B 15 -A 5 '! Emergency stop.' $basename.log
 		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 1
+		exit 2
 	fi
 	if grep -q '!pdfTeX error:' $basename.log
 	then
 		grep -A 2 '!pdfTeX error:' $basename.log
 		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 1
+		exit 2
 	fi
 	if test -r $basename-warning.log
 	then
-- 
2.25.1


