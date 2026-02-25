Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3E30E827
	for <perfbook@vger.kernel.org>; Wed, 25 Feb 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772006324; cv=none; b=emL/sWl5YeBzhYDTYTkuk4oq5tJlKRrTNJmXW0SffaNBPfShMWvFZOWo/cDNCYZ5UHMz0YzC6Uf6Ni86nbXACrHb1+VbUWF/wjt4Aflhogs7saZWjt+GwMAEYqJL5lF4EsXFIw+CPyB+qa1ZwseTti+n7Wp+c0XwzNzb4ZZNgyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772006324; c=relaxed/simple;
	bh=FMZUPYdsJa3PYwlubhJjf96ealgkvfo6DgNjCFAp/Xw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aU+Fit5eqzl7b4qCIljyMMyHU7ph9cq7FmwVCM75G5zNknvY+BxWGbk9kP8O+SHYfiEWvqJ6JEuqFAoC8Rmr9SImp3cfTaPqhs/CppnKkq/MZ2CccBx0O7recqqapJhJu7VDGg7Spwt6rDECzFcvVHtl14P2bGkukOj4ivCw9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EDPME51W; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EDPME51W"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772006321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2aA92LA++fBTtWNOFXdVW54JZE/ck5eb5JKETWJn4tw=;
	b=EDPME51WBVq4uRnEdNCh0ymy/Xm4Goli6FAq3oOkRq4REO8NLILzpHmVRsVk9/2nUO67Ua
	I263lsPea303VM4hWv+sbX/OS4xIbQpd1tx8WKbBnY7WBN1z/LYwtvXMs+2KCYqLhy8CZG
	t12RaEwf1mOKJryDhs0qyVPSlDYVWwA=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: perfbook@vger.kernel.org
Cc: paulmck@kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH] defer: Fix grammar typos in Chapter 9 text
Date: Wed, 25 Feb 2026 15:58:00 +0800
Message-Id: <20260225075800.3176473-1-kunwu.chan@linux.dev>
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
 defer/hazptr.tex         | 4 ++--
 defer/rcuapi.tex         | 4 ++--
 defer/rcufundamental.tex | 2 +-
 defer/rcuintro.tex       | 8 ++++----
 defer/rcurelated.tex     | 2 +-
 defer/rcuusage.tex       | 6 +++---
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 50ff0996..2c9a5851 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -373,7 +373,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 	has a linear y-axis, while most of the graphs in the
 	``Structured Deferral'' paper have logscale y-axes.
 	Next, that paper uses lightly-loaded hash tables, while
-	\cref{fig:defer:Pre-BSD Routing Table Protected by Hazard Pointers}'s
+	\cref{fig:defer:Pre-BSD Routing Table Protected by Hazard Pointers}
 	uses a 10-element simple linked list, which means that hazard pointers
 	face a larger memory-barrier penalty in this workload than in
 	that of the ``Structured Deferral'' paper.
@@ -393,7 +393,7 @@ and in other publications~\cite{ThomasEHart2007a,McKenney:2013:SDS:2483852.24838
 	Given the difference in performance, it is clear that hazard
 	pointers give you the best performance either for
 	very large data structures (where the memory-barrier overhead
-	will at least partially overlap cache-miss penalties) and
+	will at least partially overlap cache-miss penalties) or
 	for data structures such as hash tables where a lookup
 	operation needs a minimal number of hazard pointers.
 }\QuickQuizEndM
diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 4e231e5a..cfc76fcd 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -53,7 +53,7 @@ This question is answered more thoroughly in the following sections,
 but in the meantime the rest of this section summarizes the motivations.
 
 There is a wise old saying to the effect of ``To err is human.''
-This means that purpose of a significant fraction of the RCU API is to
+This means that the purpose of a significant fraction of the RCU API is to
 provide diagnostics, most notably in \cref{tab:defer:RCU Diagnostic APIs},
 but elsewhere as well.
 
@@ -1363,7 +1363,7 @@ to the \co{5,6,7} element are guaranteed to have exited
 their RCU read-side critical sections, and are thus prohibited from
 continuing to hold a reference.
 Therefore, there can no longer be any readers holding references
-to the old element, as indicated its green shading in the sixth row of
+to the old element, as indicated by its green shading in the sixth row of
 \cref{fig:defer:RCU Replacement in Linked List}.
 As far as the readers are concerned, we are back to having a single version
 of the list, but with the new element in place of the old.
diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 0c8c2e23..23bda66b 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -559,7 +559,7 @@ tolerable, they are in fact invisible.
 In such cases, RCU readers can be considered to be fully ordered with
 updaters, despite the fact that these readers might be executing the
 exact same sequence of machine instructions that would be executed by
-a single-threaded program, as hinted on
+a single-threaded program, as hinted at
 \cpageref{sec:defer:Mysteries RCU}.
 For example, referring back to
 \cref{lst:defer:Insertion and Deletion With Concurrent Readers}
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 48de32e2..639b6614 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -352,7 +352,7 @@ This can work quite well in hard real-time systems~\cite{YuxinRen2018RTRCU},
 but in less exotic
 settings, Murphy says that it is critically important to be prepared
 even for unreasonably long-lived readers.
-To see this, consider the consequences of failing do so:
+To see this, consider the consequences of failing to do so:
 A data item will be freed while the unreasonable reader is still
 referencing it, and that item might well be immediately reallocated,
 possibly even as a data item of some other type.
@@ -380,7 +380,7 @@ garbage collectors, in which case the garbage collector can be thought
 of as plugging the leak~\cite{Kung80}.
 However, if your environment lacks a garbage collector, read on!
 
-A fifth approach avoids the period crashes in favor of periodically
+A fifth approach avoids the periodic crashes in favor of periodically
 ``stopping the world'', as exemplified by the traditional stop-the-world
 garbage collector.
 This approach was also heavily used during the decades before
@@ -418,9 +418,9 @@ items that were removed prior to the start of that grace period.\footnote{
 	please see phased state change in \cref{sec:defer:Phased State
 	Change}.}
 
-Within a non-preemptive operating-system kernel, for context switch to be
+Within a non-preemptive operating-system kernel, for a context switch to be
 a valid quiescent state, readers must be prohibited from blocking while
-referencing a given instance data structure obtained via the \co{gptr}
+referencing a given instance of the data structure obtained via the \co{gptr}
 pointer shown in
 \cref{fig:defer:Insertion With Concurrent Readers,%
 fig:defer:Deletion With Concurrent Readers}.
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index cf4b7b49..422d25fa 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -157,7 +157,7 @@ More recently, filesystem data structures have been made safe for RCU
 readers~\cite{JonathanCorbet2010dcacheRCU,JonathanCorbet2011dcacheRCUbug},
 so perhaps this work can be implemented for all page types, not just
 anonymous pages---\ppl{Peter}{Zijlstra} has, in fact, recently prototyped
-exactly this, and \ppl{Laurent}{Dufour} \ppl{Michel}{Lespinasse} have
+exactly this, and \ppl{Laurent}{Dufour} and \ppl{Michel}{Lespinasse} have
 continued work along these lines.
 For their part, \ppl{Matthew}{Wilcox} and \ppl{Liam}{Howlett} are working
 towards use of RCU to enable fine-grained locking of and lockless access
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 2bbd4cef..4cdf8262 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -251,7 +251,7 @@ use explicit tracking.
 In this section, we will show how \co{synchronize_sched()}'s
 read-side counterparts (which include anything that disables preemption,
 along with hardware operations and
-primitives that disable interrupts) permit you to interaction with
+primitives that disable interrupts) permit you to interact with
 non-maskable interrupt
 (NMI) handlers, which is quite difficult using locking.
 This approach has been called ``Pure RCU''~\cite{PaulEdwardMcKenneyPhD},
@@ -924,7 +924,7 @@ For example, elements of the list might represent hardware elements of
 the system that are subject to failure, but cannot be repaired or
 replaced without a reboot.
 
-An delete-only variant of a pre-BSD routing table can be derived from
+A delete-only variant of a pre-BSD routing table can be derived from
 \cref{lst:defer:RCU Pre-BSD Routing Table Lookup,lst:defer:RCU Pre-BSD Routing Table Add/Delete}.
 Because there is no addition, the \co{route_add()} function may be
 dispensed with, or, alternatively, its use might be restricted to
@@ -1973,7 +1973,7 @@ The jury is still out as to how much of a problem is presented by
 this restriction, and as to how it can best be handled.
 
 However, in the common case where references are held within the confines
-of a single CPU or task, RCU can be used as high-performance and highly
+of a single CPU or task, RCU can be used as a high-performance and highly
 scalable reference-counting mechanism.
 
 As shown in \cref{fig:defer:Relationships Between RCU Use Cases},
-- 
2.25.1

