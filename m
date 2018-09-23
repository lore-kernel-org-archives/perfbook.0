Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QPRE9ufImxGGd7SjcnH5bWkhA1acOnjDC8A3SMDSa3w=;
        b=tbpUVwAei+ObJ8cxQ6LkcKtgDg/dXx7V5Sz1cfsxvNRmXUr1B/FaHPMH2wleW5am4G
         oZBnfp5vCLDZNEozNzCL0ZTvgIZHGZQGYcoKVlwqNcZ5cchAsT0SfOFOtvoDsAnMaq8l
         hHlHjP/CGwkB4UgHx+nV/KvcJP+xwfjuAkoMBpf7jQ3ns4+gbI3CVYJVQTE6AbA9y2+x
         9gqyFo+dvmWMR1p94bCFyrZkmYDqwJT2ocw+wdF0+aTULoVzOmWdAfJejjlAjJe8Im1l
         yJctvDGFd3bs6WF24/T1lqT6lQnGx1KVHsmZQ0JQU+uze2bnZ3DDRxfQZSyWx7xKfkHI
         3/2g==
Subject: [PATCH 3/9] Add scripts and recipes to work around restriction of
 herdtools7
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9d00e376-df18-8951-7902-61966e0dcf00@gmail.com>
Date: Sun, 23 Sep 2018 16:26:31 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 124383d885da4117c390fd220d00a70231e7cc79 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 29 Aug 2018 20:55:38 +0900
Subject: [PATCH 3/9] Add scripts and recipes to work around restriction of herdtools7

It turned out that .litmus files do not have so much freedom
in placement of comments, and what words can appear in comments.

To work around the restriction, we need to add another route to
generate VerbatimL LaTeX sources (.fcv) from litmus tests (.litmus).

    .litmus -> .ltms
    .ltms   -> .fcv

In .litmus, we place a meta command to start a code snippet below
the line of "C foo-bar", which needs to be the first line in .litmus
file.

Also, as the "filter" and "exists" clause don't permit any comments
following the, we place a meta command to end a code snippet ahead
of the line of "exists" or "filter" clause.
And "{" and "}" in these meta commands sometimes cause error depending
on their positions. So we use the form of:

    \begin[snippet][option] -- \end[snippet]

in .litmus files.

For consistency, \lnlbl commands should be of the form of \lnlbl[bar].

NOTE:
    Comments of the form  "(* ... *)"  can not appear in C-language
    parts of litmus tests. The form of "//\lnlbl{bar}" is OK in
    C-language parts.

The reordering of these meta commands is handled by the new
script, utilities/reorder_ltms.pl. It also takes care of
"[" and "]" characters.

In summary, .litmus source should look like the following:

------------------------------------------------
C C-foo-bar
//\begin[snippet][labelbase=foo:bar,...]

{
}

[...]

    smp_mb(); //\lnlbl[fullbarrier]

[...]
}

//\end[snippet]
exists (1:r2=0 /\ 0:r2=0)
------------------------------------------------

This will result in a .ltms file:

------------------------------------------------
//\begin{snippet}[labelbase=foo:bar,...]
C C+foo-bar

{
}

[...]

    smp_mb(); //\lnlbl{fullbarrier}

[...]
}

exists (1:r2=0 /\ 0:r2=0)
//\end{snippet}
--- --- --- --- --- --- --- --- --- --- --- ---

.ltms -> .fcv conversion can be handled by the updated fcvextract.pl.

gen_snippet_d.pl and Makefile are updated accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .gitignore                 |  1 +
 Makefile                   | 17 +++++++--
 utilities/fcvextract.pl    |  4 +-
 utilities/gen_snippet_d.pl | 61 +++++++++++++++++++++++++++++-
 utilities/reorder_ltms.pl  | 92 ++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+), 6 deletions(-)
 create mode 100755 utilities/reorder_ltms.pl

diff --git a/.gitignore b/.gitignore
index dde8523..1a40230 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,6 +18,7 @@
 *.epsi
 *.svgi
 *.fcv
+*.ltms
 perfbook_flat.tex
 qqz.tex
 contrib.tex
diff --git a/Makefile b/Makefile
index 588274a..72865d7 100644
--- a/Makefile
+++ b/Makefile
@@ -83,7 +83,10 @@ A2PING_GSCNFL := 0
 endif
 endif
 
-SOURCES_OF_SNIPPET := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
+SOURCES_OF_SNIPPET_ALL := $(shell grep -r -l -F '\begin{snippet}' CodeSamples)
+SOURCES_OF_LITMUS      := $(shell grep -r -l -F '\begin[snippet]' CodeSamples)
+SOURCES_OF_LTMS        := $(patsubst %.litmus,&.ltms,$(SOURCES_OF_LITMUS))
+SOURCES_OF_SNIPPET     := $(filter-out $(SOURCES_OF_LTMS),$(SOURCES_OF_SNIPPET_ALL)) $(SOURCES_OF_LITMUS)
 GEN_SNIPPET_D  = utilities/gen_snippet_d.pl utilities/gen_snippet_d.sh
 
 default = $(PERFBOOK_DEFAULT)
