Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ln4Jq9H8n8KOKEt5/q7+IY9XX4Oe4l9ni4glMMLkXBM=;
        b=qziwZ47wQcnsn00mQd3JHfqsdvIrQCTJgYOMVYHKRBb1CYTVcxLBb2Xx+Uqs3DPQad
         S+xKErTMsJKoTyA74+ITPtpv8I9unMECE50ZUPh0x7k/Jm4EG+9p8x40uEZf+UcsRADh
         5bXXR7fpnsxzw04vt9gOPjcjA+zOOQD7xxMBQHoJJvMkxgyUIGtt0RLv/kQeO+zsZSJQ
         tQpGfTcUbvw//n/jXqCiRfe4fR4haNFR4RP6SGXvZcQ/qccQ76tBpZh02M01XfFkBB4l
         p0W5vnkPN6/gyXVuCb1MQKP6KpxheTH3GetcCOzOW7g1sud6228W0YcZsKtgUPjAS16f
         IwSA==
Subject: [PATCH 2/6] formal/spinhint: Employ new scheme for code snippet
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <901b2a1d-8a05-a2a9-2de0-574adfbf7720@gmail.com>
Date: Sun, 3 Feb 2019 00:09:47 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7c319159fddc42f02836e23581a73facd5d54b47 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 31 Jan 2019 00:08:30 +0900
Subject: [PATCH 2/6] formal/spinhint: Employ new scheme for code snippet

Other than simple transformations, this commit includes the following
changes:

    o Move "listing" environment to outside of "enumerate"
      environment. This is to avoid slight behavior change of
      "VerbatimL" environment inside "enumerate".

      ("VerbatimN" looks OK inside "enumerate".)

    o Embed the unoptimized definition of sum_unordered into
      CodeSamples/formal/promela/qrcu.spin using the
      "#ifndef FCV_SNIPPET" construct, rather than putting
      it in spinhint.tex. Luckily, we don't reference the
      optimized definition as a code snippet.
      (Related to Quick Quiz 12.3)

    o Substitute white spaces for tab characters in snippets
      which appear in the middle of a line.

    o Enclose "do-od" and "if-fi" in \co{} macros.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/promela/atomicincrement.spin |   2 +
 CodeSamples/formal/promela/increment.spin       |  46 +-
 CodeSamples/formal/promela/lock.h               |  16 +-
 CodeSamples/formal/promela/lock.spin            |  46 +-
 CodeSamples/formal/promela/qrcu.spin            |  95 ++--
 formal/spinhint.tex                             | 681 +++++++-----------------
 6 files changed, 318 insertions(+), 568 deletions(-)

diff --git a/CodeSamples/formal/promela/atomicincrement.spin b/CodeSamples/formal/promela/atomicincrement.spin
index 5f4f774..ebeedb2 100644
--- a/CodeSamples/formal/promela/atomicincrement.spin
+++ b/CodeSamples/formal/promela/atomicincrement.spin
@@ -3,6 +3,7 @@
 byte counter = 0;
 byte progress[NUMPROCS];
 
+//\begin{snippet}[labelbase=ln:formal:promela:atomicincrement:incrementer,commandchars=\\\@\$]
 proctype incrementer(byte me)
 {
 	int temp;
@@ -13,6 +14,7 @@ proctype incrementer(byte me)
 	}
 	progress[me] = 1;
 }
+//\end{snippet}
 
 init {
 	int i = 0;
diff --git a/CodeSamples/formal/promela/increment.spin b/CodeSamples/formal/promela/increment.spin
index d82bab1..263d4bd 100644
--- a/CodeSamples/formal/promela/increment.spin
+++ b/CodeSamples/formal/promela/increment.spin
@@ -1,40 +1,42 @@
-#define NUMPROCS 3
+//\begin{snippet}[labelbase=ln:formal:promela:increment:whole,commandchars=\\\@\$]
+#define NUMPROCS 2		//\lnlbl{nprocs}
 
-byte counter = 0;
-byte progress[NUMPROCS];
+byte counter = 0;		//\lnlbl{count}
+byte progress[NUMPROCS];	//\lnlbl{prog}
 
-proctype incrementer(byte me)
+proctype incrementer(byte me)	//\lnlbl{proc:b}
 {
 	int temp;
 
-	temp = counter;
-	counter = temp + 1;
-	progress[me] = 1;
-}
+	temp = counter;		//\lnlbl{incr:b}
+	counter = temp + 1;	//\lnlbl{incr:e}
+	progress[me] = 1;	//\lnlbl{setprog}
+}				//\lnlbl{proc:e}
 
-init {
+init {				//\lnlbl{init:b}
 	int i = 0;
 	int sum = 0;
 
-	atomic {
+	atomic {		//\lnlbl{doinit:b}
 		i = 0;
-		do
-		:: i < NUMPROCS ->
+		do		//\lnlbl{dood1:b}
+		:: i < NUMPROCS ->	//\lnlbl{block1:b}
 			progress[i] = 0;
 			run incrementer(i);
-			i++;
-		:: i >= NUMPROCS -> break;
-		od;
-	}
-	atomic {
+			i++;		//\lnlbl{block1:e}
+		:: i >= NUMPROCS -> break;	//\lnlbl{block2}
+		od;		//\lnlbl{dood1:e}
+	}			//\lnlbl{doinit:e}
+	atomic {		//\lnlbl{assert:b}
 		i = 0;
 		sum = 0;
-		do
+		do		//\lnlbl{dood2:b}
 		:: i < NUMPROCS ->
 			sum = sum + progress[i];
 			i++
 		:: i >= NUMPROCS -> break;
-		od;
-		assert(sum < NUMPROCS || counter == NUMPROCS);
-	}
-}
+		od;		//\lnlbl{dood2:e}
+		assert(sum < NUMPROCS || counter == NUMPROCS);	//\lnlbl{assert}
+	}			//\lnlbl{assert:e}
+}				//\lnlbl{init:e}
+//\end{snippet}
diff --git a/CodeSamples/formal/promela/lock.h b/CodeSamples/formal/promela/lock.h
index 069945d..aa046df 100644
--- a/CodeSamples/formal/promela/lock.h
+++ b/CodeSamples/formal/promela/lock.h
@@ -1,14 +1,16 @@
+//\begin{snippet}[labelbase=ln:formal:promela:lock:whole,commandchars=\!\[\]]
 #define spin_lock(mutex) \
