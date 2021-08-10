Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sepezmebCeJ0CaTX/KqbnLByJKCEtm4Oal3zJ/raMHA=;
        b=WDa289P75oXHTvmhmwyoIGizojwUzPF7JA9xRECEuRced5R6Lr1IwgB/1UnHPoxUW7
         wwgHeADIVT6p+b2FC9IyL7ldeFZe4vBxI5v0icNj198ov8JZ01Fa6CObgjOT/BOQ8jFV
         PEQkysWzoiuBWU6zqnK0LhGSKZh5Nl36z88uT/rF3DTuXoJnw+W8wi81NausItJmROYC
         urLn4WHdBXMPK0FIS7GSnvAiajAHD64LMjK49VBGphagSpGdUFC2qU0i+t2Bg/zvZTM+
         OGRY6RcZVjbqT7iu9KH95lHCr2u26J53iyqIn31mdUquurX1lEReiYligIgbzfwUlB2K
         tSEQ==
Subject: [PATCH 7/7] easy, future: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2b7d4566-8f0f-ee20-fe6f-3d1e41c69364@gmail.com>
Date: Tue, 10 Aug 2021 13:49:48 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 easy/easy.tex            |  6 +++---
 future/cpu.tex           |  5 +++--
 future/formalregress.tex | 24 +++++++++++++++---------
 future/htm.tex           |  8 ++++----
 future/tm.tex            | 30 +++++++++++++++++++-----------
 5 files changed, 44 insertions(+), 29 deletions(-)

diff --git a/easy/easy.tex b/easy/easy.tex
index 5ef4d4df..75da6aea 100644
--- a/easy/easy.tex
+++ b/easy/easy.tex
@@ -32,9 +32,9 @@ This means that creating an easy-to-use API requires that you understand
 your intended users well enough to know what is easy for them.
 Which might or might not have anything to do with what is easy for you.
 
-The following question illustrates this point: ``Given a randomly chosen
-person among everyone alive today, what one change would
-improve that person's life?''
+The following question illustrates this point:
+``Given a randomly chosen person among everyone alive today, what one
+change would improve that person's life?''
 
 There is no single change that would be guaranteed to help everyone's life.
 After all, there is an extremely wide range of people, with a correspondingly
diff --git a/future/cpu.tex b/future/cpu.tex
index 02d383da..27b0d796 100644
--- a/future/cpu.tex
+++ b/future/cpu.tex
@@ -98,8 +98,9 @@ they would need to embrace parallelism, and so it was some time before
 this community concluded that the ``free lunch'' of
 \IXaltr{Moore's-Law}{Moore's Law}-induced
 CPU core-clock frequency increases was well and truly finished.
-Never forget: belief is an emotion, not necessarily the result of a
-rational technical thought process!
+Never forget:
+Belief is an emotion, not necessarily the result of a rational technical
+thought process!
 
 \subsection{Multithreaded Mania}
 \label{sec:future:Multithreaded Mania}
diff --git a/future/formalregress.tex b/future/formalregress.tex
index f7de68bd..60a0fdb0 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -5,7 +5,8 @@
 \section{Formal Regression Testing?}
 \label{sec:future:Formal Regression Testing?}
 %
-\epigraph{Theory without experiments: Have we gone too far?}
+\epigraph{Theory without experiments:
+	  Have we gone too far?}
 	 {\emph{Michael Mitzenmacher}}
 
 Formal verification has long proven useful in a number of production
@@ -38,7 +39,8 @@ start~\cite[slide 34]{PaulEMcKenney2015DagstuhlVerification}:
 \end{enumerate}
 
 This list builds on, but is somewhat more modest than, Richard Bornat's
-dictum: ``Formal-verification researchers should verify the code that
+dictum:
+``Formal-verification researchers should verify the code that
 developers write, in the language they write it in, running in the
 environment that it runs in, as they write it.''
 The following sections discuss each of the above requirements, followed
@@ -202,7 +204,8 @@ could be verified, with or without continued improvements in
 heuristics.
 
 However, the flip side of combinatorial explosion is Philip II of
-Macedon's timeless advice: ``Divide and rule.''
+Macedon's timeless advice:
+``Divide and rule.''
 If a large program can be divided and the pieces verified, the result
 can be combinatorial \emph{implosion}~\cite{PaulEMcKenney2011Verico}.
 One natural place to divide is on API boundaries, for example, those
@@ -233,7 +236,8 @@ use of the locking APIs.
 	5 & 4.905 &        \\
 	\bottomrule
 \end{tabular}
-\caption{Emulating Locking: Performance (s)}
+\caption{Emulating Locking:
+			    Performance (s)}
 \label{tab:future:Emulating Locking: Performance (s)}
 \end{table}
 
@@ -249,8 +253,9 @@ primitives, but these primitives can also be emulated using
 compares the performance and scalability of using the model's
 \co{spin_lock()} and \co{spin_unlock()} against emulating these
 primitives as shown in the listing.
