Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC152DFA25
	for <perfbook@vger.kernel.org>; Tue, 24 Feb 2026 07:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919659; cv=none; b=qcf6v8r/EU/PvBgDNptYc/MdKmJHBV9WMUAtC2s7DDvMmNCkv5hswBNVnOmKxH7aHItwL2eET8cVT2JakrsJfPG+s8RrEe1Yy7EiGzSYP1x4vXQndLjL77VxIDYi2PHZw6T1N0pzcv21GpkYwm40/O2WxTJ4TlDKHw3LWqv+P7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919659; c=relaxed/simple;
	bh=r8MrUpUdrqbOqt1ocX5k3+FCKliZ+Kn50ENKknDvD3w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XIk2+KjziQibJSOWe36QZu9RaHJ3xz+IscUyLpK9V5910vSsPPnn7YNxA+/HxQ9bQlJXH1aCkXa13lyuDG2Z6ZNZE+B7kv8vgg5kFRaFpOx4OHviA22uq9BcO170oPPprrYcUgMONTRw2r1Fi8RaTBP5nth2VDo2N/GFQwoHy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nt5idRqm; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nt5idRqm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771919654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2morZYfrxky+dF2EhzRkogoRGs1Is/3du2Ct0t966gA=;
	b=nt5idRqm6MrGCMLsaZWSE2f0d8Oa6P9OTlyVgA3Pw+UlqcQKq+d1tgSJScBFbTsriQQMQN
	Y66EwPGVz8S4kfd44K4Ltc5wb8wbkJTmIIzlMXalXjSUpVGpqPvRKWfgT+3FuIE4WInP3i
	KAAP5pRzANBvZCGar5rEST0OLZhNR3g=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer/rcuusage: Fix spin_lock arg and write-side term
Date: Tue, 24 Feb 2026 15:53:14 +0800
Message-Id: <20260224075314.2543888-1-kunwu.chan@linux.dev>
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
 defer/rcuusage.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index b5111043..6c960a00 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1254,7 +1254,7 @@ rcu_read_lock();
 list_for_each_entry_rcu(p, &head, list_field) {
 	do_something_with(p);
 	if (need_update(p)) {
-		spin_lock(my_lock);
+		spin_lock(&my_lock);
 		do_update(p);
 		spin_unlock(&my_lock);
 	}
@@ -1583,7 +1583,7 @@ constraints:
 \begin{enumerate}
 \item	Write-side acquisitions wait for any read-holders to release
 	the lock.
-\item	Writer-side acquisitions wait for any write-holder to release
+\item	Write-side acquisitions wait for any write-holder to release
 	the lock.
 \item	Read-side acquisitions wait for any write-holder to release
 	the lock.
-- 
2.25.1

