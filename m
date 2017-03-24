Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kjH2LIxplmmtfrFNcKtggxZ5YKcVxv2+v65Wu/PtcmM=;
 b=SwT8aeVyetVugn0tJAnJmFbXxfjKRjGaRcH6gjb8V/F+rpyZ3LAKeHDtgstJz5NLkZ
 oMEib9BH0rVqHGbipr4bUSml6KZp0WzX7VhJwcqaE5NqcRv9967hfiLe6AAri81ESJ5V
 xFmoIRZ1llyJJxFOicQBNWVd8wAeisKqMPbWZvJa7QDqDfVDD0iy9zp2hC8DrDvmBTRP
 6vluec1iKlBZMEVBxdgKoEdzCI64oBbJlcc+F5YywMZyjWBLlqQCyzOz2bhqc5rWfJHE
 DHTHb4jZkRzXTRD2b3tQ3+F8FFJl7U3LMjswSgDGTS9skBCJBNC8TZxAGP4Ypt4hi808
 P6Uw==
Subject: [PATCH v4 2/2] Add another build error check
References: <d4e3f6ba-bdc9-fa85-7404-f189adfb6436@gmail.com>
 <20170323153558.GD3637@linux.vnet.ibm.com>
 <c7a6f457-3914-9e5e-a42a-29e9b8f67b77@gmail.com>
 <20170324181239.GJ3637@linux.vnet.ibm.com>
 <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <dac03e04-289c-5dac-25f6-7748114b1f41@gmail.com>
Date: Sat, 25 Mar 2017 08:03:38 +0900
MIME-Version: 1.0
In-Reply-To: <18798da1-60ed-a6b4-0a7b-e53a9f3b7fc0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e2ffbd35e5a1121b953a2f7073ee50d6efc58cd3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 24 Mar 2017 20:37:26 +0900
Subject: [PATCH v4 2/2] Add another build error check

This check catches build error to happen when font-map database
is not updated after manual install of a font package.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 6 ++++++
 utilities/runlatex.sh      | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index 8261238..1a2a7a5 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -47,6 +47,12 @@ then
 	echo "----- Fatal latex error, see $basename.log for details. -----"
 	exit 1
 fi
+if grep -q '!pdfTeX error:' $basename.log
+then
+	grep -A 2 '!pdfTeX error:' $basename.log
+	echo "----- Fatal latex error, see $basename.log for details. -----"
+	exit 1
+fi
 grep 'LaTeX Warning:' $basename.log > $basename-warning.log
 touch $basename-first.log
 exit 0
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index cece545..81800db 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -58,6 +58,12 @@ iterate_latex () {
 		echo "----- Fatal latex error, see $basename.log for details. -----"
 		exit 1
 	fi
+	if grep -q '!pdfTeX error:' $basename.log
+	then
+		grep -A 2 '!pdfTeX error:' $basename.log
+		echo "----- Fatal latex error, see $basename.log for details. -----"
+		exit 1
+	fi
 	if test -r $basename-warning.log
 	then
 		mv -f $basename-warning.log $basename-warning-prev.log
-- 
2.7.4


