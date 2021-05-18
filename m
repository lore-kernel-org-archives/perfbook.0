Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kPZ6DQcPyKvyBmSk+CdwiEnrLOTQYWJyx7CPQdQ383k=;
        b=VNi9Tv2O4jsC15jHRxMuEn6/W6bDa4zPgqcEjmfgeNOtdMvbsjnt+REHKpWyD6P+Jm
         TppIQ3AmujM/4xOI43B7mzmiqBdmL9OIXn3wK4TYZIH+bR4OJk00ioRH3kKPWaZzXJct
         VkC8YOSDSTuI7wURtc5HjXIj0YxJwMthey8/juZ/BS5Hc0Y4kiZ42N4eNTT4bIIYsOEH
         +scBd7SCvIxdwHp5LnyhJRow2+rQBxl6lBv9rtUlJD2bqX8WY9JoFm13KBBqg5bPtsvx
         gGLGXiUYwni8DdSWQFsqL2Zxgha0Yzz9CTBeTsUInf0gzpwLL6+RnE2GNfHdthunDq4l
         YHqA==
Subject: [PATCH -perfbook 4/8] datastruct: Employ \cref{} and its variants
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <78ad1546-d7d9-7b50-640b-03ac2fe0176a@gmail.com>
Date: Tue, 18 May 2021 21:21:14 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 348 +++++++++++++++++++-------------------
 1 file changed, 174 insertions(+), 174 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 038f3923..a396b688 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -85,18 +85,18 @@ This section focuses on a single data structure, namely the hash table.
 This focused approach allows a much deeper investigation of how concurrency
 interacts with data structures, and also focuses on a data structure
 that is heavily used in practice.
-Section~\ref{sec:datastruct:Hash-Table Design}
+\Cref{sec:datastruct:Hash-Table Design}
 overviews the design, and
-Section~\ref{sec:datastruct:Hash-Table Implementation}
+\cref{sec:datastruct:Hash-Table Implementation}
 presents the implementation.
 Finally,
-Section~\ref{sec:datastruct:Hash-Table Performance}
+\cref{sec:datastruct:Hash-Table Performance}
 discusses the resulting performance and scalability.
 
 \subsection{Hash-Table Design}
 \label{sec:datastruct:Hash-Table Design}
 
-Chapter~\ref{cha:Partitioning and Synchronization Design}
+\Cref{cha:Partitioning and Synchronization Design}
 emphasized the need to apply partitioning in order to attain
 respectable performance and scalability, so partitionability
 must be a first-class criterion when selecting data structures.
@@ -134,17 +134,17 @@ excellent scalability.
 \label{sec:datastruct:Hash-Table Implementation}
 
 \begin{fcvref}[ln:datastruct:hash_bkt:struct]
-Listing~\ref{lst:datastruct:Hash-Table Data Structures}
+\Cref{lst:datastruct:Hash-Table Data Structures}
 (\path{hash_bkt.c})
 shows a set of data structures used in a simple fixed-sized hash
 table using chaining and per-hash-bucket locking, and
-Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
+\cref{fig:datastruct:Hash-Table Data-Structure Diagram}
 diagrams how they fit together.
 The \co{hashtab} structure (\clnrefrange{tab:b}{tab:e} in
-Listing~\ref{lst:datastruct:Hash-Table Data Structures})
+\cref{lst:datastruct:Hash-Table Data Structures})
 contains four \co{ht_bucket} structures
 (\clnrefrange{bucket:b}{bucket:e} in
-Listing~\ref{lst:datastruct:Hash-Table Data Structures}),
+\cref{lst:datastruct:Hash-Table Data Structures}),
 with the \co{->ht_nbuckets} field controlling the number of buckets
 and the \co{->ht_cmp} field holding the pointer to key-comparison
 function.
@@ -152,7 +152,7 @@ Each such bucket contains a list header \co{->htb_head} and
 a lock \co{->htb_lock}.
 The list headers chain \co{ht_elem} structures
 (\clnrefrange{elem:b}{elem:e} in
-Listing~\ref{lst:datastruct:Hash-Table Data Structures})
+\cref{lst:datastruct:Hash-Table Data Structures})
 through their
 \co{->hte_next} fields, and each \co{ht_elem} structure also caches
 the corresponding element's hash value in the \co{->hte_hash} field.
@@ -173,13 +173,13 @@ which might contain a complex key.
 \label{fig:datastruct:Hash-Table Data-Structure Diagram}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Hash-Table Data-Structure Diagram}
+\Cref{fig:datastruct:Hash-Table Data-Structure Diagram}
 shows bucket~0 containing two elements and bucket~2 containing one.
 
 \begin{fcvref}[ln:datastruct:hash_bkt:map_lock:map]
-Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}
+\Cref{lst:datastruct:Hash-Table Mapping and Locking}
 shows mapping and locking functions.
-Lines~\lnref{b} and~\lnref{e}
+\Clnref{b,e}
 show the macro \co{HASH2BKT()}, which maps from a hash value
 to the corresponding \co{ht_bucket} structure.
 This macro uses a simple modulus: if more aggressive hashing is required,
@@ -195,24 +195,24 @@ corresponding to the specified hash value.
 \end{listing}
 
 \begin{fcvref}[ln:datastruct:hash_bkt:lookup]
-Listing~\ref{lst:datastruct:Hash-Table Lookup}
+\Cref{lst:datastruct:Hash-Table Lookup}
 shows \co{hashtab_lookup()},
 which returns a pointer to the element with the specified hash and key if it
 exists, or \co{NULL} otherwise.
 This function takes both a hash value and a pointer to the key because
 this allows users of this function to use arbitrary keys and
 arbitrary hash functions.
-Line~\lnref{map} maps from the hash value to a pointer to the corresponding
+\Clnref{map} maps from the hash value to a pointer to the corresponding
 hash bucket.
 Each pass through the loop spanning
 \clnrefrange{loop:b}{loop:e} examines one element
 of the bucket's hash chain.
-Line~\lnref{hashmatch} checks to see if the hash values match, and if not,
-line~\lnref{next}
+\Clnref{hashmatch} checks to see if the hash values match, and if not,
+\clnref{next}
 proceeds to the next element.
-Line~\lnref{keymatch} checks to see if the actual key matches, and if so,
-line~\lnref{return} returns a pointer to the matching element.
-If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
+\Clnref{keymatch} checks to see if the actual key matches, and if so,
+\clnref{return} returns a pointer to the matching element.
+If no element matches, \clnref{ret_NULL} returns \co{NULL}.
 \end{fcvref}
 
 \begin{listing}
