Return-Path: <SRS0=dFhI=5X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Kms8CXjy1edfnKcG+ulDPNETrxxBeawZ3GpFUO3BTI=;
        b=EzMFSogsNvgNanxFIAMyCzsLXmRhuE9t60jcXypyIyJTAg89l1ZubLC5tf/9woFb38
         k8MhyQr/3oZxC2ybMJb0wX9Yg0aGiKtBPfTfmMN6fvXn+DEuFugsX9z1qQSe4KxFy4yd
         Sx5B0bjcs62McEgJUmYJotT+PT3sTLeBG65VyieveHtQgJMAq4mJZlL9NWkoa0s2MDW9
         lc4xcP50weMJl1nwc9OsYxQ09hrfcK50RxySZSmQEOMVN4lQuH/C9s+K9iTMuyeMk3rs
         /YdRva27anq0W72Nyq2fMwzM5C/i0gw4DoymgVepZ9py4s7wmGjOZ0BXnbmHHADo1pEQ
         Z74w==
Message-ID: <48517b40-a485-d48d-eb95-6dce2c20010b@gmail.com>
Date: Thu, 26 Jan 2023 09:23:26 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] run{first}latex.sh: Set default of LATEX variable
 properly
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The default of "pdflatex" has never worked as expected.
When these scripts run under Makefile's control, they are
given "LATEX=pdflatex" by default, and work just fine.

When directly invoked from command line:

    $ sh utilities/runfirstlatex.sh perfbook

, it runs with LATEX="" and ends up in one of various errors.

Fix this by using the right pattern of ":=".

Fixes: 241d5350b162 ("run{first}latex.sh: Use variable for 'pdflatex' command")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runfirstlatex.sh | 2 +-
 utilities/runlatex.sh      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/utilities/runfirstlatex.sh b/utilities/runfirstlatex.sh
index b92895f332ca..f12f14886747 100644
--- a/utilities/runfirstlatex.sh
+++ b/utilities/runfirstlatex.sh
@@ -67,7 +67,7 @@ fi
 
 basename=`echo $1 | sed -e 's/\.tex$//'`
 
-: ${LATEX:-pdflatex}
+: ${LATEX:=pdflatex}
 
 echo "$LATEX 1 for $basename.pdf"
 $LATEX $LATEX_OPT $basename > /dev/null 2>&1 < /dev/null
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index d4c9baf8740a..e23bc87ba978 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -29,7 +29,7 @@
 # Authors: Paul E. McKenney <paulmck@us.ibm.com>
 #          Akira Yokosawa <akiyks@gmail.com>
 
-: ${LATEX:-pdflatex}
+: ${LATEX:=pdflatex}
 
 diff_warning () {
 	if diff -q $basename-warning.log $basename-warning-prev.log >/dev/null

base-commit: 685184dff46ffdec02b7402a36b06359cb085f29
-- 
2.25.1

