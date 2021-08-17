Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WEjMpyovbhWrVwNDVUrv6hAovAAG6v+UPD/PU2W01rw=;
        b=gj22OQwp2y2AfzHGaPnfC4YlTGR6Ysl5Fheq9J2Lc+GSMR9SK2kkbpBZso7sUuO2oU
         vXZGCqXPTRPr5vKXzFZFF/clCFr26tALaqxa6UnX144LH8DQDdRFHD6cqVGFZ1plu0an
         5qCG5o4xSTrN+hx+aFKiDdfLqZ/sEDjJCY7nXnVUK90+68gMLlU7lhxjqY35sJA/eBxj
         5KTDu5R1bazHK2KUdu22ncwB6DOK4urFReF2sEYfH6SIYiEEF9i8krUFBEmPMzV7M/UW
         bLDt37wn4g/rdywbm/eKJXgfDElx3pGGR4AGzzgJ8RcT3fw0ItqzzmqZiDKTx30gl43J
         7tKw==
Subject: [PATCH -perfbook 06/11] periodcheck: Add colon-related checks
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5ba9d541-66d4-aefa-9de5-26cb54e77cbd@gmail.com>
Date: Tue, 17 Aug 2021 19:29:23 +0900
MIME-Version: 1.0
In-Reply-To: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Excerpt of Paul's message:

    > If you have some preference, I can update the scripts to enforce
    > it.

    In this case, I prefer the simple British approach to that of my
    homeland, so please unconditionally capitalize after a colon.

    (Instead of the American approach of doing so only if the word following
    the colon begins a complete sentence, which is not something I want to
    be checking manually, let alone via a script!)

This means colons should always come at the end of LaTeX source lines.
Adding ":" to the existing regex in the check scripts can catch
violations to this convention.

As colons can lead a numbered list of sentences/clauses/phrases,
a colon-specific pattern is also added in cleverefcheck.pl.

Also add a couple of filters to ignore arguments of LaTeX macros
such as \caption{}, \paragraph{}, and \co{}.
Also add a pattern to ignore arguments of \QuickQuizChapter and
\OriginalPublished as these macros can't be broken in-between.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 25 +++++++++++++++++------
 utilities/periodcheck.pl   | 42 +++++++++++++++++++++-----------------
 2 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 87b373f2..c59e42d1 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -36,6 +36,13 @@ sub check_line {
 	    $line =~ s/$quoted_2//;
 	}
     }
