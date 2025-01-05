Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB5EAC7
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075788; cv=none; b=oL2tadMcx2fD+J5cA71MSRk4he6ljudavDnlmwPxUd09sxeFjtuw8yHE0/vhea3ccvCMggvZHGS7GPvWXwjvKJI+dhxF9a0c5RJ7pIqQQ4ViLBRC+fq2auAsBOCwbuBqp/pMm+Lgb8Rir59gKFhcXyAk6dBSxhJ796Ll/zcYOrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075788; c=relaxed/simple;
	bh=1shNZCrF6cNPBGF2OdmmtRcX96Cn2/0f5LDJOPTcJbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtBCXNeCtJt0twS4KWsEbpEbd5SwZ4r+1fPE4C9IGsfqJEJATNc6et/1RjAyITvXjulTdckLHRVKESL0UyStlwcVCQAg7+TBlbf/g1fhppI4qeymolO8ClF13sKfJarLawjh23q6QBZuCI5GC/+IeSrq9wkxSWKfEifCUX2cgkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOux491N; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOux491N"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-219f8263ae0so145299855ad.0
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075786; x=1736680586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IRCIFmsEjUx9isFqX//NeJthy7FOtWsPSs2Sk32u4f0=;
        b=mOux491NSFI7u7X8rKEj0hRM/vT4inPokDRsIO3XPnPaksHmA0QrPSy1PNXU/eQ3rf
         onazCrOFSEdcZCNpqHLWJoyosTBr0K6sVmlw/x0Mz6gkTKn4OsJOFABaDitytgW5paLa
         WZXWIphcB6M+b0OJ/lBV+twVMkQ6q8kYsbixYpZKqE16NxluEtbVnvDYfkx55rOlt+mO
         PxrXuXmMtACEn2gkjAHY3EAJdoPWAhi60T4tm80Gj9PAzOOHa/ToV/PhRuDco6Jz2m4E
         72AIEHhbHWvvTIK3RMkpgvv/w960d1ozJQsInDymzrq2egvSujDittOTgc4XeyfCgcrw
         +Rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075786; x=1736680586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IRCIFmsEjUx9isFqX//NeJthy7FOtWsPSs2Sk32u4f0=;
        b=Jqp1BpM+lXLjmkuNoByKTe1ySyY9Dk1HxXDRC6vYe7cjPP9u3JycIVXuzfsJ0oyr/g
         FYXwMknC079J0TeoVMd1HjN33vf5AkmFIwQKt6eafYyHGXNGJiVrU+dfjPka5na5/atT
         Uz4LUEsI8WrXtz6amZtcVKon6tdj257itHfKXdhsDVVNYf4bvLqeuu1scTLubxVm8ouU
         v+eXS4sqBz8ydcX7doMqKzm+3dI14zuOG6InZlX9iZS8BfKM+WsjljTTkaJnBKOLjmm7
         cGbwetGod3cskAY55Qtjso3lBNRJ9tJVfYlQMzBH34ZJMPdm5Uj7TkhehGieQhBLPbxM
         WsJA==
X-Gm-Message-State: AOJu0Yxx5utm4/6jS+iwhw3IAPytPgeoXv8yWCtmJTsugIijeNz+5Nq7
	gmlTBD3hKkPz4nIUZF7NYyOsrKPvcRQc2SCeep/nFEivvGjrsbaL
X-Gm-Gg: ASbGncsOeGlewjjIiRlRChb4xaex5ExorD12uWBfNSzylDpwsTOfCEMR1dMyj8Yk34E
	gVkjgZB7P+bcwW6ZqpaT2lhxWx4K492vnuAKYdtaH31MLiLezUpbSOngnMYLUjK7kIkWqzJUwBA
	aDbEC3ZNAoKyCfuvUtxo97x2/TZLOuefBnOOq7Hoy/RGmGGTfVEBmSzl2sk605zuHldWH9+2HtB
	PfgN/1/EvmAXLDf9duICBASZR5G+5QAo4LpNnSKLt7R8vcndIYZLCbcMMmbvUpvsM0I5B7UnHhF
	Xbr8WGvtmHj5B/qjOhc/fII=
