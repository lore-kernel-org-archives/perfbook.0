Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qvkr0btkPUjH77YYQaqxnFx+DmXnD/pDOt2oRMvX6n0=;
        b=X5IOCR6SBtw4SS7Xk1s3DenjE5A7jE8xBmXJBBLSaOFz8NTNFi0B+H6eWKG1Id+Kn/
         ndj2svQx6+ouhnArtiQ53dOfSRxKjAWnI7eaFFh82yaX8gTLy2iPkpnhDAI0ZBwsl3GQ
         5y8nt+fUx1qs+2sOmIjKZwZn5v7OaeuWYn0vreTlYWz0xKJKIr6Cd0RtntP46YT1/UiC
         GbTJpUX2PIcfZ2X0O9A1C4dUvz8wE4uGUsjJLx5rCcMKv0SRy9Es67NtcH/uSpRXStq/
         EqEfX5+DBgLXlC/jvBlYtoEJ5+R4PsZLqNfU9nEb6iwxCzgwiHZLTVe3sqN8qxjL5n0t
         eBpg==
Subject: [PATCH 5/5] count: Fix uses of READ/WRITE_ONCE() in count_lim
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2e0b71c0-051a-dcf2-be99-e92cfcfe2031@gmail.com>
Date: Mon, 8 Oct 2018 10:49:11 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 83f496142e594e69f89b154bebcfd8d278ac7831 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 10:26:24 +0900
Subject: [PATCH 5/5] count: Fix uses of READ/WRITE_ONCE() in count_lim

Add a few READ_ONCE()/WRITE_ONCE()s to prevent load/store tearing
of per-thread variables "counter" and "countermax".

NOTE: Updates of those per-thread variables in utility functions
don't need WRITE_ONCE()s because they are protected by glbcnt_mutex
and can't be seen by read_count().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/count/count_lim.c b/CodeSamples/count/count_lim.c
index 69ced9a..c207beb 100644
--- a/CodeSamples/count/count_lim.c
+++ b/CodeSamples/count/count_lim.c
@@ -37,7 +37,7 @@ DEFINE_SPINLOCK(gblcnt_mutex);
 static __inline__ int add_count(unsigned long delta)	//\lnlbl{add:b}
 {
 	if (countermax - counter >= delta) {		//\lnlbl{add:checklocal}
-		counter += delta);			//\lnlbl{add:add}
+		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:add}
 		return 1;				//\lnlbl{add:return:ls}
 	}
 	spin_lock(&gblcnt_mutex);			//\lnlbl{add:acquire}
@@ -56,7 +56,7 @@ static __inline__ int add_count(unsigned long delta)	//\lnlbl{add:b}
 static __inline__ int sub_count(unsigned long delta)	//\lnlbl{sub:b}
 {
 	if (counter >= delta) {				//\lnlbl{sub:checklocal}
-		counter -= delta;			//\lnlbl{sub:sub}
+		WRITE_ONCE(counter, counter - delta);	//\lnlbl{sub:sub}
 		return 1;				//\lnlbl{sub:return:ls}
 	}
 	spin_lock(&gblcnt_mutex);			//\lnlbl{sub:acquire}
@@ -80,7 +80,7 @@ static __inline__ unsigned long read_count(void)	//\lnlbl{read:b}
 	sum = globalcount;				//\lnlbl{read:initsum}
 	for_each_thread(t)				//\lnlbl{read:loop:b}
 		if (counterp[t] != NULL)
-			sum += *counterp[t];		//\lnlbl{read:loop:e}
+			sum += READ_ONCE(*counterp[t]);	//\lnlbl{read:loop:e}
 	spin_unlock(&gblcnt_mutex);			//\lnlbl{read:release}
 	return sum;					//\lnlbl{read:return}
 }							//\lnlbl{read:e}
-- 
2.7.4


