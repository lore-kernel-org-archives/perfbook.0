Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=SA8qgKHKZHmuWra1FPmujKKbX5fdPmUn8WdzGHawgQk=;
 b=b9EIyC1KypTm/zr473Qm4rPhnKWCq6yck5Cr8dLO3QxffmTX+4dskvy2YytWbLGa4k
 J0WF44JVCFNPgd5knR+kLazlwd2deKex3Vo5nDjKC6wFmz8vcq/HTCX9YYBGuCwDUQzU
 +6YVkUjGoptP8gRhlSjqBdKWekMV4q6IZqQSmS+gzFse0+OhjypXUqe80duBmm3eUW9T
 OGDjF1BP0ddd3Enu0TnZdrEOiI0Xm4Gt/nfIGcmS3kmGLK6/w97xtmRO+w1SgnWKPsQR
 ZC+3ZmPq+FBwSRAph0Qscx7SbCXJ1DKIOz1VOH/wXYsxH3kzJ7U5tEfh9n+E9RGOecWh
 fhOQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/3] memorder: Fix wrong variable citation
Date: Tue, 12 Sep 2017 09:56:15 +0900
Message-Id: <20170912005617.19975-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 183c525..2da7b98 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -704,8 +704,8 @@ as Y0, the store to \co{x1} on line~19 as Y1, and the load from
 Applying the if-then rule step by step, we know that the store to
 \co{x1} on line~19 happens after the load from \co{x1} on line~11 if
 \co{P0()}'s local variable \co{r2} is set to the value zero.
-The if-then rule would then state that the load from \co{x1} on
-line~21 happens after the store to \co{x1} on line~9.
+The if-then rule would then state that the load from \co{x0} on
+line~21 happens after the store to \co{x0} on line~9.
 In other words,
 \co{P1()}'s local variable \co{r2} is guaranteed
 to end up with the value two \emph{only if}
-- 
2.10.0

