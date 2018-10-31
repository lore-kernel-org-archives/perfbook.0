Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oUM/x5OUhAzhaVo63FC9tQIv504+cSoILXef8Geo3PU=;
        b=ZdtzZEr8zS1ORhOhmYGTQ7DMVF+gaqHeiWPmeUcDkz0rnI9yX0SF4FEpxFUc890UmF
         6qld9uvC60H6zAXnirWuKEqxuphZ8oDpkt1ma/eVud+5F7LRHBVmsEgkLVm8JKu/zEU8
         e7OAIzdUWSDyxnltuAY3I58UHC8dj9VmcnghHfpQsq0ZBr+ZuRXcQSglTtTtfx/b4OmS
         HdlwFaTt5HjPzAu39Q1BuzFYrceYGTjDMxjZkEVazSUU3Yap7g9R4SJBDdBjAehOqQIm
         lZSUKi9cQ1EVmYEGiGf5OawiXpSHbLvwwOshXcjnGaaF8ALPMD0oxTAjhJdXquf9FOXo
         MMlQ==
Subject: [PATCH 1/8] reorder_ltms.pl: Add 'locationslabel=' option to
 \end[snippet]
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f95f6397-2e53-642a-fa77-89b884629e33@gmail.com>
Date: Thu, 1 Nov 2018 00:09:32 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3a6f1d8ea52b05c8b790e27bc7a9bf73cbda2555 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 07:38:43 +0900
Subject: [PATCH 1/8] reorder_ltms.pl: Add 'locationslabel=' option to \end[snippet]

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/reorder_ltms.pl | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utilities/reorder_ltms.pl b/utilities/reorder_ltms.pl
index d4770d0..9999c29 100755
--- a/utilities/reorder_ltms.pl
+++ b/utilities/reorder_ltms.pl
@@ -47,6 +47,7 @@ my $end_command;
 my $lnlbl_command;
 my $lnlbl_on_exists = "";
 my $lnlbl_on_filter = "";
+my $lnlbl_on_locations = "";
 my $status = 0;	# 0: just started, 1: first_line read; 2: begin line output,
 		# 3: end line read
 
@@ -58,6 +59,9 @@ while($line = <>) {
 	} elsif ($line =~ /filter/) {
 	    chomp $line;
 	    print $line . $lnlbl_on_filter . "\n";
+	} elsif ($line =~ /locations/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_locations . "\n";
 	} else {
 	    print $line;
 	}
@@ -87,6 +91,9 @@ while($line = <>) {
 	    if ($line =~ /filterlabel=([^\],]+)/) {
 		$lnlbl_on_filter = "//\\lnlbl\{$1\}";
 	    }
+	    if ($line =~ /locationslabel=([^\],]+)/) {
+		$lnlbl_on_locations = "//\\lnlbl\{$1\}";
+	    }
 	    $status = 3;
 	    next;
 	} else {
@@ -95,6 +102,11 @@ while($line = <>) {
 		s/\\lnlbl\[([^\]]*)\]/\\lnlbl\{$1\}/ ;
 		$line = $_ ;
 	    }
+	    if ($line =~ /\(\*\s*\\lnlbl\{[^\}]*\}\s*\*\)/) {
+		$_ = $line ;
+		s/\(\*\s*(\\lnlbl\{[^\}]*\})\s*\*\)/\/\/$1/ ;
+		$line = $_ ;
+	    }
 	    print $line ;
 	}
     } elsif ($status == 3) {
@@ -104,6 +116,9 @@ while($line = <>) {
 	} elsif ($line =~ /filter/) {
 	    chomp $line;
 	    print $line . $lnlbl_on_filter . "\n";
+	} elsif ($line =~ /locations/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_locations . "\n";
 	} else {
 	    print $line ;
 	}
-- 
2.7.4