-	do \
-	:: 1 -> atomic { \
+	do /* \lnlbl{dood:b} */\
+	:: 1 -> atomic { /* \lnlbl{one} */\
 			if \
-			:: mutex == 0 -> \
-				mutex = 1; \
-				break \
-			:: else -> skip \
+			:: mutex == 0 -> /* \lnlbl{notheld} */\
+				mutex = 1; /* \lnlbl{acq} */\
+				break /* \lnlbl{break} */\
+			:: else -> skip /* \lnlbl{held} */\
 			fi \
 		} \
-	od
+	od /* \lnlbl{dood:e} */
 
 #define spin_unlock(mutex) \
 	mutex = 0
+//\end{snippet}
diff --git a/CodeSamples/formal/promela/lock.spin b/CodeSamples/formal/promela/lock.spin
index 0057cec..4bbcbd5 100644
--- a/CodeSamples/formal/promela/lock.spin
+++ b/CodeSamples/formal/promela/lock.spin
@@ -1,35 +1,36 @@
+//\begin{snippet}[labelbase=ln:formal:promela:lock:spin,commandchars=\\\@\$]
 #include "lock.h"
 
-#define N_LOCKERS 3
+#define N_LOCKERS 3			//\lnlbl{nlockers}
 
-bit mutex = 0;
-bit havelock[N_LOCKERS];
-int sum;
+bit mutex = 0;				//\lnlbl{mutex}
+bit havelock[N_LOCKERS];		//\lnlbl{array}
+int sum;				//\lnlbl{sum}
 
-proctype locker(byte me)
+proctype locker(byte me)		//\lnlbl{locker:b}
 {
 	do
 	:: 1 ->
-		spin_lock(mutex);
-		havelock[me] = 1;
-		havelock[me] = 0;
-		spin_unlock(mutex)
+		spin_lock(mutex);	//\lnlbl{locker:lock}
+		havelock[me] = 1;	//\lnlbl{locker:claim}
+		havelock[me] = 0;	//\lnlbl{locker:unclaim}
+		spin_unlock(mutex)	//\lnlbl{locker:unlock}
 	od
-}
+}					//\lnlbl{locker:e}
 
-init {
+init {					//\lnlbl{init:b}
 	int i = 0;
 	int j;
 
 end:	do 
 	:: i < N_LOCKERS ->
-		havelock[i] = 0;
-		run locker(i);
-		i++
-	:: i >= N_LOCKERS ->
-		sum = 0;
-		j = 0;
-		atomic {
+		havelock[i] = 0;	//\lnlbl{init:array}
+		run locker(i);		//\lnlbl{init:start}
+		i++			//\lnlbl{init:next}
+	:: i >= N_LOCKERS ->		//\lnlbl{init:chkassert}
+		sum = 0;		//\lnlbl{init:sum}
+		j = 0;			//\lnlbl{init:j}
+		atomic {		//\lnlbl{init:atm:b}
 			do
 			:: j < N_LOCKERS ->
 				sum = sum + havelock[j];
@@ -37,8 +38,9 @@ end:	do
 			:: j >= N_LOCKERS ->
 				break
 			od
-		}
-		assert(sum <= 1);
-		break
+		}			//\lnlbl{init:atm:e}
+		assert(sum <= 1);	//\lnlbl{init:assert}
+		break			//\lnlbl{init:break}
 	od
-}
+}					//\lnlbl{init:e}
+//\end{snippet}
diff --git a/CodeSamples/formal/promela/qrcu.spin b/CodeSamples/formal/promela/qrcu.spin
index 220e135..74315c9 100644
--- a/CodeSamples/formal/promela/qrcu.spin
+++ b/CodeSamples/formal/promela/qrcu.spin
@@ -1,3 +1,4 @@
+//\begin{snippet}[labelbase=ln:formal:promela:qrcu:gvar,commandchars=\\\{\}]
 #include "lock.h"
 
 #define N_QRCU_READERS 2
@@ -7,28 +8,33 @@ bit idx = 0;
 byte ctr[2];
 byte readerprogress[N_QRCU_READERS];
 bit mutex = 0;
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:formal:promela:qrcu:reader,commandchars=\\\@\$]
 proctype qrcu_reader(byte me)
 {
 	int myidx;
 
-	do
-	:: 1 ->
-		myidx = idx;
-		atomic {
+	do				//\lnlbl{do}
+	:: 1 ->				//\lnlbl{one}
+		myidx = idx;		//\lnlbl{curidx}
+		atomic {		//\lnlbl{atm:b}
 			if
 			:: ctr[myidx] > 0 ->
 				ctr[myidx]++;
 				break
 			:: else -> skip
 			fi
-		}
-	od;
-	readerprogress[me] = 1;
-	readerprogress[me] = 2;
-	atomic { ctr[myidx]-- }
+		}			//\lnlbl{atm:e}
+	od;				//\lnlbl{od}
+	readerprogress[me] = 1;		//\lnlbl{cs:entry}
+	readerprogress[me] = 2;		//\lnlbl{cs:exit}
+	atomic { ctr[myidx]-- }		//\lnlbl{atm:dec}
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:formal:promela:qrcu:sum_unordered,commandchars=\!\@\$]
+#ifndef FCV_SNIPPET
 #define sum_unordered \
 	atomic { \
 		if \
@@ -41,19 +47,37 @@ proctype qrcu_reader(byte me)
 		fi; \
 	} \
 	sum = sum + ctr[i]
