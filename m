Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0U1hIzRU70Dq24SJghg2n7YYCkFJtZQS1RmxL2l66aw=;
        b=s74g4vwDAtk0QQIUXypMSFaTJ0B22KHPxE9uOvfq4uZp5mivUnV/sNAJC8i61fgcly
         dL5UUWZQlKs/QB9eSbAO2SbdHywFNWSh7K4XaD54ab7Pixm150r8hYgS6mwDvWE9mCcA
         DofFWdRadD/JfdAw0HcoNC+nJj0rToU5yfLgJmsXugEjSAtCWAjUpHYrflI9VJ3rtXW/
         ldDzYpCpEyA4r75zXn9+QKZRVmfXEknSs9OarINC/vTXVp8h353Zb18e+WtcA8RHLkZX
         UOsmjrL7hpbuJOz0qxpynI18u6m3bWbSQz5+4ZSRyG/s8NgfsdvUt02jLj2IjpQGeYvo
         rR+w==
Subject: [PATCH 2/4] CodeSamples/formal/herd: Add recipe for klitmus7-ready
 tests
References: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ceb715e1-f421-3cf9-d0ee-54e7a1bf7152@gmail.com>
Date: Fri, 30 Nov 2018 07:12:29 +0900
MIME-Version: 1.0
In-Reply-To: <fc9a8cff-4982-e97e-7437-5edcc401ce7f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0d7dfde21ffe55289ade8c84385a3abbd3c7502b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Nov 2018 20:55:43 +0900
Subject: [PATCH 2/4] CodeSamples/formal/herd: Add recipe for klitmus7-ready tests

List such tests in KLITMUS_READY.

Those tests converted from ../litmus are klitmus7 ready from the
beginning.

Add "-rcu yes" option to klitmus7 to cover RCU tests.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 05a8e6d..e23148e 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -49,6 +49,8 @@ ABSPERF_SHORT  := $(filter-out $(ABSPERF_LONG),$(ABSPERF_TEST))
 ABSPERF_OUT    = absperf.out absperf-all.out
 HERD7_TEST     := $(filter-out $(ABSPERF_TEST),$(HERD7_LITMUS))
 HERD7_OUT      := $(HERD7_TEST:%.litmus=%.out)
+KLITMUS_READY = C-RCU-remove C-RomanPenyaev-list-rcu-rr
+KLITMUS_TEST   := $(addsuffix .litmus,$(KLITMUS_READY))
 
 .PHONY: all clean litmus2herd run-herd7 run-absperf run-absperf-all cross-klitmus
 .PHONY: help
@@ -98,9 +100,9 @@ $(ABSPERF_OUT):
 
 cross-klitmus: klitmus.tar
 
-klitmus.tar: litmus2herd
+klitmus.tar: litmus2herd $(KLITMUS_TEST)
 	mkdir -p klitmus
-	klitmus7 -o klitmus $(LITMUS7_HERD_TEST)
+	klitmus7 -rcu yes -o klitmus $(LITMUS7_HERD_TEST) $(KLITMUS_TEST)
 	tar cf klitmus.tar ./klitmus
 
 help:
-- 
2.7.4


