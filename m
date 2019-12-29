Return-Path: <SRS0=/5BA=2T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IkaAgj0p4ren63fvqG4ppVasaqDug2uihOhev9CT1Wc=;
        b=T5ryQI0kEB2YHHfa4sPX80QagV04U/lQIVVx9zJO5Eb7KNLwoCk19Bq2Vq+erPZXTK
         TsprlgyiU5HqIhMMbjcmuim1JAb1DZ1Y9Qz8s7exgY9zNVJma5Xja0Q1+QPy5jywFdQ6
         1nji3Xti1iIrbBPhoTqZhaaXp/kjKPQzIpI6jlcqVE8MsDNgu/4rbdeZvgi5/kbAToo1
         YMBDIv+HKtu2iZhnr3I+i0chiVCUola9kEgPjCVZQmxsQ4OmC7hitTDbfmTKOBQAWuRt
         Z6daXm2C8B+qWzVCXBj6kiCU9UvtcnUqXgcEM6V9APMrX3DfpWc7kTke8Y1oYvyjaQzF
         pBGQ==
Subject: [PATCH 1/3] utilities/autodate: Use 'fmtcount' package for ordinals
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <681c62ff-d3e7-354c-885b-1a2a06e733b4@gmail.com>
Date: Sun, 29 Dec 2019 19:23:36 +0900
MIME-Version: 1.0
In-Reply-To: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f688ea9f959e70e39315f0a48c843667e9e70561 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Dec 2019 17:49:26 +0900
Subject: [PATCH 1/3] utilities/autodate: Use 'fmtcount' package for ordinals

LaTeX package "fmtcount" provides a macro "\Ordinalstringnum{}",
which does the conversion we need.

Also do some cosmetic tweaks:
    - Use typewriter font for commit description and non-release tag.
    - Move "(m)" indicating dirty git status to the end of release
      info.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex          |  1 +
 utilities/autodate.sh | 27 +++++----------------------
 2 files changed, 6 insertions(+), 22 deletions(-)

diff --git a/perfbook.tex b/perfbook.tex
index 7dc8d95f..73b79205 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -59,6 +59,7 @@
 \usepackage[hyphens]{url}
 \usepackage{threeparttable}
 \usepackage{titlesec}[2016/03/21] % Suppress number in paragraph heading
+\usepackage{fmtcount}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 13d8bb5f..924fa6ee 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -43,7 +43,7 @@ else
 	description="`git describe --tags HEAD`"
 	case "$description" in
 	*-g*)
-		release="Commit $description"
+		release=`env printf 'Commit: \\\texttt{%s}' "$description"`
 		;;
 	v*)
 		release="Release $description"
@@ -57,25 +57,8 @@ else
 		esac
 		case "$description" in
 		Edition[.-][0-9]*)
-			ednum="`echo $description | sed -e 's/^Edition[.-]\([1-9]*\).*$/\1/'`"
-			case "$ednum" in
-			1)
-				edord=First
-				;;
-			2)
-				edord=Second
-				;;
-			3)
-				edord=Third
-				;;
-			4)
-				edord=Fourth
-				;;
-			*)
-				edord=FixMe
-				;;
-			esac
-			release="$edord $release"
+			ednum="`echo $description | sed -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
+			release=`env printf '\\Ordinalstringnum{%s} %s' $ednum "$release"`
 			;;
 		esac
 		case "$description" in
@@ -86,7 +69,7 @@ else
 		esac
 		;;
 	*)
-		release="Commit $description"
+		release=`env printf 'Tag: \\\texttt{%s}' "$description"`
 		;;
 	esac
 fi
@@ -98,5 +81,5 @@ then
 	release=`env printf '%s %s' '\\\\' "$release"`
 fi
 
-env printf '\\date{%s %s, %s %s %s}\n' $month $day $year $modified "$release"
+env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified
 env printf '\\newcommand{\\commityear}{%s}\n' $year
-- 
2.17.1


