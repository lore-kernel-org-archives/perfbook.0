Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/Bk1HQPWXWnYoqlKIAyHivU3XSL5iiLZJkmGM6t2hsk=;
        b=hf5C4WjLAFC7O9Yt6m44jHR250uedjSbNA/KRBn1hNRI4RA007qokgsZMSEDP/BntI
         z8pbs1f2+xK6EqCpD0CFfmIrLtOO5xBPdW0yVMVg9Ng+z7BMOre2BeolE3iIo1XfcsZZ
         NlVsOW1sC/1OqO8OgcJ+WaGMrU49pU3q93o48Ep97RPyf3y9++vXErgwCJiwbSy02FuU
         LVGyNaF0I2vtDsV/6j67kQZs3uNt9plafLHgTcRIldVVnV2TNKjeZy7AHdPaeGJ5JucW
         6Rpkd1bCk1SK7BhauoEjOIsVaKoUcKRjDqkBc28aImF2k0I0XIIZARIVU1NgM6APTEZh
         l4eg==
Subject: [PATCH 02/11] CodeSamples: Add explicit 'keepcomment=yes' options
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a49b29b2-13e7-44e5-4b4b-76a05ffb0a23@gmail.com>
Date: Mon, 24 Dec 2018 23:55:27 +0900
MIME-Version: 1.0
In-Reply-To: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f3f0bb0be7ce81a418aed0fe56e6bad06c36aaca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 23 Dec 2018 12:28:32 +0900
Subject: [PATCH 02/11] CodeSamples: Add explicit 'keepcomment=yes' options

Comment blocks in these snippets should be kept after the change
of default to "keepcomment=no".

Also use "#ifndef FCV_SNIPPET -- #else -- #endif" to embed
alternative code for snippet.  Otherwise they would disappear with
"keepcomment=no".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/lockhdeq.c       |  7 ++++---
 CodeSamples/count/count_tstat.c        |  2 +-
 CodeSamples/defer/route_rcu.c          | 11 ++++++-----
 CodeSamples/toolsoftrade/forkjoinvar.c |  2 +-
 CodeSamples/toolsoftrade/pcreate.c     |  2 +-
 5 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/CodeSamples/SMPdesign/lockhdeq.c b/CodeSamples/SMPdesign/lockhdeq.c
index 1b57423..64873be 100644
--- a/CodeSamples/SMPdesign/lockhdeq.c
+++ b/CodeSamples/SMPdesign/lockhdeq.c
@@ -134,10 +134,11 @@ struct pdeq {
 	spinlock_t llock;				//\lnlbl{llock}
 	int lidx;					//\lnlbl{lidx}
 	/* char pad1[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
-	spinlock_t rlock ____cacheline_internodealigned_in_smp;			//\fcvexclude
-/* -- begin alternative code for snippet \fcvexclude
+#ifndef FCV_SNIPPET
+	spinlock_t rlock ____cacheline_internodealigned_in_smp;
+#else /* FCV_SNIPPET */
 	spinlock_t rlock;				//\lnlbl{rlock}
-   -- end alternative code for snippet \fcvexclude */
+#endif /* FCV_SNIPPET */
 	int ridx;					//\lnlbl{ridx}
 	/* char pad2[CACHE_LINE_SIZE - sizeof(spinlock_t) - sizeof(int)]; */	//\fcvexclude
 	struct deq bkt[PDEQ_N_BKTS];			//\lnlbl{bkt}
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index d30ee48..00bf957 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -22,7 +22,7 @@
 
 #include "../api.h"
 
-//\begin{snippet}[labelbase=ln:count:count_tstat:whole,commandchars=\\\@\$]
+//\begin{snippet}[labelbase=ln:count:count_tstat:whole,keepcomment=yes,commandchars=\\\@\$]
 unsigned long __thread counter = 0;
 unsigned long *counterp[NR_THREADS] = { NULL };
 int finalthreadcount = 0;
diff --git a/CodeSamples/defer/route_rcu.c b/CodeSamples/defer/route_rcu.c
index 168eead..f147848 100644
--- a/CodeSamples/defer/route_rcu.c
+++ b/CodeSamples/defer/route_rcu.c
@@ -94,16 +94,17 @@ int route_add(unsigned long addr, unsigned long interface)
 
 static void route_cb(struct rcu_head *rhp)		//\lnlbl{cb:b}
 {
-	struct route_entry *rep = container_of(rhp, struct route_entry, rh); //\fcvexclude
-								//\fcvexclude
-	re_free(rep);						//\fcvexclude
-/* --- Alternative code for code snippet: begin ---		  \fcvexclude
+#ifndef FCV_SNIPPET
+	struct route_entry *rep = container_of(rhp, struct route_entry, rh);
+
+	re_free(rep);
+#else /* FCV_SNIPPET */
 	struct route_entry *rep;
 
 	rep = container_of(rhp, struct route_entry, rh);
 	WRITE_ONCE(rep->re_freed, 1);
 	free(rep);
-   --- Alternative code for code snippet: end --- */		//\fcvexclude
+#endif /* FCV_SNIPPET */
 }							//\lnlbl{cb:e}
 
 /*								  \fcvexclude
diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
index 1580478..1ba0b8d 100644
--- a/CodeSamples/toolsoftrade/forkjoinvar.c
+++ b/CodeSamples/toolsoftrade/forkjoinvar.c
@@ -24,7 +24,7 @@
 #include <errno.h>
 #include "../api.h"
 
-// \begin{snippet}[labelbase=ln:toolsoftrade:forkjoinvar:main,commandchars=\$\@\^]
+// \begin{snippet}[labelbase=ln:toolsoftrade:forkjoinvar:main,keepcomment=yes,commandchars=\$\@\^]
 int x = 0;
 
 int main(int argc, char *argv[])
diff --git a/CodeSamples/toolsoftrade/pcreate.c b/CodeSamples/toolsoftrade/pcreate.c
index 695a7b7..1eef8bb 100644
--- a/CodeSamples/toolsoftrade/pcreate.c
+++ b/CodeSamples/toolsoftrade/pcreate.c
@@ -26,7 +26,7 @@
 #include <errno.h>
 #include "../api.h"
 
-// \begin{snippet}[labelbase=ln:toolsoftrade:pcreate:mythread,commandchars=\$\@\^]
+// \begin{snippet}[labelbase=ln:toolsoftrade:pcreate:mythread,keepcomment=yes,commandchars=\$\@\^]
 int x = 0;
 
 void *mythread(void *arg)
-- 
2.7.4


