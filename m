Return-Path: <SRS0=yW6v=IZ=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JWFo5K5zOxXlnZtm90U54dDbaAXmMXhCktDCp4LsK4o=;
        b=rSv6gR9kTLtyp5yqtBGbw6w3yYSNcvXq49aaa3Gf3nO++Nn8H5jfEEQZUVw1ohin7+
         FBSmtH0rNprcL6I5vWJVuMS9WTlHk8UsDlHfFvw6WoLNukwkQWS0rcp37miogFNfXeLK
         SrwPE5u3AeBP82NutjdypvzCzosj1OriygZYxhzRcWlC7nEBHUfMpLlNRiozomxgTXAE
         2x1YwmOLoP2cQ5yjRQfKBGtPtsvLqPZ6nuLGBjwmqON7ucMwxEo6T3qzKy3Mid2nIxj8
         vAqrep3kWfZg+WBQlFv9AGhoNumdLvKFteQLuPTtRdZZ/6namzTZd6m9/nvQRlDbURwu
         lVKg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] utilities: Add a script for automated latex package install
Date: Sat, 27 Mar 2021 12:21:23 +0100
Message-Id: <20210327112124.29206-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Installing version mismatch latex packages one by one in manual, as
described in #10.A in FAQ-BUILD.txt is cumbersome.  This commit adds a
script for automation of the work.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 utilities/install_latex_package.sh | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100755 utilities/install_latex_package.sh

diff --git a/utilities/install_latex_package.sh b/utilities/install_latex_package.sh
new file mode 100755
index 00000000..0a7f3d19
--- /dev/null
+++ b/utilities/install_latex_package.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+
+if [ $# -ne 1 ]
+then
+	echo "Usage: $0 <package name>"
+	exit 1
+fi
+
+package=$1
+
+packages="titlesec cleveref listings draftwatermark epigraph fvextra"
+supported="false"
+for p in $packages
+do
+	if [ "$package" == "$p" ]
+	then
+		supported="true"
+		break
+	fi
+done
+if [ "$supported" == "false" ]
+then
+	echo "$package is not supported"
+	exit 1
+fi
+
+wget "http://mirrors.ctan.org/macros/latex/contrib/$package.zip"
+unzip "$package.zip"
+cd "$package" || exit 1
+
+latex "$package.ins"
+if [ ! -e "$package.sty" ]
+then
+	echo "$package.sty creation failed"
+	exit 1
+fi
+
+install_dir=~/texmf/tex/latex/"$package"
+mkdir -p "$install_dir"
+cp "$package.sty" "$install_dir/"
+texhash ~/texmf
+
+cd .. || exit 1
+rm -fr "$package" "$package.zip"
-- 
2.17.1

