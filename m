Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ssBVv8PvNa+d89KeAUvPIdyNxhekScjntrnS1G6QYBo=;
        b=gM5ccDHM7EC1JUQFeHilcdPif+dKSIHdYwsrdU/lRV2K3nHzySImq4tQYVjAd/M1Fu
         IGxF+d2lYWCyx+D7J6m08TI6R/mhGJbZOjySb8jve7n/dlcn5CmpZscfCn9gZR8wDC+P
         x1GV+fPBFNagYuUNS6D7lQcibBp1A5VXWChWrhHOrPf80hAVrWg7mkrhsrU1IJeWfq7G
         S1pQ20A1Txqmpa5ROyiMvBL5UX3SFn9z5filJfDqh3f4dqEcNlof867JdOK4jCYbzOqm
         c9HjcninhlsMh0NC7WraHcuj/9a6FSCmmcuJE35HcDLlocubM61fZ4WDE+uqlqEvBVO3
         P4Ug==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 5/7] toolsoftrade: Use '\co' consistently for volatile keyword
Date: Tue, 20 Nov 2018 09:00:55 +0900
Message-Id: <20181120000057.389-5-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In a paragraph, every volatile keyword is using '\co' but one case.
This commit use '\co' for the inconsistent case.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 96014b9..ad6661b 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1896,7 +1896,7 @@ Perhaps the most clear guidance is provided by this non-normative note:
 	aggressive optimization involving the object because the value
 	of the object might be changed by means undetectable by an
 	implementation.
-	Furthermore, for some implementations, volatile might indicate
+	Furthermore, for some implementations, \co{volatile} might indicate
 	that special hardware instructions are required to access
 	the object.
 	See 6.8.1 for detailed semantics.
-- 
2.10.0

