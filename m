Return-Path: <SRS0=II6t=XX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ic9jTfJL79/WkxoF8sl4ssOJ0i/CGmsFMpLnlWswfrY=;
        b=WwkJOjsV8WTNSB9QwVjWDVeQhexAVToB6biNcibPNTV8Ol78I0JxVLKV04BbGhAmgb
         RTQ2mtp4A1oqrr24T0xQqsVlXVUpfYt3w9TNOEF3ml3GpZvwPLJmLVNpEkcpBZguvYxg
         6QQ6l6DiIji/65es8VNE/R1HtDwVHZRXChg7ENC1YjQCxsGrHoTJ44w8l1YlobonNKUX
         szNqSfg7kdX5It2eKdCI9qxZb1bba0VV8W/JHPDGyrjp81MZdqKg0329z7hGJv+VMJPB
         qEs2v59/Bw/48OLB3AuW829cW85qcfHQHbVw3XwI6l3Ib6ao00MSYlP3Ttrx5NSFHx7L
         LDlA==
Subject: [PATCH 2/6] ppcmem: Apply new scheme of code snippets
References: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6e5e186c-5a3b-ad08-9b1f-68d0c0aefa31@gmail.com>
Date: Sat, 28 Sep 2019 10:59:57 +0900
MIME-Version: 1.0
In-Reply-To: <4ae0f35c-d968-0a34-2d93-32f395d90d9a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1648cb79f31d86f1dc284fc41937cf60cfd2adf4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 21:38:19 +0900
Subject: [PATCH 2/6] ppcmem: Apply new scheme of code snippets

Also employ "cleveref" way of cross-reference.

