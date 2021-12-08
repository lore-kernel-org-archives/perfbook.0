Return-Path: <SRS0=4u0W=QZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1jvVkAmp7niGurdKgp5Lw2L/S/luWLGuZHi0eF4j5Mg=;
        b=bsdrf3BNGnJhlHhrn+rdBy0ac2VuRxqS7Cd0QgWkPhkfQwmtIFoXYBDVcTAgfW0qoV
         5Wnh+fBP7z4MV9baYrK+QJPTI4SgrmGTsQIyKlHKmzlUXUeTWkSnV5zJrR3TzWN3xN1f
         xrlqXHd3HFbPOwu08qAoUff2FdOjNb5CqAWwkTUdw6ReW6K999HRwqp8jF98K3o5Fcj9
         iXwfgdANgh1pHDxeB3xkkGkO1hcsO94LEjjrbM2/Chg95NyEgPPPFtmKMA7ugXOnAf4j
         W3zhNt8S1rGBw5iZw7awv08vVa4naCGSZyQeAjkIurBsaRHLn4uMHOU5DXADW6I5d+Z7
         7EZQ==
Subject: [PATCH -perfbook 2/4] cleverefcheck.pl: Add test of \begin{...} at
 head of QQA
References: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bff4b6a9-c8fd-e026-75f6-16f422ca652b@gmail.com>
Date: Wed, 8 Dec 2021 16:41:26 +0900
MIME-Version: 1.0
In-Reply-To: <4350078f-4054-cb28-157b-305d6df087ea@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

QQA's heading of "Answer:" looks similar to a section heading,
but it behaves differently when there is some environment next
to it.
Also, if there is an empty line at the head of QQA, "Answer:" can
be widowed.

Add tests to detect such potential break patterns in QQA.

Note: \begin{fcvref} is an exception.  It doesn't induce
page/column break.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/cleverefcheck.pl | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/utilities/cleverefcheck.pl b/utilities/cleverefcheck.pl
index f46cd89f..74ac9d72 100755
--- a/utilities/cleverefcheck.pl
+++ b/utilities/cleverefcheck.pl
@@ -27,9 +27,11 @@ my $ppl_ptn = qr/(^|\s+)ppl[^\s\{]*{/ ;
 my $acr_ptn = qr/(^|\s+)[aA]cr[^\s\{]*{/ ;
 my $heading_ptn = qr/(\\chapter|\\section|\\subsection|\\subsubsection)/ ;
 my $listing_ptn = qr/\\begin\{(listing|Verbatim)/ ;
+my $qqa_ptn = qr/\\E?QuickQuizAnswer[BEM]?/ ;
 my $in_footnote = 0 ;
 my $footnote_save = 0;
 my $after_heading = 0;
+my $after_qqa = 0;
 
 sub check_line {
     my $raw_line = $line;
@@ -117,6 +119,18 @@ sub check_line {
 	    $after_heading = 0 ;
 	}
     }
+    if ($after_qqa) {
+	if ($line =~ /^\s*$/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "~~~ Empty line at QQA head ^^^\n" ;
+	}
+	if ($line =~ /^\s*\\begin/ && $line !~ /fcvref/) {
+	    print $ARGV[0], ':', $line_num, ':', $raw_line, "^^^ environment next to QQA ~~~\n";
+	    $after_qqa = 0 ;
+	}
+	if ($line =~ /^\s*\{*[^\\]+/) {
+	    $after_qqa = 0;
+	}
+    }
     if ($line =~ /$Verbatim_end/) {
 	$skip = 0;
     } else {
@@ -153,6 +167,9 @@ sub check_line {
     if ($line =~ /$heading_ptn/) {
 	$after_heading = 1 ;
     }
+    if ($line =~ /$qqa_ptn/) {
+	$after_qqa = 1 ;
+    }
 }
 
 open(my $fh, '<:encoding(UTF-8)', $ARGV[0])
-- 
2.17.1


