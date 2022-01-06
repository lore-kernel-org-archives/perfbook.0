Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+iBGi8UE6xftHRAX8e9o/yykDh9H3cgQXyi/Obm+1Ec=;
        b=KC+40LeEoR9RGJam9DGbL8NoKmuS5GbS6HZr1SgEbRxELFWrHNzCm0n1++uQebM0gI
         L+s87TRAoXQOovIqAW8YcmutHHgK87f3pCgNQiNt6gDjvzB7t4bM6KrgDB8/I7gBmVSc
         lWGBa1VXB2KAP0WWNtTRdnOs0WxOnb14Oc2KladaBUZlkGtTChWWF/y8dnw/uW0kEZR+
         u4Um6eizGVMqpePo3nUydVX8QWbKMoj64IRG5QzizT/bIHPz/QvIFzJi0lcWn9a0TN8U
         CoxA580AV1/lOTl7qNwhPiV7uGRx/UC9Vsc8Nq2xcw9T2VwcnwStdNJtSPLS65CLhm1s
         J9yQ==
Subject: [PATCH RESEND -perfbook 04/10] defer/rcuapi: Add index tags for RCU
 APIs
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5bedaa40-af00-d470-a82b-7a89ccaff6d1@gmail.com>
Date: Thu, 6 Jan 2022 16:37:28 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 116 +++++++++++++++++++++++------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index c152251b..6cd30c0f 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -181,20 +181,20 @@ The ``RCU'' column corresponds to the consolidation of the
 three Linux-kernel RCU
 implementations~\cite{PaulEMcKenney2019RCUCVE,McKenney:2019:CRS:3319647.3325836},
 in which RCU read-side critical sections start with
-\co{rcu_read_lock()}, \co{rcu_read_lock_bh()}, or \co{rcu_read_lock_sched()}
-and end with \co{rcu_read_unlock()}, \co{rcu_read_unlock_bh()},
-or \co{rcu_read_unlock_sched()}, respectively.
+\apik{rcu_read_lock()}, \apik{rcu_read_lock_bh()}, or \apik{rcu_read_lock_sched()}
+and end with \apik{rcu_read_unlock()}, \apik{rcu_read_unlock_bh()},
+or \apik{rcu_read_unlock_sched()}, respectively.
 Any region of code that disables bottom halves, interrupts, or preemption
 also acts as an RCU read-side critical section.
 RCU read-side critical sections may be nested.
 The corresponding synchronous update-side primitives,
-\co{synchronize_rcu()} and \co{synchronize_rcu_expedited()}, along with
-their synonym \co{synchronize_net()}, wait for any type of currently
+\apik{synchronize_rcu()} and \apik{synchronize_rcu_expedited()}, along with
+their synonym \apik{synchronize_net()}, wait for any type of currently
 executing RCU read-side critical sections to complete.
 The length of this wait is known as a ``\IX{grace period}'', and
-\co{synchronize_rcu_expedited()} is designed to reduce \IXh{grace-period}
+\apik{synchronize_rcu_expedited()} is designed to reduce \IXh{grace-period}
 {latency} at the expense of increased CPU overhead and IPIs.
-The asynchronous update-side primitive, \co{call_rcu()},
+The asynchronous update-side primitive, \apik{call_rcu()},
 invokes a specified function with a specified argument after a
 subsequent grace period.
 For example, \co{call_rcu(p,f);} will result in
@@ -204,7 +204,7 @@ There are situations,
 such as when unloading a Linux-kernel module that uses \co{call_rcu()},
 when it is necessary to wait for all
 outstanding RCU callbacks to complete~\cite{PaulEMcKenney2007rcubarrier}.
