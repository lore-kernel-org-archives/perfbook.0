Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=auDAvfILk2tqgu8/iT1poJEKxh+LfiK+aChoLWr0gEw=;
        b=d6rS3Tj2scpr3LzDWk5hBtPKCqix9WHOvG83XXE0kl1Ku8K9FGdO90UioynUGeOJvi
         S384ntdsCmZWda2mZPGubB8rj/FvTuKm7EW7rjBuDy3Cc0qlBru4mGMWYpUktqkyztnt
         F/Vh2phwVIN/rQs+l6wpqhjZtODP+HLR8UkWXrLKa0ySuauB3OejXx6RIDQNuBtQKj7q
         qsWLoPO4RT/GwoyRs7D+9I0+ToAOZ58hYerB0E0amK3yO7v7VgxTz0Ck/k/OpLe6kfN2
         LhvDI/F59wj+JePJGSOp7ppiXSaeAroJKlgUNr4yRKHwBKdu5gY5Rk7eUO6FOmzYuBCq
         Mzig==
Subject: [PATCH -perfbook 09/11] periodcheck: Use counter to prevent false
 negatives
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <02fd2326-18f7-608e-663c-8c5bd5185cfa@gmail.com>
Date: Tue, 17 Aug 2021 19:37:11 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Assigning 1 to $safe in one rule can cause a false negative when there
is earlier match(es) to violation pattern(s) on the same input line.

By using a counter and incrementing/decrementing it on a particular
pattern-match, such false negatives can be prevented.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 37 +++++++++++++++++--------------------
 utilities/periodcheck.pl   | 22 +++++++++++-----------
 2 files changed, 28 insertions(+), 31 deletions(-)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 06d4928a..69497893 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -17,7 +17,7 @@ my $line;
 my $new_sentence = 1;
 my $line_num = 0;
 my $skip = 0;
-my $safe = 0;
+my $ng = 0;
 my $Verbatim_begin = qr/\\begin\{(Verbatim|tabula|equation|SaveVerb|verbbox)/ ;
 my $Verbatim_end = qr/\\end\{(Verbatim|tabula|equation|SaveVerb|verbbox)/ ;
 my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
@@ -44,56 +44,53 @@ sub check_line {
 	}
     }
     unless ($skip) {
-	$safe = 1;
+	$ng = 0;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\ref\{/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*\\pageref\{/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*\\lnref\{/) {
-	    $safe = 0;
+	    $ng += 1;
 	    if ($line =~ /or~\\lnref\{/ ||
 		$line =~ /item~\\ref\{/) {
-		$safe = 1;
+		$ng -= 1;
 	    }
 	}
-	if ($new_sentence == 1 &&
+	if ($new_sentence != 0 &&
 	    ($line =~ /^\s*\\cref/ || $line =~ /^\s*\\cpageref/ ||
 	     $line =~ /^\s*\\clnref/)) {
-	    $safe = 0;
+	    $ng += 1;
 	}
-	if ($line =~ /^\s*\\Cref/ || $line =~ /^\s*\\Cpageref/ ||
-	    $line =~ /^\s*\\Clnref/) {
-	    if ($new_sentence == 1) {
-		$safe = 1;
-	    } elsif ($new_sentence == 0) {
-		$safe = 0;
-	    }
+	if ($new_sentence == 0 &&
+	    ($line =~ /^\s*\\Cref/ || $line =~ /^\s*\\Cpageref/ ||
+	     $line =~ /^\s*\\Clnref/)) {
+	    $ng += 1;
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Cref/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Cpageref/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Clnref/) {
-	    $safe = 0;
+	    $ng += 1;
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*^\s*\\item\s+\\C/ ) {
-		$safe = 1;
+		$ng -= 1;
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*^\s*\\item\s+[a-z]/ ) {
-	    $safe = 0;
+	    $ng += 1;
 	}
 	if ($new_sentence) {
 	    if ($line =~ /^\s*`*[a-z]/ || $line =~ /^\s*\\acr/ ||
 		$line =~ /^\s*\\IX[^A\{]*\{[a-z]/ ) {
-		$safe = 0;
+		$ng += 1;
 	    }
 	}
 	if ($new_sentence == 2) { # after colon
 	    if ($line =~ /^\s*\([0-9a-z]+\)/ ) {
-		$safe = 0;
+		$ng += 1;
 	    }
 	}
 	if ($line =~ /^[ ]{8}/ ||  # indent by white speces (should be TAB)
 	    $line =~ /^(?=[\s]*+[^%])[^%][ ]+\t/) { # TAB after white space
-	    $safe = 0;
+	    $ng += 1;
 	}
-	unless ($safe) {
+	if ($ng) {
 	    print $ARGV[0], ':', $line_num, ':', $raw_line;
 	}
     }
diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index 9d1985d1..88fd59c0 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -26,7 +26,7 @@ my $line;
 my $next_line;
 my $line_num = 0;
 my $skip = 0;
-my $safe = 0;
+my $ng;
 my $Verbatim_begin = qr/\\begin\{(Verbatim|tabula|equation)/ ;
 my $Verbatim_end = qr/\\end\{(Verbatim|tabular|equation)/ ;
 my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
@@ -59,38 +59,38 @@ sub check_line {
 	$skip = 1;
     }
     unless ($skip) {
-	$safe = 1;
+	$ng = 0;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:][\)\}\']*$/ ||
 	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\)\']*[\.\?\!\:]\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ) {
-	    $safe = 0;
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?(f|fst)?\{.+\}[\)\']*[\.\?\!\:][\)\}\']*$/ ) {
+	    $ng += 1;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
 		$next_line =~ /\\item/ ||
 		$next_line =~ /\\E?QuickQuizAnswer[BEM]?\{/ ||
 		$next_line =~ /\\E?QuickQuizEnd[BEM]?/ ||
 		$next_line =~ /\\end\{(quot|enum|item|sequ)/ ) {
-		$safe = 1;
+		$ng -= 1;
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+[^%]/ ||
 #	    $line =~ /^(?=[\s]*+[^%])[^%]*.*\.[\)\}\']*\s+[^%]/ ||  # Uncomment for full check
 	    $line =~ /^(?=[\s]*+[^%])[^%]*.*:[\)\}\']*\s+[^%]/ ) {
-	    $safe = 0;
+	    $ng += 1;
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z][\)\}\']*[\.\?\!][\)\}\']*\s+\\\\/ ||
 		$line =~ /^(?=[\s]*+[^%])[^%]*.*[\.:][\)\}\']*\s+\\\\/ ) {
-		$safe = 1;
+		$ng -= 1;
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
-	    $safe = 0;
+	    $ng += 1;
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*~\(\\cite/) {
-		$safe = 1;
+		$ng -= 1;
 	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^%]/){
-	    $safe = 0;
+	    $ng += 1;
 	}
-	unless ($safe) {
+	if ($ng) {
 	    print $ARGV[0], ':', $line_num, ':', $line_raw;
 	}
     }
-- 
2.17.1


