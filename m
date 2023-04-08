Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680975211;
	bh=YegARlkHfT5xv8W4SsBYeqxomNDzMTiKWUVaCOu+slg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CNmSgqzoX30sawLNL0ZrwOJtWLwSmG/yLQz903+ttbjC5eoE+a4L9znsw0JqB65Kt
	 MtQ2KVEnjzfjuzYMJPTi7USJoVuBOcrvW92ZutZ/llszJp5/AGL27VfEKVPfzUbGvB
	 PZxgxsW+FIYr4JQxA9SDMSsbUPXwCbcanLHbJ/4wgHKFBlsrgj46CYrrFOyaWOgXw0
	 ZM1iWz2hawj4xM0uusr7vEzefJn1qe/GXFF87SU5smz9dX+FXla8TNOL971xze352d
	 lxmW+nwu5Nb/54jV5nrPEEC0j1Fl2aiOUn5gDU+igoAzIt9wT0sdCKcaEedYMEXogm
	 DH2NekTH9j6zg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 10/12] formal/ppcmem: Enclose example code snippets with \co{}
Date: Sat,  8 Apr 2023 10:33:07 -0700
Message-Id: <20230408173309.5543-11-sj@kernel.org>
In-Reply-To: <20230408173309.5543-1-sj@kernel.org>
References: <20230408173309.5543-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A few sentences in ppcmem.tex are not enclosing example code snippets
with \co{}.  Enclose those for better readability and consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/axiomatic.tex | 30 +++++++++++++++---------------
 formal/ppcmem.tex    |  6 +++---
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 80c5cafa..c970d3bb 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -70,7 +70,7 @@ One such approach is the axiomatic approach of
 which creates a set of axioms to represent the memory model and then
 converts litmus tests to theorems that might be proven or disproven
 over this set of axioms.
-The resulting tool, called ``herd'',  conveniently takes as input the
+The resulting tool, called \qco{herd},  conveniently takes as input the
 same litmus tests as PPCMEM, including the IRIW litmus test shown in
 \cref{lst:formal:IRIW Litmus Test}.
 
@@ -106,27 +106,27 @@ exists
 \label{lst:formal:Expanded IRIW Litmus Test}
 \end{listing}
 
-However, where PPCMEM requires 14 CPU hours to solve IRIW, herd does so
+However, where PPCMEM requires 14 CPU hours to solve IRIW, \co{herd} does so
 in 17 milliseconds, which represents a speedup of more than six orders
 of magnitude.
 That said, the problem is exponential in nature, so we should expect
-herd to exhibit exponential slowdowns for larger problems.
+\co{herd} to exhibit exponential slowdowns for larger problems.
 And this is exactly what happens, for example, if we add four more writes
 per writing CPU as shown in
 \cref{lst:formal:Expanded IRIW Litmus Test},
-herd slows down by a factor of more than 50,000, requiring more than
+\co{herd} slows down by a factor of more than 50,000, requiring more than
 15 \emph{minutes} of CPU time.
 Adding threads also results in exponential
 slowdowns~\cite{PaulEMcKenney2014weakaxiom}.
 
-Despite their exponential nature, both PPCMEM and herd have proven quite
+Despite their exponential nature, both PPCMEM and \co{herd} have proven quite
 useful for checking key parallel algorithms, including the queued-lock
 handoff on x86 systems.
-The weaknesses of the herd tool are similar to those of PPCMEM, which
+The weaknesses of the \co{herd} tool are similar to those of PPCMEM, which
 were described in
 \cref{sec:formal:PPCMEM Discussion}.
 There are some obscure (but very real) cases for which the PPCMEM and
-herd tools disagree, and as of 2021 many but not all of these disagreements
+\co{herd} tools disagree, and as of 2021 many but not all of these disagreements
 was resolved.
 
 It would be helpful if the litmus tests could be written in C
@@ -189,18 +189,18 @@ And in this case, the \co{herd} tool's output features the string
 }\QuickQuizAnswer{
 	In a word, performance, as can be seen in
 	\cref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
-	The first column shows the number of herd processes modeled.
-	The second column shows the herd runtime when modeling
-	\co{spin_lock()} and \co{spin_unlock()} directly in herd's
+	The first column shows the number of \co{herd} processes modeled.
+	The second column shows the \co{herd} runtime when modeling
+	\co{spin_lock()} and \co{spin_unlock()} directly in \co{herd}'s
 	cat language.
-	The third column shows the herd runtime when emulating
+	The third column shows the \co{herd} runtime when emulating
 	\co{spin_lock()} with \co{cmpxchg_acquire()} and \co{spin_unlock()}
-	with \co{smp_store_release()}, using the herd \co{filter}
+	with \co{smp_store_release()}, using the \co{herd} \co{filter}
 	clause to reject executions that fail to acquire the lock.
 	The fourth column is like the third, but using \co{xchg_acquire()}
 	instead of \co{cmpxchg_acquire()}.
 	The fifth and sixth columns are like the third and fourth,
-	but instead using the herd \co{exists} clause to reject
+	but instead using the \co{herd} \co{exists} clause to reject
 	executions that fail to acquire the lock.
 
 \begin{table}
@@ -245,8 +245,8 @@ And in this case, the \co{herd} tool's output features the string
 	of magnitude faster than modeling emulated locking.
 	This should also be no surprise, as direct modeling raises
 	the level of abstraction, thus reducing the number of events
-	that herd must model.
-	Because almost everything that herd does is of exponential
+	that \co{herd} must model.
+	Because almost everything that \co{herd} does is of exponential
 	computational complexity, modest reductions in the number of
 	events produces exponentially large reductions in runtime.
 
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index c3f5f943..25d07c34 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -110,7 +110,7 @@ Comments can be inserted between
 each is of the form
 \co{P:R=V}, where \co{P} is the process identifier, \co{R} is the register
 identifier, and \co{V} is the value.
-For example, process~0's register r3 initially contains the value~2.
+For example, process~0's register \co{r3} initially contains the value~2.
 If the value is a variable (\co{x}, \co{y}, or \co{z} in the example)
 then the register is initialized to the address of the variable.
 It is also possible to initialize the contents of variables, for example,
@@ -156,11 +156,11 @@ That said, too-free use of branches will expand the state space.
 Use of loops is a particularly good way to explode your state space.
 
 \Clnrefrange{assert:b}{assert:e} show the assertion, which in this case
-indicates that we are interested in whether P0's and P1's r3 registers
+indicates that we are interested in whether P0's and P1's \co{r3} registers
 can both contain zero after both threads complete execution.
 This assertion is important because there are a number of use cases
 that would fail miserably if both P0 and P1 saw zero in their
-respective r3 registers.
+respective \co{r3} registers.
 
 This should give you enough information to construct simple litmus tests.
 Some additional documentation is available, though much of this
-- 
2.17.1

