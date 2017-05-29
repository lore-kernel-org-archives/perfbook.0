Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34266 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750864AbdE2WRb (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 29
 May 2017 18:17:31 -0400
Received: by mail-pf0-f194.google.com with SMTP id w69so13630984pfk.1 for
 <perfbook@vger.kernel.org>; Mon, 29 May 2017 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SNF7sHsq80fbdgKEPJK+n2htDF1ic6Gi5qroZiQFvbs=;
 b=MMvmnMJ/T2sYdDYp3o3cO4hdfHQZ2iZgdnvcYaLFVvm+To/FipsmuKJUDL6+9sZfln
 Bwm9pzbDvMMiBgFqjgwx/YH9VKRi1NIDh8PRNzffV62s+nllGtFlz8sCtS1p3EnEjiwy
 GyfQ7E1BFmY79CW4WF/ZCvwXMQozxme9BUBsFhNyQP3HKrSSR6eyfZnbGhCVO8ZGoEwr
 kf/J3RNgP0cAPPJb+9CTkiYhjPn9Gant/X1PVh+/7rRul785CS569bMoTq6/UMiwjM+E
 fVnX6syk2Si6xH2WzBgcU9xsw4m98grHYrYYujQBtf7IB61+tjRoEhk7CPXbFLEgmvbM
 7jeA==
Subject: [RFC PATCH 3/4] CodeSamples: Use 'intptr_t' to be compatible with
 'void *'
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <916893a3-f31a-6cc9-a03d-b0c9023be634@gmail.com>
Date: Tue, 30 May 2017 07:17:27 +0900
MIME-Version: 1.0
In-Reply-To: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From e325a5ff132d8e4a79dfe465b18f573b97da75db Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 May 2017 12:38:27 +0900
Subject: [RFC PATCH 3/4] CodeSamples: Use 'intptr_t' to be compatible with 'void *'

On x86_64, casting between "int" and "void *" in threadcreate.c
causes GCC to emit warnings such as:

    warning: cast from pointer to integer of different size
    warning: cast from integer to pointer of different size

Let's adopt C99 way of writing portable code.

Also do the same changes where appropriate. (Other than
threadcreate.c, no warnings were observed on x86_64, but we can
remove a few casts to "long".)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/matmul.c     | 13 +++++++------
 CodeSamples/SMPdesign/smpalloc.c   | 11 ++++++-----
 CodeSamples/defer/gettimestampmp.c |  2 +-
 CodeSamples/intro/threadcreate.c   |  7 ++++---
 4 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/CodeSamples/SMPdesign/matmul.c b/CodeSamples/SMPdesign/matmul.c
index 6a07730..9f0b250 100644
--- a/CodeSamples/SMPdesign/matmul.c
+++ b/CodeSamples/SMPdesign/matmul.c
@@ -18,12 +18,13 @@
  * Copyright (c) 2009 Paul E. McKenney, IBM Corporation.
  */

+#include <inttypes.h>
 #include "../api.h"

 float *a;
 float *b;
 float *c;
-long dim = 1000;
+intptr_t dim = 1000;
 int nthread = 1;

 #define GOFLAG_INIT     0
@@ -38,8 +39,8 @@ atomic_t nstarted;

 void *matmul_thread(void *me_in)
 {
-	long me = (long)me_in;
-	int i, j, k;
+	intptr_t me = (intptr_t)me_in;
+	intptr_t i, j, k;

 	atomic_inc(&nstarted);
 	while (goflag == GOFLAG_INIT)
@@ -58,7 +59,7 @@ void *matmul_thread(void *me_in)

 int main(int argc, char *argv[])
 {
-	int i, j;
+	intptr_t i, j;
 	long long startcreatetime;
 	long long starttime;
 	long long endtime;
@@ -87,7 +88,7 @@ int main(int argc, char *argv[])
 	goflag = GOFLAG_INIT;
 	startcreatetime = get_microseconds();
 	for (i = 0; i < nthread; i++)
-		create_thread(matmul_thread, (void *)(long)i);
+		create_thread(matmul_thread, (void *)i);
 	while (atomic_read(&nstarted) != nthread)
 		barrier();
 	starttime = get_microseconds();
@@ -95,7 +96,7 @@ int main(int argc, char *argv[])
 	while (atomic_read(&ndone) != nthread)
 		poll(NULL, 0, 1);
 	endtime = get_microseconds();
-	printf("dim = %ld, nthread = %d, duration = %lld : %lld us\n",
+	printf("dim = %" PRIdPTR ", nthread = %d, duration = %lld : %lld us\n",
 	       dim, nthread, endtime - startcreatetime, endtime - starttime);
 	return 0;
 }
diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
index 95b21a1..0882f63 100644
--- a/CodeSamples/SMPdesign/smpalloc.c
+++ b/CodeSamples/SMPdesign/smpalloc.c
@@ -19,6 +19,7 @@
  * Copyright (c) 2006 Paul E. McKenney, IBM Corporation.
  */

+#include <inttypes.h>
 #include "../api.h"

 #define TARGET_POOL_SIZE 3
@@ -123,7 +124,7 @@ void *memblock_test(void *arg)
 	long cnt = 0;
 	long cntfail = 0;
 	int i;
-	int runlength = (int)(long)arg;
+	intptr_t runlength = (intptr_t)arg;
 	struct memblock *p[MAX_RUN];

 	if (runlength > MAX_RUN)
@@ -159,7 +160,7 @@ int main(int argc, char *argv[])
 	long long nc;
 	long long nf;
 	int nkids = 1;
-	int runlength = 1;
+	intptr_t runlength = 1;
 	int totbefore;

 	smp_init();
@@ -176,12 +177,12 @@ int main(int argc, char *argv[])
 	if (argc > 2) {
 		runlength = strtoul(argv[2], NULL, 0);
 		if (runlength > MAX_RUN) {
-			fprintf(stderr, "nkids = %d too large, max = %d\n",
+			fprintf(stderr, "nkids = %" PRIdPTR " too large, max = %d\n",
 				runlength, MAX_RUN);
 			usage(argv[0]);
 		}
 	}
-	printf("%d %d ", nkids, runlength);
+	printf("%d %" PRIdPTR, nkids, runlength);

 	init_per_thread(results, 0L);
 	init_per_thread(failures, 0L);
@@ -189,7 +190,7 @@ int main(int argc, char *argv[])

 	goflag = 1;
 	for (i = 0; i < nkids; i++)
-		create_thread(memblock_test, (void *)(long)runlength);
+		create_thread(memblock_test, (void *)runlength);

 	sleep(1);
 	goflag = 0;
diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
index bc0b9ea..e794e82 100644
--- a/CodeSamples/defer/gettimestampmp.c
+++ b/CodeSamples/defer/gettimestampmp.c
@@ -29,7 +29,7 @@ long curtimestamp = 0;

 void *collect_timestamps(void *mask_in)
 {
-	long mask = (long)mask_in;
+	intptr_t mask = (intptr_t)mask_in;

 	while (curtimestamp < MAX_TIMESTAMPS) {
 		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
diff --git a/CodeSamples/intro/threadcreate.c b/CodeSamples/intro/threadcreate.c
index 26b7ba9..470bb11 100644
--- a/CodeSamples/intro/threadcreate.c
+++ b/CodeSamples/intro/threadcreate.c
@@ -18,13 +18,14 @@
  * Copyright (c) 2006 Paul E. McKenney, IBM Corporation.
  */

+#include <inttypes.h>
 #include "../api.h"

 void *thread_test(void *arg)
 {
-	int myarg = (int)arg;
+	intptr_t myarg = (intptr_t)arg;

-	printf("child thread %d: smp_thread_id() = %d\n",
+	printf("child thread %" PRIdPTR ": smp_thread_id() = %d\n",
 	       myarg, smp_thread_id());
 	return NULL;
 }
@@ -38,7 +39,7 @@ void usage(char *progname)

 int main(int argc, char *argv[])
 {
-	int i;
+	intptr_t i;
 	int nkids = 1;

 	smp_init();
-- 
2.7.4


