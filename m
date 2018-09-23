Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RTPDCayq2y68ePXtL+GTU7VmGXD3IxfVdFTUj+kZ0PA=;
        b=f1Mcu04HZ8Eb8LTM4YaXM9WIiMd2But5trqxbwqnuXdJQN0jsEjornkIbbH7oPCFMx
         4gAwaiyJOlSVXtRxlAeujahra2vJIAvtmP61+M2o5MHcCnMATAOGvO4bF1yyo5ov6135
         ATqFQzePVSCY33emJW1ypoK4Jl2YP0Jz03CkBdEICCY6Cho/ozLaDscFu0c5oaSAEtS9
         AonPL+y7nbGYFAApEpfUi/1GTECHLQ8TnrHrmtNcnEh+jxjkIrPhSXpY7HTftHUm8/fw
         xP9+G0U/cbjVDUTLo597T+J6A9owjO7OrJpqjNb/Ss7o9gcrVP6fYMl+jm3eoN32Q3kL
         kMNg==
Subject: [PATCH 2/9] Update build scripts to support code snippets other than
 'C'
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eca9b13a-33ea-38ae-30de-3aad9b81d1a1@gmail.com>
Date: Sun, 23 Sep 2018 16:24:01 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From be808a5ec45f657689dab384e026011aa6b496df Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 29 Aug 2018 20:48:42 +0900
Subject: [PATCH 2/9] Update build scripts to support code snippets other than 'C'

Add code to fcvextract.pl to switch regex depending on the suffix
of source file. Supported suffixes are ".c", ".h", ".sh", ".spin",
and ".litmus".

Also fix gen_snippet_d.pl so that it works when a source file under
a deep sub-directory is specified.

Some of the <file name> part specified in the 2nd arg to fcvextract.pl
requires escaping. Specifically, "+" characters e.g. in "C-SB+o-o+o-o"
need escapes and should be specified as "C-SB\\+o-o\\+o-o" in the
argument. This escaping can be most easily done in Makefile by
using the $(subst ...) function.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile                   |  2 +-
 utilities/fcvextract.pl    | 26 ++++++++++++++++++++------
 utilities/gen_snippet_d.pl |  5 ++---
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index a88553b..588274a 100644
--- a/Makefile
+++ b/Makefile
@@ -264,7 +264,7 @@ CodeSamples/snippets.d: $(SOURCES_OF_SNIPPET) $(GEN_SNIPPET_D)
 
 $(FCVSNIPPETS):
 	@echo "$< --> $@"
-	@utilities/fcvextract.pl $< $(subst @,:,$(basename $(notdir $@))) > $@
+	utilities/fcvextract.pl $< $(subst +,\\+,$(subst @,:,$(basename $(notdir $@)))) > $@
 
 help:
 	@echo "Official targets (Latin Modern Typewriter for monospace font):"
diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index cba96e7..740d358 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -96,6 +96,8 @@
 use strict;
 use warnings;
 
+my $src_file;
+my $lnlbl_re;
 my $line;
 my $edit_line;
 my $extract_labelbase;
@@ -111,13 +113,25 @@ my $file_name;
 my $func_name;
 my $label;
 
+$src_file = $ARGV[0];
 $extract_labelbase = $ARGV[1];
 
-$begin_re = '\\\begin\\{snippet\\}.*labelbase=[^,\\]]*' . $extract_labelbase . '[,\\]]' ;
-$end_re = '\\\end\\{snippet\\}';
+$begin_re = qr/\\begin\{snippet\}.*labelbase=[^,\]]*$extract_labelbase[,\]]/ ;
+$end_re = qr/\\end\{snippet\}/;
 
-#print $begin_re;
-#print "\n";
+if ($src_file =~ /.*\.h$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
+} elsif ($src_file =~ /.*\.c$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
+} elsif ($src_file =~ /.*\.spin$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
+} elsif ($src_file =~ /.*\.sh$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*#\s*)\\lnlbl\{(.*)}\s*$!;
+} elsif ($src_file =~ /.\.litmus$/ ) {
+    $lnlbl_re = qr!(.*?)(\s*\(\*\s*)\\lnlbl\{(.*)}\s*\*\)\s*$!;
+} else {
+    die ("unkown file suffix!");
+}
 
 while($line = <>) {
     if ($line =~ /$begin_re/) {
@@ -132,7 +146,7 @@ while($line = <>) {
 	}
 	if ($line =~ /\\fcvexclude/) {
 	    # skip this line
-	} elsif ($line =~ m!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!) {
+	} elsif ($line =~ m!$lnlbl_re!) {
 	    $edit_line = $1 . $esc_bsl . "lnlbl" . $esc_open . $3 . $esc_close ;
 	    print $edit_line . "\n" ;
 	} else {
@@ -146,7 +160,7 @@ while($line = <>) {
 	    print "\\begin\{linelabel}\[$1\]\n" ;
 	}
 	print "\\begin\{VerbatimL\}" ;
-	if ($line =~ /commandchars=([^,]+).*\]$/) {
+	if ($line =~ /commandchars=([^,]+).*\]/) {
 	    $esc_char = $1 ;
 	    print "\[commandchars=" . $esc_char . "\]\n" ;
 	    $esc_bsl = substr $esc_char, 1, 1;
diff --git a/utilities/gen_snippet_d.pl b/utilities/gen_snippet_d.pl
index 55c1378..4de733a 100755
--- a/utilities/gen_snippet_d.pl
+++ b/utilities/gen_snippet_d.pl
@@ -15,7 +15,6 @@ use warnings;
 my @fcvsources;
 my $snippet_key;
 my $source;
-my $src_under_sub;
 
 $snippet_key = '\\begin\{snippet\}' ;
 @fcvsources = `grep -l -r -F $snippet_key CodeSamples` ;
@@ -30,13 +29,13 @@ foreach $source (@fcvsources) {
     my $snippet ;
     @snippet_commands1 = `grep -F $snippet_key $source` ;
     chomp @snippet_commands1 ;
-    $source =~ m!.*/([^/]+)/[^/]+! ;
+    $source =~ m!(.*/[^/]+)/[^/]+! ;
     $subdir = $1 ;
     foreach $snippet (@snippet_commands1) {
 	$snippet =~ /labelbase=.*:(.+:[^,\]]+)[,\]]/ ;
 	$_ = $1;
 	s/:/@/g ;
-	print "\\\n\tCodeSamples/$subdir/$_.fcv ";
+	print "\\\n\t$subdir/$_.fcv ";
     }
 }
 
-- 
2.7.4


