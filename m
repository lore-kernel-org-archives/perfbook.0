Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=23TwlF9jl62trWUUKdRqH2JgH4DmSzlvJNvk7v+oGIo=;
        b=qi9CKZWKviImktoDAXZRp7qSPUu68Gk7ALZ74l9r0EL4rRGlEx0lXfsmZfJdXP1d2L
         DlGlAXdhoTaUBYQEC9D2sjfQLGV7i4yu1H3pQroWyoumUUEVXFyUXkUWakVXqt8TKSvr
         +mPPUtOqCMALnvVlG9AD5NCF/TGr9rjh9kaZVGU2EC3JHmWz/zL4EKQYP+5VjvH3x0/b
         Z6N9cbL3cmwfGfagz+UH578UtY2cw0CakqWTCEBx1Po6TEfJVAlhRU5rA9oSk3UbzRzq
         Y7ATw6B3vogn6TllURYMMpvq8Fg7oT8dEIcTj9SVD52VSrsy8LKfORXK7zOm1FNvnRkU
         lZgg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] CodeSamples: Add api-pthreads/api-gcc.h in depends.mk
Message-ID: <3244d38a-5ac7-657f-83c4-38d0adf2a7c8@gmail.com>
Date: Sun, 28 Oct 2018 08:14:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ce0f6785bd5e059a29a3d647287bcf93648f66f8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 Oct 2018 08:02:09 +0900
Subject: [PATCH] CodeSamples: Add api-pthreads/api-gcc.h in depends.mk

While testing change in cmpxchg() commited as cda0234ccd2c
("atomic_cmpxchg: Handle spurious failure of
__atomic_compare_exchange_n"), api.h was not updated
automatically by "make".  Fix this by adding the dependency
(api-pthreads/api-gcc.h -> api.h)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/depends.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/depends.mk b/CodeSamples/depends.mk
index 31a8daf..a6db993 100644
--- a/CodeSamples/depends.mk
+++ b/CodeSamples/depends.mk
@@ -26,7 +26,9 @@ subdir_ub :=
 endif
 
 api_depend_common := $(top)/linux/common.h \
-	$(top)/api-pthreads/api-pthreads.h
+	$(top)/api-pthreads/api-pthreads.h \
+	$(top)/api-pthreads/api-gcc.h
+
 ifeq ($(target),x86)
 api_depend := $(top)/arch-x86/arch-x86.h
 arch_depend := $(top)/arch-x86/Makefile.arch
-- 
2.7.4

