Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=XdjadMcHjPm51OPUEst/ReuHNHw520P7F+cYF7qAugc=;
 b=HYWd1fz7KFZYLUauznb5EaOPk5vaQHaSfoF/jqEdtSmr6Gln0zE4dAqIgKkcqqV+qT
 sEL8ZVfvWhdcW7R5fm4tHi2vfSrKzsFGe1yYhyvFtGopjwbBsx/droTcz1acKciEpRQr
 V6cpSAK7KEqR5cisrJyjz8BYr+Qin5JsiCtOwSFZ+CAsTvArhnoVNLQ4dNMHRnu95gG/
 1DzwhW7MtF6U6dVpJLKDpM6tFZACIlMu+3G9sp3rvCyGx3QQXWV8OZDgof1CyLeWHkR2
 PxhD8UkSEIfDRkVVVoVippVIf4XJKc8Qksj04NEKgMrQuxJ+YM0gnBpSo1l7hFTz8DxS
 K9eA==
Subject: [PATCH 2/2] hyphen2endash.sh: Merge subst patterns
References: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <951f2783-988d-0bd4-3998-d6568e9b64e8@gmail.com>
Date: Sun, 18 Sep 2016 23:28:15 +0900
MIME-Version: 1.0
In-Reply-To: <2247f46e-3c0a-89a5-f13f-b9ba591bc570@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ec548ecfa8846f40731a0945853d3ac9018b4d71 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 4 Sep 2016 08:03:52 +0900
Subject: [PATCH 2/2] hyphen2endash.sh: Merge subst patterns

This commit merges several rules by using "[abc]" patterns,
as long as they are not too cryptic (at least for me).

It also replaces patterns of "{.*}" with those of "{[^}]*}"
for stable matching when there are multiple "{...}"s in a line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/hyphen2endash.sh | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
index b495e33..39005a4 100644
--- a/utilities/hyphen2endash.sh
+++ b/utilities/hyphen2endash.sh
@@ -38,21 +38,12 @@
 # Authors: Akira Yokosawa <akiyks@gmail.com>

 cat $1 |
-	sed -e 's/Lines~\([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
-	    -e 's/Lines \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
-	    -e 's/lines~\([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
-	    -e 's/lines \([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
-	    -e 's/Line~\([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
-	    -e 's/Line \([0-9]\+\)-\([0-9]\+\)/Lines~\1--\2/g' \
-	    -e 's/line~\([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
-	    -e 's/line \([0-9]\+\)-\([0-9]\+\)/lines~\1--\2/g' \
+	sed -e 's/\([Ll]ines\?\)[ ~]\([0-9]\+\)-\([0-9]\+\)/\1~\2--\3/g' \
 	    -e 's/Slides \([0-9]\+\)-\([0-9]\+\)/Slides~\1--\2/g' \
-	    -e 's/Figures~\(\\ref{.*}\)-\(\\ref{.*}\)/Figures~\1--\2/g' \
-	    -e 's/CPUs~\([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
-	    -e 's/CPUs \([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
-	    -e 's/and~\([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
-	    -e 's/and \([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
-	    -e 's/\(\\co{.*}\)-\(\\co{.*}\)/\1--\2/g' \
+	    -e 's/Figures~\(\\ref{[^}]*}\)-\(\\ref{[^}]*}\)/Figures~\1--\2/g' \
+	    -e 's/CPUs[ ~]\([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
+	    -e 's/and[ ~]\([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
+	    -e 's/\(\\co{[^}]*}\)-\(\\co{[^}]*}\)/\1--\2/g' \
 	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

 # Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
1.9.1