+#else /* #ifndef FCV_SNIPPET */
+#define sum_unordered \
+	atomic { /* \lnlbl{fetch:b} */\
+		do /* \lnlbl{do} */\
+		:: 1 -> /* \lnlbl{g1} */\
+			sum = ctr[0]; \
+			i = 1; \
+			break \
+		:: 1 -> /* \lnlbl{g2} */\
+			sum = ctr[1]; \
+			i = 0; \
+			break \
+		od; /* \lnlbl{od} */\
+	} /* \lnlbl{fetch:e} */\
+	sum = sum + ctr[i] /* \lnlbl{sum_other} */
+#endif /* #ifndef FCV_SNIPPET */
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:formal:promela:qrcu:updater,keepcomment=yes,commandchars=\\\@\$]
 proctype qrcu_updater(byte me)
 {
 	int i;
 	byte readerstart[N_QRCU_READERS];
 	int sum;
 
-	do
+	do					//\lnlbl{do}
 	:: 1 ->
 
 		/* Snapshot reader state. */
 
-		atomic {
+		atomic {			//\lnlbl{atm1:b}
 			i = 0;
 			do
 			:: i < N_QRCU_READERS ->
@@ -62,65 +86,68 @@ proctype qrcu_updater(byte me)
 			:: i >= N_QRCU_READERS ->
 				break
 			od
-		}
+		}				//\lnlbl{atm1:e}
 
-		sum_unordered;
-		if
+		sum_unordered;			//\lnlbl{sum_unord}
+		if				//\lnlbl{reinvoke:b}
 		:: sum <= 1 -> sum_unordered
 		:: else -> skip
-		fi;
-		if
+		fi;				//\lnlbl{reinvoke:e}
+		if				//\lnlbl{slow:b}
 		:: sum > 1 ->
-			spin_lock(mutex);
-			atomic { ctr[!idx]++ }
+			spin_lock(mutex);	//\lnlbl{acq}
+			atomic { ctr[!idx]++ }	//\lnlbl{flip_idx:b}
 			idx = !idx;
-			atomic { ctr[!idx]-- }
-			do
+			atomic { ctr[!idx]-- }	//\lnlbl{flip_idx:e}
+			do			//\lnlbl{wait:b}
 			:: ctr[!idx] > 0 -> skip
 			:: ctr[!idx] == 0 -> break
-			od;
-			spin_unlock(mutex);
+			od;			//\lnlbl{wait:e}
+			spin_unlock(mutex);	//\lnlbl{rel}
 		:: else -> skip
-		fi;
+		fi;				//\lnlbl{slow:e}
 
 		/* Verify reader progress. */
 
-		atomic {
+		atomic {			//\lnlbl{atm2:b}
 			i = 0;
 			sum = 0;
 			do
 			:: i < N_QRCU_READERS ->
 				sum = sum + (readerstart[i] == 1 &&
-					     readerprogress[i] == 1);
+				             readerprogress[i] == 1);
 				i++
 			:: i >= N_QRCU_READERS ->
-				assert(sum == 0);
+				assert(sum == 0);	//\lnlbl{assert}
 				break
 			od
-		}
-	od
+		}				//\lnlbl{atm2:e}
+	od					//\lnlbl{od}
 }
+//\end{snippet}
 
+//\begin{snippet}[labelbase=ln:formal:promela:qrcu:init,commandchars=\\\@\$]
 init {
 	int i;
 
 	atomic {
-		ctr[idx] = 1;
-		ctr[!idx] = 0;
-		i = 0;
+		ctr[idx] = 1;			//\lnlbl{i_ctr:b}
+		ctr[!idx] = 0;			//\lnlbl{i_ctr:e}
+		i = 0;				//\lnlbl{spn_r:b}
 		do
 		:: i < N_QRCU_READERS ->
 			readerprogress[i] = 0;
 			run qrcu_reader(i);
 			i++
 		:: i >= N_QRCU_READERS -> break
-		od;
-		i = 0;
+		od;				//\lnlbl{spn_r:e}
+		i = 0;				//\lnlbl{spn_u:b}
 		do
 		:: i < N_QRCU_UPDATERS ->
 			run qrcu_updater(i);
 			i++
 		:: i >= N_QRCU_UPDATERS -> break
-		od
+		od				//\lnlbl{spn_u:e}
 	}
 }
+//\end{snippet}
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 11c2c7d..5ba9f04 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -62,115 +62,76 @@ more complex uses.
 \label{sec:formal:Promela Warm-Up: Non-Atomic Increment}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #define NUMPROCS 2
-  2
-  3 byte counter = 0;
-  4 byte progress[NUMPROCS];
-  5
-  6 proctype incrementer(byte me)
-  7 {
-  8   int temp;
-  9
- 10   temp = counter;
- 11   counter = temp + 1;
- 12   progress[me] = 1;
- 13 }
- 14
- 15 init {
- 16   int i = 0;
- 17   int sum = 0;
- 18
- 19   atomic {
- 20     i = 0;
- 21     do
- 22     :: i < NUMPROCS ->
- 23       progress[i] = 0;
- 24       run incrementer(i);
- 25       i++
- 26     :: i >= NUMPROCS -> break
- 27     od;
- 28   }
- 29   atomic {
- 30     i = 0;
- 31     sum = 0;
- 32     do
- 33     :: i < NUMPROCS ->
- 34       sum = sum + progress[i];
- 35       i++
- 36     :: i >= NUMPROCS -> break
- 37     od;
- 38     assert(sum < NUMPROCS || counter == NUMPROCS)
- 39   }
- 40 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/increment@whole.fcv}
 \caption{Promela Code for Non-Atomic Increment}
 \label{lst:analysis:Promela Code for Non-Atomic Increment}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:increment:whole]
 Listing~\ref{lst:analysis:Promela Code for Non-Atomic Increment}
 demonstrates the textbook race condition
 resulting from non-atomic increment.
