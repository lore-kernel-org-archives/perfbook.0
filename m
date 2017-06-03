Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b/lf0gwZnfM5xeWiQV3T/j6QRqApL85OboLuUCseqD0=;
 b=EWAR6hlGesfrCZ3OnSixdyUtZXvHYeQZugLCWxDLLp2QwWmXkB5HBdvDWk9s9FVMcI
 ARYwVA7PP2WldzvEV6ybRvrkYeasoHy09k9MEOvHvvVF56F9CCR+6Z3VT7oTw0m8hV6h
 WNOpTJHHe86HVR8RB/tBkx3V+/+AE5Xv71SzAOiSLqn4iEJNGATPpnjF6bPmz8AbhTZn
 FW2wKIwBoegNvg/YxQrQzE+vBBM0/3nOU30MKF6dnoWA+bCzJXg9FnqomUi3d8Kht+50
 ZLtoR2mK5hY8ae+OpfM/2wMGnO2cgbj7BDtv3fXI6tdIDq8Ppy2AmEesPUNwBxik1+Vu
 Dp7g==
Subject: [PATCH 1/2] CodeSamples: Fixes for build on ppc64le
References: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5cac4c07-08de-e157-fd9c-c9036f5cc206@gmail.com>
Date: Sat, 3 Jun 2017 16:03:04 +0900
MIME-Version: 1.0
In-Reply-To: <ad29f159-eb20-4493-d1f7-90bd4b3f17ae@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9fdd8f22bc417c53b4467ccd997b9d2fb833832a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 3 Jun 2017 02:23:20 +0000
Subject: [PATCH 1/2] CodeSamples: Fixes for build on ppc64le

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/Makefile   | 2 ++
 CodeSamples/depends.mk | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/CodeSamples/Makefile b/CodeSamples/Makefile
index 4168220..e1593a7 100644
--- a/CodeSamples/Makefile
+++ b/CodeSamples/Makefile
@@ -92,6 +92,8 @@ pthreads-ppc64:
 	echo "" >> api.h
 	cat api-pthreads/api-pthreads.h >> api.h
 	echo "" >> api.h
+	cat api-pthreads/api-gcc.h >> api.h
+	echo "" >> api.h
 	if test -f /usr/include/urcu-call-rcu.h -o -f /usr/local/include/urcu-call-rcu.h ; \
 	then \
 		echo "#define _LGPL_SOURCE" >> api.h; \
diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 409eeee..f3a325d 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -8,6 +8,8 @@ else ifeq ($(arch),x86_64)
 target := x86
 else ifeq ($(arch),ppc64)
 target := ppc64
+else ifeq ($(arch),ppc64le)
+target := ppc64
 else ifneq (,$(findstring arm,$(arch)))
 target := arm
 else
-- 
2.7.4


