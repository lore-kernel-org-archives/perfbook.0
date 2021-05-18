Return-Path: <SRS0=cX2R=KN=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gQmMm9ir1Ct/CmrrcJjiUcDFMqCECLUzknhd9Pve/4s=;
        b=a9McFBWhOcDMkMlsDmnHss5bSduryFZOYV1o6CTN5+aejBit8++9AzBWJ0yZvYDol0
         0reW2o+H36lAIBw/WwBIDNeLezkPX0nawn86PRLBf8W81mhXakbjA9bwTVmRopJkL+wQ
         Ls2Jbh/accorJqcRO+KAxMGBl7nws1N8tZXMEUc1Iv75WZH5lD7AfKJCs+Y5WB7tDo3U
         aLnJUfoLGZExKd8an0tN3XvSVzG1KbB5fZOi3x78NNj2uSprUtVqfhpMrrqSJAqNa8o5
         fh6TdphXvgfzyp/Mo1QcoGqVk8NUB4ZwzXMPsLGtFkE/zu98xyfghRw5/zlcYEC4sM08
         Fu4A==
Subject: [PATCH -perfbook 3/8] defer: Employ \cref{} and its variants, take
 three
References: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <29129dd4-617b-69e6-80ba-73a51ea5e79e@gmail.com>
Date: Tue, 18 May 2021 21:20:06 +0900
MIME-Version: 1.0
In-Reply-To: <9362d274-fae3-278b-348e-88a0f30f120b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Also fix indent by white spaces.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex        |  90 ++++++++++----------
 defer/rcuexercises.tex  |  12 +--
 defer/rcuintro.tex      |   2 +-
 defer/rcurelated.tex    |  10 +--
 defer/rcuusage.tex      | 181 ++++++++++++++++++++--------------------
 defer/updates.tex       |   4 +-
 defer/whichtochoose.tex |  18 ++--
 7 files changed, 158 insertions(+), 159 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index a7de666c..1554463d 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -9,23 +9,23 @@
 This section looks at RCU from the viewpoint of its Linux-kernel API\@.\footnote{
 	Userspace RCU's API is documented
 	elsewhere~\cite{PaulMcKenney2013LWNURCU}.}
-Section~\ref{sec:defer:RCU has a Family of Wait-to-Finish APIs}
+\Cref{sec:defer:RCU has a Family of Wait-to-Finish APIs}
 presents RCU's wait-to-finish APIs,
-Section~\ref{sec:defer:RCU has Publish-Subscribe and Version-Maintenance APIs}
+\cref{sec:defer:RCU has Publish-Subscribe and Version-Maintenance APIs}
 presents RCU's publish-subscribe and version-maintenance APIs,
-Section~\ref{sec:defer:RCU has List-Processing APIs}
+\cref{sec:defer:RCU has List-Processing APIs}
 presents RCU's list-processing APIs,
-Section~\ref{sec:defer:RCU Has Diagnostic APIs}
+\cref{sec:defer:RCU Has Diagnostic APIs}
 presents RCU's diagnostic APIs, and
