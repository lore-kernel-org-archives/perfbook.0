Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51156 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725745AbeLBMoC (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 2 Dec 2018 07:44:02 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB219H9e099705
        for <perfbook@vger.kernel.org>; Sat, 1 Dec 2018 20:10:56 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p4384kuv4-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 01 Dec 2018 20:10:56 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 2 Dec 2018 01:10:55 -0000
Date: Sat, 1 Dec 2018 17:10:53 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: lockless_dereference() in perfbook
Reply-To: paulmck@linux.ibm.com
References: <04a39364-9f34-16e6-fb01-4ac85a50fb6f@gmail.com>
 <20181201183019.GV4170@linux.ibm.com>
 <1bb21303-4d09-a222-e50e-653e4ac22f09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bb21303-4d09-a222-e50e-653e4ac22f09@gmail.com>
Message-Id: <20181202011053.GZ4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 02, 2018 at 07:25:21AM +0900, Akira Yokosawa wrote:
> On 2018/12/01 10:30:19 -0800, Paul E. McKenney wrote:
> > On Sat, Dec 01, 2018 at 04:48:03PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> As LKMM dropped lockless_dereference() when it was merged in v4.17,
> >> CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus fails to
> >> be evaluated by "make run-herd7" under CodeSamples/formal/herd.
> >>
> >> lockless_dereference() is still covered by CodeSamples/formal/litmus/api.h
> >> and klitmus7, so the test can be evaluated by litmus7 and "klitmus7 at the
> >> moment.
> >>
> >> In commit 48ec12dac0c3 ("memorder: Update based on v4.15 Linux kernel
> >> de-Alpha-ication"), you added a footnote in Section 15.2.3 saying:
> >>
> >>     Note that lockless_dereference() is not needed on v4.15 and later,
> >>     and therefore is not available in these later Linux kernels.
> >>
> >> There remain several lockless_dereference()s in perfbook without any
> >> updates.
> >>
> >> In the Answer to Quick Quiz 15.15, lockless_dereference() is mentioned
> >> several times.
> >>
> >> Quick Quiz 15.17 says:
> >>
> >>     Why doesn't line 18 of Listing 15.12 need a lockless_dereference()?
> >>
> >> Leading paragraph of Section 15.3.2.1 says:
> >>
> >>     The load that heads your dependency chain must use proper ordering,
> >>     for example, lockless_dereference(), rcu_dereference(), or a READ_ONCE()
> >>     followed by smp_read_barrier_depends().
> >>
> >> In the middle of Section 15.5, there is a sentence:
> >>
> >>     Note also that a dependency leading to a load must be headed by a
> >>     lockless_dereference() or an rcu_dereference(): READ_ONCE() is not
> >>     sufficient.
> >>
> >> Could you look into them?
> >>
> >> One problem in regard to litmus tests might be that there is no means
> >> to indicate plain accesses with no memory barrier in current LKMM.
> >> At the moment, C-MP+o-wmb-o+o-addr-o.litmus behaves identically as
> >> C-MP+o-wmb-o+ld-addr-o.litmus would do.
> > 
> > Good catches!  How about the following?
> > 
> > 1.	I remove CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus.
> > 
> > 2.	I add a comment to the lockless_dereference() call in
> > 	lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test
> > 	stating that this API member is obsolete.
> > 
> > 3.	I remove the (\path{C-MP+o-wmb-o+ld-addr-o.litmus}) from the
> > 	discussion.  I also add a LaTeX comment stating which commit
> > 	removed this file for future reference.
> > 
> > 4.	I remove lockless_dereference() from CodeSamples/formal/litmus/api.h.
> > 
> > Does that sound reasonable?
> 
> Yes, it does!
> 
> Maybe discussion of
> lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering)
> needs further tweaks, including the update of its caption, i.e.,
> it is now _ordered_. Quick Quiz 15.13 looks odd as of now.
> 
> And the caption to
> lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test
> also needs update to indicate it is not necessary any more.
> 
> Looking forward to seeing the update.

How about the following?

							Thanx, Paul

------------------------------------------------------------------------

commit c9a15859a4451ee449b8d46dc9845e050acf5760
Author: Paul E. McKenney <paulmck@linux.ibm.com>
Date:   Sat Dec 1 17:07:35 2018 -0800

    memorder: Clean up reference to lockless_dereference()
    
    The lockless_dereference() primitive has been obsolete since Linux
    kernel version v4.15, but it is mentioned in several places in the
    memory-ordering chapter and in a litmus test.  This commit removes that
    litmus test, removes the definition of lockless_dereference(), makes
    READ_ONCE() work properly on DEC Alpha, and clearly labels remaining
    instances of lockless_dereference() in the text as obsolete.
    
    Reported-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>

diff --git a/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus b/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus
deleted file mode 100644
index 117a6e3ffda8..000000000000
--- a/CodeSamples/formal/litmus/C-MP+o-wmb-o+ld-addr-o.litmus
+++ /dev/null
@@ -1,30 +0,0 @@
-C C-MP+o-wmb-o+ld-ad-o
-
-{
-int y=1;
-int *x1 = &y;
-}
-
-{
-#include "api.h"
-}
-
-P0(int* x0, int** x1) {
-
-	WRITE_ONCE(*x0, 2);
-	smp_wmb();
-	WRITE_ONCE(*x1, x0);
-
-}
-
-P1(int** x1) {
-
-	int *r2;
-	int r3;
-
-	r2 = lockless_dereference(*x1);
-	r3 = READ_ONCE(*r2);
-
-}
-
-exists (1:r2=x0 /\ 1:r3=1)
diff --git a/CodeSamples/formal/litmus/api.h b/CodeSamples/formal/litmus/api.h
index 0f14a48dd128..8bf0ba629a9e 100644
--- a/CodeSamples/formal/litmus/api.h
+++ b/CodeSamples/formal/litmus/api.h
@@ -1,7 +1,12 @@
 #ifndef __API_H__
 #define __API_H__
 #ifndef READ_ONCE
-#define READ_ONCE(x) __atomic_load_n((typeof(x) *)&(x), __ATOMIC_RELAXED)
+#define __READ_ONCE(x) __atomic_load_n((typeof(x) *)&(x), __ATOMIC_RELAXED)
+#ifdef __alpha__
+#define READ_ONCE(x) ({ typeof(x) ___x = __READ_ONCE(x); smp_mb(); ___x; })
+#else
+#define READ_ONCE(x) __READ_ONCE(x)
+#endif
 #define WRITE_ONCE(x, v) __atomic_store_n((typeof(x) *)&(x), (v), __ATOMIC_RELAXED)
 #define smp_mb() __atomic_thread_fence(__ATOMIC_SEQ_CST)
 #define smp_rmb() __atomic_thread_fence(__ATOMIC_ACQUIRE) /* outside std. */
@@ -14,10 +19,5 @@
 	__atomic_compare_exchange_n((x), &__old, (n), 1, __ATOMIC_SEQ_CST, __ATOMIC_RELAXED); \
 	__old; \
 })
