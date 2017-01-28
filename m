Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=YNvq3V1qGeCUyhO+MvS+IBf0aETXiBKvc47fm2SICss=;
 b=clAcWsHcYPt5sxgxAI5YE991oNPrrR1Vnio87IiNt3buQ4lcUpnlfDmAZzGFgE5l+o
 WxijTE0WNxcRrgLkqsyFtuVPu+D9RDYJZ6fkLsTjTVY07Ld3KzBtSFT5ukYjUVhRY4Ut
 Alm55LAEd8auTCL9IEYGwEecIeVRsv7wwKWX5p+WP4IxGBvZC5GSp4ODRM+idD1C+Rrw
 sL2IG23rtG+M9ZIzYphumAje8sghyglXqNsMG0fHWqRScGOALClUBTgwDqaSGLONTjSa
 lSoy28JYRogyw4FW7KPCGTonAGNnvks6crcxYFXBb8YaidjgmR9VWe9VRa5KfwZ7DgB5
 mCLg==
Subject: [PATCH 1/4] Update hyphen-to-endash scripts
References: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4d379292-2a5e-8552-1036-96205eab6d5e@gmail.com>
Date: Sat, 28 Jan 2017 20:08:49 +0900
MIME-Version: 1.0
In-Reply-To: <07d5345b-53d6-243c-8ba4-84b865552852@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b1654e9d60fe96de07c50e2293205495d04358f3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 3 Jan 2017 19:03:04 +0900
Subject: [PATCH 1/4] Update hyphen-to-endash scripts

Add script for converting hyphen to endash in .bib files.
Also add a rule for auto updated year range in legal page.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/bibhyphen2endash.sh | 27 +++++++++++++++++++++++++++
 utilities/dohyphen2endash.sh  | 12 ++++++++++++
 utilities/hyphen2endash.sh    |  4 +++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 utilities/bibhyphen2endash.sh

diff --git a/utilities/bibhyphen2endash.sh b/utilities/bibhyphen2endash.sh
new file mode 100644
index 0000000..1bd8b3e
--- /dev/null
+++ b/utilities/bibhyphen2endash.sh
@@ -0,0 +1,27 @@
+#!/bin/sh
+#
+# Find hyphens used for number range and replace them with en dashes.
+# (for bibliography pages field, conversion to en dash is done by BiBTeX)
+#
+# Replacement candidate
+#   Volumes mm-nn -> Volumes mm--nn
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, you can access it online at
+# http://www.gnu.org/licenses/gpl-2.0.html.
+#
+# Copyright (C) Akira Yokosawa, 2017
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+cat $1 | sed -e 's/Volumes \([0-9]\+\)-\([0-9]\+\)/Volumes \1--\2/g'
diff --git a/utilities/dohyphen2endash.sh b/utilities/dohyphen2endash.sh
index fabecb5..3be7d47 100644
--- a/utilities/dohyphen2endash.sh
+++ b/utilities/dohyphen2endash.sh
@@ -71,4 +71,16 @@ do
 		cp -f $tmpf $basename.tex
 	fi
 done
+bibfiles=`find bib -name '*.bib' -print`
+for i in $bibfiles
+do
+	basename="${i%.bib}"
+#	echo $basename.bib
+	sh ./utilities/bibhyphen2endash.sh $basename.bib > $tmpf
+	if ! diff -q $basename.bib $tmpf >/dev/null
+	then
+		echo "$basename.bib modified"
+		cp -f $tmpf $basename.bib
+	fi
+done
 rm -f $tmpf
diff --git a/utilities/hyphen2endash.sh b/utilities/hyphen2endash.sh
index 39005a4..4736c31 100644
--- a/utilities/hyphen2endash.sh
+++ b/utilities/hyphen2endash.sh
@@ -18,6 +18,7 @@
 # and~nn-mm -> and~nn--mm
 # Figures~\ref{foo}-\ref{bar} -> Figures~\ref{foo}--\ref{bar}
 # \co{xxx}-\{yyy} -> \co{xxx}--\co{yyy}
+# yyyy-\commityear -> yyyy--\commityear (in Legal statement)
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -33,7 +34,7 @@
 # along with this program; if not, you can access it online at
 # http://www.gnu.org/licenses/gpl-2.0.html.
 #
-# Copyright (C) Akira Yokosawa, 2016
+# Copyright (C) Akira Yokosawa, 2016, 2017
 #
 # Authors: Akira Yokosawa <akiyks@gmail.com>

@@ -44,6 +45,7 @@ cat $1 |
 	    -e 's/CPUs[ ~]\([0-9]\+\)-\([0-9]\+\)/CPUs~\1--\2/g' \
 	    -e 's/and[ ~]\([0-9]\+\)-\([0-9]\+\)/and~\1--\2/g' \
 	    -e 's/\(\\co{[^}]*}\)-\(\\co{[^}]*}\)/\1--\2/g' \
+	    -e 's/\([0-9]\)-\(\\commityear\)/\1--\2/g' \
 	    -e 's/\/\* Lines~\([0-9]\+\)--\([0-9]\+\) \*\//\/\* Lines \1-\2 \*\//g'

 # Last pattern is to preserve "Lines n-m" in comments within code snippet
-- 
2.7.4


