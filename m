Return-Path: <SRS0=zLCu=74=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680713817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIu79h6/lcecrt88aiuht1zKMziSERceHNgiI9yKNNc=;
        b=F3qJA2MupiOnDth6PT86gTtSpEiYMcuzKWNZu5Z2UkdjOyCyaAhQcVjZdGCAteOYaH
         qJsjw6XoN4yv09xrUNvZOccLsvmKmxn3p84zO022QKKaZWqGY8oe4QzqygkdfwQEVsfZ
         j1zfJcAivEELEggYhwbnbY/pIdV8B8m5qcVzJQYgjq6aI6nbsm9TN7RLMgs1xx7Fucok
         p6/hcbIUoa2RITM5Q2iLnZe4Bk/GajkbYvpsjblkRDvTRNiAxzdP2OUmuFM/a2Z3ojIl
         dSS6B58SuvKSBujtXQQP0Vw9kJTeFt+12QSfChX4En7Bkd425eRDO9JEtUbvUPlt+AaK
         wiBA==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSamples/count: change full memory barrier to partial one
Date: Wed,  5 Apr 2023 12:56:41 -0400
Message-Id: <20230405165641.1326208-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, akiyks@gmail.com
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

The original memory barriers in count_stat_eventual.c ensure
writing to global_count happens before writing to stopflag and
reading from stopflag happens before later reading from global_count.

Thus, smp_load_acquire and smp_store_release will suffice.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_stat_eventual.c | 6 ++----
 count/count.tex                         | 6 +++---
 2 files changed, 5 insertions(+), 7 deletions(-)

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
 
diff --git a/count/count.tex b/count/count.tex
index 80ada104..8ab67e2e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1013,9 +1013,9 @@ between passes.
 
 The \co{count_cleanup()} function on
 \clnrefrange{cleanup:b}{cleanup:e} coordinates termination.
-The calls to \co{smp_mb()} here and in \co{eventual()} ensure
-that all updates to \co{global_count} are visible to code following
-the call to \co{count_cleanup()}.
+The call to \co{smp_load_acquire()} here and the call to \co{smp_store_release()}
+in \co{eventual()} ensure that all updates to \co{global_count} are visible
+to code following the call to \co{count_cleanup()}.
 
 This approach gives extremely fast counter read-out while still
 supporting linear counter-update scalability.
-- 
2.34.1

