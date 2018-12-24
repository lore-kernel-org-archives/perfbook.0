Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u7pwpZPuXKEG34eyTNTWMcCZQGeltn2G0jM7WvoAXfg=;
        b=eVThqRIG2Qb733f4gk2dFQwE7bmpqslNZxGG7YzEcbodXj5fKl6e+WI9Oj4WcLsUoo
         sK+Ultmzdawb2tcq7HiaHueO6zQgA8NTGSXf6Zlz8qI2/TwyWtKj/45g2+cLuG8WBsqm
         AtFa6oEnAn76IAjG3Ir11fCpYaSzKlwE5Coy/izcMs+GebC4iWWqrvWVnpDHrP3NaGK9
         FDN2GNCb06mIiSZCbpfJgcXjvhzFCJ1nMPyucdJsHhDqJvYf3wEfAHgM5HF0S91wfO3Y
         6nAXOKEHUzoJrX5enJV8HpPOijuiAVc+MvV7wROj6KWWmsqRuMD+Z/gj8VDpNZDv53Mg
         mXLg==
Subject: [PATCH 05/11] fcvextract.pl: Support '/* \lnlbl{...} */' style label
 in C source
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <455326eb-8a09-f7a9-5d99-73b258fb0894@gmail.com>
Date: Mon, 24 Dec 2018 23:59:11 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f5a7cdba0ffb249111f4cf0d83896c0ce368e736 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 15:06:59 +0900
Subject: [PATCH 05/11] fcvextract.pl: Support '/* \lnlbl{...} */' style label in C source

To embed labels on a multi-line macro definition, we need to
support the following way of labeling:

    #define MULTILINE_MACRO ({ FOO /* \lnlbl{foo} */ \
	BAR }) //\lnlbl{bar}

This style of labels work in snippets without the "keepcomment=yes"
option.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fcvextract.pl | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index 71e761d..f8f274b 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -115,6 +115,7 @@ use warnings;
 my $src_file;
 my $c_src = 0;
 my $lnlbl_re;
+my $lnlbl_re2;
 my $line;
 my $edit_line;
 my $extract_labelbase;
@@ -143,6 +144,7 @@ $end_re = qr/\\end\{snippet\}/;
 
 if ($src_file =~ /.*\.[ch]$/ ) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
+    $lnlbl_re2 = qr!(.*?)(s*/\*\s*)\\lnlbl\{(.*)}\s*\*/(.*)$!;
     $c_src = 1;
 } elsif ($src_file =~ /.*\.c$/ ) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
@@ -170,6 +172,9 @@ while($line = <>) {
 	if ($line =~ /\\fcvexclude/) {
 	    next; # skip this line
 	}
+	if ($c_src && $line =~ m!$lnlbl_re2!) {
+	    $line = $1 . $esc_bsl . "lnlbl" . $esc_open . $3 . $esc_close . $4 . "\n" ;
+	}
 	if ($c_src && !$keepcomment) {
 	    if ($incomment) {
 		if ($line =~ /\*\/(.*$)/) {
-- 
2.7.4


