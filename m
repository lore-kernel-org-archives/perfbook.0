Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878932ED27
	for <perfbook@vger.kernel.org>; Wed, 11 Mar 2026 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218962; cv=none; b=jslIcmqArsAMOLTFC4USXoAB3e1r5h2g3Qdh+KDF7UoKIDTs7PMK2wHmj2DzhCnp0YixJQfBztQoZBtmw70+mXgBMaLXmxqgaEJwyDQobifoPakfAFCrdfkqmbbIjLpSDeATTA76H9wojnmOZSax/T+vStgLUbKgZwQtPQgHso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218962; c=relaxed/simple;
	bh=1+qdDOnk6OasTycS8o15hFjj6Q6r09pU7FGX2R9yzBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hzo9yOvUV65+XChth3OmyrVk5EJ5u+ykDzSXnmPGI6IAVF2/HVC8xR6d6KxyqVSf9LDT4YuHZagT7skQ8VgqjWrHPwJ7Yg1MMUPGYmNCYvesALDgShJjOay0EdYiqUe1aExeyxU26ReYXVqGDHBruISZrj8Ni710y4bK0lVDEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nk3K6ud3; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nk3K6ud3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773218953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6cuPA5Vp/nt5Zfj6wdkl3lLELKD29FeUW7saEAB4Ofc=;
	b=nk3K6ud3E3PE6GLlimy3SVHyYZxtj3PjYOPqzsyoBDFRHijo5MaU1iFES1uDzuhW7HOFMK
	/3u4d/m3varICSICDUmReRRsVrcTMQgTo6DaSTkOeY3syz6/Bg0dTxhKqMfWZY7SK2YkHC
	8sBoAMRZN1LeHxMLutbB2QyOG7KJg5k=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] memorder: Reconcile Figure 15.15 notation with W+RWC z-flow semantics
Date: Wed, 11 Mar 2026 16:48:13 +0800
Message-Id: <20260311084813.969200-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

State explicitly that Figure 15.15 uses x as a schematic variable name, while the surrounding W+RWC analysis in Listing 15.18 follows the concrete z-flow (P2 -> z -> P1). This eliminates notation drift across cross-references and preserves propagation-argument fidelity.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 memorder/memorder.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 2357e7ea..8eb14a29 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2760,6 +2760,8 @@ that \co{P1()}'s read from \co{z} happens much later in time, but
 nevertheless still sees the old value of zero.
 This situation is depicted in
 \cref{fig:memorder:Load-to-Store is Counter-Temporal}:
+The figure uses \co{x} as a generic variable name for the same
+counter-temporal pattern.
 Just because a load sees the old value does \emph{not} mean that
 this load executed at an earlier time than did the store of the
 new value.
-- 
2.25.1

