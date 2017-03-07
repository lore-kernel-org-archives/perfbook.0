Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=PqRVqS6GbfQtYs3lj3KovNQaNA6/8ixqbieRFLQsUto=;
 b=OEY+y7Jxba2wke/OQH1mdOCrWprxJFTwW2YITSXyMwplbPYm/uM4pIPQqBjx8OKZ9j
 9+3MBIJRQxNg0ZO8t94XOmJjR7pChewUuqpMsm5KJpm2Ch3P4GDvj9W4ubu/PqvVEvur
 2D7E3uIaGopx1764sy/s/C0R/0pr2YCTlEWey46ckaXlQbPl3n0EXBZ5URX9FlEHcIgh
 zO3iYRTxJiKUA4ORNb8UrrZ8rV2A9/duH6/48EmdItqvpliJpEUphuuMC5pUUijCwqn8
 HAFbQ1xTvSfhVKOZ3QDpGl9verH4sr1f60rBNA0dThO8YLK118e9S7n364lA2G9SiE5R
 S+9g==
Subject: [PATCH 3/3] treewide: Use \tco{} for api name in subsubsection title
References: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2b29e0e1-383c-92a3-6c8e-4ff4e0984825@gmail.com>
Date: Wed, 8 Mar 2017 00:03:25 +0900
MIME-Version: 1.0
In-Reply-To: <288315d7-4311-6734-b7d3-446deca6a727@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a51c44bef0dbc05bd95391ac3f8f0f2d26becbf5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 7 Mar 2017 21:06:17 +0900
Subject: [PATCH 3/3] treewide: Use \tco{} for api name in subsubsection title

\tco{} is also safe in section title.
Do the same changes as the previous commit for api names in
subsubsection titles.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/tm.tex                 |  2 +-
 locking/locking.tex           |  2 +-
 toolsoftrade/toolsoftrade.tex | 30 +++++++++++++++---------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/future/tm.tex b/future/tm.tex
index 80aabf4..93aece5 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -429,7 +429,7 @@ That said, there are rumors that some TM researchers are investigating
 fork/join parallelism within transactions, so perhaps this topic will
 soon be addressed more thoroughly.

-\subsubsection{The exec() System Call}
+\subsubsection{The \tco{exec()} System Call}
 \label{sec:future:The exec System Call}

 One can execute an \co{exec()} system call while holding a lock, and
diff --git a/locking/locking.tex b/locking/locking.tex
index 7b19e84..562ff09 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -2173,7 +2173,7 @@ checker~\cite{JonathanCorbet2006lockdep}.
 One of the great strengths of lockdep is that it is not fooled by
 human intuition~\cite{StevenRostedt2011locdepCryptic}.

-\subsubsection{Library Functions Used Between fork() and exec()}
+\subsubsection{Library Functions Used Between \tco{fork()} and \tco{exec()}}
 \label{sec:locking:Library Functions Used Between fork() and exec()}

 As noted earlier, if a thread executing a library function is holding
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 30e7067..c225bee 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1424,7 +1424,7 @@ void wait_all_threads(void)
 \label{fig:toolsoftrade:Thread API}
 \end{figure*}

-\subsubsection{create\_thread()}
+\subsubsection{\tco{create_thread()}}

 The \co{create_thread()} primitive creates a new thread,
 starting the new thread's execution
@@ -1443,7 +1443,7 @@ the program.
 though some systems may have an upper bound for the allowable number
 of threads.

-\subsubsection{smp\_thread\_id()}
+\subsubsection{\tco{smp_thread_id()}}

 Because the \co{thread_id_t} returned from \co{create_thread()} is
 system-dependent, the \co{smp_thread_id()} primitive returns a thread
@@ -1453,21 +1453,21 @@ that have been in existence since the program started,
 and is therefore useful for bitmasks, array indices, and
 the like.

