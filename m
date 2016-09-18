Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=EJQIcSDFgdir1MxPiao6xfMu2R1dYLIHeVv8+h9dufk=;
 b=jZ9ZK/tmYPGKEeiif3QV2CfuOSkb4FBp0iGHQJIUNpqyP/rU4D7G0wTVDILUnlkUun
 YrVarK1ZiYxznQODO0qtUNIRagkitFwKs8oi8ngJ8NQgV/Nd564yu+banKCz3YqfN8S9
 t0GdZ+qDPofy1LJJwxgUsiqlxkbgF7VuJ+f1UbqJlP0GINqUbkraOSwnkc4WCBV7QKoX
 Z6vS7S6dZGBfzGMeJB91Yo3T21BozzJHC13/dyjh4B4vFwg8C8xFEXjY6bcUt9LRyoET
 90AX+bB0ElrwfjWH8hMZXNqrHhPcpcueG07d0Y+m6YJpHnQs32YasRRdR4URUOqHAeVv
 Wdqg==
Subject: [PATCH 1/2] hyphen2endash.sh: Add substitution patterns
References: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <edcd2d55-06a0-66e0-abab-8b12b5b668ff@gmail.com>
Date: Sun, 18 Sep 2016 23:26:51 +0900
MIME-Version: 1.0
In-Reply-To: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 37577e84f4215305195e471df9443ac2f242f595 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 00:14:09 +0900
Subject: [PATCH 1/2] hyphen2endash.sh: Add substitution patterns

This commit adds substitution patterns for the following:
  o CPUs~nn--mm
  o \co{xxx}--\co{yyy}

It also separates the pattern for "and~nn--mm".

This commit also fixes typo in author's email address.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/dohyphen2endash.sh |  2 +-
 utilities/hyphen2endash.sh   | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/utilities/dohyphen2endash.sh b/utilities/dohyphen2endash.sh
index 2a0fdc7..fabecb5 100644
--- a/utilities/dohyphen2endash.sh
+++ b/utilities/dohyphen2endash.sh
@@ -21,7 +21,7 @@
 #
 # Copyright (C) Akira Yokosawa, 2016
 #
-# Authors: Akira Yokosawa <akiyks@gmain.com>
+# Authors: Akira Yokosawa <akiyks@gmail.com>

 # parse option
 TEMP=`getopt -o f --long force -- "$@"`
diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
index 2b37696..b495e33 100644
--- a/utilities/hyphen2endash.sh
+++ b/utilities/hyphen2endash.sh
@@ -11,9 +11,13 @@
 # Line nn-mm -> Lines~nn--mm  -- includes typo fix
 # line~nn-mm -> lines~nn--mm  -- includes typo fix
 # Line~nn-mm -> Lines~nn--mm  -- includes typo fix
-# Lines~nn--mm and oo-pp -> Lines~nn--mm and oo--pp
 # Slides nn-mm -> Slides~nn--mm
+# CPUs~nn-mm -> CPUs~nn--mm
+# CPUs nn-mm -> CPUs~nn--mm
+# and nn-mm -> and~nn--mm
+# and~nn-mm -> and~nn--mm
 # Figures~\ref{foo}-\ref{bar} -> Figures~\ref{foo}--\ref{bar}
+# \co{xxx}-\{yyy} -> \co{xxx}--\co{yyy}
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -31,7 +35,7 @@
 #
 # Copyright (C) Akira Yokosawa, 2016
 #
-# Authors: Akira Yokosawa <akiyks@gmain.com>
+# Authors: Akira Yokosawa <akiyks@gmail.com>

 cat $1 |
 	sed -e 's/Lines~\([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
@@ -42,9 +46,13 @@ cat $1 |
 	    -e 's/Line \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
 	    -e 's/line~\([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
 	    -e 's/line \([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
-	    -e 's/Lines~\([0-9]\+\)--\([0-9]\+\) and \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2 and \3--\4/g' \
 	    -e 's/Slides \([0-9]\+\)-\([0-9]\+\)/Slides~\1--\2/g' \
 	    -e 's/Figures~\(\\ref{.*}\)-\(\\ref{.*}\)/Figures~\1--\2/g' \
+	    -e 's/CPUs~\([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
+	    -e 's/CPUs \([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
+	    -e 's/and~\([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
+	    -e 's/and \([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
+	    -e 's/\(\\co{.*}\)-\(\\co{.*}\)/\1--\2/g' \
 	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

 # Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
1.9.1