-The difference is not insignificant: At four processes, the model
-is more than two orders of magnitude faster than emulation!
+The difference is not insignificant:
+At four processes, the model is more than two orders of magnitude
+faster than emulation!
 
 \QuickQuiz{
 \begin{fcvref}[ln:future:formalregress:C-SB+l-o-o-u+l-o-o-u-C:whole]
@@ -288,7 +293,8 @@ is more than two orders of magnitude faster than emulation!
 	5 & 4.905 &        &         &        &        \\
 	\bottomrule
 \end{tabular}
-\caption{Emulating Locking: Performance Comparison (s)}
+\caption{Emulating Locking:
+			    Performance Comparison (s)}
 \label{tab:future:Emulating Locking: Performance Comparison (s)}
 \end{table}
 
@@ -456,8 +462,8 @@ decreased the reliability of the overall software.
 	We don't, but it does not matter.
 
 	To see this, note that the 7\,\% figure only applies to injected
-	bugs that were subsequently located: It necessarily ignores
-	any injected bugs that were never found.
+	bugs that were subsequently located:
+	It necessarily ignores any injected bugs that were never found.
 	Therefore, the MTBF statistics of known bugs is likely to be
 	a good approximation of that of the injected bugs that are
 	subsequently located.
diff --git a/future/htm.tex b/future/htm.tex
index 7458f436..c42ba49e 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -184,8 +184,8 @@ in the next section.
 \subsection{HTM Weaknesses WRT Locking}
 \label{sec:future:HTM Weaknesses WRT Locking}
 
-The concept of HTM is quite simple: A group of accesses and updates to
-memory occurs atomically.
+The concept of HTM is quite simple:
+A group of accesses and updates to memory occurs atomically.
 However, as is the case with many simple ideas, complications arise
 when you apply it to real systems in the real world.
 These complications are as follows:
@@ -499,8 +499,8 @@ interrupts, traps, and exceptions (thus prohibiting system calls).
 Note that buffered I/O can be accommodated by HTM transactions as
 long as the buffer fill/flush operations occur extra-transactionally.
 The reason that this works is that adding data to and removing data
-from the buffer is revocable: Only the actual buffer fill/flush
-operations are irrevocable.
+from the buffer is revocable:
+Only the actual buffer fill/flush operations are irrevocable.
 Of course, this buffered-I/O approach has the effect of including the I/O
 in the transaction's footprint, increasing the size of the transaction
 and thus increasing the probability of failure.
diff --git a/future/tm.tex b/future/tm.tex
index f9a4017a..3ec08a81 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -556,9 +556,13 @@ unknowable at compile time.
 So, what happens if a dynamically loaded function is invoked within
 a transaction?
 
-This question has two parts: (a)~how do you dynamically link and load a
-function within a transaction and (b)~what do you do about the unknowable
-nature of the code within this function?
+This question has two parts:
+\begin{enumerate*}[(a)]
+\item How do you dynamically link and load a function within a transaction
+and
+\item What do you do about the unknowable nature of the code within
+this function?
+\end{enumerate*}
 To be fair, item (b) poses some challenges for locking and userspace-RCU
 as well, at least in theory.
 For example, the dynamically linked function might introduce a \IX{deadlock}
@@ -587,8 +591,9 @@ Options for part (b), the inability to detect TM-unfriendly operations
 in a not-yet-loaded function, possibilities include the following:
 
 \begin{enumerate}
-\item	Just execute the code: if there are any TM-unfriendly operations
-	in the function, simply abort the transaction.
+\item	Just execute the code:
+	If there are any TM-unfriendly operations in the function,
+	simply abort the transaction.
 	Unfortunately, this approach makes it impossible for the compiler
 	to determine whether a given group of transactions may be safely
 	composed.
@@ -748,9 +753,9 @@ It is also possible to acquire locks while holding hazard pointers and
 within sequence-lock read-side critical sections.
 But what happens when you attempt to acquire a lock from within a transaction?
 
-In theory, the answer is trivial: simply manipulate the data structure
-representing the lock as part of the transaction, and everything works
-out perfectly.
+In theory, the answer is trivial:
+Simply manipulate the data structure representing the lock as part of
+the transaction, and everything works out perfectly.
 In practice, a number of non-obvious complications~\cite{Volos2008TRANSACT}
 can arise, depending on implementation details of the TM system.
 These complications can be resolved, but at the cost of a 45\,\% increase in
@@ -1211,21 +1216,24 @@ And vice versa.
 \begin{figure}
 \centering
 \resizebox{2.7in}{!}{\includegraphics{cartoons/TM-the-reality-conflict}}
-\caption{The STM Reality: Conflicts}
+\caption{The STM Reality:
+			  Conflicts}
 \ContributedBy{Figure}{fig:future:The STM Reality: Conflicts}{Melissa Broussard}
 \end{figure}
 
 \begin{figure}
 \centering
 \resizebox{3in}{!}{\includegraphics{cartoons/TM-the-reality-nonidempotent}}
-\caption{The STM Reality: Irrevocable Operations}
+\caption{The STM Reality:
+			  Irrevocable Operations}
 \ContributedBy{Figure}{fig:future:The STM Reality: Irrevocable Operations}{Melissa Broussard}
 \end{figure}
 
 \begin{figure}
 \centering
 \resizebox{2.7in}{!}{\includegraphics{cartoons/TM-the-reality-realtime}}
-\caption{The STM Reality: Realtime Response}
+\caption{The STM Reality:
+			  Realtime Response}
 \ContributedBy{Figure}{fig:future:The STM Reality: Realtime Response}{Melissa Broussard}
 \end{figure}
 
-- 
2.17.1


