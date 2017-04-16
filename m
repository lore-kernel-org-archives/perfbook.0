Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3TA+tVMhUz3LJWViQIU7ShH6AontYIu+J6qWBzCga+k=;
 b=AWZ1c4Cfh/+v5vdIsa9/MVpByPW8sj+uDZTvUNaxRMuR+HzLsJ6IDgWY+QOs64vQ9d
 4c5e5m3JqxTUatG7Dh6iYa+yuSihPONn0sRRZsvPjFaXPPhz83YTvxqWUJndNzW8V+rX
 VgvzUyZVQR/f6g1017hEjZ05f3nAiNhDv5lsjhEzjL67n/hcc+l1SbriUcIfF5+uFHqg
 BDX8RP9A5pE3rKLaBp3Buh1WSIeO0pLQ9sQW03/8Ex9q808d1wfrozjDwyWtKO3zSaaN
 GAC1aP7EhrgeukRM2BM1A+LRVlF7+f2A8x73BfLIjLJLLMJBGakiKzppEVPY+/qG5rQX
 rTEA==
Subject: [PATCH 09/14] advsync: Use READ_ONCE()/WRITE_ONCE() in sequence of
 'Device Operations'
References: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d007aa6f-9c53-bbcc-e2c8-463bd7c2a9d4@gmail.com>
Date: Mon, 17 Apr 2017 07:22:29 +0900
MIME-Version: 1.0
In-Reply-To: <be8c3cb5-9ee2-9f60-bfcd-e729389304f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 20904d88784deb41bfb853b198017eca6a058bc8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 16 Apr 2017 23:44:56 +0900
Subject: [PATCH 09/14] advsync: Use READ_ONCE()/WRITE_ONCE() in sequence of 'Device Operations'

Using pseudo-asm code here results in a redundant look. In this
section, using READ_ONCE()/WRITE_ONCE() in code sequence gives
a good contrast with the resulting ordering of memory accesses.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 7b50511..f94b113 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1261,15 +1261,15 @@ Some devices present their control interfaces as collections of memory
 locations, but the order in which the control registers are accessed is very
 important.  For instance, imagine an Ethernet card with a set of internal
 registers that are accessed through an address port register~(A) and a data
-port register~(D).  To read internal register~5, the following code might then
-be used:
+port register~(D).  To read internal register~5, the following code (in C)
+might then be used:

 \vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
-*A = 5;
-x = *D;
+WRITE_ONCE(*A, 5);
+x = READ_ONCE(*D);
 \end{verbatim}
 \vspace{1pt}
 \end{minipage}
-- 
2.7.4


