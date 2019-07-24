Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=q+a0FMqPhOSOpfgzaQ+UFb5fwnQN48uBHJKbIy3hBmY=;
        b=HegnPez+ABvCtd6GNhkTRutVkY27vFX5M9s3yQt2HJTLFMDxEH+ECUmcazUePoNFzK
         1wT4eClr2qRXlz4LgGkw4SCPTEYGDIyapw3cxyx+EicD5znhUaVgPdWnBjOx8syneJG5
         eS+bn+qBhprYrQ8Ypq5ychbcd+e95YxtM3P/ExaQksANK+xmw84Nx3JkKQMVqZ/5vI1J
         WmWCEeHy4ejEql0+OsXJmUwME1bCvuTHcf+jVotERXBxI2mv66ZhAgF+pFQiO68jph35
         8BmLcMWOKxdIslu1mVrrnxsTOV0pZf5ENY08k6Rkkb2BCR+EaLVUHUdEgJSeyn7wKv82
         uefg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] api-pthreads: Fold defines too wide for code snippet
Message-ID: <0e75f45c-712b-29f5-9688-cc8dacece2bf@gmail.com>
Date: Thu, 25 Jul 2019 00:10:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 33370f703c421a7537c75989d81266d48c045575 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 24 Jul 2019 23:31:45 +0900
Subject: [PATCH] api-pthreads: Fold defines too wide for code snippet

Changes in commit 82b158acfedf ("api-pthreads: Prohibit using
WRITE_ONCE() return value") caused Listing 4.9 to get too wide
in two-column layout.

Fold the defines and add "xleftmargin=0pt" option to the
"\begin{snippet}" meta-command.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Another option would be to use the "listing*" environment for this one.
Which one do you like?

        Thanks, Akira
--
 CodeSamples/api-pthreads/api-pthreads.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/api-pthreads/api-pthreads.h b/CodeSamples/api-pthreads/api-pthreads.h
index 5421b610..1f7a7b2b 100644
--- a/CodeSamples/api-pthreads/api-pthreads.h
+++ b/CodeSamples/api-pthreads/api-pthreads.h
@@ -132,10 +132,12 @@ static __inline__ int spin_is_locked(spinlock_t *sp)
 #define spin_lock_irqsave(l, f) do { f = 1; spin_lock(l); } while (0)
 #define spin_unlock_irqrestore(l, f) do { f = 0; spin_unlock(l); } while (0)
 
-//\begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:compiler_barrier,commandchars=\@\[\],numbers=none]
+//\begin{snippet}[labelbase=ln:api-pthreads:api-pthreads:compiler_barrier,commandchars=\@\[\],numbers=none,xleftmargin=0pt]
 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
-#define WRITE_ONCE(x, val) do { ACCESS_ONCE(x) = (val); } while (0)
+#define READ_ONCE(x) \
+                ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
+#define WRITE_ONCE(x, val) \
+                do { ACCESS_ONCE(x) = (val); } while (0)
 #define barrier() __asm__ __volatile__("": : :"memory")
 //\end{snippet}
 #ifndef unlikely
-- 
2.17.1