-Line~1 defines the number of processes to run (we will vary this
-to see the effect on state space), line~3 defines the counter,
-and line~4 is used to implement the assertion that appears on
-lines~29-39.
+Line~\lnref{nprocs} defines the number of processes to run (we will vary this
+to see the effect on state space), line~\lnref{count} defines the counter,
+and line~\lnref{prog} is used to implement the assertion that appears on
+lines~\lnref{assert:b}-\lnref{assert:e}.
 
-Lines~6-13 define a process that increments the counter non-atomically.
+Lines~\lnref{proc:b}-\lnref{proc:e} define a process that increments
+the counter non-atomically.
 The argument \co{me} is the process number, set by the initialization
 block later in the code.
 Because simple Promela statements are each assumed atomic, we must
-break the increment into the two statements on lines~10-11.
-The assignment on line~12 marks the process's completion.
+break the increment into the two statements on
+lines~\lnref{incr:b}-\lnref{incr:e}.
+The assignment on line~\lnref{setprog} marks the process's completion.
 Because the Spin system will fully search the state space, including
 all possible sequences of states, there is no need for the loop
 that would be used for conventional testing.
 
-Lines~15-40 are the initialization block, which is executed first.
-Lines~19-28 actually do the initialization, while lines~29-39
+Lines~\lnref{init:b}-\lnref{init:e} are the initialization block,
+which is executed first.
+Lines~\lnref{doinit:b}-\lnref{doinit:e} actually do the initialization,
+while lines~\lnref{assert:b}-\lnref{assert:e}
 perform the assertion.
 Both are atomic blocks in order to avoid unnecessarily increasing
 the state space: because they are not part of the algorithm proper,
 we lose no verification coverage by making them atomic.
 
-The do-od construct on lines~21-27 implements a Promela loop,
+The \co{do-od} construct on lines~\lnref{dood1:b}-\lnref{dood1:e}
+implements a Promela loop,
 which can be thought of as a C {\tt for (;;)} loop containing a
 \co{switch} statement that allows expressions in case labels.
 The condition blocks (prefixed by {\tt ::})
 are scanned non-deterministically,
 though in this case only one of the conditions can possibly hold at a given
 time.
-The first block of the do-od from lines~22-25 initializes the i-th
+The first block of the \co{do-od} from
+lines~\lnref{block1:b}-\lnref{block1:e}
+initializes the i-th
 incrementer's progress cell, runs the i-th incrementer's process, and
 then increments the variable \co{i}.
-The second block of the do-od on line~26 exits the loop once
+The second block of the \co{do-od} on
+line~\lnref{block2} exits the loop once
 these processes have been started.
 
-The atomic block on lines~29-39 also contains a similar do-od
+The atomic block on lines~\lnref{assert:b}-\lnref{assert:e} also contains
+a similar \co{do-od}
 loop that sums up the progress counters.
-The {\tt assert()} statement on line~38 verifies that if all processes
+The \co{assert()} statement on line~\lnref{assert} verifies that
+if all processes
 have been completed, then all counts have been correctly recorded.
+\end{lineref}
 
 You can build and run this program as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-spin -a increment.spin		# Translate the model to C
-cc -DSAFETY -o pan pan.c	# Compile the model
-./pan				# Run the model
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimU}
+spin -a increment.spin      # Translate the model to C
+cc -DSAFETY -o pan pan.c    # Compile the model
+./pan                       # Run the model
+\end{VerbatimU}
 
 \begin{listing*}[tbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none]
 pan: assertion violated ((sum<2)||(counter==2)) (at depth 20)
 pan: wrote increment.spin.trail
 (Spin Version 4.2.5 -- 2 April 2005)
@@ -191,10 +152,7 @@ State-vector 40 byte, depth reached 22, errors: 1
 hash conflicts: 0 (resolved)
 
 2.622  memory usage (Mbyte)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Non-Atomic Increment spin Output}
 \label{lst:analysis:Non-Atomic Increment spin Output}
 \end{listing*}
@@ -214,18 +172,12 @@ The final line shows memory usage.
 
 The \co{trail} file may be rendered human-readable as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 spin -t -p increment.spin
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 \begin{listing*}[htbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none]
 Starting :init: with pid 0
  1: proc 0 (:init:) line 20 "increment.spin" (state 1) [i = 0]
  2: proc 0 (:init:) line 22 "increment.spin" (state 2) [((i<2))]
@@ -268,10 +220,7 @@ spin: trail ends after 21 steps
                 progress[1] = 1
 21: proc 0 (:init:) line 40 "increment.spin" (state 24) <valid end state>
 3 processes created
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Non-Atomic Increment Error Trail}
 \label{lst:analysis:Non-Atomic Increment Error Trail}
 \end{listing*}
@@ -287,29 +236,13 @@ The assertion then triggered, after which the global state is displayed.
 \label{sec:formal:Promela Warm-Up: Atomic Increment}
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 proctype incrementer(byte me)
-  2 {
-  3   int temp;
-  4
-  5   atomic {
-  6     temp = counter;
-  7     counter = temp + 1;
-  8   }
-  9   progress[me] = 1;
- 10 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/atomicincrement@incrementer.fcv}
 \caption{Promela Code for Atomic Increment}
 \label{lst:analysis:Promela Code for Atomic Increment}
 \end{listing}
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none]
 (Spin Version 4.2.5 -- 2 April 2005)
         + Partial Order Reduction
 
@@ -332,10 +265,7 @@ unreached in proctype incrementer
         (0 of 5 states)
 unreached in proctype :init:
         (0 of 24 states)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Atomic Increment spin Output}
 \label{lst:analysis:Atomic Increment spin Output}
 \end{listing}
@@ -516,19 +446,14 @@ The following tricks can help you to abuse Promela safely:
 	matters (e.g., unprotected by locks), but where you have
 	no memory barriers.  This can be modeled in Promela as follows:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
