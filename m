Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tfGdWJZVBqjf+bxA0FTGdvJFFtniBzNT1ij1HdTTr5Y=;
 b=xG7sWQKgdywpW9nC1PWLYmsGkI8lCvw5Nk0/HS1x2ylwGvLY0P5A+95GLkoTaTQDin
 UoKR9H2iPV+OudyzlKPl2JQ+enJdSHYVNa5Djmzqn8w1ko2O3E3xdhoWT+H3iJ3+WpJB
 XGw5t36K+uwEFcNu5nkh0kMrPGWfSGd5Zga7uWtv5StZ3WEruPPCs4xm1pOLviUSGahe
 gluPhNodeEiMtcOtSzkztAzD2GprRejLnwmPEHgixHAIdBOa2D1h142hPja/7OBDeJxQ
 sJyeroeWpxiRhpr2L5JmnyQMTcdcIBqWjHMdfQBFay4CbSNqUTGZpYbqMlt4j9YGEqtv
 3cmQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/4] defer/refcnt: Add missing dot
Date: Sat, 16 Jul 2016 16:58:47 +0900
Message-Id: <1468655930-9894-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/refcnt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index b48ca48..ab0b9be 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -130,7 +130,7 @@ at least the early
 	used a mechanical reference-counting technique, where each
 	worker had a padlock.}
 Reference counting is thus an excellent candidate for a concurrent
-implementation of Pre-BSD routing
+implementation of Pre-BSD routing.

 To that end,
 Figure~\ref{fig:defer:Reference-Counted Pre-BSD Routing Table Lookup}
-- 
1.9.1