Note: While putting two labels on a line as is done in the "PPC"
flavor litmus test is not covered by fcvextract.pl at the moment,
it works in this case where the contents of the snippet is
directly coded in the listing environment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/ppcmem.tex | 189 +++++++++++++++++++++++-----------------------
 1 file changed, 95 insertions(+), 94 deletions(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index c72a7a08..a5cb90e3 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -14,7 +14,7 @@ understand memory models used by production systems, greatly simplifying the
 verification of weakly ordered code.
 
 For example,
-Section~\ref{sec:formal:Promela Example: QRCU}
+\cref{sec:formal:Promela Example: QRCU}
 showed how to convince Promela to account for weak memory ordering.
 Although this approach can work well, it requires that the developer
 fully understand the system's memory model.
@@ -45,62 +45,63 @@ produced the PPCMEM tool based on the Power and ARM formalizations.
 
 The PPCMEM tool takes \emph{litmus tests} as input.
 A sample litmus test is presented in
-Section~\ref{sec:formal:Anatomy of a Litmus Test}.
-Section~\ref{sec:formal:What Does This Litmus Test Mean?}
+\cref{sec:formal:Anatomy of a Litmus Test}.
+\Cref{sec:formal:What Does This Litmus Test Mean?}
 relates this litmus test to the equivalent C-language program,
-Section~\ref{sec:formal:Running a Litmus Test} describes how to
+\cref{sec:formal:Running a Litmus Test} describes how to
 apply PPCMEM to this litmus test, and
-Section~\ref{sec:formal:PPCMEM Discussion}
+\cref{sec:formal:PPCMEM Discussion}
 discusses the implications.
 
 \subsection{Anatomy of a Litmus Test}
 \label{sec:formal:Anatomy of a Litmus Test}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 PPC SB+lwsync-RMW-lwsync+isync-simple
- 2 ""
- 3 {
- 4 0:r2=x; 0:r3=2; 0:r4=y; 0:r10=0; 0:r11=0; 0:r12=z;
- 5 1:r2=y; 1:r4=x;
- 6 }
- 7  P0                 | P1           ;
- 8  li r1,1            | li r1,1      ;
- 9  stw r1,0(r2)       | stw r1,0(r2) ;
-10  lwsync             | sync         ;
-11                     | lwz r3,0(r4) ;
-12  lwarx  r11,r10,r12 | ;
-13  stwcx. r11,r10,r12 | ;
-14  bne Fail1          | ;
-15  isync              | ;
-16  lwz r3,0(r4)       | ;
-17  Fail1:             | ;
-18 
-19 exists
-20 (0:r3=0 /\ 1:r3=0)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{linelabel}[ln:formal:PPCMEM Litmus Test]
+\begin{VerbatimL}[commandchars=\@\[\]]
+PPC SB+lwsync-RMW-lwsync+isync-simple		@lnlbl[type]
+""						@lnlbl[altname]
+{						@lnlbl[init:b]
+0:r2=x; 0:r3=2; 0:r4=y; 0:r10=0; 0:r11=0; 0:r12=z; @lnlbl[init:0]
+1:r2=y; 1:r4=x;					@lnlbl[init:1]
+}						@lnlbl[init:e]
+ P0                 | P1           ;		@lnlbl[procid]
+ li r1,1            | li r1,1      ;		@lnlbl[reginit]
+ stw r1,0(r2)       | stw r1,0(r2) ;		@lnlbl[stw]
+ lwsync             | sync         ; @lnlbl[P0lwsync] @lnlbl[P1sync]
+                    | lwz r3,0(r4) ; @lnlbl[P0empty]  @lnlbl[P1lwz]
+ lwarx  r11,r10,r12 | ;		@lnlbl[P0lwarx] @lnlbl[P1empty:b]
+ stwcx. r11,r10,r12 | ;		@lnlbl[P0stwcx]
+ bne Fail1          | ;		@lnlbl[P0bne]
+ isync              | ;		@lnlbl[P0isync]
+ lwz r3,0(r4)       | ;		@lnlbl[P0lwz]
+ Fail1:             | ;		@lnlbl[P0fail1] @lnlbl[P1empty:e]
+
+exists						@lnlbl[assert:b]
+(0:r3=0 /\ 1:r3=0)				@lnlbl[assert:e]
+\end{VerbatimL}
+\end{linelabel}
 \caption{PPCMEM Litmus Test}
 \label{lst:formal:PPCMEM Litmus Test}
 \end{listing}
 
 An example PowerPC litmus test for PPCMEM is shown in
-Listing~\ref{lst:formal:PPCMEM Litmus Test}.
+\cref{lst:formal:PPCMEM Litmus Test}.
 The ARM interface works exactly the same way, but with ARM instructions
 substituted for the Power instructions and with the initial ``PPC''
 replaced by ``ARM''. You can select the ARM interface by clicking on
 ``Change to ARM Model'' at the web page called out above.
 
-In the example, line~1 identifies the type of system (``ARM'' or ``PPC'')
-and contains the title for the model. Line~2 provides a place for an
+\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+In the example, \clnref{type} identifies the type of system (``ARM'' or
+``PPC'') and contains the title for the model. \Clnref{altname}
+provides a place for an
 alternative name for the test, which you will usually want to leave
 blank as shown in the above example. Comments can be inserted between
-lines~2 and~3 using the OCaml (or Pascal) syntax of \nbco{(* *)}.
+\clnref{altname,init:b} using the OCaml (or Pascal) syntax of \nbco{(* *)}.
 
-Lines~3-6 give initial values for all registers; each is of the form
+\Clnrefrange{init:b}{init:e} give initial values for all registers;
+each is of the form
 \co{P:R=V}, where \co{P} is the process identifier, \co{R} is the register
 identifier, and \co{V} is the value. For example, process 0's register
 r3 initially contains the value 2. If the value is a variable (\co{x},
@@ -110,18 +111,21 @@ of variables, for example, \co{x=1} initializes the value of \co{x} to
 1. Uninitialized variables default to the value zero, so that in the
 example, \co{x}, \co{y}, and \co{z} are all initially zero.
 
-Line~7 provides identifiers for the two processes, so that the \co{0:r3=2}
-on line~4 could instead have been written \co{P0:r3=2}. Line~7 is
+\Clnref{procid} provides identifiers for the two processes, so that
+the \co{0:r3=2} on \clnref{init:0} could instead have been written
+\co{P0:r3=2}. \Clnref{procid} is
 required, and the identifiers must be of the form \co{Pn}, where \co{n}
 is the column number, starting from zero for the left-most column. This
 may seem unnecessarily strict, but it does prevent considerable confusion
 in actual use.
+\end{lineref}
 
 \QuickQuiz{}
-	Why does line~8
-	of Listing~\ref{lst:formal:PPCMEM Litmus Test}
+	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	Why does \clnref{reginit} of \cref{lst:formal:PPCMEM Litmus Test}
 	initialize the registers?
-	Why not instead initialize them on lines~4 and~5?
+	Why not instead initialize them on \clnref{init:0,init:1}?
+	\end{lineref}
 \QuickQuizAnswer{
 	Either way works.
 	However, in general, it is better to use initialization than
@@ -134,15 +138,18 @@ in actual use.
 	initialization instructions.
 } \QuickQuizEnd
 
-Lines~8-17 are the lines of code for each process. A given process
-can have empty lines, as is the case for P0's line~11 and P1's
-lines~12-17.
+\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+\Clnrefrange{reginit}{P0fail1} are the lines of code for each process.
+A given process can have empty lines, as is the case for P0's
+\clnref{P0empty} and P1's \clnrefrange{P1empty:b}{P1empty:e}.
 Labels and branches are permitted, as demonstrated by the branch
-on line~14 to the label on line~17. That said, too-free use of branches
+on \clnref{P0bne} to the label on \clnref{P0fail1}.
+That said, too-free use of branches
 will expand the state space. Use of loops is a particularly good way to
 explode your state space.
 
-Lines~19-20 show the assertion, which in this case indicates that we
+\Clnrefrange{assert:b}{assert:e} show the assertion, which in this case
+indicates that we
 are interested in whether P0's and P1's r3 registers can both contain
 zero after both threads complete execution. This assertion is important
 because there are a number of use cases that would fail miserably if
@@ -160,26 +167,32 @@ your Power or ARM memory-ordering question.
 \subsection{What Does This Litmus Test Mean?}
 \label{sec:formal:What Does This Litmus Test Mean?}
 
-P0's lines~8 and~9 are equivalent to the C statement \co{x=1} because
-line~4 defines P0's register \co{r2} to be the address of \co{x}. P0's
-lines~12 and~13 are the mnemonics for load-linked (``load register
+P0's \clnref{reginit,stw} are equivalent to the C statement \co{x=1}
+because \clnref{init:0} defines P0's register \co{r2} to be the address
+of \co{x}. P0's \clnref{P0lwarx,P0stwcx} are the mnemonics for
+load-linked (``load register
 exclusive'' in ARM parlance and ``load reserve'' in Power parlance)
 and store-conditional (``store register exclusive'' in ARM parlance),
 respectively. When these are used together, they form an atomic
 instruction sequence, roughly similar to the compare-and-swap sequences
 exemplified by the x86 \co{lock;cmpxchg} instruction. Moving to a higher
-level of abstraction, the sequence from lines~10-15 is equivalent to
-the Linux kernel's \co{atomic_add_return(&z, 0)}. Finally, line~16 is
+level of abstraction, the sequence from \clnrefrange{P0lwsync}{P0isync}
+is equivalent to the Linux kernel's \co{atomic_add_return(&z, 0)}.
+Finally, \clnref{P0lwz} is
 roughly equivalent to the C statement \co{r3=y}.
 
-P1's lines~8 and~9 are equivalent to the C statement \co{y=1}, line~10
+P1's \clnref{reginit,stw} are equivalent to the C statement \co{y=1},
+\clnref{P1sync}
 is a memory barrier, equivalent to the Linux kernel statement \co{smp_mb()},
-and line~11 is equivalent to the C statement \co{r3=x}.
+and \clnref{P1lwz} is equivalent to the C statement \co{r3=x}.
+\end{lineref}
 
 \QuickQuiz{}
-	But whatever happened to line~17 of
-	Listing~\ref{lst:formal:PPCMEM Litmus Test},
-	the one that is the \co{Fail:} label?
+	\begin{lineref}[ln:formal:PPCMEM Litmus Test]
+	But whatever happened to \clnref{P0fail1} of
+	\cref{lst:formal:PPCMEM Litmus Test},
+	the one that is the \co{Fail1:} label?
+	\end{lineref}
 \QuickQuizAnswer{
 	The implementation of powerpc version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
@@ -195,36 +208,32 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 } \QuickQuizEnd
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
- 1 void P0(void)
- 2 {
- 3   int r3;
- 4 
- 5   x = 1; /* Lines 8 and 9 */
- 6   atomic_add_return(&z, 0); /* Lines 10-15 */
- 7   r3 = y; /* Line 16 */
- 8 }
- 9 
-10 void P1(void)
-11 {
-12   int r3;
-13 
-14   y = 1; /* Lines 8-9 */
-15   smp_mb(); /* Line 10 */
-16   r3 = x; /* Line 11 */
-17 }
-\end{verbbox}
+\begin{VerbatimL}
+void P0(void)
+{
+	int r3;
+
+	x = 1; /* Lines 8 and 9 */
+	atomic_add_return(&z, 0); /* Lines 10-15 */
+	r3 = y; /* Line 16 */
+}
+
+void P1(void)
+{
+	int r3;
+
+	y = 1; /* Lines 8-9 */
+	smp_mb(); /* Line 10 */
+	r3 = x; /* Line 11 */
 }
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Meaning of PPCMEM Litmus Test}
 \label{lst:formal:Meaning of PPCMEM Litmus Test}
 \end{listing}
 
 Putting all this together, the C-language equivalent to the entire litmus
 test is as shown in
-Listing~\ref{lst:formal:Meaning of PPCMEM Litmus Test}.
+\cref{lst:formal:Meaning of PPCMEM Litmus Test}.
 The key point is that if \co{atomic_add_return()} acts as a full
 memory barrier (as the Linux kernel requires it to), 
 then it should be impossible for \co{P0()}'s and \co{P1()}'s \co{r3}
@@ -245,8 +254,7 @@ possible sequence of events, a separate tool is provided for this
 purpose~\cite{PaulEMcKenney2011ppcmem}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none,xleftmargin=0pt]
 ./ppcmem -model lwsync_read_block \
          -model coherence_points filename.litmus
 ...
@@ -261,21 +269,18 @@ Ok
 Condition exists (0:r3=0 /\ 1:r3=0)
 Hash=e2240ce2072a2610c034ccd4fc964e77
 Observation SB+lwsync-RMW-lwsync+isync Sometimes 1
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{PPCMEM Detects an Error}
 \label{lst:formal:PPCMEM Detects an Error}
 \end{listing}
 
 Because the litmus test shown in
-Listing~\ref{lst:formal:PPCMEM Litmus Test}
+\cref{lst:formal:PPCMEM Litmus Test}
 contains read-modify-write instructions, we must add \co{-model}
 arguments to the command line.
 If the litmus test is stored in \co{filename.litmus},
 this will result in the output shown in
-Listing~\ref{lst:formal:PPCMEM Detects an Error},
+\cref{lst:formal:PPCMEM Detects an Error},
 where the \co{...} stands for voluminous making-progress output.
 The list of states includes \co{0:r3=0; 1:r3=0;}, indicating once again
 that the old PowerPC implementation of \co{atomic_add_return()} does
@@ -284,8 +289,7 @@ The ``Sometimes'' on the last line confirms this: the assertion triggers
 for some executions, but not all of the time.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none,xleftmargin=0pt]
 ./ppcmem -model lwsync_read_block \
          -model coherence_points filename.litmus
 ...
@@ -299,17 +303,14 @@ No (allowed not found)
 Condition exists (0:r3=0 /\ 1:r3=0)
 Hash=77dd723cda9981248ea4459fcdf6097d
 Observation SB+lwsync-RMW-lwsync+sync Never 0 5
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{PPCMEM on Repaired Litmus Test}
 \label{lst:formal:PPCMEM on Repaired Litmus Test}
 \end{listing}
 
 The fix to this Linux-kernel bug is to replace P0's \co{isync} with
 \co{sync}, which results in the output shown in
-Listing~\ref{lst:formal:PPCMEM on Repaired Litmus Test}.
+\cref{lst:formal:PPCMEM on Repaired Litmus Test}.
 As you can see, \co{0:r3=0; 1:r3=0;} does not appear in the list of states,
 and the last line calls out ``Never''.
 Therefore, the model predicts that the offending execution sequence
-- 
2.17.1


