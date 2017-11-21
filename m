Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yGfrfICKAdoDKVDbSiLG2dXh/0Kxb2usZAifKZ2tuIM=;
 b=DYxtAkyyi489BKJC/XT7kIu7LkF7bEaPBrJgUtoaMXhUTQHQPFY8Dk4k//5A8MEQxY
 7IL4FQsP0G8CQ2Mobp9Urh1xPBwiXAhbiec1bfDHoDhWxmZO/LfJxmgyw/p+lnozZwVh
 MnwAZ8LcgiY8U8Fx0fvl4XNfupQB4kRiD8qoI220rDwcDnAiLRp8toUd8mx1n8DHPixu
 Su8cB9QdeY1F+Gf4hJ4j7rCf4bENNWoyeRHlXD2bGe1T7U8wkXFoRAXxw/0qXHtpLw/y
 5rw07Ya3Xi6jhuEFIyQdFxlEoDm4dzTv/4GvUTjP3LVg/nFDZWwplsi2QGpAi3eJzLIi
 IOyw==
Subject: [PATCH 1/2] CodeSamples/formal/herd: Add Makefile and utility script
References: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <436dc15a-073d-adec-3fd6-92633bd93041@gmail.com>
Date: Wed, 22 Nov 2017 00:35:26 +0900
MIME-Version: 1.0
In-Reply-To: <eb163ed9-ab88-6227-30ab-a985ababfc69@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ec89fb990662f555202908eff08ea29ffe87fa8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 20 Nov 2017 00:09:46 +0900
Subject: [PATCH 1/2] CodeSamples/formal/herd: Add Makefile and utility script

Also add .gitignore for generated files to be ignored.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/.gitignore     |  4 +++
 CodeSamples/formal/herd/Makefile       | 60 ++++++++++++++++++++++++++++++++++
 CodeSamples/formal/herd/litmus2herd.sh | 20 ++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 CodeSamples/formal/herd/.gitignore
 create mode 100644 CodeSamples/formal/herd/Makefile
 create mode 100644 CodeSamples/formal/herd/litmus2herd.sh

diff --git a/CodeSamples/formal/herd/.gitignore b/CodeSamples/formal/herd/.gitignore
new file mode 100644
index 0000000..c7ba463
--- /dev/null
+++ b/CodeSamples/formal/herd/.gitignore
@@ -0,0 +1,4 @@
+*.out
+*.herd
+klitmus
+klitmus.tar
diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
new file mode 100644
index 0000000..9df6e65
--- /dev/null
+++ b/CodeSamples/formal/herd/Makefile
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Default target: Transform litmus tests in ../litmus to herd7 compatible format
+#         (remove 2nd {})
+#
+# run-herd7: Examine transformed litmus tests by herd7 with LKMM
+#
+# cross-klitmus7: Cross-compile transformed litmus tests with klitmus7
+#
+# run-herd7-bench: Run benchmark tests of herd7 itself
+#
+# Note: LKMM model is assumed to reside in a directory next to perfbook's
+#       local repository.
+#
+# Copyright (C) Akira Yokosawa, 2017
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+LKMM_DIR     := ../../../../memory-model
+HERD_DIR     := $(shell pwd)
+HERD7_CMD    := $(shell which herd7)
+KLITMUS7_CMD := $(shell which klitmus7)
+LITMUS7_TEST := $(notdir $(wildcard ../litmus/*.litmus))
+LITMUS7_HERD_TEST := $(addsuffix .herd,$(LITMUS7_TEST))
+LITMUS7_HERD_OUT  := $(addsuffix .out,$(LITMUS7_TEST))
+HERD_BENCH        := $(wildcard C-SB+l-*.litmus)
+HERD_BENCH_LONG   := $(wildcard C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-*.litmus)
+HERD_BENCH_SHORT  := $(filter-out $(HERD_BENCH_LONG),$(HERD_BENCH))
+HERD_BENCH_OUT    := $(addsuffix .out,$(HERD_BENCH_SHORT))
+
+.PHONY: all clean litmus2herd run-herd7 run-herd7-bench cross-klitmus
+
+all: litmus2herd
+
+litmus2herd: $(LITMUS7_HERD_TEST)
+
+$(LITMUS7_HERD_TEST): %.herd: ../litmus/%
+	sh ./litmus2herd.sh $< $@
+
+run-herd7: $(LITMUS7_HERD_OUT)
+
+run-herd7-bench: $(HERD_BENCH_OUT)
+
+$(LITMUS7_HERD_OUT): %.out: %.herd
+	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
+
+$(HERD_BENCH_OUT): %.out: %
+	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
+
+cross-klitmus: klitmus.tar
+
+klitmus.tar: litmus2herd
+	mkdir -p klitmus
+	cd $(LKMM_DIR); klitmus7 -o $(HERD_DIR)/klitmus $(addprefix $(HERD_DIR)/,$(LITMUS7_HERD_TEST))
+	tar cf klitmus.tar ./klitmus
+
+clean:
+	rm -f *.out *.herd
+	rm -rf klitmus
+	rm -f klitmus.tar
diff --git a/CodeSamples/formal/herd/litmus2herd.sh b/CodeSamples/formal/herd/litmus2herd.sh
new file mode 100644
index 0000000..ebcd01b
--- /dev/null
+++ b/CodeSamples/formal/herd/litmus2herd.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Remove 2nd {} in litmus tests compatible with litmus7:
+#    {
+#    #include <api.h>
+#    }
+#
+# Borrowed from one of the answers in:
+#   https://unix.stackexchange.comm/questions/213385/
+# Not the selected answer because it read input file twice.
+# But this is easier to follow.
+#
+# Copyright (C) Akira Yokosawa, 2017
+#
+# Authors: Akira Yokosawa <akiyks@gmail.com>
+
+grep -n -A1 -B1 "api.h" $1 | \
+sed -n 's/^\([0-9]\{1,\}\).*/\1d/p' | \
+sed -f - $1 > $2
-- 
2.7.4


