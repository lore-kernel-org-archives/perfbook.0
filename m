Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=TGJ4IGjmRmF0X5VAUtPiI1BIuFWC2kpWwnFcVa1qMkc=;
 b=EvolZV4HPlqeuV8QoVzvQIEJCR80Qsr+R4SJvgj61t5pqocgAAlBfp/j4tMHiqc7Un
 BXqweuTwSlaEt3nxqIzerozPpn7Mz6IvnpEaYoMiLcVyk7WjxcjAeHJC6rKmYlbElS7J
 gDiYa/qgjTmPKnvvoRiLQ3MpoTiYtKvtwfDEolx/DRHe7rcDCHF9k6LtA5Jvlf3hWVpC
 AIehnJ2l/OyF2uBzqaVkEh/3aPGwAF+1R3A2n1G3E1r2d3kW6TjzSGijACngaWONQAPT
 TIshsIvNRyz8PTIav1txaVTImnarj5TvDJGG8hHgxbyfsrYn6LbO+dhMm+YPIGvNWmih
 FV2A==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/3] rcutorture: Protect fake workload from compiler
 optimization
Date: Sun,  7 Aug 2016 12:41:27 +0900
Message-Id: <1470541287-12588-4-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
References: <1470541287-12588-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Fake workload for read-side critical section of rcutorture stress test
is implemented as a loop of hundred meaningless iterations.  However,
the loop can be optimized out by compiler because there is nothing to
avoid such optimization.  This commit protect the fake workload by using
a compiler memory barrier, ACCESS_ONCE().

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 CodeSamples/defer/rcutorture.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/defer/rcutorture.h b/CodeSamples/defer/rcutorture.h
index 6ea0c09..c5bc87e 100644
--- a/CodeSamples/defer/rcutorture.h
+++ b/CodeSamples/defer/rcutorture.h
@@ -271,7 +271,7 @@ void *rcu_read_stress_test(void *arg)
 			n_mberror++;
 		rcu_read_lock_nest();
 		for (i = 0; i < 100; i++)
-			garbage++;
+			ACCESS_ONCE(garbage)++;
 		rcu_read_unlock_nest();
 		pc = p->pipe_count;
 		rcu_read_unlock();
-- 
1.9.1

