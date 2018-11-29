Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+v5tErT6A6d7NJGIkWS+mskUhlqrow0/bOmXpuEglkU=;
        b=o+I+xKnC9KC77gbAV2CCWeoy0HbRbeCnZFPAGB9iRdOVNhusk/Nr8kcpmOG7wIdX9l
         Drz3w/o8BlvgjDkMXyDH06q8TQ9P8McmgKJJqV7jkRo/WA2O1DSa9iS9fbNm5ygsKuhL
         Vlo9dpVBiPUVEPcNphL8FE2Vy8sZ0lPsmvr3yakU8INQbUp9u2WSZERLqdtYpZCfASnR
         1M8tMNBD+RQM9vH2ARSrF1gAJmV0dbPGYsj9LyMIybLacK/r5iwldMXF8AZH5vzE0fQ2
         krQ9bDRv6XDKssZtI3XUF01BBQU30wh+BOVGdVLSPecSZ9qAzialJ4dHIo9mGrHXtEj1
         0U1g==
Subject: [PATCH 3/4] Use '(* ... *)' style comments in epilogue of litmus
 tests
References: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c6703a7d-8873-1f2a-b625-0ca0f9b709b8@gmail.com>
Date: Fri, 30 Nov 2018 07:14:27 +0900
MIME-Version: 1.0
In-Reply-To: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 71caf0c6be60746b61fa0b5384fd1485536fbcc5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Nov 2018 21:36:43 +0900
Subject: [PATCH 3/4] Use '(* ... *)' style comments in epilogue of litmus tests

It turned out that comments of this style are allowed in the
epilogue part of litmus tests.

Move labels in options to \end[snippet] meta commands to
comments on their respective lines.

Remove code supporting the options to the meta command in
reorder_ltms.pl.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/C-RCU-remove.litmus        |  6 +--
 .../formal/herd/C-RomanPenyaev-list-rcu-rr.litmus  |  6 +--
 .../formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus      |  4 +-
 utilities/reorder_ltms.pl                          | 50 ++++++----------------
 4 files changed, 20 insertions(+), 46 deletions(-)

diff --git a/CodeSamples/formal/herd/C-RCU-remove.litmus b/CodeSamples/formal/herd/C-RCU-remove.litmus
index 6084f12..33c410f 100644
--- a/CodeSamples/formal/herd/C-RCU-remove.litmus
+++ b/CodeSamples/formal/herd/C-RCU-remove.litmus
@@ -26,6 +26,6 @@ P1(int **x, int *y, int *z)		//\lnlbl[P1start]
 	rcu_read_unlock();		//\lnlbl[rul]
 }					//\lnlbl[P1end]
 
-//\end[snippet][locationslabel=locations_,existslabel=exists_]
-locations [1:r1; x; y; z]
-exists (1:r2=0)
+//\end[snippet]
+locations [1:r1; x; y; z]	(* \lnlbl[locations_] *)
+exists (1:r2=0)			(* \lnlbl[exists_] *)
diff --git a/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
index f0080c1..1a197bd 100644
--- a/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
+++ b/CodeSamples/formal/herd/C-RomanPenyaev-list-rcu-rr.litmus
@@ -54,6 +54,6 @@ P1(int **c, int **v, int **w, int **x, int **y)//\lnlbl[P1start]
 	smp_store_release(x, 0);	//\lnlbl[updfree]
 }					//\lnlbl[P1end]
 
-//\end[snippet][locationslabel=locations_,existslabel=exists_]
-locations [1:r1; c; v; w; x; y]
-exists (0:r1=0 \/ 0:r2=0 \/ 0:r3=0 \/ 0:r4=0)
+//\end[snippet]
+locations [1:r1; c; v; w; x; y]			(* \lnlbl[locations_] *)
+exists (0:r1=0 \/ 0:r2=0 \/ 0:r3=0 \/ 0:r4=0)	(* \lnlbl[exists_] *)
diff --git a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
index 32d8e52..3e9e023 100644
--- a/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
+++ b/CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus
@@ -26,6 +26,6 @@ P1(int *sl, int *x0, int *x1)
 	smp_store_release(sl, 0);
 }
 
-//\end[snippet][filterlabel=filter_]
-filter (0:r2=0 /\ 1:r2=0)
+//\end[snippet]
+filter (0:r2=0 /\ 1:r2=0)	(* \lnlbl[filter_] *)
 exists (0:r1=0 /\ 1:r1=0)
diff --git a/utilities/reorder_ltms.pl b/utilities/reorder_ltms.pl
index 9999c29..dda646b 100755
--- a/utilities/reorder_ltms.pl
+++ b/utilities/reorder_ltms.pl
@@ -45,26 +45,23 @@ my $edit_line;
 my $first_line;
 my $end_command;
 my $lnlbl_command;
-my $lnlbl_on_exists = "";
-my $lnlbl_on_filter = "";
-my $lnlbl_on_locations = "";
 my $status = 0;	# 0: just started, 1: first_line read; 2: begin line output,
-		# 3: end line read
+		# 3: final line
 
 while($line = <>) {
     if (eof) {
-	if ($line =~ /exists/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_exists . "\n";
-	} elsif ($line =~ /filter/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_filter . "\n";
-	} elsif ($line =~ /locations/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_locations . "\n";
-	} else {
-	    print $line;
+	if ($line =~ /\\lnlbl\[[^\]]*\]/) {
+	    $_ = $line ;
+	    s/\\lnlbl\[([^\]]*)\]/\\lnlbl\{$1\}/ ;
+	    $line = $_ ;
 	}
+	if ($line =~ /\(\*\s*\\lnlbl\{[^\}]*\}\s*\*\)/) {
+	    $_ = $line ;
+	    s/\(\*\s*(\\lnlbl\{[^\}]*\})\s*\*\)/\/\/$1/ ;
+	    $line = $_ ;
+	}
+	print $line ;
+	$status = 3;
 	last;
     }
     if ($status == 0) {
@@ -85,16 +82,6 @@ while($line = <>) {
 	    $_ = $line ;
 	    s/\\end\[snippet\]/\\end\{snippet\}/ ;
 	    $end_command = $_ ;
-	    if ($line =~ /existslabel=([^\],]+)/) {
-		$lnlbl_on_exists = "//\\lnlbl\{$1\}";
-	    }
-	    if ($line =~ /filterlabel=([^\],]+)/) {
-		$lnlbl_on_filter = "//\\lnlbl\{$1\}";
-	    }
-	    if ($line =~ /locationslabel=([^\],]+)/) {
-		$lnlbl_on_locations = "//\\lnlbl\{$1\}";
-	    }
-	    $status = 3;
 	    next;
 	} else {
 	    if ($line =~ /\\lnlbl\[[^\]]*\]/) {
@@ -109,19 +96,6 @@ while($line = <>) {
 	    }
 	    print $line ;
 	}
-    } elsif ($status == 3) {
-	if ($line =~ /exists/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_exists . "\n";
-	} elsif ($line =~ /filter/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_filter . "\n";
-	} elsif ($line =~ /locations/) {
-	    chomp $line;
-	    print $line . $lnlbl_on_locations . "\n";
-	} else {
-	    print $line ;
-	}
     }
 }
 
-- 
2.7.4

