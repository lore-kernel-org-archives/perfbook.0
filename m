Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1mWXdHRWz0cQ7wL5LB4Z+6tPQEQxRdU9er7Dn0XTmlk=;
        b=POa9TOkr5qNAPl19LN0c8P9rpmXF9qdNY/t2V1alya8UvghMlbrK3N3/VJDyM/ijJA
         EZlPZurGJFwN+joAP1WMTLoUdpGRvTGSLw8kv+17VQIgEKTgp+F092xc9ln2XwhTyKe8
         XHywWSiSIlIQiQHhpvO3fQuPiJivFWvs/u4azi3YrgF9jxpOWnkdQErzYvI4VBWoMj4G
         12MXoEVHu3jNn2+0fV2sTYvustON6sGxUB4CrFtE3vEyezcJSzw/sB9/WdssZ5oCeKV2
         +9CUTTKVeAs3SrSiVSAWUY2uLgm8tbayRN9ha4ghY7ppezBBGHZFtrUoSlfandqKb89X
         B9og==
Subject: [PATCH -perfbook 3/4] cleverefcheck.pl: Add test of \begin{...} next
 to epigraph
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4f7654f2-738a-2986-2cb1-fc0177cec135@gmail.com>
Date: Wed, 8 Dec 2021 16:49:10 +0900
MIME-Version: 1.0
In-Reply-To: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

If a section heading has an epigraph next to it and an
environment of some sort follows the epigraph, the behavior
of a proper LaTeX heading is lost.

Add tests to detect such potential break patterns following
epigraphs.

Notes:
  o "Any environment" does not include "fcvref".
  o "listing" is caught by other tests for it.
  o glossary.tex has "description" list next to its epigraph.
    As it is at the head of an appendix and won't cause
    page/colum break, it is ignored.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 74ac9d72..6e9a59e8 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -28,10 +28,12 @@ my $acr_ptn = qr/(^|\s+)[aA]cr[^\s\{]*{/ ;
 my $heading_ptn = qr/(\\chapter|\\section|\\subsection|\\subsubsection)/ ;
 my $listing_ptn = qr/\\begin\{(listing|Verbatim)/ ;
 my $qqa_ptn = qr/\\E?QuickQuizAnswer[BEM]?/ ;
+my $epig_ptn = qr/\\[Ee]pigraph/ ;
 my $in_footnote = 0 ;
 my $footnote_save = 0;
 my $after_heading = 0;
 my $after_qqa = 0;
+my $after_epig = 0;
 
 sub check_line {
     my $raw_line = $line;
@@ -117,6 +119,7 @@ sub check_line {
 	if ($line =~ /$listing_ptn/) {
 	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ listing next to heading ^^^\n";
 	    $after_heading = 0 ;
+	    $after_epig = 0 ;  # after epigraph or not does not matter for listing
 	}
     }
     if ($after_qqa) {
@@ -131,6 +134,15 @@ sub check_line {
 	    $after_qqa = 0;
 	}
     }
+    if ($after_epig) {
+	if ($line =~ /^\s*$/) {  # empty line ends epigraph
+	    $after_epig -= 1 ;
+	}
+	if ($line =~ /^\s*\\begin/ && $line !~ /(fcvref|listing)/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ environment next to epigraph ^^^\n";
+	    $after_epig = 0 ;
+	}
+    }
     if ($line =~ /$Verbatim_end/) {
 	$skip = 0;
     } else {
@@ -170,6 +182,9 @@ sub check_line {
     if ($line =~ /$qqa_ptn/) {
 	$after_qqa = 1 ;
     }
+    if ($line =~ /$epig_ptn/ && $ARGV[0] !~ /glossary\.tex/) { # exempt glossary.tex
+	$after_epig = 2 ;
+    }
 }
 
 open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
-- 
2.17.1