-  1 if
-  2 :: 1 -> r1 = x;
-  3   r2 = y
-  4 :: 1 -> r2 = y;
-  5   r1 = x
-  6 fi
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}[samepage=true]
+if
+:: 1 -> r1 = x;
+        r2 = y
+:: 1 -> r2 = y;
+        r1 = x
+fi
+\end{VerbatimN}
 
 	The two branches of the \co{if} statement will be selected
 	nondeterministically, since they both are available.
@@ -539,52 +464,6 @@ The following tricks can help you to abuse Promela safely:
 	if used too heavily.
 	In addition, it requires you to anticipate possible reorderings.
 
-\begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 i = 0;
-  2 sum = 0;
-  3 do
-  4 :: i < N_QRCU_READERS ->
-  5   sum = sum + (readerstart[i] == 1 &&
-  6     readerprogress[i] == 1);
-  7   i++
-  8 :: i >= N_QRCU_READERS ->
-  9   assert(sum == 0);
- 10   break
- 11 od
-\end{verbbox}
-}
-\centering
-\theverbbox
-\caption{Complex Promela Assertion}
-\label{lst:analysis:Complex Promela Assertion}
-\end{listing}
-
-\begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 atomic {
-  2   i = 0;
-  3   sum = 0;
-  4   do
-  5   :: i < N_QRCU_READERS ->
-  6     sum = sum + (readerstart[i] == 1 &&
-  7       readerprogress[i] == 1);
-  8     i++
-  9   :: i >= N_QRCU_READERS ->
- 10     assert(sum == 0);
- 11     break
- 12   od
- 13 }
-\end{verbbox}
-}
-\centering
-\theverbbox
-\caption{Atomic Block for Complex Promela Assertion}
-\label{lst:analysis:Atomic Block for Complex Promela Assertion}
-\end{listing}
-
 \item	State reduction.  If you have complex assertions, evaluate
 	them under \co{atomic}.  After all, they are not part of the
 	algorithm.  One example of a complex assertion (to be discussed
@@ -604,55 +483,77 @@ The following tricks can help you to abuse Promela safely:
 	combinatorial explosion.
 \end{enumerate}
 
+\begin{listing}[tbp]
+\begin{VerbatimL}
+i = 0;
+sum = 0;
+do
+:: i < N_QRCU_READERS ->
+	sum = sum + (readerstart[i] == 1 &&
+	             readerprogress[i] == 1);
+	i++
+:: i >= N_QRCU_READERS ->
+	assert(sum == 0);
+	break
+od
+\end{VerbatimL}
+\caption{Complex Promela Assertion}
+\label{lst:analysis:Complex Promela Assertion}
+\end{listing}
+
+\begin{listing}[tbp]
+\begin{VerbatimL}
+atomic {
+	i = 0;
+	sum = 0;
+	do
+	:: i < N_QRCU_READERS ->
+		sum = sum + (readerstart[i] == 1 &&
+		             readerprogress[i] == 1);
+		i++
+	:: i >= N_QRCU_READERS ->
+		assert(sum == 0);
+		break
+	od
+}
+\end{VerbatimL}
+\caption{Atomic Block for Complex Promela Assertion}
+\label{lst:analysis:Atomic Block for Complex Promela Assertion}
+\end{listing}
+
 Now we are ready for more complex examples.
 
 \subsection{Promela Example: Locking}
 \label{sec:formal:Promela Example: Locking}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #define spin_lock(mutex) \
-  2   do \
-  3   :: 1 -> atomic { \
-  4       if \
-  5       :: mutex == 0 -> \
-  6         mutex = 1; \
-  7         break \
-  8       :: else -> skip \
-  9       fi \
- 10     } \
- 11   od
- 12
- 13 #define spin_unlock(mutex) \
- 14   mutex = 0
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/lock@whole.fcv}
 \caption{Promela Code for Spinlock}
 \label{lst:analysis:Promela Code for Spinlock}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:lock:whole]
 Since locks are generally useful, \co{spin_lock()} and
 \co{spin_unlock()}
 macros are provided in \path{lock.h}, which may be included from
 multiple Promela models, as shown in
 Listing~\ref{lst:analysis:Promela Code for Spinlock}.
-The \co{spin_lock()} macro contains an infinite do-od loop
-spanning lines~2-11,
-courtesy of the single guard expression of ``1'' on line~3.
+The \co{spin_lock()} macro contains an infinite \co{do-od} loop
+spanning lines~\lnref{dood:b}-\lnref{dood:e},
+courtesy of the single guard expression of ``1'' on line~\lnref{one}.
 The body of this loop is a single atomic block that contains
-an if-fi statement.
-The if-fi construct is similar to the do-od construct, except
+an \co{if-fi} statement.
+The \co{if-fi} construct is similar to the \co{do-od} construct, except
 that it takes a single pass rather than looping.
