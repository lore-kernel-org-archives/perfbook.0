Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiHPMs0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 16 Aug 2022 08:48:26 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842836CF5C
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 05:46:53 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id mz1so2814240qvb.4
        for <perfbook@vger.kernel.org>; Tue, 16 Aug 2022 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+aSyCHjPZYPA/m7E78L0wHB8aTQX7QEZ0puVjwoDHf4=;
        b=EB3aIoZpfih3phEYhvGPP25lUz17zOSIQc8BrFHsQcyukf0j1PulDb25buk3xjt0ey
         20Ksjlqg0u/v6J9f8LxfCoKc05f/qQNb4MEWAD/skz+p8nwzc6YdgCymS0b7BME2QJih
         LFyKIUwn2UXOdZa02DdODbAEY6sEA+ulnyDvLGvnCzvqgJOBP30Rv/5DWw89MY9Xrthy
         kCyvq0ZA5EDT90lqSVDYbsRe5CAeYwI+sSGF0T+GOx28hGoGR3WEXQS+FTbIqrFUpoDJ
         esf3EtGs/wGvMqB+XPKHIXzPMZtC9WWMgWzimr5hHZk1c9trr1gOCjgsP8bl1+zDxoi0
         iBxQ==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH 2/2] CodeSamples: Switch ARM64 get_timestamp() to use the hardware counter
Date: Tue, 16 Aug 2022 08:46:47 -0400
Message-Id: <20220816124647.75220-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/arch-arm64/arch-arm64.h | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
index f45d8bdc..220b8b16 100644
--- a/CodeSamples/arch-arm64/arch-arm64.h
+++ b/CodeSamples/arch-arm64/arch-arm64.h
@@ -43,24 +43,13 @@
 #define smp_mb()  __asm__ __volatile__("dmb ish" : : : "memory")
 
 
-#include <stdlib.h>
-#include <time.h>
-
-#ifndef CLOCK_MONOTONIC_RAW
-#define CLOCK_MONOTONIC_RAW CLOCK_MONOTONIC
-#endif
-
 /*
  * Generate 64-bit timestamp.
  */
-static __inline__ unsigned long long get_timestamp(void)
+static inline unsigned long long get_timestamp(void)
 {
 	unsigned long long thetime;
-	struct timespec tv;
 
-	if (clock_gettime(CLOCK_MONOTONIC_RAW, &tv) != 0)
-		return 0;
-	thetime = ((unsigned long long)tv.tv_sec) * 1000000000ULL +
-		  ((unsigned long long)tv.tv_nsec);
+	__asm__ __volatile__ ("isb; mrs %0, cntvct_el0" : "=r"(thetime));
 	return thetime;
 }
-- 
2.25.1

