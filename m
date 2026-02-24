Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215018DB26
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929407; cv=none; b=DxP2Me0iBqT+Cit7RAYHUvLBLP+BU79t/nm9nzHD3Rh9E7Xyz54WTUQGxmfZmhXHeDra8CfJsoYbPcofVzPAx9kX3s/cE6kW+pgmws47WfhZ5/bUUTHbpgu83avV2PrImD+IuKUUAZb/UUxg7gqW1Ek9w/HFY0+Dv7IbXDhh3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929407; c=relaxed/simple;
	bh=9C/gaXVb5HmvB33uCfEqya2VkFIjPzQb1ni8iYsV4No=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pr7z2ry0Gjhul5xEoQQFwSyEzciiJlqA0Vx46zDtAvMsZL84VS+woCbInv+oqs0RpZlBJb71c77BpBgK/9Xg5PHdjY3SZipSyCEVSyRkdHirvYHOzTVJjMvrcO9vlS5DabfP16jXzZ7N6g7OsogDC9VOLPqYntRmF14qZXcSM6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eSabb2/x; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eSabb2/x"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771929403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UKqW0eUJm/CO2QaSgQjYWuZgbOP5hSoZHwwKTpMX2fk=;
	b=eSabb2/xl7oeBSSU+T/JHHN4E9KXUa7/AeZM90rhJpHXVWIaH3Rj7UFrkBVO7N0L7ba2Gg
	xiWRtD27iYyXCaxgcogUs40rSAO1dWP+KVUYra1W+yZIOzdoYl/gI4VHjGki+Pyhypl/QP
	ItH5shl4i5zGO0HBL1cLNy43kSJJ1Yo=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/seqlock: Fix read-side smp_mb wording
Date: Tue, 24 Feb 2026 18:35:39 +0800
Message-Id: <20260224103539.2615348-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 defer/seqlock.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 3ed2f483..6d1d5b78 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -166,7 +166,7 @@ will pass to a later call to \co{read_seqretry()}.
 	on the update side.
 	This feature is on its way into the C++ standard under the name
 	of ``asymmetric fences''~\cite{DavidGoldblatt2022asymmetricFences}.
-	Either way, this trick eliminates the update-side \co{smp_mb()}
+	Either way, this trick eliminates the read-side \co{smp_mb()}
 	overhead, which in turn makes eliminating the check more
 	attractive, arriving again at the form of the code shown in
 	\cref{lst:defer:Sequence-Locked Pre-BSD Routing Table Lookup}.
-- 
2.25.1