-Section~\ref{sec:defer:Where Can RCU's APIs Be Used?}
+\cref{sec:defer:Where Can RCU's APIs Be Used?}
 describes in which contexts RCU's various APIs may be used.
 Finally,
-Section~\ref{sec:defer:So; What is RCU Really?}
+\cref{sec:defer:So; What is RCU Really?}
 presents concluding remarks.
 
 Readers who are not excited about kernel internals may wish to skip
 ahead to \cref{sec:defer:RCU Usage}
-on page~\pageref{sec:defer:RCU Usage}.
+on \cpageref{sec:defer:RCU Usage}.
 
 \subsubsection{RCU has a Family of Wait-to-Finish APIs}
 \label{sec:defer:RCU has a Family of Wait-to-Finish APIs}
@@ -34,11 +34,11 @@ The most straightforward answer to ``what is RCU'' is that RCU is
 an API\@.
 For example, the RCU implementation used in the Linux kernel is
 summarized by
-Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
+\cref{tab:defer:RCU Wait-to-Finish APIs},
 which shows the wait-for-readers portions of the RCU, ``sleepable'' RCU
 (SRCU), Tasks RCU, and generic APIs, respectively,
 and by
-Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
+\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
 which shows the publish-subscribe portions of the
 API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 	This citation covers v4.20 and later.
@@ -152,7 +152,7 @@ API~\cite{PaulEMcKenney2019RCUAPI}.\footnote{
 
 If you are new to RCU, you might consider focusing on just one
 of the columns in
-Table~\ref{tab:defer:RCU Wait-to-Finish APIs},
+\cref{tab:defer:RCU Wait-to-Finish APIs},
 each of which summarizes one member of the Linux kernel's RCU API family.
 For example, if you are primarily interested in understanding how RCU
 is used in the Linux kernel, ``RCU'' would be the place to start,
@@ -166,7 +166,7 @@ serve as a useful reference.
 
 \QuickQuiz{
 	Why do some of the cells in
-	Table~\ref{tab:defer:RCU Wait-to-Finish APIs}
+	\cref{tab:defer:RCU Wait-to-Finish APIs}
 	have exclamation marks (``!'')?
 }\QuickQuizAnswer{
 	The API members with exclamation marks (\co{rcu_read_lock()},
@@ -243,7 +243,7 @@ The \co{rcu_barrier()} primitive does this job.
 
 Finally, RCU may be used to provide
 type-safe memory~\cite{Cheriton96a}, as described in
-Section~\ref{sec:defer:RCU Provides Type-Safe Memory}.
+\cref{sec:defer:RCU Provides Type-Safe Memory}.
 In the context of RCU, type-safe memory guarantees that a given
 data element will not change type during any RCU read-side critical section
 that accesses it.
@@ -251,7 +251,7 @@ To make use of RCU-based type-safe memory, pass
 \co{SLAB_TYPESAFE_BY_RCU} to \co{kmem_cache_create()}.
 
 The ``SRCU'' column in
-Table~\ref{tab:defer:RCU Wait-to-Finish APIs}
+\cref{tab:defer:RCU Wait-to-Finish APIs}
 displays a specialized RCU API that permits general sleeping in SRCU
 read-side critical
 sections~\cite{PaulEMcKenney2006c}
@@ -280,7 +280,7 @@ the expense of increased CPU overhead.
 	\co{srcu_struct}.
 	In practice, however, doing this is almost certainly a bad idea.
 	In particular, the code shown in
-	Listing~\ref{lst:defer:Multistage SRCU Deadlocks}
+	\cref{lst:defer:Multistage SRCU Deadlocks}
 	could still result in deadlock.
 
 \begin{listing}
@@ -403,7 +403,7 @@ rivaling that of RCU\@.
 
 Fortunately, the RCU publish-subscribe and version-maintenance
 primitives shown in
-Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
+\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}
 apply to all of the variants of RCU discussed above.
 This commonality can allow more code to be shared, and reduces API
 proliferation.
@@ -470,7 +470,7 @@ creating RCU-protected linked data structures, such as RCU-protected
 arrays and trees.
 The special case of linked lists is handled by a separate set of
 APIs described in
-Section~\ref{sec:defer:RCU has List-Processing APIs}.
+\cref{sec:defer:RCU has List-Processing APIs}.
 
 The first category publishes pointers to new data items.
 The \co{rcu_assign_pointer()} primitive ensures that any
@@ -487,7 +487,7 @@ pointer and free the structure referenced by the old pointer.
 \QuickQuizB{
 	Normally, any pointer subject to \co{rcu_dereference()} \emph{must}
 	always be updated using one of the pointer-publish functions in
-	Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
+	\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
 	for example, \co{rcu_assign_pointer()}.
 
 	What is an exception to this rule?
@@ -517,7 +517,7 @@ pointer and free the structure referenced by the old pointer.
 	work out which type of RCU read-side critical section a given
 	RCU traversal primitive corresponds to.
 	For example, consider the code shown in
-	Listing~\ref{lst:defer:Diverse RCU Read-Side Nesting}.
+	\cref{lst:defer:Diverse RCU Read-Side Nesting}.
 
 \begin{listing}
 \begin{VerbatimL}
@@ -635,11 +635,11 @@ Linux has four variants of doubly linked list, the circular
 \co{struct hlist_bl_head}/\co{struct hlist_bl_node}
 pairs.
 The former is laid out as shown in
-Figure~\ref{fig:defer:Linux Circular Linked List (list)},
+\cref{fig:defer:Linux Circular Linked List (list)},
 where the green (leftmost) boxes represent the list header and the blue
 (rightmost three) boxes represent the elements in the list.
 This notation is cumbersome, and will therefore be abbreviated as shown in
-Figure~\ref{fig:defer:Linux Linked List Abbreviated},
+\cref{fig:defer:Linux Linked List Abbreviated},
 which shows only the non-header (blue) elements.
 
 \begin{figure}
@@ -656,16 +656,16 @@ Linux's \co{hlist}\footnote{
 is a linear list, which means that
 it needs only one pointer for the header rather than the two
 required for the circular list, as shown in
-Figure~\ref{fig:defer:Linux Linear Linked List (hlist)}.
+\cref{fig:defer:Linux Linear Linked List (hlist)}.
 Thus, use of \co{hlist} can halve the memory consumption for the hash-bucket
 arrays of large hash tables.
 As before, this notation is cumbersome, so \co{hlist} structures will
 be abbreviated in the same way \co{list_head}-style lists are, as shown in
-Figure~\ref{fig:defer:Linux Linked List Abbreviated}.
+\cref{fig:defer:Linux Linked List Abbreviated}.
 
 A variant of Linux's \co{hlist}, named \co{hlist_nulls}, provides multiple
 distinct \co{NULL} pointers, but otherwise uses the same layout as shown in
-Figure~\ref{fig:defer:Linux Linear Linked List (hlist)}.
+\cref{fig:defer:Linux Linear Linked List (hlist)}.
 In this variant, a \co{->next} pointer having a zero low-order bit is
 considered to be a pointer.
 However, if the low-order bit is set to one, the upper bits identify
@@ -719,7 +719,7 @@ source tree, with helpful example code provided in the
 Another variant of Linux's \co{hlist} incorporates bit-locking,
 and is named \co{hlist_bl}.
 This variant uses the same layout as shown in
-Figure~\ref{fig:defer:Linux Linear Linked List (hlist)},
+\cref{fig:defer:Linux Linear Linked List (hlist)},
 but reserves the low-order bit of the head pointer (``first'' in the
 figure) to lock the list.
 This approach also reduces memory usage, as it allows what would otherwise
@@ -829,7 +829,7 @@ be a separate spinlock to be stored with the pointer itself.
 \end{sidewaystable*}
 
 The API members for these linked-list variants are summarized in
-Table~\ref{tab:defer:RCU-Protected List APIs}.
+\cref{tab:defer:RCU-Protected List APIs}.
 More information is available in the \path{Documentation/RCU}
 directory of the Linux-kernel source tree and at
 Linux Weekly News~\cite{PaulEMcKenney2019RCUAPI}.
@@ -870,7 +870,7 @@ kfree(p);				\lnlbl[kfree]
 \end{figure}
 
 The following discussion walks through this code, using
-Figure~\ref{fig:defer:RCU Replacement in Linked List} to illustrate
+\cref{fig:defer:RCU Replacement in Linked List} to illustrate
 the state changes.
 The triples in each element represent the values of fields \co{->a},
 \co{->b}, and \co{->c}, respectively.
@@ -889,29 +889,29 @@ with \co{5,2,3} in such a way that any given reader sees one of these
 two values.
 
 \begin{fcvref}[ln:defer:Canonical RCU Replacement Example (2nd)]
-Line~\lnref{kmalloc} allocates a replacement element,
+\Clnref{kmalloc} allocates a replacement element,
 resulting in the state as shown in the second row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 At this point, no reader can hold a reference to the newly allocated
 element (as indicated by its green shading), and it is uninitialized
 (as indicated by the question marks).
 
-Line~\lnref{copy} copies the old element to the new one, resulting in the
+\Clnref{copy} copies the old element to the new one, resulting in the
 state as shown in the third row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 The newly allocated element still cannot be referenced by readers, but
 it is now initialized.
 
-Line~\lnref{update1} updates \co{q->b} to the value ``2'', and
-line~\lnref{update2} updates \co{q->c} to the value ``3'',
+\Clnref{update1} updates \co{q->b} to the value ``2'', and
+\clnref{update2} updates \co{q->c} to the value ``3'',
 as shown on the fourth row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 Note that the newly allocated structure is still inaccessible to readers.
 
-Now, line~\lnref{replace} does the replacement, so that the new element is
+Now, \clnref{replace} does the replacement, so that the new element is
 finally visible to readers, and hence is shaded red, as shown on
 the fifth row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 At this point, as shown below, we have two versions of the list.
 Pre-existing readers might see the \co{5,6,7} element (which is
 therefore now shaded yellow), but
@@ -919,7 +919,7 @@ new readers will instead see the \co{5,2,3} element.
 But any given reader is guaranteed to see one set of values or the
 other, not a mixture of the two.
 
-After the \co{synchronize_rcu()} on line~\lnref{sync_rcu} returns,
+After the \co{synchronize_rcu()} on \clnref{sync_rcu} returns,
 a grace period will have elapsed, and so all reads that started before the
 \co{list_replace_rcu()} will have completed.
 In particular, any readers that might have been holding references
@@ -928,20 +928,20 @@ their RCU read-side critical sections, and are thus prohibited from
 continuing to hold a reference.
 Therefore, there can no longer be any readers holding references
 to the old element, as indicated its green shading in the sixth row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 As far as the readers are concerned, we are back to having a single version
 of the list, but with the new element in place of the old.
 
-After the \co{kfree()} on line~\lnref{kfree} completes, the list will
+After the \co{kfree()} on \clnref{kfree} completes, the list will
 appear as shown on the final row of
-Figure~\ref{fig:defer:RCU Replacement in Linked List}.
+\cref{fig:defer:RCU Replacement in Linked List}.
 \end{fcvref}
 
 Despite the fact that RCU was named after the replacement case,
 the vast majority of RCU usage within the Linux kernel relies on
 the simple independent insertion and deletion, as was shown in
-Figure~\ref{fig:defer:Multiple RCU Data-Structure Versions} in
-Section~\ref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
+\cref{fig:defer:Multiple RCU Data-Structure Versions} in
+\cref{sec:defer:Maintain Multiple Versions of Recently Updated Objects}.
 
 The next section looks at APIs that assist developers in debugging
 their code that makes use of RCU\@.
@@ -989,7 +989,7 @@ lockdep support &
 \label{tab:defer:RCU Diagnostic APIs}
 \end{table}
 
-Table~\ref{tab:defer:RCU Diagnostic APIs}
+\Cref{tab:defer:RCU Diagnostic APIs}
 shows RCU's diagnostic APIs.
 
 The \co{__rcu} marks an RCU-protected pointer, for example,
@@ -1081,7 +1081,7 @@ an RCU, RCU-bh, or RCU-sched read-side critical section.
 \label{fig:defer:RCU API Usage Constraints}
 \end{figure}
 
-Figure~\ref{fig:defer:RCU API Usage Constraints}
+\Cref{fig:defer:RCU API Usage Constraints}
 shows which APIs may be used in which in-kernel environments.
 The RCU read-side primitives may be used in any environment, including NMI,
 the RCU mutation and asynchronous grace-period primitives may be used in any
@@ -1105,7 +1105,7 @@ to complete, and maintenance of multiple versions.
 That said, it is possible to build higher-level constructs
 on top of RCU, including the reader-writer-locking, reference-counting,
 and existence-guarantee constructs listed in
-Section~\ref{sec:defer:RCU Usage}.
+\cref{sec:defer:RCU Usage}.
 Furthermore, I have no doubt that the Linux community will continue to
 find interesting new uses for RCU,
 just as they do for any of a number of synchronization
@@ -1116,7 +1116,7 @@ all of the things you can do with these APIs.
 
 However, for many people, a complete view of RCU must include sample
 RCU implementations.
-Appendix~\ref{chp:app:``Toy'' RCU Implementations} therefore presents a series
+\Cref{chp:app:``Toy'' RCU Implementations} therefore presents a series
 of ``toy'' RCU implementations of increasing complexity and capability,
 though others might prefer the classic
 ``User-Level Implementations of Read-Copy
diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
index 476819a9..d12d831c 100644
--- a/defer/rcuexercises.tex
+++ b/defer/rcuexercises.tex
@@ -15,7 +15,7 @@ suffice for most of these exercises.
 
 \EQuickQuiz{
 	The statistical-counter implementation shown in
-	Listing~\ref{lst:count:Per-Thread Statistical Counters}
+	\cref{lst:count:Per-Thread Statistical Counters}
 	(\path{count_end.c})
 	used a global lock to guard the summation in \co{read_count()},
 	which resulted in poor performance and negative scalability.
@@ -54,14 +54,14 @@ suffice for most of these exercises.
 	Why or why not?
 
 	See
-	Section~\ref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
+	\cref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
 	on
-	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
+	\cpageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
 	for more details.
 }\EQuickQuizEnd
 
 \EQuickQuiz{
-	Section~\ref{sec:count:Applying Exact Limit Counters}
+	\Cref{sec:count:Applying Exact Limit Counters}
 	showed a fanciful pair of code fragments that dealt with counting
 	I/O accesses to removable devices.
 	These code fragments suffered from high overhead on the fastpath
@@ -78,8 +78,8 @@ suffice for most of these exercises.
 	device-removal code fragment to suit.
 
 	See
-	Section~\ref{sec:together:RCU and Counters for Removable I/O Devices}
+	\cref{sec:together:RCU and Counters for Removable I/O Devices}
 	on
-	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
+	\cpageref{sec:together:RCU and Counters for Removable I/O Devices}
 	for one solution to this problem.
 }\EQuickQuizEnd
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 1bfe6265..a3c9cc58 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -145,7 +145,7 @@ the state, as indicated by the ``2 Versions'' in the figure.
 	data reflecting that reality.
 	Many of those algorithms are also able to tolerate some degree
 	of inconsistency within the in-computer data.
-	\cref{sec:datastruct:RCU-Protected Hash Table Discussion}
+	\Cref{sec:datastruct:RCU-Protected Hash Table Discussion}
 	discusses this point in more detail.
 
 	Please note that this need to tolerate inconsistent and stale
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 4c27ed8f..9061b99d 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -35,11 +35,11 @@ As of 2021, Linux-kernel RCU is still under active development.
 However, in the mid 2010s, there was a welcome upsurge in RCU research
 and development across a number of communities and
 institutions~\cite{FransKaashoek2015ParallelOSHistory}.
-Section~\ref{sec:defer:RCU Uses} describes uses of RCU,
-Section~\ref{sec:defer:RCU Implementations} describes RCU implementations
+\Cref{sec:defer:RCU Uses} describes uses of RCU,
+\cref{sec:defer:RCU Implementations} describes RCU implementations
 (as well as work that both creates and uses an implementation),
 and finally,
-Section~\ref{sec:defer:RCU Validation} describes verification and validation
+\cref{sec:defer:RCU Validation} describes verification and validation
 of RCU and its uses.
 
 \subsubsection{RCU Uses}
@@ -145,7 +145,7 @@ pressed scalable non-zero indicators
 (SNZI)~\cite{FaithEllen:2007:SNZI} into service as a grace-period
 mechanism.
 The intended use is to implement software transactional memory
-(see Section~\ref{sec:future:Transactional Memory}), which
+(see \cref{sec:future:Transactional Memory}), which
 imposes linearizability requirements, which in turn seems to
 limit scalability.
 
@@ -225,7 +225,7 @@ This paper also made some interesting performance-evaluation choices that
 are discussed further in
 \cref{sec:future:Deferred Reclamation}
 on
-page~\ref{sec:future:Deferred Reclamation}.
+\cpageref{sec:future:Deferred Reclamation}.
 
 \ppl{Adam}{Belay} et al.~created an RCU implementation that guards the
 data structures used by TCP/IP's address-resolution protocol (ARP)
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 6586b27f..b84e32a4 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -40,15 +40,15 @@ This section answers the question ``What is RCU?'' from the viewpoint
 of the uses to which RCU can be put.
 Because RCU is most frequently used to replace some existing mechanism,
 we look at it primarily in terms of its relationship to such mechanisms,
-as listed in Table~\ref{tab:defer:RCU Usage}.
+as listed in \cref{tab:defer:RCU Usage}.
 Following the sections listed in this table,
-Section~\ref{sec:defer:RCU Usage Summary} provides a summary.
+\cref{sec:defer:RCU Usage Summary} provides a summary.
 
 \subsubsection{RCU for Pre-BSD Routing}
 \label{sec:defer:RCU for Pre-BSD Routing}
 
-Listings~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup}
-and~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete}
+\Cref{lst:defer:RCU Pre-BSD Routing Table Lookup,%
+lst:defer:RCU Pre-BSD Routing Table Add/Delete}
 show code for an RCU-protected Pre-BSD routing table
 (\path{route_rcu.c}).
 The former shows data structures and \co{route_lookup()},
@@ -67,19 +67,19 @@ and the latter shows \co{route_add()} and \co{route_del()}.
 \end{listing}
 
 \begin{fcvref}[ln:defer:route_rcu:lookup]
-In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Lookup},
-line~\lnref{rh} adds the \co{->rh} field used by RCU reclamation,
-line~\lnref{re_freed} adds the \co{->re_freed} use-after-free-check field,
-lines~\lnref{lock}, \lnref{unlock1}, and~\lnref{unlock2}
+In \cref{lst:defer:RCU Pre-BSD Routing Table Lookup},
+\clnref{rh} adds the \co{->rh} field used by RCU reclamation,
+\clnref{re_freed} adds the \co{->re_freed} use-after-free-check field,
+\clnref{lock,unlock1,unlock2}
 add RCU read-side protection,
-and lines~\lnref{chk_freed} and~\lnref{abort} add the use-after-free check.
+and \clnref{chk_freed,abort} add the use-after-free check.
 \end{fcvref}
 \begin{fcvref}[ln:defer:route_rcu:add_del]
-In Listing~\ref{lst:defer:RCU Pre-BSD Routing Table Add/Delete},
-lines~\lnref{add:lock}, \lnref{add:unlock}, \lnref{del:lock},
-\lnref{del:unlock1}, and~\lnref{del:unlock2} add update-side locking,
-lines~\lnref{add:add_rcu} and~\lnref{del:del_rcu} add RCU update-side protection,
-line~\lnref{del:call_rcu} causes \co{route_cb()} to be invoked after
+In \cref{lst:defer:RCU Pre-BSD Routing Table Add/Delete},
+\clnref{add:lock,add:unlock,del:lock,%
+del:unlock1,del:unlock2} add update-side locking,
+\clnref{add:add_rcu,del:del_rcu} add RCU update-side protection,
+\clnref{del:call_rcu} causes \co{route_cb()} to be invoked after
 a grace period elapses,
 and \clnrefrange{cb:b}{cb:e} define \co{route_cb()}.
 This is minimal added code for a working concurrent implementation.
@@ -92,7 +92,7 @@ This is minimal added code for a working concurrent implementation.
 \label{fig:defer:Pre-BSD Routing Table Protected by RCU}
 \end{figure}
 
-Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by RCU}
+\Cref{fig:defer:Pre-BSD Routing Table Protected by RCU}
 shows the performance on the read-only workload.
 RCU scales quite well, and offers nearly ideal performance.
 However, this data was generated using the \co{RCU_SIGNAL}
@@ -102,13 +102,13 @@ for which \co{rcu_read_lock()} and \co{rcu_read_unlock()}
 generate a small amount of code.
 What happens for the QSBR flavor of RCU, which generates no code at all
 for \co{rcu_read_lock()} and \co{rcu_read_unlock()}?
-(See Section~\ref{sec:defer:Introduction to RCU},
+(See \cref{sec:defer:Introduction to RCU},
 and especially
-Figure~\ref{fig:defer:QSBR: Waiting for Pre-Existing Readers},
+\cref{fig:defer:QSBR: Waiting for Pre-Existing Readers},
 for a discussion of RCU QSBR\@.)
 
 The answer to this is shown in
-Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
+\cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
 which shows that RCU QSBR's performance and scalability actually exceeds
 that of the ideal synchronization-free workload.
 
@@ -152,7 +152,7 @@ that of the ideal synchronization-free workload.
 	on modern microprocessors.
 	Such results can be thought of as similar to the celebrated
 	super-linear speedups (see
-	Section~\ref{sec:SMPdesign:Beyond Partitioning}
+	\cref{sec:SMPdesign:Beyond Partitioning}
 	for one such example), that is, of interest but also of limited
 	practical importance.
 	Nevertheless, one of the strengths of RCU is that its read-side
@@ -171,7 +171,7 @@ that of the ideal synchronization-free workload.
 	\co{->re_next.next} pointer also had zero offset, just the
 	same as the sequential variant.
 	And the answer, as can be seen in
-	Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head},
+	\cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR With Non-Initial rcu-head},
 	is that this causes RCU QSBR's performance to decrease to where
 	it is still very nearly ideal, but no longer super-ideal.
 }\QuickQuizEndB
