Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103C3BAD97
	for <perfbook@vger.kernel.org>; Wed, 11 Mar 2026 09:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221431; cv=none; b=DoeDK8jn3/c7dXDlkIgm5bEtUKCVJF1mnEwLIivx6uR5YS/1dO6PVTbdqypcG89Rv/Csd/YcF7B6dJoOoy9W51Ro+z5f+dTCouyxszV8N3GIlgMxcSmk6umBuzxl9gYhCa8W3ImbnWlnraDHN5stGdDRU3AQT2PWIw7CGvCGceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221431; c=relaxed/simple;
	bh=KS2APp7uGTr0LgjGDfqU5sXRTmcbTE0GCGsafkrjnTs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=W0ECXXSQ4qToVRKBvTMJNuv1+SDmjkWBSr8ADLFI9glaUFJqagKeUNW2TuqMLgHWofm7mw6CQ4KAbQEyiFUOo11iZoTISAupmGVPaHm/Xtr0fGxQiXHL+0olbtwIP06XYk/asPjzxEDEQt/eAoKrn9H4YwOKKCwldI0pJRluNcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ErlSUAxq; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ErlSUAxq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773221427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=feyum5GJdEBw0mOf0fzRlwctZBGujld4tpA7xOtvALM=;
	b=ErlSUAxqsAUIsnsFX78KRTX3CUEp5WU2rqRMNucZV02NE9aQpukEeXYD1zsd1KwqoZ4VIG
	AxV3s8+/jewRrzTvseB/MYHUrIToOVpX+HJ7OdLOTVyj2Z94wqDufhbTr2XJTdyBrpeo14
	/WPHjaLWZuRywujztRvYK6WoMgqWJvs=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] memorder: Realign OMCA visibility attribution with litmus causality
Date: Wed, 11 Mar 2026 17:29:35 +0800
Message-Id: <20260311092935.983280-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix the OMCA explanatory text to attribute the two stores to P0 (not P1), matching C-MP-OMCA+o-o-o+o-rmb-o.litmus. This keeps the narrative causality aligned with the executable model.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 8eb14a29..388903b6 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2415,7 +2415,7 @@ value directly from the store buffer, which improves performance.
 
 	In contrast, on an other-multicopy-atomic platform, \co{P0()}
 	could see its own store early, so that there would be no constraint
-	on the order of visibility of the two stores from \co{P1()},
+	on the order of visibility of the two stores from \co{P0()},
 	which in turn allows the \co{exists} clause to trigger.
 }\QuickQuizEnd
 
-- 
2.25.1

