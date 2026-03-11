Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91982350D58
	for <perfbook@vger.kernel.org>; Wed, 11 Mar 2026 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215932; cv=none; b=ugTpVmgx1ZzyEdOxOvrxb3CfGzuR4wYthMDTwFx/GQoyzl+mqHfGzYpUMRHT39TrDECKZ3q3M+6FZLGbS+i+OKDY/yafv15DsBYItaewW5G1JXwSbpfsOVz3ppIM5E1h0u6be86w07Z/HGK7LwNyKjwQMBWK8+m8EFQh1LY4TuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215932; c=relaxed/simple;
	bh=+oV4uZ4nQFacKOuKeVVT9mXDVQrUfziJ+wJpYBOtm88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lBjV5H0JU3qpe1aro6euRzJ08n9BV9Dljat2B2eKobVEuR5Wk/t7sfM0+ES0v8JafY3faLaFVzzUGYAo2NlpD5eRmllac1Abia2onE8yyEms7/ZG/tayWv6Ce+QCPdOx9LBRVdIQhKmdUvdW1Ic4vVP1jhi4Z2mxomk2IeSDGZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tyQWAmI0; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tyQWAmI0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773215927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J7SV4WS5I2xQNhy4IgVgVBgPF/4d2deBWZkVYiJqXcA=;
	b=tyQWAmI0lU+jtbU/mBB4svkqUJenTRMZxnHqXg9me1+LOZS1+W8tS0yyA1ss+/mPnNsnF8
	CXYedfW/cWpvZY7/hVHE4MPYeumuw6UXdIz96Gl4aFgqzLNbtrSB+9RKR1HCp7kQ5ve78O
	VdVyHzEO1+sOTOrqcoRmSetLxaHnnC0=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] memorder: Reconcile W+RWC propagation path with litmus dataflow
Date: Wed, 11 Mar 2026 15:58:06 +0800
Message-Id: <20260311075806.950363-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Align the Section 15.3.7.2 propagation narrative with Listing 15.18 by correcting the path to P2->z->P1. This removes a variable-path contradiction in the counter-temporal explanation and restores argument traceability.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 memorder/memorder.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 16a569d1..2357e7ea 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2755,8 +2755,8 @@ This situation might seem completely counter-intuitive, but keep
 in mind that the speed of light is finite and computers are of
 non-zero size.
 It therefore takes time for the effect of the \co{P2()}'s store to
-\co{x} to propagate to \co{P1()}, which in turn means that it is possible
-that \co{P1()}'s read from \co{x} happens much later in time, but
+\co{z} to propagate to \co{P1()}, which in turn means that it is possible
+that \co{P1()}'s read from \co{z} happens much later in time, but
 nevertheless still sees the old value of zero.
 This situation is depicted in
 \cref{fig:memorder:Load-to-Store is Counter-Temporal}:
-- 
2.25.1

