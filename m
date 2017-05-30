Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IQQZa8i4Cv5iM6WAIcL9rEPbhEBKaR89E/NbdpXqjdk=;
 b=j9FcPqENyL073Zkjhhpo0ca30Pnz1W6cMKLZU8ZI+BFUgWi5jRggesUTdwQwj5UVBt
 4gengvp70/Vf9OkrylfdL26ckqke7uRicY3cT5FPtb/idlznyxQNX01HWjwaajil+3JE
 DBXm7tT+91P3DDvSG1oMM3x5ctAtWzP9yQycrsTaBBV7HioskbmMx2GxxJBvjUiDWP4M
 nqzU9jblQsF3vLuckMYPG7frn805GbkBzMvFgOQyb02lK01ADDgPOdaEFxTO9TA1hKpH
 rsC2HjnCvWhg/js4u88N6OdU7HtzO8hzkGyjHpwuoHT/trpImyHNSn8s7KY1iM0B3ake
 geXA==
Subject: [RFC PATCH v2 1/2] CodeSamples: Use 'intptr_t' to be compatible with
 'void *'
References: <f9df1cc9-32af-951c-1f89-b89331c9dce9@gmail.com>
 <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <06a5601a-e908-a808-adbb-3605199028c7@gmail.com>
Date: Tue, 30 May 2017 21:06:58 +0900
MIME-Version: 1.0
In-Reply-To: <8e20cd05-59f8-f651-d0e0-1db2a7105d33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 177ee2891184f0a97b66d748763dbc7af75033ff Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 30 May 2017 20:21:41 +0900
Subject: [RFC PATCH v2 1/2] CodeSamples: Use 'intptr_t' to be compatible with 'void *'

On x86_64, casting between "int" and "void *" in threadcreate.c
causes GCC to emit warnings such as:

    warning: cast from pointer to integer of different size
    warning: cast from integer to pointer of different size

Let's adopt C99 way of writing portable code.

Also do the same changes where appropriate. (Other than
threadcreate.c, no warnings were observed on x86_64.)

[Revised according to Paul's suggestion to keep intptr_t usage
 confined.]

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/matmul.c     | 4 ++--
 CodeSamples/SMPdesign/smpalloc.c   | 4 ++--
 CodeSamples/defer/gettimestampmp.c | 2 +-
 CodeSamples/intro/threadcreate.c   | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/SMPdesign/matmul.c b/CodeSamples/SMPdesign/matmul.c
index 6a07730..3f70807 100644
--- a/CodeSamples/SMPdesign/matmul.c
+++ b/CodeSamples/SMPdesign/matmul.c
@@ -38,7 +38,7 @@ atomic_t nstarted;

 void *matmul_thread(void *me_in)
 {
-	long me = (long)me_in;
+	long me = (intptr_t)me_in;
 	int i, j, k;

 	atomic_inc(&nstarted);
@@ -87,7 +87,7 @@ int main(int argc, char *argv[])
 	goflag = GOFLAG_INIT;
 	startcreatetime = get_microseconds();
 	for (i = 0; i < nthread; i++)
-		create_thread(matmul_thread, (void *)(long)i);
+		create_thread(matmul_thread, (void *)(intptr_t)i);
 	while (atomic_read(&nstarted) != nthread)
 		barrier();
 	starttime = get_microseconds();
diff --git a/CodeSamples/SMPdesign/smpalloc.c b/CodeSamples/SMPdesign/smpalloc.c
index 95b21a1..454846b 100644
--- a/CodeSamples/SMPdesign/smpalloc.c
+++ b/CodeSamples/SMPdesign/smpalloc.c
@@ -123,7 +123,7 @@ void *memblock_test(void *arg)
 	long cnt = 0;
 	long cntfail = 0;
 	int i;
-	int runlength = (int)(long)arg;
+	int runlength = (intptr_t)arg;
 	struct memblock *p[MAX_RUN];

 	if (runlength > MAX_RUN)
@@ -189,7 +189,7 @@ int main(int argc, char *argv[])

 	goflag = 1;
 	for (i = 0; i < nkids; i++)
-		create_thread(memblock_test, (void *)(long)runlength);
+		create_thread(memblock_test, (void *)(intptr_t)runlength);

 	sleep(1);
 	goflag = 0;
diff --git a/CodeSamples/defer/gettimestampmp.c b/CodeSamples/defer/gettimestampmp.c
index bc0b9ea..2abade4 100644
--- a/CodeSamples/defer/gettimestampmp.c
+++ b/CodeSamples/defer/gettimestampmp.c
@@ -29,7 +29,7 @@ long curtimestamp = 0;

 void *collect_timestamps(void *mask_in)
 {
-	long mask = (long)mask_in;
+	long mask = (intptr_t)mask_in;

 	while (curtimestamp < MAX_TIMESTAMPS) {
 		while ((curtimestamp & CURTIMESTAMP_MASK) != mask)
diff --git a/CodeSamples/intro/threadcreate.c b/CodeSamples/intro/threadcreate.c
index 26b7ba9..94cde89 100644
--- a/CodeSamples/intro/threadcreate.c
+++ b/CodeSamples/intro/threadcreate.c
@@ -22,7 +22,7 @@

 void *thread_test(void *arg)
 {
-	int myarg = (int)arg;
+	int myarg = (intptr_t)arg;

 	printf("child thread %d: smp_thread_id() = %d\n",
 	       myarg, smp_thread_id());
@@ -54,7 +54,7 @@ int main(int argc, char *argv[])
 	printf("Parent thread spawning %d threads.\n", nkids);

 	for (i = 0; i < nkids; i++)
-		create_thread(thread_test, (void *)i);
+		create_thread(thread_test, (void *)(intptr_t)i);

 	wait_all_threads();

-- 
2.7.4


