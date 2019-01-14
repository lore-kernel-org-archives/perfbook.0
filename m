Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fZ+VEr885+N6CWLHj9TxJInRV0GhHQPNOgzffJmOtCU=;
        b=QCNyzzaraJdCexSmhlRVyOcP5jfw+S6mswXXeWmu4y1FHDOlOSO90m3VVNmDKWu3BM
         WWcqiOf8K77eJiZRONku2//6hR+iF+JR5fmhpWzoGGicMD3PGW9vHLtgze/nb5W5VDP9
         abdTW3Pe6sMdHxj/eX471wGBIHmbCsUtHxd8Tte2zc8DOrjbNlZww9ISRsU87VIhCm0M
         5IQhTsU8EpFnNxaWKb7pwI4rIC1cEDYDKb2fBHHsY4sckYdAVaAtyQo0/qs85rv3Ydj4
         b6UGXOcENorELsWAUDrrgIcJoxzrDMzL+FBfsgfBB5En7/7RdnBE2M3+86+gCiqtkLlD
         JUmA==
Subject: [PATCH 2/2] datastruct/hash: Don't track hash_resize_s
References: <91c8ec61-e42c-9768-150f-39db5ac2280d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <49ad0756-766a-6714-1e4e-bed2f0572147@gmail.com>
Date: Tue, 15 Jan 2019 07:25:24 +0900
MIME-Version: 1.0
In-Reply-To: <91c8ec61-e42c-9768-150f-39db5ac2280d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 707069024b111f58847b8994c2df3166d9307c20 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 15 Jan 2019 07:11:45 +0900
Subject: [PATCH 2/2] datastruct/hash: Don't track hash_resize_s

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/hash/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CodeSamples/datastruct/hash/.gitignore b/CodeSamples/datastruct/hash/.gitignore
index 27c09e4..8d5939c 100644
--- a/CodeSamples/datastruct/hash/.gitignore
+++ b/CodeSamples/datastruct/hash/.gitignore
@@ -3,3 +3,4 @@ hash_bkt_hazptr
 hash_bkt_rcu
 hash_global
 hash_resize
+hash_resize_s
-- 
2.7.4


