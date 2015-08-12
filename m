Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:35928 "EHLO
 mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S933457AbbHLHzt (ORCPT	<rfc822;perfbook@vger.kernel.org>); Wed, 12
 Aug 2015 03:55:49 -0400
Received: by wicja10 with SMTP id ja10so102875619wic.1 for
 <perfbook@vger.kernel.org>; Wed, 12 Aug 2015 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pZHwQ2+2ZZunC1/aypoOSaD97qgOFKk/ZAGYv78ALU0=;
 b=zW5pw9bS1UOQU+CND1xPC5kh/UfhIcGofaZfz2rPDuEJ94wXa7RhwLhzwY2xhLSbBu
 9e0urnA7XQGoxSFUJPMg/r6+ow2dwYslgQ52euNUX2tT1hKqjS/GHHAfdlaq5mgK9JSl
 0sYkz04FhFjpqvyLucDb9Bg21OYpLPcMBDhQ/VUwjgqOXKMJkv4hhABhS0AlNHK3GZYU
 pEzOAQS94mO6lzIiX2WM3cF2CAGSfawV+/0lc9yCkXkXfRNztLFQVOEPuZ+og0y4YPeW
 A8nW6AdYrWJDaXwz12WjyHvWxCr+umnHGonp/6qtFa4vy0ZrO4xlazPDycFrArj5GcBd
 193g==
From: Dominik Dingel <dominik.dingel@gmail.com>
Subject: [PATCH 1/2] CodeSamples: Fix compiler warnings
Date: Wed, 12 Aug 2015 09:55:23 +0200
Message-Id: <1439366124-18185-2-git-send-email-dominik.dingel@gmail.com>
In-Reply-To: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
References: <1439366124-18185-1-git-send-email-dominik.dingel@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Dominik Dingel <dingel@linux.vnet.ibm.com>

From: Dominik Dingel <dingel@linux.vnet.ibm.com>

Remove unreferenced variables, add necessary returns, make compiler
happy.

Signed-off-by: Dominik Dingel <dingel@linux.vnet.ibm.com>
---
 CodeSamples/SMPdesign/deqtorture.h   | 2 +-
 CodeSamples/SMPdesign/locktdeq.c     | 4 ----
 CodeSamples/SMPdesign/matmul.c       | 3 ++-
 CodeSamples/SMPdesign/matmul_block.c | 3 ++-
 CodeSamples/SMPdesign/smpalloc.c     | 1 -
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/CodeSamples/SMPdesign/deqtorture.h b/CodeSamples/SMPdesign/deqtorture.h
index 4def9d7..61ea70a 100644
--- a/CodeSamples/SMPdesign/deqtorture.h
+++ b/CodeSamples/SMPdesign/deqtorture.h
@@ -482,7 +482,6 @@ int main(int argc, char *argv[])
 	int d1, d2, d3, d4;
 	struct deq_elem e1, e2, e3;
 	int i;
-	struct cds_list_head *p;
 	struct pdeq deq;

 	init_pdeq(&deq);
@@ -546,4 +545,5 @@ int main(int argc, char *argv[])
 	for (i = 0; i < 10; i++) {
 		pdeq_perf();
 	}
+	return 0;
 }
diff --git a/CodeSamples/SMPdesign/locktdeq.c b/CodeSamples/SMPdesign/locktdeq.c
index 20bdb85..0375902 100644
--- a/CodeSamples/SMPdesign/locktdeq.c
+++ b/CodeSamples/SMPdesign/locktdeq.c
@@ -140,8 +140,6 @@ struct cds_list_head *pdeq_pop_r(struct pdeq *d)

 void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)
 {
-	int i;
-
 	spin_lock(&d->llock);
 	deq_push_l(e, &d->ldeq);
 	spin_unlock(&d->llock);
@@ -149,8 +147,6 @@ void pdeq_push_l(struct cds_list_head *e, struct pdeq *d)

 void pdeq_push_r(struct cds_list_head *e, struct pdeq *d)
 {
-	int i;
-
 	spin_lock(&d->rlock);
 	deq_push_r(e, &d->rdeq);
 	spin_unlock(&d->rlock);
diff --git a/CodeSamples/SMPdesign/matmul.c b/CodeSamples/SMPdesign/matmul.c
index 13a7d46..96ed9ef 100644
--- a/CodeSamples/SMPdesign/matmul.c
+++ b/CodeSamples/SMPdesign/matmul.c
@@ -53,11 +53,12 @@ void *matmul_thread(void *me_in)
 		}

 	atomic_inc(&ndone);
+	return NULL;
 }

 int main(int argc, char *argv[])
 {
-	int i, j, k;
+	int i, j;
 	long long startcreatetime;
 	long long starttime;
 	long long endtime;
diff --git a/CodeSamples/SMPdesign/matmul_block.c b/CodeSamples/SMPdesign/matmul_block.c
index 7ed0d52..2ed38ca 100644
--- a/CodeSamples/SMPdesign/matmul_block.c
+++ b/CodeSamples/SMPdesign/matmul_block.c
@@ -58,11 +58,12 @@ void *matmul_thread(void *band_in)
 		}

 	atomic_inc(&ndone);
+	return NULL;
 }

 int main(int argc, char *argv[])
 {
-	int i, j, k;
+	int i, j;
 	struct band *bands;
 	int bandsize;
 	long long startcreatetime;
diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
index f6250ef..5b1f5b6 100644
--- a/CodeSamples/SMPdesign/smpalloc.c
+++ b/CodeSamples/SMPdesign/smpalloc.c
@@ -156,7 +156,6 @@ void usage(char *progname)
 int main(int argc, char *argv[])
 {
 	int i;
-	struct memblock *p[2 * TARGET_POOL_SIZE] = { 0 };
 	long long nc;
 	long long nf;
 	int nkids = 1;
-- 
1.9.1

