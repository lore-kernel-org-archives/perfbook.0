Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=KN3phYToMKeiug78U/y6KyXwyMB5rPBPHW6vULhcnJE=;
 b=NbxAEeKsmkYsoPpB5kRXtEL2a/mwfp/D/O3cBHOZ3hxR6PljPUk+1qIpYzD2tSOjNa
 OZ7iP0Ti8ALMdsnBPUYepMaft95Xc1GDTDTUXfCTlDPkHgU9kBRSa+N3ryFgLjNw1jMB
 GvFOicDJO7IIyBL133bcGBG58k4GdWYetoj7Bc4A179e2VkPOv6b7u1MIcv01PUkEBaR
 4p//uIXcl7th5ZIfIpdnKjKqcDBK9IHPbzsUkYl3zDCMbnRiF0oCcgUb5xGlI5QAl7Qv
 H6x5qmorCmouSogLE1LerJT0hMkAoC1nycaj/FcSqm0gFiPtFOCoT2Sa6KV9nCgrHl3/
 KoVw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Move footnote to avoid confusion
Message-ID: <e2fe6182-afed-b38d-c1f0-25916e072b0f@gmail.com>
Date: Sat, 1 Jul 2017 06:48:14 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b1ef8b3ee5697202ae96fc8c7ebd85633aa0a703 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 30 Jun 2017 21:23:07 +0900
Subject: [PATCH] advsync: Move footnote to avoid confusion

This footnote marker placed just after number "0" looks like as if
it were math mode $0^1$. Move the marker backward to avoid confusion.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 03ad184..a2e4a20 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -50,12 +50,12 @@ code that fails to use standard mechanisms.
 For example, the trivial-seeming litmus test in
 Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
 appears to guarantee that the \co{exists} clause is never satisfied.
-After all, if \nbco{0:r2=0}\footnote{
+After all, if \nbco{0:r2=0} as shown in the \co{exists} clause,\footnote{
 	That is, Thread~\co{P0()}'s instance of local variable \co{r2}
 	equals zero.
 	See Section~\ref{sec:formal:Anatomy of a Litmus Test}
 	for documention of litmus-test nomenclature.}
-as shown in the \co{exists} clause, we might hope that Thread~\co{P0()}'s
+we might hope that Thread~\co{P0()}'s
 load from~\co{x1} must have happened before Thread~\co{P1()}'s store to~\co{x1},
 which might raise
 further hopes that Thread~\co{P1()}'s load from~\co{x0} must happen after
-- 
2.7.4

