Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233161AbiHOKie (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 15 Aug 2022 06:38:34 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7943211C13
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 03:38:32 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id u10so5047616qvp.12
        for <perfbook@vger.kernel.org>; Mon, 15 Aug 2022 03:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=KhpOlAgDUhaeRnSSbP66NVnnGws+B4+5fD+/n2MHsww=;
        b=o7zxjIBqeNQrZfbNHEfUHSrO1K89Zq3L/jO99swm02Q9UXKwrpM4mu0QgLsWJX/Oei
         UO2JzyWibpRiJc/1F/b8R5/gGhVozuWPLMX0hE9Cd9HNQn2c+xKGBmFpap8gpOb5pgc3
         OqjYJX8KfDDFlldJNrDzJp0MgkK4GnnOWJ1yJ8E0h0At6SCGnEAOAHOCo6FZDaDYkc4v
         uY70aMwFFKfQCTLXRzdbB33Ucb6YH/8G2VERTUXNZ/qe42HeeFnEKWZJjO+1MSAZy9I8
         6HohmZHI5/q5FlfoPYnMK+KwiaMwJoCIT67o2k0t3d9xRaxJ496CLCSJsIBN32knDco/
         tVTw==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH v2] CodeSamples: Support for building on different operating systems
Date: Mon, 15 Aug 2022 06:37:18 -0400
Message-Id: <20220815103717.7454-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/Makefile                    |  4 ++-
 CodeSamples/api-pthreads/api-linux.h    | 36 +++++++++++++++++++++++
 CodeSamples/api-pthreads/api-pthreads.h | 13 ---------
 CodeSamples/api-pthreads/api-qnx.h      | 38 +++++++++++++++++++++++++
 CodeSamples/arch-arm64/arch-arm64.h     |  4 +++
 CodeSamples/depends.mk                  | 29 ++++++++++++++++++-
 6 files changed, 109 insertions(+), 15 deletions(-)
 create mode 100644 CodeSamples/api-pthreads/api-linux.h
 create mode 100644 CodeSamples/api-pthreads/api-qnx.h

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 3a96f5cf..38143638 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -38,10 +38,12 @@ endif
 		sed '/end{snippet}/d' >> api.h
 	echo "" >> api.h
 	cat api-pthreads/api-gcc.h >> api.h
+	cat api-pthreads/api-$(os_compat).h >> api.h
 	echo "" >> api.h
 	if test -f /usr/include/urcu-call-rcu.h -o \
 		-f /usr/local/include/urcu-call-rcu.h -o \
-		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h ; \
+		-f /usr/include/$(subdir_ub)/urcu-call-rcu.h -o \
+		-f $(QNX_TARGET)/usr/include/urcu-call-rcu.h ; \
 	then \
 		echo "#define _LGPL_SOURCE" >> api.h; \
 		echo "#include <urcu/rculist.h>" >> api.h; \
diff --git a/CodeSamples/api-pthreads/api-linux.h b/CodeSamples/api-pthreads/api-linux.h
new file mode 100644
index 00000000..03522a54
--- /dev/null
+++ b/CodeSamples/api-pthreads/api-linux.h
@@ -0,0 +1,36 @@
+/*
+ * api-linux.h: Linux-specific functions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.  However, please note that much
+ * of the code in this file derives from the Linux kernel, and that such
+ * code may not be available except under GPLv2.
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
+ * Copyright (c) 2006-2019 Paul E. McKenney, IBM.
+ * Copyright (c) 2019 Paul E. McKenney, Facebook.
+ */
+
+static __inline__ void run_on(int cpu)
+{
+	cpu_set_t mask;
+	int ret;
+
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+	ret = sched_setaffinity(0, sizeof(mask), &mask);
+	if (ret) {
+		perror("sched_setaffinity");
+		abort();
+	}
+}
diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index 44e55c0d..3e21fdb9 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -308,19 +308,6 @@ static __inline__ void waitall(void)
 }
 // \end{snippet}
 
-static __inline__ void run_on(int cpu)
-{
-	cpu_set_t mask;
-	int ret;
-
-	CPU_ZERO(&mask);
-	CPU_SET(cpu, &mask);
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
-	if (ret) {
-		perror("sched_setaffinity");
-		abort();
-	}
-}
 
 /*
  * Timekeeping, using monotonic globally coherent clock.
diff --git a/CodeSamples/api-pthreads/api-qnx.h b/CodeSamples/api-pthreads/api-qnx.h
new file mode 100644
index 00000000..186ad05a
--- /dev/null
+++ b/CodeSamples/api-pthreads/api-qnx.h
@@ -0,0 +1,38 @@
+/*
+ * api-qnx.h: QNX-specific functions
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.  However, please note that much
+ * of the code in this file derives from the Linux kernel, and that such
+ * code may not be available except under GPLv2.
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
+ * Copyright (c) 2006-2019 Paul E. McKenney, IBM.
+ * Copyright (c) 2019 Paul E. McKenney, Facebook.
+ */
+
+#include <stdint.h>
+#include <sys/neutrino.h>
+
+static inline void run_on(int cpu)
+{
+	uintptr_t runmask;
+	int ret;
+
+	runmask = (1UL << cpu);
+	ret = ThreadCtl(_NTO_TCTL_RUNMASK, (void *)runmask);
+	if (ret) {
+		perror("sched_setaffinity");
+		abort();
+	}
+}
diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
index 0e724740..f45d8bdc 100644
--- a/CodeSamples/arch-arm64/arch-arm64.h
+++ b/CodeSamples/arch-arm64/arch-arm64.h
@@ -46,6 +46,10 @@
 #include <stdlib.h>
 #include <time.h>
 
+#ifndef CLOCK_MONOTONIC_RAW
+#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
+#endif
+
 /*
  * Generate 64-bit timestamp.
  */
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index a6db993f..30810339 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -1,7 +1,13 @@
 ifeq ($(strip $(arch)),)
-arch := $(shell uname -m)
+arch := $(shell uname -p)
 endif
 
+ifeq ($(strip $(os)),)
+os := $(shell uname)
+endif
+
+ifeq ($(os),Linux)
+# Linux
 ifeq ($(arch),i686)
 target := x86
 subdir_ub := i386-linux-gnu
@@ -23,6 +29,27 @@ subdir_ub := arm-linux-gnueabihf
 else
 target :=
 subdir_ub :=
+endif
+os_compat := linux
+
+else ifeq ($(os),QNX)
+# QNX
+ifeq ($(arch),x86_64)
+target := x86
+else ifeq ($(arch),aarch64le)
+target := arm64
+else
+target :=
+endif
+subdir_ub :=
+os_compat := qnx
+
+else
+# Other OS
+target :=
+subdir_ub :=
+os_compat :=
+
 endif
 
 api_depend_common := $(top)/linux/common.h \
-- 
2.25.1