-If the lock is not held on line~5, then line~6 acquires it and
-line~7 breaks out of the enclosing do-od loop (and also exits
+If the lock is not held on line~\lnref{notheld}, then
+line~\lnref{acq} acquires it and
+line~\lnref{break} breaks out of the enclosing \co{do-od} loop (and also exits
 the atomic block).
-On the other hand, if the lock is already held on line~8,
-we do nothing (\co{skip}), and fall out of the if-fi and the
+On the other hand, if the lock is already held on line~\lnref{held},
+we do nothing (\co{skip}), and fall out of the \co{if-fi} and the
 atomic block so as to take another pass through the outer
 loop, repeating until the lock is available.
+\end{lineref}
 
 The \co{spin_unlock()} macro simply marks the lock as no
 longer held.
@@ -668,81 +569,39 @@ As noted earlier, and as will be seen in a later example,
 weak memory ordering must be explicitly coded.
 
 \begin{listing}[tb]
-{ \scriptsize
-\begin{verbbox}
-  1 #include "lock.h"
-  2
-  3 #define N_LOCKERS 3
-  4
-  5 bit mutex = 0;
-  6 bit havelock[N_LOCKERS];
-  7 int sum;
-  8
-  9 proctype locker(byte me)
- 10 {
- 11   do
- 12   :: 1 ->
- 13     spin_lock(mutex);
- 14     havelock[me] = 1;
- 15     havelock[me] = 0;
- 16     spin_unlock(mutex)
- 17   od
- 18 }
- 19
- 20 init {
- 21   int i = 0;
- 22   int j;
- 23
- 24 end:  do
- 25   :: i < N_LOCKERS ->
- 26     havelock[i] = 0;
- 27     run locker(i);
- 28     i++
- 29   :: i >= N_LOCKERS ->
- 30     sum = 0;
- 31     j = 0;
- 32     atomic {
- 33       do
- 34       :: j < N_LOCKERS ->
- 35         sum = sum + havelock[j];
- 36         j = j + 1
- 37       :: j >= N_LOCKERS ->
- 38         break
- 39       od
- 40     }
- 41     assert(sum <= 1);
- 42     break
- 43   od
- 44 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/lock@spin.fcv}
 \caption{Promela Code to Test Spinlocks}
 \label{lst:analysis:Promela Code to Test Spinlocks}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:lock:spin]
 These macros are tested by the Promela code shown in
 Listing~\ref{lst:analysis:Promela Code to Test Spinlocks}.
 This code is similar to that used to test the increments,
 with the number of locking processes defined by the \co{N_LOCKERS}
-macro definition on line~3.
-The mutex itself is defined on line~5, an array to track the lock owner
-on line~6, and line~7 is used by assertion
+macro definition on line~\lnref{nlockers}.
+The mutex itself is defined on line~\lnref{mutex},
+an array to track the lock owner
+on line~\lnref{array}, and line~\lnref{sum} is used by assertion
 code to verify that only one process holds the lock.
-
-The locker process is on lines~9-18, and simply loops forever
-acquiring the lock on line~13, claiming it on line~14,
-unclaiming it on line~15, and releasing it on line~16.
-
-The init block on lines~20-44 initializes the current locker's
-havelock array entry on line~26, starts the current locker on
-line~27, and advances to the next locker on line~28.
-Once all locker processes are spawned, the do-od loop
-moves to line~29, which checks the assertion.
-Lines~30 and~31 initialize the control variables,
-lines~32-40 atomically sum the havelock array entries,
-line~41 is the assertion, and line~42 exits the loop.
+\end{lineref}
+
+\begin{lineref}[ln:formal:promela:lock:spin:locker]
+The locker process is on lines~\lnref{b}-\lnref{e}, and simply loops forever
+acquiring the lock on line~\lnref{lock}, claiming it on line~\lnref{claim},
+unclaiming it on line~\lnref{unclaim}, and releasing it on line~\lnref{unlock}.
+\end{lineref}
+
+\begin{lineref}[ln:formal:promela:lock:spin:init]
+The init block on lines~\lnref{b}-\lnref{e} initializes the current locker's
+havelock array entry on line~\lnref{array}, starts the current locker on
+line~\lnref{start}, and advances to the next locker on line~\lnref{next}.
+Once all locker processes are spawned, the \co{do-od} loop
+moves to line~\lnref{chkassert}, which checks the assertion.
+Lines~\lnref{sum} and~\lnref{j} initialize the control variables,
+lines~\lnref{atm:b}-\lnref{atm:e} atomically sum the havelock array entries,
+line~\lnref{assert} is the assertion, and line~\lnref{break} exits the loop.
+\end{lineref}
 
 We can run this model by placing the two code fragments of
 Listings~\ref{lst:analysis:Promela Code for Spinlock}
@@ -750,20 +609,14 @@ and~\ref{lst:analysis:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 spin -a lock.spin
 cc -DSAFETY -o pan pan.c
 ./pan
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimL}[numbers=none]
 (Spin Version 4.2.5 -- 2 April 2005)
         + Partial Order Reduction
 
@@ -787,10 +640,7 @@ unreached in proctype locker
         (1 of 20 states)
 unreached in proctype :init:
         (0 of 22 states)
-\end{verbbox}
-}
-\centering
-\theverbbox
+\end{VerbatimL}
 \caption{Output for Spinlock Test}
 \label{lst:analysis:Output for Spinlock Test}
 \end{listing}
@@ -863,16 +713,11 @@ latencies of most other RCU implementations.
 
 	For example:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 idx = qrcu_read_lock(&my_qrcu_struct);
 /* read-side critical section. */
 qrcu_read_unlock(&my_qrcu_struct, idx);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 \item	There is a \co{synchronize_qrcu()} primitive that blocks until
 	all pre-existing QRCU read-side critical sections complete,
@@ -894,21 +739,7 @@ but has not yet been included in the Linux kernel as of
 April 2008.
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #include "lock.h"
-  2
-  3 #define N_QRCU_READERS 2
-  4 #define N_QRCU_UPDATERS 2
-  5
-  6 bit idx = 0;
-  7 byte ctr[2];
-  8 byte readerprogress[N_QRCU_READERS];
-  9 bit mutex = 0;
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/qrcu@gvar.fcv}
 \caption{QRCU Global Variables}
 \label{lst:analysis:QRCU Global Variables}
 \end{listing}
@@ -937,194 +768,104 @@ indicating the state of the corresponding reader:
 Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 proctype qrcu_reader(byte me)
-  2 {
-  3   int myidx;
-  4
-  5   do
-  6   :: 1 ->
-  7     myidx = idx;
-  8     atomic {
-  9       if
- 10       :: ctr[myidx] > 0 ->
- 11         ctr[myidx]++;
- 12         break
- 13       :: else -> skip
- 14       fi
- 15     }
- 16   od;
- 17   readerprogress[me] = 1;
- 18   readerprogress[me] = 2;
- 19   atomic { ctr[myidx]-- }
- 20 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/qrcu@reader.fcv}
 \caption{QRCU Reader Process}
 \label{lst:analysis:QRCU Reader Process}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:qrcu:reader]
 QRCU readers are modeled by the \co{qrcu_reader()} process shown in
 Listing~\ref{lst:analysis:QRCU Reader Process}.
