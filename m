Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=2lj9jB+eAIXrAwgrBCo1coloMNPL3WqP97SeFyG1nSM=;
        b=CgnoR0q52y6lIWmJQ2m0I0xZu0M1LaSF17aYyanK56dpfkPFdPGI2CUY5pkbkJpnUL
         mJGgNX/pGFZBw3ZcVapMdbs52mT8tlFSfkuFsjCteJF4qwwwcCMFN0NXGSh8BQtj08hO
         YuPF49LkpWgRRzD1g7oqlywhg30TK744YSNM7oNKkGxY9ygZyXIubbIHLeGYt1ebKPAs
         nOcJFd9E1tcbm6GW50O0G+HsatXnfojXaoPzRY3vzw844r4NwVSC6weq/4Huh3Q/9cuy
         IuKXnJIuGMnSS75Dp8xgdUb9+E6P0PqBp1V8PwZtWir1Tf6L2XFPsr0KY0mP4KZ7TSts
         68TA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal/dyntickrcu: Mitigate ugliness of tall inline snippets
Message-ID: <1b15d6d0-55da-0fc6-67bb-0f30b4eb5fa9@gmail.com>
Date: Sat, 6 Apr 2019 09:31:03 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8f49523f66fb2281b4337ce57f6502400f0dcb9c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Apr 2019 08:53:12 +0900
Subject: [PATCH] formal/dyntickrcu: Mitigate ugliness of tall inline snippets

In two-column layout, frames around snippets by \VerbatimN cause
column breaks of snippets look somewhat ugly.

As a mitigation, disable frame of \VerbatimN in this particular
section. Also use \VerbatimU for patch snippets to prevent
them from breaking other inline snippets in one-column layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I know this is not ideal for you, but in one-column layout, the
column breaks of long snippets does not disturb me so much.

So this patch disables frame around \VerbatimN for two-column layout
to restore the looks in the old scheme.

Isn't this approach acceptable to you, at least as a workaround?

        Thanks, Akira
--
 formal/dyntickrcu.tex | 67 ++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index c73cdd2f..94093ee9 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1,5 +1,14 @@
 % formal/dyntickrcu.tex
 
+% Disable frame around VerbatimN in two-column layout
+\IfTwoColumn{
+\RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
+{numbers=left,numbersep=5pt,xleftmargin=10pt,xrightmargin=0pt,frame=none}
+\AtBeginEnvironment{VerbatimN}{%
+\renewcommand{\lnlbl}[1]{\raisebox{0pt}{\phantomsection\label{\lnlblbase:#1}}}%
+}
+}{}
+
 \subsection{Promela Parable: dynticks and Preemptible RCU}
 \label{sec:formal:Promela Parable: dynticks and Preemptible RCU}
 
@@ -1114,10 +1123,19 @@ states, passing without errors.
 
 \subsubsection{Lessons (Re)Learned}
 \label{sec:formal:Lessons (Re)Learned}
-\NoIndentAfterThis
 
-\begin{listing}[tbp]
-\begin{VerbatimL}[numbers=none]
+This effort provided some lessons (re)learned:
+
+\begin{enumerate}
+\item	{\bf Promela and Spin can verify interrupt\slash NMI\-/handler
+	interactions.}
+\item	{\bf Documenting code can help locate bugs.}
+	In this case, the documentation effort located
+	a misplaced memory barrier in
+	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
+	as shown by the following patch.
+
+\begin{VerbatimU}
  static inline void rcu_enter_nohz(void)
  {
 +       mb();
@@ -1131,38 +1149,20 @@ states, passing without errors.
         __get_cpu_var(dynticks_progress_counter)++;
 +       mb();
  }
-\end{VerbatimL}
-\caption{Memory-Barrier Fix Patch}
-\label{lst:formal:Memory-Barrier Fix Patch}
-\end{listing}
-
-\begin{listing}[tbp]
-\begin{VerbatimL}[numbers=none]
--       if ((curr - snap) > 2 || (snap & 0x1) == 0)
-+       if ((curr - snap) > 2 || (curr & 0x1) == 0)
-\end{VerbatimL}
-\caption{Variable-Name-Typo Fix Patch}
-\label{lst:formal:Variable-Name-Typo Fix Patch}
-\end{listing}
-
-This effort provided some lessons (re)learned:
+\end{VerbatimU}
 
-\begin{enumerate}
-\item	{\bf Promela and Spin can verify interrupt\slash NMI\-/handler
-	interactions.}
-\item	{\bf Documenting code can help locate bugs.}
-	In this case, the documentation effort located
-	a misplaced memory barrier in
-	\co{rcu_enter_nohz()} and \co{rcu_exit_nohz()},
-	as shown by the patch in
-	Listing~\ref{lst:formal:Memory-Barrier Fix Patch}.
 \item	{\bf Validate your code early, often, and up to the point
 	of destruction.}
 	This effort located one subtle bug in
 	\co{rcu_try_flip_waitack_needed()}
 	that would have been quite difficult to test or debug, as
-	shown by the patch in
-	Listing~\ref{lst:formal:Variable-Name-Typo Fix Patch}.
+	shown by the following patch.
+
+\begin{VerbatimU}
+-       if ((curr - snap) > 2 || (snap & 0x1) == 0)
++       if ((curr - snap) > 2 || (curr & 0x1) == 0)
+\end{VerbatimU}
+
 \item	{\bf Always verify your verification code.}
 	The usual way to do this is to insert a deliberate bug
 	and verify that the verification code catches it.  Of course,
@@ -1621,3 +1621,12 @@ where an NMI might change shared state at any point during execution of
 the \IRQ\ functions.
 
 Verification can be a good thing, but simplicity is even better.
+
+% Restore frame around VerbatimN in two-column layout
+\IfTwoColumn{
+\RecustomVerbatimEnvironment{VerbatimN}{Verbatim}%
+{numbers=left,numbersep=3pt,xleftmargin=5pt,xrightmargin=5pt,frame=single}
+\AtBeginEnvironment{VerbatimN}{%
+\renewcommand{\lnlbl}[1]{\raisebox{9pt}{\phantomsection\label{\lnlblbase:#1}}}%
+}
+}{}
-- 
2.17.1