-\subsubsection{for\_each\_thread()}
+\subsubsection{\tco{for_each_thread()}}

 The \co{for_each_thread()} macro loops through all threads that exist,
 including all threads that \emph{would} exist if created.
 This macro is useful for handling per-thread variables as will be
 seen in Section~\ref{sec:toolsoftrade:Per-Thread Variables}.

-\subsubsection{for\_each\_running\_thread()}
+\subsubsection{\tco{for_each_running_thread()}}

 The \co{for_each_running_thread()}
 macro loops through only those threads that currently exist.
 It is the caller's responsibility to synchronize with thread
 creation and deletion if required.

-\subsubsection{wait\_thread()}
+\subsubsection{\tco{wait_thread()}}

 The \co{wait_thread()} primitive waits for completion of the thread
 specified by the \co{thread_id_t} passed to it.
@@ -1476,7 +1476,7 @@ instead, it merely waits for it.
 Note that \co{wait_thread()} returns the value that was returned by
 the corresponding thread.

-\subsubsection{wait\_all\_threads()}
+\subsubsection{\tco{wait_all_threads()}}

 The \co{wait_all_threads()}
 primitive waits for completion of all currently running threads.
@@ -1591,13 +1591,13 @@ void spin_unlock(spinlock_t *sp);
 \label{fig:toolsoftrade:Locking API}
 \end{figure}

-\subsubsection{spin\_lock\_init()}
+\subsubsection{\tco{spin_lock_init()}}

 The \co{spin_lock_init()} primitive initializes the specified
 \co{spinlock_t} variable, and must be invoked before
 this variable is passed to any other spinlock primitive.

-\subsubsection{spin\_lock()}
+\subsubsection{\tco{spin_lock()}}

 The \co{spin_lock()} primitive acquires the specified spinlock,
 if necessary, waiting until the spinlock becomes available.
@@ -1608,14 +1608,14 @@ in others, such as the Linux kernel, it will involve blocking.
 The key point is that only one thread may hold a spinlock at any
 given time.

-\subsubsection{spin\_trylock()}
+\subsubsection{\tco{spin_trylock()}}

 The \co{spin_trylock()} primitive acquires the specified spinlock,
 but only if it is immediately available.
 It returns \co{true} if it was able to acquire the spinlock and
 \co{false} otherwise.

-\subsubsection{spin\_unlock()}
+\subsubsection{\tco{spin_unlock()}}

 The \co{spin_unlock()} primitive releases the specified spinlock,
 allowing other threads to acquire it.
@@ -1753,7 +1753,7 @@ init_per_thread(name, v)
 	not they were C static variables!
 } \QuickQuizEnd

-\subsubsection{DEFINE\_PER\_THREAD()}
+\subsubsection{\tco{DEFINE_PER_THREAD()}}

 The \co{DEFINE_PER_THREAD()} primitive defines a per-thread variable.
 Unfortunately, it is not possible to provide an initializer in the way
@@ -1761,22 +1761,22 @@ permitted by the Linux kernel's \co{DEFINE_PER_THREAD()} primitive,
 but there is an \co{init_per_thread()} primitive that permits easy
 runtime initialization.

-\subsubsection{DECLARE\_PER\_THREAD()}
+\subsubsection{\tco{DECLARE_PER_THREAD()}}

 The \co{DECLARE_PER_THREAD()} primitive is a declaration in the C sense,
 as opposed to a definition.
 Thus, a \co{DECLARE_PER_THREAD()} primitive may be used to access
 a per-thread variable defined in some other file.

-\subsubsection{per\_thread()}
+\subsubsection{\tco{per_thread()}}

 The \co{per_thread()} primitive accesses the specified thread's variable.

-\subsubsection{\_\_get\_thread\_var()}
+\subsubsection{\tco{__get_thread_var()}}

 The \co{__get_thread_var()} primitive accesses the current thread's variable.

-\subsubsection{init\_per\_thread()}
+\subsubsection{\tco{init_per_thread()}}

 The \co{init_per_thread()} primitive sets all threads' instances of
 the specified variable to the specified value.
-- 
2.7.4


