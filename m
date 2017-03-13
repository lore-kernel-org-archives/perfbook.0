Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=IDUoR9eMkXLR7P1fB/RgCWe8E2apMrgOgHgv7I3LE1I=;
 b=PnVGrImfsn93DJ1oxXzjIVKADo1PG8HPnE60CQ2cSiO0Pow0e05XfN98tVzO7nqxju
 /rz0K0rhdpPa5CrnGnOYMb+dPf7L1g4cJXD4iXZlu4sfY4/4f2Im9+yxi4XSp5mzcRU4
 HZGuLjZGyiko9nKO6/ZsdVDepwyKiZ/0N4MqGb4TmBnZ7kx2k1kds0KlLx/lCWW48Ez/
 qxxob0xGa5kNBO6Ewg/GX9mDSfIMolb4luqZPaMuwdQ9HjPzSkrejGSnKK5ztR7F0MI1
 vmCicekH66VFKd+G7bmYwCAvy1gMOmHakE04eRVCoIIFrP4aWrVzlZOS1DBHgyMeILtO
 Y1sw==
Subject: [PATCH 1/6] runlatex.sh: Refactor further
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <313de5a1-d8d9-66c0-0911-06927fa70283@gmail.com>
Date: Tue, 14 Mar 2017 07:44:47 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a87bed749d870ce45fd7b328f4099a58271dfa20 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:42:39 +0900
Subject: [PATCH 1/6] runlatex.sh: Refactor further

This won't result in reducing line count, but is worth doing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index e6b3938..cece545 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -39,6 +39,17 @@ diff_warning () {
 	fi
 }

+identical_warnings () {
+	if test -r $basename-warning-prev.log
+	then
+		if test "$iter" -gt "$min_iter" && diff_warning
+		then
+			return 0 ;
+		fi
+	fi
+	return 1 ;
+}
+
 iterate_latex () {
 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
 	if grep -q '! Emergency stop.' $basename.log
@@ -76,27 +87,23 @@ rm -f $basename-first.log
 iter=2
 echo "pdflatex 2 for $basename.pdf # for possible bib update"
 iterate_latex
+min_iter=2
 while grep -q 'LaTeX Warning: There were undefined references' $basename.log
 do
-	if test -r $basename-warning-prev.log
+	if identical_warnings
 	then
-		if test "$iter" -gt 2 && diff_warning
-		then
-			break
-		fi
+		break
 	fi
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter for $basename.pdf # remaining undefined refs"
 	iterate_latex
 done
+min_iter=3
 while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
 do
-	if test -r $basename-warning-prev.log
+	if identical_warnings
 	then
-		if test "$iter" -gt 3 && diff_warning
-		then
-			break
-		fi
+		break
 	fi
 	iter=`expr $iter + 1`
 	echo "pdflatex $iter for $basename.pdf # label(s) may have changed"
-- 
2.7.4