@@ -225,7 +225,7 @@ If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
 	\begin{fcvref}[ln:datastruct:hash_bkt:lookup]
 	But isn't the double comparison on
 	\clnrefrange{hashmatch}{return} in
-	Listing~\ref{lst:datastruct:Hash-Table Lookup} inefficient
+	\cref{lst:datastruct:Hash-Table Lookup} inefficient
 	in the case where the key fits into an unsigned long?
 	\end{fcvref}
 }\QuickQuizAnswer{
@@ -244,14 +244,14 @@ If no element matches, line~\lnref{ret_NULL} returns \co{NULL}.
 \label{lst:datastruct:Hash-Table Modification}
 \end{listing}
 
-Listing~\ref{lst:datastruct:Hash-Table Modification}
+\Cref{lst:datastruct:Hash-Table Modification}
 shows the \co{hashtab_add()} and \co{hashtab_del()} functions
 that add and delete elements from the hash table, respectively.
 
 \begin{fcvref}[ln:datastruct:hash_bkt:add_del:add]
 The \co{hashtab_add()} function simply sets the element's hash
-value on line~\lnref{set}, then adds it to the corresponding bucket on
-lines~\lnref{add:b} and~\lnref{add:e}.
+value on \clnref{set}, then adds it to the corresponding bucket on
+\clnref{add:b,add:e}.
 \end{fcvref}
 The \co{hashtab_del()} function simply removes the specified element
 from whatever hash chain it is on, courtesy of the doubly linked
@@ -267,22 +267,22 @@ or modifying this same bucket, for example, by invoking
 \label{lst:datastruct:Hash-Table Allocation and Free}
 \end{listing}
 
-Listing~\ref{lst:datastruct:Hash-Table Allocation and Free}
+\Cref{lst:datastruct:Hash-Table Allocation and Free}
 shows \co{hashtab_alloc()} and \co{hashtab_free()},
 which do hash-table allocation and freeing, respectively.
 \begin{fcvref}[ln:datastruct:hash_bkt:alloc_free:alloc]
 Allocation begins on
 \clnrefrange{alloc:b}{alloc:e} with allocation of the underlying memory.
-If line~\lnref{chk_NULL} detects that memory has been exhausted,
-line~\lnref{ret_NULL} returns
+If \clnref{chk_NULL} detects that memory has been exhausted,
+\clnref{ret_NULL} returns
 \co{NULL} to the caller.
-Otherwise, lines~\lnref{set_nbck} and~\lnref{set_cmp} initialize
+Otherwise, \clnref{set_nbck,set_cmp} initialize
 the number of buckets and the pointer to key-comparison function,
 and the loop
 spanning \clnrefrange{loop:b}{loop:e} initializes the buckets themselves,
 including the chain list header on
-line~\lnref{init_head} and the lock on line~\lnref{init_lock}.
-Finally, line~\lnref{return} returns a pointer to the newly allocated hash table.
+\clnref{init_head} and the lock on \clnref{init_lock}.
+Finally, \clnref{return} returns a pointer to the newly allocated hash table.
 \end{fcvref}
 \begin{fcvref}[ln:datastruct:hash_bkt:alloc_free:free]
 The \co{hashtab_free()} function on
@@ -302,7 +302,7 @@ The \co{hashtab_free()} function on
 The performance results for a single 28-core socket of a 2.1\,GHz
 Intel Xeon system using a bucket-locked hash table
 with 262,144 buckets are shown in
-Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo}.
+\cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo}.
 The performance does scale nearly linearly, but it falls a far short
 of the ideal performance level, even at only 28~CPUs.
 Part of this shortfall is due to the fact that the lock acquisitions and
@@ -317,7 +317,7 @@ on two or more CPUs.
 \end{figure}
 
 And things only get worse with more CPUs, as can be seen in
-Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; 448 CPUs}.
+\cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; 448 CPUs}.
 We do not need to show ideal performance: The performance for 29~CPUs
 and beyond is all too clearly worse than abysmal.
 This clearly underscores the dangers of extrapolating performance from a
@@ -349,7 +349,7 @@ We can test this by increasing the number of hash buckets.
 \end{figure}
 
 However, as can be seen in
-Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets},
+\cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets},
 changing the number of buckets has almost no effect:
 Scalability is still abysmal.
 In particular, we still see a sharp dropoff at 29~CPUs and beyond.
@@ -357,13 +357,13 @@ Clearly something else is going on.
 
 The problem is that this is a multi-socket system, with CPUs~0--27
 and~225--251 mapped to the first socket as shown in
-Figure~\ref{fig:datastruct:NUMA Topology of System Under Test}.
+\cref{fig:datastruct:NUMA Topology of System Under Test}.
 Test runs confined to the first 28~CPUs therefore perform quite
 well, but tests that involve socket~0's CPUs~0--27 as well as
 socket~1's CPU~28 incur the overhead of passing data across
 socket boundaries.
 This can severely degrade performance, as was discussed in
-Section~\ref{sec:cpu:Hardware System Architecture}.
+\cref{sec:cpu:Hardware System Architecture}.
 In short, large multi-socket systems require good locality of reference
 in addition to full partitioning.
 The remainder of this chapter will discuss ways of providing good
@@ -458,7 +458,7 @@ the need for read-side synchronization can degrade performance in
 read-mostly situations.
 However, we can achieve both performance and scalability by using
 RCU, which was introduced in
-Section~\ref{sec:defer:Read-Copy Update (RCU)}.
+\cref{sec:defer:Read-Copy Update (RCU)}.
 Similar results can be achieved using hazard pointers
 (\path{hazptr.c})~\cite{MagedMichael04a}, which will be included in
 the performance results shown in this
@@ -469,17 +469,17 @@ section~\cite{McKenney:2013:SDS:2483852.2483867}.
 
 For an RCU-protected hash table with per-bucket locking,
 updaters use locking as shown in
-Section~\ref{sec:datastruct:Partitionable Data Structures},
+\cref{sec:datastruct:Partitionable Data Structures},
 but readers use RCU\@.
 The data structures remain as shown in
-Listing~\ref{lst:datastruct:Hash-Table Data Structures},
+\cref{lst:datastruct:Hash-Table Data Structures},
 and the \co{HASH2BKT()}, \co{hashtab_lock()}, and \co{hashtab_unlock()}
 functions remain as shown in
-Listing~\ref{lst:datastruct:Hash-Table Mapping and Locking}.
+\cref{lst:datastruct:Hash-Table Mapping and Locking}.
 However, readers use the lighter-weight concurrency-control embodied
 by \co{hashtab_lock_lookup()} and \co{hashtab_unlock_lookup()}
 shown in
-Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.
+\cref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}.
 
 \begin{listing}
 \input{CodeSamples/datastruct/hash/hash_bkt_rcu@lock_unlock.fcv}
@@ -487,11 +487,11 @@ Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Contr
 \label{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control}
 \end{listing}
 
-Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Lookup}
+\Cref{lst:datastruct:RCU-Protected Hash-Table Lookup}
 shows \co{hashtab_lookup()} for the RCU-protected per-bucket-locked
 hash table.
 This is identical to that in
-Listing~\ref{lst:datastruct:Hash-Table Lookup}
+\cref{lst:datastruct:Hash-Table Lookup}
 except that \co{cds_list_for_each_entry()} is replaced
 by \co{cds_list_for_each_entry_rcu()}.
 Both of these primitives traverse the hash chain referenced
@@ -539,11 +539,11 @@ RCU read-side critical section, for example, the caller must invoke
 \label{lst:datastruct:RCU-Protected Hash-Table Modification}
 \end{listing}
 
-Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Modification}
+\Cref{lst:datastruct:RCU-Protected Hash-Table Modification}
 shows \co{hashtab_add()} and \co{hashtab_del()}, both of which
 are quite similar to their counterparts in the non-RCU hash table
 shown in
-Listing~\ref{lst:datastruct:Hash-Table Modification}.
+\cref{lst:datastruct:Hash-Table Modification}.
 The \co{hashtab_add()} function uses \co{cds_list_add_rcu()} instead
 of \co{cds_list_add()} in order to ensure proper ordering when
 an element is added to the hash table at the same time that it is
@@ -569,7 +569,7 @@ freeing or otherwise reusing the memory for the newly deleted element.
 \label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
+\Cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
 shows the read-only performance of RCU-protected and hazard-pointer-protected
 hash tables against the previous section's per-bucket-locked implementation.
 As you can see, both RCU and hazard pointers perform and scale
@@ -587,7 +587,7 @@ RCU does slightly better than hazard pointers.
 \label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo; Linear Scale}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo; Linear Scale}
+\Cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo; Linear Scale}
 shows the same data on a linear scale.
 This drops the global-locking trace into the x-axis, but allows the
 non-ideal performance of RCU and hazard pointers to be more readily
@@ -621,7 +621,7 @@ advantage depends on the workload.
 But why is RCU's performance a factor of five less than ideal?
 One possibility is that the per-thread counters manipulated by
 \co{rcu_read_lock()} and \co{rcu_read_unlock()} are slowing things down.
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR; Linear Scale}
+\Cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR; Linear Scale}
 therefore adds the results for the QSBR variant of RCU, whose read-side
 primitives do nothing.
 And although QSBR does perform slightly better than does RCU, it is still
@@ -634,7 +634,7 @@ about a factor of five short of ideal.
 \label{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 \end{figure}
 
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
+\Cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 adds completely unsynchronized results, which works because this
 is a read-only benchmark with nothing to synchronize.
 Even with no synchronization whatsoever, performance still falls far
@@ -642,12 +642,12 @@ short of ideal.
 
 The problem is that this system has sockets with 28 cores, which have
 the modest cache sizes shown in
-Figure~\ref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
-on page~\pageref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}.
+\cref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}
+on \cpageref{tab:cpu:Cache Geometry for 8-Socket System With Intel Xeon Platinum 8176 CPUs @ 2.10GHz}.
 Each hash bucket (\co{struct ht_bucket}) occupies 56~bytes and each
 element (\co{struct zoo_he}) occupies 72~bytes for the RCU and QSBR runs.
 The benchmark generating
-Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
+\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR and Unsynchronized; Linear Scale}
 used 262,144 buckets and up to 262,144 elements, for a total of
 33,554,448~bytes, which not only overflows the 1,048,576-byte L2 caches
 by more than a factor of thirty, but is also uncomfortably close to the
@@ -681,8 +681,8 @@ to about half again faster than that of either QSBR or RCU\@.
 \QuickQuiz{
 	How can we be so sure that the hash-table size is at fault here,
 	especially given that
-	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
-	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	\cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	on \cpageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
 	shows that varying hash-table size has almost
 	no effect?
 	Might the problem instead be something like false sharing?
@@ -703,7 +703,7 @@ to about half again faster than that of either QSBR or RCU\@.
 
 	Still unconvinced?
 	Then look at the log-log plot in
-	Figure~\ref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
+	\cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schr\"odinger's Zoo at 448 CPUs; Varying Table Size},
 	which shows performance for 448 CPUs as a function of the
 	hash-table size, that is, number of buckets and maximum number
 	of elements.
@@ -719,7 +719,7 @@ to about half again faster than that of either QSBR or RCU\@.
 	This near-ideal performance is consistent with that for the
 	pre-BSD routing table shown in
 	\cref{fig:defer:Pre-BSD Routing Table Protected by RCU}
-	on page~\pageref{fig:defer:Pre-BSD Routing Table Protected by RCU},
+	on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU},
 	even at 448 CPUs.
 	However, the performance drops significantly (this is a log-log
 	plot) at about 8,000~elements, which is where the 1,048,576-byte
@@ -734,8 +734,8 @@ to about half again faster than that of either QSBR or RCU\@.
 	a factor of 25.
 
 	The reason that
-	Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
-	on page~\pageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	\cref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
+	on \cpageref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo; Varying Buckets}
 	shows little effect is that its data was gathered from
 	bucket-locked hash tables, where locking overhead and contention
 	drowned out cache-capacity effects.
@@ -757,7 +757,7 @@ to about half again faster than that of either QSBR or RCU\@.
 
 What if the memory footprint is reduced still further?
 \Cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR}
-on page~\pageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
+on \cpageref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head}
 shows that RCU attains very nearly ideal performance on the much smaller
 data structure represented by the pre-BSD routing table.
 
@@ -799,7 +799,7 @@ data structure represented by the pre-BSD routing table.
 As noted earlier, Schr\"odinger is surprised by the popularity of his
 cat~\cite{ErwinSchroedinger1935Cat}, but recognizes the need to reflect
 this popularity in his design.
-Figure~\ref{fig:datastruct:Read-Side Cat-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo at 64 CPUs}
+\Cref{fig:datastruct:Read-Side Cat-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo at 64 CPUs}
 shows the results of 64-CPU runs, varying the number of CPUs that are
 doing nothing but looking up the cat.
 Both RCU and hazard pointers respond well to this challenge, but bucket
@@ -830,7 +830,7 @@ in point.
 
 If we were only ever going to read the data, we would not need any
 concurrency control to begin with.
