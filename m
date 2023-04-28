Return-Path: <SRS0=YAaW=AT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682677174; x=1685269174;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n63WeruXvZN7bmp3Y2eAPynwEz7gKkkYsbTs4/5T3yI=;
        b=KN7NXcsQ0IF0TmJibKYzaQFLI0Cdr//IuURC3D1wZFBCma512IMK5rlUVxcV1oa24L
         jHK3uq9wkB9EYcix2uVV+q+CE3GsbBJE48Cl1Kd0ZzIrqTXPUtrB6BAY6WT17hlBf/Hz
         DCw5MHklvKI5cd5KahC1MpzV2IhvBKifStESRLjKSVhbbOP/DO9p3XYm+3Au0SdVSyJg
         lQetnBkhgIl9ZXwGTrozsi3CCruJY15JgiaiGX2rXVI/6HG14gqqsRpMbJsdBJp+Aorl
         IlPwehyL2w7AwJ4e52yX8oVRmK/0G1SiZb8q3aLktONU1sRsz0YbG9k1HlKjj+ArpYzT
         WVQQ==
Message-ID: <f6647f14-4364-1b96-b85a-93b8fcb6766c@gmail.com>
Date: Fri, 28 Apr 2023 19:19:28 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] toolsoftrade: Use description list
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In toolsoftrade, there are quite a few descriptions presented by
using \subsubsection{} and \bf commands.

Description lists are more suited for those places.

Convert them into description lists.

For a couple of floating code snippets defined inside lists,
where some parameters of vertical space differ slightly, add an
alternative environment named VerbatimLL and use it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

As I said earlier, there are places where description lists
can be applied.

How do they look to your eyes ?

I didn't want to add the VerbatimLL environment, but at least
it works.

I think you'd like to indent items in those lists for coding
style consistency.  I can do so in a follow-up patch if you prefer.

Patch 2/2 will adjust section structure.

        Thanks, Akira
--
 perfbook-lt.tex               |   3 +
 toolsoftrade/toolsoftrade.tex | 105 +++++++++++++++++-----------------
 2 files changed, 55 insertions(+), 53 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 7239d2350477..cdac9d495a3a 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -343,6 +343,9 @@
 \DefineVerbatimEnvironment{VerbatimL}{Verbatim}%
 {numbers=left,numbersep=5pt,xleftmargin=9pt}
 \AfterEndEnvironment{VerbatimL}{\vspace*{-9pt}}
