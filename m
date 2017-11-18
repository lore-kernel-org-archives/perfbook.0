Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FJf95qxkjWQZmpq1K+9Xw1fkBjBHZ0uzvZjTdW9YfHU=;
 b=mQSMregTrYgfTZcIiRYI7NvIz/kfLYSA52DlOYE3OqoWbGgz0WYjddHz7zfY2a3F2k
 7//oddoPPajuTQQ3fyibEGQFLQxiD1sJifFRUBbeQA32S/BuIppeXaDENFx3SbP6pgQx
 nbvr8PeB4obKrHqkhTGQo3GWZ0Hpd+UHmt/lf5gyWz8lAnQH2RCDFBcc/S1B0lEBK/X6
 X/30Lml2Br7pG5TDdw0XcHW+GY7cMxMKhils9fbp1h6bJASzewUO0/nJNdYTH+T+XCVK
 6j8EyOBVNemuONbibBaH6mVBgTaLWk7ujNknofq3g3NHXdgLn/OFmYJxc4C7lwlJozAv
 89WA==
Subject: [PATCH 1/3] Update qqzreorder.pl to take care of listing at the end
 of QQA
References: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b7ea0a69-405d-3655-d55e-bc4f6d5ca3c0@gmail.com>
Date: Sun, 19 Nov 2017 00:04:22 +0900
MIME-Version: 1.0
In-Reply-To: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 75056ec5dd25a1e6daa45cf4592e51fbb26685a8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 18 Nov 2017 21:03:23 +0900
Subject: [PATCH 1/3] Update qqzreorder.pl to take care of listing at the end of QQA

Also add a blank line above \begin{listing} so that the reordered
\QuickE{} is output at the right place.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex   |  1 +
 utilities/qqzreorder.pl | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 7a72c68..68dc09b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2634,6 +2634,7 @@ suffice to prevent the \co{exists} clause from triggering.
 	shows a somewhat nonsensical but very real example.
 	Creating a more useful (but still real) litmus test is left
 	as an exercise for the reader.
+
 \begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
diff --git a/utilities/qqzreorder.pl b/utilities/qqzreorder.pl
index 197d5a0..624d68b 100644
--- a/utilities/qqzreorder.pl
+++ b/utilities/qqzreorder.pl
@@ -2,8 +2,8 @@
 #
 # Move line of \QuickE{} below \end{enumerate} to just above
 # the \end{enumerate}.
-# Move line of \QuickE{} below \end{figure} to above
-# \begin{figure} corresponding to it.
+# Move line of \QuickE{} below \end{listing} to above
+# \begin{listing} corresponding to it.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -25,8 +25,8 @@

 my $line;
 my $after_end_enum = 0;
-my $in_figure = 0;
-my $after_figure = 0;
+my $in_listing = 0;
+my $after_listing = 0;
 my $line_idx = 1;
 my @line_buf;

@@ -42,15 +42,15 @@ while($line = <>) {
 	$after_end_enum = 0;
 	next;
     }
-    if ($in_figure) {
-	if ($line =~ /\\end\{figure\}/) {
-	    $after_figure = 1;
-	    $in_figure = 0;
+    if ($in_listing) {
+	if ($line =~ /\\end\{listing\}/) {
+	    $after_listing = 1;
+	    $in_listing = 0;
 	}
 	$line_buf[++$line_idx] = $line;
 	next;
     }
-    if ($after_figure) {
+    if ($after_listing) {
 	if ($line =~ /%/) {
 	    $line_buf[++$line_idx] = $line;
 	    next;
@@ -68,7 +68,7 @@ while($line = <>) {
 	    $line_buf[1] = $line;
 	}
 	$line_idx = 1;
-	$after_figure = 0;
+	$after_listing = 0;
 	next;
     }
     if ($line =~ /\\end\{enumerate\}/) {
@@ -77,8 +77,8 @@ while($line = <>) {
 	$after_end_enum = 1;
 	next;
     }
-    if ($line =~ /\\begin\{figure\}/) {
-	$in_figure = 1;
+    if ($line =~ /\\begin\{listing\}/) {
+	$in_listing = 1;
 	$line_buf[++$line_idx] = $line;
 	next;
     }
-- 
2.7.4