-Figure~\ref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
+\Cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
 therefore shows the effect of updates on readers.
 At the extreme left-hand side of this graph, all but one of the CPUs
 are doing lookups, while to the right all 448 CPUs are doing updates.
@@ -854,9 +854,9 @@ execution, greatly reducing memory-barrier overhead in the read-only case.
 \end{figure}
 
 Where
-Figure~\ref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
+\cref{fig:datastruct:Read-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo in the Presence of Updates}
 showed the effect of increasing update rates on lookups,
-Figure~\ref{fig:datastruct:Update-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
+\cref{fig:datastruct:Update-Side RCU-Protected Hash-Table Performance For Schroedinger's Zoo}
 shows the effect of increasing update rates on the updates themselves.
 Again, at the left-hand side of the figure all but one of the CPUs are
 doing lookups and at the right-hand side of the figure all 448 CPUs are
@@ -885,7 +885,7 @@ not recommended for production use.
 \QuickQuiz{
 	The dangers of extrapolating from 28 CPUs to 448 CPUs was
 	made quite clear in
-	Section~\ref{sec:datastruct:Hash-Table Performance}.
+	\cref{sec:datastruct:Hash-Table Performance}.
 	But why should extrapolating up from 448 CPUs be any safer?
 }\QuickQuizAnswer{
 	In theory, it isn't any safer, and a useful exercise would be
@@ -943,7 +943,7 @@ minute.
 In this case, the two veterinarians would disagree on the state of the
 cat for the second period of thirty seconds following the last heartbeat,
 as fancifully depicted in
-Figure~\ref{fig:datastruct:Even Veterinarians Disagree}.
+\cref{fig:datastruct:Even Veterinarians Disagree}.
 
 \pplsur{Weiner}{Heisenberg} taught us to live with this sort of
 uncertainty~\cite{WeinerHeisenberg1927Uncertain}, which is a good
@@ -959,9 +959,9 @@ Furthermore, most computing systems are intended to interact with
 the outside world.
 Consistency with the outside world is therefore of paramount importance.
 However, as we saw in
-Figure~\ref{fig:defer:Response Time of RCU vs. Reader-Writer Locking}
+\cref{fig:defer:Response Time of RCU vs. Reader-Writer Locking}
 on
-page~\pageref{fig:defer:Response Time of RCU vs. Reader-Writer Locking},
+\cpageref{fig:defer:Response Time of RCU vs. Reader-Writer Locking},
 increased internal consistency can come at the expense of degraded
 external consistency.
 Techniques such as RCU and hazard pointers give up some degree of
@@ -990,7 +990,7 @@ or all of the above.
 Fixed-size hash tables are perfectly partitionable, but resizable hash
 tables pose partitioning challenges when growing or shrinking, as
 fancifully depicted in
-Figure~\ref{fig:datastruct:Partitioning Problems}.
+\cref{fig:datastruct:Partitioning Problems}.
 However, it turns out that it is possible to construct high-performance
 scalable RCU-protected hash tables, as described in the following sections.
 
@@ -1004,7 +1004,7 @@ The first (and simplest) was developed for the Linux kernel by
 \ppl{Herbert}{Xu}~\cite{HerbertXu2010RCUResizeHash}, and is described in the
 following sections.
 The other two are covered briefly in
-Section~\ref{sec:datastruct:Other Resizable Hash Tables}.
+\cref{sec:datastruct:Other Resizable Hash Tables}.
 
 The key insight behind the first hash-table implementation is that
 each data element can have two sets of list pointers, with one set
@@ -1073,7 +1073,7 @@ which is the subject of the next section.
 Resizing is accomplished by the classic approach of inserting a level
 of indirection, in this case, the \co{ht} structure shown on
 \clnrefrange{ht:b}{ht:e} of
-Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures}
+\cref{lst:datastruct:Resizable Hash-Table Data Structures}
 (\path{hash_resize.c}).
 The \co{hashtab} structure shown on
 \clnrefrange{hashtab:b}{hashtab:e} contains only a
@@ -1092,17 +1092,17 @@ we should be able to make good use of RCU\@.
 \end{listing}
 
 The \co{ht} structure represents a specific size of the hash table,
-as specified by the \co{->ht_nbuckets} field on line~\lnref{ht:nbuckets}.
+as specified by the \co{->ht_nbuckets} field on \clnref{ht:nbuckets}.
 The size is stored in the same structure containing the array of
 buckets (\co{->ht_bkt[]} on
-line~\lnref{ht:bkt}) in order to avoid mismatches between
+\clnref{ht:bkt}) in order to avoid mismatches between
 the size and the array.
 The \co{->ht_resize_cur} field on
-line~\lnref{ht:resize_cur} is equal to $-1$ unless a resize
+\clnref{ht:resize_cur} is equal to $-1$ unless a resize
 operation
 is in progress, in which case it indicates the index of the bucket whose
 elements are being inserted into the new hash table, which is referenced
-by the \co{->ht_new} field on line~\lnref{ht:new}.
+by the \co{->ht_new} field on \clnref{ht:new}.
 If there is no resize operation in progress, \co{->ht_new} is \co{NULL}.
 Thus, a resize operation proceeds by allocating a new \co{ht} structure
 and referencing it via the \co{->ht_new} pointer, then advancing
@@ -1113,10 +1113,10 @@ Once all old readers have completed, the old hash table's \co{ht} structure
 may be freed.
 
 The \co{->ht_idx} field on
-line~\lnref{ht:idx} indicates which of the two sets of
+\clnref{ht:idx} indicates which of the two sets of
 list pointers are being used by this instantiation of the hash table,
 and is used to index the \co{->hte_next[]} array in the \co{ht_elem}
-structure on line~\lnref{ht_elem:next}.
+structure on \clnref{ht_elem:next}.
 
 The \co{->ht_cmp()}, \co{->ht_gethash()}, and \co{->ht_getkey()} fields on
 \clnrefrange{ht:cmp}{ht:getkey}
@@ -1158,7 +1158,7 @@ the old table.
 
 \begin{fcvref}[ln:datastruct:hash_resize:get_bucket]
 Bucket selection is shown in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection},
+\cref{lst:datastruct:Resizable Hash-Table Bucket Selection},
 which shows \co{ht_get_bucket()} on
 \clnrefrange{single:b}{single:e} and \co{ht_search_bucket()} on
 \clnrefrange{hsb:b}{hsb:e}.
@@ -1167,26 +1167,26 @@ corresponding to the specified key in the specified hash table, without
 making any allowances for resizing.
 It also stores the bucket index corresponding to the key into the location
 referenced by parameter~\co{b} on
