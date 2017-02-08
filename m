Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=NlT4oTgZwCQL+QP11PnkSK92NCPZsKwlKU+Tj1xoY1Y=;
 b=J3jMtqhD2EYblrGsBEDCcKuSWij6d5eW0Oh8mkcKk6GgRt7vvdKcGS9XhmBwEn+hie
 2fDby2HX1coZBaX7Hf4inFn/Evws4hJXlMHkJTwbItpwfMx9uyb4kheCW6aVNeYHgl3c
 r9r9Ps2ExrAruOPWWkieooZKsbhWEdFE3DLICU4z9rZJs8yzISjA5sp7NcDbJ3G5GaSI
 +QHSsLqrNKzQfZqeBdTtz1tbQBeN2GbcxalihchTSn9Fj8R/nl+hK6Yy72t2f0mGCzz0
 LvYv+iXlE3kh7zMpxRu/C2W9Tvfpp5pKTWH2H0kA00Fafh6cAsBZGANQhMSG/4d6acJ2
 eFmA==
Subject: [PATCH 1/5] bib/maze: Mark url of ETHZurich:FS2011maze as broken link
References: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d339acd-0725-39df-7026-96d2325bb0f6@gmail.com>
Date: Wed, 8 Feb 2017 23:56:12 +0900
MIME-Version: 1.0
In-Reply-To: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 615d636a4c71eadb424ea260a1385461e44dec7f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 4 Nov 2016 17:40:59 +0900
Subject: [PATCH 1/5] bib/maze: Mark url of ETHZurich:FS2011maze as broken link

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/maze.bib | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bib/maze.bib b/bib/maze.bib
index 98a3453..f19f829 100644
--- a/bib/maze.bib
+++ b/bib/maze.bib
@@ -33,7 +33,9 @@ gradient of chemo-attractants"
 ,month="March"
 ,year="2011"
 ,day="17"
-,note={\url{http://nativesystems.inf.ethz.ch/pub/Main/WebHomeLecturesParallelProgrammingExercises/pp2011hw04.pdf}}
+,note="URL:
+\nolinkurl{http://nativesystems.inf.ethz.ch/pub/Main/WebHomeLecturesParallelProgrammingExercises/pp2011hw04.pdf}
+[broken, November 2016]"
 }

 @unpublished{MIT:TRMag:MemristorMazes
-- 
2.7.4


