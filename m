Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4gRobqqRdgZNpmNpFbVywHyyXR2qn47Fz4E/ptVgkTI=;
 b=kyV1Np9rKstSqhYxIu5wKCBtMJL13UXZ0ROHRAPHG6EwhTblQGks+N4pTb9zAtUhjW
 uaVTSenfyKglvMeQSWmndFCm6xZ/c6yC0SPg7Lfr+xs7lPB4WzrQVXvDoP/w9wFBai8s
 zzCg9ASUyVN0+gbnoIXsnsokyeeR00+3PzP/hHb4SkKGOZZNav+QaATXTKDFdxnhNPGt
 YcvZnStyobh+H4O7sBPe3NlQ/jCKi/Tuucd9GIucJNa8uA1JxrdzBhXxgSMWkniH21CQ
 vHVF1N5AIf2oJ34cP8T3FdPT53PipX+5B9q6IY3A9ACKwgIIPnRIIhCmO6KifoCiIS7d
 ua/w==
Subject: [PATCH 2/2] CodeSamples: Add arm64 support
References: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <776515da-40a1-9524-fd87-a088fad3b538@gmail.com>
Date: Wed, 12 Jul 2017 00:32:11 +0900
MIME-Version: 1.0
In-Reply-To: <a8d7f96a-d284-2f44-847b-859981f4b395@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1908602500df34619ec496c787546d5584d01221 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 10 Jul 2017 23:46:32 +0900
Subject: [PATCH 2/2] CodeSamples: Add arm64 support

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/arch-arm64/Makefile.arch |  2 ++
 CodeSamples/arch-arm64/arch-arm64.h  | 61 ++++++++++++++++++++++++++++++++++++
 CodeSamples/depends.mk               |  5 +++
 3 files changed, 68 insertions(+)
 create mode 100644 CodeSamples/arch-arm64/Makefile.arch
 create mode 100644 CodeSamples/arch-arm64/arch-arm64.h

diff --git a/CodeSamples/arch-arm64/Makefile.arch b/CodeSamples/arch-arm64/Makefile.arch
new file mode 100644
index 0000000..b886373
--- /dev/null
+++ b/CodeSamples/arch-arm64/Makefile.arch
@@ -0,0 +1,2 @@
+# http://www.ibm.com/developerworks/wikis/display/hpccentral/Tuning+options+to+consider+with+gcc#Tuningoptionstoconsiderwithgcc-mcpuandmtune
+GCC_ARGS=-g -O3 -Wall -mcpu=native -mtune=native
diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
new file mode 100644
index 0000000..354f1f2
--- /dev/null
+++ b/CodeSamples/arch-arm64/arch-arm64.h
@@ -0,0 +1,61 @@
+/*
+ * arch-arm64.h: Expose ARMv8_64 atomic instructions.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; but version 2 of the License only due
+ * to code included from the Linux kernel.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, you can access it online at
+ * http://www.gnu.org/licenses/gpl-2.0.html.
+ *
+ * Copyright (c) 2010 Paul E. McKenney, IBM.
+ *
+ * Much code taken from the Linux kernel.  For such code, the option
+ * to redistribute under later versions of GPL might not be available.
+ */
+
+/*
+ * Machine parameters.
+ */
+
+#define CONFIG_SMP
+#define CONFIG_ARM64
+
+#define CACHE_LINE_SIZE 128
+#define ____cacheline_internodealigned_in_smp \
+	__attribute__((__aligned__(1 << 7)))
+
+/* The gcc primitives imply full memory barriers. */
+#define smp_mb__before_atomic_dec()	do { } while (0)
+#define smp_mb__after_atomic_dec()	do { } while (0)
+#define smp_mb__before_atomic_inc()	do { } while (0)
+#define smp_mb__after_atomic_inc()	do { } while (0)
+
+/* __sync_synchronize() is broken before gcc 4.4.1 on many ARM systems. */
+#define smp_mb()  __asm__ __volatile__("dmb ish" : : : "memory")
+
+
+#include <stdlib.h>
+#include <time.h>
+
+/*
+ * Generate 64-bit timestamp.
+ */
+static __inline__ unsigned long long get_timestamp(void)
+{
+	unsigned long long thetime;
+	struct timespec tv;
+
+	if (clock_gettime(CLOCK_MONOTONIC_RAW, &tv) != 0)
+		return 0;
+	thetime = ((unsigned long long)tv.tv_sec) * 1000000000ULL +
+		  ((unsigned long long)tv.tv_nsec);
+	return thetime;
+}
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 8eb45b4..77a76bf 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -10,6 +10,8 @@ else ifeq ($(arch),ppc64)
 target := ppc64
 else ifeq ($(arch),ppc64le)
 target := ppc64
+else ifeq ($(arch),aarch64)
+target := arm64
 else ifneq (,$(findstring arm,$(arch)))
 target := arm
 else
@@ -27,6 +29,9 @@ arch_depend := $(top)/arch-ppc64/Makefile.arch
 else ifeq ($(target),arm)
 api_depend := $(top)/arch-arm/arch-arm.h
 arch_depend := $(top)/arch-arm/Makefile.arch
+else ifeq ($(target),arm64)
+api_depend := $(top)/arch-arm64/arch-arm64.h
+arch_depend := $(top)/arch-arm64/Makefile.arch
 else
 api_depend :=
 arch_depend :=
-- 
2.7.4


