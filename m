Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LfqdgxFVKJF3E2zven2zYrNhR4OIN4wu2fB8fW68rr4=;
 b=Bu5NKUbSoDN0iUx8eRPwrpZJlxU7571C9THybnbe25amMD1CYdJzU2Xhd8bNzhrwPe
 kWBgMm2NkiPN22drvEFLN5NXv1jexprnBLDyYrSQAiY1N3/z/KeQKrT8DrwMP7mElF7U
 tgMCbujd24mlFqQTioJnO3vHqXTlWBvJXtz9K7nLj9iRRcTiIhiHQX2ZnRlmdtQS6YkG
 cHiXpIHtShamXs5D4GeLxfcCb5Sxe/d5tx9n/14ZkynL220wJ/jDhbDdhWRvWB8pnvDl
 eKfKdeKJJSIb3iZR5zX9V/Bsh8CcgV3p3w9oee6CwUXQGzaEtC409A2uUDTe2aiqm7aW
 4SKA==
Subject: [PATCH v2 1/1] Trial of replacing hyphens of negative values with
 minus
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
 <20160808163608.GJ3482@linux.vnet.ibm.com>
 <5d1f41dd-a4f1-81f7-cc6c-b9ce8c229f88@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <34706a45-ca8b-bdbb-b60c-9ce0da4c9029@gmail.com>
Date: Tue, 9 Aug 2016 23:06:59 +0900
MIME-Version: 1.0
In-Reply-To: <5d1f41dd-a4f1-81f7-cc6c-b9ce8c229f88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f4068f222bfa4f1cb60b9c16e9228990bc886280 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 Aug 2016 22:16:51 +0900
Subject: [PATCH v2 1/1] Trial of replacing hyphens of negative values with minus
 signs

This commit encloses negative values with hyphens within
math mode.
It also adds a script "findminusnum.sh" I used to search
candidates. It is by no means complete, but it can still
be used as a hint in the future.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/SMPdesign.tex       |  2 +-
 SMPdesign/beyond.tex          |  2 +-
 SMPdesign/partexercises.tex   |  2 +-
 appendix/questions/after.tex  | 14 +++++++-------
 datastruct/datastruct.tex     |  2 +-
 future/htm.tex                |  2 +-
 toolsoftrade/toolsoftrade.tex |  2 +-
 utilities/findminusnum.sh     | 29 +++++++++++++++++++++++++++++
 8 files changed, 42 insertions(+), 13 deletions(-)
 create mode 100644 utilities/findminusnum.sh

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 0a65c38..4006186 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -997,7 +997,7 @@ in their \co{pool} fields, which are filled from index zero upwards.
 Thus, if \co{globalmem.pool[3]} is \co{NULL}, then the remainder of
 the array from index 4 up must also be \co{NULL}.
 The \co{cur} fields contain the index of the highest-numbered full