-line~\lnref{single:gethash}, and the corresponding
+\clnref{single:gethash}, and the corresponding
 hash value corresponding to the key into the location
-referenced by parameter~\co{h} (if non-\co{NULL}) on line~\lnref{single:h}.
-Line~\lnref{single:return} then returns a reference to the corresponding bucket.
+referenced by parameter~\co{h} (if non-\co{NULL}) on \clnref{single:h}.
+\Clnref{single:return} then returns a reference to the corresponding bucket.
 
 The \co{ht_search_bucket()} function searches for the specified key
 within the specified hash-table version.
-Line~\lnref{hsb:get_curbkt} obtains a reference to the bucket corresponding
+\Clnref{hsb:get_curbkt} obtains a reference to the bucket corresponding
 to the specified key.
 The loop spanning \clnrefrange{hsb:loop:b}{hsb:loop:e} searches
-that bucket, so that if line~\lnref{hsb:match} detects a match,
-line~\lnref{hsb:ret_match} returns a pointer to the enclosing data element.
+that bucket, so that if \clnref{hsb:match} detects a match,
+\clnref{hsb:ret_match} returns a pointer to the enclosing data element.
 Otherwise, if there is no match,
-line~\lnref{hsb:ret_NULL} returns \co{NULL} to indicate
+\clnref{hsb:ret_NULL} returns \co{NULL} to indicate
 failure.
 \end{fcvref}
 
 \QuickQuiz{
 	How does the code in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Bucket Selection}
+	\cref{lst:datastruct:Resizable Hash-Table Bucket Selection}
 	protect against the resizing process progressing past the
 	selected bucket?
 }\QuickQuizAnswer{
@@ -1206,33 +1206,33 @@ operation.
 \end{listing}
 
 Read-side concurrency control is provided by RCU as was shown in
-Listing~\ref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control},
+\cref{lst:datastruct:RCU-Protected Hash-Table Read-Side Concurrency Control},
 but the update-side concurrency\-/control functions
 \co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()}
 must now deal with the possibility of a
 concurrent resize operation as shown in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
+\cref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency Control}.
 
 \begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod:l]
 The \co{hashtab_lock_mod()} spans
 \clnrefrange{b}{e} in the listing.
-Line~\lnref{rcu_lock} enters an RCU read-side critical section to prevent
+\Clnref{rcu_lock} enters an RCU read-side critical section to prevent
 the data structures from being freed during the traversal,
-line~\lnref{refhashtbl} acquires a reference to the current hash table, and then
-line~\lnref{refbucket} obtains a reference to the bucket in this hash table
+\clnref{refhashtbl} acquires a reference to the current hash table, and then
+\clnref{refbucket} obtains a reference to the bucket in this hash table
 corresponding to the key.
-Line~\lnref{acq_bucket} acquires that bucket's lock, which will prevent any concurrent
+\Clnref{acq_bucket} acquires that bucket's lock, which will prevent any concurrent
 resizing operation from distributing that bucket, though of course it
 will have no effect if that bucket has already been distributed.
 \Clnrefrange{lsp0b}{lsp0e} store the bucket pointer and
 pointer-set index into their respective fields in the
 \co{ht_lock_state} structure, which communicates the information to
 \co{hashtab_add()}, \co{hashtab_del()}, and \co{hashtab_unlock_mod()}.
-Line~\lnref{ifresized} then checks to see if a concurrent resize
+\Clnref{ifresized} then checks to see if a concurrent resize
 operation has already distributed this bucket across the new hash table,
-and if not, line~\lnref{lsp1_1} indicates that there is no
+and if not, \clnref{lsp1_1} indicates that there is no
 already-resized hash bucket and
-line~\lnref{fastret1} returns with the selected hash bucket's
+\clnref{fastret1} returns with the selected hash bucket's
 lock held (thus preventing a concurrent resize operation from distributing
 this bucket) and also within an RCU read-side critical section.
 \IX{Deadlock} is avoided because the old table's locks are always acquired
@@ -1241,9 +1241,9 @@ than two versions from existing at a given time, thus preventing a
 deadlock cycle.
 
 Otherwise, a concurrent resize operation has already distributed this
-bucket, so line~\lnref{new_hashtbl} proceeds to the new hash table,
-line~\lnref{get_newbkt} selects the bucket corresponding to the key,
-and line~\lnref{acq_newbkt} acquires the bucket's lock.
+bucket, so \clnref{new_hashtbl} proceeds to the new hash table,
+\clnref{get_newbkt} selects the bucket corresponding to the key,
+and \clnref{acq_newbkt} acquires the bucket's lock.
 \Clnrefrange{lsp1b}{lsp1e} store the bucket pointer and
 pointer-set index into their respective fields in the
 \co{ht_lock_state} structure, which again communicates this information to
@@ -1262,11 +1262,11 @@ section.
 \begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod:ul]
 The \co{hashtab_unlock_mod()} function releases the lock(s) acquired by
 \co{hashtab_lock_mod()}.
-Line~\lnref{relbkt0} releases the lock on the old \co{ht_bucket} structure.
-In the unlikely event that line~\lnref{ifbkt1} determines that a resize
-operation is in progress, line~\lnref{relbkt1} releases the lock on the
+\Clnref{relbkt0} releases the lock on the old \co{ht_bucket} structure.
+In the unlikely event that \clnref{ifbkt1} determines that a resize
+operation is in progress, \clnref{relbkt1} releases the lock on the
 new \co{ht_bucket} structure.
-Either way, line~\lnref{rcu_unlock} exits the RCU read-side critical
+Either way, \clnref{rcu_unlock} exits the RCU read-side critical
 section.
 \end{fcvref}
 
@@ -1298,23 +1298,23 @@ Now that we have bucket selection and concurrency control in place,
 we are ready to search and update our resizable hash table.
 The \co{hashtab_lookup()}, \co{hashtab_add()}, and \co{hashtab_del()}
 functions are shown in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}.
+\cref{lst:datastruct:Resizable Hash-Table Access Functions}.
 
 \begin{fcvref}[ln:datastruct:hash_resize:access:lkp]
 The \co{hashtab_lookup()} function on
 \clnrefrange{b}{e} of the listing does
 hash lookups.
-Line~\lnref{get_curtbl} fetches the current hash table and
-line~\lnref{get_curbkt} searches the bucket corresponding to the
+\Clnref{get_curtbl} fetches the current hash table and
+\clnref{get_curbkt} searches the bucket corresponding to the
 specified key.