-The \co{rcu_barrier()} primitive does this job.
+The \apik{rcu_barrier()} primitive does this job.
 
 \QuickQuizSeries{%
 \QuickQuizB{
@@ -231,7 +231,7 @@ The \co{rcu_barrier()} primitive does this job.
 
 	But not in earlier kernels, and especially not when using
 	preemptible RCU\@!
-	You instead want \co{synchronize_irq()}.
+	You instead want \apik{synchronize_irq()}.
 	Alternatively, you can place calls to \co{rcu_read_lock()}
 	and \co{rcu_read_unlock()} in the specific interrupt handlers that
 	you want \co{synchronize_rcu()} to wait for.
@@ -248,23 +248,23 @@ In the context of RCU, type-safe memory guarantees that a given
 data element will not change type during any RCU read-side critical section
 that accesses it.
 To make use of RCU-based type-safe memory, pass
-\co{SLAB_TYPESAFE_BY_RCU} to \co{kmem_cache_create()}.
+\apik{SLAB_TYPESAFE_BY_RCU} to \apik{kmem_cache_create()}.
 
 The ``SRCU'' column in
 \cref{tab:defer:RCU Wait-to-Finish APIs}
 displays a specialized RCU API that permits general sleeping in SRCU
 read-side critical
 sections~\cite{PaulEMcKenney2006c}
-delimited by \co{srcu_read_lock()} and \co{srcu_read_unlock()}.
-However, unlike RCU, SRCU's \co{srcu_read_lock()} returns a value that
-must be passed into the corresponding \co{srcu_read_unlock()}.
+delimited by \apik{srcu_read_lock()} and \apik{srcu_read_unlock()}.
+However, unlike RCU, SRCU's \apik{srcu_read_lock()} returns a value that
+must be passed into the corresponding \apik{srcu_read_unlock()}.
 This difference is due to the fact that the SRCU user allocates an
-\co{srcu_struct} for each distinct SRCU usage.
+\apik{srcu_struct} for each distinct SRCU usage.
 These distinct \co{srcu_struct} structures prevent SRCU read-side critical
-sections from blocking unrelated \co{synchronize_srcu()} and
-\co{synchronize_srcu_expedited()} invocations.
-Of course, use of either \co{synchronize_srcu()} or
-\co{synchronize_srcu_expedited()} within an SRCU read-side critical
+sections from blocking unrelated \apik{synchronize_srcu()} and
+\apik{synchronize_srcu_expedited()} invocations.
+Of course, use of either \apik{synchronize_srcu()} or
+\apik{synchronize_srcu_expedited()} within an SRCU read-side critical
 section can result in self-deadlock, so should be avoided.
 As with RCU, SRCU's \co{synchronize_srcu_expedited()} decreases
 grace-period latency compared to \co{synchronize_srcu()}, but at
@@ -301,7 +301,7 @@ srcu_read_unlock(&ssb, idx);
 }\QuickQuizEnd
 
 Similar to normal RCU, self-deadlock can be avoided using the
-asynchronous \co{call_srcu()} function.
+asynchronous \apik{call_srcu()} function.
 However, special care must be taken when using \co{call_srcu()} because
 a single task could register SRCU callbacks very quickly.
 Given that SRCU allows readers to block for arbitrary periods of
@@ -310,7 +310,7 @@ In contrast, given the synchronous \co{synchronize_srcu()}
 interface, a given task must finish waiting for a given grace period
 before it can start waiting for the next one.
 
-Also similar to RCU, there is an \co{srcu_barrier()} function that waits
+Also similar to RCU, there is an \apik{srcu_barrier()} function that waits
 for all prior \co{call_srcu()} callbacks to be invoked.
 
 In other words, SRCU compensates for its extremely weak
@@ -345,7 +345,7 @@ The key to answering this question is to note that trampoline code
 never contains code that either directly or indirectly does a
 voluntary context switch.
 This code might be preempted, but it will never directly or indirectly
-invoke \co{schedule()}.
+invoke \apik{schedule()}.
 This suggests a variant of RCU having voluntary context switches and
 idle execution as its only quiescent states.
 This variant is Tasks RCU\@.
@@ -353,10 +353,10 @@ This variant is Tasks RCU\@.
 Tasks RCU is unusual in having no read-side marking functions, which
 is good given that its main use case has nowhere to put such markings.
 Instead, calls to \co{schedule()} serve directly as quiescent states.
-Updates can use \co{synchronize_rcu_tasks()} to wait for all pre-existing
+Updates can use \apik{synchronize_rcu_tasks()} to wait for all pre-existing
 trampoline execution to complete, or they can use its asynchronous
-counterpart, \co{call_rcu_tasks()}.
-There is also an \co{rcu_barrier_tasks()} that waits for completion
+counterpart, \apik{call_rcu_tasks()}.
+There is also an \apik{rcu_barrier_tasks()} that waits for completion
 of callbacks corresponding to all prior invocations of \co{call_rcu_tasks()}.
 There is no \co{synchronize_rcu_tasks_expedited()} because there has
 not yet been a request for it, though implementing a useful variant of
@@ -473,10 +473,10 @@ APIs described in
 \cref{sec:defer:RCU has List-Processing APIs}.
 
 The first category publishes pointers to new data items.
-The \co{rcu_assign_pointer()} primitive ensures that any
+The \apik{rcu_assign_pointer()} primitive ensures that any
 prior initialization remains ordered before the assignment to the
 pointer on weakly ordered machines.
-The \co{rcu_replace_pointer()} primitive updates the pointer just like
+The \apik{rcu_replace_pointer()} primitive updates the pointer just like
 \co{rcu_assign_pointer()} does, but also returns the previous value,
 just like \co{rcu_dereference_protected()} (see below) would, including
 the lockdep expression.
@@ -543,19 +543,19 @@ rcu_read_unlock();
 }\QuickQuizEndE
 }
 
