Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mDyUpXjqsSrFhLzCw7g7l6oVjOBVj56UeDG38LUai6k=;
 b=MHoV/qbXilWV/MrApxzMV6Eyay4wG26spvZbWWwpjRcrkZn0r7nGYlp8dTApc5M/e5
 AY4I7vdiulOAq5g7mXqNMAHg0qko/uODgBprwCAt9TUiPLFmfuKWtTp/xEP9Nyf3OZWZ
 ohfuGBh2J62btid0TN7MjtuHNhqzNfNfSg6roMxLpX18Gb+WSFfVzKMQNWaz1PEnOBUX
 3KIcxw/NbfDBQym9/b0DxsfJV4PaRwWieCr+9HIp0EI/FnOzFsaEYENnRngYEl4CHLLV
 bxaHo95fwRgSyhi6kgqQWxheEuKuivNk0MlL9kYCICksKXbsZdEZqvoent5QZHSDcIeF
 X7Xw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/3] rcutorture: Remove redundant n_read_pt initialization
Date: Sun,  7 Aug 2016 12:41:26 +0900
Message-Id: <1470541287-12588-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
References: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Per-thread read count variable, n_reads_pt is redundantly initalized
inside rperftest() and uperftest() though perftestinit() do initialize
both of n_reads_pt and n_updates_pt before.  This commit removes the
redundancy.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 CodeSamples/defer/rcutorture.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/CodeSamples/defer/rcutorture.h b/CodeSamples/defer/rcutorture.h
index 2feb4ad..6ea0c09 100644
--- a/CodeSamples/defer/rcutorture.h
+++ b/CodeSamples/defer/rcutorture.h
@@ -213,7 +213,6 @@ void rperftest(int nreaders, int cpustride)
 	long arg;

 	perftestinit();
-	init_per_thread(n_reads_pt, 0LL);
 	for (i = 0; i < nreaders; i++) {
 		arg = (long)(i * cpustride);
 		create_thread(rcu_read_perf_test, (void *)arg);
@@ -227,7 +226,6 @@ void uperftest(int nupdaters, int cpustride)
 	long arg;

 	perftestinit();
-	init_per_thread(n_reads_pt, 0LL);
 	for (i = 0; i < nupdaters; i++) {
 		arg = (long)(i * cpustride);
 		create_thread(rcu_update_perf_test, (void *)arg);
-- 
1.9.1