+\DefineVerbatimEnvironment{VerbatimLL}{Verbatim}% for snippet inside list
+{numbers=left,numbersep=5pt,xleftmargin=9pt}
+\AfterEndEnvironment{VerbatimLL}{\vspace*{-5pt}}
 \DefineVerbatimEnvironment{VerbatimN}{Verbatim}%
 {numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
 \DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index e8df603c5ed5..ea65d6b99b29 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1277,8 +1277,8 @@ void wait_all_threads(void)
 \label{lst:toolsoftrade:Thread API}
 \end{listing}
 
-\subsubsection{\tco{create_thread()}}
-
+\begin{description}[style=nextline]
+\item[\tco{create_thread()}]
 The \apipf{create_thread()} primitive creates a new thread,
 starting the new thread's execution
 at the function \co{func} specified by \apipf{create_thread()}'s
@@ -1296,8 +1296,7 @@ the program.
 though some systems may have an upper bound for the allowable number
 of threads.
 
-\subsubsection{\tco{smp_thread_id()}}
-
+\item[\tco{smp_thread_id()}]
 Because the \apipf{thread_id_t} returned from \apipf{create_thread()} is
 system-dependent, the \apipf{smp_thread_id()} primitive returns a thread
 index corresponding to the thread making the request.
@@ -1306,22 +1305,19 @@ that have been in existence since the program started,
 and is therefore useful for bitmasks, array indices, and
 the like.
 
-\subsubsection{\tco{for_each_thread()}}
-
+\item[\tco{for_each_thread()}]
 The \apipf{for_each_thread()} macro loops through all threads that exist,
 including all threads that \emph{would} exist if created.
 This macro is useful for handling the per-thread variables
 introduced in \cref{sec:toolsoftrade:Per-Thread Variables}.
 
-\subsubsection{\tco{for_each_running_thread()}}
-
+\item[\tco{for_each_running_thread()}]
 The \apipf{for_each_running_thread()}
 macro loops through only those threads that currently exist.
 It is the caller's responsibility to synchronize with thread
 creation and deletion if required.
 
-\subsubsection{\tco{wait_thread()}}
-
+\item[\tco{wait_thread()}]
 The \apipf{wait_thread()} primitive waits for completion of the thread
 specified by the \co{thread_id_t} passed to it.
 This in no way interferes with the execution of the specified thread;
@@ -1329,8 +1325,7 @@ instead, it merely waits for it.
 Note that \apipf{wait_thread()} returns the value that was returned by
 the corresponding thread.
 
-\subsubsection{\tco{wait_all_threads()}}
-
+\item[\tco{wait_all_threads()}]
 The \apipf{wait_all_threads()}
 primitive waits for completion of all currently running threads.
 It is the caller's responsibility to synchronize with thread creation
@@ -1338,6 +1333,8 @@ and deletion if required.
 However, this primitive is normally used to clean up at the end of
 a run, so such synchronization is normally not needed.
 
+\end{description}
+
 \subsubsection{Example Usage}
 
 \Cref{lst:toolsoftrade:Example Child Thread} (\path{threadcreate.c})
@@ -1406,14 +1403,14 @@ void spin_unlock(spinlock_t *sp);
 \label{lst:toolsoftrade:Locking API}
 \end{listing}
 
-\subsubsection{\tco{spin_lock_init()}}
+\begin{description}[style=nextline]
 
+\item[\tco{spin_lock_init()}]
 The \apik{spin_lock_init()} primitive initializes the specified
 \apik{spinlock_t} variable, and must be invoked before
 this variable is passed to any other spinlock primitive.
 
-\subsubsection{\tco{spin_lock()}}
-
+\item[\tco{spin_lock()}]
 The \apik{spin_lock()} primitive acquires the specified spinlock,
 if necessary, waiting until the spinlock becomes available.
 In some environments, such as pthreads, this waiting will involve
@@ -1423,18 +1420,18 @@ a CPU-bound spin loop.
 The key point is that only one thread may hold a spinlock at any
 given time.
 
-\subsubsection{\tco{spin_trylock()}}
-
+\item[\tco{spin_trylock()}]
 The \apik{spin_trylock()} primitive acquires the specified spinlock,
 but only if it is immediately available.
 It returns \co{true} if it was able to acquire the spinlock and
 \co{false} otherwise.
 
-\subsubsection{\tco{spin_unlock()}}
-
+\item[\tco{spin_unlock()}]
 The \apik{spin_unlock()} primitive releases the specified spinlock,
 allowing other threads to acquire it.
 
+\end{description}
+
 % \emph{@@@ likely need to add reader-writer locking.}
 
 \subsubsection{Example Usage}
@@ -1582,7 +1579,8 @@ all of which work just fine in single-threaded code.
 But concurrent code can be broken by each of these transformations,
 or shared-variable shenanigans, as described below.
 
-{\bf Load tearing} occurs when the compiler uses multiple load
+\begin{description}[labelsep=.4em]
+\item[Load tearing] occurs when the compiler uses multiple load
 instructions for a single access.
 For example, the compiler could in theory compile the load from
 \co{global_ptr} (see
@@ -1601,7 +1599,7 @@ a given pointer.
 Because the C standard must support all manner of systems, the standard
 cannot rule out load tearing in the general case.
 
-{\bf Store tearing} occurs when the compiler uses multiple store
+\item[Store tearing] occurs when the compiler uses multiple store
 instructions for a single access.
 For example, one thread might store \co{0x12345678} to a four-byte integer
 variable at the same time another thread stored \co{0xabcdef00}.
@@ -1633,10 +1631,10 @@ prevent store tearing.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Preventing Load Fusing]
-\begin{VerbatimL}[commandchars=\\\{\}]
+\begin{VerbatimLL}[commandchars=\\\{\}]
 while (!need_to_stop)
 	do_something_quickly();
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{Inviting Load Fusing}
 \label{lst:toolsoftrade:Inviting Load Fusing}
@@ -1644,7 +1642,7 @@ while (!need_to_stop)
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Loads]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 if (!need_to_stop)
 	for (;;) {\lnlbl[loop:b]
 		do_something_quickly();
@@ -1664,13 +1662,13 @@ if (!need_to_stop)
 		do_something_quickly();
 		do_something_quickly();
 	}\lnlbl[loop:e]
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{C Compilers Can Fuse Loads}
 \label{lst:toolsoftrade:C Compilers Can Fuse Loads}
 \end{listing}
 