-Line~\lnref{ret} returns a pointer to the searched-for element
+\Clnref{ret} returns a pointer to the searched-for element
 or \co{NULL} when the search fails.
 The caller must be within an RCU read-side critical section.
 \end{fcvref}
 
 \QuickQuiz{
 	The \co{hashtab_lookup()} function in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
+	\cref{lst:datastruct:Resizable Hash-Table Access Functions}
 	ignores concurrent resize operations.
 	Doesn't this mean that readers might miss an element that was
 	previously added during a resize operation?
@@ -1329,12 +1329,12 @@ The caller must be within an RCU read-side critical section.
 \begin{fcvref}[ln:datastruct:hash_resize:access:add]
 The \co{hashtab_add()} function on \clnrefrange{b}{e} of the listing adds
 new data elements to the hash table.
-Line~\lnref{htbp} picks up the current \co{ht_bucket} structure into which the
-new element is to be added, and line~\lnref{i} picks up the index of
+\Clnref{htbp} picks up the current \co{ht_bucket} structure into which the
+new element is to be added, and \clnref{i} picks up the index of
 the pointer pair.
-Line~\lnref{add} adds the new element to the current hash bucket.
-If line~\lnref{ifnew} determines that this bucket has been distributed
-to a new version of the hash table, then line~\lnref{addnew} also adds the
+\Clnref{add} adds the new element to the current hash bucket.
+If \clnref{ifnew} determines that this bucket has been distributed
+to a new version of the hash table, then \clnref{addnew} also adds the
 new element to the corresponding new bucket.
 The caller is required to handle concurrency, for example, by invoking
 \co{hashtab_lock_mod()} before the call to \co{hashtab_add()} and invoking
@@ -1345,10 +1345,10 @@ The caller is required to handle concurrency, for example, by invoking
 The \co{hashtab_del()} function on
 \clnrefrange{b}{e} of the listing removes
 an existing element from the hash table.
-Line~\lnref{i} picks up the index of the pointer pair
-and line~\lnref{del} removes the specified element from the current table.
-If line~\lnref{ifnew} determines that this bucket has been distributed
-to a new version of the hash table, then line~\lnref{delnew} also removes
+\Clnref{i} picks up the index of the pointer pair
+and \clnref{del} removes the specified element from the current table.
+If \clnref{ifnew} determines that this bucket has been distributed
+to a new version of the hash table, then \clnref{delnew} also removes
 the specified element from the corresponding new bucket.
 As with \co{hashtab_add()}, the caller is responsible for concurrency
 control and this concurrency control suffices for synchronizing with
@@ -1357,7 +1357,7 @@ a concurrent resize operation.
 
 \QuickQuiz{
 	The \co{hashtab_add()} and \co{hashtab_del()} functions in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Access Functions}
+	\cref{lst:datastruct:Resizable Hash-Table Access Functions}
 	can update two hash buckets while a resize operation is progressing.
 	This might cause poor performance if the frequency of resize operation
 	is not negligible.
@@ -1366,8 +1366,8 @@ a concurrent resize operation.
 	Yes, at least assuming that a slight increase in the cost of
 	\co{hashtab_lookup()} is acceptable.
 	One approach is shown in
-	Listings~\ref{lst:datastruct:Resizable Hash-Table Access Functions (Fewer Updates)}
-	and~\ref{lst:datastruct:Resizable Hash-Table Update-Side Locking Function (Fewer Updates)}
+	\cref{lst:datastruct:Resizable Hash-Table Access Functions (Fewer Updates),%
+	lst:datastruct:Resizable Hash-Table Update-Side Locking Function (Fewer Updates)}
 	(\path{hash_resize_s.c}).
 
 \begin{listing}
@@ -1407,42 +1407,42 @@ a concurrent resize operation.
 
 \begin{fcvref}[ln:datastruct:hash_resize:resize]
 The actual resizing itself is carried out by \co{hashtab_resize}, shown in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing} on
-page~\pageref{lst:datastruct:Resizable Hash-Table Resizing}.
-Line~\lnref{trylock} conditionally acquires the top-level \co{->ht_lock}, and if
-this acquisition fails, line~\lnref{ret_busy} returns \co{-EBUSY} to indicate that
+\cref{lst:datastruct:Resizable Hash-Table Resizing} on
+\cpageref{lst:datastruct:Resizable Hash-Table Resizing}.
+\Clnref{trylock} conditionally acquires the top-level \co{->ht_lock}, and if
+this acquisition fails, \clnref{ret_busy} returns \co{-EBUSY} to indicate that
 a resize is already in progress.
-Otherwise, line~\lnref{get_curtbl} picks up a reference to the current hash table,
+Otherwise, \clnref{get_curtbl} picks up a reference to the current hash table,
 and \clnrefrange{alloc:b}{alloc:e} allocate a new hash table of the desired size.
 If a new set of hash/key functions have been specified, these are
 used for the new table, otherwise those of the old table are preserved.
-If line~\lnref{chk_nomem} detects memory-allocation failure,
-line~\lnref{rel_nomem} releases \co{->ht_lock}
-and line~\lnref{ret_nomem} returns a failure indication.
+If \clnref{chk_nomem} detects memory-allocation failure,
+\clnref{rel_nomem} releases \co{->ht_lock}
+and \clnref{ret_nomem} returns a failure indication.
 
-Line~\lnref{get_curidx} picks up the current table's index and
-line~\lnref{put_curidx} stores its inverse to
+\Clnref{get_curidx} picks up the current table's index and
+\clnref{put_curidx} stores its inverse to
 the new hash table, thus ensuring that the two hash tables avoid overwriting
 each other's linked lists.
-Line~\lnref{set_newtbl} then starts the bucket-distribution process by
+\Clnref{set_newtbl} then starts the bucket-distribution process by
 installing a reference to the new table into the \co{->ht_new} field of
 the old table.
-Line~\lnref{sync_rcu} ensures that all readers who are not aware of the
+\Clnref{sync_rcu} ensures that all readers who are not aware of the
 new table complete before the resize operation continues.
 
 Each pass through the loop spanning \clnrefrange{loop:b}{loop:e} distributes the contents
 of one of the old hash table's buckets into the new hash table.
-Line~\lnref{get_oldcur} picks up a reference to the old table's current bucket
-and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
+\Clnref{get_oldcur} picks up a reference to the old table's current bucket
+and \clnref{acq_oldcur} acquires that bucket's spinlock.
 \end{fcvref}
 
 \QuickQuiz{
 	\begin{fcvref}[ln:datastruct:hash_resize:resize]
 	In the \co{hashtab_resize()} function in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing},
-	what guarantees that the update to \co{->ht_new} on line~\lnref{set_newtbl}
+	\cref{lst:datastruct:Resizable Hash-Table Resizing},
+	what guarantees that the update to \co{->ht_new} on \clnref{set_newtbl}
 	will be seen as happening before the update to \co{->ht_resize_cur}
