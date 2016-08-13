Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ePvN8ejRPNRkab4efR0zJCQnqud6xft8oL61KsrTNI4=;
 b=e1BcIToU1cSbwLfetGO2qi8eeaXl98NF5SPLxmkbK6BrnQBVcu2FIAS7ZFGHHyHzOL
 5AzTqSGMgq2ulmNRalmWbnnrhoTqoNGZbtihKJW04+IF2MSXeT7BMd/+XEARgvhdTtXa
 mGO8EvqJd0907uihay+qizsyXOaRoli/bo8VMeDvptK4CyIQ6k9PPAp1wGvUYkQ/E6ZI
 GxdB+y6a41c90/7hB1bhVwvcxv60k3IvpeBcDr2YcpJJQoSUHaztrYdZwN7lR9eayhPp
 oje7N57Ij02CZ+3FVeQI6/UAimNmwju0EOFPe+fTiV06VF2q/0apsK9qxmna+AXOuxLX
 w8kQ==
Subject: [RFC PATCH 2/3] dohyphen2endash.sh: Add check of git status
References: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <acaf8e98-156d-ef64-8b7f-4deef3ba9eb0@gmail.com>
Date: Sat, 13 Aug 2016 12:40:37 +0900
MIME-Version: 1.0
In-Reply-To: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1fc4b3e11e22f12c0ca347cbbcae6dae329cdcf0 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 12 Aug 2016 23:58:46 +0900
Subject: [RFC PATCH 2/3] dohyphen2endash.sh: Add check of git status

This commit also adds option "-f" and "--force" to override the
check.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/dohyphen2endash.sh | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/utilities/dohyphen2endash.sh b/utilities/dohyphen2endash.sh
index 3270983..05557f0 100644
--- a/utilities/dohyphen2endash.sh
+++ b/utilities/dohyphen2endash.sh
@@ -1,6 +1,9 @@
 #!/bin/sh
 #
 # Apply hypen2endash.sh for all .tex files
+# If invoked in non-clean git status, this script will abort.
+# If invoked with the "--force" option, this script will continue
+# regardless of git status.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -20,6 +23,41 @@
 #
 # Authors: Akira Yokosawa <akiyks@gmain.com>

+# parse option
+TEMP=`getopt -o f --long force -- "$@"`
+
+if [ $? != 0 ] ; then echo "Error in parse option..." >&2 ; exit 1 ; fi
+
+eval set -- "$TEMP"
+
+forced=0
+
+while true ; do
+	case "$1" in
+		-f|--force) forced=1 ; shift ;;
+		--) shift ; break ;;
+		*) echo "Unknown option!" ; exit 1 ;;
+	esac
+done
+# check if we are in git repository
+if ! test -e .git
+then
+	echo "not in a git repository"
+	exit 1
+fi
+# check if companion script exists
+if ! test -e utilities/hyphen2endash.sh
+then
+	echo "utilities/hyphen2endash.sh not found."
+	exit 1
+fi
+# check if git status is clean
+gitstatus=`git status --porcelain | wc -l`
+if [ $forced -eq 0 -a $gitstatus != "0" ]
+then
+	echo "git status not clean --- aborting."
+	exit 1
+fi
 texfiles=`find . -name '*.tex' -print`
 for i in $texfiles
 do
-- 
1.9.1