@@ -240,7 +240,7 @@ These advantages and limitations are discussed in the following sections.
 
 The read-side performance advantages of Linux-kernel RCU over
 reader-writer locking are shown in
-Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking},
+\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking},
 which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 
 \QuickQuizSeries{%
@@ -328,7 +328,7 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 
 	Of course, it is also the case that the older results were obtained
 	on a different system than were those shown in
-	Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
+	\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
 	So which change had the most effect, Linus's commit or the change in
 	the system?
 	This question is left as an exercise to the reader.
@@ -336,7 +336,7 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 
 \QuickQuizE{
 	Why is there such large variation for the \co{rcu} trace in
-	Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}?
+	\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}?
 }\QuickQuizAnswerE{
 	Keep in mind that this is a log-log plot, so those large-seeming
 	\co{rcu} variances in reality span only a few hundred picoseconds.
@@ -371,7 +371,7 @@ from 30~runs, with the line being the median.
 A more moderate view may be obtained from a \co{CONFIG_PREEMPT} kernel,
 though RCU still beats reader-writer locking by between a factor of seven
 on a single CPU and by three orders of magnitude on 192~CPUs, as shown in
-Figure~\ref{fig:defer:Performance Advantage of Preemptible RCU Over Reader-Writer Locking},
+\cref{fig:defer:Performance Advantage of Preemptible RCU Over Reader-Writer Locking},
 which was generated on the same 448-CPU 2.10\,GHz x86 system.
 Note the high variability of reader-writer locking at larger numbers of CPUs.
 The error bars span the full range of data.
@@ -403,7 +403,7 @@ is exaggerated by the unrealistic zero-length critical sections.
 The performance advantages of RCU decrease as the overhead of the critical
 sections increase.
 This decrease can be seen in
-Figure~\ref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration},
+\cref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration},
 which was run on the same system as the previous plots.
 Here, the y-axis represents the sum of the overhead of the read-side
 primitives and that of the critical section and the x-axis represents