-element of the \co{pool} array, or -1 if all elements are empty.
+element of the \co{pool} array, or $-1$ if all elements are empty.
 All elements from \co{globalmem.pool[0]} through
 \co{globalmem.pool[globalmem.cur]} must be full, and all the rest
 must be empty.\footnote{
diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 13dbb71..c64f580 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -269,7 +269,7 @@ Figure~\ref{fig:SMPdesign:Partitioned Parallel Solver Pseudocode}
 is similar to SEQ, but has a few important differences.
 First, each child thread has its own \co{visited} array, passed in by
 the parent as shown on line~1,
-which must be initialized to all [-1,-1].
+which must be initialized to all [$-1$, $-1$].
 Line~7 stores a pointer to this array into the per-thread variable
 \co{myvisited} to allow access by helper functions, and similarly stores
 a pointer to the local visit index.
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index ca16dea..aabcf59 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -274,7 +274,7 @@ so that the first element left-enqueued into an empty queue is numbered
 zero and the first element right-enqueued into an empty queue is numbered
 one.
 A series of elements left-enqueued into an otherwise-idle queue would
-be assigned decreasing numbers (-1, -2, -3, \ldots), while a series of
+be assigned decreasing numbers ($-1$, $-2$, $-3$, \ldots), while a series of
 elements right-enqueued into an otherwise-idle queue would be assigned
 increasing numbers (2, 3, 4, \ldots).
 A key point is that it is not necessary to actually represent a given
diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index 09f6276..25fea75 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -143,13 +143,13 @@ variables increased since the prior snapshot collected by the consumer.
 \begin{tabular}{rcrrrr}
 seq    & time (seconds) & delta~    &  a &  b &  c \\
 \hline
-17563: & 1152396.251585 & (-16.928) & 27 & 27 & 27 \\
-18004: & 1152396.252581 & (-12.875) & 24 & 24 & 24 \\
-18163: & 1152396.252955 & (-19.073) & 18 & 18 & 18 \\
-18765: & 1152396.254449 & (-148.773) & 216 & 216 & 216 \\
-19863: & 1152396.256960 & (-6.914) & 18 & 18 & 18 \\
-21644: & 1152396.260959 & (-5.960) & 18 & 18 & 18 \\
-23408: & 1152396.264957 & (-20.027) & 15 & 15 & 15 \\
+17563: & 1152396.251585 & ($-16.928$) & 27 & 27 & 27 \\
+18004: & 1152396.252581 & ($-12.875$) & 24 & 24 & 24 \\
+18163: & 1152396.252955 & ($-19.073$) & 18 & 18 & 18 \\
+18765: & 1152396.254449 & ($-148.773$) & 216 & 216 & 216 \\
+19863: & 1152396.256960 & ($-6.914$) & 18 & 18 & 18 \\
+21644: & 1152396.260959 & ($-5.960$) & 18 & 18 & 18 \\
+23408: & 1152396.264957 & ($-20.027$) & 15 & 15 & 15 \\
 \end{tabular}
 \caption{``After'' Program Sample Output}
 \label{tab:app:questions:After Program Sample Output}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 4807223..b86527f 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1073,7 +1073,7 @@ as specified by the \co{->ht_nbuckets} field on line~13.
 The size is stored in the same structure containing the array of
 buckets (\co{->ht_bkt[]} on line~24) in order to avoid mismatches between
 the size and the array.
-The \co{->ht_resize_cur} field on line~14 is equal to -1 unless a resize
+The \co{->ht_resize_cur} field on line~14 is equal to $-1$ unless a resize
 operation
 is in progress, in which case it indicates the index of the bucket whose
 elements are being inserted into the new hash table, which is referenced
diff --git a/future/htm.tex b/future/htm.tex
index c64bdf7..ac52234 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -639,7 +639,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 	When worker threads complete their feed, they must disentangle
 	themselves from the rest of the application and place a status
 	value in a per-thread \co{my_status} variable that is initialized
-	to -1.
+	to $-1$.
 	Threads do not exit; they instead are placed on a thread pool
 	to accommodate later processing requirements.
 	The control thread assigns (and re-assigns) worker threads as
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 9ed50fe..c6f0a91 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -256,7 +256,7 @@ shell-script \co{wait} command.
 Each pass through the loop spanning lines~6-15 waits on one child process.
 Line~7 invokes the \co{wait()} primitive, which blocks until a child process
 exits, and returns that child's process ID.
-If the process ID is instead -1, this indicates that the \co{wait()}
+If the process ID is instead $-1$, this indicates that the \co{wait()}
 primitive was unable to wait on a child.
 If so, line~9 checks for the \co{ECHILD} errno, which indicates that there
 are no more child processes, so that line~10 exits the loop.
diff --git a/utilities/findminusnum.sh b/utilities/findminusnum.sh
new file mode 100644
index 0000000..14626ff
--- /dev/null
+++ b/utilities/findminusnum.sh
@@ -0,0 +1,29 @@
+#!/bin/sh
+#
+# Find hypens used as minus signs in text mode
+#
+# This is an incomplete script. 
+# False positives will include those of verbatim and \co{} arguments.
+# Use the result just for hints.
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
+# Copyright (C) Akira Yokosawa, 2016
+#
+# Authors: Akira Yokosawa <akiyks@gmain.com>
+
+find . -name "*.tex" -exec grep -nH -E '[[:space:]+|\[|(]\-[0-9]+' {} + | \
+grep -v "perfbook_flat.tex" | grep -v "qqz.tex" | grep -v "appendix/rcuimpl"
+
-- 
1.9.1