-#ifdef __alpha__
-#define lockless_dereference(x) ({ typeof(x) ___x = READ_ONCE(x); smp_mb(); ___x; })
-#else
-#define lockless_dereference(x) READ_ONCE(x)
-#endif
 #endif
 #endif
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 943c3af3fe6f..bdeaba10e0b2 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -590,8 +590,7 @@ are at most two threads involved.
 	Section~\ref{sec:memorder:Address- and Data-Dependency Difficulties}.
 
 	The \co{*_dereference()} row captures the address and data
-	dependency ordering provided by \co{lockless_dereference()},
-	\co{rcu_dereference()}, and friends.
+	dependency ordering provided by \co{rcu_dereference()} and friends.
 
 	The ``Successful \co{*_acquire()}'' row captures the fact that many
 	CPUs have special ``acquire'' forms of loads and of atomic RMW
@@ -1411,7 +1410,7 @@ P1(int** x1) {
   int *r2;
   int r3;
 
-  r2 = lockless_dereference(*x1);
+  r2 = lockless_dereference(*x1); // Obsolete
   r3 = READ_ONCE(*r2);
 
 }
@@ -1426,12 +1425,14 @@ exists (1:r2=x0 /\ 1:r3=1)
 \end{listing}
 
 Listing~\ref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}
-(\path{C-MP+o-wmb-o+ld-addr-o.litmus})
-shows how to make this work reliably on old Linux kernels running on
+% \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
+% ("styleguide: Loosen restriction on comment in litmus test")
+shows how to make this work reliably on pre-v4.15 Linux kernels running on
 DEC Alpha, by
 replacing line~21's \co{READ_ONCE()} with \co{lockless_dereference()},\footnote{
 	Note that \co{lockless_dereference()} is not needed on v4.15 and
-	later, and therefore is not available in these later Linux kernels.}
+	later, and therefore is not available in these later Linux kernels.
+	Nor is it needed in versions of this book containing this sentence.}
 which acts like \co{READ_ONCE()} on all platforms other than DEC Alpha,
 where it acts like a \co{READ_ONCE()} followed by an \co{smp_mb()},
 thereby forcing the required ordering on all platforms, in turn