@@ -413,11 +413,11 @@ separations between the traces still represent significant differences.
 This figure shows non-preemptible RCU, but given that preemptible RCU's
 read-side overhead is only about three nanoseconds, its plot would be
 nearly identical to
-Figure~\ref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration}.
+\cref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration}.
 
 \QuickQuiz{
 	Why the larger error ranges for the submicrosecond durations in
-	Figure~\ref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration}?
+	\cref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of Critical-Section Duration}?
 }\QuickQuizAnswer{
 	Because smaller disturbances result in greater relative errors
 	for smaller measurements.
@@ -425,7 +425,7 @@ Figure~\ref{fig:defer:Comparison of RCU to Reader-Writer Locking as Function of
 	is (as of 2020) less accurate than is the \co{udelay()} primitive
 	used for the data for durations of a microsecond or more.
 	It is instructive to compare to the zero-length case shown in
-	Figure~\ref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
+	\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}.
 }\QuickQuizEnd
 
 There are three traces for reader-writer locking, with the upper trace
@@ -570,7 +570,7 @@ RCU readers to finish,
 the RCU readers might well see the change more quickly than would
 batch-fair
 reader-writer-locking readers, as shown in
-Figure~\ref{fig:defer:Response Time of RCU vs. Reader-Writer Locking}.
+\cref{fig:defer:Response Time of RCU vs. Reader-Writer Locking}.
 
 Once the update is received, the rwlock writer cannot proceed until the
 last reader completes, and subsequent readers cannot proceed until the
