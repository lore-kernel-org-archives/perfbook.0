Return-Path: <SRS0=s+9n=4Z=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=woihxTfZQcOTrtLeKmqEa2C1X/A/KygxepnirIpr0Ik=;
        b=IgFFGRHDsBcx98TCJ4nbYWjmFvKWtZD7borj9mB0NvNwb8w0z86dHTgbTO3p3MRf7t
         FzBI5PLe6Dnb2zzosONT6kzPbr/dEQmL2Bk8ojBP/RMC31dIbLcoRM5I+VDHn+rCu/Vb
         PvpoMD1Cqr9K+ct3QPdfgfDwIzsBW803Ia3MfxXYbB0o2GmwdSgQlV8ch+59MxARDde5
         absCrzkWdfis9Pf31E6KjKnN9hg/KgdDuWhcYXkOq2XQsy6gI0aw8LH2C/fWzJN4VsWY
         QjrY4od0W+sdrqDBbMOhlaLnEiGXuSJ8skEP6UG0qWDPnzEqNyWtSlsaJRWgkYgpMnSm
         EvaQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2] datastruct: Add missed unbreakable spaces
Date: Tue, 27 Dec 2022 08:06:19 -0800
Message-Id: <20221227160619.16609-2-sj38.park@gmail.com>
In-Reply-To: <20221227160619.16609-1-sj38.park@gmail.com>
References: <20221227002650.GF4001@paulmck-ThinkPad-P17-Gen-1>
 <20221227160619.16609-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Add missing unbreakable spaces for 'CPUs' and 'elements'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
Changes from v1
- Fix build error by removing unbreakable space from \cref{}

 datastruct/datastruct.tex | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 99c92d9a..c095b846 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -664,7 +664,7 @@ shows the same data on a linear scale.
 This drops the global-locking trace into the x-axis, but allows the
 non-ideal performance of RCU and hazard pointers to be more readily
 discerned.
-Both show a change in slope at 224 CPUs, and this is due to hardware
+Both show a change in slope at 224~CPUs, and this is due to hardware
 multithreading.
 At 32 and fewer CPUs, each thread has a core to itself.
 In this regime, RCU does better than does hazard pointers because the
@@ -672,11 +672,11 @@ latter's read-side \IXpl{memory barrier} result in dead time within the core.
 In short, RCU is better able to utilize a core from a single hardware
 thread than is hazard pointers.
 
-This situation changes above 224 CPUs.
+This situation changes above 224~CPUs.
 Because RCU is using more than half of each core's resources from a
 single hardware thread, RCU gains relatively little benefit from the
 second hardware thread in each core.
-The slope of the hazard-pointers trace also decreases at 224 CPUs, but
+The slope of the hazard-pointers trace also decreases at 224~CPUs, but
 less dramatically,
 because the second hardware thread is able to fill in the time
 that the first hardware thread is stalled due to \IXh{memory-barrier}{latency}.
@@ -776,7 +776,7 @@ to about half again faster than that of either QSBR or RCU\@.
 	Still unconvinced?
 	Then look at the log-log plot in
 	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
-	which shows performance for 448 CPUs as a function of the
+	which shows performance for 448~CPUs as a function of the
 	hash-table size, that is, number of buckets and maximum number
 	of elements.
 	A hash-table of size 1,024 has 1,024~buckets and contains
@@ -785,14 +785,13 @@ to about half again faster than that of either QSBR or RCU\@.
 	Because this is a read-only benchmark, the actual occupancy is
 	always equal to the average occupancy.
 
-	This figure shows near-ideal performance below about 8,000
-	elements, that is, when the hash table comprises less than
-	1\,MB of data.
+	This figure shows near-ideal performance below about 8,000~elements,
+	that is, when the hash table comprises less than 1\,MB of data.
 	This near-ideal performance is consistent with that for the
 	pre-BSD routing table shown in
 	\cref{fig:defer:Pre-BSD Routing Table Protected by RCU}
 	on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU},
-	even at 448 CPUs.
+	even at 448~CPUs.
 	However, the performance drops significantly (this is a log-log
 	plot) at about 8,000~elements, which is where the 1,048,576-byte
 	L2 cache overflows.
@@ -835,7 +834,7 @@ data structure represented by the pre-BSD routing table.
 
 \QuickQuiz{
 	The memory system is a serious bottleneck on this big system.
-	Why bother putting 448 CPUs on a system without giving them
+	Why bother putting 448~CPUs on a system without giving them
 	enough memory bandwidth to do something useful???
 }\QuickQuizAnswer{
 	It would indeed be a bad idea to use this large and expensive
@@ -905,10 +904,10 @@ concurrency control to begin with.
 \Cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
 therefore shows the effect of updates on readers.
 At the extreme left-hand side of this graph, all but one of the CPUs
-are doing lookups, while to the right all 448 CPUs are doing updates.
+are doing lookups, while to the right all 448~CPUs are doing updates.
 For all four implementations, the number of lookups per millisecond
 decreases as the number of updating CPUs increases, of course reaching
-zero lookups per millisecond when all 448 CPUs are updating.
+zero lookups per millisecond when all 448~CPUs are updating.
 Both hazard pointers and RCU do well compared to per-bucket locking
 because their readers do not increase update-side lock contention.
 RCU does well relative to hazard pointers as the number of updaters
@@ -931,7 +930,7 @@ showed the effect of increasing update rates on lookups,
 \cref{fig:datastruct:Update-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
 shows the effect of increasing update rates on the updates themselves.
 Again, at the left-hand side of the figure all but one of the CPUs are
-doing lookups and at the right-hand side of the figure all 448 CPUs are
+doing lookups and at the right-hand side of the figure all 448~CPUs are
 doing updates.
 Hazard pointers and RCU start off with a significant advantage because,
 unlike bucket locking, readers do not exclude updaters.
-- 
2.17.1