@@ -1482,8 +1483,7 @@ Because no production-quality platform speculates stores,
 it is not possible for the \co{WRITE_ONCE()} on line~10 to overwrite
 the \co{WRITE_ONCE()} on line~21, meaning that the \co{exists}
 clause on line~25 cannot trigger, even on DEC Alpha, even
-without the \co{lockless_dereference()} that is required in the
-dependent-load case.
+in pre-v4.15 Linux kernels.
 
 \QuickQuiz{}
 	But how do we know that \emph{all} platforms really avoid
@@ -1520,19 +1520,23 @@ dependent-load case.
 	There is one (famous) exception to this rule for weakly ordered
 	platforms, and that exception is DEC Alpha for load-to-load
 	address dependencies.
-	And this is why DEC Alpha requires the explicit memory barrier
-	supplied for it by the \co{lockless_dereference()} on line~21 of
+	And this is why, in Linux kernels predating v4.15, DEC Alpha
+	requires the explicit memory barrier supplied for it by the
+	now-obsolete \co{lockless_dereference()} on line~21 of
 	Listing~\ref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}.
 	However, DEC Alpha does track load-to-store address dependencies,
 	which is why line~20 of
 	Listing~\ref{lst:memorder:S Address-Dependency Litmus Test}
-	does not have a \co{lockless_dereference()}.
+	does not need a \co{lockless_dereference()}, even in Linux
+	kernels predating v4.15.
 
 	To sum up, current platforms either respect address dependencies
 	implicitly, as is the case for TSO platforms (x86, mainframe,
 	SPARC,~...), have hardware tracking for address dependencies
-	(ARM, PowerPC, MIPS,~...), or have the required memory barriers
-	supplied by \co{lockless_dereference()} (DEC Alpha).
+	(ARM, PowerPC, MIPS,~...), have the required memory barriers
+	supplied by \co{READ_ONCE()} (DEC Alpha in Linux kernel v4.15 and
+	later), or require the memory barriers supplied by
+	\co{rcu_dereference()} (DEC Alpha in Linux kernel v4.14 and earlier).
 } \QuickQuizEnd
 
 \QuickQuiz{}
@@ -1605,16 +1609,6 @@ The value loaded by line~18 is what line~19 stores.
 The ordering provided by this data dependency is sufficient to prevent
 the \co{exists} clause from triggering.
 
-\QuickQuiz{}
-	Why doesn't line~18 of
-	Listing~\ref{lst:memorder:Load-Buffering Data-Dependency Litmus Test}
-	need a \co{lockless_dereference()}?
-\QuickQuizAnswer{
-	Data dependencies are always load-to-store dependencies, and
-	so all platforms respect them, even DEC Alpha, and for the
-	same reasons that they respect load-to-store address dependencies.
-} \QuickQuizEnd
-
 Just as with address dependencies, data dependencies are
 fragile and can be easily broken by compiler optimizations, as discussed in
 Section~\ref{sec:memorder:Address- and Data-Dependency Difficulties}.
@@ -3388,9 +3382,7 @@ your compiler from breaking your dependencies.
 
 \subsubsection{Give your dependency chain a good start}
 The load that heads your dependency chain must use proper
-ordering, for example, \co{lockless_dereference()},
-\co{rcu_dereference()}, or
-a \co{READ_ONCE()} followed by \co{smp_read_barrier_depends()}.
+ordering, for example \co{rcu_dereference()} or \co{READ_ONCE()}.
 Failure to follow this rule can have serious side effects:
 
 \begin{enumerate}
@@ -4353,8 +4345,7 @@ set of memory-ordering primitives, which are as follows:
 	that depend on prior operations to be ordered.
 	This primitive is a no-op on all platforms except Alpha, but
 	is normally not used directly, but rather as part of
-	something like \co{lockless_dereference()} or
-	\co{rcu_dereference()}.
+	something like \co{READ_ONCE()} or \co{rcu_dereference()}.
 \item	[\tco{smp_mb__before_atomic()}] that forces ordering of accesses
 	preceding the \co{smp_mb__before_atomic()} against accesses following
 	a later RMW atomic operation.
@@ -5133,8 +5124,8 @@ You can replace a given acquire with a a dependency in environments permitting
 this, keeping in mind that the C11 standard's memory model does \emph{not}
 permit this.
 Note also that a dependency leading to a load must be headed by
-a \co{lockless_dereference()} or an \co{rcu_dereference()}:
-\co{READ_ONCE()} is not sufficient.
+a \co{READ_ONCE()} or an \co{rcu_dereference()}:
+a plain C-language load is not sufficient.
 Never forget to carefully review
 Sections~\ref{sec:memorder:Address- and Data-Dependency Difficulties}
 and~\ref{sec:memorder:Control-Dependency Calamities}, because