@@ -126,7 +129,7 @@ $(PDFTARGETS:.pdf=.aux): $(LATEXGENERATED) $(LATEXSOURCES)
 autodate.tex: perfbook.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) utilities/fcvextract.pl
 	sh utilities/autodate.sh >autodate.tex
 
-perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG) $(FCVSNIPPETS)
+perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(TARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
 ifndef LATEXPAND
 	$(error --> $@: latexpand not found. Please install it)
 endif
@@ -266,6 +269,14 @@ $(FCVSNIPPETS):
 	@echo "$< --> $@"
 	utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
 
+$(FCVSNIPPETS_VIA_LTMS):
+	@echo "$< --> $@"
+	utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
+
+$(FCVSNIPPETS_LTMS):
+	@echo "$< --> $@"
+	utilities/reorder_ltms.pl $< > $@
+
 help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
 	@echo "  Full,              Abbr."
@@ -296,7 +307,7 @@ clean:
 	find . -name '*.aux' -o -name '*.blg' \
 		-o -name '*.dvi' -o -name '*.log' \
 		-o -name '*.qqz' -o -name '*.toc' -o -name '*.bbl' \
-		-o -name '*.fcv' | xargs rm -f
+		-o -name '*.fcv' -o -name '*.ltms' | xargs rm -f
 	rm -f perfbook_flat.tex perfbook*.out perfbook-*.tex
 	rm -f $(LATEXGENERATED)
 	rm -f $(SVG_LARGE_BITMAP:%.svg=%.pdf) $(PNGTARGETS_OF_SVG)
diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index 740d358..cb6869b 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -127,8 +127,8 @@ if ($src_file =~ /.*\.h$/ ) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
 } elsif ($src_file =~ /.*\.sh$/ ) {
     $lnlbl_re = qr!(.*?)(\s*#\s*)\\lnlbl\{(.*)}\s*$!;
-} elsif ($src_file =~ /.\.litmus$/ ) {
-    $lnlbl_re = qr!(.*?)(\s*\(\*\s*)\\lnlbl\{(.*)}\s*\*\)\s*$!;
+} elsif ($src_file =~ /.\.ltms$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
 } else {
     die ("unkown file suffix!");
 }
diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
index 4de733a..d8e3bc7 100755
--- a/utilities/gen_snippet_d.pl
+++ b/utilities/gen_snippet_d.pl
@@ -13,12 +13,17 @@ use strict;
 use warnings;
 
 my @fcvsources;
+my @fcvsources_ltms;
 my $snippet_key;
+my $snippet_key_ltms;
 my $source;
 
 $snippet_key = '\\begin\{snippet\}' ;
+$snippet_key_ltms = '\\begin\[snippet\]' ;
 @fcvsources = `grep -l -r -F $snippet_key CodeSamples` ;
+@fcvsources_ltms = `grep -l -r -F $snippet_key_ltms CodeSamples` ;
 chomp @fcvsources ;
+chomp @fcvsources_ltms ;
 
 print "# Do not edit!\n" ;
 print "# Generated by utilities/gen_snippet_d.pl.\n\n" ;
@@ -27,6 +32,9 @@ foreach $source (@fcvsources) {
     my @snippet_commands1 ;
     my $subdir ;
     my $snippet ;
+    if ($source =~ /\.ltms$/) {
+	next;
+    }
     @snippet_commands1 = `grep -F $snippet_key $source` ;
     chomp @snippet_commands1 ;
     $source =~ m!(.*/[^/]+)/[^/]+! ;
@@ -38,14 +46,40 @@ foreach $source (@fcvsources) {
 	print "\\\n\t$subdir/$_.fcv ";
     }
 }
+print "\nFCVSNIPPETS_VIA_LTMS = " ;
+foreach $source (@fcvsources_ltms) {
+    my @snippet_commands1 ;
+    my $subdir ;
+    my $snippet ;
+    @snippet_commands1 = `grep -F $snippet_key_ltms $source` ;
+    chomp @snippet_commands1 ;
+    $source =~ m!(.*/[^/]+)/[^/]+! ;
+    $subdir = $1 ;
+    foreach $snippet (@snippet_commands1) {
+	$snippet =~ /labelbase=.*:(.+:[^,\]]+)[,\]]/ ;
+	$_ = $1;
+	s/:/@/g ;
+	print "\\\n\t$subdir/$_.fcv ";
+    }
+}
+print "\nFCVSNIPPETS_LTMS = " ;
+foreach $source (@fcvsources_ltms) {
+    $_ = $source ;
+    s/\.litmus$/\.ltms/ ;
+    print "\\\n\t$_";
+}
 
