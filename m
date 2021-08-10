Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=feMOmjUZ8FadBaUPQ0QJGEBA7b8dtzXOeMsrwNUNq6k=;
        b=kmEtIKvP2HK06R63EHVVbSgbJVFgZYqoluHM/M2741XzGKRzNNE321/jjVSMjMPSDg
         WZBO5UZ7NAWFjSoDlnx6EgKi+9RKPc9nYuV6QYwkl/5Z3J5fIVBSDhdNre4Bra42cgPv
         EeWcSUH4JY44ahhnRyP6PwaUZW1BFa9pO9EdQ5EUDUrq7ekE/oJ9b8SH40+Smw4989hO
         iPJj0uXwuhojAByzI7pajKOuAnUdteonZaczI03CuNgsA6ozUe78I/Ssntt3DrJGcsbM
         DE+q1hOYu6uZ7wtmwNGZOiIGgYt7615Hz9R8DMs5/8fvBNd/ZIo0EZ2kMPch+SBtgr29
         FBRA==
Subject: [PATCH 2/7] formal: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3ce65eba-388c-6b17-b3a7-bbdc4643cb26@gmail.com>
Date: Tue, 10 Aug 2021 13:42:11 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Note: "dynticks" behind a colon is enclosed in plain {}.
This is to exclude it from checkscript.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex  |  3 ++-
 formal/dyntickrcu.tex | 17 +++++++++--------
 formal/formal.tex     |  7 +++++--
 formal/ppcmem.tex     |  4 ++--
 formal/spinhint.tex   | 40 ++++++++++++++++++++++++----------------
 5 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 12bba26c..175af54e 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -228,7 +228,8 @@ And in this case, the \co{herd} tool's output features the string
 	5 & 4.905 \\
 	\bottomrule
 \end{tabular}
-\caption{Locking: Modeling vs.\@ Emulation Time (s)}
+\caption{Locking:
+		  Modeling vs.\@ Emulation Time (s)}
 \label{tab:formal:Locking: Modeling vs. Emulation Time (s)}
 \end{table}
 
diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 6c4d2d6d..5113fd09 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -9,7 +9,8 @@
 \setlength{\lnlblraise}{0pt}
 }{}
 
-\subsection{Promela Parable: dynticks and Preemptible RCU}
+\subsection{Promela Parable:
+			     {dynticks} and Preemptible RCU}
 \label{sec:formal:Promela Parable: dynticks and Preemptible RCU}
 
 In early 2008, a preemptible variant of RCU was accepted into
@@ -624,10 +625,10 @@ over which RCU readers could plausibly persist.
 }\QuickQuizAnswer{
 	Recall that Promela and Spin trace out
 	every possible sequence of state changes.
-	Therefore, timing is irrelevant: Promela/Spin will be quite
-	happy to jam the entire rest of the model between those two
-	statements unless some state variable specifically prohibits
-	doing so.
+	Therefore, timing is irrelevant:
+	Promela/Spin will be quite happy to jam the entire rest of
+	the model between those two statements unless some state
+	variable specifically prohibits doing so.
 }\QuickQuizEnd
 
 The \co{dyntick_nohz()} Promela process implements
@@ -822,10 +823,10 @@ We also need to handle interrupts, a task taken up in the next section.
 
 There are a couple of ways to model interrupts in Promela:
 \begin{enumerate}
-\item	using C-preprocessor tricks to insert the interrupt handler
+\item	Using C-preprocessor tricks to insert the interrupt handler
 	between each and every statement of the \co{dynticks_nohz()}
 	process, or
-\item	modeling the interrupt handler with a separate process.
+\item	Modeling the interrupt handler with a separate process.
 \end{enumerate}
 
 A bit of thought indicated that the second approach would have a
@@ -1020,7 +1021,7 @@ set the \co{in_dyntick_irq} variable that is used by the
 variable, but only when in the outermost interrupt handler.
 
 \Clnref{cnd_ex} has the do-loop conditional for interrupt-exit modeling:
-as long as we have exited fewer interrupts than we have entered, it is
+As long as we have exited fewer interrupts than we have entered, it is
 legal to exit another interrupt.
 \Clnrefrange{atm3:b}{atm3:e}
 check the safety criterion, but only if we are exiting
diff --git a/formal/formal.tex b/formal/formal.tex
index 0f954861..ac897b9e 100644
--- a/formal/formal.tex
+++ b/formal/formal.tex
@@ -190,8 +190,11 @@ and the consequence that they imply:
 \end{description}
 
 From this viewpoint, any advances in validation and verification can
-have but two effects: (1)~An increase in the number of trivial programs or
-(2)~A decrease in the number of reliable programs.
+have but two effects:
+\begin{enumerate*}[(1)]
+\item An increase in the number of trivial programs or
+\item A decrease in the number of reliable programs.
+\end{enumerate*}
 Of course, the human race's increasing reliance on multicore systems and
 software provides extreme motivation for a very sharp increase in the
 number of trivial programs.
diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index f58f3700..8664ee4e 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -295,8 +295,8 @@ where the \co{...} stands for voluminous making-progress output.
 The list of states includes \co{0:r3=0; 1:r3=0;}, indicating once again
 that the old PowerPC implementation of \co{atomic_add_return()} does
 not act as a full barrier.