X-Google-Smtp-Source: AGHT+IHdNcuHEsysLiB7P9PwJQ0/FtpVs+LHHsTK1PcAEa7J2eXHpVJyvZzQOrfGXNH9RU70DoVzlQ==
X-Received: by 2002:a17:902:d587:b0:216:5af7:eb2a with SMTP id d9443c01a7336-219e6ebb70bmr834873375ad.33.1736075786077;
        Sun, 05 Jan 2025 03:16:26 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc971751sm273281775ad.109.2025.01.05.03.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:16:25 -0800 (PST)
Message-ID: <9f5eb706-0ff0-4bb0-b1ca-fec996d4c771@gmail.com>
Date: Sun, 5 Jan 2025 20:16:25 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 6/6] CodeSamples/datastruct/Issaquah: Remove unused
 variables
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Recent versions of CLANG emit warnings like:

    - variable 'i' set but not used [-Wunused-but-set-variable]
    - warning: variable 'tries' set but not used [-Wunused-but-set-variable]

Silence them by removing those unnecessary variables and related code
incrementing them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/Issaquah/existence_test.c | 3 ---
 CodeSamples/datastruct/Issaquah/tree.c           | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/existence_test.c b/CodeSamples/datastruct/Issaquah/existence_test.c
index 5f31d09e..b55a7fd0 100644
--- a/CodeSamples/datastruct/Issaquah/existence_test.c
+++ b/CodeSamples/datastruct/Issaquah/existence_test.c
@@ -36,8 +36,6 @@ struct existence_group *egp;
 
 static void *scan_existence(void *arg)
 {
-	int i = 0;
-
 	for (;;) {
 		if (!existence_exists(&outgoing)) {
 			BUG_ON(!existence_exists(&incoming));
@@ -47,7 +45,6 @@ static void *scan_existence(void *arg)
 			BUG_ON(existence_exists(&outgoing));
 			break;
 		}
-		i++;
 	}
 	/* printf("scan_existence(): %d loops\n", i); */
 	return NULL;
diff --git a/CodeSamples/datastruct/Issaquah/tree.c b/CodeSamples/datastruct/Issaquah/tree.c
index 26600118..6627e460 100644
--- a/CodeSamples/datastruct/Issaquah/tree.c
+++ b/CodeSamples/datastruct/Issaquah/tree.c
@@ -504,10 +504,8 @@ void *tree_lookup(struct treeroot *trp, int key, void (*func)(void *data))
 	struct treenode *par;
 	spinlock_t *lockp = NULL;
 	int wantdelay = 0;
-	int tries = 0;
 
 retry:
-	tries++;
 	rcu_read_lock();
 	cur = _tree_lookup(trp, key, &par);
 	TREE_BUG_ON(cur == NULL);
@@ -580,7 +578,6 @@ int tree_insert_existence(struct treeroot *trp, int key, void *data,
 	struct treenode *par;
 	int ret = 0;
 	spinlock_t *lockp[2];
-	int tries = 0;
 	int wantdelay = 0;
 
 	TREE_BUG_ON(data == NULL);
@@ -588,7 +585,6 @@ int tree_insert_existence(struct treeroot *trp, int key, void *data,
 	if (!new)
 		return -ENOMEM;
 retry:
-	tries++;
 	rcu_read_lock();
 	cur = _tree_lookup(trp, key, &par);
 	TREE_BUG_ON(cur == NULL || par == NULL);
@@ -660,11 +656,9 @@ static int tree_delete_existence(struct treeroot *trp, int key,
 	struct treenode *par;
 	spinlock_t *lockp[2];
 	int ret = -ENOENT;
-	int tries = 0;
 	int wantdelay = 0;
 
 retry:
-	tries++;
 	rcu_read_lock();
 	cur = _tree_lookup(trp, key, &par);
 	TREE_BUG_ON(cur == NULL || par == NULL);
-- 
2.34.1


