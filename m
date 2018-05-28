Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=VhEtraMKA0EhZE4ZlaKAgdc8vPx+pOualLc73dQyrQw=;
 b=nqGkXccbakR3SFZZch5LatakY+kYc495Zp+gBf1YOUrcvErDM4RbZMzEYFsr6Q4LGS
 4lWiY6sNj3HYhsOptUscrh8EGuMk4172DW1uU4PQffM4kVwrvJttooD7Wjb+O9YAy9BR
 072wR5n2gc6CoN4chWXfo4xLd/kEjWMe2dlPy07m+2LzlwY6aWCBuhQlw5/nUx2rFLsC
 FuN+VzgWvYI8eszPol0cJ0VRCus3dHmUOcftompP0G/IbFSH8xCs55DZzkmL5v2e0kgf
 ccZJRRPDsIMGs/DSaMlJvBpXOEEkXaUDpl7c08JOqxBQT2Wa0h7rMRFB4zkHNO1pEg79
 HeDA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] SMPdesign: Add a missed unbreakble space for line number
Date: Tue, 29 May 2018 00:06:07 +0900
Message-Id: <20180528150607.3513-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 SMPdesign/SMPdesign.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 8078c4b..824de41 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -1109,7 +1109,7 @@ Line~6 gets a pointer to this thread's pool, and
 line~7 checks to see if this per-thread pool is full.

 If so, lines~8-15 empty half of the per-thread pool into the global pool,
-with lines~8 and 14 acquiring and releasing the spinlock.
+with lines~8 and~14 acquiring and releasing the spinlock.
 Lines~9-12 implement the loop moving blocks from the local to the
 global pool, and line~13 sets the per-thread pool's count to the proper
 value.
-- 
2.10.0

