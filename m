Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8463A0B16
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771946289; cv=none; b=NGLYJ3ITYZsVRBKSHtLDTpwivGsCsCGeGel2VsSOkcNUm9pOgiEzW0UbhLZnUmQ3qGXBPZ07BFvVlxWm1/V8bF3HCXwWYVPT69QF0MZoloMreCDA0DEs4zKHpXEeSnS/jm+oCqvGU7lxKz9tMJ5sPbGSRN2VD7LS4Nkx83xF+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771946289; c=relaxed/simple;
	bh=B0akFSjDMFDMgyJqUA7voLBaBzM3QNuqscaEMRxhnJM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aShyVUvdrrcQ34TtbNDebanB1+LjoZdwbd7SbMxwPqcD6VjrAjodoWMVwKkKI0+m6ON5pVOIh2PweU9nlaElSlaY99wlIFhIW4zoRriNso4zVpy46FUySq4DgjFSLaWBEpWWPxGnkxlEH6z5bUCiVhjYvx89xvmqn1WVMIRB+L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l2gH9Vpv; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l2gH9Vpv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771946286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mISTP9LeVsdGjILwB8F1uKuEqUAGFG8r9i+/hUjDVg4=;
	b=l2gH9Vpvy5QWDnY3Jjkv/k3xuXUZh4fDgIxdNeUQgUTBEKA+0CgQdFyfPyRJZLIWhMh8OY
	5PKioWQ255dwbqysqJqdgEUSmK14OZVYYSj7LUDQziDkwK1FpBDVYwiIBl6x89jru+/g1/
	emXUzTP/EZxzSNm1Eq/UAIJUnnunV/8=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/whichtochoose: Fix incomplete RCU object reference
Date: Tue, 24 Feb 2026 23:17:12 +0800
Message-Id: <20260224151712.2743076-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the incomplete phrase "all other RCU" with the more precise
"all other RCU-deferred objects", clarifying that what gets blocked
from being freed are objects awaiting RCU grace-period reclamation,
not RCU itself.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 defer/whichtochoose.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 139c9636..ff4545bc 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -118,8 +118,8 @@ The ``Duration of Protection'' row describes constraints (if any) on how
 long a period of time a user may protect a given object.
 Reference counting and hazard pointers can both protect objects for
 extended time periods with no untoward side effects, but
-maintaining an RCU reference to even one object prevents all other RCU
-from being freed.
+maintaining an RCU reference to even one object prevents all other
+RCU-deferred objects from being freed.
 RCU readers must therefore be relatively short in order to avoid running
 the system out of memory, with special-purpose implementations such
 as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rule.
-- 
2.25.1

