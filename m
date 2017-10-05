Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YnPrG72qB0GS6KIbYXbgKMVBP4VcsAp9PMMv4OjVd1s=;
 b=XOXz1KErAoeKqsJewZGHhXSQxUj++OgQuTEYFo0u0Ppkf+0G3dnmIP2r5fEU7usIpJ
 Wgo+9B1+mMhgizWVq4kv6123vYqoaRrS6D6pT6FI3Mi6ZgioC9Chh363lX2sx4jbRy98
 1Ql/XQQtyGqEXYac7b2jhXo4Eq42/aejJZr/ZlSnnTw1y/ngOzsr97fRjEhr0FDANVPM
 xpHLdgD0LByd8sSZYgawsMg/tiR7UK3tuBh0GRtV4Tl6rS2UJwZ85wvsdY5ymQ8s+9uM
 GVbOx5+r3MTnTThWOLAIPfiXVBoma4RvXGDnDL6/rKQ675f35vs3+q1V2KG6VWvUMSVZ
 TpKg==
Subject: [PATCH 07/10] treewide: Call GNU C compiler as "GCC"
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f40f563a-fe7f-9239-1534-94f717923a6d@gmail.com>
Date: Fri, 6 Oct 2017 00:55:44 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 051dc90e73bbd57412c054f482d6ad401f3b1228 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Oct 2017 16:29:14 +0900
Subject: [PATCH 07/10] treewide: Call GNU C compiler as "GCC"

Exception to simple substitution:

   The gcc compiler -> The GNU C compiler
   the gcc xxxx facility -> GCC's xxxx facility
   gcc extensions -> GNU extensions

"GNU C" and "GCC" are defined in macros "\GNUC" and "\GCC" respectively.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex               | 18 +++++++++---------
 datastruct/datastruct.tex     |  2 +-
 formal/formal.tex             |  2 +-
 memorder/memorder.tex         |  2 +-
 perfbook.tex                  |  3 +++
 toolsoftrade/toolsoftrade.tex | 20 ++++++++++----------
 6 files changed, 25 insertions(+), 22 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index a38aba1..a213558 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -213,7 +213,7 @@ accuracies far greater than 50\,\% are almost always necessary.
 \QuickQuizAnswer{
 	Although the \co{++} operator \emph{could} be atomic, there
 	is no requirement that it be so.
-	And indeed, \co{gcc} often
+	And indeed, \GCC\ often
 	chooses to load the value to a register, increment
 	the register, then store the value to memory, which is
 	decidedly non-atomic.
@@ -486,7 +486,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
 	It can, and in this toy implementation, it does.
 	But it is not that hard to come up with an alternative
 	implementation that permits an arbitrary number of threads,
-	for example, using the \co{gcc} \co{__thread} facility,
+	for example, using \GCC's \co{__thread} facility,
 	as shown in
 	Section~\ref{sec:count:Per-Thread-Variable-Based Implementation}.
 } \QuickQuizEnd
@@ -535,11 +535,11 @@ using the \co{for_each_thread()} primitive to iterate over the list of
 currently running threads, and using the \co{per_thread()} primitive
 to fetch the specified thread's counter.
 Because the hardware can fetch and store a properly aligned \co{long}
-atomically, and because gcc is kind enough to make use of this capability,
+atomically, and because \GCC\ is kind enough to make use of this capability,
 normal loads suffice, and no special atomic instructions are required.

 \QuickQuiz{}
