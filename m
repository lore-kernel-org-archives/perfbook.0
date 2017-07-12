Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3f0mjfjk52NazInSL8DQYPinC6x7Z+s0LZF+KMb7fRE=;
 b=Sl7ZqeAdSwCn3GUxnokALE0B1OhUMR/p7Q0iLlM0CtrvcbEOMKPStd5e6hMEMKlOmd
 tcGG4w16VUpWLJdnzBWemUefArKU7Z3t0nXxX0enLS+ay84KPnURLs8vvL40QldcArCV
 ZBmo1N5FOJo3HeePX2ZAywhXexTeBrHW5WDwRDp+ytxqhru0wTt1nyRonG0GV07KG+kX
 tQ6ZTj88xSO5KdNY3TvT7XMtiWr5BXs1NXGKZNbnEFoBW0W2uEGyvGaEw3HWmOain5Mt
 Gx5wSCJgRxgFrE9tsE5E9tG2naMYvlHJhs91brZaRL6FzSXr7SQ6eZMHMgzBjH2G9EiW
 vARA==
Subject: [PATCH 5/6] advsync: Fix grammatical error
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <35f035e4-0568-442d-02d7-f3cf5d8a178e@gmail.com>
Date: Thu, 13 Jul 2017 00:13:02 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b97b1a0383b55fb5202e4799f2c1dafe576de5ee Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 22:50:16 +0900
Subject: [PATCH 5/6] advsync: Fix grammatical error

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index b085443..8693cac 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -847,9 +847,9 @@ instruction.

 Figure~\ref{fig:advsync:Message-Passing Address-Dependency Litmus Test}
 shows a linked variant of the message-passing pattern.
-The head pointer is \co{x1}, which is initially
+The head pointer is \co{x1}, which initially
 references the \co{int} variable \co{y} (line~5), which is in turn 
-is initialized to the value $1$ (line~4).
+initialized to the value $1$ (line~4).

 \co{P0()} updates head pointer \co{x1} to reference \co{x0} (line~12),
 but only afer initializing it to $2$ (line~10) and forcing ordering
-- 
2.7.4