-	on line~\lnref{update_resize} from the perspective of
+	on \clnref{update_resize} from the perspective of
 	\co{hashtab_add()} and \co{hashtab_del()}?
 	In other words, what prevents \co{hashtab_add()}
 	and \co{hashtab_del()} from dereferencing
@@ -1450,12 +1450,12 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:datastruct:hash_resize:resize]
-	The \co{synchronize_rcu()} on line~\lnref{sync_rcu} of
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}
+	The \co{synchronize_rcu()} on \clnref{sync_rcu} of
+	\cref{lst:datastruct:Resizable Hash-Table Resizing}
 	ensures that all pre-existing RCU readers have completed between
 	the time that we install the new hash-table reference on
-	line~\lnref{set_newtbl} and the time that we update \co{->ht_resize_cur} on
-	line~\lnref{update_resize}.
+	\clnref{set_newtbl} and the time that we update \co{->ht_resize_cur} on
+	\clnref{update_resize}.
 	This means that any reader that sees a non-negative value
 	of \co{->ht_resize_cur} cannot have started before the
 	assignment to \co{->ht_new}, and thus must be able to see
@@ -1465,7 +1465,7 @@ and line~\lnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_del()} functions must be enclosed
 	in RCU read-side critical sections, courtesy of
 	\co{hashtab_lock_mod()} and \co{hashtab_unlock_mod()} in
-	Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
+	\cref{lst:datastruct:Resizable Hash-Table Update-Side Concurrency
 	Control}.
 	\end{fcvref}
 }\QuickQuizEnd
@@ -1475,30 +1475,30 @@ Each pass through the loop spanning
 \clnrefrange{loop_list:b}{loop_list:e} adds one data element
 from the current old-table bucket to the corresponding new-table bucket,
 holding the new-table bucket's lock during the add operation.
-Line~\lnref{update_resize} updates
+\Clnref{update_resize} updates
 \co{->ht_resize_cur} to indicate that this bucket has been distributed.
-Finally, line~\lnref{rel_oldcur} releases the old-table bucket lock.
+Finally, \clnref{rel_oldcur} releases the old-table bucket lock.
 
-Execution reaches line~\lnref{rcu_assign} once all old-table buckets have been distributed
+Execution reaches \clnref{rcu_assign} once all old-table buckets have been distributed
 across the new table.
-Line~\lnref{rcu_assign} installs the newly created table as the current one, and
-line~\lnref{sync_rcu_2} waits for all old readers (who might still be referencing
+\Clnref{rcu_assign} installs the newly created table as the current one, and
+\clnref{sync_rcu_2} waits for all old readers (who might still be referencing
 the old table) to complete.
-Then line~\lnref{rel_master} releases the resize-serialization lock,
-line~\lnref{free} frees
-the old hash table, and finally line~\lnref{ret_success} returns success.
+Then \clnref{rel_master} releases the resize-serialization lock,
+\clnref{free} frees
+the old hash table, and finally \clnref{ret_success} returns success.
 \end{fcvref}
 
 \QuickQuiz{
 	\begin{fcvref}[ln:datastruct:hash_resize:resize]
-	Why is there a \co{WRITE_ONCE()} on line~\lnref{update_resize}
-	in Listing~\ref{lst:datastruct:Resizable Hash-Table Resizing}?
+	Why is there a \co{WRITE_ONCE()} on \clnref{update_resize}
+	in \cref{lst:datastruct:Resizable Hash-Table Resizing}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:datastruct:hash_resize:lock_unlock_mod]
 	Together with the \co{READ_ONCE()}
-	on line~\lnref{l:ifresized} in \co{hashtab_lock_mod()}
-	of Listing~\ref{lst:datastruct:Resizable Hash-Table Update-Side
+	on \clnref{l:ifresized} in \co{hashtab_lock_mod()}
+	of \cref{lst:datastruct:Resizable Hash-Table Update-Side
 	Concurrency Control},
 	it tells the compiler that the non-initialization accesses
 	to \co{->ht_resize_cur} must remain because reads
@@ -1518,7 +1518,7 @@ the old hash table, and finally line~\lnref{ret_success} returns success.
 \end{figure}
 % Data from CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a
 
-Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
+\Cref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
 compares resizing hash tables to their fixed-sized counterparts
 for 262,144 and 2,097,152 elements in the hash table.
 The figure shows three traces for each element count, one
@@ -1549,7 +1549,7 @@ can only be expected to produce a sharp decrease in performance,
 as in fact is shown in the graph.
 But worse yet, the hash-table elements occupy 128\,MB, which overflows
 each socket's 39\,MB L3 cache, with performance consequences analogous
-to those described in Section~\ref{sec:cpu:Costs of Operations}.
+to those described in \cref{sec:cpu:Costs of Operations}.
 The resulting cache overflow means that the memory system is involved
 even for a read-only benchmark, and as you can see from the sublinear
 portions of the lower three traces, the memory system can be a serious
@@ -1558,7 +1558,7 @@ bottleneck.
 \QuickQuiz{
 	How much of the difference in performance between the large and
 	small hash tables shown in
-	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
+	\cref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
 	was due to long hash chains and how much was due to
 	memory-system bottlenecks?
 }\QuickQuizAnswer{
@@ -1579,8 +1579,8 @@ bottleneck.
 	the middle of
 	\cref{fig:datastruct:Effect of Memory-System Bottlenecks on Hash Tables}.
 	The other six traces are identical to their counterparts in
-	Figure~\ref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
-	on page~\pageref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}.
+	\cref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}
+	on \cpageref{fig:datastruct:Overhead of Resizing Hash Tables Between 262;144 and 524;288 Buckets vs. Total Number of Elements}.
 	The gap between this new trace and the lower set of three
 	traces is a rough measure of how much of the difference in
 	performance was due to hash-chain length, and the gap between
@@ -1621,7 +1621,7 @@ bottleneck.
 }\QuickQuizEnd
 
 Referring to the last column of
-Table~\ref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz},
+\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz},
 we recall that the first 28~CPUs are in the first socket, on a
 one-CPU-per-core basis, which explains the sharp decrease in performance
 of the resizable hash table beyond 28~CPUs.
@@ -1690,7 +1690,7 @@ extraneous data element due to key mismatches.
 
 The process of shrinking a relativistic hash table by a factor of two
 is shown in
-Figure~\ref{fig:datastruct:Shrinking a Relativistic Hash Table},
+\cref{fig:datastruct:Shrinking a Relativistic Hash Table},
 in this case shrinking a two-bucket hash table into a one-bucket
 hash table, otherwise known as a linear list.
 This process works by coalescing pairs of buckets in the old larger hash
