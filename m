Return-Path: <SRS0=XIzw=CZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688731954; x=1691323954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yYda7W+yaCuQsgI11MvhtYeQkORcTPBeYbf+BHBaNS4=;
        b=hXzw4qcetPjwjuP1UY4HRKl/doPWU9ETALYlCVgFytXpTSPxuoVdDqArvwfSh6LjEK
         9d0ydvZ0Jo4ovyZyBQziIj1Zi4fiAeY8pDRpn2aqa2A0DJXeW6dphFB9rVVzMPdkqzTm
         dRTUCF/mX9RJK4yDZrqwk8nHi9qzxIpXPHGXzllDbpODLxtuG/ZrkXwSI1y4G6xdl+K2
         mb04djRbk45xsOPZWlVPQ4xXNYsV6lqhMvoY0kmEi40luMwhOn926W/BRkKE3FfHHoQi
         gLmw0oBhL5edCL0MTvoF+yAKv2eJV+w5Uo93XRPASZJCwj40yhQ38jxmK7dZI1T1v1Zk
         sqSg==
Message-ID: <c0624dc5-398e-8bd3-2378-977751648452@gmail.com>
Date: Fri, 7 Jul 2023 21:12:30 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 5/7] run{first}latex.sh: Reorder checks of fatal
 error/warning messages
Content-Language: en-US
References: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <fcac2844-3c91-c6d1-d921-5402eead1cfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Testing $exitcode and "!pdfTeX error:" or "Emergency stop" early
may ignore an earlier warning that tells the reason of such an
error.

Reorder the checks and make the relevant part of the log file be
printed.

$exitcode should be tested as late as possible.

This improves output when a necessary .sty file is missing:

before:

    or enter new name. (Default extension: sty)

    Enter file name:
    ! Emergency stop.
    <read *>

    l.332 \renewcommand
                       {\sfdefault}{qhv}
    End of file on the terminal!

    Here is how much of TeX's memory you used:
    [...]

after:

    LaTeX Info: Redefining \Bbbk on input line 2810.
    LaTeX Info: Redefining \not on input line 2959.
    )

    ! LaTeX Error: File `biolinum.sty' not found.

    Type X to quit or <RETURN> to proceed,
    or enter new name. (Default extension: sty)

    Enter file name:
    ! Emergency stop.
    [...]

Subsequent runs of latex can also abort due to, e.g., a typo in .bib.
Keep tests of "Emergency stop." and $exitcode in runlatex.sh to
catch such errors.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 34 +++++++++++++++++++++-------------
 utilities/runlatex.sh      | 18 ++++++------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index f12f14886747..a89e8a70ab69 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -22,7 +22,7 @@
 #
 # Copyright (C) IBM Corporation, 2012-2019
 # Copyright (C) Facebook, 2019
-# Copyright (C) Akira Yokosawa, 2016
+# Copyright (C) Akira Yokosawa, 2016, 2023
 #
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
 #          Akira Yokosawa <akiyks@gmail.com>
@@ -72,11 +72,6 @@ basename=`echo $1 | sed -e 's/\.tex$//'`
 echo "$LATEX 1 for $basename.pdf"
 $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 exitcode=$?
-if [ $exitcode -ne 0 ]; then
-	tail -n 20 $basename.log
-	echo "\n!!! $LATEX aborted !!!"
-	exit $exitcode
-fi
 if grep -q 'LaTeX Warning: You have requested' $basename.log
 then
 	grep -A 4 'LaTeX Warning: You have requested' $basename.log
@@ -84,21 +79,34 @@ then
 	echo "### See items 9 and 10 in FAQ-BUILD.txt for how to update.          ###"
 	exit 1
 fi
-if [ $DETECTED_BUGGY -eq 1 ]; then
-	exit 1
+if grep -q 'LaTeX Error:' $basename.log
+then
+	echo "----- !!! Fatal latex error !!! -----"
+	grep -B 5 -A 8 'LaTeX Error:' $basename.log
+	echo "----- See $basename.log for the full log. -----"
+	exit 2
 fi
-if grep -q '! Emergency stop.' $basename.log
+if grep -q 'pdfTeX error:' $basename.log
 then
-	grep -B 15 -A 5 '! Emergency stop.' $basename.log
-	echo "----- Fatal latex error, see $basename.log for details. -----"
+	echo "----- !!! Fatal pdfTeX error !!! -----"
+	grep -B 10 -A 8 '!pdfTeX error:' $basename.log
+	echo "----- See $basename.log for the full log. -----"
 	exit 2
 fi
-if grep -q '!pdfTeX error:' $basename.log
+if grep -q '! Emergency stop.' $basename.log
 then
-	grep -A 2 '!pdfTeX error:' $basename.log
+	grep -B 10 -A 5 '! Emergency stop.' $basename.log
 	echo "----- Fatal latex error, see $basename.log for details. -----"
 	exit 2
 fi
+if [ $exitcode -ne 0 ]; then
+	tail -n 20 $basename.log
+	echo "\n!!! $LATEX aborted !!!"
+	exit $exitcode
+fi
+if [ $DETECTED_BUGGY -eq 1 ]; then
+	exit 1
+fi
 grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 touch $basename-first.log
 exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index e23bc87ba978..b146da20559f 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -24,7 +24,7 @@
 #
 # Copyright (C) IBM Corporation, 2012-2019
 # Copyright (C) Facebook, 2019
-# Copyright (C) Akira Yokosawa, 2016, 2017
+# Copyright (C) Akira Yokosawa, 2016, 2017, 2023
 #
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
 #          Akira Yokosawa <akiyks@gmail.com>
@@ -78,22 +78,16 @@ iterate_latex () {
 	makeglossaries $basename > /dev/null 2>&1
 	$LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
 	exitcode=$?
-	if [ $exitcode -ne 0 ]; then
-		tail -n 20 $basename.log
-		echo "\n!!! $LATEX aborted !!!"
-		exit $exitcode
-	fi
 	if grep -q '! Emergency stop.' $basename.log
 	then
-		grep -B 15 -A 5 '! Emergency stop.' $basename.log
+		grep -B 10 -A 5 '! Emergency stop.' $basename.log
 		echo "----- Fatal latex error, see $basename.log for details. -----"
 		exit 2
 	fi
-	if grep -q '!pdfTeX error:' $basename.log
-	then
-		grep -A 2 '!pdfTeX error:' $basename.log
-		echo "----- Fatal latex error, see $basename.log for details. -----"
-		exit 2
+	if [ $exitcode -ne 0 ]; then
+		tail -n 20 $basename.log
+		echo "\n!!! $LATEX aborted !!!"
+		exit $exitcode
 	fi
 	if test -r $basename-warning.log
 	then
-- 
2.25.1


