Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bCD06RgiDd4fYtHz2oJTpGxAxMWsW0WK50kPP44XTls=;
 b=R/TIeDuq1Kjc1rn0mzSeG32XaNPoS+RIW6GaT1etl9deaE+WjWlQA4IYw897irG5Eg
 Ha2nWuuhx3zq3Omlg0mD2bI+TWhJ8Tl+Ojlb+keaW4H8BsKVm3B4rhnEYX1BSeIeDaZG
 tpTUW3QZEc5qabjDUXm4ehWqGwvxUJ1pvYlT8KCQQ96zdzp+Z4Vs8gjg+NC02qBlA+vp
 FaDqUgSX6tGAMsZD1ftGWEKqvmQzOXlwXnJ9MWg6JEHFcT9Iwa2RqTxulPr6BygH8UMh
 VBsh6BC3Ag1leFDag/93evDc54zjwXrt2QEKojvOs1tOiuw73sncHs6XAS2FwZ0hAHwD
 4G+Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to
 linux-kernel-hardware.cat
Message-ID: <f00d9adf-bbcd-79c1-1454-6c217cb9ec1b@gmail.com>
Date: Tue, 20 Feb 2018 00:14:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9ef0701c8f161c8582bd6084e5d2706a0ad92d00 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 20 Feb 2018 00:09:53 +0900
Subject: [PATCH] CodeSamples/formal/herd: Remove dependency to linux-kernel-hardware.cat

linux-kernel-hardware.cat is not present in the branch expected
to be merged in 4.17 window.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 8e0635a..3162659 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -31,7 +31,7 @@

 LKMM_DIR     := memory-model
 LKMM_FILES   := linux-kernel.bell linux-kernel.cat linux-kernel.cfg \
-		linux-kernel.def linux-kernel-hardware.cat lock.cat
+		linux-kernel.def lock.cat
 LKMM_LIST    := $(addprefix $(LKMM_DIR)/,$(LKMM_FILES))
 HERD_DIR     := $(shell pwd)
 HERD7_CMD    := $(shell which herd7)
-- 
2.7.4

