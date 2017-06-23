Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KqMgLz184gKnbnNqsKAoQ132xt30bYVSZNyMejZRc2w=;
 b=jlQLZBHUlb1aWoSwdyFINisVBUfGBRUlLaM8DeLTfjQsSnWh4Dy64w41jLUkQGL1V9
 s+YYKG5jxpuW0g29hBX8bmIdiEH0Zi7xmlnUmqdRRPgqGAKW881Y4jMsrQyIInm7ABUp
 KZj6tmAamwDSLH2tmxvej+tUY1PVAPQI2BYS/BS7bgc6p0LxOtVGq/F3Z4ECUqjZw3oq
 Bw8TWZcpR3uhiEs94JITyHZ6oPhgPU+ViMoOjrWnDN4vCZYcF1d6E3IOep8DxU6eMVzj
 z7ugztKBZVNno4p5oxSqUEEOqYE4nRSYproCnd7iFGNbeL5g60SS4DmjcMgyk0HQYKXI
 zGHg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Substitute 'Figure' for 'Table'
Message-ID: <4ce849ae-c0d1-bbee-1438-fa953206d7a4@gmail.com>
Date: Sat, 24 Jun 2017 00:17:50 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b65cb246b772bf16020ef1f1dab55208a5444fcd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 24 Jun 2017 00:04:14 +0900
Subject: [PATCH] advsync: Substitute 'Figure' for 'Table'

Commit 96ab6febd94c ("advsync: Convert memory-misordering table to
herd7 litmus test") missed these substitutions.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index f165946..901c5a6 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -49,7 +49,7 @@ Unfortunately, these intuitions break down completely in face of
 code that makes direct use of explicit memory barriers for data structures
 in shared memory.
 For example, the litmus test in
-Table~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
+Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
 appears to guarantee that the assertion never fires.
 After all, if \nbco{0:r2=0},\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
@@ -65,7 +65,7 @@ assertion.
 The example is symmetric, so similar hopeful reasoning might lead
 us to hope that \nbco{1:r2=0} guarantees that \nbco{0:r2=1}.
 Unfortunately, the lack of memory barriers in
-Table~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
+Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
 dashes these hopes.
 Both the compiler and the CPU are within their rights to reorder
 the statements within both Thread~\co{P0()} and Thread~\co{P1()},
-- 
2.7.4