-A do-od loop spans lines~5-16, with a single guard of ``1''
-on line~6 that makes it an infinite loop.
-Line~7 captures the current value of the global index, and lines~8-15
+A \co{do-od} loop spans lines~\lnref{do}-\lnref{od},
+with a single guard of ``1''
+on line~\lnref{one} that makes it an infinite loop.
+Line~\lnref{curidx} captures the current value of the global index,
+and lines~\lnref{atm:b}-\lnref{atm:e}
 atomically increment it (and break from the infinite loop)
 if its value was non-zero (\co{atomic_inc_not_zero()}).
-Line~17 marks entry into the RCU read-side critical section, and
-line~18 marks exit from this critical section, both lines for the benefit of
-the {\tt assert()} statement that we shall encounter later.
-Line~19 atomically decrements the same counter that we incremented,
+Line~\lnref{cs:entry} marks entry into the RCU read-side critical section, and
+line~\lnref{cs:exit} marks exit from this critical section,
+both lines for the benefit of
+the \co{assert()} statement that we shall encounter later.
+Line~\lnref{atm:dec} atomically decrements the same counter that we incremented,
 thereby exiting the RCU read-side critical section.
+\end{lineref}
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 #define sum_unordered \
-  2   atomic { \
-  3     do \
-  4     :: 1 -> \
-  5       sum = ctr[0]; \
-  6       i = 1; \
-  7       break \
-  8     :: 1 -> \
-  9       sum = ctr[1]; \
- 10       i = 0; \
- 11       break \
- 12     od; \
- 13   } \
- 14   sum = sum + ctr[i]
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/qrcu@sum_unordered.fcv}
 \caption{QRCU Unordered Summation}
 \label{lst:analysis:QRCU Unordered Summation}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:qrcu:sum_unordered]
 The C-preprocessor macro shown in
 Listing~\ref{lst:analysis:QRCU Unordered Summation}
 sums the pair of counters so as to emulate weak memory ordering.
-Lines~2-13 fetch one of the counters, and line~14 fetches the other
+Lines~\lnref{fetch:b}-\lnref{fetch:e} fetch one of the counters,
+and line~\lnref{sum_other} fetches the other
 of the pair and sums them.
-The atomic block consists of a single do-od statement.
-This do-od statement (spanning lines~3-12) is unusual in that
+The atomic block consists of a single \co{do-od} statement.
+This \co{do-od} statement (spanning lines~\lnref{do}-\lnref{od}) is unusual in that
 it contains two unconditional
-branches with guards on lines~4 and~8, which causes Promela to
+branches with guards on lines~\lnref{g1} and~\lnref{g2}, which causes Promela to
 non-deterministically choose one of the two (but again, the full
 state-space search causes Promela to eventually make all possible
 choices in each applicable situation).
 The first branch fetches the zero-th counter and sets \co{i} to 1 (so
-that line~14 will fetch the first counter), while the second
+that line~\lnref{sum_other} will fetch the first counter), while the second
 branch does the opposite, fetching the first counter and setting \co{i}
-to 0 (so that line~14 will fetch the second counter).
+to 0 (so that line~\lnref{sum_other} will fetch the second counter).
+\end{lineref}
 
 \QuickQuiz{}
