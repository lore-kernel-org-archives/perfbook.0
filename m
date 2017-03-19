Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=rwimIiEdW/PjjpBIhaxSuCMJC9vxtZZ7nMX0ngPxQdc=;
 b=bWN1Vy87TEzU7lm326lRysTghgsRVeiVNAsD6yueV1wVcJ9KvYT1wN6Wc3jXZueSRA
 ZOlwlTGg8fj5bgTMd0Szf9I2e/w3hOKaFWZ/tweEQnSO0zmOpthIDBir2Jy1LiveEqOp
 kaLDr02dk4igsN1lqrH4/0KOgZZdn3uAA4OcjHfBuq+KUouNuEbpNLvj1+khMcLApkik
 PAncD+kclflsRHa6VbsxlGlQ4LMwvKWXKpBrG8CQ4tvk/qmqEUCkKEZCtBgln2Xu+jtg
 SnRi/jwPP0N/b7u6mQuevpWAbqd3lJX07hPmAAe20NeCemxhRsOqu2J4171iysSif8IN
 dB7w==
Subject: [PATCH 6/6] whymb: Convert to 'description' (part 5)
References: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9ee2c8c1-b60b-fc0b-4769-614da9700bfb@gmail.com>
Date: Mon, 20 Mar 2017 00:55:54 +0900
MIME-Version: 1.0
In-Reply-To: <ad161e9f-b7f1-9e60-bed1-bad4a226e418@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e29e397c3eab7359cdd866d5a59a0af56dfd22c4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 19 Mar 2017 23:33:50 +0900
Subject: [PATCH 6/6] whymb: Convert to 'description' (part 5)

This list is also a candidate for conversion to "description".
Also adjust conjugation of verbs that follow labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index d6dd15f..6c6b28a 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -2221,22 +2221,23 @@ worry about memory barriers.

 SPARC has a very flexible memory-barrier instruction~\cite{SPARC94}
 that permits fine-grained control of ordering:
-\begin{itemize}
-\item	{\tt StoreStore}: order preceding stores before subsequent stores.
+\begin{description}
+\item	[\tco{StoreStore}] orders preceding stores before subsequent stores.
 	(This option is used by the Linux \co{smp_wmb()} primitive.)
-\item	{\tt LoadStore}: order preceding loads before subsequent stores.
-\item	{\tt StoreLoad}: order preceding stores before subsequent loads.
-\item	{\tt LoadLoad}: order preceding loads before subsequent loads.
+\item	[\tco{LoadStore}] orders preceding loads before subsequent stores.
+\item	[\tco{StoreLoad}] orders preceding stores before subsequent loads.
+\item	[\tco{LoadLoad}] orders preceding loads before subsequent loads.
 	(This option is used by the Linux \co{smp_rmb()} primitive.)
-\item	{\tt Sync}: fully complete all preceding operations before starting
+\item	[\tco{Sync}] fully completes all preceding operations before starting
 	any subsequent operations.
-\item	{\tt MemIssue}: complete preceding memory operations before subsequent
+\item	[\tco{MemIssue}] completes preceding memory operations before subsequent
 	memory operations, important for some instances of memory-mapped
 	I/O.
-\item	{\tt Lookaside}: same as MemIssue, but only applies to preceding stores
+\item	[\tco{Lookaside}] does the same as MemIssue,
+	but only applies to preceding stores
 	and subsequent loads, and even then only for stores and loads that
 	access the same memory location.
-\end{itemize}
+\end{description}

 The Linux \co{smp_mb()} primitive uses the first four options together,
 as in
-- 
2.7.4


