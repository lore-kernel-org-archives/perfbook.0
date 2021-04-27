Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a52kAs2L5JjdXjfMbkha53BEx8h2w985mErILHnpOoY=;
        b=nmxsiAm40qWvAoUN9uCL8BzqHpVn8YYBCRfVWehJyDOgw30u6KPL+ccYBXCEat1pBt
         5m3nXT5VpsiADD4mXLIY/wUyCoA907hC6s98s4lMyOSjeb7j78od41Xbg6K+o94/49KB
         ysFGBERLm/UIK9gKT6dGEHs+TlaYJH+DzQe77aZFiZGisX/kOlPC0Xy846tFoiWfB5kM
         sUbhonUucZ5p5+jAlaS17oyuEc+wnVv2OfTCZFiYMRCMax6ldYaDGMpfjrDdZCWW49Kt
         jaDLCwbmpvG+gAinefaPQB8+LhPJuPfbn8jGGdqdMtWkrbzpL1NmiP8WbOqFMh1ZoW0R
         gqDQ==
Subject: [PATCH -perfbook v2 2/9] periodcheck: Add script to check missing
 annotation of period
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9443f8a9-cd0e-63c2-2f78-549b39dda9db@gmail.com>
Date: Wed, 28 Apr 2021 00:22:52 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

"make periodcheck" will do the check.

NOTE: Possible false negative/positive as of this commit:
o   A mid-sentence period is ignored when the line matches "\label{"
    or "\*ref{" pattern. It should be caught when it is outside a
    macro.
o   \cref{} can have comma-separated multiple labels as an argument.
    When one of the labels has a mid-sentence period and on a
    subsequent line in the input, it is not ignored.
o   \crefrange{}{} can also have a label string on a subsequent line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                 |  5 ++-
 utilities/periodcheck.pl | 76 ++++++++++++++++++++++++++++++++++++++++
 utilities/periodcheck.sh | 20 +++++++++++
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100755 utilities/periodcheck.pl
 create mode 100755 utilities/periodcheck.sh

diff --git a/Makefile b/Makefile
index 4beb2c17..ea264dc5 100644
--- a/Makefile
+++ b/Makefile
@@ -192,7 +192,7 @@ BASE_DEPENDS := perfbook.tex $(foreach v,tcb 1c msns mss mstx msr msn msnt sf nq
 .PHONY: qq perfbook-qq.pdf qqmsg
 .PHONY: help help-official help-full help-semiofficial help-paper help-draft
 .PHONY: help-experimental help-prefixed
-.PHONY: paper-clean
+.PHONY: paper-clean periodcheck
 
 all: $(targ)
 
@@ -611,5 +611,8 @@ ls-unused:
 neatfreak: distclean
 	find . -name '*.pdf' | xargs rm -f
 
+periodcheck:
+	utilities/periodcheck.sh
+
 .SECONDEXPANSION:
 $(ABBREVTARGETS): %: perfbook-$$@.pdf
diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
new file mode 100755
index 00000000..225391ff
--- /dev/null
+++ b/utilities/periodcheck.pl
@@ -0,0 +1,76 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Check LaTeX source of mid-sentence and end-of-sentence period
+#
+# Assumptions:
+#    End-of-sentence periods are at the end of input lines.
+#
+# Exceptions:
+#    LaTeX comments
+#    LaTeX labels: such as \cref{fig:xxx:foo vs. bar}
+#    Verbatim contents
+#    Table contents
+#
+# Copyright (C) Akira Yokosawa, 2021
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+my $next_line;
+my $line_num = 0;
+my $skip = 0;
+my $safe = 0;
+my $Verbatim_begin = qr/\\begin\{Verbatim/ ;
+my $Verbatim_end = qr/\\end\{Verbatim/ ;
+my $tabular_begin = qr/\\begin\{tabula/ ;
+my $tabular_end = qr/\\end\{tabula/ ;
+
+sub check_line {
+    if ($line =~ /$Verbatim_begin/ ||
+	$line =~ /$tabular_begin/) {
+	$skip = 1;
+    }
+    unless ($skip) {
+	$safe = 1;
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[A-Z]\.$/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[A-Z]\.\\footnote/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]cr\{.+\}\.$/ ||
+	    $line =~ /^(?=[\s]*+[^%])[^%]*[Aa]crm\{.+\}\.$/) {
+	    $safe = 0;
+	    if ($next_line =~ /^\s*$/ || $next_line =~ /^\s*%/ ||
+		$next_line =~ /\\item/ || $next_line =~ /\\end\{quot/ ||
+		$next_line =~ /\\end\{enum/ || $next_line =~ /\\end\{item/) {
+		$safe = 1;
+	    }
+	}
+	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z\}]\.\s[^\\]+/) {
+	    $safe = 0;
+	    if ($line =~ /ref\{/ || $line =~ /label\{/) {
+		$safe = 1;
+	    }
+	}
+	unless ($safe) {
+	    print $ARGV[0], ':', $line_num, ':', $line;
+	}
+    }
+    if ($line =~ /$Verbatim_end/ ||
+	$line =~ /$tabular_end/) {
+	$skip = 0;
+    }
+}
+
+open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
+    or die "Could not open file '$ARGV[0]' $!";
+
+$line = <$fh>;
+$line_num = 1;
+while($next_line = <$fh>) {
+    check_line();
+    $line = $next_line;
+    $line_num++ ;
+}
+check_line();
diff --git a/utilities/periodcheck.sh b/utilities/periodcheck.sh
new file mode 100755
index 00000000..a56657f3
--- /dev/null
+++ b/utilities/periodcheck.sh
@@ -0,0 +1,20 @@
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
+	./future/HTMtable*) ;;
+	./appendix/styleguide*) ;;
+	*) tex_sources="$tex_sources $f" ;;
+        esac
+done
+
+for g in $tex_sources
+do
+	utilities/periodcheck.pl $g
+done
-- 
2.17.1


