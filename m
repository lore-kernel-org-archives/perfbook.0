Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E4A2C027F
	for <perfbook@vger.kernel.org>; Wed, 25 Feb 2026 11:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772017354; cv=none; b=cDQ4Pi+kWrcfRpXN3+x5AMn/wjuVQxi+FcFBnb07ncY+5UWv1SHjqGRrOLhGuBJ4jynsZy7qIAMQ/B9FhlJOKK9BWwh4QROwJH61oTeg7llQwDRzKKljGfqRseDtSi0A3UWZnxexKO6lHv1r8vxnNBdcMVokszEsJi/k4XC9n2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772017354; c=relaxed/simple;
	bh=amxXkH7RVNrTlF8nXLbcTRp7qSVFFiv0myV5+uuF+sY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ETPxYDTBZTdQ1ogRVjOLq/7MEuIeiP9+sERxmC4GhsHPpRnyxMstJY1vn312hI+Uyd9JGi+MTsjEzYzR8oMcSuN+bFxJcSiHOBwvhK4Z4gM2o6o2nSgustalYPLixnUOXBQtwujUxBiquHr83hNc0UadFI52l+yt+LkK3nrNHhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LheZH7vV; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LheZH7vV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772017345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nH7+egsoZTf696Hk73uyWSYxwaPyi1lUEIMb9XW9hYs=;
	b=LheZH7vVG4hrzXLs8oY9tDAxK2DXyYdqPcBF4tBjIguY9IvycQ0zOJvm8ED4txwRjGCKwI
	bJ0vj575yQFEr2ijqE8XZhkntBwas+Xtv9Ws+CKCe9S9Qsd/GZtcoDVkOQUP5P8Xc4GL5i
	mYnYFXsl483qY+AnAqJ/TiAe9Dtwiq8=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/rcufundamental: Clarify rcu_dereference() ordering semantics
Date: Wed, 25 Feb 2026 19:01:26 +0800
Message-Id: <20260225110126.3266260-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace a grammar-only sentence with wording aligned with the
normative statement in defer/rcuintro.tex. That statement defines
rcu_dereference() as preventing compiler and (in one case) CPU
reordering of the pointer load with later dereference-side memory
operations.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 defer/rcufundamental.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index c3bcc4f0..ccfe9133 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -118,9 +118,9 @@ synchronization overhead.
 	before freeing the removed data.
 }\QuickQuizEnd
 
-Subscription is carried out by \co{rcu_dereference()}, which orders
-the subscription operation's load from the pointer is before the
-dereference.
+Subscription is carried out by \co{rcu_dereference()}, which prevents
+the compiler and (in one case) the CPU from reordering the pointer
+load with later memory operations that dereference that pointer.
 Similar to \co{rcu_assign_pointer()}, \co{rcu_dereference()} must be
 atomic in the sense that the value loaded must be that from a single
 store, for example, the compiler must not tear the load.\footnote{
-- 
2.25.1

