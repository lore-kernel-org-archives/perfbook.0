Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34883 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1755675AbdCLPkg (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 12
 Mar 2017 11:40:36 -0400
Received: by mail-pg0-f65.google.com with SMTP id g2so11039800pge.2 for
 <perfbook@vger.kernel.org>; Sun, 12 Mar 2017 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=KK2cki//MpBsQVI+h2iKM6gJMH6Zp1Wb+ZLaq59OQ4Q=;
 b=P6S1AKmtwjmXbFljvxiqkGN1H6uZ4SYS7N7uo+9bb6UGJpkKJLH5Fhyg2DLUdWtsE7
 abtBCKrWBsWXMNLhyuhgh/VMYnM26QcV9WrqPWvi0/gnjo4BrSVbcJqSuxgH6Ya6ENa/
 GKGHef6VcBFj1ETVsDFOsVcORX0YR2tEXVWDvUutlCBprk9V7c746yK+5boq1mBag0IS
 S+qgE33NMo/5VEnLI1gyNCzbu0jlTEd6d9Y5hxOSzNjdJk9hhCKoyeOGtlpdNbOpsLZh
 Wwwmf7zIMpdiXrHM5HhHhIVOV9ZIfLDjd2KUuAiarNtSkQ4UGP7dGsnzwcdhGPNShQQK
 Gcpw==
Subject: [PATCH 3/4] runlatex.sh: Add more lines of grep output around
 warning/error log
References: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e0424a38-c20e-37d2-4f88-6674041b9f80@gmail.com>
Date: Mon, 13 Mar 2017 00:40:29 +0900
MIME-Version: 1.0
In-Reply-To: <09b2c966-ea73-1ef9-cf84-2e2eefbf7517@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From b3f6e0806f0d4ea46bb9885df572c0c31433a17f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 12 Mar 2017 20:42:10 +0900
Subject: [PATCH 3/4] runlatex.sh: Add more lines of grep output around warning/error log

This change will make it mostly unnecessary to look up log file
when build error occurred.

Also fix an iteration status message to match that in the log file.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 1 +
 utilities/runlatex.sh      | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index dc55cb7..8261238 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -43,6 +43,7 @@ echo "pdflatex 1 for $basename.pdf"
 pdflatex $basename > /dev/null 2>&1 < /dev/null || :
 if grep -q '! Emergency stop.' $basename.log
 then
+	grep -B 15 -A 5 '! Emergency stop.' $basename.log
 	echo "----- Fatal latex error, see $basename.log for details. -----"
 	exit 1
 fi
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index da9e82d..e6b3938 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -43,6 +43,7 @@ iterate_latex () {
 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
 	then
+		grep -B 15 -A 5 '! Emergency stop.' $basename.log
 		echo "----- Fatal latex error, see $basename.log for details. -----"
 		exit 1
 	fi
@@ -98,11 +99,13 @@ do
 		fi
 	fi
 	iter=`expr $iter + 1`
-	echo "pdflatex $iter for $basename.pdf # label(s) may have been changed"
+	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
 	iterate_latex
 done
-if grep "LaTeX Warning:" $basename.log
+if grep -q "LaTeX Warning:" $basename.log
 then
+	echo "----- Excerpt around remaining warning messages -----"
+	grep -B 8 -A 5 "LaTeX Warning:" $basename.log | tee $basename-warning.log
 	echo "----- You can see $basename-warning.log for the warnings above. -----"
 	echo "----- If you need to, see $basename.log for details. -----"
 	rm -f $basename-warning-prev.log
-- 
2.7.4


