Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GGyp06beSKg+9YOMLN9EjmHkB+tLtbmvxE8MSwSoAio=;
 b=PFYgOyizZTXc3fHsGwfC9ktIgIuJDZc3FbJiTdCLpnb/epNeqwO9iGdq9PnfI7UjtW
 6uSyfYy4+DcTAAY0phXEh+3UWcrEtvfQc7fhze8639Jlct4SygXetnLR6hXoImj9DfPs
 jqmLCGjQBy6T1tMnmw6BamgjkMh1SJ6iAa8YE7H/brAQBkieViBMMs4W9EVH5jQSkt+y
 PkpJ5KmfHar5TxfMvfGSJg0Ad6euBVY6tPxKDg21BihJ/BsSXHGrRCrJHc8SJYixCd/8
 2ZwldgvQ0AiWIryi671j5RNbcgPdODQ++7nYO0w/tgbtlb2Zu4gufiI1B4UnVyfuEcUP
 +IIA==
Subject: [PATCH 2/2] CodeSamples/formal/herd: Make use of absperf scripts in
 make targets
References: <84124977-6d34-3760-b596-0b7d5502373e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b6cd810f-14bf-c9c2-0535-af661ad549cf@gmail.com>
Date: Sun, 10 Dec 2017 00:24:35 +0900
MIME-Version: 1.0
In-Reply-To: <84124977-6d34-3760-b596-0b7d5502373e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 858319eab17c2b51d17a39ff769b19303292b526 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 10 Dec 2017 00:15:57 +0900
Subject: [PATCH 2/2] CodeSamples/formal/herd: Make use of absperf scripts in make targets

Target "run-absperf" runs 16 of 20 absperf litmus tests whose results
are covered in Table E.2.

Target "run-absperf-all" runs all 20 of the tests.  Long tests should
end up in timeout by default (15m).

Also add target "help".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/.gitignore |  2 ++
 CodeSamples/formal/herd/Makefile   | 62 +++++++++++++++++++++++++++++---------
 2 files changed, 49 insertions(+), 15 deletions(-)

diff --git a/CodeSamples/formal/herd/.gitignore b/CodeSamples/formal/herd/.gitignore
index e0ad195..d12c930 100644
--- a/CodeSamples/formal/herd/.gitignore
+++ b/CodeSamples/formal/herd/.gitignore
@@ -1,5 +1,7 @@
 *.out
 *.herd
+*.raw
 klitmus
 klitmus.tar
 memory-model
+absperf
diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index b99699b..7bbfeaf 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -3,11 +3,17 @@
 # Default target: Transform litmus tests in ../litmus to herd7 compatible format
 #         (remove 2nd {})
 #
-# run-herd7: Examine transformed litmus tests by herd7 with LKMM
+# run-herd7:       Examine transformed litmus tests by herd7 with LKMM
+# cross-klitmus7:  Cross-compile transformed litmus tests by klitmus7
+# run-absperf:     Run memory model benchmark tests of absperf
+# run-absperf-all: Run all absperf tests (including those take quite a while)
 #
-# cross-klitmus7: Cross-compile transformed litmus tests with klitmus7
+# Warning: absperf tests take more than 1 hour by default.
 #
-# run-herd7-bench: Run benchmark tests of herd7 itself
+# Note: Parameters TIMEOUT and ITER in absperf.sh can be overridden by
+#       options to "make".  E.g.:
+#
+#       $ make TIMEOUT=1m ITER=3 run-absperf
 #
 # Note: There need to be a symbolic link "memory-model" under
 #       CodeSamples/formal/herd for herd7 to work.
