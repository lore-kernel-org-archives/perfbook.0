Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c9+PlVOCkHgPKKNH6Y5eI62wZY0Vg66Tin1W29B3RsM=;
 b=kHgDnweY1y/GA2KRdPgf5lQ3o/aeNd6tcBWg9Qcq1i8Xm2YZBVN4Xw+PUDzwfpIO3D
 qSP2MQNGXPIH0298mNC3eI9XQX6IXuRHd3H4drbGKoRwImL/66fGxuE8ikFxS05jpRR7
 H9tHrQ5Oew0ZcsAnQkLG8KcUP1VPw3pWN9pEMp3nJfUzGB9ybSJe3iQYRqG1W4iKAS/d
 UQCBw4VMkVsM+2Y45zj6BCGbIAfrVtInvhaoQ6tdLszhLRoWxQmNi/7ZtmPhzluDmdUq
 NfuX4wnUcrhy4EP3WRJghsTOetuTvQgq4y4YF55cc88k9m+pz2ofwtSKBE0Myn+aDksd
 fASQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 12/17] formal/ppcmem: Fix typo for \co{}
Date: Wed, 28 Sep 2016 06:56:36 +0900
Message-Id: <20160927215641.7330-12-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 9e0392a..c18cb9a 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -165,7 +165,7 @@ exclusive'' in ARM parlance and ``load reserve'' in Power parlance)
 and store-conditional (``store register exclusive'' in ARM parlance),
 respectively. When these are used together, they form an atomic
 instruction sequence, roughly similar to the compare-and-swap sequences
-exemplified by the x86 co{lock;cmpxchg} instruction. Moving to a higher
+exemplified by the x86 \co{lock;cmpxchg} instruction. Moving to a higher
 level of abstraction, the sequence from lines~10-15 is equivalent to
 the Linux kernel's \co{atomic_add_return(&z, 0)}. Finally, line~16 is
 roughly equivalent to the C statement \co{r3=y}.
-- 
2.10.0