-	Is there a more straightforward way to code the do-od statement?
+	Is there a more straightforward way to code the \co{do-od} statement?
 \QuickQuizAnswer{
 	Yes.
-	Replace it with {\tt if-fi} and remove the two {\tt break} statements.
+	Replace it with \co{if-fi} and remove the two \co{break} statements.
 } \QuickQuizEnd
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 proctype qrcu_updater(byte me)
-  2 {
-  3   int i;
-  4   byte readerstart[N_QRCU_READERS];
-  5   int sum;
-  6
-  7   do
-  8   :: 1 ->
-  9
- 10     /* Snapshot reader state. */
- 11
- 12     atomic {
- 13       i = 0;
- 14       do
- 15       :: i < N_QRCU_READERS ->
- 16         readerstart[i] = readerprogress[i];
- 17         i++
- 18       :: i >= N_QRCU_READERS ->
- 19         break
- 20       od
- 21     }
- 22
- 23     sum_unordered;
- 24     if
- 25     :: sum <= 1 -> sum_unordered
- 26     :: else -> skip
- 27     fi;
- 28     if
- 29     :: sum > 1 ->
- 30       spin_lock(mutex);
- 31       atomic { ctr[!idx]++ }
- 32       idx = !idx;
- 33       atomic { ctr[!idx]-- }
- 34       do
- 35       :: ctr[!idx] > 0 -> skip
- 36       :: ctr[!idx] == 0 -> break
- 37       od;
- 38       spin_unlock(mutex);
- 39     :: else -> skip
- 40     fi;
- 41
- 42     /* Verify reader progress. */
- 43
- 44     atomic {
- 45       i = 0;
- 46       sum = 0;
- 47       do
- 48       :: i < N_QRCU_READERS ->
- 49         sum = sum + (readerstart[i] == 1 &&
- 50                readerprogress[i] == 1);
- 51         i++
- 52       :: i >= N_QRCU_READERS ->
- 53         assert(sum == 0);
- 54         break
- 55       od
- 56     }
- 57   od
- 58 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/qrcu@updater.fcv}
 \caption{QRCU Updater Process}
 \label{lst:analysis:QRCU Updater Process}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:qrcu:updater]
 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
 Listing~\ref{lst:analysis:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
-do-od loop ranging over lines~7-57.
-Each pass through the loop first snapshots the global {\tt readerprogress}
-array into the local {\tt readerstart} array on lines~12-21.
-This snapshot will be used for the assertion on line~53.
-Line~23 invokes \co{sum_unordered}, and then lines~24-27
+\co{do-od} loop ranging over lines~\lnref{do}-\lnref{od}.
+Each pass through the loop first snapshots the global \co{readerprogress}
+array into the local \co{readerstart} array on
+lines~\lnref{atm1:b}-\lnref{atm1:e}.
+This snapshot will be used for the assertion on line~\lnref{assert}.
+Line~\lnref{sum_unord} invokes \co{sum_unordered}, and then
+lines~\lnref{reinvoke:b}-\lnref{reinvoke:e}
 re-invoke \co{sum_unordered} if the fastpath is potentially
 usable.
 
-Lines~28-40 execute the slowpath code if need be, with
-lines~30 and~38 acquiring and releasing the update-side lock,
-lines~31-33 flipping the index, and lines~34-37 waiting for
+Lines~\lnref{slow:b}-\lnref{slow:e} execute the slowpath code if need be, with
+lines~\lnref{acq} and~\lnref{rel} acquiring and releasing the update-side lock,
+lines~\lnref{flip_idx:b}-\lnref{flip_idx:e} flipping the index, and
+lines~\lnref{wait:b}-\lnref{wait:e} waiting for
 all pre-existing readers to complete.
 
-Lines~44-56 then compare the current values in the {\tt readerprogress}
-array to those collected in the {\tt readerstart} array,
+Lines~\lnref{atm2:b}-\lnref{atm2:e} then compare the current values
+in the \co{readerprogress}
+array to those collected in the \co{readerstart} array,
 forcing an assertion failure should any readers that started before
 this update still be in progress.
+\end{lineref}
 
 \QuickQuiz{}
-	Why are there atomic blocks at lines~12-21
-	and lines~44-56, when the operations within those atomic
+	\begin{lineref}[ln:formal:promela:qrcu:updater]
+	Why are there atomic blocks at lines~\lnref{atm1:b}-\lnref{atm1:e}
+	and lines~\lnref{atm2:b}-\lnref{atm2:e}, when the operations
+	within those atomic
 	blocks have no atomic implementation on any current
 	production microprocessor?
+	\end{lineref}
 \QuickQuizAnswer{
 	Because those operations are for the benefit of the
 	assertion only.  They are not part of the algorithm itself.
@@ -1134,8 +875,11 @@ this update still be in progress.
 } \QuickQuizEnd
 
 \QuickQuiz{}
-	Is the re-summing of the counters on lines~24-27
+	\begin{lineref}[ln:formal:promela:qrcu:updater]
+	Is the re-summing of the counters on
+        lines~\lnref{reinvoke:b}-\lnref{reinvoke:e}
 	\emph{really} necessary?
+        \end{lineref}
 \QuickQuizAnswer{
 	Yes.  To see this, delete these lines and run the model.
 
@@ -1143,17 +887,17 @@ this update still be in progress.
 
 	\begin{enumerate}
 	\item	One process is within its RCU read-side critical
-		section, so that the value of {\tt ctr[0]} is zero and
-		the value of {\tt ctr[1]} is two.
+		section, so that the value of \co{ctr[0]} is zero and
+		the value of \co{ctr[1]} is two.
 	\item	An updater starts executing, and sees that the sum of
 		the counters is two so that the fastpath cannot be
 		executed.  It therefore acquires the lock.
 	\item	A second updater starts executing, and fetches the value
-		of {\tt ctr[0]}, which is zero.
-	\item	The first updater adds one to {\tt ctr[0]}, flips
+		of \co{ctr[0]}, which is zero.
+	\item	The first updater adds one to \co{ctr[0]}, flips
 		the index (which now becomes zero), then subtracts
-		one from {\tt ctr[1]} (which now becomes one).
-	\item	The second updater fetches the value of {\tt ctr[1]},
+		one from \co{ctr[1]} (which now becomes one).
+	\item	The second updater fetches the value of \co{ctr[1]},
 		which is now one.
 	\item	The second updater now incorrectly concludes that it
 		is safe to proceed on the fastpath, despite the fact
@@ -1162,45 +906,21 @@ this update still be in progress.
 } \QuickQuizEnd
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 init {
-  2   int i;
-  3
-  4   atomic {
-  5     ctr[idx] = 1;
-  6     ctr[!idx] = 0;
-  7     i = 0;
-  8     do
-  9     :: i < N_QRCU_READERS ->
- 10       readerprogress[i] = 0;
- 11       run qrcu_reader(i);
- 12       i++
- 13     :: i >= N_QRCU_READERS -> break
- 14     od;
- 15     i = 0;
- 16     do
- 17     :: i < N_QRCU_UPDATERS ->
- 18       run qrcu_updater(i);
- 19       i++
- 20     :: i >= N_QRCU_UPDATERS -> break
- 21     od
- 22   }
- 23 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/formal/promela/qrcu@init.fcv}
 \caption{QRCU Initialization Process}
 \label{lst:analysis:QRCU Initialization Process}
 \end{listing}
 
+\begin{lineref}[ln:formal:promela:qrcu:init]
 All that remains is the initialization block shown in
 Listing~\ref{lst:analysis:QRCU Initialization Process}.
-This block simply initializes the counter pair on lines~5-6,
-spawns the reader processes on lines~7-14, and spawns the updater
-processes on lines~15-21.
+This block simply initializes the counter pair on
+lines~\lnref{i_ctr:b}-\lnref{i_ctr:e},
+spawns the reader processes on
+lines~\lnref{spn_r:b}-\lnref{spn_r:e}, and spawns the updater
+processes on lines~\lnref{spn_u:b}-\lnref{spn_u:e}.
 This is all done within an atomic block to reduce state space.
+\end{lineref}
 
 \subsubsection{Running the QRCU Example}
 \label{sec:formal:Running the QRCU Example}
@@ -1211,16 +931,11 @@ for \co{spin_lock()} and \co{spin_unlock()} into a file named
 \path{lock.h}.
 Then use the following commands to build and run the QRCU model:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\scriptsize
-\begin{verbatim}
+\begin{VerbatimU}
 spin -a qrcu.spin
 cc -DSAFETY -o pan pan.c
 ./pan
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\end{VerbatimU}
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
-- 
2.7.4


