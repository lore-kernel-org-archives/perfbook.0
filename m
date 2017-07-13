Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fEnrd/CY9IiccTcizTaE+FT7llwZChjuh7VtUew6x+A=;
 b=Fhl2/filkhUT1SxX1YnqKHJNVySIbgpYPAlwYldFYrjz4iHHtHIvjwidheKCReomzO
 nD9UBFCiJx0UQhaqnD/avts4NkAQQj7yP1qayIUWeMRSef4mCJ8A/v5c2MvutR5JhK5o
 OjzLt1JnYJYSAJ0OiIQbX2VyEZxXQrPseGNEGRwxWnaA50E9nKcLpUYT8d1hC+4JDkik
 8SGSOaO34ZRthDHVbP4fBnNnhTD/1oiDqwGOSOtyUUR6qofzFpfpq4ylnE3Ne3p3hBlQ
 JluiJYjYy/cUGEh8uj4A3sHOeBqqtvMFVAbo/LSuVdbE/HezI3vac+2HFcLgVXgwSBuH
 upmw==
Subject: [PATCH 7/6] advsync: Catch up changes in litmus tests
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7bd744f0-c6dd-467b-e367-fac6a6ff6e2d@gmail.com>
Date: Thu, 13 Jul 2017 22:38:25 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9a30f29d248fbe1e6a7b25f2af2b233889639837 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 13 Jul 2017 21:43:43 +0900
Subject: [PATCH 7/6] advsync: Catch up changes in litmus tests

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This patch is a followup to the previous patch set.
It won't conflict with any one in the set.

       Thanks, Akira
--
 advsync/memorybarriers.tex | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index a1c3327..4d81d44 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -23,8 +23,8 @@ RCU.
  6 {
  7   int r2;
  8
- 9   WRITE_ONCE(x0, 2);
-10   r2 = READ_ONCE(x1);
+ 9   WRITE_ONCE(*x0, 2);
+10   r2 = READ_ONCE(*x1);
 11 }
 12
 13
@@ -32,8 +32,8 @@ RCU.
 15 {
 16   int r2;
 17
-18   WRITE_ONCE(x1, 2);
-19   r2 = READ_ONCE(x0);
+18   WRITE_ONCE(*x1, 2);
+19   r2 = READ_ONCE(*x0);
 20 }
 21
 22 exists (1:r2=0 /\ 0:r2=0)
@@ -293,9 +293,9 @@ thus allowing you to stop reading this section.
  6 {
  7   int r2;
  8
- 9   WRITE_ONCE(x0, 2);
+ 9   WRITE_ONCE(*x0, 2);
 10   smp_mb();
-11   r2 = READ_ONCE(x1);
+11   r2 = READ_ONCE(*x1);
 12 }
 13
 14
@@ -303,9 +303,9 @@ thus allowing you to stop reading this section.
 16 {
 17   int r2;
 18
-19   WRITE_ONCE(x1, 2);
+19   WRITE_ONCE(*x1, 2);
 20   smp_mb();
-21   r2 = READ_ONCE(x0);
+21   r2 = READ_ONCE(*x0);
 22 }
 23
 24 exists (1:r2=0 /\ 0:r2=0)
@@ -598,7 +598,7 @@ loads and stores.
  7 P0(int* x0, int* x1) {
  8
  9   WRITE_ONCE(*x0, 2);
-10   smp_mb();
+10   smp_wmb();
 11   WRITE_ONCE(*x1, 2);
 12
 13 }
-- 
2.7.4