-print "\n\nEXTRACT = utilities/fcvextract.pl\n\n" ;
+print "\n\nEXTRACT = utilities/fcvextract.pl\n" ;
+print "REORDER_LTMS = utilities/reorder_ltms.pl\n\n" ;
 
 foreach $source (@fcvsources) {
     my @snippet_commands2 ;
     my $src_under_sub ;
     my $subdir ;
     my $snippet ;
+    if ($source =~ /\.ltms$/) {
+	next;
+    }
     @snippet_commands2 = `grep -F $snippet_key $source` ;
     chomp @snippet_commands2 ;
     $src_under_sub = $source ;
@@ -62,3 +96,28 @@ foreach $source (@fcvsources) {
 	print "$subdir/$_.fcv: $src_under_sub \$\(EXTRACT\)\n";
     }
 }
+foreach $source (@fcvsources_ltms) {
+    my @snippet_commands2 ;
+    my $src_under_sub ;
+    my $subdir ;
+    my $snippet ;
+    @snippet_commands2 = `grep -F $snippet_key_ltms $source` ;
+    chomp @snippet_commands2 ;
+    $src_under_sub = $source ;
+    $source =~ m!(.*/[^/]+)/[^/]+! ;
+    $subdir = $1 ;
+#    print @snippet_commands ;
+    foreach $snippet (@snippet_commands2) {
+	$_ = $src_under_sub ;
+	s/\.litmus$// ;
+	$src_under_sub = $_ ;
+	print "$src_under_sub.ltms: $src_under_sub.litmus \$\(REORDER_LTMS\)\n" ;
+	$snippet =~ /labelbase=.*:(.+:[^,\]]+)[,\]]/ ;
+	if (not defined $1) {
+	    die("Oops! Please try \"make clean; make\".\n") ;
+	}
+	$_ = $1;
+	s/:/@/g ;
+	print "$subdir/$_.fcv: $src_under_sub.ltms \$\(EXTRACT\)\n";
+    }
+}
diff --git a/utilities/reorder_ltms.pl b/utilities/reorder_ltms.pl
new file mode 100755
index 0000000..72d061b
--- /dev/null
+++ b/utilities/reorder_ltms.pl
@@ -0,0 +1,92 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Reorder meta command lines in .litmus source to work around
+# restrictions of herdtools7 where comments can be placed.
+#
+# .litmus files need to have "C foo-bar" at the very beginning.
+# They need to have an "exists" clause as the final line.
+#
+# Also, "{" and "}" in comments sometimes cause error depending
+# on their position. So we use "[" and "]" in .litmus files.
+#
+# Example:
+# Input
+# ------------------------------------------------------------
+# C C-foo-bar
+# //\begin[snippet][labelbase=ln:foo-bar,commandchars=\%\[\]]
+# [...]
+#     r1 = READ_ONCE(*x0);    //\lnlbl[read]
+# [...]
+# //\end[snippet]
+# exists (0:r1=0 /\ 1:r1=0)
+# ------------------------------------------------------------
+# Output
+# ------------------------------------------------------------
+# //\begin{snippet}[labelbase=ln:foo-bar,commandchars=\%\[\]]
+# C C-foo
+# [...]
+#     r1 = READ_ONCE(*x0);    //\lnlbl{read}
+# [...]
+# exists (0:r1=0 /\ 1:r1=0)
+# //\end{snippet}
+# ------------------------------------------------------------
+#
+# Copyright (C) Akira Yokosawa, 2018
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $src_file = $ARGV[0];
+my $line;
+my $edit_line;
+my $first_line;
+my $end_command;
+my $lnlbl_command;
+my $status = 0;	# 0: just started, 1: first_line read; 2: begin line output,
+		# 3: end line read
+
+while($line = <>) {
+    if (eof) {
+	last;
+    }
+    if ($status == 0) {
+	$first_line = $line;
+	$status = 1;
+	print "// Do not edit!\n// Generated by utillities/reorder_ltms.pl\n";
+	next;
+    } elsif ($status == 1) {
+	$_ = $line;
+	s/\\begin\[snippet\]/\\begin\{snippet\}/;
+	$edit_line = $_ ;
+	print $edit_line ;
+	print $first_line ;
+	$status = 2;
+	next;
+    } elsif ($status == 2) {
+	if ($line =~ /\\end\[snippet\]/) {
+	    $_ = $line ;
+	    s/\\end\[snippet\]/\\end\{snippet\}/ ;
+	    $end_command = $_ ;
+	    $status = 3;
+	    next;
+	} else {
+	    if ($line =~ /\\lnlbl\[[^\]]*\]/) {
+		$_ = $line ;
+		s/\\lnlbl\[([^\]]*)\]/\\lnlbl\{$1\}/ ;
+		$line = $_ ;
+	    }
+	    print $line ;
+	}
+    } elsif ($status == 3) {
+	print $line ;
+    }
+}
+
+if ($status == 3) {
+    print $end_command;
+} else {
+    die ("Oops, something went wrong!");
+}
-- 
2.7.4


