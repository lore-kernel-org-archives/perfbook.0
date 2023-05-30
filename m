Return-Path: <SRS0=hS86=BT=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685458293; x=1688050293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G0/lZ8nxkWaPWjFArqHU1dPlnbP0JhIt7I6GjA8QzgE=;
        b=BUJJRPDHQ/N+pz1UcHpVwi8qSAJ6gSqpu+K+N/KzfarEUwHBPr1szXqXF8aPl5D4K/
         Fg8tbAojXeYwamqxLSYbmFoZRhGO0omZwtAjo/iF7/jRyAxBTQ9S1MJW29J/+rsmsiLm
         WUU7IHx/ZBpmFh8Ojn41ko04rwoawIEJsE8wInsw7Ekn3QlTQP1iJG53oWXVgt/UsY9N
         ozFGe6LxQxVyt2FruCo4CQWvzQFav1QpJ8P1jrvlWf9hMPkf1z8W0DJJGFxSw4yBgKvV
         qiY0eiNc6Xk+qW2nFKFIixdQJn+0KUdJQYnoWMFo+JkiT9LwU3dl8dnwn6cLlk+FC0EX
         wChA==
From: Alan Huang <mmpgouride@gmail.com>
Subject: [PATCH] CodeSample/count: Update the places where READ_ONCE is used
Date: Tue, 30 May 2023 14:51:27 +0000
Message-Id: <20230530145127.18738-1-mmpgouride@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Alan Huang <mmpgouride@gmail.com>
List-ID: <perfbook.vger.kernel.org>

There is no concurrent updates to 'total' by other threads, plain access
is enough. But there might be threads updating 'counter', READ_ONCE is
required.

Signed-off-by: Alan Huang <mmpgouride@gmail.com>
---
 CodeSamples/count/count_end_rcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/count/count_end_rcu.c b/CodeSamples/count/count_end_rcu.c
index 8fc70611..71bd5269 100644
--- a/CodeSamples/count/count_end_rcu.c
+++ b/CodeSamples/count/count_end_rcu.c
@@ -48,10 +48,10 @@ unsigned long read_count(void)			//\lnlbl{read:b}
 
 	rcu_read_lock();			//\lnlbl{read:rrl}
 	cap = rcu_dereference(countarrayp);	//\lnlbl{read:deref}
-	sum = READ_ONCE(cap->total);		//\lnlbl{read:init}
+	sum = cap->total;		//\lnlbl{read:init}
 	for_each_thread(t) {			//\lnlbl{read:add:b}
 		ctrp = READ_ONCE(cap->counterp[t]);
-		if (ctrp != NULL) sum += *ctrp;	//\lnlbl{read:add:e}
+		if (ctrp != NULL) sum += READ_ONCE(*ctrp);	//\lnlbl{read:add:e}
 	}
 	rcu_read_unlock();			//\lnlbl{read:rru}
 	return sum;				//\lnlbl{read:ret}
-- 
2.34.1

