Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B542B12E1E9
	for <perfbook@vger.kernel.org>; Fri,  6 Mar 2026 08:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785823; cv=none; b=XKxCyKucYJiYb/tyvCneAOqf9jwPvxMDeVFkQP727/e2mqqUWTtCxdS/wSbzpFiWlmJUFQbUJFnklMaalSIc/TtaYdc5jHEzjLFTDCTAAw3eNH5ydX94q3+JilQJ6lUKJjQZdvPjpmQrq+/SzP4I1KoGQJKh7Pbvliz222WFnvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785823; c=relaxed/simple;
	bh=y8TXDBpj5NTAqx4++4CAidIGbpleIZFyWGvcJqm6Ij8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RYXtPua4Vnl3EjDXqnQDSEpiJ/P6Ac283y8AzgdYxriqj4QskombtExEHIz91WRV03UL/OfkQ0yBBwn7Q53aNhgZPDIPRWyrGSiHsDQunv5BGVYsUS69D+pXfqezHWoSKmLa6m5iAeMn3B54P+3uelZ9VI6fKjSYINCD/ySGBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZdlDXZwH; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZdlDXZwH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772785820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I0rbPiLllcG6IGhX6dLk+4NhlOndk+ualgy3QiO27BM=;
	b=ZdlDXZwHP3+LSrFCgSXN0900d5VZpk5qnEqARjGZcl1/JqgwKszhsym30EhmjNnD2NEKMi
	RfW55taOVgAFq5ttGUl7Hc21Uggo58nN6Q71/mhlGFUFaznv9GtF4sz1K9FrCc1p6ftK8y
	f/2xZIChhvNwFxLiGR1GimEGEXVvdgk=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] memorder: Refine technical prose for clarity and precision
Date: Fri,  6 Mar 2026 16:29:22 +0800
Message-Id: <20260306082922.2204419-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Polish typography and grammar in memory-ordering text to improve
precision, readability, and editorial consistency while preserving
technical semantics.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 memorder/memorder.tex | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index d1ebb93c..16a569d1 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -15,7 +15,7 @@ These intuitions can be quite helpful when writing, analyzing, and
 debugging not only sequential code, but also parallel code that makes
 use of standard mutual-exclusion mechanisms such as locking.
 Unfortunately, these intuitions break down completely in complex
-concurrent code, such as that in  the Linux-kernel, which often uses
+concurrent code, such as that in the Linux-kernel, which often uses
 weakly ordered atomic operations and memory barriers.
 One example of such code implements the standard mutual-exclusion
 mechanisms themselves, while another example implements fast
@@ -316,8 +316,8 @@ stored by a release, discussed in
 then the code following that release will see all accesses preceding
 the acquire.
 More precisely, if CPU~0 does an acquire that loads the value stored by
-CPU~1's release, than all the subsequent accesses executed by CPU~0 will
-see the all of CPU~1's accesses prior to its release.
+CPU~1's release, then all the subsequent accesses executed by CPU~0 will
+see all of CPU~1's accesses prior to its release.
 
 Similarly, the accesses preceding that release access will be protected
 from seeing the accesses following the acquire access.
@@ -561,7 +561,7 @@ on
 	This counter-temporal nature of load-to-store and store-to-store
 	links necessitates strong ordering.
 
-	In constrast, store-to-load links are temporal, as illustrated by
+	In contrast, store-to-load links are temporal, as illustrated by
 	\cref{lst:memorder:Load-Buffering Data-Dependency Litmus Test,%
 	lst:memorder:Load-Buffering Control-Dependency Litmus Test}.
 	This temporal nature of store-to-load links permits use of
@@ -882,7 +882,7 @@ record their stores in their respective store buffers.
 	How can that possibly work???
 }\QuickQuizAnswer{
 	There is an underlying cache-coherence protocol that straightens
-	things out, which are discussed in
+	things out, which is discussed in
 	\cref{sec:app:whymb:Cache-Coherence Protocols}.
 	But if you think that a given variable having two values at
 	the same time is surprising, just wait until you get to
@@ -1040,7 +1040,7 @@ Although full barriers such as \co{smp_mb()} have extremely strong
 ordering guarantees, their strength comes at a high price in terms
 of foregone hardware and compiler optimizations.
 A great many situations can be handled with much weaker ordering guarantees
-that use much cheaper memory-ordering instructions, or, in some case, no
+that use much cheaper memory-ordering instructions, or, in some cases, no
 memory-ordering instructions at all.
 
 \begin{table*}
@@ -1184,7 +1184,7 @@ are at most two threads involved.
 
 	The \co{*_dereference()} row captures the address and data
 	dependency ordering provided by \co{rcu_dereference()} and friends.
-	Again, these dependencies must been constructed carefully,
+	Again, these dependencies must have been constructed carefully,
 	as described in
 	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
 
@@ -2459,7 +2459,7 @@ might reach \co{P2()} before \co{P0()}'s store does.
 This leads to the question of why a real system constrained by the
 usual laws of physics would ever trigger the \co{exists} clause of
 \cref{lst:memorder:WRC Litmus Test With Dependencies (No Ordering)}.
-The cartoonish diagram of a such a real system is shown in
+The cartoonish diagram of such a real system is shown in
 \cref{fig:memorder:Shared Store Buffers And Multi-Copy Atomicity}.
 CPU~0 and CPU~1 share a store buffer, as do CPUs~2 and~3.
 This means that CPU~1 can load a value out of the store buffer, thus
@@ -3536,8 +3536,8 @@ can be satisfied:
 
 At this point, you should see something like
 \cref{fig:memorder:PPCMEM Final R State}.
-Note that the satisified \co{exists} clause is shown in blue near the
-bottom, confirming that this counter-intuitive really can happen.
+Note that the satisfied \co{exists} clause is shown in blue near the
+bottom, confirming that this counter-intuitive result really can happen.
 If you wish, you can click on ``Undo'' to explore other options or
 click on ``Reset'' to start over.
 It can be very helpful to carry out these steps in different orders
-- 
2.25.1

