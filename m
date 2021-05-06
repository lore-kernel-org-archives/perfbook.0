Return-Path: <SRS0=jSvE=KB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cfm/tX33tU8IVSATrqCsf4ILo1xF3SCxaXjar5iQLsA=;
        b=vZ+5cFzgl7m3nJK62lwh7M36tu1fzh5Hdb+jsArmNlqTjGs/tqOuFQZf4DGs4LGjEK
         zro9t4rXq/fJn+CedFPINl3EP00e4dtkQdAnq29z3g+acueX7ZFTR5cIncPmGI4Wh78j
         oEHwRS84RKSZuZD5k5EJeJCpvtQ1YuJM6xQi6yYvrNG/6XjEI+HHWBIbdBs1QPGqT2oL
         EgbT67pHybqZkIXbHXe+rdZIP3WoXmRnFv4vyJggCaeTa3nnhmwVUfT2INm788UUZCWT
         p9AjLivqrw0cR9hKb5WSK4FjngZoH632NYnf/vrR6ZMMV/v52m0hS20tcNsty16U/9bj
         GaXQ==
Subject: [PATCH -perfbook 1/4] cleverefcheck: Add check script of cleveref
 macro usage
References: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <028c65b9-6cad-2803-c929-9fd73837e90f@gmail.com>
Date: Thu, 6 May 2021 23:23:50 +0900
MIME-Version: 1.0
In-Reply-To: <9fabe167-7282-e0c0-affa-1ae11acee698@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Now that end-of-sentence periods are at the end of input lines,
we can check the distinction of \Cref{} and \cref{} and their variants.
Add a set of scripts to do the check.

Raw uses of \ref{} and \lnref{} are also detected.

Exception:
o Patterns "or~\lnref{foo}" and "item~\ref{bar}" are ignored.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 96 ++++++++++++++++++++++++++++++++++++++
 utilities/cleverefcheck.sh | 23 +++++++++
 2 files changed, 119 insertions(+)
 create mode 100755 utilities/cleverefcheck.pl
 create mode 100755 utilities/cleverefcheck.sh

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
new file mode 100755
index 00000000..963b055a
--- /dev/null
+++ b/utilities/cleverefcheck.pl
@@ -0,0 +1,96 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Check LaTeX source of cleveref macros usages
+#
+# Assumptions:
+#    End-of-sentence fullstops are at the end of input lines.
+#
+# Copyright (C) Akira Yokosawa, 2021
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+my $new_sentence = 1;
+my $line_num = 0;
+my $skip = 0;
+my $safe = 0;
+my $Verbatim_begin = qr/\\begin\{Verbatim/ ;
+my $Verbatim_end = qr/\\end\{Verbatim/ ;
+my $tabular_begin = qr/\\begin\{tabula/ ;
+my $tabular_end = qr/\\end\{tabula/ ;
+my $label_ptn = qr/(^\s*|\{)(,?[a-z]{3,4}:([a-zMPS]+:)?[^\},]+)(\}|,)/ ;
+
+sub check_line {
+    my $raw_line = $line;
+    $line =~ s/\\%/pct/g ;
+    if ($line =~ /$Verbatim_begin/ ||
+	$line =~ /$tabular_begin/) {
+	$skip = 1;
+    }
+    unless ($skip) {
+	$safe = 1;
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*\\ref\{/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*\\pageref\{/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*\\lnref\{/) {
+	    $safe = 0;
+	    if ($line =~ /or~\\lnref\{/ ||
+		$line =~ /item~\\ref\{/) {
+		$safe = 1;
+	    }
+	}
+	if ($new_sentence &&
+	    ($line =~ /^\s*\\cref/ || $line =~ /^\s*\\cpageref/ ||
+	     $line =~ /^\s*\\clnref/)) {
+	    $safe = 0;
+	}
+	if ($line =~ /^\s*\\Cref/ || $line =~ /^\s*\\Cpageref/ ||
+	    $line =~ /^\s*\\Clnref/) {
+	    if ($new_sentence) {
+		$safe = 1;
+	    } else {
+		$safe = 0;
+	    }
+	}
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Cref/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Cpageref/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[^\s]+\s*\\Clnref/) {
+	    $safe = 0;
+	    if ($line =~ /^(?=[\s]*+[^%])[^%]*^\s*\\item\s+\\C/ ) {
+		$safe = 1;
+	    }
+	}
+	unless ($safe) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line;
+	}
+    }
+    if ($line =~ /$Verbatim_end/ ||
+	$line =~ /$tabular_end/) {
+	$skip = 0;
+	$new_sentence = 1;
+    } else {
+	unless ($line =~ /\\begin\{fcvref\}/ || $line =~ /\\end\{fcvref\}/ ||
+	    $line =~ /^\s*\}\s*$/ || $line =~ /^\s*%/) {
+	    if ($line =~ /^(?=[\s]*+[^%])[^%]*[\.\?!:]\s*[\)\}]*$/ ||
+		$line =~ /^(?=[\s]*+[^%])[^%]*[\.\?!:]\s*[\)\}]*%.*$/ ||
+		$line =~ /^\s*$/ || $line =~ /^\\paragraph\{/ ||
+		$line =~ /^\s*\\begin\{/ || $line =~ /^\s*\\end\{/ ||
+		$line =~ /^\\E?QuickQuiz/ || $line =~ /\\E?QuickQuizAnswer[BEM]?\{/ ) {
+		$new_sentence = 1;
+	    } else {
+		$new_sentence = 0;
+	    }
+	}
+    }
+}
+
+open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
+    or die "Could not open file '$ARGV[0]' $!";
+
+while($line = <$fh>) {
+    $line_num++ ;
+    check_line();
+}
diff --git a/utilities/cleverefcheck.sh b/utilities/cleverefcheck.sh
new file mode 100755
index 00000000..6ff9f695
--- /dev/null
+++ b/utilities/cleverefcheck.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+tex_sources_all=`find . -name "*.tex" -print`
+tex_sources=""
+
+for f in $tex_sources_all
+do
+	case $f in
+	./perfbook*) ;;
+	./qqz*) ;;
+	./glsdict.tex) ;;
+	./origpub.tex) ;;
+	./contrib.tex) ;;
+	./future/HTMtable*) ;;
+	./appendix/styleguide*) ;;
+	*) tex_sources="$tex_sources $f" ;;
+        esac
+done
+
+for g in $tex_sources
+do
+	utilities/cleverefcheck.pl $g
+done
-- 
2.17.1


