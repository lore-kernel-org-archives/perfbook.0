Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=lk4V94+r9BDmT+Dpy7HAR9J6PdKEI+OFrZQhRGHxnKE=;
 b=lhut72DFNKUvmCqZoyLu0thEkGy5esXDtH1xAnPJwXNcDAOqBlVFaPQ+s9W7y+Pwvw
 gCrOAzHgcQO2DJ3Y7Iq/YBtxsPil+uI+eXj7qeu8AqVsoGY02RfFGAx8CLh6oT0YwPeq
 1xX27QEYfocxhyYbTA4Rv1rApmZSGB3YALpvyIX3yAEvgWAEFZZTu+ZA4vxtklZbn9Ex
 pbzeK0xnPHJanF6PW4JSiUYU4o+qhGmyUM0byM2J4phKqGyTX/ka/Ix3TDm8xRObdexo
 o/GTXRX23Zc8ApmvEVG9mnYbY3tztq0hBnV94mOn1/l4Zdx6POSQILsgnPjbvtdcr7Zp
 3niA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] Convert code snippets to 'listing' env (together,
 advsync, rt, future)
Message-ID: <64de57b5-12d7-d0fb-673a-b53f0f6c6663@gmail.com>
Date: Sat, 14 Oct 2017 07:57:24 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c8849b06b1563d9d82dfaf0f120932c4998c8b03 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 14 Oct 2017 00:12:52 +0900
Subject: [PATCH 1/2] Convert code snippets to 'listing' env (together, advsync, rt, future)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/advsync.tex   | 10 ++++-----
 future/htm.tex        | 16 +++++++--------
 rt/rt.tex             | 34 +++++++++++++++----------------
 together/applyrcu.tex | 56 +++++++++++++++++++++++++--------------------------
 together/refcnt.tex   | 38 +++++++++++++++++-----------------
 5 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index adf1dc9..3b04aff 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -188,7 +188,7 @@ algorithm as wait-free.
 This algorithm is probably the most heavily used NBS algorithm in
 the Linux kernel.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 static inline bool
@@ -217,14 +217,14 @@ the Linux kernel.
 \centering
 \theverbbox
 \caption{NBS Enqueue Algorithm}
-\label{fig:count:NBS Enqueue Algorithm}
-\end{figure}
+\label{lst:count:NBS Enqueue Algorithm}
+\end{listing}

 Another common NBS algorithm is the atomic queue where elements are
 enqueued using an atomic exchange instruction~\cite{MagedMichael1993JPDC},
 followed by a store into the \co{->next} pointer of the new element's
 predecessor, as shown in
-Figure~\ref{fig:count:NBS Enqueue Algorithm},
+Listing~\ref{lst:count:NBS Enqueue Algorithm},
 which shows the userspace-RCU library
 implementation~\cite{MathieuDesnoyers2009URCU}.
 Line~9 updates the tail pointer to reference the new element while
@@ -240,7 +240,7 @@ Although mutual exclusion is required to dequeue a single element
 removal of the entire contents of the queue.
 What is not possible is to dequeue any given element in a non-blocking
 manner: The enqueuer might have failed between lines~9 and~10 of the
-figure, so that the element in question is only partially enqueued.
+listing, so that the element in question is only partially enqueued.
 This results in a half-NBS algorithm where enqueues are NBS but
 dequeues are blocking.
 This algorithm is nevertheless used in practice, in part because
diff --git a/future/htm.tex b/future/htm.tex
index 80d3e1e..7c9f610 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -733,7 +733,7 @@ Therefore, the medium-priority threads are in effect blocking the
 high-priority process, which is the rationale for the name ``priority
 inversion.''

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 void boostee(void)
@@ -765,8 +765,8 @@ inversion.''
 \centering
 \theverbbox
 \caption{Exploiting Priority Boosting}
-\label{fig:future:Exploiting Priority Boosting}
-\end{figure}
+\label{lst:future:Exploiting Priority Boosting}
+\end{listing}

 One way to avoid priority inversion is \emph{priority inheritance},
 in which a high-priority thread blocked on a lock temporarily donates
@@ -774,10 +774,10 @@ its priority to the lock's holder, which is also called \emph{priority
 boosting}.
 However, priority boosting can be used for things other than avoiding
 priority inversion, as shown in
-Figure~\ref{fig:future:Exploiting Priority Boosting}.
-Lines~1-12 of this figure show a low-priority process that must
+Listing~\ref{lst:future:Exploiting Priority Boosting}.
+Lines~1-12 of this listing show a low-priority process that must
 nevertheless run every millisecond or so, while lines~14-24 of
