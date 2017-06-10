Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0iFSXqkT5Vvnawtsj7TZQ8fkDw6XEuNAoOtfM47es0g=;
 b=EfKBmrUa00cRJ//Mxpu+i/wL+9xHCwHWXXnTBV7i7cYHu68QOg0MYClif7kfqnP5TH
 ZOyZ6hp83/rWbojkQrx6emaZpMsaDWQY4PsoD12/LUcbvdnDqdb6NxtRGUeiXR1uldvL
 ONeJ+t7TeJ4g8rESFp/yotsUpppPB5tExd+Vsx+rdoPfjPq3RTHfy+JZ3EBbSTquyCxk
 7jBqd6eHyNPpu+aOy2f4Oe5eh5DkfN1x8wlFR/deLW0rHc6MgM9EkhhOC9qBhLq3W2lG
 GEdg1diMU5Ed+QY/4jMTk5hVsmWDHaNxODLjIn1K9NqUszZ/HcNQTqASVMOuTZcZ/0zp
 rRTA==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 3/4] route_seqlock: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Sat, 10 Jun 2017 22:28:30 +0800
Message-Id: <1497104910-4596-4-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
References: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/route_seqlock.c |  6 +++---
 CodeSamples/defer/seqlock.h       |  4 ++--
 defer/seqlock.tex                 | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/CodeSamples/defer/route_seqlock.c b/CodeSamples/defer/route_seqlock.c
index 633cf05..8224682 100644
--- a/CodeSamples/defer/route_seqlock.c
+++ b/CodeSamples/defer/route_seqlock.c
@@ -47,7 +47,7 @@ retry:
 	s = read_seqbegin(&sl);
 	repp = &route_list.re_next;
 	do {
-		rep = ACCESS_ONCE(*repp);
+		rep = READ_ONCE(*repp);
 		if (rep == NULL) {
 			if (read_seqretry(&sl, s))
 				goto retry;
@@ -57,7 +57,7 @@ retry:
 		/* Advance to next. */
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
-	if (ACCESS_ONCE(rep->re_freed))
+	if (READ_ONCE(rep->re_freed))
 		abort();
 	ret = rep->iface;
 	if (read_seqretry(&sl, s))
@@ -123,7 +123,7 @@ void route_clear(void)

 	write_seqlock(&sl);
 	rep = route_list.re_next;
-	ACCESS_ONCE(route_list.re_next) = NULL;
+	WRITE_ONCE(route_list.re_next, NULL);
 	while (rep != NULL) {
 		rep1 = rep->re_next;
 		free(rep);
diff --git a/CodeSamples/defer/seqlock.h b/CodeSamples/defer/seqlock.h
index b210944..c994285 100644
--- a/CodeSamples/defer/seqlock.h
+++ b/CodeSamples/defer/seqlock.h
@@ -38,7 +38,7 @@ static inline unsigned long read_seqbegin(seqlock_t *slp)
 {
 	unsigned long s;

-	s = ACCESS_ONCE(slp->seq);
+	s = READ_ONCE(slp->seq);
 	smp_mb();
 	return s & ~0x1UL;
 }
@@ -48,7 +48,7 @@ static inline int read_seqretry(seqlock_t *slp, unsigned long oldseq)
 	unsigned long s;

 	smp_mb();
-	s = ACCESS_ONCE(slp->seq);
+	s = READ_ONCE(slp->seq);
 	return s != oldseq;
 }

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index ba8abfe..cb5e4e6 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -116,7 +116,7 @@ It is also used in pathname traversal to detect concurrent rename operations.
 13  {
 14    unsigned long s;
 15
-16    s = ACCESS_ONCE(slp->seq);
+16    s = READ_ONCE(slp->seq);
 17    smp_mb();
 18    return s & ~0x1UL;
 19  }
@@ -127,7 +127,7 @@ It is also used in pathname traversal to detect concurrent rename operations.
 24    unsigned long s;
 25
 26    smp_mb();
-27    s = ACCESS_ONCE(slp->seq);
+27    s = READ_ONCE(slp->seq);
 28    return s != oldseq;
 29  }
 30
@@ -211,11 +211,11 @@ in other words, that there has been no writer, and returns true if so.
 	In older versions of the Linux kernel, no.

 	In very new versions of the Linux kernel, line~16 could use
-	\co{smp_load_acquire()} instead of \co{ACCESS_ONCE()}, which
+	\co{smp_load_acquire()} instead of \co{READ_ONCE()}, which
 	in turn would allow the \co{smp_mb()} on line~17 to be dropped.
 	Similarly, line~41 could use an \co{smp_store_release()}, for
 	example, as follows: \\
-	\co{smp_store_release(&slp->seq, ACCESS_ONCE(slp->seq) + 1);} \\
+	\co{smp_store_release(&slp->seq, READ_ONCE(slp->seq) + 1);} \\
 	This would allow the \co{smp_mb()} on line~40 to be dropped.
 } \QuickQuizEnd

@@ -310,7 +310,7 @@ increment of the sequence number on line~44, then releases the lock.
 18   s = read_seqbegin(&sl);
 19   repp = &route_list.re_next;
 20   do {
-21     rep = ACCESS_ONCE(*repp);
+21     rep = READ_ONCE(*repp);
 22     if (rep == NULL) {
 23       if (read_seqretry(&sl, s))
 24         goto retry;
@@ -318,7 +318,7 @@ increment of the sequence number on line~44, then releases the lock.
 26     }
 27     repp = &rep->re_next;
 28   } while (rep->addr != addr);
-29   if (ACCESS_ONCE(rep->re_freed))
+29   if (READ_ONCE(rep->re_freed))
 30     abort();
 31   ret = rep->iface;
 32   if (read_seqretry(&sl, s))
-- 
2.7.4