-The ``Sometimes'' on the last line confirms this: the assertion triggers
-for some executions, but not all of the time.
+The ``Sometimes'' on the last line confirms this:
+The assertion triggers for some executions, but not all of the time.
 
 \begin{listing}
 \begin{VerbatimL}[numbers=none,xleftmargin=0pt]
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 35fe895b..16f216e0 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -60,7 +60,8 @@ The remainder of this section describes how to use Promela to debug
 parallel algorithms, starting with simple examples and progressing to
 more complex uses.
 
-\subsubsection{Warm-Up: Non-Atomic Increment}
+\subsubsection{Warm-Up:
+			Non-Atomic Increment}
 \label{sec:formal:Warm-Up: Non-Atomic Increment}
 
 \begin{fcvref}[ln:formal:promela:increment:whole]
@@ -96,7 +97,8 @@ which is executed first.
 while \clnrefrange{assert:b}{assert:e}
 perform the assertion.
 Both are atomic blocks in order to avoid unnecessarily increasing
-the state space: because they are not part of the algorithm proper,
+the state space:
+Because they are not part of the algorithm proper,
 we lose no verification coverage by making them atomic.
 
 The \co{do-od} construct on \clnrefrange{dood1:b}{dood1:e}
@@ -148,8 +150,8 @@ assertion was violated.
 The ``Warning'' line reiterates that all was not well with our model.
 The second paragraph describes the type of state-search being carried out,
 in this case for assertion violations and invalid end states.
-The third paragraph gives state-size statistics: this small model had only
-45 states.
+The third paragraph gives state-size statistics:
+This small model had only 45 states.
 The final line shows memory usage.
 
 The \co{trail} file may be rendered human-readable as follows:
@@ -173,7 +175,8 @@ incrementer processes, both of which first fetched the counter,
 then both incremented and stored it, losing a count.
 The assertion then triggered, after which the global state is displayed.
 
-\subsubsection{Warm-Up: Atomic Increment}
+\subsubsection{Warm-Up:
+			Atomic Increment}
 \label{sec:formal:Warm-Up: Atomic Increment}
 
 It is easy to fix this example by placing the body of the incrementer
@@ -477,7 +480,8 @@ atomic {
 
 Now we are ready for further examples.
 
-\subsection{Promela Example: Locking}
+\subsection{Promela Example:
+			     Locking}
 \label{sec:formal:Promela Example: Locking}
 
 \begin{fcvref}[ln:formal:promela:lock:whole]
@@ -518,7 +522,7 @@ In any given Promela state, all processes agree on both the current
 state and the order of state changes that caused us to arrive at
 the current state.
 This is analogous to the ``sequentially consistent'' memory model
-used by a few computer systems (such as 1990s MIPS and PA-RISC).
+used by a few computer systems (such as 1990s MIPS and PA-RISC\@).
 As noted earlier, and as will be seen in a later example,
 weak memory ordering must be explicitly coded.
 
@@ -613,7 +617,8 @@ As expected, this run has no assertion failures (``errors: 0'').
 }\QuickQuizEndE
 }
 
-\subsection{Promela Example: QRCU}
+\subsection{Promela Example:
+			     QRCU}
 \label{sec:formal:Promela Example: QRCU}
 
 This final example demonstrates a real-world use of Promela on Oleg
@@ -691,9 +696,9 @@ The \co{readerprogress} array elements have values as follows,
 indicating the state of the corresponding reader:
 
 \begin{enumerate}[label={\arabic*}:,start=0,itemsep=0pt]
-\item	not yet started.
-\item	within QRCU read-side critical section.
-\item	finished with QRCU read-side critical section.
+\item	Not yet started.
+\item	Within QRCU read-side critical section.
+\item	Finished with QRCU read-side critical section.
 \end{enumerate}
 
 Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
@@ -1073,8 +1078,8 @@ state visible to either readers or other updaters.
 This means that any sequences of state changes can be carried
 out serially by a single updater due to the fact that Promela does a full
 state-space search.
-Therefore, at most two updaters are required: one to change state
-and a second to become confused.
+Therefore, at most two updaters are required:
+One to change state and a second to become confused.
 
 The situation with the readers is less clear-cut, as each reader
 does only a single read-side critical section then terminates.
@@ -1084,7 +1089,8 @@ in the counters.
 This is a fruitful avenue of investigation, in fact, it leads to
 the full proof of correctness described in the next section.
 
-\subsubsection{Alternative Approach: Proof of Correctness}
+\subsubsection{Alternative Approach:
+				     Proof of Correctness}
 \label{sec:formal:Alternative Approach: Proof of Correctness}
 
 An informal proof~\cite{PaulMcKenney2007QRCUpatch}
@@ -1128,7 +1134,8 @@ follows:
 Of course, not all parallel algorithms have such simple proofs.
 In such cases, it may be necessary to enlist more capable tools.
 
-\subsubsection{Alternative Approach: More Capable Tools}
+\subsubsection{Alternative Approach:
+				     More Capable Tools}
 \label{sec:formal:Alternative Approach: More Capable Tools}
 
 Although Promela and Spin are quite useful,
@@ -1153,7 +1160,8 @@ algorithms.
 
 Another approach might be to divide and conquer.
 
-\subsubsection{Alternative Approach: Divide and Conquer}
+\subsubsection{Alternative Approach:
+				     Divide and Conquer}
 \label{sec:formal:Alternative Approach: Divide and Conquer}
 
 It is often possible to break down a larger parallel algorithm into
-- 
2.17.1