-	What other choice does gcc have, anyway???
+	What other choice does \GCC\ have, anyway???
 \QuickQuizAnswer{
 	According to the C standard, the effects of fetching a variable
 	that might be concurrently modified by some other thread are
@@ -548,7 +548,7 @@ normal loads suffice, and no special atomic instructions are required.
 	given that C must support (for example) eight-bit architectures
 	which are incapable of atomically loading a \co{long}.
 	An upcoming version of the C standard aims to fill this gap,
-	but until then, we depend on the kindness of the gcc developers.
+	but until then, we depend on the kindness of the \GCC\ developers.

 	Alternatively, use of volatile accesses such as those provided
 	by \co{ACCESS_ONCE()}~\cite{JonCorbet2012ACCESS:ONCE}
@@ -987,7 +987,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 \label{fig:count:Per-Thread Statistical Counters}
 \end{figure}

-Fortunately, gcc provides an \co{__thread} storage class that provides
+Fortunately, \GCC\ provides an \co{__thread} storage class that provides
 per-thread storage.
 This can be used as shown in
 Figure~\ref{fig:count:Per-Thread Statistical Counters} (\path{count_end.c})
@@ -1005,13 +1005,13 @@ value of the counter and exiting threads.
 \QuickQuiz{}
 	Why do we need an explicit array to find the other threads'
 	counters?
-	Why doesn't gcc provide a \co{per_thread()} interface, similar
+	Why doesn't \GCC\ provide a \co{per_thread()} interface, similar
 	to the Linux kernel's \co{per_cpu()} primitive, to allow
 	threads to more easily access each others' per-thread variables?
 \QuickQuizAnswer{
 	Why indeed?

-	To be fair, gcc faces some challenges that the Linux kernel
+	To be fair, \GCC\ faces some challenges that the Linux kernel
 	gets to ignore.
 	When a user-level thread exits, its per-thread variables all
 	disappear, which complicates the problem of per-thread-variable
@@ -2862,7 +2862,7 @@ line~33 sends the thread a signal.
 \QuickQuiz{}
 	The code in
 	Figure~\ref{fig:count:Signal-Theft Limit Counter Value-Migration Functions},
-	works with gcc and POSIX.
+	works with \GCC\ and POSIX.
 	What would be required to make it also conform to the ISO C standard?
 \QuickQuizAnswer{
 	The \co{theft} variable must be of type \co{sig_atomic_t}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index fad7668..8b8dd0a 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2086,7 +2086,7 @@ performance and scalability.

 One way to solve this problem on systems with 64-byte cache line is shown in
 Figure~\ref{fig:datastruct:Alignment for 64-Byte Cache Lines}.
-Here a gcc \co{aligned} attribute is used to force the \co{->counter}
+Here \GCC's \co{aligned} attribute is used to force the \co{->counter}
 and the \co{ht_elem} structure into separate cache lines.
 This would allow CPUs to traverse the hash bucket list at full speed
 despite the frequent incrementing.
diff --git a/formal/formal.tex b/formal/formal.tex
index f629190..e4bf3bd 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -127,7 +127,7 @@ The larger overarching software construct is of course validated by testing.
 	Furthermore, although the L4 microkernel is a large software
 	artifact from the viewpoint of formal verification, it is tiny
 	compared to a great number of projects, including LLVM,
-	gcc, the Linux kernel, Hadoop, MongoDB, and a great many others.
+	\GCC, the Linux kernel, Hadoop, MongoDB, and a great many others.

 	Although formal verification is finally starting to show some
 	promise, including more-recent L4 verifications involving greater
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 944c17a..ba54fee 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4335,7 +4335,7 @@ the documentation for the specific MIPS implementation you are using.
 Although the PA-RISC architecture permits full reordering of loads and
 stores, actual CPUs run fully ordered~\cite{GerryKane96a}.
 This means that the Linux kernel's memory-ordering primitives generate
-no code, however, they do use the gcc {\tt memory} attribute to disable
+no code, however, they do use \GCC's {\tt memory} attribute to disable
 compiler optimizations that would reorder code across the memory
 barrier.

diff --git a/perfbook.tex b/perfbook.tex
index cc4f4b0..dc28079 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -139,6 +139,9 @@

 \DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
 \newcommand{\Power}[1]{POWER#1}
+\newcommand{\GNUC}{GNU~C}
+\newcommand{\GCC}{GCC}
+%\newcommand{\GCC}{\co{gcc}} % For those who prefer "gcc"

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 97a37d3..bd43879 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -481,7 +481,7 @@ in the following section.
 	broken???
 \QuickQuizAnswer{
 	Ah, but the Linux kernel is written in a carefully selected
-	superset of the C language that includes special gcc
+	superset of the C language that includes special GNU
 	extensions, such as asms, that permit safe execution even
 	in presence of data races.
 	In addition, the Linux kernel does not run on a number of
@@ -1001,7 +1001,7 @@ rights to assume that the value of \co{goflag} would never change.
 \QuickQuiz{}
 	Would it ever be necessary to use \co{READ_ONCE()} when accessing
 	a per-thread variable, for example, a variable declared using
-	the \co{gcc} \co{__thread} storage class?
+	\GCC's \co{__thread} storage class?
 \QuickQuizAnswer{
 	It depends.
 	If the per-thread variable was accessed only from its thread,
@@ -1156,7 +1156,7 @@ cases, for example when the readers must do high-latency file or network I/O.
 There are alternatives, some of which will be presented in
 Chapters~\ref{chp:Counting} and \ref{chp:Deferred Processing}.

-\subsection{Atomic Operations (gcc Classic)}
+\subsection{Atomic Operations (\GCC\ Classic)}
 \label{sec:toolsoftrade:Atomic Operations (gcc Classic)}

 Given that
@@ -1175,7 +1175,7 @@ If a pair of threads concurrently execute \co{__sync_fetch_and_add()} on
 the same variable, the resulting value of the variable will include
 the result of both additions.

-The {\sf gcc} compiler offers a number of additional atomic operations,
+The \GNUC\ compiler offers a number of additional atomic operations,
 including \co{__sync_fetch_and_sub()},
 \co{__sync_fetch_and_or()},
 \co{__sync_fetch_and_and()},
@@ -1250,7 +1250,7 @@ avoids optimizing away a given memory read, in which case the
 Figure~\ref{fig:toolsoftrade:Demonstration of Exclusive Locks}.
 Similarly, the \co{WRITE_ONCE()} primitive may be used to prevent the
 compiler from optimizing away a given memory write.
-These last three primitives are not provided directly by gcc,
+These last three primitives are not provided directly by \GCC,
 but may be implemented straightforwardly as follows:

 \vspace{5pt}
@@ -1307,7 +1307,7 @@ is vaguely similar to the Linux kernel's ``\co{READ_ONCE()}''.\footnote{

 One restriction of the C11 atomics is that they apply only to special
 atomic types, which can be problematic.
-The gcc compiler therefore provides atomic intrinsics, including
+The \GNUC\ compiler therefore provides atomic intrinsics, including
 \co{__atomic_load()},
 \co{__atomic_load_n()},
 \co{__atomic_store()},
@@ -1339,14 +1339,14 @@ to key,
 variable corresponding to the specified key,
 and \co{pthread_getspecific()} to return that value.

-A number of compilers (including gcc) provide a \co{__thread} specifier
+A number of compilers (including \GCC) provide a \co{__thread} specifier
 that may be used in a variable definition to designate that variable
 as being per-thread.
 The name of the variable may then be used normally to access the
 value of the current thread's instance of that variable.
 Of course, \co{__thread} is much easier to use than the POSIX
 thead-specific data, and so \co{__thread} is usually preferred for
-code that is to be built only with gcc or other compilers supporting
+code that is to be built only with \GCC\ or other compilers supporting
 \co{__thread}.

 Fortunately, the C11 standard introduced a \co{_Thread_local} keyword
@@ -1365,7 +1365,7 @@ are supported.
 It is still quite common to find these operations implemented in
 assembly language, either for historical reasons or to obtain better
 performance in specialized circumstances.
-For example, the gcc \co{__sync_} family of primitives all provide full
+For example, \GCC's \co{__sync_} family of primitives all provide full
 memory-ordering semantics, which in the past motivated many developers
 to create their own implementations for situations where the full memory
 ordering semantics are not required.
@@ -1380,7 +1380,7 @@ code, the code samples in this book start with a call to \co{smp_init()},
 which initializes a mapping from \co{pthread_t} to consecutive integers.
 The userspace RCU library similarly requires a call to \co{rcu_init()}.
 Although these calls can be hidden in environments (such as that of
-gcc) that support constructors,
+\GCC) that support constructors,
 most of the RCU flavors supported by the userspace RCU library
 also require each thread invoke \co{rcu_register_thread()} upon thread
 creation and \co{rcu_unregister_thread()} before thread exit.
-- 
2.7.4


