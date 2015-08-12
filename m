Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35964 "EHLO
 mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S933457AbbHLHzv (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 12
 Aug 2015 03:55:51 -0400
Received: by wicja10 with SMTP id ja10so102876579wic.1 for
 <perfbook@vger.kernel.org>; Wed, 12 Aug 2015 00:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h2B9m6oV5LzoWP7C4OfUAxxZc+Q7UY17aTEzu1umVOY=;
 b=Y66RKOPmELM4cb1Gl4Q5ocMjAKLs428CilqqSl4k2agjHqMNOq3Hporr/K2XKNxr54
 olhZHp4nHKdVsrw1YdtAmzwB98TpiToRL+h/QvOt7pZ9krDq4rMnYcUq0oqX8D7afQgZ
 qeLxXXP0lspZCBTOe/lVioDW1/SRSVowHTXVLoKhaqfY2VwdnwYy8eFwjS0aO8toMeWz
 R+Ml7T3nT2QsvHDeJ2SkSTeB+n8t368hD6yAz4AljiIUhE1etOo8DaDZlwa9FxmmLmCC
 ceRPXYHZ6xaNwTwSNt2yD3RDMAyVWGNpCi4XFD7pdRWWwR8Gg39DBvgGUTwlAXkR2XYR
 yH7g==
From: Dominik Dingel <dominik.dingel@gmail.com>
Subject: [PATCH 2/2] CodeSamples: add read/write solution to the deq example
Date: Wed, 12 Aug 2015 09:55:24 +0200
Message-Id: <1439366124-18185-3-git-send-email-dominik.dingel@gmail.com>
In-Reply-To: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Dominik Dingel <dingel@linux.vnet.ibm.com>

From: Dominik Dingel <dingel@linux.vnet.ibm.com>

In addition to the split deque and the hashed deque there is now a
solution working with an atomic counter and a read writer lock.

Signed-off-by: Dominik Dingel <dingel@linux.vnet.ibm.com>
---
 CodeSamples/SMPdesign/Makefile    |   5 +-
 CodeSamples/SMPdesign/lockrwdeq.c | 154 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 CodeSamples/SMPdesign/lockrwdeq.c

diff --git a/CodeSamples/SMPdesign/Makefile b/CodeSamples/SMPdesign/Makefile
index fd042b9..80da412 100644
--- a/CodeSamples/SMPdesign/Makefile
+++ b/CodeSamples/SMPdesign/Makefile
@@ -14,7 +14,7 @@
 #
 # Copyright (c) 2008 Paul E. McKenney, IBM Corporation.

-PROGS = smpalloc lockdeq lockhdeq locktdeq matmul matmul_block
+PROGS = smpalloc lockdeq lockhdeq locktdeq lockrwdeq matmul matmul_block

 all: $(PROGS)

@@ -37,6 +37,9 @@ lockhdeq: lockhdeq.c deqtorture.h ../api.h
 locktdeq: locktdeq.c deqtorture.h ../api.h
 	cc $(GCC_ARGS) -g -o locktdeq -DTEST locktdeq.c -lpthread

+lockrwdeq: lockrwdeq.c deqtorture.h ../api.h
+	cc $(GCC_ARGS) -g -o lockrwdeq -DTEST lockrwdeq.c -lpthread
+
 matmul: matmul.c ../api.h
 	cc $(GCC_ARGS) -g -o matmul -DTEST matmul.c -lpthread

diff --git a/CodeSamples/SMPdesign/lockrwdeq.c b/CodeSamples/SMPdesign/lockrwdeq.c
new file mode 100644
index 0000000..65f3189
--- /dev/null
+++ b/CodeSamples/SMPdesign/lockrwdeq.c
@@ -0,0 +1,154 @@
+/*
+ * lockrwdeq.c: simple rw lock-based parallel deq implementation.
+ * 	This is similar to lockdeq.c, but expresses the parallel
+ * 	implementation in terms of a rw lock with an atomic counter.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+ *
+ * Copyright (c) 2015 Dominik Dingel, IBM Corporation.
+ */
+
+#include "../api.h"
+
+/* First do the underlying deq implementation. */
+
+struct deq {
+	struct cds_list_head chain;
+} ____cacheline_internodealigned_in_smp;
+
+void init_deq(struct deq *p)
+{
+	CDS_INIT_LIST_HEAD(&p->chain);
+}
+
+struct cds_list_head *deq_pop_l(struct deq *p)
+{
+	struct cds_list_head *e;
+
+	if (cds_list_empty(&p->chain))
+		e = NULL;
+	else {
+		e = p->chain.prev;
+		cds_list_del(e);
+		CDS_INIT_LIST_HEAD(e);
+	}
+	return e;
+}
+
+void deq_push_l(struct cds_list_head *e, struct deq *p)
+{
+	cds_list_add_tail(e, &p->chain);
+}
+
+struct cds_list_head *deq_pop_r(struct deq *p)
+{
+	struct cds_list_head *e;
+
+	if (cds_list_empty(&p->chain))
+		e = NULL;
+	else {
+		e = p->chain.next;
+		cds_list_del(e);
+		CDS_INIT_LIST_HEAD(e);
+	}
+	return e;
+}
+
+void deq_push_r(struct cds_list_head *e, struct deq *p)
+{
+	cds_list_add(e, &p->chain);
+}
+
+/*
+ * And now the concurrent implementation, which uses a counter and a rw lock.
+ * The counter holds the current available number of items to modify.
+ * Before doing a modification we aquire a read lock and reserve our item to modify
+ * (link/unlink).
+ * If there are not enough items left for true parallel access we will upgrade
+ * the read lock, to a write lock, making the access truly sequential.
+ */
+
+struct pdeq {
+	pthread_rwlock_t lock;
+	atomic_t counter;
+	struct deq deq_cnt;
+};
+
+void init_pdeq(struct pdeq *d)
+{
+	pthread_rwlock_init(&d->lock, NULL);
+	atomic_set(&d->counter, 0);
+	init_deq(&d->deq_cnt);
+}
+
+struct cds_list_head *pdeq_pop_l(struct pdeq *d)
+{
+	struct cds_list_head *e;
+	pthread_rwlock_rdlock(&d->lock);
+	if (atomic_sub_return(2, &d->counter) < 1) {
+		pthread_rwlock_unlock(&d->lock);
+		pthread_rwlock_wrlock(&d->lock);
+	}
+	e = deq_pop_l(&d->deq_cnt);
+	if (e == NULL)
+		atomic_inc(&d->counter);
+	atomic_inc(&d->counter);
+	pthread_rwlock_unlock(&d->lock);
+	return e;
+}
+
+struct cds_list_head *pdeq_pop_r(struct pdeq *d)
+{
+	struct cds_list_head *e;
+	pthread_rwlock_rdlock(&d->lock);
+	if (atomic_sub_return(2, &d->counter) < 1) {
+		pthread_rwlock_unlock(&d->lock);
+		pthread_rwlock_wrlock(&d->lock);
+	}
+	e = deq_pop_r(&d->deq_cnt);
+	if (e == NULL)
+		atomic_inc(&d->counter);
+	atomic_inc(&d->counter);
+	pthread_rwlock_unlock(&d->lock);
+	return e;
+}
+
+void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
+{
+	pthread_rwlock_rdlock(&d->lock);
+	if (atomic_sub_return(1, &d->counter) < 1) {
+		pthread_rwlock_unlock(&d->lock);
+		pthread_rwlock_wrlock(&d->lock);
+	}
+	deq_push_l(e, &d->deq_cnt);
+	atomic_add(2, &d->counter);
+	pthread_rwlock_unlock(&d->lock);
+}
+
+void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
+{
+	pthread_rwlock_rdlock(&d->lock);
+	if (atomic_sub_return(1, &d->counter) < 1) {
+		pthread_rwlock_unlock(&d->lock);
+		pthread_rwlock_wrlock(&d->lock);
+	}
+	deq_push_r(e, &d->deq_cnt);
+	atomic_add(2, &d->counter);
+	pthread_rwlock_unlock(&d->lock);
+}
+
+#ifdef TEST
+#include "deqtorture.h"
+#endif /* #ifdef TEST */
-- 
1.9.1

