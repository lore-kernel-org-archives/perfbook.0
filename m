Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbiHNKVq (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 14 Aug 2022 06:21:46 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73C4022BFA
        for <perfbook@vger.kernel.org>; Sun, 14 Aug 2022 03:21:41 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id ct13so3643059qvb.9
        for <perfbook@vger.kernel.org>; Sun, 14 Aug 2022 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=11pfytUz9MTCgw0kTfuZXrlLwH3eUYZxo6XLA40PMWk=;
        b=UlXuRbR0n8m1GkDG9d6BHRyT191DK5oezDgQqykh9Ep5WRjo1DO4hJb6zIGgedop1y
         DHgr3ZUUAgpEj+ZlmgltAyJ6Ad1np28DG5llL8LS6xJeIegcTZhGvjltfZYyrTf2I37i
         SRWaoRZ2dfy9A6G53VKW+Ng3hYAz0FaEbnntWaaIsVVIQ3emhvIKPKPEOUJ4wbjGCPgG
         ZDXkHtoWKVpvncemQq80zxwI70INhd2mWDJicRShDqkUD8tLVbaBl6Ko5+9w0pHbIAWK
         ISLSUMME3peeUfe+CgM6sJePDQkGsAZ2QlMPynKtNTlAz2YPOgxoP6pY+VxkrIfgl9lj
         X74g==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] CodeSamples: Enable building on QNX
Date: Sun, 14 Aug 2022 06:21:35 -0400
Message-Id: <20220814102135.2141663-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/Makefile                    |  3 ++-
 CodeSamples/api-pthreads/api-pthreads.h | 19 +++++++++++++++++++
 CodeSamples/arch-arm64/arch-arm64.h     |  4 ++++
 CodeSamples/depends.mk                  |  4 +++-
 4 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 3a96f5cf..b0231b1c 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -41,7 +41,8 @@ endif
 	echo "" >> api.h
 	if test -f /usr/include/urcu-call-rcu.h -o \
 		-f /usr/local/include/urcu-call-rcu.h -o \
-		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h ; \
+		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h -o \
+		-f $(QNX_TARGET)/usr/include/urcu-call-rcu.h ; \
 	then \
 		echo "#define _LGPL_SOURCE" >> api.h; \
 		echo "#include <urcu/rculist.h>" >> api.h; \
diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index 44e55c0d..5af73947 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -43,6 +43,11 @@
 #include <sys/param.h>
 /* #include "atomic.h" */
 
+#if defined (__QNX__)
+#include <stdint.h>
+#include <sys/neutrino.h>
+#endif
+
 /*
  * Compiler magic.
  */
@@ -310,6 +315,7 @@ static __inline__ void waitall(void)
 
 static __inline__ void run_on(int cpu)
 {
+#if defined (__linux__)
 	cpu_set_t mask;
 	int ret;
 
@@ -320,6 +326,19 @@ static __inline__ void run_on(int cpu)
 		perror("sched_setaffinity");
 		abort();
 	}
+#elif defined (__QNX__)
+    uintptr_t runmask;
+    int ret;
+
+    runmask = (1UL << cpu);
+    ret = ThreadCtl(_NTO_TCTL_RUNMASK, (void *)runmask);
+	if (ret) {
+		perror("sched_setaffinity");
+		abort();
+	}
+#else
+#error Implement for OS
+#endif
 }
 
 /*
diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
index 0e724740..c1b2d474 100644
--- a/CodeSamples/arch-arm64/arch-arm64.h
+++ b/CodeSamples/arch-arm64/arch-arm64.h
@@ -54,6 +54,10 @@ static __inline__ unsigned long long get_timestamp(void)
 	unsigned long long thetime;
 	struct timespec tv;
 
+#ifndef CLOCK_MONOTONIC_RAW
+#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
+#endif
+
 	if (clock_gettime(CLOCK_MONOTONIC_RAW, &tv) != 0)
 		return 0;
 	thetime = ((unsigned long long)tv.tv_sec) * 1000000000ULL +
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index a6db993f..e192c2c2 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -1,5 +1,5 @@
 ifeq ($(strip $(arch)),)
-arch := $(shell uname -m)
+arch := $(shell uname -p)
 endif
 
 ifeq ($(arch),i686)
@@ -17,6 +17,8 @@ subdir_ub := powerpc64le-linux-gnu
 else ifeq ($(arch),aarch64)
 target := arm64
 subdir_ub := aarch64-linux-gnu
+else ifeq ($(arch),aarch64le)
+target := arm64
 else ifneq (,$(findstring arm,$(arch)))
 target := arm
 subdir_ub := arm-linux-gnueabihf
-- 
2.25.1

