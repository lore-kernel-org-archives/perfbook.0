Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+iVjUsWFaxis3G3T4Hk9MgBua2oPx7pmcDL7PSQSLZA=;
        b=oMscPT5CIBV603radd0fRghNhijXwO7qBTfz8JTqmkD0o1DVmlA3FE6U4Ixnwo8MBh
         V3db8vXUc5f9HmA2xMOhGN7FRu10x5EiYInj++Z75s+u6eAx8jVwtDbh3xbd8KH7kENo
         KRiERxEz4UsSPuXsoKI7hW+ledS/00KYoFfvjuIfzntj1WKdbbYQtTRQQbLuZd9iJY6q
         CAmByTXlCMfWAsvvC1KPRgXh6pejV7ZfX3RBciUQvKscqe5oyCW5Z66MQnhA8RKzS1Zq
         ppkvQAu108Ta+W0bqgGH6bIBZd2XK1Xl6NOoIWcDSsjh4ab/lEXVWmIvu7n9RZmBhySP
         ZfcA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 4/4] howto: Fix a typo (License -> license)
Date: Sun,  4 Apr 2021 13:10:44 +0200
Message-Id: <20210404111044.27774-5-sj38.park@gmail.com>
In-Reply-To: <20210404111044.27774-1-sj38.park@gmail.com>
References: <20210404111044.27774-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes a trivial typo.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index 9b3f8e91..c3360e84 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -511,7 +511,7 @@ a very specific meaning, namely that you are certifying that:
 	the open source license indicated in the file; or
 \item	The contribution is based upon previous work
 	that, to the best of my knowledge, is covered
-	under an appropriate open source License and I
+	under an appropriate open source license and I
 	have the right under that license to submit that
 	work with modifications, whether created in whole
 	or in part by me, under the same open source
-- 
2.17.1

