Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=118Wj0t/QQntMUFjG7G1XRnHOdb7exb+vZ4RZmrBjKo=;
        b=B0akX91oZdDqKsgVuPzmyVxToa5noL5LS1Yq1CeVR1F2RI8BooxRwxaqulG25hNa66
         5yKjL5geQ2ZZYq5nnjM8nx3iZF0h+0RjCSdvthu098Rg242BF3b8OoJClSFLdy5OB5Ph
         K3HMI0uzDMbHKcX0OVc8L6xQj/JlJhMUJty9LMoyZvZZG60r+5PzS+L/UPfl21dfOBvz
         tmAoYnZQckX7wrHclj3wC4/FKvIFc0TykVXn+MJzBHHVA88nur2gj++ygK+p9BW5vPJx
         3ze5yZCJjVDRSvtCtWh2MvpAaSp07B4OBss7h/NbzyGraNi0pVJ8dxGhh9W2sQsKxu4C
         rJQg==
Subject: [PATCH 4/9] reorder_ltms.pl: Enable further labeling in litmus test
 snippet
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <13d54b2b-918f-f513-f47b-c9097a061d24@gmail.com>
Date: Sun, 23 Sep 2018 16:27:57 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 92a662ee9c74b45f3495784dc46587cd633603e3 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 29 Aug 2018 21:05:39 +0900
Subject: [PATCH 4/9] reorder_ltms.pl: Enable further labeling in litmus test snippet

In .litmus files, lines of "filter" and "exists" clauses can't
have their own comments to put labels.
To overcome this restriction, we add options "existslabel=foo"
and "filterlabel=bar" to the \end[snippet] meta command.

To put a label to an exists clause, you can put the label in
the form:

    ...
    \end[snippet][existslabel=foo]
    exists (1:r2=0 /\ 0:r2=0)
    [EOF]

This will be converted to:

    ...
    exists (1:r2=0 /\ 0:r2=0)\lnlbl{foo}
    \end{snippet}
    [EOF]

in .ltms file.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/reorder_ltms.pl | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/utilities/reorder_ltms.pl b/utilities/reorder_ltms.pl
index 72d061b..d4770d0 100755
--- a/utilities/reorder_ltms.pl
+++ b/utilities/reorder_ltms.pl
@@ -45,11 +45,22 @@ my $edit_line;
 my $first_line;
 my $end_command;
 my $lnlbl_command;
+my $lnlbl_on_exists = "";
+my $lnlbl_on_filter = "";
 my $status = 0;	# 0: just started, 1: first_line read; 2: begin line output,
 		# 3: end line read
 
 while($line = <>) {
     if (eof) {
+	if ($line =~ /exists/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_exists . "\n";
+	} elsif ($line =~ /filter/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_filter . "\n";
+	} else {
+	    print $line;
+	}
 	last;
     }
     if ($status == 0) {
@@ -70,6 +81,12 @@ while($line = <>) {
 	    $_ = $line ;
 	    s/\\end\[snippet\]/\\end\{snippet\}/ ;
 	    $end_command = $_ ;
+	    if ($line =~ /existslabel=([^\],]+)/) {
+		$lnlbl_on_exists = "//\\lnlbl\{$1\}";
+	    }
+	    if ($line =~ /filterlabel=([^\],]+)/) {
+		$lnlbl_on_filter = "//\\lnlbl\{$1\}";
+	    }
 	    $status = 3;
 	    next;
 	} else {
@@ -81,7 +98,15 @@ while($line = <>) {
 	    print $line ;
 	}
     } elsif ($status == 3) {
-	print $line ;
+	if ($line =~ /exists/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_exists . "\n";
+	} elsif ($line =~ /filter/) {
+	    chomp $line;
+	    print $line . $lnlbl_on_filter . "\n";
+	} else {
+	    print $line ;
+	}
     }
 }
 
-- 
2.7.4


