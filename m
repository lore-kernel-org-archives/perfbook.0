Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nbPlvTd6mYGmyYacWpUxagSAECwgI6QaoG0iU7G1yxA=;
        b=tMRwX25hn1UFCZO+EXigAe04mWUbD1JqtE8mqLIMCWqx1ZKxRouDT/DH6+nQEJVUIU
         /tVNRFQr7MbsBquyFV/A9WG5tg5+3niBA9LT9N573z8iOr1bKmgSroLJSiZTPDnDaM8q
         1RhufyJiAJLnYDAZNuEN1hu1A6cdCdx7EGgFWkpaqB4AAbb0x2Syy9AtTI+R2a2UGLAI
         icyQfUlFyw0oEnPixVA9Hnmlosg5vnNoSm6yF14y9J5rTx/VPauW8WrPgiS6XNQdNA/K
         LWOpUZWYsbs0YxXQR4xIqCM2YkSJeLX4aygNRYaDvRl7VAYZl+/pkniE/ZArwBikLxEf
         vjlw==
Subject: [PATCH -perfbook v2 5/9] periodcheck: Replace escaped percent symbol
 first
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6f611262-b29b-73c4-b41c-aa3eb2934463@gmail.com>
Date: Wed, 28 Apr 2021 00:28:05 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

To prevent "\%" from being treated as a symbol of comment,
replace it with "pct" at the beginning of pattern matching.
(Source .tex files are not modified.)

Also improve regex of label string to cache "chp:foo bar".

Add some comments and do a couple of refactoring by using
(xxx|yyy) and "?" patterns.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/periodcheck.pl | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index 27871507..b1551c44 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -28,30 +28,30 @@ my $Verbatim_begin = qr/\\begin\{Verbatim/ ;
 my $Verbatim_end = qr/\\end\{Verbatim/ ;
 my $tabular_begin = qr/\\begin\{tabula/ ;
 my $tabular_end = qr/\\end\{tabula/ ;
-my $label_ptn = qr/(^|\{)(,?[a-z]{3}:[a-zMPS]+:[^\},]+)(\}|,)/ ;
+my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
 
 sub check_line {
     my $line_raw = $line;
-    if ($line =~ /$label_ptn/) {
+    $line =~ s/\\%/pct/g ;	# replace \% to prevent false negative
+    if ($line =~ /$label_ptn/) {# remove label string
 	while ($line && $line =~ /$label_ptn/) {
 	    my $quoted_2 = quotemeta $2;
 	    $line =~ s/$quoted_2//;
 	}
     }
     if ($line =~ /$Verbatim_begin/ ||
-	$line =~ /$tabular_begin/) {
+	$line =~ /$tabular_begin/) {  # exception (verbatim and tabular)
 	$skip = 1;
     }
     unless ($skip) {
 	$safe = 1;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z]\.$/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z]\.\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]cr\{.+\}\.$/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm\{.+\}\.$/) {
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}\.$/ ) {
 	    $safe = 0;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
-		$next_line =~ /\\item/ || $next_line =~ /\\end\{quot/ ||
-		$next_line =~ /\\end\{enum/ || $next_line =~ /\\end\{item/) {
+		$next_line =~ /\\item/ ||
+		$next_line =~ /\\end\{(quot|enum|item|sequ)/ ) {
 		$safe = 1;
 	    }
 	}
-- 
2.17.1


