Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=D3ZYOUdeAie9vqPOCXy+xEZ5zzV0MwE4UAgZIbIFMUI=;
        b=m1bpR63Blk8zxZCrdZttQ59Mx5uxD1NwmPI/xq7tF7Mn6vVyt5CIOnobuBxU6XSFoE
         RlDEFwgrHWRvtngRdVhLeBbkUtmoY74gVhlWzPVsjXd2LuKLZn/XjTdsNZ6hKxFf8ich
         7QzMmUloCwMQbyi6hcmXzTanhV2Eeh5I/Rql1Hw+NZXcHgKFEtkub09Kcp9T9vr0dfx/
         SeyHjfdub2pzuxOWV+Kz9vpq3jmX6fBIMRWazSh5dTtb+9ka1bYQUiwm36GKL27Vu/ya
         9MoJQJludLJCOLOpV5gaGu92GjEGreSGjP46zLaOdhpf7qt0zZIaGQp3LY4gTF6QxD2N
         5CTw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [RFC PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()
Message-ID: <23166674-838e-b626-4522-6e0709da34b9@gmail.com>
Date: Tue, 16 Oct 2018 08:04:00 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7b01fc0f19cfa010536d7eb53e4d0cda1e6b801f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 15 Oct 2018 23:46:52 +0900
Subject: RFC [PATCH] count_lim_sig: Add pair of smp_wmb() and smp_rmb()

This message-passing pattern requires smp_wmb()--smp_rmb() pairing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm not sure this addition of memory barriers is actually required,
but it does look like so.

And I'm aware that you have avoided using weaker memory barriers in
CodeSamples.

Thoughts?

        Thanks, Akira
--
 CodeSamples/arch-arm/arch-arm.h     |  2 ++
 CodeSamples/arch-arm64/arch-arm64.h |  2 ++
 CodeSamples/arch-ppc64/arch-ppc64.h |  2 ++
 CodeSamples/arch-x86/arch-x86.h     |  2 ++
 CodeSamples/count/count_lim_sig.c   | 21 +++++++++++++--------
 5 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/CodeSamples/arch-arm/arch-arm.h b/CodeSamples/arch-arm/arch-arm.h
index 065c6f1..6f0707b 100644
--- a/CodeSamples/arch-arm/arch-arm.h
+++ b/CodeSamples/arch-arm/arch-arm.h
@@ -41,6 +41,8 @@
 /* __sync_synchronize() is broken before gcc 4.4.1 on many ARM systems. */
 #define smp_mb()  __asm__ __volatile__("dmb" : : : "memory")
 
+#define smp_rmb() __asm__ __volatile__("dmb ish" : : : "memory")
+#define smp_wmb() __asm__ __volatile__("dmb ishst" : : : "memory")
 
 #include <stdlib.h>
 #include <sys/time.h>
diff --git a/CodeSamples/arch-arm64/arch-arm64.h b/CodeSamples/arch-arm64/arch-arm64.h
index 354f1f2..a6ccf33 100644
--- a/CodeSamples/arch-arm64/arch-arm64.h
+++ b/CodeSamples/arch-arm64/arch-arm64.h
@@ -41,6 +41,8 @@
 /* __sync_synchronize() is broken before gcc 4.4.1 on many ARM systems. */
 #define smp_mb()  __asm__ __volatile__("dmb ish" : : : "memory")
 
+#define smp_rmb() __asm__ __volatile__("dmb ishld" : : : "memory")
+#define smp_wmb() __asm__ __volatile__("dmb ishst" : : : "memory")
 
 #include <stdlib.h>
 #include <time.h>
diff --git a/CodeSamples/arch-ppc64/arch-ppc64.h b/CodeSamples/arch-ppc64/arch-ppc64.h
index 7b0b025..2d6a2b5 100644
--- a/CodeSamples/arch-ppc64/arch-ppc64.h
+++ b/CodeSamples/arch-ppc64/arch-ppc64.h
@@ -42,6 +42,8 @@
 
 #define smp_mb()  __asm__ __volatile__("sync" : : : "memory")
 
+#define smp_rmb() __asm__ __volatile__("lwsync" : : : "memory")
+#define smp_wmb() __asm__ __volatile__("lwsync" : : : "memory")
 
 /*
  * Generate 64-bit timestamp.
diff --git a/CodeSamples/arch-x86/arch-x86.h b/CodeSamples/arch-x86/arch-x86.h
index 9ea97ca..2765bfc 100644
--- a/CodeSamples/arch-x86/arch-x86.h
+++ b/CodeSamples/arch-x86/arch-x86.h
@@ -52,6 +52,8 @@ __asm__ __volatile__(LOCK_PREFIX "orl %0,%1" \
 __asm__ __volatile__("mfence" : : : "memory")
 /* __asm__ __volatile__("lock; addl $0,0(%%esp)" : : : "memory") */
 
+#define smp_rmb() barrier()
+#define smp_wmb() barrier()
 
 /*
  * Generate 64-bit timestamp.
diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index c316426..26a2a76 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -89,6 +89,7 @@ static void flush_local_count(void)			//\lnlbl{flush:b}
 		*counterp[t] = 0;
 		globalreserve -= *countermaxp[t];
 		*countermaxp[t] = 0;			//\lnlbl{flush:thiev:e}
+		smp_wmb();				//\lnlbl{flush:wmb}
 		WRITE_ONCE(*theftp[t], THEFT_IDLE);	//\lnlbl{flush:IDLE}
 	}						//\lnlbl{flush:loop2:e}
 }							//\lnlbl{flush:e}
@@ -115,10 +116,12 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 
 	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
 	barrier();					//\lnlbl{barrier:1}
-	if (READ_ONCE(theft) <= THEFT_REQ &&		//\lnlbl{check:b}
-	    countermax - counter >= delta) {		//\lnlbl{check:e}
-		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
-		fastpath = 1;				//\lnlbl{fasttaken}
+	if (READ_ONCE(theft) <= THEFT_REQ) {		//\lnlbl{check:b}
+		smp_rmb();				//\lnlbl{rmb}
+		if (countermax - counter >= delta) {	//\lnlbl{check:e}
+			WRITE_ONCE(counter, counter + delta);//\lnlbl{add:f}
+			fastpath = 1;			//\lnlbl{fasttaken}
+		}
 	}
 	barrier();					//\lnlbl{barrier:2}
 	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
@@ -154,10 +157,12 @@ int sub_count(unsigned long delta)
 
 	WRITE_ONCE(counting, 1);
 	barrier();
-	if (READ_ONCE(theft) <= THEFT_REQ &&
-	    counter >= delta) {
-		WRITE_ONCE(counter, counter - delta);
-		fastpath = 1;
+	if (READ_ONCE(theft) <= THEFT_REQ) {
+		smp_rmb();
+		if (counter >= delta) {
+			WRITE_ONCE(counter, counter - delta);
+			fastpath = 1;
+		}
 	}
 	barrier();
 	WRITE_ONCE(counting, 0);
-- 
2.7.4

