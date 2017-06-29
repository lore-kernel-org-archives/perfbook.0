Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=/YVc/d/OV3+yjeHGqQZ5AVqaq8cPPIIAy/XPfkRFmCM=;
 b=jaOuTP1PQcqk6kfM4oKCHbKcJZklQuF88/oWUv4DA1fRtMmcmJz4/pTwQzRW6Y4uqr
 Huj7Md9LFZDAlwb2V2mYUTbiJrfg96M/j252eTU4YcV59ZhLcAfsf40hg7o77pTl2YcZ
 Pk7/yHB1Xz8THymqg9OGvc/vXJEYAlW8OBDzKsQU3rJ1Icy1eLUyIdW42rmIIKg/O06F
 Jkyd7Qeps3/gOFL4i1uCV8X6DBRUFrkgNK9FoWgNrX0LAVwy74yWu9FcmgzR+q+/jx7c
 dwy4IGacCLApTxMwBcQKX7BOfDhQhsKtqJbMQFxfQmVBYHQlm+D1hbDRwvysCkGrYSXK
 3amA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Trivial typo fixes
Message-ID: <58a4e2f1-3296-f9a7-5d50-2f7896783341@gmail.com>
Date: Fri, 30 Jun 2017 00:20:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 309126f6728e3b2b9abf98f77fc97788afb527ea Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 30 Jun 2017 00:10:01 +0900
Subject: [PATCH] advsync: Trivial typo fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index dfa7681..03ad184 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -136,7 +136,7 @@ from multiple CPUs to a set of shared variables.
 In cache-coherent systems, if the caches hold multiple copies of a given
 variable, all the copies of that variable must have the same value.
 This works extremely well for concurrent reads, but not so well for
-concurrent writes:  Each write musd do something about all
+concurrent writes:  Each write must do something about all
 copies of the old value (another cache miss!), which, given the finite
 speed of light and the atomic nature of matter, will be slower
 than impatient software hackers would like.
@@ -163,7 +163,7 @@ of order, which can in turn cause serious confusion, as illustrated in
 Figure~\ref{fig:advsync:CPUs Can Do Things Out of Order}.
 In particular, these store buffers can cause the memory misordering
 shown in the store-buffering litmus test in
-Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}
+Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 % @@@ More here.  Some sort of illustration of store-buffering misordering

-- 
2.7.4