@@ -608,7 +608,7 @@ Fortunately,
 there are a number of approaches that avoid inconsistency and stale
 data~\cite{PaulEdwardMcKenneyPhD,Arcangeli03}, and some
 methods based on reference counting are discussed in
-Section~\ref{sec:defer:Reference Counting}.
+\cref{sec:defer:Reference Counting}.
 
 \paragraph{Low-Priority RCU Readers Can Block High-Priority Reclaimers}
 
@@ -629,7 +629,7 @@ With the exception of userspace
 RCU~\cite{MathieuDesnoyers2009URCU,PaulMcKenney2013LWNURCU},
 expedited grace periods, and several of the ``toy''
 RCU implementations described in
-Appendix~\ref{chp:app:``Toy'' RCU Implementations},
+\cref{chp:app:``Toy'' RCU Implementations},
 RCU grace periods extend milliseconds.
 Although there are a number of techniques to render such long delays
 harmless, including use of the asynchronous interfaces where available
@@ -641,10 +641,9 @@ situations.
 
 In the best case, the conversion from reader-writer locking to RCU
 is quite simple, as shown in
-Listings~\ref{lst:defer:Converting Reader-Writer Locking to RCU: Data},
-\ref{lst:defer:Converting Reader-Writer Locking to RCU: Search},
-and
-\ref{lst:defer:Converting Reader-Writer Locking to RCU: Deletion},
+\cref{lst:defer:Converting Reader-Writer Locking to RCU: Data,%
+lst:defer:Converting Reader-Writer Locking to RCU: Search,%
+lst:defer:Converting Reader-Writer Locking to RCU: Deletion},
 all taken from
 Wikipedia~\cite{WikipediaRCU}.
 
@@ -849,7 +848,7 @@ waits for any previously acquired references to be released.
 
 Of course, RCU can also be combined with traditional reference counting,
 as discussed in
-Section~\ref{sec:together:Refurbish Reference Counting}.
+\cref{sec:together:Refurbish Reference Counting}.
 
 \begin{figure}
 \centering
@@ -867,8 +866,8 @@ Section~\ref{sec:together:Refurbish Reference Counting}.
 
 But why bother?
 Again, part of the answer is performance, as shown in
-Figures~\ref{fig:defer:Performance of RCU vs. Reference Counting}
-and~\ref{fig:defer:Performance of Preemptible RCU vs. Reference Counting},
+\cref{fig:defer:Performance of RCU vs. Reference Counting,%
+fig:defer:Performance of Preemptible RCU vs. Reference Counting},
 again showing data taken on a 448-CPU 2.1\,GHz Intel x86 system
 for non-preemptible and preemptible Linux-kernel RCU, respectively.
 Non-preemptible RCU's advantage over reference counting ranges from
