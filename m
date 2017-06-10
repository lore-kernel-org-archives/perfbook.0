Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wrBRj26PYUJ8PXmVktAqRIEmowrmGNv3ei/vPvNPk6Y=;
 b=m/Ei4FLPkMeRHV3iHMPeP6HAGy4AwzQRG46gznI60M9Gs6DBN3DcOBwSGKCpctCXso
 wnVcXUYxwvIEG6nXoBJF3Chgf0QwdBxMJvWkUZrJRt1eWIyKbiQmHyiHuEHv+D2JFp/0
 kpqRnU/e4+JTr5jaXW6TgiQ9wTl3UA91q6iD3Ndl/uuNUCg2/VkOQQDrNBtMdI4iyvio
 TzQ+9q2iW+Go5U73DxN5KSwuc2wlj7AdKBb0oPk4QWuTqBp/bkQrVWReAs95V86WGgSG
 Zn3jCDswVvhhoqoUjp/+jKZv5U44VYRAe20t/s3tLiZkjDnaieFQJsV52SuAWkHB1wdJ
 GY9w==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/4] route_hazptr: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Sat, 10 Jun 2017 22:28:29 +0800
Message-Id: <1497104910-4596-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
References: <1497104910-4596-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/route_hazptr.c | 10 +++++-----
 defer/hazptr.tex                 |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/CodeSamples/defer/route_hazptr.c b/CodeSamples/defer/route_hazptr.c
index 590ba4d..49e6e4a 100644
--- a/CodeSamples/defer/route_hazptr.c
+++ b/CodeSamples/defer/route_hazptr.c
@@ -49,7 +49,7 @@ unsigned long route_lookup(unsigned long addr)
 retry:
 	repp = &route_list.re_next;
 	do {
-		rep = ACCESS_ONCE(*repp);
+		rep = READ_ONCE(*repp);
 		if (rep == NULL)
 			return ULONG_MAX;
 		if (rep == (struct route_entry *)HAZPTR_POISON)
@@ -61,13 +61,13 @@ retry:
 		smp_mb(); /* Force pointer loads in order. */

 		/* Recheck the hazard pointer against the original. */
-		if (ACCESS_ONCE(*repp) != rep)
+		if (READ_ONCE(*repp) != rep)
 			goto retry;

 		/* Advance to next. */
 		repp = &rep->re_next;
 	} while (rep->addr != addr);
-	if (ACCESS_ONCE(rep->re_freed))
+	if (READ_ONCE(rep->re_freed))
 		abort();
 	return rep->iface;
 }
@@ -129,7 +129,7 @@ void route_clear(void)

 	spin_lock(&routelock);
 	rep = route_list.re_next;
-	ACCESS_ONCE(route_list.re_next) = NULL;
+	WRITE_ONCE(route_list.re_next, NULL);
 	while (rep != NULL) {
 		rep1 = rep->re_next;
 		rep->re_next = (struct route_entry *)HAZPTR_POISON;
@@ -157,7 +157,7 @@ void hazptr_free(void *p)
 {
 	struct route_entry *rep = p;

-	ACCESS_ONCE(rep->re_freed) = 1;
+	WRITE_ONCE(rep->re_freed, 1);
 	free(p);
 }

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 10ae7a1..b45f5b6 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -201,7 +201,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 18 retry:
 19   repp = &route_list.re_next;
 20   do {
-21     rep = ACCESS_ONCE(*repp);
+21     rep = READ_ONCE(*repp);
 22     if (rep == NULL)
 23       return ULONG_MAX;
 24     if (rep == (struct route_entry *)HAZPTR_POISON)
@@ -209,11 +209,11 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 26     my_hazptr[offset].p = &rep->hh;
 27     offset = !offset;
 28     smp_mb();
-29     if (ACCESS_ONCE(*repp) != rep)
+29     if (READ_ONCE(*repp) != rep)
 30       goto retry;
 31     repp = &rep->re_next;
 32   } while (rep->addr != addr);
-33   if (ACCESS_ONCE(rep->re_freed))
+33   if (READ_ONCE(rep->re_freed))
 34     abort();
 35   return rep->iface;
 36 }
-- 
2.7.4