@@ -1746,7 +1746,7 @@ state~(f).
 
 Growing a relativistic hash table reverses the shrinking process,
 but requires more grace-period steps, as shown in
-Figure~\ref{fig:datastruct:Growing a Relativistic Hash Table}.
+\cref{fig:datastruct:Growing a Relativistic Hash Table}.
 The initial state~(a) is at the top of this figure, with time advancing
 from top to bottom.
 
@@ -1814,12 +1814,12 @@ library~\cite{MathieuDesnoyers2009URCU}.
 
 The preceding sections have focused on data structures that enhance
 concurrency due to partitionability
-(Section~\ref{sec:datastruct:Partitionable Data Structures}),
+(\cref{sec:datastruct:Partitionable Data Structures}),
 efficient handling of read-mostly access patterns
-(Section~\ref{sec:datastruct:Read-Mostly Data Structures}),
+(\cref{sec:datastruct:Read-Mostly Data Structures}),
 or application of read-mostly techniques to avoid
 non-partitionability
-(Section~\ref{sec:datastruct:Non-Partitionable Data Structures}).
+(\cref{sec:datastruct:Non-Partitionable Data Structures}).
 This section gives a brief review of other data structures.
 
 One of the hash table's greatest advantages for parallel use is that it
@@ -1870,7 +1870,7 @@ represents an early academic use of a technique resembling
 RCU~\cite{Pugh90}.
 
 Concurrent double-ended queues were discussed in
-Section~\ref{sec:SMPdesign:Double-Ended Queue},
+\cref{sec:SMPdesign:Double-Ended Queue},
 and concurrent stacks and queues have a long history~\cite{Treiber86},
 though not normally the most impressive performance or scalability.
 They are nevertheless a common feature of concurrent
@@ -1907,7 +1907,7 @@ alone to the set of CPU families in common use today.
 \label{sec:datastruct:Specialization}
 
 The resizable hash table presented in
-Section~\ref{sec:datastruct:Non-Partitionable Data Structures}
+\cref{sec:datastruct:Non-Partitionable Data Structures}
 used an opaque type for the key.
 This allows great flexibility, permitting any sort of key to be
 used, but it also incurs significant overhead due to the calls via
@@ -1924,8 +1924,8 @@ This overhead can be eliminated by specializing a hash-table implementation
 to a given key type and hash function, for example, by using C++ templates.
 Doing so eliminates the \co{->ht_cmp()}, \co{->ht_gethash()}, and
 \co{->ht_getkey()} function pointers in the \co{ht} structure shown in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures} on
-page~\pageref{lst:datastruct:Resizable Hash-Table Data Structures}.
+\cref{lst:datastruct:Resizable Hash-Table Data Structures} on
+\cpageref{lst:datastruct:Resizable Hash-Table Data Structures}.
 It also eliminates the corresponding calls through these pointers,
 which could allow the compiler to inline the resulting fixed functions,
 eliminating not only the overhead of the call instruction, but the
@@ -1980,8 +1980,8 @@ days of four-kilobyte address spaces.
 The hash tables discussed in this chapter made almost no attempt to conserve
 memory.
 For example, the \co{->ht_idx} field in the \co{ht} structure in
-Listing~\ref{lst:datastruct:Resizable Hash-Table Data Structures} on
-page~\pageref{lst:datastruct:Resizable Hash-Table Data Structures}
+\cref{lst:datastruct:Resizable Hash-Table Data Structures} on
+\cpageref{lst:datastruct:Resizable Hash-Table Data Structures}
 always has a value of either zero or one, yet takes up a full 32 bits
 of memory.
 It could be eliminated, for example, by stealing a bit from the
@@ -2023,11 +2023,11 @@ Despite these disadvantages, bit-spinlocks are extremely useful when
 memory is at a premium.
 
 One aspect of the second opportunity was covered in
-Section~\ref{sec:datastruct:Other Resizable Hash Tables},
+\cref{sec:datastruct:Other Resizable Hash Tables},
 which presented resizable hash tables that require only one
 set of bucket-list pointers in place of the pair of sets required
 by the resizable hash table presented in
-Section~\ref{sec:datastruct:Non-Partitionable Data Structures}.
+\cref{sec:datastruct:Non-Partitionable Data Structures}.
 Another approach would be to use singly linked bucket lists in
 place of the doubly linked lists used in this chapter.
 One downside of this approach is that deletion would then require
@@ -2052,7 +2052,7 @@ Modern computers typically move data between CPUs and main memory in
 fixed-sized blocks that range in size from 32 bytes to 256 bytes.
 These blocks are called \emph{\IXpl{cache line}}, and are extremely important
 to high performance and scalability, as was discussed in
-Section~\ref{sec:cpu:Overheads}.
+\cref{sec:cpu:Overheads}.
 One timeworn way to kill both performance and scalability is to
 place incompatible variables into the same cacheline.
 For example, suppose that a resizable hash table data element had
@@ -2076,7 +2076,7 @@ struct hash_elem {
 \end{listing}
 
 One way to solve this problem on systems with 64-byte cache line is shown in
-Listing~\ref{lst:datastruct:Alignment for 64-Byte Cache Lines}.
+\cref{lst:datastruct:Alignment for 64-Byte Cache Lines}.
 Here \GCC's \co{aligned} attribute is used to force the \co{->counter}
 and the \co{ht_elem} structure into separate cache lines.
 This would allow CPUs to traverse the hash bucket list at full speed
@@ -2120,10 +2120,10 @@ cache geometry:
 	or task.
 	We saw several very effective examples of this rule of thumb
 	in the counter implementations in
-	Chapter~\ref{chp:Counting}.
+	\cref{chp:Counting}.
 \item	Going one step further, partition your data on a per-CPU,
 	per-thread, or per-task basis, as was discussed in
-	Chapter~\ref{chp:Data Ownership}.
+	\cref{chp:Data Ownership}.
 \end{enumerate}
 
 There has been some work towards automated trace-based rearrangement
@@ -2167,7 +2167,7 @@ to a given situation.
 
 This chapter has focused primarily on hash tables, including resizable
 hash tables, which are not fully partitionable.
-Section~\ref{sec:datastruct:Other Data Structures} gave a quick
+\Cref{sec:datastruct:Other Data Structures} gave a quick
 overview of a few non-hash-table data structures.
 Nevertheless, this exposition of hash tables is an excellent introduction
 to the many issues surrounding high-performance scalable data access,
-- 
2.17.1


