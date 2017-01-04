Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=6fWIbqX08m+TlFmVf6gh/DBRLoNpupwjy79xtZKrvBI=;
 b=CPkVncJCBx6fetEPPiwQ3lfC4ZS02Qm5XtmB1FjeuMaY7FCjwa9kLaRJTq8AdTjVD9
 AaJTph/oLQ6mGRyk5KlgrBlUYPGqIv5og0U90aY2fUQ+yaTGt09KdSqme0AW6KB+cEYs
 E5LxhDvc0fW/Lzvy/GxnkHK5kE/uf8CfTt0ORaVqsWAwBiKlQP/ntQHfByLD3QzzYGhO
 LSc4OFENyU4Of6/MxXzXoji/xhN9MqiKzVU1Oz1NXLLgzo9Fp7qnn3ekVlflZAd0m7rt
 Ok2xClqmW5xGW9KouVesuzsRbQVRlbXT1iHoPrMogxA2umURH8FihKVvx2sZfS/7lijr
 69Tg==
Subject: [PATCH 09/13] memorybarriers: Replace nbsp with \vspace
References: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bc30a07-5e9f-f520-9abf-7776a7f29f17@gmail.com>
Date: Wed, 4 Jan 2017 10:28:00 +0900
MIME-Version: 1.0
In-Reply-To: <a054d07b-3b69-25ce-aab4-c294dc3b6bcd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7fb784f112a501b3fe189538b74f3a3b9f97ad99 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 31 Dec 2016 23:13:49 +0900
Subject: [PATCH 09/13] memorybarriers: Replace nbsp with \vspace

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 6291097..3bf3a7f 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1160,7 +1160,7 @@ The set of accesses as seen by the memory system in the middle can be arranged
 in 24 different combinations, with loads denoted by ``ld'' and stores
 denoted by ``st'':

-~ \\
+\vspace{5pt}
 \begin{minipage}[t]{\columnwidth}
 \tt
 \scriptsize
-- 
2.7.4


