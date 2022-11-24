Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669316320;
	bh=Hhb3wTfQ1S6QLBSXsHXzhLNF6nc/oYhkvoSDHsdjlMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KI3EPWI0nTfoTD5N7S56LOdEfZrHMopmlmDzVUFjoVgrzjvxldtynofg/MakPDpB8
	 4uE2x9OulwAkLx81iDLegdmq+xkmuIZsK8OqVIRB7A9bsaKPEQLEKWFhxORC60vNJC
	 4y3zDJtlcsjkpNgxY5fdjtqo7Cji7+gyuAPm90r41eM4fKllZIcHcfjxpUPaahg8ku
	 Uwq0C9EN+tBlMcRcQB6ZBsxUjkekj1C8vMVCyZPonF2RvW0Yeaa/t47vg2WIG1i1yD
	 sEzy3odkqBlvRsoIX+mp88WL3D94xxojn6LvpoE2GmAAZDOw1FKmWl7cwXMZlRE+ZM
	 scjoX0AGJrIyA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 09/13] defer/rcuusage: Add missing '()' for 'rcu_dereference()'
Date: Thu, 24 Nov 2022 10:57:59 -0800
Message-Id: <20221124185803.8150-11-sj@kernel.org>
In-Reply-To: <20221124185803.8150-1-sj@kernel.org>
References: <20221124185803.8150-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence is missing '()' for 'rcu_dereference()'.  Add it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index ba13bd96..1dc4c2ca 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -645,7 +645,7 @@ It is important to note that \co{SLAB_TYPESAFE_BY_RCU} will
 prevent \co{kmem_cache_alloc()} from immediately reallocating
 memory that was just now freed via \co{kmem_cache_free()}!
 In fact, the \co{SLAB_TYPESAFE_BY_RCU}-protected data structure
-just returned by \co{rcu_dereference} might be freed and reallocated
+just returned by \co{rcu_dereference()} might be freed and reallocated
 an arbitrarily large number of times, even when under the protection
 of \co{rcu_read_lock()}.
 Instead, \co{SLAB_TYPESAFE_BY_RCU} operates by preventing
-- 
2.17.1

