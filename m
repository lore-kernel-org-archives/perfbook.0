Return-Path: <SRS0=Lubz=7I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678926382;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkGuayMXiyCQBbk37/WsH7u/z/1U5n7OpBQcgC0fAvI=;
        b=XtjvMX/88gdaeZeHspARrH1iC5ZPq13CtToisQidRBRkxyvB+BHexPERKRCMgrVLUI
         wlu/cD5YEtVzN2ODwEeXTCD0cmjeXiJMJ/nbRni0mjZH0/ZTpofNw5+GfUoJGYfhks5K
         whh98H+g/52Taavv4VqcOzWVqwnRGL5tKKXyb4OeEm9YyA0evpclsYt18r5LN146G2hJ
         lAGM6MjT/5LDReZVHVhD+W/eYXLhTmWkGYRqPA6K7uGWgufKCO2lT4OX793D3/DE+lpE
         w+lOygWnyQwA+lm7jZq676VstNEN4C00dYgk4Bth3oBvcORsC+ueB86PHYa8tIESTtZ2
         SF2w==
Message-ID: <116f11cf-4763-0b74-10b4-b5c2074ae696@gmail.com>
Date: Thu, 16 Mar 2023 09:26:18 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] autodate.sh: Allow alternative name for sed
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

It turns out that native sed on FreeBSD doesn't work well in
autodate.sh. GNU compatible sed can be specified by make/shell
variable SED.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/autodate.sh | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index b1db0ec166d8..1efdbdee5290 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -28,6 +28,7 @@ qqzbg="false"
 fn="autodate.tex"
 
 : ${DATE:=date}
+: ${SED:=sed}
 
 # check if we have tcolorbox
 tcolorbox_sty=`kpsewhich tcolorbox.sty`
@@ -77,24 +78,24 @@ else
 			esac
 			case "$description" in
 		Edition[.-][0-9]*)
-			ednum="`echo $description | sed -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
+			ednum="`echo $description | $SED -e 's/^Edition[.-]\([0-9]*\).*$/\1/'`"
 			release=`env printf '\\Ordinalstringnum{%s} %s' $ednum "$release"`
 			;;
 		esac
 		case "$description" in
 		*-rc[0-9]*)
-			rc="`echo $description | sed -e 's/^.*-rc\(.*\)$/\1/'`"
+			rc="`echo $description | $SED -e 's/^.*-rc\(.*\)$/\1/'`"
 			release="$release, Release Candidate $rc"
 			;;
 		esac
 		;;
 		*)
 			release=`env printf 'Tag: \\\texttt{%s}' "$description"`
-			commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
+			commitid=`echo $description | $SED -e 's/.*-\(g.*\)/\1/'`
 			;;
 		esac
 	else
-		description=`git log --max-count=1 | head -n 1 | sed -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
+		description=`git log --max-count=1 | head -n 1 | $SED -e 's/^commit \([0-9a-f]\{12\}\).*$/g\1/'`
 		release=`env printf 'Commit: \\\texttt{%s} (shallow clone)' "$description"`
 		commitid="$description"
 	fi
@@ -125,7 +126,7 @@ env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified >> $fn
 env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg >> $fn
 
 # command for newer tcolorbox (4.40 or later) to have backward-compatible skips
-tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
+tcbversion=`grep ProvidesPackage $tcolorbox_sty | $SED -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
 tcbold=4.39
 env printf '%% tcolorbox version: %s\n' $tcbversion >> $fn
 if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;

base-commit: 71129aa0193b4cd29bc59ac6f5ee22982f20901b
-- 
2.25.1

