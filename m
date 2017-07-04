Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=VTyUAQ9hU0Htg73eJTu5O5IphD5Bh8GkBPfKWfAM0Nc=;
 b=K4XsU5e/PxOG/ZcSUjZMgEZYu1IbowNJZuMc43lwla+Ikvp8RxbQSSm1BbJyrApOKG
 uVAvLfWm9krPeonoimBLb+L+ndd7scXoJ5gJ9sYZdB8PPWsbm2rs3+5zzITSCD7nIJy1
 icDcrxuTRxRsCeHwt/BIYx27Rxfu23kjzcZvKM9ga6hth4kL3nZWT1vyubCnrHOXjCrS
 FTzLS11bKNfDa/PMZMR9Et2U3KOOwTEvwPFhb8OkXND/F5buD6ZNX7Tka2k0lo/FYA+W
 Zk0jLCirjQIHT30u8GhjmCHoXN89ASvxUEUUqr8o7QRhvEEym+BMK2a9DBgUPsgcRa3u
 zJ3w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Fix store-buffering sequence table
Message-ID: <1e3fe2af-cce3-7327-488d-fb27ec7d9fc8@gmail.com>
Date: Wed, 5 Jul 2017 00:23:09 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2845eb208a6e63493997de47293a47ef774a9d49 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Jul 2017 23:18:30 +0900
Subject: [PATCH] advsync: Fix store-buffering sequence table

Row 6 of the table added in commit 2d5bf8d25a71 ("advsync: Add
memory-barriered store-buffering example") needs some context
adjustment.

Also tweak horizontal spacing of wide tables for one-column layout.
Also add a few words to the footnote giving definition of
__atomic_thread_fence().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 4ae3ca8..f26a7c5 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -174,7 +174,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering
+\centering\OneColumnHSpace{-.1in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
@@ -318,6 +318,8 @@ ordering and memory barriers work, read on!
 The first stop is
 Figure~\ref{fig:advsync:Memory Ordering: Store-Buffering Litmus Test},
 which has \co{__atomic_thread_fence()} directives\footnote{
+	One of GCC's atomic intrinsics briefly introduced in
+	Section~\ref{sec:toolsoftrade:Atomic Operations (C11)}.
 	Similar to the Linux kernel's \co{smp_mb()} full memory barrier.}
 placed between
 the store and load in both \co{P0()} and \co{P1()}, but is otherwise
@@ -339,7 +341,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering
+\centering\OneColumnHSpace{-0.75in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
@@ -362,8 +364,8 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.
 	5 & (Finish store) & & \tco{x0==2} &
 		(Finish store) & & \tco{x1==2} \\
 	\hline
-	6 & \tco{r2 = *x1;} (2) & \tco{x0==2} & \tco{x1==0} &
-		\tco{r2 = *x0;} (2) & \tco{x1==2} & \tco{x0==0} \\
+	6 & \tco{r2 = *x1;} (2) & & \tco{x1==2} &
+		\tco{r2 = *x0;} (2) & & \tco{x0==2} \\
 \end{tabular}
 \caption{Memory Ordering: Store-Buffering Sequence of Events}
 \label{tab:advsync:Memory Ordering: Store-Buffering Sequence of Events}
-- 
2.7.4

