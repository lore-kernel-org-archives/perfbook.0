Return-Path: <SRS0=M9fC=RM=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4VJbi0onqS1fo+DhViuBc4TNRlSY2GLO8AnOGqjnniA=;
        b=UKORJrR/vr37XZm3JOoPW+vKlIeGKuL0V8O/BQfygegip/Yr3eC4SguF24PpCuThIk
         AqqwSyWKOUrTBDpp+T66v2kYz5iqh6aFu/JgoA3jLTdWGLgeO0Vvt8gchHyfv5T91Ml2
         /1ZP0VFiA7pnv6OhQXKt7o6JSIkLfeR24MpxgSldJaCORzjs112MK0qBfR5jNQRW3IsF
         +Q3QV9sohHvfC2ji4vUoX0Trm3KsUu39OUTNDPAVK4bRZh7A5NJZkb/qPdSuZPVQVhCR
         vbouoeBLx3UeTqAC6AGfMTHy3CXI/m0CqqTLasA6iq7eWkvXdTPm9jakwRVsc01DBSGB
         IOvQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] count: Adds a missed unbreakable space
Date: Mon, 27 Dec 2021 09:52:12 +0100
Message-Id: <20211227085213.9246-2-sj38.park@gmail.com>
In-Reply-To: <20211227085213.9246-1-sj38.park@gmail.com>
References: <20211227085213.9246-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds a missed unbreakable space in count chapter.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index a9a36b27..7d7701ff 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1157,7 +1157,7 @@ on a parallel machine.
 
 	To see this, suppose that thread~0 adds the value three to its
 	counter, thread~1 adds the value five to its counter, and
-	threads~2 and 3 sum the counters.
+	threads~2 and~3 sum the counters.
 	If the system is ``weakly ordered'' or if the compiler
 	uses aggressive optimizations, thread~2 might find the
 	sum to be three and thread~3 might find the sum to be five.
-- 
2.17.1

