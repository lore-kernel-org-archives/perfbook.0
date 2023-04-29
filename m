Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682810037; x=1685402037;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ygU+jFDhPrAHXHJZftv9h+Qk7VJy8Z3PNEV1mLdh7x4=;
        b=ndSe98J255uXhD/W095kBO5MaY+YSGXjoVXdeOmt3nOF6HwqEyClQtazDtlbczw3Bq
         51t41LfRAh+o0hwGOnxV43dGaezDRUTSfiincdjTtPjoX0l+BODyi/I59sFDfid3W2Jv
         DbhaUgbCQGdczPWaCPqOEPhMxT8M4Tzk3eeQKO4ld+TUYtCvhTYRQZ5NjLN2y/YYSn9j
         mQcGoU2Eorgw33O1xCc7gcO4DDepVQP94r/9+m8TG9d6302Lal6CcumSmMafYr7c58M6
         Xym7tlJdZkFleqtDcfaKAPGkWFKpS4RamzI2UzgtFbiSjh+/jaUnRr4ybILKDh2qM9qI
         KYyg==
Message-ID: <ceada600-ac7e-fdb8-9ec7-997f80b2b6aa@gmail.com>
Date: Sun, 30 Apr 2023 08:13:52 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/7] CodeSamples/count: Adjust coding style
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Recent removal of smp_mb() in count_lim.c made a couple of if blocks
one liner.  Remove unneeded braces as per the Linux coding style.

While at it, make similar style fixes under CodeSamples/count as well
as align line-label tail comments.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim.c           |  5 +++--
 CodeSamples/count/count_lim_atomic.c    |  5 +++--
 CodeSamples/count/count_lim_sig.c       | 23 +++++++++++------------
 CodeSamples/count/count_stat_eventual.c |  3 +--
 CodeSamples/count/count_tstat.c         |  3 ++-
 count/count.tex                         |  5 ++---
 6 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/CodeSamples/count/count_lim.c b/CodeSamples/count/count_lim.c
index db78445f2395..7e379d582342 100644
--- a/CodeSamples/count/count_lim.c
+++ b/CodeSamples/count/count_lim.c
@@ -79,9 +79,10 @@ static __inline__ unsigned long read_count(void)	//\lnlbl{read:b}
 
 	spin_lock(&gblcnt_mutex);			//\lnlbl{read:acquire}
 	sum = globalcount;				//\lnlbl{read:initsum}
-	for_each_thread(t)				//\lnlbl{read:loop:b}
+	for_each_thread(t) {				//\lnlbl{read:loop:b}
 		if (counterp[t] != NULL)
-			sum += READ_ONCE(*counterp[t]);	//\lnlbl{read:loop:e}
+			sum += READ_ONCE(*counterp[t]);
+	}						//\lnlbl{read:loop:e}
 	spin_unlock(&gblcnt_mutex);			//\lnlbl{read:release}
 	return sum;					//\lnlbl{read:return}
 }							//\lnlbl{read:e}
diff --git a/CodeSamples/count/count_lim_atomic.c b/CodeSamples/count/count_lim_atomic.c
index 20d9612d6992..8c4dcc75989e 100644
--- a/CodeSamples/count/count_lim_atomic.c
+++ b/CodeSamples/count/count_lim_atomic.c
@@ -171,11 +171,12 @@ unsigned long read_count(void)				//\lnlbl{b}
 
 	spin_lock(&gblcnt_mutex);			//\lnlbl{acquire}
 	sum = globalcount;				//\lnlbl{initsum}
-	for_each_thread(t)				//\lnlbl{loop:b}
+	for_each_thread(t) {				//\lnlbl{loop:b}
 		if (counterp[t] != NULL) {
 			split_counterandmax(counterp[t], &old, &c, &cm);//\lnlbl{split}
 			sum += c;
-		}					//\lnlbl{loop:e}
+		}
+	}						//\lnlbl{loop:e}
 	spin_unlock(&gblcnt_mutex);			//\lnlbl{release}
 	return sum;					//\lnlbl{return}
 }							//\lnlbl{e}
diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index c2f611976466..8d6c3ca3def5 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -57,9 +57,8 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
 	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
 		return;				//\lnlbl{flush_sig:return:n}
 	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
-	if (!counting) {			//\lnlbl{flush_sig:check:fast}
+	if (!counting)				//\lnlbl{flush_sig:check:fast}
 		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
-	}
 }						//\lnlbl{flush_sig:e}
 
 static void flush_local_count(void)			//\lnlbl{flush:b}
@@ -67,7 +66,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 	int t;
 	thread_id_t tid;
 