-{\bf Load fusing} occurs when the compiler uses the result of a
+\item[Load fusing] occurs when the compiler uses the result of a
 prior load from a given variable instead of repeating the load.
 Not only is this sort of optimization just fine in single-threaded
 code, it is often just fine in multithreaded code.
@@ -1699,7 +1697,7 @@ include severe physical damage.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 int *gp; \lnlbl[gp]
 
 void t0(void)
@@ -1717,7 +1715,7 @@ void t1(void)
 		p3 = *gp; \lnlbl[p3]
 	}
 }
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{C Compilers Can Fuse Non-Adjacent Loads}
 \label{lst:toolsoftrade:C Compilers Can Fuse Non-Adjacent Loads}
@@ -1764,7 +1762,7 @@ from the same variable.
 	\end{fcvref}
 }\QuickQuizEnd
 
-{\bf Store fusing} can occur when the compiler notices a pair of successive
+\item[Store fusing] can occur when the compiler notices a pair of successive
 stores to a given variable with no intervening loads from that variable.
 In this case, the compiler is within its rights to omit the first store.
 This is never a problem in single-threaded code, and in fact it is
@@ -1775,7 +1773,7 @@ first store.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:C Compilers Can Fuse Stores]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 void shut_it_down(void)
 {
 	status = SHUTTING_DOWN; /* BUGGY!!! */\lnlbl[store:a]
@@ -1793,7 +1791,7 @@ void work_until_shut_down(void)
 		do_more_work();\lnlbl[until:loop:e]
 	other_task_ready = 1; /* BUGGY!!! */\lnlbl[other:store]
 }
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{C Compilers Can Fuse Stores}
 \label{lst:toolsoftrade:C Compilers Can Fuse Stores}
@@ -1821,7 +1819,7 @@ And there are more problems with the code in
 \cref{lst:toolsoftrade:C Compilers Can Fuse Stores},
 including code reordering.
 
-{\bf Code reordering} is a common compilation technique used to
+\item[Code reordering] is a common compilation technique used to
 combine common subexpressions, reduce register pressure, and
 improve utilization of the many functional units available on
 modern superscalar microprocessors.
@@ -1854,7 +1852,7 @@ independent of the ordering provided by the underlying hardware.\footnote{
 	you use atomics or variables of type \apic{sig_atomic_t}, instead
 	of \apik{READ_ONCE()} and \apik{WRITE_ONCE()}.}
 
-{\bf Invented loads} were illustrated by the code in
+\item[Invented loads] were illustrated by the code in
 \cref{lst:toolsoftrade:Living Dangerously Early 1990s Style,%
 lst:toolsoftrade:C Compilers Can Invent Loads},
 in which the compiler optimized away a temporary variable,
@@ -1867,8 +1865,8 @@ These hoisting optimizations are not uncommon, and can cause significant
 increases in cache misses, and thus significant degradation of
 both performance and scalability.
 
+\item[Invented stores] can occur in a number of situations.
 \begin{fcvref}[ln:toolsoftrade:C Compilers Can Fuse Stores]
-{\bf Invented stores} can occur in a number of situations.
 For example, a compiler emitting code for \co{work_until_shut_down()} in
 \cref{lst:toolsoftrade:C Compilers Can Fuse Stores}
 might notice that \co{other_task_ready} is not accessed by
@@ -1889,12 +1887,12 @@ prevent such concurrency, this is not a good thing.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Inviting an Invented Store]
-\begin{VerbatimL}[commandchars=\\\{\}]
+\begin{VerbatimLL}[commandchars=\\\{\}]
 if (condition)
 	a = 1;
 else
 	do_a_bunch_of_stuff();
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{Inviting an Invented Store}
 \label{lst:toolsoftrade:Inviting an Invented Store}
@@ -1902,13 +1900,13 @@ else
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Compiler Invents an Invited Store]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 a = 1;\lnlbl[store:uncond]
 if (!condition) {
 	a = 0;\lnlbl[store:cond]
 	do_a_bunch_of_stuff();
 }
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{Compiler Invents an Invited Store}
 \label{lst:toolsoftrade:Compiler Invents an Invited Store}
