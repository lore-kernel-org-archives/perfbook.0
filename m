Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3695+V/+hABO0r7Bnu9+85OmNP5uw5yui+vwVvL4hjE=;
        b=V3qj9yEnmdkdp45wOiem6e0pK3E2ykVXYMSuRMH5Bm85M00ZSxW8j+dVTcqsKZEjO2
         7BTG5pyNTJVkzFnFduN81ceqSlg1sfR+IIX8XsUS95EbVe+qrhmofdurRcTlhRCqq438
         czdJTDtgZ32AD/FHMztCLqNJSOo/OXBVenFnGpFgxeKkDJo33ak1CB9qBhXCL/Nfn8+H
         smkwfsS+ZGxrYfv4QWmWn2jz+QU4Fz2Jr1X8oTQC1SXtv9nBMhzFjDazPONUj5PbAeFe
         vJyoy/p91Hv64xosZpRXtK7/Al89UOccXPoUuTGX1LOQZ1JiaC/EjeMlpoxnUcyWvIh3
         VIPw==
Subject: [PATCH -perfbook v2 4/9] periodcheck: Improve label string matching
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d83e42cd-929b-972c-f3d1-bd9b1eb4beff@gmail.com>
Date: Wed, 28 Apr 2021 00:26:07 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Instead of patterns "\label" and "ref{", use a regex pattern
to match "foo:bar:Label String" and do checks after removing
label strings.

There still remains an assumption that each label string completes
within an input line.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/periodcheck.pl | 13 +++++++++----
 utilities/periodcheck.sh |  3 +++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/utilities/periodcheck.pl b/utilities/periodcheck.pl
index c585b147..27871507 100755
--- a/utilities/periodcheck.pl
+++ b/utilities/periodcheck.pl
@@ -28,8 +28,16 @@ my $Verbatim_begin = qr/\\begin\{Verbatim/ ;
 my $Verbatim_end = qr/\\end\{Verbatim/ ;
 my $tabular_begin = qr/\\begin\{tabula/ ;
 my $tabular_end = qr/\\end\{tabula/ ;
+my $label_ptn = qr/(^|\{)(,?[a-z]{3}:[a-zMPS]+:[^\},]+)(\}|,)/ ;
 
 sub check_line {
+    my $line_raw = $line;
+    if ($line =~ /$label_ptn/) {
+	while ($line && $line =~ /$label_ptn/) {
+	    my $quoted_2 = quotemeta $2;
+	    $line =~ s/$quoted_2//;
+	}
+    }
     if ($line =~ /$Verbatim_begin/ ||
 	$line =~ /$tabular_begin/) {
 	$skip = 1;
@@ -49,9 +57,6 @@ sub check_line {
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[a-z\}]\.\s[^\\]+/) {
 	    $safe = 0;
-	    if ($line =~ /ref\{/ || $line =~ /label\{/) {
-		$safe = 1;
-	    }
 	}
 	if ($line =~ /^(?=[\s]*+[^%])[^%]*[^~]\\cite/) {
 	    $safe = 0;
@@ -60,7 +65,7 @@ sub check_line {
 	    }
 	}
 	unless ($safe) {
-	    print $ARGV[0], ':', $line_num, ':', $line;
+	    print $ARGV[0], ':', $line_num, ':', $line_raw;
 	}
     }
     if ($line =~ /$Verbatim_end/ ||
diff --git a/utilities/periodcheck.sh b/utilities/periodcheck.sh
index a56657f3..d6cd7510 100755
--- a/utilities/periodcheck.sh
+++ b/utilities/periodcheck.sh
@@ -8,6 +8,9 @@ do
 	case $f in
 	./perfbook*) ;;
 	./qqz*) ;;
+	./glsdict.tex) ;;
+	./origpub.tex) ;;
+	./contrib.tex) ;;
 	./future/HTMtable*) ;;
 	./appendix/styleguide*) ;;
 	*) tex_sources="$tex_sources $f" ;;
-- 
2.17.1


