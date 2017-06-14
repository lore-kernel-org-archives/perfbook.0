Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eq0I9OCxlIHMaIIPGG1QO6jh6qFcIUWLUCsjhvTKSAA=;
 b=IxEzryRcuTOuAqNyJFAOgNpWVW6nuKaA7GUsznTs1WuvcqOiblouQi5XGg95meZN5M
 Oi/NJ0CBsoF3Mgqsb+zh9AZVX1VBZLbzO3wyDAGl2BulL/aw/qkKEacCfHOZ/wbtIMH8
 nTuUt1Y4JAr61TvDVP9G3bPrs8vo3bBjRVkRWVZZSdkr+yhCtugmwoW/df6j3CvZpusH
 4sQeXEzXxzk+D9bmjKH0yQ2uIlShNuE59yPd6fiTWerdIQAF7ERhvpk19PPlm4NOUOAH
 tPBPOHz+jskQaDmeisXQfPV59kAl+SpH9+xZvmqDYP0ct+paBIjWx5smR5K7QKlqF8+j
 c8LQ==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 3/5] route_rcu: Remove redundant assignment statement to
 rep->re_freed
Date: Wed, 14 Jun 2017 23:45:02 +0800
Message-Id: <1497455104-14102-4-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
References: <1497455104-14102-1-git-send-email-junchangwang@gmail.com>
To: perfbook@vger.kernel.org, paulmck@linux.vnet.ibm.com
Cc: Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 CodeSamples/defer/route_rcu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/CodeSamples/defer/route_rcu.c b/CodeSamples/defer/route_rcu.c
index 7716fe8..1fd69ea 100644
--- a/CodeSamples/defer/route_rcu.c
+++ b/CodeSamples/defer/route_rcu.c
@@ -93,7 +93,6 @@ static void route_cb(struct rcu_head *rhp)
 {
 	struct route_entry *rep = container_of(rhp, struct route_entry, rh);

-	WRITE_ONCE(rep->re_freed, 1);
 	re_free(rep);
 }

-- 
2.7.4