-this same figure show a high-priority process that uses priority
+this same listing show a high-priority process that uses priority
 boosting to ensure that \co{boostee()} runs periodically as needed.

 The \co{boostee()} function arranges this by always holding one of
@@ -786,7 +786,7 @@ the two \co{boost_lock[]} locks, so that lines~20-21 of

 \QuickQuiz{}
 	But the \co{boostee()} function in
-	Figure~\ref{fig:future:Exploiting Priority Boosting}
+	Listing~\ref{lst:future:Exploiting Priority Boosting}
 	alternatively acquires its locks in reverse order!
 	Won't this result in deadlock?
 \QuickQuizAnswer{
@@ -816,7 +816,7 @@ this thread might never again get a chance to run.

 And if the \co{boostee()} thread is not holding the lock, then
 the \co{booster()} thread's empty critical section on lines~20 and~21 of
-Figure~\ref{fig:future:Exploiting Priority Boosting}
+Listing~\ref{lst:future:Exploiting Priority Boosting}
 will become an empty transaction that has no effect, so that
 \co{boostee()} never runs.
 This example illustrates some of the subtle consequences of
diff --git a/rt/rt.tex b/rt/rt.tex
index f1c0ae1..d9c32aa 100644
--- a/rt/rt.tex
+++ b/rt/rt.tex
@@ -1150,7 +1150,7 @@ sections~\cite{DinakarGuniguntala2008IBMSysJ}.
 Otherwise, long RCU read-side critical sections would result in
 excessive real-time latencies.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 void __rcu_read_lock(void)
@@ -1180,8 +1180,8 @@ excessive real-time latencies.
 \centering
 \theverbbox
 \caption{Preemptible Linux-Kernel RCU}
-\label{fig:rt:Preemptible Linux-Kernel RCU}
-\end{figure}
+\label{lst:rt:Preemptible Linux-Kernel RCU}
+\end{listing}

 A preemptible RCU implementation was therefore added to the Linux kernel.
 This implementation avoids the need to individually track the state of
@@ -1194,7 +1194,7 @@ of the current grace period and
 while in one of those pre-existing critical sections have removed
 themselves from their lists.
 A simplified version of this implementation is shown in
-Figure~\ref{fig:rt:Preemptible Linux-Kernel RCU}.
+Listing~\ref{lst:rt:Preemptible Linux-Kernel RCU}.
 The \co{__rcu_read_lock()} function spans lines~1-5 and
 the \co{__rcu_read_unlock()} function spans lines~7-22.

@@ -1241,7 +1241,7 @@ count on line~20.
 \QuickQuiz{}
 	Suppose that preemption occurs just after the load from
 	\co{t->rcu_read_unlock_special.s} on line~17 of
-	Figure~\ref{fig:rt:Preemptible Linux-Kernel RCU}.
+	Listing~\ref{lst:rt:Preemptible Linux-Kernel RCU}.
 	Mightn't that result in the task failing to invoke
 	\co{rcu_read_unlock_special()}, thus failing to remove itself
 	from the list of tasks blocking the current grace period,
@@ -1460,7 +1460,7 @@ real-time use.
 OSADL runs long-term tests of systems, so referring to their
 website (\url{http://osadl.org/}) can be helpful.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 cd /sys/kernel/debug/tracing
@@ -1473,8 +1473,8 @@ website (\url{http://osadl.org/}) can be helpful.
 \centering
 \theverbbox
 \caption{Locating Sources of OS Jitter}
-\label{fig:rt:Locating Sources of OS Jitter}
-\end{figure}
+\label{lst:rt:Locating Sources of OS Jitter}
+\end{listing}

 Unfortunately, this list of OS-jitter sources can never be complete,
 as it will change with each new version of the kernel.
@@ -1482,7 +1482,7 @@ This makes it necessary to be able to track down additional sources
 of OS jitter.
 Given a CPU $N$ running a CPU-bound usermode thread, the
 commands shown in
-Figure~\ref{fig:rt:Locating Sources of OS Jitter}
+Listing~\ref{lst:rt:Locating Sources of OS Jitter}
 will produce a list of all the times that this CPU entered the kernel.
 Of course, the \co{N} on line~5 must be replaced with the
 number of the CPU in question, and the \co{1} on line~2 may be increased
@@ -1704,7 +1704,7 @@ or about 9,000 degrees of rotation per second, which translates to
 We therefore need to schedule the fuel injection to within a time
 interval of about 100 microseconds.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 if (clock_gettime(CLOCK_REALTIME, &timestart) != 0) {
@@ -1724,15 +1724,15 @@ interval of about 100 microseconds.
 \centering
 \theverbbox
 \caption{Timed-Wait Test Program}
-\label{fig:rt:Timed-Wait Test Program}
-\end{figure}
+\label{lst:rt:Timed-Wait Test Program}
+\end{listing}

 Suppose that a timed wait was to be used to initiate fuel injection,
 although if you are building an engine, I hope you supply a rotation
 sensor.
 We need to test the timed-wait functionality, perhaps using the test program
 shown in
-Figure~\ref{fig:rt:Timed-Wait Test Program}.
+Listing~\ref{lst:rt:Timed-Wait Test Program}.
 Unfortunately, if we run this program, we can get unacceptable timer
 jitter, even in a -rt kernel.

@@ -1789,7 +1789,7 @@ in fields imaginatively named \co{a}, \co{b}, and \co{c}.
 Otherwise, \co{cur_cal} points to a dynamically allocated
 structure providing the current calibration values.

-\begin{figure}[tb]
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}
  1 struct calibration {
@@ -1832,10 +1832,10 @@ structure providing the current calibration values.
 \centering
 \theverbbox
 \caption{Real-Time Calibration Using RCU}
-\label{fig:rt:Real-Time Calibration Using RCU}
-\end{figure}
+\label{lst:rt:Real-Time Calibration Using RCU}
+\end{listing}

-Figure~\ref{fig:rt:Real-Time Calibration Using RCU}
+Listing~\ref{lst:rt:Real-Time Calibration Using RCU}
 shows how RCU can be used to solve this problem.
 Lookups are deterministic, as shown in \co{calc_control()}
 on lines~9-15, consistent with real-time requirements.
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index d477ab5..5e7efff 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -108,7 +108,7 @@ held constant, ensuring that \co{read_count()} sees consistent data.

 \subsubsection{Implementation}

-\begin{figure}[bp]
+\begin{listing}[bp]
 { \scriptsize
 \begin{verbbox}
   1 struct countarray {
@@ -186,11 +186,11 @@ held constant, ensuring that \co{read_count()} sees consistent data.
 \centering
 \theverbbox
 \caption{RCU and Per-Thread Statistical Counters}
-\label{fig:together:RCU and Per-Thread Statistical Counters}
-\end{figure}
+\label{lst:together:RCU and Per-Thread Statistical Counters}
+\end{listing}

 Lines~1-4 of
-Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}
+Listing~\ref{lst:together:RCU and Per-Thread Statistical Counters}
 show the \co{countarray} structure, which contains a
 \co{->total} field for the count from previously exited threads,
 and a \co{counterp[]} array of pointers to the per-thread
@@ -235,7 +235,7 @@ Line~43 picks up the current thread's index, line~45 acquires
 \QuickQuiz{}
 	Hey!!!
 	Line~46 of
-	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}
+	Listing~\ref{lst:together:RCU and Per-Thread Statistical Counters}
 	modifies a value in a pre-existing \co{countarray} structure!
 	Didn't you say that this structure, once made available to
 	\co{read_count()}, remained constant???
@@ -278,7 +278,7 @@ Line~69 can then safely free the old \co{countarray} structure.

 \QuickQuiz{}
 	Wow!
-	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}
+	Listing~\ref{lst:together:RCU and Per-Thread Statistical Counters}
 	contains 69 lines of code, compared to only 42 in
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}.
 	Is this extra complexity really worth it?
@@ -303,7 +303,7 @@ Line~69 can then safely free the old \co{countarray} structure.
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}, but
 	with all the scalability and performance benefits of the
 	implementation shown in
-	Figure~\ref{fig:together:RCU and Per-Thread Statistical Counters}!
+	Listing~\ref{lst:together:RCU and Per-Thread Statistical Counters}!
 } \QuickQuizEnd

 Use of RCU enables exiting threads to wait until other threads are
@@ -389,7 +389,7 @@ tradeoff.
 \subsection{Array and Length}
 \label{sec:together:Array and Length}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct foo {
@@ -401,11 +401,11 @@ tradeoff.
 \centering
 \theverbbox
 \caption{RCU-Protected Variable-Length Array}
-\label{fig:together:RCU-Protected Variable-Length Array}
-\end{figure}
+\label{lst:together:RCU-Protected Variable-Length Array}
+\end{listing}

 Suppose we have an RCU-protected variable-length array, as shown in
-Figure~\ref{fig:together:RCU-Protected Variable-Length Array}.
+Listing~\ref{lst:together:RCU-Protected Variable-Length Array}.
 The length of the array \co{->a[]} can change dynamically, and at any
 given time, its length is given by the field \co{->length}.
 Of course, this introduces the following race condition:
@@ -429,7 +429,7 @@ covered in Chapter~\ref{chp:memorder:Memory Ordering}.
 This works, but incurs read-side overhead and, perhaps worse, requires
 use of explicit memory barriers.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct foo_a {
@@ -445,12 +445,12 @@ use of explicit memory barriers.
 \centering
 \theverbbox
 \caption{Improved RCU-Protected Variable-Length Array}
-\label{fig:together:Improved RCU-Protected Variable-Length Array}
-\end{figure}
+\label{lst:together:Improved RCU-Protected Variable-Length Array}
+\end{listing}

 A better approach is to put the value and the array into the same structure,
 as shown in
-Figure~\ref{fig:together:Improved RCU-Protected Variable-Length Array}.
+Listing~\ref{lst:together:Improved RCU-Protected Variable-Length Array}.
 Allocating a new array (\co{foo_a} structure) then automatically provides
 a new place for the array length.
 This means that if any CPU picks up a reference to \co{->fa}, it is
@@ -480,7 +480,7 @@ A more general version of this approach is presented in the next section.
 \subsection{Correlated Fields}
 \label{sec:together:Correlated Fields}

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct animal {
@@ -496,12 +496,12 @@ A more general version of this approach is presented in the next section.
 \centering
 \theverbbox
 \caption{Uncorrelated Measurement Fields}
-\label{fig:together:Uncorrelated Measurement Fields}
-\end{figure}
+\label{lst:together:Uncorrelated Measurement Fields}
+\end{listing}

 Suppose that each of Sch\"odinger's animals is represented by the
 data element shown in
-Figure~\ref{fig:together:Uncorrelated Measurement Fields}.
+Listing~\ref{lst:together:Uncorrelated Measurement Fields}.
 The \co{meas_1}, \co{meas_2}, and \co{meas_3} fields are a set
 of correlated measurements that are updated periodically.
 It is critically important that readers see these three values from
@@ -521,7 +521,7 @@ measurement values, but it requires copying a large structure due
 to the \co{->photo[]} field.
 This copying might incur unacceptably large overhead.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct measurement {
@@ -541,11 +541,11 @@ This copying might incur unacceptably large overhead.
 \centering
 \theverbbox
 \caption{Correlated Measurement Fields}
-\label{fig:together:Correlated Measurement Fields}
-\end{figure}
+\label{lst:together:Correlated Measurement Fields}
+\end{listing}

 Another approach is to insert a level of indirection, as shown in
-Figure~\ref{fig:together:Correlated Measurement Fields}.
+Listing~\ref{lst:together:Correlated Measurement Fields}.
 When a new measurement is taken, a new \co{measurement} structure
 is allocated, filled in with the measurements, and the \co{animal}
 structure's \co{->mp} field is updated to point to this new
@@ -555,13 +555,13 @@ can be freed.

 \QuickQuiz{}
 	But cant't the approach shown in
-	Figure~\ref{fig:together:Correlated Measurement Fields}
+	Listing~\ref{lst:together:Correlated Measurement Fields}
 	result in extra cache misses, in turn resulting in additional
 	read-side overhead?
 \QuickQuizAnswer{
 	Indeed it can.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
  1 struct measurement {
@@ -582,11 +582,11 @@ can be freed.
 \centering
 \theverbbox
 \caption{Localized Correlated Measurement Fields}
-\label{fig:together:Localized Correlated Measurement Fields}
-\end{figure}
+\label{lst:together:Localized Correlated Measurement Fields}
+\end{listing}

 	One way to avoid this cache-miss overhead is shown in
-	Figure~\ref{fig:together:Localized Correlated Measurement Fields}:
+	Listing~\ref{lst:together:Localized Correlated Measurement Fields}:
 	Simply embed an instance of a \co{measurement} structure
 	named \co{meas}
 	into the \co{animal} structure, and point the \co{->mp}
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 626c375..8a7fa1d 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -149,12 +149,12 @@ of compiler optimizations.
 This is the method of choice when the lock is required to protect
 other operations in addition to the reference count, but where
 a reference to the object must be held after the lock is released.
-Figure~\ref{fig:together:Simple Reference-Count API} shows a simple
+Listing~\ref{lst:together:Simple Reference-Count API} shows a simple
 API that might be used to implement simple non-atomic reference
 counting---although simple reference counting is almost always
 open-coded instead.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct sref {
@@ -188,8 +188,8 @@ open-coded instead.
 \centering
 \theverbbox
 \caption{Simple Reference-Count API}
-\label{fig:together:Simple Reference-Count API}
-\end{figure}
+\label{lst:together:Simple Reference-Count API}
+\end{listing}

 \subsubsection{Atomic Counting}
 \label{sec:together:Atomic Counting}
@@ -203,7 +203,7 @@ Any CPU that hands the object off must first acquire a new reference
 on behalf of the recipient object.
 In the Linux kernel, the \co{kref} primitives are used to implement
 this style of reference counting, as shown in
-Figure~\ref{fig:together:Linux Kernel kref API}.
+Listing~\ref{lst:together:Linux Kernel kref API}.

 Atomic counting is required
 because locking is not used to protect all reference-count operations,
@@ -243,10 +243,10 @@ RCU read-side critical sections.
 	there cannot possibly be any CPU that is permitted
 	to acquire a new reference.
 	This same fact allows the non-atomic check in line~22
-	of Figure~\ref{fig:together:Linux Kernel kref API}.
+	of Listing~\ref{lst:together:Linux Kernel kref API}.
 } \QuickQuizEnd

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 struct kref {
@@ -282,12 +282,12 @@ RCU read-side critical sections.
 \centering
 \theverbbox
 \caption{Linux Kernel \tco{kref} API}
-\label{fig:together:Linux Kernel kref API}
-\end{figure}
+\label{lst:together:Linux Kernel kref API}
+\end{listing}

 The \co{kref} structure itself, consisting of a single atomic
 data item, is shown in lines~1-3 of
-Figure~\ref{fig:together:Linux Kernel kref API}.
+Listing~\ref{lst:together:Linux Kernel kref API}.
 The \co{kref_init()} function on lines~5-8 initializes the counter
 to the value ``1''.
 Note that the \co{atomic_set()} primitive is a simple
@@ -314,7 +314,7 @@ Otherwise, \co{kref_sub()} returns zero, informing the caller that
 \QuickQuiz{}
 	Suppose that just after the \co{atomic_sub_and_test()}
 	on line~22 of
-	Figure~\ref{fig:together:Linux Kernel kref API} is invoked,
+	Listing~\ref{lst:together:Linux Kernel kref API} is invoked,
 	that some other CPU invokes \co{kref_get()}.
 	Doesn't this result in that other CPU now having an illegal
 	reference to a released object?
@@ -357,9 +357,9 @@ layer to track the destination caches that are used in packet routing.
 The actual implementation is quite a bit more involved; this section
 focuses on the aspects of \co{struct dst_entry} reference-count
 handling that matches this use case,
-shown in Figure~\ref{fig:together:Linux Kernel dst-clone API}.
+shown in Listing~\ref{lst:together:Linux Kernel dst-clone API}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \scriptsize
 \begin{verbbox}
   1 static inline
@@ -384,8 +384,8 @@ shown in Figure~\ref{fig:together:Linux Kernel dst-clone API}.
 \centering
 \theverbbox
 \caption{Linux Kernel \tco{dst_clone} API}
-\label{fig:together:Linux Kernel dst-clone API}
-\end{figure}
+\label{lst:together:Linux Kernel dst-clone API}
+\end{listing}

 The \co{dst_clone()} primitive may be used if the caller
 already has a reference to the specified \co{dst_entry},
@@ -443,9 +443,9 @@ as shown below.
 The Linux kernel's \co{fget()} and \co{fput()} primitives
 use this style of reference counting.
 Simplified versions of these functions are shown in
-Figure~\ref{fig:together:Linux Kernel fget/fput API}.
+Listing~\ref{lst:together:Linux Kernel fget/fput API}.

-\begin{figure}[tbp]
+\begin{listing}[tbp]
 { \fontsize{6.5pt}{7.5pt}\selectfont
 \begin{verbbox}
   1 struct file *fget(unsigned int fd)
@@ -494,8 +494,8 @@ Figure~\ref{fig:together:Linux Kernel fget/fput API}.
 \centering
 \theverbbox
 \caption{Linux Kernel \tco{fget}/\tco{fput} API}
-\label{fig:together:Linux Kernel fget/fput API}
-\end{figure}
+\label{lst:together:Linux Kernel fget/fput API}
+\end{listing}

 Line~4 of \co{fget()} fetches the pointer to the current
 process's file-descriptor table, which might well be shared
-- 
2.7.4

