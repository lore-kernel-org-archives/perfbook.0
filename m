Return-Path: <SRS0=Uwbt=SY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4One1LS20MchEIL/pyTiMajVhacy1xZSZ/8wDdqE8Yc=;
        b=Dk8VFfVilMPpxnfTGJ88GHqk2EvKi7+PfkuzIll6jwxckZo29IE92yyw5nFA2XwzYK
         WE2tOl9ghzcxESvPlPmHPw7chvogUepPLhMlUQWs/tRpWGrjkO8kn9+iu2tEn9WsjiPI
         FHysctcNUr4/hMAlka58PKBB0AT+ucoAIH5QVdZ0klV7ooX1xUjQJAkBqfhCxJ0yVFQH
         bwPGA0YotFAEN/wryBucW9vVS6YWK2jsQWaS0JEVfYHcaHpVeYsfGTOtIxInIYGETwOI
         q26O+VQBfQTz6Aab4su6CXyZ5GAW2/gTbGRd97CXhoISTs7TxduQURo94bgnbdzD3/SQ
         w5bQ==
Message-ID: <3754e966-dcae-bc66-1dfe-cc5dc4718bed@gmail.com>
Date: Thu, 10 Feb 2022 00:12:23 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/3] cleverefcheck.pl: Add patterns to catch QQz
 positioning issues
Content-Language: en-US
References: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b9607a1e-7ab2-62fb-578e-d9dec3547905@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add patterns in cleverefcheck.pl to catch:

  - A plain QQz or grouped QQzs at the beginning of a section
  - Consecutive QQzs not properly grouped

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index 6e9a59e8..d92de5ac 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -28,12 +28,14 @@ my $acr_ptn = qr/(^|\s+)[aA]cr[^\s\{]*{/ ;
 my $heading_ptn = qr/(\\chapter|\\section|\\subsection|\\subsubsection)/ ;
 my $listing_ptn = qr/\\begin\{(listing|Verbatim)/ ;
 my $qqa_ptn = qr/\\E?QuickQuizAnswer[BEM]?/ ;
+my $qqe_ptn = qr/\}\\QuickQuizEnd\s*(%.*)?$/ ;
 my $epig_ptn = qr/\\[Ee]pigraph/ ;
 my $in_footnote = 0 ;
 my $footnote_save = 0;
 my $after_heading = 0;
 my $after_qqa = 0;
 my $after_epig = 0;
+my $after_qqe = 0;
 
 sub check_line {
     my $raw_line = $line;
@@ -121,6 +123,10 @@ sub check_line {
 	    $after_heading = 0 ;
 	    $after_epig = 0 ;  # after epigraph or not does not matter for listing
 	}
+	if ($line =~ /\\QuickQuiz\{/ || $line =~ /\\QuickQiuzSeries\{/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ Section opening QQz ^^^\n";
+	    $after_heading = 0 ;
+	}
     }
     if ($after_qqa) {
 	if ($line =~ /^\s*$/) {
@@ -134,6 +140,15 @@ sub check_line {
 	    $after_qqa = 0;
 	}
     }
+    if ($after_qqe) {
+	if ($line =~ /\\QuickQuiz\{/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ Consecutive QQz ^^^\n";
+	    $after_qqe = 0;
+	}
+	if ($line !~ /^\s*$/) {  # non-empty line ends after qqe status
+	    $after_qqe = 0;
+	}
+    }
     if ($after_epig) {
 	if ($line =~ /^\s*$/) {  # empty line ends epigraph
 	    $after_epig -= 1 ;
@@ -182,6 +197,9 @@ sub check_line {
     if ($line =~ /$qqa_ptn/) {
 	$after_qqa = 1 ;
     }
+    if ($line =~ /$qqe_ptn/) {
+	$after_qqe = 1 ;
+    }
     if ($line =~ /$epig_ptn/ && $ARGV[0] !~ /glossary\.tex/) { # exempt glossary.tex
 	$after_epig = 2 ;
     }
-- 
2.17.1


