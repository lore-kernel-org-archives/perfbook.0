Return-Path: <SRS0=g3Xn=UV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hsGvfdbcTbGkiMR8BuEM9xa9jY46DiHZVbnwDPdVfSY=;
        b=bSlTaiomNMlCAmdcnzS7+Dc+0mDTyU3oR7ZLr7gT9pBQnUYxQnyQjcN6hDzoVj1WyW
         5m/zEUOfYlj2MXLcT55H+/t1HbInKMP9PHUjQbuw7HWnOzyu4jDVe9yUXW000jl3T6mf
         V+7XuFSPIfv8TEbZdPCxl6oTaTu9pwAVX2hlO/S88ffg5FRsSKfySrgtSHNSkQUrN/o8
         ZKahnlOWJzQTCWhgdKIbiYn+QNvsNWPHOxFWB92V+YvluYIRthUl0qjHpxhA3HInJEUd
         O2QVfvKFKenHs1AXAB0uvFjMWRT0KxhnK4yivDCI4cKrhxO8RthNgkKGSDZQ1+IICfip
         Yylw==
Message-ID: <7199ab73-3c5b-9baf-1c1c-070bfdba28d5@gmail.com>
Date: Mon, 11 Apr 2022 17:05:11 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 7/7] runlatex.sh: Align status report messages
Content-Language: en-US
References: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b756ba87-3fd3-1865-d8c0-3fb0ba45966b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In parallel builds, status-report messages from different length
PDF file names look jagged.

Align those messages by using the "printf" command and left-adjusting
the file names in a 19 character field.

Improved messages from later iterations (make -j3 2c 1cnq ebsfnq):

    ...
    pdflatex 3 for perfbook.pdf        # remaining undefined refs
    pdflatex 3 for perfbook-1cnq.pdf   # remaining undefined refs
    pdflatex 3 for perfbook-ebsfnq.pdf # remaining undefined refs
    pdflatex 4 for perfbook.pdf        # label(s) may have changed
    pdflatex 4 for perfbook-1cnq.pdf   # label(s) may have changed
    pdflatex 4 for perfbook-ebsfnq.pdf # label(s) may have changed
    'perfbook.pdf' is ready.
    'perfbook-1cnq.pdf' is ready.
    'perfbook-ebsfnq.pdf' is ready.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index b7d553ab..d4c9baf8 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -110,6 +110,7 @@ then
 fi
 
 basename=`echo $1 | sed -e 's/\.tex$//'`
+pdfname=`env printf "%-19s" $basename.pdf`
 
 if ! test -r $basename-first.log
 then
@@ -118,7 +119,7 @@ then
 	iter=1
 else
 	rm -f $basename-first.log
-	echo "$LATEX 2 for $basename.pdf # for possible bib update"
+	echo "$LATEX 2 for $pdfname # for possible bib update"
 	iter=2
 fi
 iterate_latex
@@ -135,7 +136,7 @@ do
 		break
 	fi
 	iter=`expr $iter + 1`
-	echo "$LATEX $iter for $basename.pdf # remaining undefined refs"
+	echo "$LATEX $iter for $pdfname # remaining undefined refs"
 	undefined_refs=1
 	iterate_latex
 done
@@ -147,7 +148,7 @@ do
 		break
 	fi
 	iter=`expr $iter + 1`
-	echo "$LATEX $iter for $basename.pdf # label(s) may have changed"
+	echo "$LATEX $iter for $pdfname # label(s) may have changed"
 	iterate_latex
 done
 exerpt_warnings
-- 
2.25.1


