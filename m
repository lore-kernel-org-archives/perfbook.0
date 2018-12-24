Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A4qIsdPiUw8XrSLL7sH9athB7P3h4GxDwuAnINV8Oek=;
        b=ITa+VbFiln965dIVFgDNgYfCdV4lsBrRWcZ9Zq/SV0WSrPsEStSBbe/ho/zcttxpFI
         0MfE2ElSnxL2nfVxshgPm561x9nlEBWOmCGzvVm16vznFJDWIC1XEH0ZKBlzWPX2L8sx
         Wv69muKYGxDHJKAOhqhjyljiFid6mVbCzv/cr3qvV5tRyduPGvMSeekmoKWCFgIs7IxJ
         iCOnw2pnPY2uG6gI3yMnuul/ei1Z0tGyGMUq4HiTrsn1/tt8XcN5XkYFVOFoAxLGr1mU
         dXDf1liAVgtV/kqWWN1uic93eYpF9a/67NBhHRUu+ECFVrG+nf4Up7EXYe6o1DSojoiQ
         pT+Q==
Subject: [PATCH 01/11] fcvextract.pl: Enhance comment block handling of C
 source
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <42308834-adf6-46d9-c40d-9e65da22b6c1@gmail.com>
Date: Mon, 24 Dec 2018 23:53:55 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b7193f419457aff8b34c4d293f6b747770d1a911 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 09:12:48 +0900
Subject: [PATCH 01/11] fcvextract.pl: Enhance comment block handling of C source

Add an option "keepcomment" to \begin{snippet} meta command.
As a first step, default is "keepcomment=yes".
"keepcomment=no" will suppress comment blocks of the form
/* ... */ from appearing in the extracted snippet.

The default will be changed to "keepcomment=no" once the
explicit "keepcomment=yes" options are added where necessary.

Also add code to support "#ifndef FCV_SNIPPET -- #else -- #endif"
conditional to allow alternative code for snippet,
which is embedded using a comment block in a couple of code
samples as follows at the moment:

        <actual code>    //\fcvexclude
    /* --- begin alternative code for snippet \fcvexclude
        <alternative code>
       --- end alternative code for snippet \fcvexclude */

This won't work with "keepcomment=no". Instead, it can be embedded
in the following way:

    #ifndef FCV_SNIPPET
        <actual code>
    #else
        <alternative code>
    #endif

NOTE 1: "#else" is optional.
NOTE 2: FCV_SNIPPET should never be defined.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fcvextract.pl | 82 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index ce549d3..2ad201f 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -89,6 +89,22 @@
 # To omit a line in extracted snippet, put "\fcvexclude" in comment
 # on the line.
 #
+# By default, comment blocks of the form "/* ... */" in C language
+# code will be kept in the extracted snippet. To omit those blocks,
+# put an option "keepcomment=no" to \begin{snippet} meta command.
+#
+# Also, this script recognizes #ifndef -- #else -- #endif conditional
+# of the following form to allow alternative code for snippet:
+#
+#	#ifndef FCV_SNIPPET
+#		<actual code>
+#	#else
+#		<alternative code for snippet>
+#	#endif
+#
+# NOTE: "#ifdef FCV_SNIPPET" is not recognized.
+#	"#else" can be omitted.
+#
 # Copyright (C) Akira Yokosawa, 2018
 #
 # Authors: Akira Yokosawa <akiyks@gmail.com>
@@ -97,6 +113,7 @@ use strict;
 use warnings;
 
 my $src_file;
+my $c_src = 0;
 my $lnlbl_re;
 my $line;
 my $edit_line;
@@ -113,6 +130,9 @@ my $file_name;
 my $func_name;
 my $label;
 my $env_name = "VerbatimL" ;
+my $keepcomment = 1;
+my $incomment = 0;
+my $ifndef = 0;
 my $other_opts;
 
 $src_file = $ARGV[0];
@@ -121,8 +141,9 @@ $extract_labelbase = $ARGV[1];
 $begin_re = qr/\\begin\{snippet\}.*labelbase=[^,\]]*$extract_labelbase[,\]]/ ;
 $end_re = qr/\\end\{snippet\}/;
 
-if ($src_file =~ /.*\.h$/ ) {
+if ($src_file =~ /.*\.[ch]$/ ) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
+    $c_src = 1;
 } elsif ($src_file =~ /.*\.c$/ ) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
 } elsif ($src_file =~ /.*\.spin$/ ) {
@@ -143,14 +164,57 @@ while($line = <>) {
 	last;
     }
     if ($extracting == 2) {
-	if (($line =~ /$end_re/) && ($extracting == 2)) {
+	if ($line =~ /$end_re/) {
 	    last;
 	}
 	if ($line =~ /\\fcvexclude/) {
-	    # skip this line
-	} elsif ($line =~ m!$lnlbl_re!) {
+	    next; # skip this line
+	}
+	if ($c_src && !$keepcomment) {
+	    if ($incomment) {
+		if ($line =~ /\*\/(.*$)/) {
+		    $line = $1;
+		    $incomment = 0;
+		} else {
+		    $line = "";
+		}
+	    } else {
+		if ($line =~ /(.*)\/\*.*\*\/(.*)/) {
+		    $line = $1 . $2;
+		    if ($line =~ /\S/) {
+			$line = $line . "\n";
+		    } else {
+			next;
+		    }
+		} elsif ($line =~ /(.*)\/\*.*/) {
+		    $line = $1;
+		    $incomment = 1;
+		}
+	    }
+	}
+	if ($ifndef == 1) {
+	    if ($line =~ /\#else/) {
+		$ifndef = 2;
+	    } elsif ($line =~ /\#endif/) {
+		$ifndef = 0;
+	    }
+	    next;
+	}
+	if ($ifndef == 2) {
+	    if ($line =~ /\#endif/ ) {
+		$ifndef = 0;
+		next;
+	    }
+	}
+	if ($c_src && $line =~ /\#ifndef\s+FCV_SNIPPET/) {
+	    $ifndef = 1;
+	    next;
+	}
+	if ($line =~ m!$lnlbl_re!) {
 	    $edit_line = $1 . $esc_bsl . "lnlbl" . $esc_open . $3 . $esc_close ;
 	    print $edit_line . "\n" ;
+	} elsif ($line eq "") {
+	    next;
 	} else {
 	    print $line ;
         }
@@ -158,7 +222,7 @@ while($line = <>) {
     if ($extracting == 1) {
 	print "% Do not edit!\n" ;
 	print "% Generated by utilities/fcvextract.pl.\n" ;
-	if ($line =~ /labelbase=([^,]+)/) {
+	if ($line =~ /labelbase=([^,\]]+)/) {
 	    print "\\begin\{linelabel}\[$1\]\n" ;
 	    $_ = $line ;
 	    s/labelbase=[^,\]]+,?// ;
@@ -191,6 +255,14 @@ while($line = <>) {
 	    $esc_open = "\{" ;
 	    $esc_close = "\}" ;
 	}
+	if ($line =~ /keepcomment=([^,\]]+).\]/) {
+	    if ($1 eq "no") {
+		$keepcomment = 0;
+	    }
+	    $_ = $line;
+	    s/keepcomment=[^,\]]+,?// ;
+	    $line = $_ ;
+	}
 	if ($line =~ /\[(.*)\]$/) {
 	    $_ = $1 ;
 	    s/,$// ;
-- 
2.7.4


