Return-Path: <SRS0=B+Zt=57=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVqmCtaTbv5Fh34ZpqPgSLa9iUgzd46Osbw1JesWYSo=;
        b=MRBLywMiPD1SirNa2TaYLbmTsn6vno6lpoHe6JJYPWnQQ5+qdWASdcg+7pil5CBKIb
         JsqsBwe1KNd6bqtcvf3h+u/gCre7izv4gW6TSf44oXnHHLDJ4t9D45v5ClLAWF+yx5UW
         onxM44tDVX/54eQhHp83MTPl0tyT6xHrvuOJ+BWPH2WP07minu0HhEVjfVR1Wo5Fu5NW
         eRjVUKcjLbjHiKxfZmXVitVEh4zNRnonrLS/E8qjo8q5s/ZQ11A4g1mgIxPf8zc0z1wc
         nboEKyXvTC2d6keEajPJ9npI7r/WtJsaMU4gHmxpiW2GThPvPBkf/q3UGL2IbDrfkgCH
         LwJA==
Message-ID: <5011ac44-402f-5185-bb62-0d2ac908da5e@gmail.com>
Date: Sat, 4 Feb 2023 00:23:25 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] autodate.sh: Add graceful fallback of commitid-only
 mode for shallow clone
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Under shallow clone of perfbook repo, "git describe" can't work.
Catch the error and use "git log" to obtain the commit id instead.

Following is the comparison of autodate.tex. 

Before:

    \date{February 3, 2023 \\ Tag: \texttt{} }
    \newcommand{\commityear}{2023}
    \newcommand{\commitid}{}
    \IfQqzBg{}{\setboolean{qqzbg}{false}}
    % tcolorbox version: 5.1
    \tcbsetforeverylayer{autoparskip}

After:

    \date{February 3, 2023 \\ Commit: \texttt{g25bd138c30bf} (shallow clone) }
    \newcommand{\commityear}{2023}
    \newcommand{\commitid}{g25bd138c30bf}
    \IfQqzBg{}{\setboolean{qqzbg}{false}}
    % tcolorbox version: 5.1
    \tcbsetforeverylayer{autoparskip}

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Bras <leobras.c@gmail.com>
---
 utilities/autodate.sh | 54 ++++++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index e33c254d917f..6d10b5d7d2b4 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -52,27 +52,28 @@ else
 	else
 		modified=""
 	fi
-	description="`git describe --tags HEAD`"
-	case "$description" in
-	*-g*)
-		release=`env printf 'Commit: \\\texttt{%s}' "$description"`
-		commitid="$description"
-		;;
-	v*)
-		release="Release $description"
-		commitid=$description
-		qqzbg="true"
-		;;
-	Edition*)
-		release="Edition"
-		commitid=$description
-		qqzbg="true"
+	if description="`git describe --tags HEAD 2> /dev/null`"
+	then
 		case "$description" in
-		*P*)
-			release="Print $release"
+		*-g*)
+			release=`env printf 'Commit: \\\texttt{%s}' "$description"`
+			commitid="$description"
 			;;
-		esac
-		case "$description" in
+		v*)
+			release="Release $description"
+			commitid=$description
+			qqzbg="true"
+			;;
+		Edition*)
+			release="Edition"
+			commitid=$description
+			qqzbg="true"
+			case "$description" in
+			*P*)
+				release="Print $release"
+				;;
+			esac
+			case "$description" in
 		Edition[.-][0-9]*)
 			ednum="`echo $description | sed -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
 			release=`env printf '\\Ordinalstringnum{%s} %s' $ednum "$release"`
@@ -85,11 +86,16 @@ else
 			;;
 		esac
 		;;
-	*)
-		release=`env printf 'Tag: \\\texttt{%s}' "$description"`
-		commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
-		;;
-	esac
+		*)
+			release=`env printf 'Tag: \\\texttt{%s}' "$description"`
+			commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
+			;;
+		esac
+	else
+		description=`git log --max-count=1 | head -n 1 | sed -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
+		release=`env printf 'Commit: \\\texttt{%s} (shallow clone)' "$description"`
+		commitid="$description"
+	fi
 fi
 month=`date --date="$date_str" +%B`
 year=`date --date="$date_str" +%Y`

base-commit: 3bfa0a092334e3a82bf75217b01d500ad78b6dc5
-- 
2.25.1

