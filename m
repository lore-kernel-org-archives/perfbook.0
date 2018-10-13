Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=THqifmhKtsiKVZjUklp0ttfnpJh5/b/n6wML/z8Cowg=;
        b=rTqBcRLXl+JgDb00s5qUupwW50xh5D10Kcx73Nk0LfwP0A4qJZ5HL513vZIi8DFGqs
         bA4Ibj2Fto9kDt7H564sZcE1N5pN6fbbalb+RvHHV4pONaf5zjivjDrQ0y08ICPWOiPx
         U90gBUPfhuTvI0+9dpvzQKW2DnLN5+eHSo77q63LOsT/UNd4bBfoRXhRvhJBWb5y9ltf
         bt2KTQc18Oig+fm0QzD23t9A8wFw3r7gL3GavrnVDI5OayQnf7Efn86R2ZG4SHdkDJ46
         j+mrdE+lkjrsERrx48CTcid5jaKl5NQbL8m6dp3qAlVF+PkKKtKpZQBM/T2NhuskGthh
         5pvg==
Subject: [PATCH 6/6] toolsoftrade: Proofread newly added sections
References: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5356f254-a1cb-5d2f-f635-f0019e2dcd42@gmail.com>
Date: Sat, 13 Oct 2018 23:59:31 +0900
MIME-Version: 1.0
In-Reply-To: <a20c67f0-db94-7e03-ed69-d09fd51899dd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe3b14155fd41569eb5224dd259213908cda4990 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 13 Oct 2018 20:28:09 +0900
Subject: [PATCH 6/6] toolsoftrade: Proofread newly added sections

Miscellaneous fixes and tweaks done while skimming through
the expanded sections.

Note on Listings 4.17, 4.22, and 4.25:
Comments of "/* BUGGY!!! */" are added consistently in both
Listings 4.17 and 4.22.  Listing 4.25 is no longer buggy, so
the comments are removed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 44 +++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index f198517..f870420 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1764,7 +1764,7 @@ as a series of one-byte loads.
 If some other thread was concurrently setting \co{global_ptr} to
 \co{NULL}, the result might have all but one byte of the pointer
 set to zero, thus forming a ``wild pointer''.
-Stores using such a wild pointer could could corrupt arbitrary
+Stores using such a wild pointer could corrupt arbitrary
 regions of memory, resulting in rare and difficult-to-debug crashes.
 
 Worse yet, on (say) an 8-bit system with 16-bit pointers, the compiler
@@ -1852,16 +1852,16 @@ void shut_it_down(void)
 {
 	status = SHUTTING_DOWN; /* BUGGY!!! */\lnlbl[store:a]
 	start_shutdown();
-	while (!other_task_ready)\lnlbl[loop:b]
+	while (!other_task_ready) /* BUGGY!!! */\lnlbl[loop:b]
 		continue;\lnlbl[loop:e]
 	finish_shutdown();\lnlbl[finish]
-	status = SHUT_DOWN;\lnlbl[store:b]
+	status = SHUT_DOWN; /* BUGGY!!! */\lnlbl[store:b]
 	do_something_else();
 }
 
 void work_until_shut_down(void)
 {
-	while (status != SHUTTING_DOWN)\lnlbl[until:loop:b]
+	while (status != SHUTTING_DOWN) /* BUGGY!!! */\lnlbl[until:loop:b]
 		do_more_work();\lnlbl[until:loop:e]
 	other_task_ready = 1; /* BUGGY!!! */\lnlbl[other:store]
 }
@@ -1887,7 +1887,7 @@ lines~\lnref{until:loop:b} and~\lnref{until:loop:e}, and thus would never set
 would never exit its loop spanning
 lines~\lnref{loop:b} and~\lnref{loop:e}, even if
 the compiler chooses not to fuse the successive loads from
-\co{(!other_task_ready)} on line~\lnref{loop:b}.
+\co{other_task_ready} on line~\lnref{loop:b}.
 
 And there are more problems with the code in
 Listing~\ref{lst:toolsoftrade:C Compilers Can Fuse Stores},
@@ -2030,8 +2030,8 @@ Perhaps the most clear guidance is provided by this non-normative note:
 	that special hardware instructions are required to access
 	the object.
 	See 6.8.1 for detailed semantics.
-	In general, the semantics of volatile are intended to be the
-	same in C ++ as they are in C.
+	In general, the semantics of \co{volatile} are intended to be the
+	same in C++ as they are in C.
 \end{quote}
 
 This wording might be reassuring to those writing low-level code, except
@@ -2068,6 +2068,7 @@ constraints @@@ citation once LinuxMM.html appears @@@:
 	assembly-language instructions.
 	Concurrent code relies on this constraint in order to achieve
 	the desired ordering properties from combinations of volatile
+	accesses and other means discussed in
 	Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution}.
 \end{enumerate}
 
@@ -2093,11 +2094,11 @@ if (ptr != NULL && ptr < high_address)
 \end{listing}
 
 Using \co{READ_ONCE()} on
