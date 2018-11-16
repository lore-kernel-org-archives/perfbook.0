Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=jQ7U71OGfMOZ3QZ70kz30Ro9hy6ysKoTsxWfzwxrWlc=;
 b=s85RbRELuzZeFs08SJz7dgd5EQuJOGrkvzjN+NfHGZuX0bISG9CDh7cqfWpul2Yl5X
 tjQmELS7fwHh5X6Rlv89LiC+1ZxxIcnllJIizT69AFAzTMpRFIOJo6dHAa39PtYGbtaR
 bLwxt7Ae7KomqpW5dB3U7J1M3SC5sJ7cf7MvJsowyiGbYSTUuxThZUiz9ZMNcMGKXb9U
 t/L2nVLjm4SX+nmMzQWs0ekbAgesgtu7A+DHLwv56Zf29ibowF3fuNUvgKug29Zd9+K/
 yFNESEghGnf9mzU3qs1h3LmTzrRdPSPUZQdQbYlVQrmZutGqIBEpBw7IO/t1s2ZB2rra
 BVog==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH] SMPdesign: fix typos
Date: Fri, 16 Nov 2018 16:19:57 +0800
Message-Id: <1542356397-14343-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
Hi list,

There are a few typos in Section Partitioning. Please take a look.

Thanks,
--Junchang

--
 SMPdesign/SMPdesign.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 7b4f6eb..562c057 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -936,7 +936,7 @@ We could simply assign each CPU one gigabyte of memory, and allow
 each CPU to access its own private chunk of memory, without the
 need for locking and its complexities and overheads.
 Unfortunately, this simple scheme breaks down if an algorithm happens
-to have CPU~0 allocate all of the memory and CPU~1 the free it, as
+to have CPU~0 allocate all of the memory and CPU~1 free it, as
 would happen in a simple producer-consumer workload.

 The other extreme, code locking, suffers from excessive lock contention
@@ -1017,7 +1017,7 @@ smaller than the number of non-\co{NULL} pointers.
 The allocation function \co{memblock_alloc()} may be seen in
 Listing~\ref{lst:SMPdesign:Allocator-Cache Allocator Function}.
 Line~\lnref{pick} picks up the current thread's per-thread pool,
-and line~8 check to see if it is empty.
+and line~\lnref{chk:empty} checks to see if it is empty.

 If so, lines~\lnref{ack}-\lnref{rel} attempt to refill it
 from the global pool
-- 
2.7.4