-The \co{rcu_pointer_handoff()} primitive simply returns its sole argument,
+The \apik{rcu_pointer_handoff()} primitive simply returns its sole argument,
 but is useful to tooling checking for pointers being leaked from
 RCU read-side critical sections.
 Use of \co{rcu_pointer_handoff()} indicates to such tooling that protection
 of the structure in question has been handed off from RCU to some other
 mechanism, such as locking or reference counting.
 
-The \co{RCU_INIT_POINTER()} macro can be used to initialize RCU-protected
+The \apik{RCU_INIT_POINTER()} macro can be used to initialize RCU-protected
 pointers that have not yet been exposed to readers, or alternatively,
 to set RCU-protected pointers to \co{NULL}.
 In these restricted cases, the memory-barrier instructions provided by
 \co{rcu_assign_pointer()} are not needed.
-Similarly, \co{RCU_POINTER_INITIALIZER()} provides a \GCC-style
+Similarly, \apik{RCU_POINTER_INITIALIZER()} provides a \GCC-style
 structure initializer to allow easy initialization of RCU-protected
 pointers in structures.
 
@@ -568,9 +568,9 @@ read-side critical section could result in the pointed-to object being
 freed at any time.
 However, if the pointer is merely to be tested and not dereferenced,
 the freeing of the pointed-to object is not necessarily a problem.
-In this case, \co{rcu_access_pointer()} may be used.
+In this case, \apik{rcu_access_pointer()} may be used.
 Normally, however, RCU read-side protection is required, and so the
-\co{rcu_dereference()} primitive uses the Linux kernel's \co{lockdep}
+\apik{rcu_dereference()} primitive uses the Linux kernel's \co{lockdep}
 facility~\cite{JonathanCorbet2006lockdep} to verify that this
 \co{rcu_dereference()} invocation is under the protection of
 \co{rcu_read_lock()}, \co{srcu_read_lock()}, or some other RCU read-side
@@ -581,21 +581,21 @@ used outside of an RCU read-side critical section.
 
 Another situation where protection is not required is when update-side code
 accesses the RCU-protected pointer while holding the update-side lock.
-The \co{rcu_dereference_protected()} API member is provided for this
+The \apik{rcu_dereference_protected()} API member is provided for this
 situation.
 Its first parameter is the RCU-protected pointer, and the second
 parameter takes a lockdep expression describing which locks must be
 held in order for the access to be safe.
 Code invoked both from readers and updaters can use
-\co{rcu_dereference_check()}, which also takes a lockdep expression, but
+\apik{rcu_dereference_check()}, which also takes a lockdep expression, but
 which may also be invoked from read-side code not holding the locks.
 In some cases, the lockdep expressions can be very complex, for example,
 when using fine-grained locking, any of a very large number of locks
 might be held, and it might be quite difficult to work out which applies.
