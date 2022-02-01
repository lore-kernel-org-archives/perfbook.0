Return-Path: <SRS0=q5UQ=SQ=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; bh=nkGCERftEMRkS1
	88U99xbLW6fmnICaYZpQpy3236kHA=; b=BDHfwo/BNfMcyGi3+6ZcTGZ3jTJnQ5
	Gmp0/pFMbFApf91U2Ml8XEA6p7MzKgVe04sZrle3ENan7qlxyw+wmWs8z/KIiLac
	bfGl3JjSgmjiqRDew6TVg0YOiqTSoer5V4QOpNMgLeE7Wflm0rktmIugbZBk/FJ3
	P45kCE1JCxH3ClIj8+fv3KMsTVZUJXhzjIl3z4cL0g8aaPE3U6N7H+o/33z8DFnT
	LEN9O6qromZxVJITyPKJaHP+zK3Tt76u4D/3Pu/y4/Vv1kTDrJhKWf0KOWbI3eEA
	GGngHQsCIPoZEnpyb5U/dH4ePKCQqBjal4c8RrVlbtHOww/GJyMvF7jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=nkGCERftEMRkS188U99xbLW6fmnICaYZpQpy3236k
	HA=; b=RRLQ6XZqpnUFliXqgJTYV0Q1iupq541O/J4FwrxTXsSdm2/65W9udRwIu
	C/dsa/hVkIQi1qtNb4xJIh2ovKwI+aLM6QUFjGFsEeacZICR2u+XQst63uV2s/BW
	bq873xNowoUt+KK0MAspJnoug6Ei6C7f3BVwdvitT2q1AzADWDw6qGA4bINcJXSU
	oWRNKsFRRtxjv6QiYNad6IHjaEh5sBws8BV8VxOamQv0hudzD8GOaR5qluBXLIuE
	5cJjVy5VZf2/t4VAGCL0GFflbGPJMC9EBxTPj+SgcAqzWsQGyKpFIZz8WFnj5gZf
	MN1o6wzyj5JD4G9C5Guw9kla4oXjA==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook 2/4] defer: Remove leftover manipulation of bottom bit in hazptr.c
Date: Tue,  1 Feb 2022 21:07:49 +0100
Message-Id: <20220201200751.23589-2-johann@jklaehn.de>
In-Reply-To: <20220201200751.23589-1-johann@jklaehn.de>
References: <20220201200751.23589-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

The bottom bit in this implementation is not (no longer?) used to mark deleted
elements, as is also pointed out in one of the quick questions.

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 CodeSamples/defer/hazptr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/defer/hazptr.c b/CodeSamples/defer/hazptr.c
index 2621d407..b84391f4 100644
--- a/CodeSamples/defer/hazptr.c
+++ b/CodeSamples/defer/hazptr.c
@@ -119,7 +119,7 @@ void hazptr_scan()				//\lnlbl{scan:b}
 							//\fcvblank
 		if (!hp)
 			continue;
-		plist[psize++] = (hazptr_head_t *)(hp & ~0x1UL);
+		plist[psize++] = (hazptr_head_t *)hp;
 	}					//\lnlbl{scan:loop:e}
 	smp_mb(); /* ensure freeing happens after scan. */ //\lnlbl{scan:mb2}
 	
-- 
2.34.1

