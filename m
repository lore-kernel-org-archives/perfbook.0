Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ODJk/8ggL1OKztbZmz/UnGvhhGlVDXWvQ9Sz9DJoRZE=;
        b=HcmH068nA5gArYnJ48Vb1Xq9/tmV7I5bQhE/hREXdGsQ71ILbMHw8UPiAfuIXBKpRO
         X2unupRhGNkKxqbBuIovXfBMkipgmS5VD8bcqXwjixiPF6HZubV3Um1+9B9VeC434F01
         lcWUq6MjRw3dnQ6UMfP/5v+x7j16usYj5LbhUKWoiRGLcKs1d/R4HFORe+TGB1nmH+8J
         NTgdaAsFihUw9MRW90bGP3ABJ5cj6GFKyzzVIXpIkKpNhockJvVD2dK9B3rI6OnndF6I
         fSLguWAp3zdxXXU6+i0nxDC+mmnOroHslTxnXVW1sljAt1GDJQgx0V/B1aRGX4t7ixTn
         FUbw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] formal/spinhint: Update memory usage in QRCU Spin summary
 table
Message-ID: <5a8f5e9f-7bea-2f4a-5189-39ce378b7a12@gmail.com>
Date: Thu, 14 Feb 2019 00:17:34 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 28d0c3ce44cc2267b2a27aef333c5b15511b8125 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 13 Feb 2019 23:26:07 +0900
Subject: [PATCH 1/2] formal/spinhint: Update memory usage in QRCU Spin summary table

The memory usage and runtime data of 3 readers and 3 updaters
presented in Table 12.3 were from a run with a depth limit an
order of magnitude larger than the reached depth. Update the data
from a just finished run with a tighter depth limit.

Also fix a typo and substitute "Spin" for "spin" for consistency.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 39826cd..231d861 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -6,12 +6,12 @@
 \epigraph{Follow every byway / Every path you know.}
 	 {\emph{``Climb Every Mountain'', Rodgers \& Hammerstein}}
 
-This section features the general-purpose Promela and spin tools,
+This section features the general-purpose Promela and Spin tools,
 which may be used to carry out a full
 state-space search of many types of multi-threaded code.
 They are also quite useful for verifying data communication protocols.
 Section~\ref{sec:formal:Promela and Spin}
-introduces Promela and spin, including a couple of warm-up exercises
+introduces Promela and Spin, including a couple of warm-up exercises
 verifying both non-atomic and atomic increment.
 Section~\ref{sec:formal:How to Use Promela}
 describes use of Promela, including example command lines and a
@@ -133,12 +133,12 @@ cc -DSAFETY -o pan pan.c    # Compile the model
 \begin{listing}[tbp]
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/increment.spin.lst}
 \vspace*{-9pt}
-\caption{Non-Atomic Increment spin Output}
-\label{lst:analysis:Non-Atomic Increment spin Output}
+\caption{Non-Atomic Increment Spin Output}
+\label{lst:analysis:Non-Atomic Increment Spin Output}
 \end{listing}
 
 This will produce output as shown in
-Listing~\ref{lst:analysis:Non-Atomic Increment spin Output}.
+Listing~\ref{lst:analysis:Non-Atomic Increment Spin Output}.
 The first line tells us that our assertion was violated (as expected
 given the non-atomic increment!).
 The second line that a \co{trail} file was written describing how the
@@ -182,8 +182,8 @@ The assertion then triggered, after which the global state is displayed.
 \begin{listing}[htbp]
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/atomicincrement.spin.lst}
 \vspace*{-9pt}
-\caption{Atomic Increment spin Output}
-\label{lst:analysis:Atomic Increment spin Output}
+\caption{Atomic Increment Spin Output}
+\label{lst:analysis:Atomic Increment Spin Output}
 \end{listing}
 
 It is easy to fix this example by placing the body of the incrementer
@@ -194,7 +194,7 @@ One could also have simply replaced the pair of statements with
 atomic.
 Either way, running this modified model gives us an error-free traversal
 of the state space, as shown in
-Listing~\ref{lst:analysis:Atomic Increment spin Output}.
+Listing~\ref{lst:analysis:Atomic Increment Spin Output}.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
@@ -999,7 +999,7 @@ lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
         3 & 2 &   186 202 860 &    328 014 & 28 & 10 482.51 & 390 &
 		77 &  222.26 &   2560    \\
 	3 & 3 & 9 664 707 100 &  2 055 621 &    &          &      &
-		84 & 6515.38 & 272000    \\
+		84 & 5557.02 & 266000    \\
 	\bottomrule
 \end{tabular}
 \caption{QRCU Spin Result Summary}
@@ -1019,7 +1019,7 @@ Table~\ref{tab:advsync:Memory Usage of QRCU Model}, where the
 hashtable size starts from the default of \co{-w24}.
 The runtime is from a \Power{9} server, which shows that \co{-DMA=N}
 suffers up to about an order of magnitude higher CPU overhead
-than does \co{-DCOLLAPSE}, but on the other hand reduces memroy overhead
+than does \co{-DCOLLAPSE}, but on the other hand reduces memory overhead
 by well over an order of magnitude.
 
 So far so good.
-- 
2.7.4

