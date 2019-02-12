Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sDxxxMrbr+JmLmT+yEtoN6O/PrYPMx4qjS8pCg7Bw64=;
        b=NO55+RW7586Jipx2J+iLklM0t73gjhACfD0841NQZjG1jTjFb4UgY+bzRQZ/ixc5hK
         RrdlDOY0uxoT2rYqgayTh7OTpk78Osyngg8GBeWGbqI1cUvVwKX91VUptFi+I5iqxNdd
         TO7YVvMRYFgGTCjABltmvrij1Huzhldd0GdberWpHLzNlQx6vmoJ1/ayLvtZzIhpmOwP
         eECeNraxJRwgPFKPqTB12jTc4uYOgY3hxPGlbFWunAUCmLq0Lkc3SGf13qwkqyWSoTHX
         z5A0Y7wUhpDzqQHSrot4KGjF1CTxIqyFEjvoMRKc7nbF5NTdCjbgdCtg/v9KjpnmE3FL
         ovAg==
Subject: [PATCH 1/4] formal/spinhint: Clarify hashtable sizes used in Tables
 12.2 and 12.3
References: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <90d897da-db4c-004e-0aae-f27e9eb8a750@gmail.com>
Date: Wed, 13 Feb 2019 00:33:34 +0900
MIME-Version: 1.0
In-Reply-To: <1b7c8489-cf0a-d959-f307-e3eadae4998c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4f0d8e38e9de5f9597ac7573a48cb64f2bb7e93f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Feb 2019 20:55:52 +0900
Subject: [PATCH 1/4] formal/spinhint: Clarify hashtable sizes used in Tables 12.2 and 12.3

Also add a footnote to mention the possibility of impractically
long runtime, and fix trivial typos.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 5e19247..7c08115 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -893,8 +893,8 @@ updaters, however, simple extrapolation indicates that this will
 require about half a terabyte of memory.
 What to do?
 
-It turns out that \co{./pan} gives advice when ti runs out of memory,
-for example, when attempting to run three readers and updaters:
+It turns out that \co{./pan} gives advice when it runs out of memory,
+for example, when attempting to run three readers and three updaters:
 
 \begin{VerbatimU}
 hint: to reduce memory, recompile with
@@ -939,7 +939,7 @@ lower than the \co{-DCOLLAPSE} usage of about half a terabyte.
 	in memory occupied by the states!
 	Is the state-space search \emph{really} exhaustive???
 \QuickQuizAnswer{
-	According Spin's documentation, yes, is.
+	According to Spin's documentation, yes, it is.
 
 \begin{listing}
 \VerbatimInput[numbers=none,fontsize=\scriptsize]{CodeSamples/formal/promela/qrcu.spin.col-ma.diff.lst}
@@ -1011,11 +1011,12 @@ summarizes the Spin results with \co{-DCOLLAPSE} and \co{-DMA=N}
 compiler flags.
 The memory usage is obtained with minimal sufficient
 search depths and \co{-DMA=N} parameters shown in the table.
-As was the case for \co{-DCOLLAPSE}, hash table sizes are tweaked by
+Hashtable sizes of \co{-DCOLLAPSE} are tweaked by
 the \co{-wN} option of \co{./pan} to avoid using too much
 memory hashing small state spaces.
 Hence the memory usage is smaller than what is shown in
-Table~\ref{tab:advsync:Memory Usage of QRCU Model}.
+Table~\ref{tab:advsync:Memory Usage of QRCU Model}, where the
+hashtable size starts from the default of \co{-w24}.
 The runtime is from a \Power{9} server, which shows that \co{-DMA=N}
 suffers up to about an order of magnitude higher CPU overhead
 than does \co{-DCOLLAPSE}, but on the other hand reduces memroy overhead
@@ -1023,7 +1024,8 @@ by well over an order of magnitude.
 
 So far so good.
 But adding a few more updaters or readers would exhaust memory, even
-with \co{-DMA=N}.
+with \co{-DMA=N}.\footnote{
+	Or, runtime would become too long to be practical.}
 So what to do?
 Here are some possible approaches:
 
-- 
2.7.4


