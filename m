Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Klf/AeNjuqiAsyGb9fSdYo1PwRqODTWQ6k8XT2yfXU=;
        b=hVdGyptebBtdEatWeUYcPDtucMprE/n3gBS7bA0IJ6Jpe2ta6Xjo3A+QKJyrS7RjLX
         S3wE4CcgPcdGkNvQz/MdhOjXSxwWafo/oT4X597x+i/s/3euVMBLHK28ZHr0hHowabjl
         KJtSkZ8CLCyVtiZaavhQPu+m8c1jKI8dYdvxGpbf28o2AuKhH7Fsb7pfTBEGC4GkgJ21
         bgTEEzS46pLJTIApt9ZqCmNUwuQpq9jVKF71KWM33XPvM+X4a0pcFVD/0XX/22i0eiyn
         w9xgGANh3t3wI5bRZeQVgFNcvHisEyaUAm4BpPzRzrYMtgwZGR6RYqsIckD5YVyZ/Uvo
         /u8A==
Subject: [PATCH 3/8] CodeSamples/formal/herd: Add recipe for native .litmus
 tests
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <133af9cb-54f7-898a-fcf6-d34a280b82b6@gmail.com>
Date: Thu, 1 Nov 2018 00:12:00 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 64a22b4d12c77d2a6332b39b82425276125d5f7d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 07:41:39 +0900
Subject: [PATCH 3/8] CodeSamples/formal/herd: Add recipe for native .litmus tests

Also update info on where the kernel memory model resides.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 3162659..05a8e6d 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -17,15 +17,16 @@
 #
 # Note: There need to be a symbolic link "memory-model" under
 #       CodeSamples/formal/herd for herd7 to work.
-#       The memory model is available at the git archive:
-#           https://github.com/aparri/memory-model.git.
+#       The memory model is available at tools/memory-model in
+#       the source tree of Linux kernel v4.17 (or later).
+#
 #       Make sure the symbolic link points to the actual directory.
 #       Alternatively, you can copy the files listed in LKMM_FILES to
 #       a subdirectory "memory-model".
 #
 #       klitmus7 doesn't require the memory model.
 #
-# Copyright (C) Akira Yokosawa, 2017
+# Copyright (C) Akira Yokosawa, 2017, 2018
 #
 # Authors: Akira Yokosawa <akiyks@gmail.com>
 
@@ -39,12 +40,15 @@ KLITMUS7_CMD := $(shell which klitmus7)
 LITMUS7_TEST := $(notdir $(wildcard ../litmus/*.litmus))
 LITMUS7_HERD_TEST := $(addsuffix .herd,$(LITMUS7_TEST))
 LITMUS7_HERD_OUT  := $(addsuffix .out,$(LITMUS7_TEST))
+HERD7_LITMUS   := $(wildcard *.litmus)
 TIMEOUT = 15m
 ITER    = 10
 ABSPERF_TEST   := $(wildcard C-SB+l-*.litmus)
 ABSPERF_LONG   := $(wildcard C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-*.litmus)
 ABSPERF_SHORT  := $(filter-out $(ABSPERF_LONG),$(ABSPERF_TEST))
 ABSPERF_OUT    = absperf.out absperf-all.out
+HERD7_TEST     := $(filter-out $(ABSPERF_TEST),$(HERD7_LITMUS))
+HERD7_OUT      := $(HERD7_TEST:%.litmus=%.out)
 
 .PHONY: all clean litmus2herd run-herd7 run-absperf run-absperf-all cross-klitmus
 .PHONY: help
@@ -56,25 +60,28 @@ litmus2herd: $(LITMUS7_HERD_TEST)
 $(LITMUS7_HERD_TEST): %.herd: ../litmus/%
 	sh ./litmus2herd.sh $< $@
 
-run-herd7: $(LITMUS7_HERD_OUT)
+run-herd7: $(LITMUS7_HERD_OUT) $(HERD7_OUT)
 run-absperf: absperf.out
 run-absperf-all: absperf-all.out
 
 $(LKMM_LIST):
 	@echo "#####################################################"
 	@echo "### Please prepare Linux Kernel Memory Model.     ###"
-	@echo "### You can get it at the git archive:            ###"
-	@echo "###   https://github.com/aparri/memory-model.git  ###"
+	@echo "### It is available at tools/memory-model in      ###"
+	@echo "### the source of Linux kernel v4.17 (or later).  ###"
 	@echo "###                                               ###"
 	@echo "### Refer to comment in Makefile for more info.   ###"
 	@echo "#####################################################"
 	@exit 1
 
-$(LITMUS7_HERD_OUT) $(ABSPERF_OUT): $(LKMM_LIST)
+$(LITMUS7_HERD_OUT) $(ABSPERF_OUT) $(HERD7_OUT): $(LKMM_LIST)
 
 $(LITMUS7_HERD_OUT): %.out: %.herd
 	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
 
+$(HERD7_OUT): %.out: %.litmus
+	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
+
 absperf.out: ABSPERF_LIST = $(ABSPERF_SHORT)
 absperf.out: $(ABSPERF_SHORT)
 absperf-all.out: ABSPERF_LIST = $(ABSPERF_TEST)
-- 
2.7.4


