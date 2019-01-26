Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gMCmjwROWR+KQMaOYvJSwz1jH6AFXrn/dxxc3jrc/Bw=;
        b=JGuVIIiwjjEA9P2CDJAGqx8Q7xWqInW30tL6eozv0095tAVg9tANDxpUWpsq7K/ecU
         hRu6tpqSE5hg8njKA52ScZMiQTHuEyz723w0+4B2q2f/SToxsyaZB+rbgBTXVJhP6Kmo
         Cflu5NygHhH60fwY+NMuZz/z0FI7GlMRL5X9PBSVPb5G0pWDaKqUATcLrSTkfR7Myerm
         GWS9y+ba7giJ5IbgUXvXbUYPrT9V+ZQMjEuQvLmh2Oq/zxlQL33dfOHg8443R1qw0MJ5
         57UddvmQRsRiHQ9b9SSRjy1Fwh1zXTXvnvBkzuLxRBEc0blCWZHo6uQeV+eo9dmHjRFn
         IWNQ==
Subject: [PATCH 1/3] Add checkfcv.pl
References: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a2c34501-24cb-8ccf-0805-c7d8c229de27@gmail.com>
Date: Sun, 27 Jan 2019 00:10:35 +0900
MIME-Version: 1.0
In-Reply-To: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 52700b8b23649a19e02f4b9a5736c0d9056c06e4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Jan 2019 20:48:16 +0900
Subject: [PATCH 1/3] Add checkfcv.pl

Add a script to detect collisions in commandchars choice

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/checkfcv.pl | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100755 utilities/checkfcv.pl

diff --git a/utilities/checkfcv.pl b/utilities/checkfcv.pl
new file mode 100755
index 0000000..94621ba
--- /dev/null
+++ b/utilities/checkfcv.pl
@@ -0,0 +1,78 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Check LaTeX source of snippet extracted by fcvextract.pl
+#
+# Copyright (C) Akira Yokosawa, 2019
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+use strict;
+use warnings;
+
+my $line;
+my $lnlbl_re;
+my $checking = 0;
+my $linelabel_re = qr/\\begin\{linelabel\}\[([^\]]*)\]/ ;
+my $end_linelabel_re = qr/\\end\{linelabel\}/ ;
+my $Verbatim_cmd_re = qr/\\begin\{Verbatim[LNU]\}\[commandchars=(.{6}).*\]/ ;
+my $Verbatim_re = qr/\\begin\{Verbatim[LNU]\}/ ;
+my $end_Verbatim_re = qr/\\end\{Verbatim[LNU]\}/ ;
+my $commandchars = "";
+my $esc_bsl;
+my $esc_open;
+my $esc_close;
+my $esc_bsl_re;
+my $esc_open_re;
+my $esc_close_re;
+my $line_count = 0;
+
+my $fcv_file = $ARGV[0];
+open(my $fh, '<:encoding(UTF-8)', $fcv_file)
+    or die "Could not open file '$fcv_file' $!";
+
+while($line = <$fh>) {
+    $line_count = $line_count + 1;
+    if ($line =~ /$linelabel_re/) {
+	$checking = 1;
+    }
+    if ($checking == 3) {
+	if ($line =~ /$end_linelabel_re/) {
+	    $checking = 4;
+	}
+    }
+    if ($checking == 2) {
+	if ($line =~ /$end_Verbatim_re/) {
+	    $checking = 3;
+	} elsif ($commandchars =~ /\S/) {
+	    $_ = $line;
+	    s/$lnlbl_re//;
+	    if (/$esc_bsl_re/ || /$esc_open_re/ || /$esc_close_re/) {
+		die "commandchars collision detected in $fcv_file, line: $line_count\n$line\n";
+	    }
+	}
+    }
+    if ($checking == 1) {
+	if ($line =~ /$Verbatim_cmd_re/) {
+	    $commandchars = $1;
+	    $esc_bsl = substr $commandchars, 0, 2;
+	    $esc_open = substr $commandchars, 2, 2;
+	    $esc_close = substr $commandchars, 4, 2;
+	    $lnlbl_re = $esc_bsl."lnlbl".$esc_open.".*".$esc_close;
+	    $esc_bsl_re = qr/$esc_bsl/;
+	    $esc_open_re = qr/$esc_open/;
+	    $esc_close_re = qr/$esc_close/;
+	    $checking = 2;
+	} elsif ($line =~ /$Verbatim_re/) {
+	    $checking = 2;
+	}
+    }
+    if (eof) {
+	last;
+    }
+}
+if ($checking == 4) {
+    exit 0;
+} else {
+    die "incomplete fcv file $fcv_file\n";
+}
-- 
2.7.4


