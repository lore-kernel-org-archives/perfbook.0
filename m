Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=zjZknr5oxazsYFYKqamV2+fDytzDQGrAGtWnRoj1J+Q=;
 b=euc33yXbjmUfrcVZ5R+twoUDR+wpvqKBiU7FYHdT9Y4stU343NsKRjz0ghj4SMAfbO
 L2TFw0+m0VuxgxBgAjS7Cri0/ymKvGQzRsKJUFWPkS/UU6KsqgIwwQVtnBVBfnDGckrP
 ynM2JMpdTH03QRePUQxmGFx9rB0mHEvNpsQ3x9/RcRHv8vGdyZMMnaPm3oJERIg9NRJJ
 essFzhF1ZO0KVNi7ECLaAsuPoZGeg3u2A6XLisNJ6BaaIjc0fU8+irExDQkWdZZMIi5z
 ZWzKWbc0B0jSWKbvm5JB1XiCGBSmVbZqbdWgAxoK05eAsUBFGxDcbIVoZr0K+tndCxqk
 L2pw==
Subject: [PATCH v2 1/6] runlatex.sh: Refactor further
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eed95c0b-befe-4514-55d2-a64b03ab6f28@gmail.com>
Date: Tue, 14 Mar 2017 21:38:31 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a87bed749d870ce45fd7b328f4099a58271dfa20 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:42:39 +0900
Subject: [PATCH v2 1/6] runlatex.sh: Refactor further

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


