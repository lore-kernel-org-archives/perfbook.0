Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=i7vJY09hLJ+tVXcX/Evs8ond9QLvgOeeHxnCQVzZK34=;
 b=UAF9a9nTpp6zZZxPYDrmCiuxOvuUUqCw45u0VREYB5z43xBTB1NVfl9eq4JnURrqJd
 Zkgx7iBXwrCahxwGQJXmDy5rOmuEb5XEjP3TqfFex23k1RHNtQeavC99YCFiNpkj5wo1
 G4o0wqsXrnJFOklifkaKnsxjhCam9yS5RDFn+x2ttuqQzUep5zxsoCJDbKFWXOFwXaKB
 y8Qt2715RgkBJbA38crGR+spkpdZjCOyZ1siqQv8QxM47TRD0JNmUvTUTTag34dYwsy8
 W1KqUs8fpS1AowIPPw6vaROWUC2fd3r/TaEfB3GwBmjvH4d0Fr7XGYYU3VFYO7Ha1PYF
 CwUA==
Subject: [RFC PATCH 3/3] dohyphen2endash.sh: Use mktemp to create temp file
References: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e3aea57e-fa2d-5714-ceaf-03e55ee42a0f@gmail.com>
Date: Sat, 13 Aug 2016 12:41:54 +0900
MIME-Version: 1.0
In-Reply-To: <6ccb8aae-d3f1-9081-745c-a98ff8d2875c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a63dd50b648013af5780341f9c740bf9d9f6b65d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 13 Aug 2016 11:02:39 +0900
Subject: [RFC PATCH 3/3] dohyphen2endash.sh: Use mktemp to create temp file

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/dohyphen2endash.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/utilities/dohyphen2endash.sh b/utilities/dohyphen2endash.sh
index 05557f0..2a0fdc7 100644
--- a/utilities/dohyphen2endash.sh
+++ b/utilities/dohyphen2endash.sh
@@ -59,16 +59,16 @@ then
 	exit 1
 fi
 texfiles=`find . -name '*.tex' -print`
+tmpf=`mktemp`
 for i in $texfiles
 do
 	basename="${i%.tex}"
 #	echo $basename
-	sh ./utilities/hyphen2endash.sh $basename.tex > $basename.tmp
-	if diff -q $basename.tex $basename.tmp >/dev/null
+	sh ./utilities/hyphen2endash.sh $basename.tex > $tmpf
+	if ! diff -q $basename.tex $tmpf >/dev/null
 	then
-		rm $basename.tmp
-	else
 		echo "$basename.tex modified"
-		mv -f $basename.tmp $basename.tex
+		cp -f $tmpf $basename.tex
 	fi
 done
+rm -f $tmpf
-- 
1.9.1


