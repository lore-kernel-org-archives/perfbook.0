Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OOHeX9vsF39mfEJEEqWALdBASp/lzC/O3xdKqufjhxY=;
        b=pom+EBXWB50x70LRVkPvz0LzlCsKhHusm13CxC5ffY3jGfFZaEmLM3mPw/tyHS5m7v
         xPuJorkaOnkLy76amQNfjvPnqri+sNrx/0MVrTyeRIoZe6sG9izWVxFEtt6xW5kNUEwd
         pRfwhFf49x0bS48WeBBGSC1HT0SW95wF2xH4wZWtCi4RyypdcC1EKBS5qq2NUC9drzdz
         A1ZSSGSeDVHSH0txSEz6ALS3gdVdORUPCSFC9tFx9ddHt50jkAJnLSaj10153NB54OJ9
         +Z5IHDDIzJ1A8pVFe/KX8AWjWET22/6WjIg3i5DafREXpZ5jApvufRfqICT5jgBgR6do
         maww==
Subject: [PATCH 3/6] datastruct/hash: Fix unnecessary folding in code snippet
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <42d62e6e-cf3a-c0f0-8cc4-64e14c23516c@gmail.com>
Date: Mon, 14 Jan 2019 08:33:40 +0900
MIME-Version: 1.0
In-Reply-To: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c6c7f21935282a955a421ca63787b6e8fc70a0dd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 13 Jan 2019 19:59:13 +0900
Subject: [PATCH 3/6] datastruct/hash: Fix unnecessary folding in code snippet

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/hash_resize.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
index 68fdc12..6270bc3 100644
--- a/CodeSamples/datastruct/hash/hash_resize.c
+++ b/CodeSamples/datastruct/hash/hash_resize.c
@@ -56,8 +56,7 @@ struct ht {						//\lnlbl{ht:b}
 	long ht_resize_cur;				//\lnlbl{ht:resize_cur}
 	struct ht *ht_new;				//\lnlbl{ht:new}
 	int ht_idx;					//\lnlbl{ht:idx}
-	int (*ht_cmp)(struct ht_elem *htep,		//\lnlbl{ht:cmp}
-	              void *key);
+	int (*ht_cmp)(struct ht_elem *htep, void *key);	//\lnlbl{ht:cmp}
 	unsigned long (*ht_gethash)(void *key);
 	void *(*ht_getkey)(struct ht_elem *htep);	//\lnlbl{ht:getkey}
 	struct ht_bucket ht_bkt[0];			//\lnlbl{ht:bkt}
-- 
2.7.4