@@ -1971,19 +1969,19 @@ against compiler optimizations that invent data races.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 r1 = p;\lnlbl[load:p]
 if (unlikely(r1))\lnlbl[if]
 	do_something_with(r1);\lnlbl[dsw]
 barrier();\lnlbl[barrier]
 p = NULL;\lnlbl[null]
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{Inviting a Store-to-Load Conversion}
 \label{lst:toolsoftrade:Inviting a Store-to-Load Conversion}
 \end{listing}
 
-{\bf Store-to-load transformations} can occur when the compiler notices
+\item[Store-to-load transformations] can occur when the compiler notices
 that a plain store might not actually change the value in memory.
 \begin{fcvref}[ln:toolsoftrade:Inviting a Store-to-Load Conversion]
 For example, consider
@@ -2004,14 +2002,14 @@ is often an expensive no-op.
 
 \begin{listing}
 \begin{fcvlabel}[ln:toolsoftrade:Compiler Converts a Store to a Load]
-\begin{VerbatimL}[commandchars=\\\[\]]
+\begin{VerbatimLL}[commandchars=\\\[\]]
 r1 = p;\lnlbl[load:p]
 if (unlikely(r1))\lnlbl[if]
 	do_something_with(r1);\lnlbl[dsw]
 barrier();\lnlbl[barrier]
 if (p != NULL)\lnlbl[if1]
 	p = NULL;\lnlbl[null]
-\end{VerbatimL}
+\end{VerbatimLL}
 \end{fcvlabel}
 \caption{Compiler Converts a Store to a Load}
 \label{lst:toolsoftrade:Compiler Converts a Store to a Load}
@@ -2029,7 +2027,7 @@ This situation might suggest use of \apik{smp_store_release()} over
 \apik{smp_wmb()}.
 \end{fcvref}
 
-{\bf Dead-code elimination} can occur when the compiler notices that
+\item[Dead-code elimination] can occur when the compiler notices that
 the value from a load is never used, or when a variable is stored to,
 but never loaded from.
 This can of course eliminate an access to a shared variable, which
@@ -2042,6 +2040,8 @@ where external code locates the variable via symbol tables:
 The compiler is necessarily ignorant of such external-code accesses,
 and might thus eliminate a variable that the external code relies upon.
 
+\end{description}
+
 Reliable concurrent code clearly needs a way to cause the compiler to
 preserve the number, order, and type of important accesses to shared
 memory, a topic taken up by
@@ -2524,7 +2524,8 @@ init_per_thread(name, v)
 	not they were C static variables!
 }\QuickQuizEnd
 
-\subsubsection{\tco{DEFINE_PER_THREAD()}}
+\begin{description}[style=nextline]
+\item[\tco{DEFINE_PER_THREAD()}]
 
 The \apipf{DEFINE_PER_THREAD()} primitive defines a per-thread variable.
 Unfortunately, it is not possible to provide an initializer in the way
@@ -2532,29 +2533,27 @@ permitted by the Linux kernel's \apik{DEFINE_PER_CPU()} primitive,
 but there is an \apipf{init_per_thread()} primitive that permits easy
 runtime initialization.
 
-\subsubsection{\tco{DECLARE_PER_THREAD()}}
-
+\item[\tco{DECLARE_PER_THREAD()}]
 The \apipf{DECLARE_PER_THREAD()} primitive is a declaration in the C sense,
 as opposed to a definition.
 Thus, a \apipf{DECLARE_PER_THREAD()} primitive may be used to access
 a per-thread variable defined in some other file.
 
-\subsubsection{\tco{per_thread()}}
-
+\item[\tco{per_thread()}]
 The \apipf{per_thread()} primitive accesses the specified thread's variable.
 
-\subsubsection{\tco{__get_thread_var()}}
-
+\item[\tco{__get_thread_var()}]
 The \apipf{__get_thread_var()} primitive accesses the current thread's variable.
 
-\subsubsection{\tco{init_per_thread()}}
-
+\item[\tco{init_per_thread()}]
 The \apipf{init_per_thread()} primitive sets all threads' instances of
 the specified variable to the specified value.
 The Linux kernel accomplishes this via normal C initialization,
 relying in clever use of linker scripts and code executed during
 the CPU-online process.
 
+\end{description}
+
 \subsubsection{Usage Example}
 
 Suppose that we have a counter that is incremented very frequently

base-commit: 852cb0657feeb6edef0aec191b104f19d90d8b00
-- 
2.25.1