+    if ($line =~ /\\[tq]?co\{([^\}]+)\}/) {# remove \co{} argument
+	while ($line && $line =~ /((\\[tq]?co\{)[^\}]+)\}/) {
+	    my $quoted_1 = quotemeta $1;
+	    my $quoted_2 = quotemeta $2;
+	    $line =~ s/$quoted_1/$quoted_2/;
+	}
+    }
     unless ($skip) {
 	$safe = 1;
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\ref\{/ ||
@@ -54,9 +61,9 @@ sub check_line {
 	}
 	if ($line =~ /^\s*\\Cref/ || $line =~ /^\s*\\Cpageref/ ||
 	    $line =~ /^\s*\\Clnref/) {
-	    if ($new_sentence) {
+	    if ($new_sentence == 1) {
 		$safe = 1;
-	    } else {
+	    } elsif ($new_sentence == 0) {
 		$safe = 0;
 	    }
 	}
@@ -68,8 +75,14 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
-	if ($new_sentence == 1) {
-	    if ($line =~ /^\s*[a-z]/ ) {
+	if ($new_sentence) {
+	    if ($line =~ /^\s*`*[a-z]/ || $line =~ /^\s*\\acr/ ||
+		$line =~ /^\s*\\IX[^A\{]*\{[a-z]/ ) {
+		$safe = 0;
+	    }
+	}
+	if ($new_sentence == 2) { # after colon
+	    if ($line =~ /^\s*\([0-9a-z]\)[\s~][a-z]/ ) {
 		$safe = 0;
 	    }
 	}
@@ -87,14 +100,14 @@ sub check_line {
 	unless ($line =~ /\\begin\{fcvref\}/ || $line =~ /\\end\{fcvref\}/ ||
 		$line =~ /^\s*\}\s*$/ || $line =~ /^\s*%/) {
 	    if ($line =~ /^(?=[\s]*+[^%])[^%]*[\.\?!]\s*[\)\}\']*\s*(%.*)?$/ ||
-		$line =~ /^\s*$/ ||
+		$line =~ /^\s*$/ || $line =~ /\\begin\{quote\}/ ||
 		$line =~ /^\\E?QuickQuiz[BEM]?\{/ ||
 		$line =~ /\\E?QuickQuizAnswer[BEM]?\{/ ) {
 		$new_sentence = 1;
 	    } else {
 		$new_sentence = 0;
 		if ($line =~ /^(?=[\s]*+[^%])[^%]*:\s*[\)\}\']*\s*(%.*)?$/ ) {
-		    $new_sentence = 2;  # don't care
+		    $new_sentence = 2;  # colon
 		}
 	    }
 	}
diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index 6ad90dcb..f46052c5 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -27,10 +27,8 @@ my $next_line;
 my $line_num = 0;
 my $skip = 0;
 my $safe = 0;
-my $Verbatim_begin = qr/\\begin\{Verbatim/ ;
-my $Verbatim_end = qr/\\end\{Verbatim/ ;
-my $tabular_begin = qr/\\begin\{tabula/ ;
-my $tabular_end = qr/\\end\{tabula/ ;
+my $Verbatim_begin = qr/\\begin\{(Verbatim|tabula|equation)/ ;
+my $Verbatim_end = qr/\\end\{(Verbatim|tabular|equation)/ ;
 my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
 
 sub check_line {
@@ -42,23 +40,29 @@ sub check_line {
 	    $line =~ s/$quoted_2//;
 	}
     }
-    if ($line =~ /section\{([^\}]*)\}/ ) {
-	my $quoted_1 = quotemeta $1;
-	$line =~ s/$quoted_1//;
+    if ($line =~ /\\[tq]?co\{([^\}]*)\}/ ) {
+	while ($line && $line =~ /((\\[tq]?co\{)[^\}]+)\}/) {
+	    my $quoted_1 = quotemeta $1;
+	    my $quoted_2 = quotemeta $2;
+	    $line =~ s/$quoted_1/$quoted_2/;
+	}
+    }
+    # \QuickQuizChapter and \OriginalPublished don't allow line breaks in their
+    # arguments.
+    if ($line =~ /\\QuickQuizChapter\{/ ) {
+	$line = '\\QuickQuizChapter\{\}\{\}\{\}';
     }
-    if ($line =~ /caption\{([^\}]*)\}/ ) {
-	my $quoted_1 = quotemeta $1;
-	$line =~ s/$quoted_1//;
+    if ($line =~ /\\OriginallyPublished\{/ ) {
+	$line = '\\OriginallyPublised\{\}\{\}\{\}\{\}';
     }
-    if ($line =~ /$Verbatim_begin/ ||
-	$line =~ /$tabular_begin/) {  # exception (verbatim and tabular)
+    if ($line =~ /$Verbatim_begin/ ) {  # exception (verbatim ,tabular, equation)
 	$skip = 1;
     }
     unless ($skip) {
 	$safe = 1;
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!][\)\}\']*$/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!]\\footnote/ ||
-	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}[\.\?\!][\)\}\']*$/ ) {
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!\:][\)\}\']*$/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z][\.\?\!\:]\\footnote/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm?\{.+\}[\.\?\!\:][\)\}\']*$/ ) {
 	    $safe = 0;
 	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
 		$next_line =~ /\\item/ ||
@@ -68,7 +72,8 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z\}][\.\?\!][\)\}\']*\s[^\\]+/) {
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z\}][\.\?\!][\)\}\']*\s[^\\]+/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*.*:[\)\}\']*\s[^\\]+/) {
 	    $safe = 0;
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
@@ -77,15 +82,14 @@ sub check_line {
 		$safe = 1;
 	    }
 	}
-	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!][\)\}\']*\s+[^\s%]+/){
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\\@[\.\?\!\:][\)\}\']*\s+[^\s%]+/){
 	    $safe = 0;
 	}
 	unless ($safe) {
 	    print $ARGV[0], ':', $line_num, ':', $line_raw;
 	}
     }
-    if ($line =~ /$Verbatim_end/ ||
-	$line =~ /$tabular_end/) {
+    if ($line =~ /$Verbatim_end/ ) {
 	$skip = 0;
     }
 }
-- 
2.17.1


