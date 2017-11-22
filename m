Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HnxghOtR7mgHTyEUzHmgzDBupqVAs47OCVo7Syp0nqw=;
 b=jq+8LfIgGNDODp+Wq5T577iMU+0DRqzttCJaBDVN4OSZEC496H0q/Omy/dzmTi3QIj
 zCppfvBgGjQDtc0LFa/mwAwPD2P/VadNA/I+TrOHs+IB/4JZYJhFzcXpMnjvxMI3rpVc
 lsGO2ZUj+nXFL1JVbzWbf+2XCyZqjlZnYQjew0/U/hmIWMg1mr3+YGGnSz4+WrYL0tmn
 D12o8om0E+jfT9mWgMYCCup6g1xcWFjSMPa3LyfSm8Vp2bGCq2XpB9oLBWNxzbCLLUTK
 QzXrewOZ6dnq1N4RM6dLEPKk8iQ0DffVZGhf+bPPdslQ+4IT6Wa94tr0ldgzPyyknyKs
 HuXg==
Subject: [PATCH] CodeSamples/formal/herd: Add existence check of memory model
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
 <20171122001231.GP3624@linux.vnet.ibm.com>
 <3840ADCE-66F6-417D-B3B6-22BBE87E85E4@gmail.com>
 <20171122061113.GT3624@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <4d0da030-04c6-06ea-94f1-a7ecf654f58d@gmail.com>
Date: Wed, 22 Nov 2017 20:32:26 +0900
MIME-Version: 1.0
In-Reply-To: <20171122061113.GT3624@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 53df3405f334e7cda1d650fefbf5fba416aa4abe Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 22 Nov 2017 20:08:09 +0900
Subject: [PATCH] CodeSamples/formal/herd: Add existence check of memory model

If any of the necessary files is lacking, output a message
to give instructions for preparation of the memory model.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/.gitignore |  1 +
 CodeSamples/formal/herd/Makefile   | 28 +++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/formal/herd/.gitignore b/CodeSamples/formal/herd/.gitignore
index c7ba463..e0ad195 100644
--- a/CodeSamples/formal/herd/.gitignore
+++ b/CodeSamples/formal/herd/.gitignore
@@ -2,3 +2,4 @@
 *.herd
 klitmus
 klitmus.tar
+memory-model
diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 9df6e65..1abe5c7 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -9,14 +9,24 @@
 #
 # run-herd7-bench: Run benchmark tests of herd7 itself
 #
-# Note: LKMM model is assumed to reside in a directory next to perfbook's
-#       local repository.
+# Note: There need to be a symbolic link "memory-model" under
+#       CodeSamples/formal/herd for herd7 to work.
+#       The memory model is available at the git archive:
+#           https://github.com/aparri/memory-model.git.
+#       Make sure the symbolic link points to the actual directory.
+#       Alternatively, you can copy the files listed in LKMM_FILES to
+#       a subdirectory "memory-model".
+#
+#       klitmus7 doesn't require the memory model.
 #
 # Copyright (C) Akira Yokosawa, 2017
 #
 # Authors: Akira Yokosawa <akiyks@gmail.com>

-LKMM_DIR     := ../../../../memory-model
+LKMM_DIR     := memory-model
+LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
+		linux-kernel.def linux-kernel-hardware.cat lock.cat
+LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
 HERD_DIR     := $(shell pwd)
 HERD7_CMD    := $(shell which herd7)
 KLITMUS7_CMD := $(shell which klitmus7)
@@ -41,6 +51,18 @@ run-herd7: $(LITMUS7_HERD_OUT)

 run-herd7-bench: $(HERD_BENCH_OUT)

+$(LKMM_LIST):
+	@echo "#####################################################"
+	@echo "### Please prepare Linux Kernel Memory Model.     ###"
+	@echo "### You can get it at the git archive:            ###"
+	@echo "###   https://github.com/aparri/memory-model.git  ###"
+	@echo "###                                               ###"
+	@echo "### Refer to comment in Makefile for more info.   ###"
+	@echo "#####################################################"
+	@exit 1
+
+$(LITMUS7_HERD_OUT) $(HERD_BENCH_OUT): $(LKMM_LIST)
+
 $(LITMUS7_HERD_OUT): %.out: %.herd
 	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@

-- 
2.7.4


