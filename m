Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=RqroUDLHYwdyg/qRiyiY4rbjISCl+rMyH5Fbw/rKLoo=;
 b=NmH7KMRhZP1TqD9o+7DbFGHXIgRG+nQ7tIKyynzmUuOqk0pc7kjJLpFQ+et4HXgzkO
 I2l3XFE5lx+eXNtixL8E/SD/sN5CMjT6SIrnrjwRh/BFabp6ZDQR95W39VxdLJjORMS8
 M1rk4TgJC0zzR78E+qe68BbHY4oXoYXkgFUkw79RJVMQnCuXJRkpXdk6haRwFqyTKh+A
 2Xh+F+tuyzZ2GJ3kmq/ThaqrdshL1KcpdMNy2wErOmRS8jRfnanw9V5GU8nVEL/pn2xI
 MouvrEaEYkqQVAYlu3PQwH/ywDckaGtiDaulLBu3kPC5NPtt7xtOXGwXAduv3iM0vlQB
 bTig==
Subject: [PATCH 1/3] qqz: Add script to reorder lines in qqz.tex
References: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d03b58d0-b1fc-9ca7-9bcb-50a6ca9a6993@gmail.com>
Date: Mon, 9 Jan 2017 23:40:42 +0900
MIME-Version: 1.0
In-Reply-To: <04f10e4e-b325-c5a3-4076-3417a188ece2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fadc8d4c0b240dd49570a60b627a6e81256d511f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 9 Jan 2017 18:04:24 +0900
Subject: [PATCH 1/3] qqz: Add script to reorder lines in qqz.tex

This script moves some \QuickE{} to prevent white boxes from
becoming widows at the end of Answers which finish with an
"enumerate" or "figure" environment.

Excerpt of diff by this script is as follows:

@@ -2468,8 +2468,8 @@
                and~\ref{chp:Deferred Processing}.
        \item   The polling loops result in poor energy efficiency.
                An event-driven design is preferable.
-       \end{enumerate}
 \QuickE{}
+       \end{enumerate}
 \QuickQ{}
        On the \path{count_stat.c} row of
        Table~\ref{tab:count:Statistical Counter Performance on Power-6},
@@ -4527,6 +4527,7 @@
        \co{synchronize_sched()} with \co{synchronize_rcu()},
        perhaps as shown in
        Figure~\ref{fig:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
+\QuickE{}
 %
 \begin{figure}[tb]
 {\scriptsize
@@ -4573,7 +4574,6 @@
 \label{fig:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}
 \end{figure}
 %
-\QuickE{}
 \QuickQ{}
        Why do some of the cells in
        Table~\ref{tab:defer:RCU Wait-to-Finish APIs}

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/qqzreorder.pl | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 utilities/qqzreorder.pl

diff --git a/utilities/qqzreorder.pl b/utilities/qqzreorder.pl
new file mode 100644
index 0000000..197d5a0
--- /dev/null
+++ b/utilities/qqzreorder.pl
@@ -0,0 +1,88 @@
+#!/usr/bin/perl
+#
+# Move line of \QuickE{} below \end{enumerate} to just above
+# the \end{enumerate}.
+# Move line of \QuickE{} below \end{figure} to above
+# \begin{figure} corresponding to it.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, you can access it online at
+# http://www.gnu.org/licenses/gpl-2.0.html.
+#
+# Copyright (C) Akira Yokosawa, 2017
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+my $line;
+my $after_end_enum = 0;
+my $in_figure = 0;
+my $after_figure = 0;
+my $line_idx = 1;
+my @line_buf;
+
+$line_buf[1] = <>;
+while($line = <>) {
+    if ($after_end_enum) {
+	if ($line =~ /\\QuickE\{\}/) {
+	    print $line;
+	} else {
+	    print $line_buf[1];
+	    $line_buf[1] = $line;
+	}
+	$after_end_enum = 0;
+	next;
+    }
+    if ($in_figure) {
+	if ($line =~ /\\end\{figure\}/) {
+	    $after_figure = 1;
+	    $in_figure = 0;
+	}
+	$line_buf[++$line_idx] = $line;
+	next;
+    }
+    if ($after_figure) {
+	if ($line =~ /%/) {
+	    $line_buf[++$line_idx] = $line;
+	    next;
+	}
+	if ($line =~ /\\QuickE\{\}/) {
+	    print $line;
+	    for my $i (1 .. $line_idx-1) {
+		print $line_buf[$i];
+	    }
+	    $line_buf[1] = $line_buf[$line_idx];
+	} else {
+	    for my $i (1 .. $line_idx) {
+		print $line_buf[$i];
+	    }
+	    $line_buf[1] = $line;
+	}
+	$line_idx = 1;
+	$after_figure = 0;
+	next;
+    }
+    if ($line =~ /\\end\{enumerate\}/) {
+	print $line_buf[1];
+	$line_buf[1] = $line;
+	$after_end_enum = 1;
+	next;
+    }
+    if ($line =~ /\\begin\{figure\}/) {
+	$in_figure = 1;
+	$line_buf[++$line_idx] = $line;
+	next;
+    }
+    print $line_buf[1];
+    $line_buf[1] = $line;
+}
+print $line_buf[1];
-- 
2.7.4