@@ -33,12 +39,15 @@ KLITMUS7_CMD := $(shell which klitmus7)
 LITMUS7_TEST := $(notdir $(wildcard ../litmus/*.litmus))
 LITMUS7_HERD_TEST := $(addsuffix .herd,$(LITMUS7_TEST))
 LITMUS7_HERD_OUT  := $(addsuffix .out,$(LITMUS7_TEST))
-HERD_BENCH        := $(wildcard C-SB+l-*.litmus)
-HERD_BENCH_LONG   := $(wildcard C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-*.litmus)
-HERD_BENCH_SHORT  := $(filter-out $(HERD_BENCH_LONG),$(HERD_BENCH))
-HERD_BENCH_OUT    := $(addsuffix .out,$(HERD_BENCH_SHORT))
+TIMEOUT = 15m
+ITER    = 10
+ABSPERF_TEST   := $(wildcard C-SB+l-*.litmus)
+ABSPERF_LONG   := $(wildcard C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-*.litmus)
+ABSPERF_SHORT  := $(filter-out $(ABSPERF_LONG),$(ABSPERF_TEST))
+ABSPERF_OUT    = absperf.out absperf-all.out

-.PHONY: all clean litmus2herd run-herd7 run-herd7-bench cross-klitmus
+.PHONY: all clean litmus2herd run-herd7 run-absperf run-absperf-all cross-klitmus
+.PHONY: help

 all: litmus2herd

@@ -48,8 +57,8 @@ $(LITMUS7_HERD_TEST): %.herd: ../litmus/%
 	sh ./litmus2herd.sh $< $@

 run-herd7: $(LITMUS7_HERD_OUT)
-
-run-herd7-bench: $(HERD_BENCH_OUT)
+run-absperf: absperf.out
+run-absperf-all: absperf-all.out

 $(LKMM_LIST):
 	@echo "#####################################################"
@@ -61,13 +70,23 @@ $(LKMM_LIST):
 	@echo "#####################################################"
 	@exit 1

-$(LITMUS7_HERD_OUT) $(HERD_BENCH_OUT): $(LKMM_LIST)
+$(LITMUS7_HERD_OUT) $(ABSPERF_OUT): $(LKMM_LIST)

 $(LITMUS7_HERD_OUT): %.out: %.herd
 	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@

-$(HERD_BENCH_OUT): %.out: %
-	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
+absperf.out: ABSPERF_LIST = $(ABSPERF_SHORT)
+absperf.out: $(ABSPERF_SHORT)
+absperf-all.out: ABSPERF_LIST = $(ABSPERF_TEST)
+absperf-all.out: $(ABSPERF_TEST)
+
+$(ABSPERF_OUT):
+	mkdir -p absperf
+	rm -f absperf/*
+	ln -s -r $(ABSPERF_LIST) absperf/
+	cd $(LKMM_DIR); sh $(HERD_DIR)/absperf.sh $(HERD_DIR) $(TIMEOUT) $(ITER) >$(HERD_DIR)/$@.raw 2>&1
+	cat $@.raw | sh ./absperf-reduce.sh | sed -e 's/^.*absperf\///' \
+		| sort -r | tee $@

 cross-klitmus: klitmus.tar

@@ -76,7 +95,20 @@ klitmus.tar: litmus2herd
 	klitmus7 -o klitmus $(LITMUS7_HERD_TEST)
 	tar cf klitmus.tar ./klitmus

+help:
+	@echo "Default target: Transform litmus tests in ../litmus to herd7 compatible format"
+	@echo "        (remove 2nd {})"
+	@echo
+	@echo "Other targets:"
+	@echo "    run-herd7:       Examine transformed litmus tests by herd7 with LKMM"
+	@echo "    cross-klitmus7:  Cross-compile transformed litmus tests by klitmus7"
+	@echo "    run-absperf:     Run memory model benchmark tests of absperf"
+	@echo "    run-absperf-all: Run all absperf tests (including those take quite a while)"
+	@echo
+	@echo "Warning: absperf tests require more than 1 hour by default."
+	@echo "    Refer to comment in Makefile for instructions to override default setting."
+
 clean:
-	rm -f *.out *.herd
-	rm -rf klitmus
+	rm -f *.out *.herd *.raw
+	rm -rf klitmus absperf
 	rm -f klitmus.tar
-- 
2.7.4