@@ -887,7 +886,7 @@ one CPU up to about three orders of magnitude at 192~CPUs.
 However, as with reader-writer locking, the performance advantages of
 RCU are most pronounced for short-duration critical sections and for
 large numbers of CPUs, as shown in
-Figure~\ref{fig:defer:Response Time of RCU vs. Reference Counting}
+\cref{fig:defer:Response Time of RCU vs. Reference Counting}
 for the same system.
 In addition, as with reader-writer locking, many system calls (and thus
 any RCU read-side critical sections that they contain) complete in
@@ -983,7 +982,7 @@ Gamsa et al.~\cite{Gamsa99}
 discuss existence guarantees and describe how a mechanism
 resembling RCU can be used to provide these existence guarantees
 (see Section~5 on page 7 of the PDF), and
-Section~\ref{sec:locking:Lock-Based Existence Guarantees}
+\cref{sec:locking:Lock-Based Existence Guarantees}
 discusses how to guarantee existence via locking, along with the
 ensuing disadvantages of doing so.
 The effect is that if any RCU-protected data element is accessed
@@ -1026,27 +1025,27 @@ int delete(int key)
 \end{listing}
 
 \begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
-Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
+\Cref{lst:defer:Existence Guarantees Enable Per-Element Locking}
 demonstrates how RCU-based existence guarantees can enable
 per-element locking via a function that deletes an element from
 a hash table.
-Line~\lnref{hash} computes a hash function, and line~\lnref{rdlock} enters an RCU
+\Clnref{hash} computes a hash function, and \clnref{rdlock} enters an RCU
 read-side critical section.
-If line~\lnref{chkkey} finds that the corresponding bucket of the hash table is
+If \clnref{chkkey} finds that the corresponding bucket of the hash table is
 empty or that the element present is not the one we wish to delete,
-then line~\lnref{rdunlock1} exits the RCU read-side critical section and
-line~\lnref{ret_0:a}
+then \clnref{rdunlock1} exits the RCU read-side critical section and
+\clnref{ret_0:a}
 indicates failure.
 \end{fcvref}
 
 \QuickQuiz{
 	What if the element we need to delete is not the first element
 	of the list on
-        line~\ref{ln:defer:Existence Guarantees Enable Per-Element Locking:chkkey} of
-	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}?
+	\clnrefr{ln:defer:Existence Guarantees Enable Per-Element Locking:chkkey} of
+	\cref{lst:defer:Existence Guarantees Enable Per-Element Locking}?
 }\QuickQuizAnswer{
 	As with
-	Listing~\ref{lst:locking:Per-Element Locking Without Existence Guarantees},
+	\cref{lst:locking:Per-Element Locking Without Existence Guarantees},
 	this is a very simple hash table with no chaining, so the only
 	element in a given bucket is the first element.
 	The reader is again invited to adapt this example to a hash table with
@@ -1056,29 +1055,29 @@ indicates failure.
 }\QuickQuizEnd
 
 \begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
