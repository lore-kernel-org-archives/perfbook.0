Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=kqMyYHPFfl0lCBfAv26/woHi0qC0h5zMnLa8N/rxcjE=;
 b=QaXQmZqPM2rfaUhNyYAUHKEcmx7oQY2ro0EnNkkFBLyN5o2WyLxAkXDm99FsiFCfol
 uAS7x4JVQgp8G05Oy/Oqs1HYXB/FYK1GzUddfl+IoRd4ZT0wMlRGxJ5QAjHwBiTlStiH
 uvTSlVjenKSQW03OU4tohI/OBiTya9aTiTRXKxN6RXANgZIl4Ii4sAMml1rDiPpRygzB
 7ekF5iJVTjqT80G76lfNmO8mJhC2FFcMmuz1/7ExPUHDnLcZnQk6T24v/UH1NX+FgSmK
 BGTCOC7GyWTk2EuZa6aC9Lo3Ym1bfwIZqFFm+qnazEGxVCGRg8gy9ZUCbWZ8OFYwLrwv
 wtJQ==
Message-ID: <1470097946.3000.3.camel@gmail.com>
Subject: Memory barrier -- fix sample code
From: Balbir Singh <bsingharora@gmail.com>
Date: Tue, 02 Aug 2016 10:32:26 +1000
Content-Type: text/plain; charset="utf-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: perfbook@vger.kernel.org
Cc: paulmck@linux.vnet.ibm.com
List-ID: <perfbook.vger.kernel.org>

From: Balbir singh <bsingharora@gmail.com>
Date: Tue, 2 Aug 2016 10:26:34 +1000
Subject: [PATCH] Correct a sample in memorybarriers.tex

We probably don't want to show GFP_KERNEL allocation
under spin_lock, GFP_ATOMIC seems much better.

Signed-off-by: Balbir singh <bsingharora@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 9eaa0ea..efbd4a2 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -936,7 +936,7 @@ Then the following code might leak memory!
 \begin{verbatim}
 spin_lock(&mylock);
 if (p == NULL)
-  p = kmalloc(sizeof(*p), GFP_KERNEL);
+  p = kmalloc(sizeof(*p), GFP_ATOMIC);
 spin_unlock(&mylock);
 \end{verbatim}
 \end{minipage}
-- 
2.7.4

