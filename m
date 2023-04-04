Return-Path: <SRS0=naJo=73=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680585585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bCJ+szq+cqugICa/U3EWs+idTLJuNJGZ/PlKZndRig=;
        b=AwXKH83yhBVz5rhCyK48CdsvJ9pYIlLjDFK4GheIwwJHqsqgOnrTdTLxSwEUqwz2zd
         wtjwhj92C8MWZWKLLEh7RKW8gA1pulcACZKEt6C7htphG4WPFiLPVwWgUaFw8ydkXyP1
         vBrDs+Wg1Q12onTnfS88ZSqNp0fisYziM9S4ScF8opF0Lmu/huNetWjTQ5IuPgVXAk1e
         mnF+ERCMx1wLzymi5MyZMG/wY8+o4eg6hA/hzein1+Pt8obESh0IO7wvnuQdaiboLgGr
         hnHUOxWuUdiT+ttwde5a7H2msCXH/gxB3YDWFQBKxqrieu9i/4S/v7cbpKl6zMO7B+Fi
         uhww==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/count: change full memory barrier to partial one
Date: Tue,  4 Apr 2023 01:19:21 -0400
Message-Id: <20230404051921.1305092-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The original memory barriers in count_stat_eventual.c ensure
writing to global_count happens before writing to stopflag and
reading from stopflag happens before later reading from global_count.

Thus, smp_load_acquire and smp_store_release will suffice.

In count_lim_sig.c, there is only one ordering required, that is
writing to counter happens before setting theft to THEFT_READY in
add_count/sub_count's fast path. Therefore, partial memory barrier
will suffice.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_lim_sig.c       | 10 +++-------
 CodeSamples/count/count_stat_eventual.c |  6 ++----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/CodeSamples/count/count_lim_sig.c b/CodeSamples/count/count_lim_sig.c
index 59da8077..c2f61197 100644
--- a/CodeSamples/count/count_lim_sig.c
+++ b/CodeSamples/count/count_lim_sig.c
@@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	//\lnlbl{flush_sig:b}
 {
 	if (READ_ONCE(theft) != THEFT_REQ)	//\lnlbl{flush_sig:check:REQ}
 		return;				//\lnlbl{flush_sig:return:n}
-	smp_mb();				//\lnlbl{flush_sig:mb:1}
 	WRITE_ONCE(theft, THEFT_ACK);		//\lnlbl{flush_sig:set:ACK}
 	if (!counting) {			//\lnlbl{flush_sig:check:fast}
-		WRITE_ONCE(theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
+		smp_store_release(&theft, THEFT_READY);	//\lnlbl{flush_sig:set:READY}
 	}
-	smp_mb();
 }						//\lnlbl{flush_sig:e}
 
 static void flush_local_count(void)			//\lnlbl{flush:b}
@@ -125,8 +123,7 @@ int add_count(unsigned long delta)			//\lnlbl{b}
 	WRITE_ONCE(counting, 0);			//\lnlbl{clearcnt}
 	barrier();					//\lnlbl{barrier:3}
 	if (READ_ONCE(theft) == THEFT_ACK) {		//\lnlbl{check:ACK}
-		smp_mb();				//\lnlbl{mb}
-		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
+		smp_store_release(&theft, THEFT_READY);		//\lnlbl{READY}
 	}
 	if (fastpath)
 		return 1;				//\lnlbl{return:fs}
@@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
 	WRITE_ONCE(counting, 0);
 	barrier();
 	if (READ_ONCE(theft) == THEFT_ACK) {
-		smp_mb();
-		WRITE_ONCE(theft, THEFT_READY);
+		smp_store_release(&theft, THEFT_READY);
 	}
 	if (fastpath)
 		return 1;
diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
index 967644de..7157ee0e 100644
--- a/CodeSamples/count/count_stat_eventual.c
+++ b/CodeSamples/count/count_stat_eventual.c
@@ -51,8 +51,7 @@ void *eventual(void *arg)				//\lnlbl{eventual:b}
 		WRITE_ONCE(global_count, sum);
 		poll(NULL, 0, 1);
 		if (READ_ONCE(stopflag)) {
-			smp_mb();
-			WRITE_ONCE(stopflag, stopflag + 1);
+			smp_store_release(&stopflag, stopflag + 1);
 		}
 	}
 	return NULL;
@@ -73,9 +72,8 @@ void count_init(void)					//\lnlbl{init:b}
 void count_cleanup(void)				//\lnlbl{cleanup:b}
 {
 	WRITE_ONCE(stopflag, 1);
-	while (READ_ONCE(stopflag) < 3)
+	while (smp_load_acquire(&stopflag) < 3)
 		poll(NULL, 0, 1);
-	smp_mb();
 }							//\lnlbl{cleanup:e}
 //\end{snippet}
 
-- 
2.34.1