-In these (hopefully rare) cases, \co{rcu_dereference_raw()} provides
+In these (hopefully rare) cases, \apik{rcu_dereference_raw()} provides
 protection but does not check for being invoked within a reader or with
 any particular lock being held.
-The \co{rcu_dereference_raw_notrace()} API member acts similarly, but
+The \apik{rcu_dereference_raw_notrace()} API member acts similarly, but
 cannot be traced, and may therefore be safely used by tracing code.
 
 Although pretty much any linked structure can be accessed by manipulating
@@ -678,9 +678,9 @@ Should a reader encounter a \co{NULL} pointer not matching the index of
 the bucket it started from, that reader knows that an element it was
 traversing was moved to some other bucket during the traversal, taking
 that reader with it.
-The reader can use the \co{is_a_nulls()} function (which returns true
+The reader can use the \apik{is_a_nulls()} function (which returns true
 if passed an \co{hlist_nulls} \co{NULL} pointer) to determine when
-it reaches the end of a list, and the \co{get_nulls_value()} function
+it reaches the end of a list, and the \apik{get_nulls_value()} function
 (which returns its argument's \co{NULL}-pointer identifier) to fetch
 the type of \co{NULL} pointer.
 When \co{get_nulls_values()} returns an unexpected value, the reader
@@ -835,7 +835,7 @@ directory of the Linux-kernel source tree and at
 Linux Weekly News~\cite{PaulEMcKenney2019RCUAPI}.
 
 However, the remainder of this section expands on the use of
-\co{list_replace_rcu()}, given that this API member gave RCU its name.
+\apik{list_replace_rcu()}, given that this API member gave RCU its name.
 This API member is used to carry out more complex updates in which an
 element in the middle of the list having multiple fields is atomically
 updated, so that a given reader sees either the old set of values or
@@ -921,7 +921,7 @@ other, not a mixture of the two.
 
 After the \co{synchronize_rcu()} on \clnref{sync_rcu} returns,
 a grace period will have elapsed, and so all reads that started before the
-\co{list_replace_rcu()} will have completed.
+\apik{list_replace_rcu()} will have completed.
 In particular, any readers that might have been holding references
 to the \co{5,6,7} element are guaranteed to have exited
 their RCU read-side critical sections, and are thus prohibited from
@@ -932,7 +932,7 @@ to the old element, as indicated its green shading in the sixth row of
 As far as the readers are concerned, we are back to having a single version
 of the list, but with the new element in place of the old.
 
-After the \co{kfree()} on \clnref{kfree} completes, the list will
+After the \apik{kfree()} on \clnref{kfree} completes, the list will
 appear as shown on the final row of
 \cref{fig:defer:RCU Replacement in Linked List}.
 \end{fcvref}
@@ -1002,21 +1002,21 @@ parameters, and return values allows the Linux kernel's \co{sparse}
 tool to detect situtations where RCU-protected pointers are
 incorrectly accessed using plain C-language loads and stores.
 
-Debug-object support is automatic for any \co{rcu_head} structures
+Debug-object support is automatic for any \apik{rcu_head} structures
 that are part of a structure obtained from the Linux kernel's
 memory allocators, but those building their own special-purpose
-memory allocators can use \co{init_rcu_head()} and \co{destroy_rcu_head()}
+memory allocators can use \apik{init_rcu_head()} and \apik{destroy_rcu_head()}
 at allocation and free time, respectively.
 Those using \co{rcu_head} structures allocated on the function-call
-stack (it happens!\@) may use \co{init_rcu_head_on_stack()}
-before first use and \co{destroy_rcu_head_on_stack()} after last use,
+stack (it happens!\@) may use \apik{init_rcu_head_on_stack()}
+before first use and \apik{destroy_rcu_head_on_stack()} after last use,
 but before returning from the function.
 Debug-object support allows detection of bugs involving passing the
 same \co{rcu_head} structure to \co{call_rcu()} and friends in
 quick succession, which is the \co{call_rcu()} counterpart to the
 infamous double-free class of memory-allocation bugs.
 
-Stall-warning control is provided by \co{rcu_cpu_stall_reset()}, which
+Stall-warning control is provided by \apik{rcu_cpu_stall_reset()}, which
 allows the caller to suppress RCU CPU stall warnings for the remainder
 of the current grace period.
 RCU CPU stall warnings help pinpoint situations where an RCU read-side
@@ -1024,18 +1024,18 @@ critical section runs for an excessive length of time, and it is useful
 for things like kernel debuggers to be able to suppress them, for example,
 when encountering a breakpoint.
 
-Callback checking is provided by \co{rcu_head_init()} and
-\co{rcu_head_after_call_rcu()}.
+Callback checking is provided by \apik{rcu_head_init()} and
+\apik{rcu_head_after_call_rcu()}.
 The former is invoked on an \co{rcu_head} structure before it is passed
 to \co{call_rcu()}, and then \co{rcu_head_after_call_rcu()} will
 check to see if the callback has been invoked with the specified
 function.
 
 Support for lockdep~\cite{JonathanCorbet2006lockdep} includes
-\co{rcu_read_lock_held()},
-\co{rcu_read_lock_bh_held()},
-\co{rcu_read_lock_sched_held()}, and
-\co{srcu_read_lock_held()},
+\apik{rcu_read_lock_held()},
+\apik{rcu_read_lock_bh_held()},
+\apik{rcu_read_lock_sched_held()}, and
+\apik{srcu_read_lock_held()},
 each of which returns \co{true} if invoked within the corresponding
 type of RCU read-side critical section.
 
@@ -1049,18 +1049,18 @@ type of RCU read-side critical section.
 
 Because \co{rcu_read_lock()} cannot be used from the idle loop,
 and because energy-efficiency concerns have caused the idle loop
-to become quite ornate, \co{rcu_is_watching()} returns true if
+to become quite ornate, \apik{rcu_is_watching()} returns true if
 invoked in a context where use of \co{rcu_read_lock()} is legal.
 Note again that \co{srcu_read_lock()} may be used from idle and
 even offline CPUs, which means that \co{rcu_is_watching()} does not
 apply to SRCU\@.
 
-\co{RCU_LOCKDEP_WARN()} emits a warning if lockdep is enabled and if
+\apik{RCU_LOCKDEP_WARN()} emits a warning if lockdep is enabled and if
 its argument evaluates to \co{true}.
 For example, \co{RCU_LOCKDEP_WARN(!rcu_read_lock_held())} would emit a
 warning if invoked outside of an RCU read-side critical section.
 
-\co{RCU_NONIDLE()} may be used to force RCU to watch when executing
+\apik{RCU_NONIDLE()} may be used to force RCU to watch when executing
 the statement that is passed in as the sole argument.
 For example, \co{RCU_NONIDLE(WARN_ON(!rcu_is_watching()))}
 would never emit a warning.
@@ -1068,7 +1068,7 @@ However, changes in the 2020--2021 timeframe extend RCU's reach deeper
 into the idle loop, which should greatly reduce or even eliminate the
 need for \co{RCU_NONIDLE()}.
 
-Finally,  \co{rcu_sleep_check()} emits a warning if invoked within
+Finally,  \apik{rcu_sleep_check()} emits a warning if invoked within
 an RCU, RCU-bh, or RCU-sched read-side critical section.
 
 \subsubsection{Where Can RCU's APIs Be Used?}
@@ -1087,10 +1087,10 @@ The RCU read-side primitives may be used in any environment, including NMI,
 the RCU mutation and asynchronous grace-period primitives may be used in any
 environment other than NMI, and, finally, the RCU synchronous grace-period
 primitives may be used only in process context.
-The RCU list-traversal primitives include \co{list_for_each_entry_rcu()},
-\co{hlist_for_each_entry_rcu()}, etc.
+The RCU list-traversal primitives include \apik{list_for_each_entry_rcu()},
+\apik{hlist_for_each_entry_rcu()}, etc.
 Similarly, the RCU list-mutation primitives include
-\co{list_add_rcu()}, \co{hlist_del_rcu()}, etc.
+\apik{list_add_rcu()}, \apik{hlist_del_rcu()}, etc.
 
 Note that primitives from other families of RCU may be substituted,
 for example, \co{srcu_read_lock()} may be used in any context
-- 
2.17.1