-line~~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
+line~\ref{ln:toolsoftrade:Living Dangerously Early 1990s Style:temp} of
 Listing~\ref{lst:toolsoftrade:Living Dangerously Early 1990s Style}
 avoids invented loads,
 resulting in the code shown in
-List~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
+Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
 
 \begin{listing}[tbp]
 \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
@@ -2125,13 +2126,13 @@ void shut_it_down(void)
 	while (!READ_ONCE(other_task_ready)) /* BUGGY!!! */\lnlbl[loop:b]
 		continue;\lnlbl[loop:e]
 	finish_shutdown();\lnlbl[finish]
-	WRITE_ONCE(status, SHUT_DOWN);\lnlbl[store:b]
+	WRITE_ONCE(status, SHUT_DOWN); /* BUGGY!!! */\lnlbl[store:b]
 	do_something_else();
 }
 
 void work_until_shut_down(void)
 {
-	while (READ_ONCE(status) != SHUTTING_DOWN)\lnlbl[until:loop:b]
+	while (READ_ONCE(status) != SHUTTING_DOWN) /* BUGGY!!! */\lnlbl[until:loop:b]
 		do_more_work();\lnlbl[until:loop:e]
 	WRITE_ONCE(other_task_ready, 1); /* BUGGY!!! */\lnlbl[other:store]
 }
@@ -2169,7 +2170,7 @@ Listing~\ref{lst:toolsoftrade:Inviting an Invented Store},
 with the resulting code shown in
 Listing~\ref{lst:toolsoftrade:Disinviting an Invented Store}.
 
-To summarize, the \co{volatile} keyword can prevent prevent load
+To summarize, the \co{volatile} keyword can prevent load
 tearing and store tearing in cases where the loads and stores are
 machine-sized and properly aligned.
 It can also prevent load fusing, store fusing, invented loads, and
@@ -2232,7 +2233,7 @@ void shut_it_down(void)
 	WRITE_ONCE(status, SHUTTING_DOWN);
 	smp_mb(); \lnlbl[mb1]
 	start_shutdown();
-	while (!READ_ONCE(other_task_ready)) /* BUGGY!!! */\lnlbl[loop:b]
+	while (!READ_ONCE(other_task_ready))\lnlbl[loop:b]
 		continue;
 	smp_mb(); \lnlbl[mb2]
 	finish_shutdown();
@@ -2248,7 +2249,7 @@ void work_until_shut_down(void)
 		do_more_work();
 	}
 	smp_mb(); \lnlbl[mb5]
-	WRITE_ONCE(other_task_ready, 1); /* BUGGY!!! */\lnlbl[other:store]
+	WRITE_ONCE(other_task_ready, 1);\lnlbl[other:store]
 }
 \end{VerbatimL}
 \end{linelabel}
@@ -2268,11 +2269,10 @@ prevented store fusing and invention, and
 Listing~\ref{lst:toolsoftrade:Preventing Reordering}
 further prevents the remaining reordering by addition of
 \co{smp_mb()} on
-lines~\ref{ln:toolsoftrade:Preventing Reordering:mb1},
-lines~\ref{ln:toolsoftrade:Preventing Reordering:mb2},
-lines~\ref{ln:toolsoftrade:Preventing Reordering:mb3},
-lines~\ref{ln:toolsoftrade:Preventing Reordering:mb4}, and
-lines~\ref{ln:toolsoftrade:Preventing Reordering:mb5}.
+\begin{lineref}[ln:toolsoftrade:Preventing Reordering]
+lines~\lnref{mb1}, \lnref{mb2}, \lnref{mb3}, \lnref{mb4},
+and~\lnref{mb5}.
+\end{lineref}
 The \co{smp_mb()} macro is similar to \co{barrier()} shown in
 Listing~\ref{lst:toolsoftrade:Compiler Barrier Primitive (for GCC)},
 but with the empty string replaced by a string containing the
@@ -2333,7 +2333,7 @@ cases:
 	lock by a given owning CPU or thread, then all stores must use
 	\co{WRITE_ONCE()} and non-owning CPUs or threads that
 	are not holding the lock must use \co{READ_ONCE()} for loads.
-	The owning CPU or thread may uas plain loads, as may any
+	The owning CPU or thread may use plain loads, as may any
 	CPU or thread holding the lock.
 \item	If a shared variable is only modified while holding a given
 	lock, then all stores must use \co{WRITE_ONCE()}.
@@ -2343,7 +2343,7 @@ cases:
 \item	If a shared variable is only modified by a given owning CPU or
 	thread, then all stores must use \co{WRITE_ONCE()} and non-owning
 	CPUs or threads must use \co{READ_ONCE()} for loads.
-	The owning CPU or thread may used plain loads.
+	The owning CPU or thread may use plain loads.
 \end{enumerate}
 
 In most other cases, loads from and stores to a shared variable must
@@ -2353,7 +2353,7 @@ provide any ordering guarantees.
 See the above
 Section~\ref{sec:toolsoftrade:Assembling the Rest of a Solution} or
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
-information on providing ordering guarantees.
+for information on providing ordering guarantees.
 
 Examples of many of these data-race-avoidance patterns are presented in
 Chapter~\ref{chp:Counting}.
-- 
2.7.4


