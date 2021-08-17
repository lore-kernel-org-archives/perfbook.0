Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RXFNUS/02ZgAKwETfzc/ENNmpDEZIud1hS9JglGYqDU=;
        b=HILCWMNhfIeahI0sMRs7eWhJzN93FBItL7Rawr1vOdR04tkHw0j8EqrVlHaVNeBG1E
         iDPr2Z/UBIm9BsBTeCCcx/mceI9SydnP48iirpUhfBiAg1UKcvxdAPILMEoSQQrabF2E
         0CM/vnob7pf2NAxsQrCgN1sE/aCjoOOw2ieorGdyl4xA9FqBQ0ZERytGUOxWmYccYgjO
         aRMxmyKYCeq/8x/i+EhGGkmpO+mye8/iBNHcUttrMXD6lyoAKbxnhx+FJuuaF2BzPh6Q
         trxKe8eU5gSb95BMcwpCUsFjvtYEnJQfGxkBYwT0e9fcmZC9tY4FT30LPPFs99aRflRm
         hVxQ==
Subject: [PATCH -perfbook 08/11] periodcheck: Improve regex
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e66a446c-d4fa-e52a-de12-9e81e0ab2cf5@gmail.com>
Date: Tue, 17 Aug 2021 19:35:43 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add patterns to catch end-of-sentence punctuation marks in front
of quotation marks and/or parentheses.

Also add patterns to treat lines ending with "\\" as exceptions.

Add autodate.tex to the exception list in periodcheck.sh.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/periodcheck.pl | 17 +++++++++++------
 utilities/periodcheck.sh |  1 +
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index f46052c5..9d1985d1 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -60,9 +60,9 @@ sub check_line {
     }
     unless ($skip) {
 	$safe = 1;
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!\:][\)\}\']*$/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!\:]\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}[\.\?\!\:][\)\}\']*$/ ) {
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:][\)\}\']*$/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:]\\footnote/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ) {
 	    $safe = 0;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
 		$next_line =~ /\\item/ ||
@@ -72,9 +72,14 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z\}][\.\?\!][\)\}\']*\s[^\\]+/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*.*:[\)\}\']*\s[^\\]+/) {
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+[^%]/ ||
+#	    $line =~ /^(?=[\s]*+[^%])[^%]*.*\.[\)\}\']*\s+[^%]/ ||  # Uncomment for full check
+	    $line =~ /^(?=[\s]*+[^%])[^%]*.*:[\)\}\']*\s+[^%]/ ) {
 	    $safe = 0;
+	    if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+\\\\/ ||
+		$line =~ /^(?=[\s]*+[^%])[^%]*.*[\.:][\)\}\']*\s+\\\\/ ) {
+		$safe = 1;
+	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
 	    $safe = 0;
@@ -82,7 +87,7 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^\s%]+/){
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^%]/){
 	    $safe = 0;
 	}
 	unless ($safe) {
diff --git a/utilities/periodcheck.sh b/utilities/periodcheck.sh
index d6cd7510..4fff091b 100755
--- a/utilities/periodcheck.sh
+++ b/utilities/periodcheck.sh
@@ -11,6 +11,7 @@ do
 	./glsdict.tex) ;;
 	./origpub.tex) ;;
 	./contrib.tex) ;;
+	./autodate.tex) ;;
 	./future/HTMtable*) ;;
 	./appendix/styleguide*) ;;
 	*) tex_sources="$tex_sources $f" ;;
-- 
2.17.1


