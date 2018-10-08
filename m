Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c13uKCb7DG+NYByp4o9SPesz6mg0nJGWpwkYpiVPpIw=;
        b=P19MTBohR/ez1B9bYsKls6NRZ/WFhpbnHHmPN+wcDtQ8h9+vf2PFPelBgjMB751tBe
         Y69UXoGTMC2v3X5tdzYLHmMqtL1cGketk3Wh9z6kX5cdaSgAsSdDiuWbCBwpbd7cVGay
         tQZc43xgBBN+S6mxh0ZDqZfazNdhWBiSKDMrdeO7gss33K3gNNKlOX+eFUkAwEUy9tOs
         wk0ZfF+MKEHFgnk8hVvKQWLoStfqFf5TDGJLyFSiWNae+aYWFnAdfA6Dr3XG91siboe9
         WCqShGdL5SQPu5CRe4A98o81wMEhgtgQ7ILTzomsXZPRSfCHSMa2+gF7hj7EbYtwfDFP
         D6kg==
Subject: [PATCH 2/5] count: Fix uses of READ/WRITE_ONCE()s in count_end and
 count_tstat
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cfe8a98a-92e5-3e26-2c4e-6f1b306ca13a@gmail.com>
Date: Mon, 8 Oct 2018 10:44:19 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4dc689c1439cc6f68989cdc2b5c177ec06002910 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 09:13:15 +0900
Subject: [PATCH 2/5] count: Fix uses of READ/WRITE_ONCE()s in count_end and count_tstat

Add/remove READ_ONCE()/WRITE_ONCE()s to comply with the
guideline to be expanded in toolsoftrade.

Note on addition of READ_ONCE() while holding a lock:
In read_count() of count_end.c, READ_ONCE() is added to access
of *counterp[t] while holding final_mutex. This is because
final_mutex protects only counterp[], but per-thread variables
pointed to by the array are updated by the owning threads'
inc_count().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_end.c   |  5 ++---
 CodeSamples/count/count_tstat.c | 11 +++++------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index 94b9273..61f9d81 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -29,8 +29,7 @@ DEFINE_SPINLOCK(final_mutex);			//\lnlbl{var:e}
 
 static __inline__ void inc_count(void)		//\lnlbl{inc:b}
 {
-	WRITE_ONCE(counter,
-		   READ_ONCE(counter) + 1);
+	WRITE_ONCE(counter, counter + 1);
 }						//\lnlbl{inc:e}
 
 static __inline__ unsigned long read_count(void)
@@ -42,7 +41,7 @@ static __inline__ unsigned long read_count(void)
 	sum = finalcount;				//\lnlbl{read:sum:init}
 	for_each_thread(t)				//\lnlbl{read:loop:b}
 		if (counterp[t] != NULL)		//\lnlbl{read:check}
-			sum += *counterp[t];		//\lnlbl{read:loop:e}
+			sum += READ_ONCE(*counterp[t]);	//\lnlbl{read:loop:e}
 	spin_unlock(&final_mutex);			//\lnlbl{read:release}
 	return sum;					//\lnlbl{read:return}
 }
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 4318bc3..4b99415 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -30,8 +30,7 @@ DEFINE_SPINLOCK(final_mutex);
 
 static __inline__ void inc_count(void)
 {
-	WRITE_ONCE(counter,
-		   READ_ONCE(counter) + 1);
+	WRITE_ONCE(counter, counter + 1);
 }
 
 static __inline__ unsigned long read_count(void)
@@ -41,8 +40,8 @@ static __inline__ unsigned long read_count(void)
 	unsigned long sum = 0;
 
 	for_each_thread(t)
-		if (counterp[t] != NULL)
-			sum += *counterp[t];
+		if (READ_ONCE(counterp[t]) != NULL)
+			sum += READ_ONCE(*counterp[t]);
 	return sum;
 }
 
@@ -52,7 +51,7 @@ void count_init(void)		//\fcvexclude
 				//\fcvexclude
 void count_register_thread(unsigned long *p)
 {
-	counterp[smp_thread_id()] = &counter;
+	WRITE_ONCE(counterp[smp_thread_id()], &counter);
 }
 
 void count_unregister_thread(int nthreadsexpected)
@@ -60,7 +59,7 @@ void count_unregister_thread(int nthreadsexpected)
 	spin_lock(&final_mutex);
 	finalthreadcount++;
 	spin_unlock(&final_mutex);
-	while (finalthreadcount < nthreadsexpected)
+	while (READ_ONCE(finalthreadcount) < nthreadsexpected)
 		poll(NULL, 0, 1);
 }
 //\end{snippet}
-- 
2.7.4


