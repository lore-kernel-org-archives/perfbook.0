Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kcFYicxSCYcwboT28crDNb9cuQMseNmfttkcppUR4+k=;
        b=onw09DRHWUidxD9E74PXLb/g/oYYMX/k/DZIjhy68JBVqBNV3WO6oz3rdsTyXXd9e0
         +Y7Rkl9g/gbSf8ILGHIamLHUhhe2rjq9IBQ4gWtUbAaA7l5E3//UOdbbrIDmedRRSiQW
         n1AwbZx2tE8xFyu4RjsLJN5KgySDZfURK2QotOyYlGsipzeSAX+7i7W35vGHimhLiddb
         qzynY4drYuwymAQYLZ00M1VHN7+AekLM14UkvW+SicLZzsphhIbUGjhV3UvZs1v9wki4
         07NDczBbtHMNt06x+XEvvK5U5ofOunoue6Ip/RqQskT0dSs41F2lsu0eBJdD1Ui9aFof
         YlTw==
Subject: [PATCH 1/6] fcvextract.pl: Treat '.spin' files as C sources
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ac6e5e91-0853-915a-19c1-1fe85cce71eb@gmail.com>
Date: Sun, 3 Feb 2019 00:08:42 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b33a50ba42fee982662ca34001c2495d1787b4fd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 31 Jan 2019 00:07:53 +0900
Subject: [PATCH 1/6] fcvextract.pl: Treat '.spin' files as C sources

"spin" command accepts preprocessor directives and comments of
C style.  Merge the setup of regular expressions for ".spin" files
with that for C sources.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/fcvextract.pl | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/utilities/fcvextract.pl b/utilities/fcvextract.pl
index f8f274b..8f5797e 100755
--- a/utilities/fcvextract.pl
+++ b/utilities/fcvextract.pl
@@ -105,7 +105,7 @@
 # NOTE: "#ifdef FCV_SNIPPET" is not recognized.
 #	"#else" can be omitted.
 #
-# Copyright (C) Akira Yokosawa, 2018
+# Copyright (C) Akira Yokosawa, 2018, 2019
 #
 # Authors: Akira Yokosawa <akiyks@gmail.com>
 
@@ -142,14 +142,10 @@ $extract_labelbase = $ARGV[1];
 $begin_re = qr/\\begin\{snippet\}.*labelbase=[^,\]]*$extract_labelbase[,\]]/ ;
 $end_re = qr/\\end\{snippet\}/;
 
-if ($src_file =~ /.*\.[ch]$/ ) {
+if ($src_file =~ /.*\.[ch]$/ || $src_file =~ /.*\.spin$/) {
     $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
     $lnlbl_re2 = qr!(.*?)(s*/\*\s*)\\lnlbl\{(.*)}\s*\*/(.*)$!;
     $c_src = 1;
-} elsif ($src_file =~ /.*\.c$/ ) {
-    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
-} elsif ($src_file =~ /.*\.spin$/ ) {
-    $lnlbl_re = qr!(.*?)(\s*//\s*)\\lnlbl\{(.*)}\s*$!;
 } elsif ($src_file =~ /.*\.sh$/ ) {
     $lnlbl_re = qr!(.*?)(\s*#\s*)\\lnlbl\{(.*)}\s*$!;
 } elsif ($src_file =~ /.\.ltms$/ ) {
-- 
2.7.4


