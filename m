Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h0P+5jkAJqNRMoReL5T6Dz/aq+j03Cwk748Lcjr74II=;
 b=sO6TY/an3d8p+n6+EQ/ElovFo06gmvFgmdonWXSEW1Qq8bVnqhTfl5PzEfle+TbCc4
 5zwUsPbWGmOuu5XfLd1NxIwQ9+yNnvuILR8MBmzMS+mtTR7iwT2mTZkzI42YsCC0xjit
 +LIs7nsELRDdHmlBuvJY/2UtCnEDc/xlc1lDuWi4BlXJ9xEcJM7xx8Jl7d5rNP1jIL5L
 bRupl7iM2eveFo9xiiByAZPHU8FqkptOvQZSvBLVBcrBUEfUV/K3VKwD+/dHtL7/RDt6
 jUZPA4/h5iidrpvVTfuS0leQgVfcQVqM4LMG43mpiygR0o00WkoTaXR9GMhL4x6tSX6W
 XMqg==
Subject: [PATCH 1/2] advsync: Use '#include "api.h"' in litmus tests
References: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <788721d8-eab0-e712-0cfb-5640e5a433ff@gmail.com>
Date: Sun, 9 Jul 2017 10:40:48 +0900
MIME-Version: 1.0
In-Reply-To: <0f7d5b71-c960-6462-fc45-a83f757d88ee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 408b798755475f18285178c9a1f9f0c6bb2bd9ed Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 7 Jul 2017 21:13:01 +0900
Subject: [PATCH 1/2] advsync: Use '#include "api.h"' in litmus tests

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus |  4 +---
 CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus       |  3 +--
 CodeSamples/advsync/herd/Makefile                  | 14 ++++++++++++--
 CodeSamples/advsync/herd/api.h                     |  8 ++++++++
 4 files changed, 22 insertions(+), 7 deletions(-)
 create mode 100644 CodeSamples/advsync/herd/api.h

diff --git a/CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus b/CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus
index c04e82f..1093329 100644
--- a/CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus
+++ b/CodeSamples/advsync/herd/C-SB+o-mb-o+o-mb-o.litmus
@@ -3,9 +3,7 @@ C C-SB+o-mb-o+o-mb-o
 }

 {
-#define READ_ONCE(x) __atomic_load_n(&(x), __ATOMIC_RELAXED)
-#define WRITE_ONCE(x, v) __atomic_store_n(&(x), (v), __ATOMIC_RELAXED)
-#define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
+#include "api.h"
 }

 P0(int *x0, int *x1)
diff --git a/CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus b/CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus
index 47cc6dd..2e45ee6 100644
--- a/CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus
+++ b/CodeSamples/advsync/herd/C-SB+o-o+o-o.litmus
@@ -3,8 +3,7 @@ C C-SB+o-o+o-o
 }

 {
-#define READ_ONCE(x) __atomic_load_n(&(x), __ATOMIC_RELAXED)
-#define WRITE_ONCE(x, v) __atomic_store_n(&(x), (v), __ATOMIC_RELAXED)
+#include "api.h"
 }

 P0(int *x0, int *x1)
diff --git a/CodeSamples/advsync/herd/Makefile b/CodeSamples/advsync/herd/Makefile
index 92986cd..7959063 100644
--- a/CodeSamples/advsync/herd/Makefile
+++ b/CodeSamples/advsync/herd/Makefile
@@ -1,4 +1,14 @@
-all: C-SB+o-o+o-o.litmus.out C-SB+o-mb-o+o-mb-o.litmus.out
+LITMUS := $(wildcard *.litmus)
+LITMUS_OUT = $(addsuffix .out,$(LITMUS))
+CCOPTS = -fomit-frame-pointer -O2
+CCOPTS += -I$(shell pwd)
+
+.PHONY: all clean
+
+all: $(LITMUS_OUT)

 %.litmus.out: %.litmus
-	litmus7 -r 1000 -carch X86 $< > $@ 2>&1
+	litmus7 -r 1000 -carch X86 -ccopts "$(CCOPTS)" $< > $@ 2>&1
+
+clean:
+	rm -f *.out
diff --git a/CodeSamples/advsync/herd/api.h b/CodeSamples/advsync/herd/api.h
new file mode 100644
index 0000000..8326835
--- /dev/null
+++ b/CodeSamples/advsync/herd/api.h
@@ -0,0 +1,8 @@
+#ifndef __API_H__
+#define __API_H__
+#ifndef READ_ONCE
+#define READ_ONCE(x) __atomic_load_n(&(x), __ATOMIC_RELAXED)
+#define WRITE_ONCE(x, v) __atomic_store_n(&(x), (v), __ATOMIC_RELAXED)
+#define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
+#endif
+#endif
-- 
2.7.4


