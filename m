Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DC3624DB
	for <perfbook@vger.kernel.org>; Wed, 25 Feb 2026 12:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023530; cv=none; b=AXvK1QCclaLJhP0VwdtsD1x6TtAUJEUgjguSmyl+JItsZZa84k3Xlpve7PRfNdR5dC7cs++euHt8s12JfahXxq3pwohi/WEkiuRcrGZMGdVie5XUXCg+92ZNABDFmS6L9X8RH6ttGY7nCuQXroYfJkDjfOgYOqn+jCOWY6Ze1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023530; c=relaxed/simple;
	bh=jpUVBWqDbMjNL+4NFQbVTIocNAEYnU/U9/myrugS1iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uXk3jV8d2PK0oX6hICj0GurM7LkvgaIBuEJ/ojy+dvkowjchkXhruOnBYw0jOQjJy2symHpgtHHwT8T3c3GUlAW/oWe71FP51MLgk/QeVXEPltL/xQEDPpun7x3kwGAAW4FMCmq1vxiGkSCzbDi5foEoKK6m5dVQPa3o2es/AHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e4wkqiDy; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e4wkqiDy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772023523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kvxnqEbvKv+9wXYJ17G+Hxspyetgf95qrkq4rqIBCXk=;
	b=e4wkqiDyOqP4csoD3vrY2DA7T8J1d3R4NDWkjWe6nl1cBrFAyBJzL0qbKBqoIeIuH3ls7A
	sLyWJ85Bz+TxHhjb4z0E1pw18uzQUBZO0OWyBnoElPrHN+lr6lh/yfAWDnQnRTk3eLTuBi
	jl8gxlGmh+s+VeV/eTEA387fyBcY8xo=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer: Fix grammar issues across Chapter 9 text
Date: Wed, 25 Feb 2026 20:44:24 +0800
Message-Id: <20260225124424.3325034-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix subject-verb agreement, singular/plural forms, pronoun agreement,
and countability in Chapter 9 prose.

These wording-only edits improve readability without changing
technical meaning.

Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 defer/defer.tex          |  2 +-
 defer/rcu.tex            |  2 +-
 defer/rcuapi.tex         |  2 +-
 defer/rcufundamental.tex |  2 +-
 defer/rcuusage.tex       |  4 ++--
 defer/whichtochoose.tex  | 10 +++++-----
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/defer/defer.tex b/defer/defer.tex
index eefb1215..3a24ee5d 100644
--- a/defer/defer.tex
+++ b/defer/defer.tex
@@ -87,7 +87,7 @@ interface~3, and address~17 to interface~7.
 This list will normally be searched frequently and updated rarely.
 In \cref{chp:Hardware and its Habits}
 we learned that the best ways to evade inconvenient laws of physics, such as
-the finite speed of light and the atomic nature of matter, is to
+the finite speed of light and the atomic nature of matter, are to
 either partition the data or to rely on read-mostly sharing.
 This chapter applies read-mostly sharing techniques to Pre-BSD packet
 routing.
diff --git a/defer/rcu.tex b/defer/rcu.tex
index 13078687..9d812d77 100644
--- a/defer/rcu.tex
+++ b/defer/rcu.tex
@@ -16,7 +16,7 @@ use explicit counters to defer actions that could disturb readers,
 which results in read-side contention and thus poor scalability.
 The hazard pointers covered by
 \cref{sec:defer:Hazard Pointers}
-uses implicit counters in the guise of per-thread lists of pointer.
+use implicit counters in the guise of per-thread lists of pointers.
 This avoids read-side contention, but requires readers to do stores and
 conditional branches, as well as either \IXhpl{full}{memory barrier}
 in read-side primitives or real-time-unfriendly \IXacrlpl{ipi} in
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 4e231e5a..09e7c277 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -599,7 +599,7 @@ to reuse during the grace period that otherwise would have allowed them
 to be freed.
 Although this can be handled through careful use of flags that interact
 with the RCU callback queued by \co{call_rcu()}, this can be inconvenient
-and can waste CPU times due to the overhead of the doomed \co{call_rcu()}
+and can waste CPU time due to the overhead of the doomed \co{call_rcu()}
 invocations.
 
 In these cases, RCU's polled grace-period primitives can be helpful.
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index ccfe9133..604381a9 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -11,7 +11,7 @@ independent of any particular example or use case.
 People who prefer to live their lives very close to the actual code may
 wish to skip the underlying fundamentals presented in this section.
 
-The common use of RCU to protect linked data structure is comprised
+The common use of RCU to protect linked data structures is comprised
 of three fundamental mechanisms, the first being used for insertion,
 the second being used for deletion, and the third being used to allow
 readers to tolerate concurrent insertions and deletions.
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 2bbd4cef..36939300 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -156,7 +156,7 @@ that of the ideal synchronization-free workload.
 	\cref{sec:cpu:Pipelined CPUs}
 	carefully already knew all of this!
 
-	These counter-intuitive results of course means that any
+	These counter-intuitive results of course mean that any
 	performance result on modern microprocessors must be subject to
 	some skepticism.
 	In theory, it really does not make sense to obtain performance
@@ -241,7 +241,7 @@ As noted in \cref{sec:defer:RCU Fundamentals}
 an important component
 of RCU is a way of waiting for RCU readers to finish.
 One of
-RCU's great strength is that it allows you to wait for each of
+RCU's great strengths is that it allows you to wait for each of
 thousands of different things to finish without having to explicitly
 track each and every one of them, and without incurring
 the performance degradation, scalability limitations, complex deadlock
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index a152b028..a11de412 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -102,8 +102,8 @@ and that there be sufficient pointers for each CPU or thread to
 track all the objects being referenced at any given time.
 Given that most hazard-pointer-based traversals require only a few
 hazard pointers, this is not normally a problem in practice.
-Of course, sequence locks provides no pointer-traversal protection,
-which is why it is normally used on static data.
+Of course, sequence locks provide no pointer-traversal protection,
+which is why they are normally used on static data.
 
 \QuickQuiz{
 	Why can't users dynamically allocate the hazard pointers as they
@@ -124,7 +124,7 @@ RCU readers must therefore be relatively short in order to avoid running
 the system out of memory, with special-purpose implementations such
 as SRCU, Tasks RCU, and Tasks Trace RCU being exceptions to this rule.
 Again, sequence locks provide no pointer-traversal protection,
-which is why it is normally used on static data.
+which is why they are normally used on static data.
 
 The ``Need for Traversal Retries'' row tells whether a new reference to
 a given object may be acquired unconditionally, as it can with RCU, or
@@ -319,7 +319,7 @@ Hazard pointers incur the overhead of a \IX{memory barrier}
 for each data element
 traversed, and sequence locks incur the overhead of a pair of memory barriers
 for each attempt to execute the critical section.
-The overhead of RCU implementations vary from nothing to that of a pair of
+The overhead of RCU implementations varies from nothing to that of a pair of
 memory barriers for each read-side critical section, thus providing RCU
 with the best performance, particularly for read-side critical sections
 that traverse many data elements.
@@ -622,7 +622,7 @@ Stjepan Glavina merged an epoch-based RCU implementation into the
 \co{crossbeam} set of concurrency-support ``crates'' for the Rust
 language~\cite{StjepanGlavina2018RustRCU}.
 
-Jason Donenfeld produced an RCU implementations as part of his port of
+Jason Donenfeld produced an RCU implementation as part of his port of
 WireGuard to Windows~NT kernel~\cite{JasonDonenfeld2021:WindowsNTwireguardRCU}.
 
 Finally, any garbage-collected concurrent language (not just Go!\@) gets
-- 
2.25.1

