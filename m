Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AVNnS3Zi9XWWp/vE54rQTnaDmcYedxk3ceYiPImzaBc=;
 b=V/A+La9q3MV9oSP7yyX5f3KFsjY8P9YAGPxuBoLRVV24cUn8uIvgxwYKUgeSADbjJY
 5jrxkRax6/lJa8CEjRdxyAYFROfXziwHEjwEKOvYh5HoUXJiAXDbEgwK2laIS0g1DV0q
 7ib4B88qYw207PXxcWZ3syg8yzkZNhFYv8dAL71aRlUm5tUsfoPegUTej5cwnTpDfSBv
 ihfqDauwUV8oQTES2ABnqHlvj0juj8rH6PeobA2FiD+M0JXCjx20WHZA//hM+C9X5F9f
 7CIPf+D8GvWQ1teXCK2/q78UucUylsQK8Js/EOcgHq5z4cL6ooYslEB+Kf8h7fF9Cu0+
 Ufng==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 2/2] routetorture.h: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Date: Thu,  8 Jun 2017 11:16:33 +0800
Message-Id: <1496891793-5755-3-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
References: <1496891793-5755-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/routetorture.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/CodeSamples/defer/routetorture.h b/CodeSamples/defer/routetorture.h
index 86693e9..b0d642a 100644
--- a/CodeSamples/defer/routetorture.h
+++ b/CodeSamples/defer/routetorture.h
@@ -104,7 +104,7 @@ void *perftest_reader(void *arg)
 	/* Announce our presence and enter the test loop. */
 	atomic_inc(&nthreads_running);
 	for (;;) {
-		gf = ACCESS_ONCE(goflag);
+		gf = READ_ONCE(goflag);
 		if (gf != GOFLAG_RUN) {
 			if (gf == GOFLAG_STOP)
 				break;
@@ -149,7 +149,7 @@ void perftest(void)
 	pap = malloc(sizeof(*pap) * nreaders);
 	BUG_ON(pap == NULL);
 	atomic_set(&nthreads_running, 0);
-	goflag = GOFLAG_INIT;
+	WRITE_ONCE(goflag, GOFLAG_INIT);

 	/* Populate route table. */
 	for (i = 0; i < nelems; i++)
@@ -173,9 +173,9 @@ void perftest(void)

 	/* Run the test. */
 	starttime = get_microseconds();
-	ACCESS_ONCE(goflag) = GOFLAG_RUN;
+	WRITE_ONCE(goflag, GOFLAG_RUN);
 	poll(NULL, 0, duration);
-	ACCESS_ONCE(goflag) = GOFLAG_STOP;
+	WRITE_ONCE(goflag, GOFLAG_STOP);
 	starttime = get_microseconds() - starttime;
 	wait_all_threads();

@@ -225,7 +225,7 @@ void *stresstest_updater(void *arg)
 	/* Announce our presence and enter the test loop. */
 	atomic_inc(&nthreads_running);
 	for (;;) {
-		gf = ACCESS_ONCE(goflag);
+		gf = READ_ONCE(goflag);
 		if (gf != GOFLAG_RUN) {
 			if (gf == GOFLAG_STOP)
 				break;
@@ -286,7 +286,7 @@ void stresstest(void)
 	pap = malloc(sizeof(*pap) * nupdaters);
 	BUG_ON(pap == NULL);
 	atomic_set(&nthreads_running, 0);
-	goflag = GOFLAG_INIT;
+	WRITE_ONCE(goflag, GOFLAG_INIT);

 	for (i = 0; i < nupdaters; i++) {
 		pap[i].myid = i;
@@ -306,9 +306,9 @@ void stresstest(void)

 	/* Run the test. */
 	starttime = get_microseconds();
-	ACCESS_ONCE(goflag) = GOFLAG_RUN;
+	WRITE_ONCE(goflag, GOFLAG_RUN);
 	poll(NULL, 0, duration);
-	ACCESS_ONCE(goflag) = GOFLAG_STOP;
+	WRITE_ONCE(goflag, GOFLAG_STOP);
 	starttime = get_microseconds() - starttime;
 	wait_all_threads();

-- 
2.7.4

