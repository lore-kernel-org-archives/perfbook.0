Return-Path: <SRS0=/5BA=2T=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kqs+vu+nMla6eZxrQdIA4LvwmnHMqLQHFIj7JcoazdU=;
        b=nsyaujTT9k5fpM/QRY6tZSnzBD0QnZIhtY83SSS1A53h2mMSUukPxEJe3M/bNzIe2L
         BWQ0JLFuZBpz8fxxJ8S0u/RpY8kqxPpeTZWfEK0Slk1DoqUxRM4V7jV1puBC2JptUbnU
         V+z5+JPA791lmsXoQNf4xcbm10uyTDqDe6uKXDHUU1PseU0kgRu/MHEVReOebjgm27e6
         CbLJRIenNfm2ZODfmus9QBPYMIhbWi1V6Y1j0vMU2fkS47OCpV+DDrABdZRn1fLgJtkK
         vc9xGq6ZtpxTg8XtMsYZDKvKbjRIB3Xmxk4hlL2blPsWY4qxew/5q0nhagDEancYXwzc
         7mfg==
Subject: [PATCH 3/3] utilities/autodate: Put commit-id in footer by
 'draftwatermark'
References: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6c028454-d84f-d32c-35ad-16c8df966482@gmail.com>
Date: Sun, 29 Dec 2019 19:26:28 +0900
MIME-Version: 1.0
In-Reply-To: <861d7415-b129-5d98-b28c-1988bc2359a4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8575d3513dc813b9ede20a8aa4629826b8028343 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Dec 2019 17:51:53 +0900
Subject: [PATCH 3/3] utilities/autodate: Put commit-id in footer by 'draftwatermark'

A similar footer should be able to be typeset on every page by
a LaTeX package "fancyhdr", but I have not figured out a way to do
so reliably on Chapter pages.

A Release/Edition will have the release/edition tag name instead.

Also update FAQ-BUILD.txt to mention the possible version mismatch
of draftwatermark.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt         | 6 ++++--
 perfbook.tex          | 8 ++++++++
 utilities/autodate.sh | 6 ++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 4fb85e7a..f5066798 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -178,10 +178,11 @@
 			tlmgr install newtx
 
 10.	Building perfbook fails with a warning of buggy cleveref/listings
-	or version mismatch of titlesec. What can I do?
+	or version mismatch of titlesec/draftwatermark. What can I do?
 
 	A.	They are known issues on Ubuntu Xenial (titlesec),
-		Ubuntu Bionic (cleveref), and TeX Live 2014/2015 (listings).
+		Ubuntu Bionic (cleveref), TeX Live 2014/2015 (listings),
+		and TeX Live releases prior to 2015 (draftwatermark).
 		This answer assumes Ubuntu, but it should work on other
 		distros.
 
@@ -189,6 +190,7 @@
 		http://mirrors.ctan.org/macros/latex/contrib/titlesec.zip
 		http://mirrors.ctan.org/macros/latex/contrib/cleveref.zip
 		http://mirrors.ctan.org/macros/latex/contrib/listings.zip
+		http://mirrors.ctan.org/macros/latex/contrib/draftwatermark.zip
 
 	    2.	Install it by following instructions at:
 		https://help.ubuntu.com/community/LaTeX#Installing_packages_manually
diff --git a/perfbook.tex b/perfbook.tex
index 73b79205..0fae78fb 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -60,6 +60,14 @@
 \usepackage{threeparttable}
 \usepackage{titlesec}[2016/03/21] % Suppress number in paragraph heading
 \usepackage{fmtcount}
+\usepackage{draftwatermark}[2015/02/19]
+\SetWatermarkAngle{0.0}
+\SetWatermarkFontSize{8pt}
+\SetWatermarkScale{1.0}
+\SetWatermarkLightness{.6}
+\SetWatermarkHorCenter{.85\paperwidth}
+\SetWatermarkVerCenter{.95\paperheight}
+\SetWatermarkText{\texttt{\commitid}}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
diff --git a/utilities/autodate.sh b/utilities/autodate.sh
index 2ebc0754..a954bbe7 100644
--- a/utilities/autodate.sh
+++ b/utilities/autodate.sh
@@ -30,6 +30,7 @@ then
 	date_str=`date -R`
 	modified=""
 	release=""
+	commitid=""
 else
 	date_str=`git show --format="%cD" | head -1`
 	# check if git status is clean
@@ -44,12 +45,15 @@ else
 	case "$description" in
 	*-g*)
 		release=`env printf 'Commit: \\\texttt{%s}' "$description"`
+		commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
 		;;
 	v*)
 		release="Release $description"
+		commitid=$description
 		;;
 	Edition*)
 		release="Edition"
+		commitid=$description
 		case "$description" in
 		*P*)
 			release="Print $release"
@@ -70,6 +74,7 @@ else
 		;;
 	*)
 		release=`env printf 'Tag: \\\texttt{%s}' "$description"`
+		commitid=`echo $description | sed -e 's/.*-\(g.*\)/\1/'`
 		;;
 	esac
 fi
@@ -83,3 +88,4 @@ fi
 
 env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified
 env printf '\\newcommand{\\commityear}{%s}\n' $year
+env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified
-- 
2.17.1