-Otherwise, line~\lnref{acq} acquires the update-side spinlock, and
-line~\lnref{chkkey2} then checks that the element is still the one that we want.
-If so, line~\lnref{rdunlock2} leaves the RCU read-side critical section,
-line~\lnref{remove} removes it from the table, line~\lnref{rel1} releases
-the lock, line~\lnref{sync_rcu} waits for all pre-existing RCU read-side critical
-sections to complete, line~\lnref{kfree} frees the newly removed element,
-and line~\lnref{ret_1} indicates success.
-If the element is no longer the one we want, line~\lnref{rel2} releases
-the lock, line~\lnref{rdunlock3} leaves the RCU read-side critical section,
-and line~\lnref{ret_0:b} indicates failure to delete the specified key.
+Otherwise, \clnref{acq} acquires the update-side spinlock, and
+\clnref{chkkey2} then checks that the element is still the one that we want.
+If so, \clnref{rdunlock2} leaves the RCU read-side critical section,
+\clnref{remove} removes it from the table, \clnref{rel1} releases
+the lock, \clnref{sync_rcu} waits for all pre-existing RCU read-side critical
+sections to complete, \clnref{kfree} frees the newly removed element,
+and \clnref{ret_1} indicates success.
+If the element is no longer the one we want, \clnref{rel2} releases
+the lock, \clnref{rdunlock3} leaves the RCU read-side critical section,
+and \clnref{ret_0:b} indicates failure to delete the specified key.
 \end{fcvref}
 
 \QuickQuizSeries{%
 \QuickQuizB{
 	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why is it OK to exit the RCU read-side critical section on
-	line~\lnref{rdunlock2} of
-	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
-	before releasing the lock on line~\lnref{rel1}?
+	\clnref{rdunlock2} of
+	\cref{lst:defer:Existence Guarantees Enable Per-Element Locking}
+	before releasing the lock on \clnref{rel1}?
 	\end{fcvref}
 }\QuickQuizAnswerB{
 	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
-	First, please note that the second check on line~\lnref{chkkey2} is
+	First, please note that the second check on \clnref{chkkey2} is
 	necessary because some other
 	CPU might have removed this element while we were waiting
 	to acquire the lock.
@@ -1101,9 +1100,9 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 \QuickQuizE{
 	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	Why not exit the RCU read-side critical section on
-	line~\lnref{rdunlock3} of
-	Listing~\ref{lst:defer:Existence Guarantees Enable Per-Element Locking}
-	before releasing the lock on line~\lnref{rel2}?
+	\clnref{rdunlock3} of
+	\cref{lst:defer:Existence Guarantees Enable Per-Element Locking}
+	before releasing the lock on \clnref{rel2}?
 	\end{fcvref}
 }\QuickQuizAnswerE{
 	Suppose we reverse the order of these two lines.
@@ -1112,24 +1111,24 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 	\begin{enumerate}
 	\begin{fcvref}[ln:defer:Existence Guarantees Enable Per-Element Locking]
 	\item	CPU~0 invokes \co{delete()}, and finds the element
-		to be deleted, executing through line~\lnref{rdunlock2}.
+		to be deleted, executing through \clnref{rdunlock2}.
 		It has not yet actually deleted the element, but
 		is about to do so.
 	\item	CPU~1 concurrently invokes \co{delete()}, attempting
 		to delete this same element.
 		However, CPU~0 still holds the lock, so CPU~1 waits
-		for it at line~\lnref{acq}.
-	\item	CPU~0 executes lines~\lnref{remove} and~\lnref{rel1},
-		and blocks at line~\lnref{sync_rcu} waiting for CPU~1
+		for it at \clnref{acq}.
+	\item	CPU~0 executes \clnref{remove,rel1},
+		and blocks at \clnref{sync_rcu} waiting for CPU~1
 		to exit its RCU read-side critical section.
-	\item	CPU~1 now acquires the lock, but the test on line~\lnref{chkkey2}
+	\item	CPU~1 now acquires the lock, but the test on \clnref{chkkey2}
 		fails because CPU~0 has already removed the element.
-		CPU~1 now executes line~\lnref{rel2}
-                (which we switched with line~\lnref{rdunlock3}
+		CPU~1 now executes \clnref{rel2}
+		(which we switched with \clnref{rdunlock3}
 		for the purposes of this Quick Quiz)
 		and exits its RCU read-side critical section.
 	\item	CPU~0 can now return from \co{synchronize_rcu()},
-		and thus executes line~\lnref{kfree}, sending the element to
+		and thus executes \clnref{kfree}, sending the element to
 		the freelist.
 	\item	CPU~1 now attempts to release a lock for an element
 		that has been freed, and, worse yet, possibly
@@ -1143,10 +1142,10 @@ and line~\lnref{ret_0:b} indicates failure to delete the specified key.
 Alert readers will recognize this as only a slight variation on
 the original ``RCU is a way of waiting for things to finish'' theme,
 which is addressed in
-Section~\ref{sec:defer:RCU is a Way of Waiting for Things to Finish}.
+\cref{sec:defer:RCU is a Way of Waiting for Things to Finish}.
 They might also note the deadlock-immunity advantages over the lock-based
 existence guarantees discussed in
-Section~\ref{sec:locking:Lock-Based Existence Guarantees}.
+\cref{sec:locking:Lock-Based Existence Guarantees}.
 
 \subsubsection{RCU Provides Type-Safe Memory}
 \label{sec:defer:RCU Provides Type-Safe Memory}
@@ -1183,7 +1182,7 @@ for the duration of any pre-existing RCU read-side critical sections.
 	during which at least one thread is always in an RCU read-side
 	critical section.
 	However, the key words in the description in
-	Section~\ref{sec:defer:RCU Provides Type-Safe Memory}
+	\cref{sec:defer:RCU Provides Type-Safe Memory}
 	are ``in-use'' and ``pre-existing''.
 	Keep in mind that a given RCU read-side critical section is
 	conceptually only permitted to gain references to data elements
@@ -1234,7 +1233,7 @@ Simpler is after all almost always better!
 \subsubsection{RCU is a Way of Waiting for Things to Finish}
 \label{sec:defer:RCU is a Way of Waiting for Things to Finish}
 
-As noted in Section~\ref{sec:defer:RCU Fundamentals}
+As noted in \cref{sec:defer:RCU Fundamentals}
 an important component
 of RCU is a way of waiting for RCU readers to finish.
 One of
@@ -1273,7 +1272,7 @@ In this example, the \co{timer_stop} function uses
 \co{synchronize_sched()} to ensure that all in-flight NMI
 notifications have completed before freeing the associated resources.
 A simplified version of this code is shown
-Listing~\ref{lst:defer:Using RCU to Wait for NMIs to Finish}.
+\cref{lst:defer:Using RCU to Wait for NMIs to Finish}.
 
 \begin{listing}
 \begin{fcvlabel}[ln:defer:Using RCU to Wait for NMIs to Finish]
@@ -1314,7 +1313,7 @@ void nmi_stop(void)				\lnlbl@nmi_stop:b$
 \begin{fcvref}[ln:defer:Using RCU to Wait for NMIs to Finish:struct]
 \Clnrefrange{b}{e} define a \co{profile_buffer} structure, containing a
 size and an indefinite array of entries.
-Line~\lnref{buf} defines a pointer to a profile buffer, which is
+\Clnref{buf} defines a pointer to a profile buffer, which is
 presumably initialized elsewhere to point to a dynamically allocated
 region of memory.
 \end{fcvref}
@@ -1326,14 +1325,14 @@ As such, it cannot be preempted, nor can it be interrupted by a normal
 interrupts handler, however, it is still subject to delays due to cache misses,
 ECC errors, and cycle stealing by other hardware threads within the same
 core.
-Line~\lnref{rcu_deref} gets a local pointer to the profile buffer using the
+\Clnref{rcu_deref} gets a local pointer to the profile buffer using the
 \co{rcu_dereference()} primitive to ensure memory ordering on
 DEC Alpha, and
-lines~\lnref{if_NULL} and~\lnref{ret:a} exit from this function if there is no
-profile buffer currently allocated, while lines~\lnref{if_oor} and~\lnref{ret:b}
+\clnref{if_NULL,ret:a} exit from this function if there is no
+profile buffer currently allocated, while \clnref{if_oor,ret:b}
 exit from this function if the \co{pcvalue} argument
 is out of range.
-Otherwise, line~\lnref{inc} increments the profile-buffer entry indexed
+Otherwise, \clnref{inc} increments the profile-buffer entry indexed
 by the \co{pcvalue} argument.
 Note that storing the size with the buffer guarantees that the
 range check matches the buffer, even if a large buffer is suddenly
@@ -1344,15 +1343,15 @@ replaced by a smaller one.
 \Clnrefrange{b}{e} define the \co{nmi_stop()} function,
 where the caller is responsible for mutual exclusion (for example,
 holding the correct lock).
-Line~\lnref{fetch} fetches a pointer to the profile buffer, and
-lines~\lnref{if_NULL} and~\lnref{ret} exit the function if there is no buffer.
-Otherwise, line~\lnref{NULL} \co{NULL}s out the profile-buffer pointer
+\Clnref{fetch} fetches a pointer to the profile buffer, and
+\clnref{if_NULL,ret} exit the function if there is no buffer.
+Otherwise, \clnref{NULL} \co{NULL}s out the profile-buffer pointer
 (using the \co{rcu_assign_pointer()} primitive to maintain
 memory ordering on weakly ordered machines),
-and line~\lnref{sync_sched} waits for an RCU Sched grace period to elapse,
+and \clnref{sync_sched} waits for an RCU Sched grace period to elapse,
 in particular, waiting for all non-preemptible regions of code,
 including NMI handlers, to complete.
-Once execution continues at line~\lnref{kfree}, we are guaranteed that
+Once execution continues at \clnref{kfree}, we are guaranteed that
 any instance of \co{nmi_profile()} that obtained a
 pointer to the old buffer has returned.
 It is therefore safe to free the buffer, in this case using the
@@ -1368,7 +1367,7 @@ It is therefore safe to free the buffer, in this case using the
 	in \co{nmi_profile()}, and to replace the
 	\co{synchronize_sched()} with \co{synchronize_rcu()},
 	perhaps as shown in
-	Listing~\ref{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
+	\cref{lst:defer:Using RCU to Wait for Mythical Preemptible NMIs to Finish}.
 %
 \begin{listing}
 \begin{VerbatimL}
@@ -1446,7 +1445,7 @@ as well as for any of a number of other synchronization primitives.
 \end{figure}
 
 In the meantime,
-Figure~\ref{fig:defer:RCU Areas of Applicability}
+\cref{fig:defer:RCU Areas of Applicability}
 shows some rough rules of thumb on where RCU is most helpful.
 
 As shown in the blue box at the top of the figure, RCU works best if
@@ -1500,7 +1499,7 @@ update-mostly workloads requiring
 consistent data are rarely good places to use RCU, though there are some
 exceptions~\cite{MathieuDesnoyers2012URCU}.
 In addition, as noted in
-Section~\ref{sec:defer:RCU Provides Type-Safe Memory},
+\cref{sec:defer:RCU Provides Type-Safe Memory},
 within the Linux kernel, the \co{SLAB_TYPESAFE_BY_RCU}
 slab-allocator flag provides type-safe memory to RCU readers, which can
 greatly simplify \IXacrl{nbs} and other lockless
diff --git a/defer/updates.tex b/defer/updates.tex
index 6e9ea0de..8b231011 100644
--- a/defer/updates.tex
+++ b/defer/updates.tex
@@ -17,7 +17,7 @@ scalability for writers.
 
 We have already seen one situation featuring high performance and
 scalability for writers, namely the counting algorithms surveyed in
-Chapter~\ref{chp:Counting}.
+\cref{chp:Counting}.
 These algorithms featured partially partitioned data structures so
 that updates can operate locally, while the more-expensive reads
 must sum across the entire data structure.
@@ -35,7 +35,7 @@ of the garbage collector.
 
 And of course, where feasible, fully partitioned or ``sharded'' systems
 provide excellent performance and scalability, as noted in
-Chapter~\ref{cha:Partitioning and Synchronization Design}.
+\cref{cha:Partitioning and Synchronization Design}.
 
 The next chapter will look at updates in the context of several types
 of data structures.
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 8f2921b4..3940c4bc 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -9,9 +9,9 @@
 	  may be; custom will soon render it easy and agreeable.}
 	  {\emph{Pythagoras}}
 
-Section~\ref{sec:defer:Which to Choose? (Overview)}
+\Cref{sec:defer:Which to Choose? (Overview)}
 provides a high-level overview and then
-Section~\ref{sec:defer:Which to Choose? (Details)}
+\cref{sec:defer:Which to Choose? (Details)}
 provides a more detailed view
 of the differences between the deferred-processing techniques presented
 in this chapter.
@@ -19,7 +19,7 @@ This discussion assumes a linked data structure that is large enough
 that readers do not hold references from one traversal to another,
 and where elements might be added to and removed from the structure
 at any location and at any time.
-Section~\ref{sec:defer:Which to Choose? (Production Use)}
+\Cref{sec:defer:Which to Choose? (Production Use)}
 then points out a few publicly visible production uses of
 hazard pointers, sequence locking, and RCU\@.
 This discussion should help you to make an informed choice between
@@ -74,12 +74,12 @@ these techniques.
 \label{tab:defer:Which Deferred Technique to Choose? (Overview)}
 \end{table*}
 
-Table~\ref{tab:defer:Which Deferred Technique to Choose? (Overview)}
+\Cref{tab:defer:Which Deferred Technique to Choose? (Overview)}
 shows a few high-level properties that distinguish the deferred-reclamation
 techniques from one another.
 
 The ``Readers'' row summarizes the results presented in
-Figure~\ref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
+\cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
 which shows that all but reference counting are enjoy reasonably
 fast and scalable readers.
 
@@ -135,7 +135,7 @@ run concurrently with any update.
 	Yes they do, but the guarantee only applies unconditionally
 	in cases where a reference is already held.
 	With this in mind, please review the paragraph at the beginning of
-	Section~\ref{sec:defer:Which to Choose?}, especially the part
+	\cref{sec:defer:Which to Choose?}, especially the part
 	saying ``large enough that readers do not hold references from
 	one traversal to another''.
 }\QuickQuizEnd
@@ -252,7 +252,7 @@ But those wishing more detail should continue on to the next section.
 \label{tab:defer:Which Deferred Technique to Choose?  (Details)}
 \end{table*}
 
-Table~\ref{tab:defer:Which Deferred Technique to Choose? (Details)}
+\Cref{tab:defer:Which Deferred Technique to Choose? (Details)}
 provides more-detailed rules of thumb that can help you choose among the
 four deferred-processing techniques presented in this chapter.
 
@@ -293,7 +293,7 @@ be reduced by batching, so that each read-side operation covers more data.
 
 \QuickQuiz{
 	But didn't the answer to one of the quick quizzes in
-	Section~\ref{sec:defer:Hazard Pointers}
+	\cref{sec:defer:Hazard Pointers}
 	say that pairwise asymmetric barriers could eliminate the
 	read-side \co{smp_mb()} from hazard pointers?
 }\QuickQuizAnswer{
@@ -380,7 +380,7 @@ counting is used.
 This means that the complexity of reference-acquisition failure only
 needs to be dealt with for those few data elements:  The bulk of
 the reference acquisitions are unconditional, courtesy of RCU\@.
-See Section~\ref{sec:together:Refurbish Reference Counting}
+See \cref{sec:together:Refurbish Reference Counting}
 for more information on combining reference counting with other
 synchronization mechanisms.
 
-- 
2.17.1


