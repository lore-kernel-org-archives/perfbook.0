Return-Path: <SRS0=Lubz=7I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678926450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=an4Ra5y5k5DWppG3knQ0qFU8pYLQM+52mXyUD1qhVIw=;
        b=beq5H2X35Lnu/q/rWfXIDQ+kyTv8JnCG+yUQr0Q4UH/6uN2dyCT2ThYC+XUfMcSywy
         gZMqSi3xHMZSL8T0HVCbctoZsWded7yzW8hW4s/ii7MhvbwJqQmUXcjwKXYPqustmB3R
         vVsetcOvRmVZ+wqi3vy3tXIiGT6bUeEIaV7ckUkcgHTsXejgD5oqlURPAJnZdqSANSoU
         K8aaGkhi3C6t1hkM67kH+ynWsrXo1SnJaVP0fHI/+R/1fRaxO/A/ySRFWu3s/zf1o2l+
         iZ+Nrg39bjnIMVBoPOZMkHio2D/TX2AUuxu3VD7pvaozFstxBUtOTSRjUupogVXBBH5g
         455w==
Message-ID: <3f8fb1c8-fdeb-0b4e-5947-307430ed86e5@gmail.com>
Date: Thu, 16 Mar 2023 09:27:27 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] precheck.sh: Test sed against repeat patterns
 \+ and \?
Content-Language: en-US
References: <116f11cf-4763-0b74-10b4-b5c2074ae696@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <116f11cf-4763-0b74-10b4-b5c2074ae696@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

It turns out that missing features in FreeBSD sed are repeat
patterns of "\? and \+.

Test them in precheck.sh instead of running extractqqz.sh.

Update FAQ-BUILD.txt accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt         |  2 +-
 utilities/precheck.sh | 18 ++++++------------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index d9728acb0c9e..024f98bd4555 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -342,7 +342,7 @@
 		  - GNU make
 		  - /usr/bin/env
 		  - date: format options of either GNU or BSD flavor
-		  - sed: multi-line edit
+		  - sed: repeat patterns \? and \+
 		  - grep: -z option (optional)
 
 		Among requirements above, features of date and sed are checked
diff --git a/utilities/precheck.sh b/utilities/precheck.sh
index 4d5c31a1d49c..7de0e9fba328 100755
--- a/utilities/precheck.sh
+++ b/utilities/precheck.sh
@@ -15,19 +15,15 @@ LC_TIME=C
 
 fatal=""
 
-tmp_file_dir=$(mktemp -d)
-tmp_file=$tmp_file_dir/precheck
-
-# test sed (multi-line edit)
+# test sed (repeat pattern \? and \+)
 sed_result=""
-sh utilities/extractqqz.sh < count/count.tex > $tmp_file 2> /dev/null
-if grep -q -F "QuickQ{}" $tmp_file ; then
+sed_out=`echo aaabbc | $SED -e 's/[ab]\+c\?//'`
+if [ "$sed_out" = "" ] ; then
 	sed_result="OK"
 else
 	sed_result="NG"
 	fatal="sed $fatal"
 fi
-rm -f $tmp_file
 
 # test date (format conversion)
 date_result=""
@@ -50,8 +46,6 @@ else
 	fatal="date-format $fatal"
 fi
 
-rm -rf $tmp_file_dir
-
 if [ "$fatal" = "" -a "$VERBOSE" = "" ] ; then
 	exit 0
 fi
@@ -63,9 +57,9 @@ echo "==========================================="
 
 if [ "$sed_result" != "OK" -o "$VERBOSE" != "" ] ; then
 	echo
-	echo "------------------------------------------"
-	echo " testing sed (multi-line edit)            "
-	echo "------------------------------------------"
+	echo '------------------------------------------'
+	echo ' testing sed (repeat patterns \? and \+)  '
+	echo '------------------------------------------'
 	if [ "$sed_result" = "OK" ] ; then
 		echo "OK."
 	else
-- 
2.25.1


