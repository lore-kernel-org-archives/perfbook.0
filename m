Return-Path: <SRS0=EKR/=PJ=gmail.com=shiyn.lin@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Cq+lEf6tz1LufFnT0r3AbNoOZ6knDqdqLxJz6ICvGw=;
        b=Pgphpq+ivmOM1oK2PQzlW6ce7hEYtB17MkoTKUjPVgNeGnc9BLTs4fkTrcYbsOyRGw
         d3BVwTEPiqNES+LGtr/AzZrOhFYAh8TyZxwYOSk2KrBSxbBHlxnN6J/VW8EmSrgRxh45
         QvahBR7/3VIRexsrsZasYSQLmx2N5ZPSQJaTwPlEovnaShnRTTNS9n17YN2i8bnZFogS
         4tAt9X/Sz/S473aoWcq+kDG3bf6bR1KNeK6MQeq56JTxb/V5s/w5tKhcK28l3tbEMn6s
         2VbgkFQxQ6knUYkeDjxkr6jnX/kQXJw4QzRxVlzuQm5ogQiIPARXCfSl/2Ek/aHrvrjr
         rwoQ==
From: Chin En Lin <shiyn.lin@gmail.com>
Subject: [PATCH] advsync: Fix the abstract description of the queuetorture.h
Date: Thu, 21 Oct 2021 21:42:09 +0800
Message-Id: <20211021134209.16872-1-shiyn.lin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, shiyn.lin@gmail.com
List-ID: <perfbook.vger.kernel.org>

The words should describe queuetorture.h instead of deqtorture.h.
Also, add the parentheses to 'create_thread' in the comments of
concurrent_pop.

Signed-off-by: Chin En Lin <shiyn.lin@gmail.com>
---
 CodeSamples/advsync/queuetorture.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/advsync/queuetorture.h b/CodeSamples/advsync/queuetorture.h
index 29743ef5..c02d4736 100644
--- a/CodeSamples/advsync/queuetorture.h
+++ b/CodeSamples/advsync/queuetorture.h
@@ -1,5 +1,5 @@
 /*
- * deqtorture.h: torture tests for double-ended queue.
+ * queuetorture.h: torture tests for simple queue.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -82,7 +82,7 @@ void *concurrent_push(void *arg)
  * Dequeue as specified by the q_test structure. This may be called
  * directly (in which case the number of elements to be popped must
  * be exactly that required and the specified goflag already set to
- * GOFLAG_START), or via create_thread.
+ * GOFLAG_START), or via create_thread().
  */
 void *concurrent_pop(void *arg)
 {
-- 
2.25.1