-	for_each_tid(t, tid)				//\lnlbl{flush:loop:b}
+	for_each_tid(t, tid) {				//\lnlbl{flush:loop:b}
 		if (theftp[t] != NULL) {		//\lnlbl{flush:skip}
 			if (*countermaxp[t] == 0) {	//\lnlbl{flush:checkmax}
 				WRITE_ONCE(*theftp[t], THEFT_READY);//\lnlbl{flush:READY}
@@ -75,7 +74,8 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 			}
 			WRITE_ONCE(*theftp[t], THEFT_REQ);//\lnlbl{flush:REQ}
 			pthread_kill(tid, SIGUSR1);	//\lnlbl{flush:signal}
-		}					//\lnlbl{flush:loop:e}
+		}
+	}						//\lnlbl{flush:loop:e}
 	for_each_tid(t, tid) {				//\lnlbl{flush:loop2:b}
 		if (theftp[t] == NULL)			//\lnlbl{flush:skip:nonexist}
 			continue;			//\lnlbl{flush:next2}
@@ -88,7 +88,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 		*counterp[t] = 0;
 		globalreserve -= *countermaxp[t];
 		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
-		smp_store_release(theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
+		smp_store_release(theftp[t], THEFT_IDLE);//\lnlbl{flush:IDLE}
 	}						//\lnlbl{flush:loop2:e}
 }							//\lnlbl{flush:e}
 
@@ -114,7 +114,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 
 	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
 	barrier();					//\lnlbl{barrier:1}
-	if (smp_load_acquire(&theft) <= THEFT_REQ &&		//\lnlbl{check:b}
+	if (smp_load_acquire(&theft) <= THEFT_REQ &&	//\lnlbl{check:b}
 	    countermax - counter >= delta) {		//\lnlbl{check:e}
 		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
 		fastpath = 1;				//\lnlbl{fasttaken}
@@ -122,9 +122,8 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 	barrier();					//\lnlbl{barrier:2}
 	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
 	barrier();					//\lnlbl{barrier:3}
-	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
-		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
-	}
+	if (READ_ONCE(theft) == THEFT_ACK)		//\lnlbl{check:ACK}
+		smp_store_release(&theft, THEFT_READY);	//\lnlbl{READY}
 	if (fastpath)
 		return 1;				//\lnlbl{return:fs}
 	spin_lock(&gblcnt_mutex);			//\lnlbl{acquire}
@@ -160,9 +159,8 @@ int sub_count(unsigned long delta)
 	barrier();
 	WRITE_ONCE(counting, 0);
 	barrier();
-	if (READ_ONCE(theft) == THEFT_ACK) {
+	if (READ_ONCE(theft) == THEFT_ACK)
 		smp_store_release(&theft, THEFT_READY);
-	}
 	if (fastpath)
 		return 1;
 	spin_lock(&gblcnt_mutex);
@@ -189,9 +187,10 @@ unsigned long read_count(void)
 
 	spin_lock(&gblcnt_mutex);
 	sum = globalcount;
-	for_each_thread(t)
+	for_each_thread(t) {
 		if (counterp[t] != NULL)
 			sum += READ_ONCE(*counterp[t]);
+	}
 	spin_unlock(&gblcnt_mutex);
 	return sum;
 }
diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 7157ee0ed9fd..ed081e9102cd 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -50,9 +50,8 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
 			sum += READ_ONCE(per_thread(counter, t));
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
-		if (READ_ONCE(stopflag)) {
+		if (READ_ONCE(stopflag))
 			smp_store_release(&stopflag, stopflag + 1);
-		}
 	}
 	return NULL;
 }							//\lnlbl{eventual:e}
diff --git a/CodeSamples/count/count_tstat.c b/CodeSamples/count/count_tstat.c
index 127946f32196..d7b4e335f07b 100644
--- a/CodeSamples/count/count_tstat.c
+++ b/CodeSamples/count/count_tstat.c
@@ -40,9 +40,10 @@ static __inline__ unsigned long read_count(void)
 	int t;
 	unsigned long sum = 0;
 
-	for_each_thread(t)
+	for_each_thread(t) {
 		if (READ_ONCE(counterp[t]) != NULL)
 			sum += READ_ONCE(*counterp[t]);
+	}
 	return sum;
 }
 
diff --git a/count/count.tex b/count/count.tex
index 7b2fde109490..3b8b1c113486 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2763,9 +2763,8 @@ write_lock(&mylock);		\lnlbl[acq]
 removing = 1;			\lnlbl[note]
 sub_count(mybias);
 write_unlock(&mylock);		\lnlbl[rel]
-while (read_count() != 0) {	\lnlbl[loop:b]
-	poll(NULL, 0, 1);
-}				\lnlbl[loop:e]
+while (read_count() != 0)	\lnlbl[loop:b]
+	poll(NULL, 0, 1);	\lnlbl[loop:e]
 remove_device();		\lnlbl[remove]
 \end{VerbatimN}
 \end{fcvlabel}
-- 
2.25.1


