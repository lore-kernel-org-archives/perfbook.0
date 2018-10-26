Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zbiKwuKlmWSnkRKWRyJB6SEv1UxZRXlcyVw+dRkzPwQ=;
        b=AJiS6P93DZZ/S3JZptYSLdTSOF/DdwQHaf67LccFGLWw5MESg64s65WytXvnoi6CVR
         C3eghJtceZRkkojhVcjJJLRugg7tqy6I0QRicaEcxTfsbwFCLXtzy969JiB5RhSy6NsM
         rsZRsfrShOorvnYmWz2JNJRIfifTTuJNlSddJ8uskDBPv46zUjtJY+/9gTOTyEwAa8N5
         fCFQq7DMHELKZqLmXtfn3VpHbLseQj07fpskUiz/OWRjEBX/NBxIaBuvSFHa7CRCvGj3
         7raoHteRJ8ggEkah/eCSonNslm6d++xcEiArueHdkOC90FUP0irGDNbd3AantFC371K8
         ERyw==
Subject: [PATCH 7/7] count: Fix indent in count_lim_atomic.c
References: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6556bde0-fb58-12fc-d160-5a793d8b49bb@gmail.com>
Date: Sat, 27 Oct 2018 00:30:22 +0900
MIME-Version: 1.0
In-Reply-To: <f6c72461-722d-71d2-b8a6-a2add234e323@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 453bc63fd38da42f52eb88b4fed0a38b0f431cf9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 20 Oct 2018 07:50:26 +0900
Subject: [PATCH 7/7] count: Fix indent in count_lim_atomic.c

Commit 51e9218ac25e ("count: Employ new scheme for snippet of
count_lim_atomic") changed indent width by accident.  Fix it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/count/count_lim_atomic.c b/CodeSamples/count/count_lim_atomic.c
index 6190a9f..02f4e6d 100644
--- a/CodeSamples/count/count_lim_atomic.c
+++ b/CodeSamples/count/count_lim_atomic.c
@@ -137,7 +137,7 @@ int sub_count(unsigned long delta)			//\lnlbl{sub:b}
 	do {						//\lnlbl{sub:fast:b}
 		split_counterandmax(&counterandmax, &old, &c, &cm);
 		if (delta > c)
-		  goto slowpath;
+			goto slowpath;
 		new = merge_counterandmax(c - delta, cm);
 	} while (atomic_cmpxchg(&counterandmax,
 	                        old, new) != old);
-- 
2.7.4


