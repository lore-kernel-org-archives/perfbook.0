Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Y0OkEYh0V0jsskPwFVGZhh+HMlpIt1GDaf/l8aR74VY=;
 b=neggxj5e3yAo8u1KC6YVekbJCkBYIup2ntqewvpcv21ndxWCp8ILmeUuP8kfM5YYXq
 YYr50Gb6s24TjLDl5rdlwmSl/sfKRt7S5dNnt28s4Tlm+iuJ6Z1OHsYK0cCFlHJqia33
 TktzcOkQ750qR8zwhZPpdYVA7gvbMouUizHMVBnXXIZB/Hme5zrV7RSyyjfc6Vms8VeY
 oZAMyKCPdZ35tCfkZwqhV5UUFtN5TlRLr1xIGS2t+YrzZnWwKIiOcOxmmbucQXL3PCx3
 UTDaYW2FFD67o/Jc0nil9bqJlNHqsYZWLxMkeVr3+aNsJqCEp3c3FGTThRKVfOx8MNmW
 Q03w==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 4/4] defer/rcu: Fix a section reference typo
Date: Tue, 27 Dec 2016 04:43:14 +0900
Message-Id: <20161226194314.7868-4-sj38.park@gmail.com>
In-Reply-To: <20161226194314.7868-1-sj38.park@gmail.com>
References: <20161226194314.7868-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcu.tex b/defer/rcu.tex
index 121f58d9e609..2ce46e2c0dc3 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -8,7 +8,7 @@ All of the mechanisms discussed in the preceding sections
 used one of a number of approaches to defer specific actions
 until they may be carried out safely.
 The reference counters discussed in
-Section~ref{sec:defer:Reference Counting}
+Section~\ref{sec:defer:Reference Counting}
 use explicit counters to defer actions that could disturb readers,
 which results in read-side contention and thus poor scalability.
 The hazard pointers covered by
-- 
2.10.0

