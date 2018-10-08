Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Az9U/SpgyeD2nNkI5oWrjO88C9ngeWo5qzuy5mpFQs4=;
        b=ghWJW5g1uFMfPM6RJ5+5Qb4dhOfFwwaSHAcZ9dyN+NvQiNdY5y43xov55jma7wqqni
         7Xv8Y4fzlDh9MsiY/3OgpMtAFHnFyQOb5lRiDZb5Lvpd4C1dEKYRkl/Y6u8WvGEnYnEd
         8zrn+f74YLVbcMS9BxjBYQ8qSDIFXeYLWwziBKGDv0arih9rJc3n7vqstJfLlTCgPeUz
         w6n3p77a9qhRGPoEAZ+no/wOVKiIWP4dVyHuab3E+E2x5YUjAqoZNI4RJVzr21k1C/xy
         pCK6Ys9LGKPco3cfg0v1nzF6XflIdpaslFqeXwLJRYwRsl8irDeltBtX7P7eOjzH1Iqq
         lulQ==
Subject: [PATCH 4/5] count: Employ new scheme for snippet of count_lim
References: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b6e5a3eb-cb0e-2e70-925b-026d038c6772@gmail.com>
Date: Mon, 8 Oct 2018 10:47:50 +0900
MIME-Version: 1.0
In-Reply-To: <9c31cb06-b79f-3b9c-e86a-68fb3840f688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 39a3830b185c9f4f6d65ac9162d9981522ed5b94 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 8 Oct 2018 10:23:32 +0900
Subject: [PATCH 4/5] count: Employ new scheme for snippet of count_lim

NOTE: To bundle code for the "Utility Functions" snippet,
definition of globalize_count() and balance_count() is deferred
to behind that of read_count().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/count_lim.c | 147 +++++++++++----------
 count/count.tex               | 294 ++++++++++++++++--------------------------
 2 files changed, 192 insertions(+), 249 deletions(-)

diff --git a/CodeSamples/count/count_lim.c b/CodeSamples/count/count_lim.c
index 4cc8595..69ced9a 100644
--- a/CodeSamples/count/count_lim.c
+++ b/CodeSamples/count/count_lim.c
@@ -20,105 +20,116 @@
 
 #include "../api.h"
 
+static __inline__ void globalize_count(void);
+static __inline__ void balance_count(void);
+
+//\begin{snippet}[labelbase=ln:count:count_lim:variable,commandchars=\\\@\$]
 unsigned long __thread counter = 0;
 unsigned long __thread countermax = 0;
-unsigned long globalcountmax = 10000;
-unsigned long globalcount = 0;
-unsigned long globalreserve = 0;
+unsigned long globalcountmax = 10000;		//\lnlbl{globalcountmax}
+unsigned long globalcount = 0;			//\lnlbl{globalcount}
+unsigned long globalreserve = 0;		//\lnlbl{globalreserve}
 unsigned long *counterp[NR_THREADS] = { NULL };
 DEFINE_SPINLOCK(gblcnt_mutex);
+//\end{snippet}
 
-static void globalize_count(void)
-{
-	globalcount += counter;
-	counter = 0;
-	globalreserve -= countermax;
-	countermax = 0;
-}
-
-static void balance_count(void)
-{
-	countermax = globalcountmax - globalcount - globalreserve;
-	countermax /= num_online_threads();
-	globalreserve += countermax;
-	counter = countermax / 2;
-	if (counter > globalcount)
-		counter = globalcount;
-	globalcount -= counter;
-}
-
-int add_count(unsigned long delta)
+//\begin{snippet}[labelbase=ln:count:count_lim:add_sub_read,commandchars=\\\@\$]
+static __inline__ int add_count(unsigned long delta)	//\lnlbl{add:b}
 {
-	if (countermax - counter >= delta) {
-		counter += delta;
-		return 1;
+	if (countermax - counter >= delta) {		//\lnlbl{add:checklocal}
+		counter += delta);			//\lnlbl{add:add}
+		return 1;				//\lnlbl{add:return:ls}
 	}
-	spin_lock(&gblcnt_mutex);
-	globalize_count();
-	if (globalcountmax - globalcount - globalreserve < delta) {
-		spin_unlock(&gblcnt_mutex);
-		return 0;
+	spin_lock(&gblcnt_mutex);			//\lnlbl{add:acquire}
+	globalize_count();				//\lnlbl{add:globalize}
+	if (globalcountmax -				//\lnlbl{add:checkglb:b}
+	    globalcount - globalreserve < delta) {	//\lnlbl{add:checkglb:e}
+		spin_unlock(&gblcnt_mutex);		//\lnlbl{add:release:f}
+		return 0;				//\lnlbl{add:return:gf}
 	}
-	globalcount += delta;
-	balance_count();
-	spin_unlock(&gblcnt_mutex);
-	return 1;
-}
+	globalcount += delta;				//\lnlbl{add:addglb}
+	balance_count();				//\lnlbl{add:balance}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{add:release:s}
+	return 1;					//\lnlbl{add:return:gs}
+}							//\lnlbl{add:e}
 
-int sub_count(unsigned long delta)
+static __inline__ int sub_count(unsigned long delta)	//\lnlbl{sub:b}
 {
-	if (counter >= delta) {
-		counter -= delta;
-		return 1;
+	if (counter >= delta) {				//\lnlbl{sub:checklocal}
+		counter -= delta;			//\lnlbl{sub:sub}
+		return 1;				//\lnlbl{sub:return:ls}
 	}
-	spin_lock(&gblcnt_mutex);
-	globalize_count();
-	if (globalcount < delta) {
-		spin_unlock(&gblcnt_mutex);
-		return 0;
+	spin_lock(&gblcnt_mutex);			//\lnlbl{sub:acquire}
+	globalize_count();				//\lnlbl{sub:globalize}
+	if (globalcount < delta) {			//\lnlbl{sub:checkglb}
+		spin_unlock(&gblcnt_mutex);		//\lnlbl{sub:release:f}
+		return 0;				//\lnlbl{sub:return:gf}
 	}
-	globalcount -= delta;
-	balance_count();
-	spin_unlock(&gblcnt_mutex);
-	return 1;
-}
+	globalcount -= delta;				//\lnlbl{sub:subglb}
+	balance_count();				//\lnlbl{sub:balance}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{sub:release:s}
+	return 1;					//\lnlbl{sub:return:gs}
+}							//\lnlbl{sub:e}
 
-unsigned long read_count(void)
+static __inline__ unsigned long read_count(void)	//\lnlbl{read:b}
 {
 	int t;
 	unsigned long sum;
 
-	spin_lock(&gblcnt_mutex);
-	sum = globalcount;
-	for_each_thread(t)
+	spin_lock(&gblcnt_mutex);			//\lnlbl{read:acquire}
+	sum = globalcount;				//\lnlbl{read:initsum}
+	for_each_thread(t)				//\lnlbl{read:loop:b}
 		if (counterp[t] != NULL)
-			sum += *counterp[t];
-	spin_unlock(&gblcnt_mutex);
-	return sum;
-}
+			sum += *counterp[t];		//\lnlbl{read:loop:e}
+	spin_unlock(&gblcnt_mutex);			//\lnlbl{read:release}
+	return sum;					//\lnlbl{read:return}
+}							//\lnlbl{read:e}
+//\end{snippet}
 
-void count_init(void)
+//\begin{snippet}[labelbase=ln:count:count_lim:utility,commandchars=\\\@\$]
+static __inline__ void globalize_count(void)	//\lnlbl{globalize:b}
 {
-}
+	globalcount += counter;			//\lnlbl{globalize:add}
+	counter = 0;				//\lnlbl{globalize:zero}
+	globalreserve -= countermax;		//\lnlbl{globalize:sub}
+	countermax = 0;			//\lnlbl{globalize:zeromax}
+}						//\lnlbl{globalize:e}
 
-void count_register_thread(void)
+static __inline__ void balance_count(void)	//\lnlbl{balance:b}
+{
+	countermax = globalcountmax -		//\lnlbl{balance:share:b}
+	             globalcount - globalreserve;
+	countermax /= num_online_threads();	//\lnlbl{balance:share:e}
+	globalreserve += countermax;		//\lnlbl{balance:adjreserve}
+	counter = countermax / 2;		//\lnlbl{balance:middle}
+	if (counter > globalcount)		//\lnlbl{balance:check}
+		counter = globalcount;		//\lnlbl{balance:adjcounter}
+	globalcount -= counter;			//\lnlbl{balance:adjglobal}
+}						//\lnlbl{balance:e}
+
+void count_init(void)			//\fcvexclude
+{					//\fcvexclude
+}					//\fcvexclude
+					//\fcvexclude
+void count_register_thread(void)	//\lnlbl{register:b}
 {
 	int idx = smp_thread_id();
 
 	spin_lock(&gblcnt_mutex);
 	counterp[idx] = &counter;
 	spin_unlock(&gblcnt_mutex);
-}
+}					//\lnlbl{register:e}
 
-void count_unregister_thread(int nthreadsexpected)
+void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unregister:b}
 {
 	int idx = smp_thread_id();
 
-	spin_lock(&gblcnt_mutex);
-	globalize_count();
-	counterp[idx] = NULL;
-	spin_unlock(&gblcnt_mutex);
-}
+	spin_lock(&gblcnt_mutex);		//\lnlbl{unregister:acquire}
+	globalize_count();			//\lnlbl{unregister:globalize}
+	counterp[idx] = NULL;			//\lnlbl{unregister:clear}
+	spin_unlock(&gblcnt_mutex);		//\lnlbl{unregister:release}
+}						//\lnlbl{unregister:e}
+//\end{snippet}
 
 void count_cleanup(void)
 {
diff --git a/count/count.tex b/count/count.tex
index b008a19..db2107e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1312,19 +1312,7 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
 \label{sec:count:Simple Limit Counter Implementation}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 unsigned long __thread counter = 0;
-  2 unsigned long __thread countermax = 0;
-  3 unsigned long globalcountmax = 10000;
-  4 unsigned long globalcount = 0;
-  5 unsigned long globalreserve = 0;
-  6 unsigned long *counterp[NR_THREADS] = { NULL };
-  7 DEFINE_SPINLOCK(gblcnt_mutex);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim@variable.fcv}
 \caption{Simple Limit Counter Variables}
 \label{lst:count:Simple Limit Counter Variables}
 \end{listing}
@@ -1336,19 +1324,23 @@ Section~\ref{sec:SMPdesign:Parallel Fastpath}.
 \label{fig:count:Simple Limit Counter Variable Relationships}
 \end{figure}
 
+\begin{lineref}[ln:count:count_lim:variable]
 Listing~\ref{lst:count:Simple Limit Counter Variables}
 shows both the per-thread and global variables used by this
 implementation.
 The per-thread \co{counter} and \co{countermax} variables are the
 corresponding thread's local counter and the upper bound on that
 counter, respectively.
-The \co{globalcountmax} variable on line~3 contains the upper
+The \co{globalcountmax} variable on
+line~\lnref{globalcountmax} contains the upper
 bound for the aggregate counter, and the \co{globalcount} variable
-on line~4 is the global counter.
+on line~\lnref{globalcount} is the global counter.
 The sum of \co{globalcount} and each thread's \co{counter} gives
 the aggregate value of the overall counter.
-The \co{globalreserve} variable on line~5 is the sum of all of the
+The \co{globalreserve} variable on
+line~\lnref{globalreserve} is the sum of all of the
 per-thread \co{countermax} variables.
+\end{lineref}
 The relationship among these variables is shown by
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}:
 \begin{enumerate}
@@ -1367,62 +1359,7 @@ is permitted to access or modify any of the global variables unless it
 has acquired \co{gblcnt_mutex}.
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 int add_count(unsigned long delta)
-  2 {
-  3   if (countermax - counter >= delta) {
-  4     counter += delta;
-  5     return 1;
-  6   }
-  7   spin_lock(&gblcnt_mutex);
-  8   globalize_count();
-  9   if (globalcountmax -
- 10       globalcount - globalreserve < delta) {
- 11     spin_unlock(&gblcnt_mutex);
- 12     return 0;
- 13   }
- 14   globalcount += delta;
- 15   balance_count();
- 16   spin_unlock(&gblcnt_mutex);
- 17   return 1;
- 18 }
- 19 
- 20 int sub_count(unsigned long delta)
- 21 {
- 22   if (counter >= delta) {
- 23     counter -= delta;
- 24     return 1;
- 25   }
- 26   spin_lock(&gblcnt_mutex);
- 27   globalize_count();
- 28   if (globalcount < delta) {
- 29     spin_unlock(&gblcnt_mutex);
- 30     return 0;
- 31   }
- 32   globalcount -= delta;
- 33   balance_count();
- 34   spin_unlock(&gblcnt_mutex);
- 35   return 1;
- 36 }
- 37 
- 38 unsigned long read_count(void)
- 39 {
- 40   int t;
- 41   unsigned long sum;
- 42 
- 43   spin_lock(&gblcnt_mutex);
- 44   sum = globalcount;
- 45   for_each_thread(t)
- 46     if (counterp[t] != NULL)
- 47       sum += *counterp[t];
- 48   spin_unlock(&gblcnt_mutex);
- 49   return sum;
- 50 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim@add_sub_read.fcv}
 \caption{Simple Limit Counter Add, Subtract, and Read}
 \label{lst:count:Simple Limit Counter Add, Subtract, and Read}
 \end{listing}
@@ -1445,29 +1382,31 @@ functions (\path{count_lim.c}).
 	\co{inc_count()} and \co{dec_count()}.
 } \QuickQuizEnd
 
-Lines~1-18 show \co{add_count()}, which adds the specified value \co{delta}
+\begin{lineref}[ln:count:count_lim:add_sub_read:add]
+Lines~\lnref{b}-\lnref{e} show \co{add_count()},
+which adds the specified value \co{delta}
 to the counter.
-Line~3 checks to see if there is room for \co{delta} on this thread's
-\co{counter}, and, if so, line~4 adds it and line~6 returns success.
+Line~\lnref{checklocal} checks to see if there is room for
+\co{delta} on this thread's
+\co{counter}, and, if so,
+line~\lnref{add} adds it and line~\lnref{return:ls} returns success.
 This is the \co{add_counter()} fastpath, and it does no atomic operations,
 references only per-thread variables, and should not incur any cache misses.
+\end{lineref}
 
 \QuickQuiz{}
-	What is with the strange form of the condition on line~3 of
+	What is with the strange form of the condition on
+	line~\ref{ln:count:count_lim:add_sub_read:add:checklocal} of
 	Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}?
 	Why not the following more intuitive form of the fastpath?
 
-	\vspace{5pt}
-	\begin{minipage}[t]{\columnwidth}
-	\small
-	\begin{verbatim}
-  3 if (counter + delta <= countermax) {
-  4   counter += delta;
-  5   return 1;
-  6 }
-	\end{verbatim}
-	\end{minipage}
-	\vspace{5pt}
+\begin{VerbatimN}[firstnumber=3]
+if (counter + delta <= countermax) {
+	counter += delta;
+	return 1;
+}
+\end{VerbatimN}
+\vspace{-9pt}
 \QuickQuizAnswer{
 	Two words.
 	``Integer overflow.''
@@ -1485,32 +1424,38 @@ references only per-thread variables, and should not incur any cache misses.
 	than parallel algorithms!
 } \QuickQuizEnd
 
-If the test on line~3 fails, we must access global variables, and thus
-must acquire \co{gblcnt_mutex} on line~7, which we release on line~11
-in the failure case or on line~16 in the success case.
-Line~8 invokes \co{globalize_count()}, shown in
+\begin{lineref}[ln:count:count_lim:add_sub_read:add]
+If the test on
+line~\lnref{checklocal} fails, we must access global variables, and thus
+must acquire \co{gblcnt_mutex} on
+line~\lnref{acquire}, which we release on line~\lnref{release:f}
+in the failure case or on line~\lnref{release:s} in the success case.
+Line~\lnref{globalize} invokes \co{globalize_count()}, shown in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
 which clears the thread-local variables, adjusting the global variables
 as needed, thus simplifying global processing.
 (But don't take \emph{my} word for it, try coding it yourself!)
-Lines~9 and~10 check to see if addition of \co{delta} can be accommodated,
+Lines~\lnref{checkglb:b} and~\lnref{checkglb:e} check to see
+if addition of \co{delta} can be accommodated,
 with the meaning of the expression preceding the less-than sign shown in
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
 as the difference in height of the two red (leftmost) bars.
 If the addition of \co{delta} cannot be accommodated, then
-line~11 (as noted earlier) releases \co{gblcnt_mutex} and line~12
+line~\lnref{release:f} (as noted earlier) releases \co{gblcnt_mutex} and
+line~\lnref{return:gf}
 returns indicating failure.
 
 Otherwise, we take the slowpath.
-Line~14 adds \co{delta} to \co{globalcount}, and then
-line~15 invokes \co{balance_count()} (shown in
+Line~\lnref{addglb} adds \co{delta} to \co{globalcount}, and then
+line~\lnref{balance} invokes \co{balance_count()} (shown in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
 in order to update both the global and the per-thread variables.
 This call to \co{balance_count()}
 will usually set this thread's \co{countermax} to re-enable the fastpath.
-Line~16 then releases
+Line~\lnref{release:s} then releases
 \co{gblcnt_mutex} (again, as noted earlier), and, finally,
-line~17 returns indicating success.
+line~\lnref{return:gs} returns indicating success.
+\end{lineref}
 
 \QuickQuiz{}
 	Why does \co{globalize_count()} zero the per-thread variables,
@@ -1525,26 +1470,30 @@ line~17 returns indicating success.
 	overflow!
 } \QuickQuizEnd
 
-Lines~20-36 show \co{sub_count()}, which subtracts the specified
+\begin{lineref}[ln:count:count_lim:add_sub_read:sub]
+Lines~\lnref{b}-\lnref{e} show \co{sub_count()},
+which subtracts the specified
 \co{delta} from the counter.
-Line~22 checks to see if the per-thread counter can accommodate
-this subtraction, and, if so, line~23 does the subtraction and
-line~24 returns success.
+Line~\lnref{checklocal} checks to see if the per-thread counter can accommodate
+this subtraction, and, if so, line~\lnref{sub} does the subtraction and
+line~\lnref{return:ls} returns success.
 These lines form \co{sub_count()}'s fastpath, and, as with
 \co{add_count()}, this fastpath executes no costly operations.
 
 If the fastpath cannot accommodate subtraction of \co{delta},
-execution proceeds to the slowpath on lines~26-35.
-Because the slowpath must access global state, line~26
-acquires \co{gblcnt_mutex}, which is released either by line~29
-(in case of failure) or by line~34 (in case of success).
-Line~27 invokes \co{globalize_count()}, shown in
+execution proceeds to the slowpath on
+lines~\lnlbl{acquire}-\lnlbl{return:gs}.
+Because the slowpath must access global state, line~\lnref{acquire}
+acquires \co{gblcnt_mutex}, which is released either by line~\lnref{release:f}
+(in case of failure) or by line~\lnref{release:s} (in case of success).
+Line~\lnref{globalize} invokes \co{globalize_count()}, shown in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
 which again clears the thread-local variables, adjusting the global variables
 as needed.
-Line~28 checks to see if the counter can accommodate subtracting
-\co{delta}, and, if not, line~29 releases \co{gblcnt_mutex}
-(as noted earlier) and line~30 returns failure.
+Line~\lnref{checkglb} checks to see if the counter can accommodate subtracting
+\co{delta}, and, if not, line~\lnref{release:f} releases \co{gblcnt_mutex}
+(as noted earlier) and line~\lnref{return:gf} returns failure.
+\end{lineref}
 
 \QuickQuiz{}
 	Given that \co{globalreserve} counted against us in \co{add_count()},
@@ -1577,14 +1526,17 @@ Line~28 checks to see if the counter can accommodate subtracting
 	will likely be preferable.
 } \QuickQuizEnd
 
-If, on the other hand, line~28 finds that the counter \emph{can}
+\begin{lineref}[ln:count:count_lim:add_sub_read:sub]
+If, on the other hand, line~\lnref{checkglb} finds that the counter \emph{can}
 accommodate subtracting \co{delta}, we complete the slowpath.
-Line~32 does the subtraction and then
-line~33 invokes \co{balance_count()} (shown in
+Line~\lnref{subglb} does the subtraction and then
+line~\lnref{balance} invokes \co{balance_count()} (shown in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions})
 in order to update both global and per-thread variables
 (hopefully re-enabling the fastpath).
-Then line~34 releases \co{gblcnt_mutex}, and line~35 returns success.
+Then line~\lnref{release:s} releases \co{gblcnt_mutex}, and
+line~\lnref{return:gs} returns success.
+\end{lineref}
 
 \QuickQuiz{}
 	Why have both \co{add_count()} and \co{sub_count()} in
@@ -1599,61 +1551,23 @@ Then line~34 releases \co{gblcnt_mutex}, and line~35 returns success.
 	of structures in use!
 } \QuickQuizEnd
 
-Lines~38-50 show \co{read_count()}, which returns the aggregate value
+\begin{lineref}[ln:count:count_lim:add_sub_read:read]
+Lines~\lnref{b}-\lnref{e} show \co{read_count()},
+which returns the aggregate value
 of the counter.
-It acquires \co{gblcnt_mutex} on line~43 and releases it on line~48,
+It acquires \co{gblcnt_mutex} on line~\lnref{acquire}
+and releases it on line~\lnref{release},
 excluding global operations from \co{add_count()} and \co{sub_count()},
 and, as we will see, also excluding thread creation and exit.
-Line~44 initializes local variable \co{sum} to the value of
-\co{globalcount}, and then the loop spanning lines~45-47 sums the
+Line~\lnref{initsum} initializes local variable \co{sum} to the value of
+\co{globalcount}, and then the loop spanning
+lines~\lnref{loop:b}-\lnref{loop:e} sums the
 per-thread \co{counter} variables.
-Line~49 then returns the sum.
+Line~\lnref{return} then returns the sum.
+\end{lineref}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 static void globalize_count(void)
-  2 {
-  3   globalcount += counter;
-  4   counter = 0;
-  5   globalreserve -= countermax;
-  6   countermax = 0;
-  7 }
-  8 
-  9 static void balance_count(void)
- 10 {
- 11   countermax = globalcountmax -
- 12                globalcount - globalreserve;
- 13   countermax /= num_online_threads();
- 14   globalreserve += countermax;
- 15   counter = countermax / 2;
- 16   if (counter > globalcount)
- 17     counter = globalcount;
- 18   globalcount -= counter;
- 19 }
- 20 
- 21 void count_register_thread(void)
- 22 {
- 23   int idx = smp_thread_id();
- 24 
- 25   spin_lock(&gblcnt_mutex);
- 26   counterp[idx] = &counter;
- 27   spin_unlock(&gblcnt_mutex);
- 28 }
- 29 
- 30 void count_unregister_thread(int nthreadsexpected)
- 31 {
- 32   int idx = smp_thread_id();
- 33 
- 34   spin_lock(&gblcnt_mutex);
- 35   globalize_count();
- 36   counterp[idx] = NULL;
- 37   spin_unlock(&gblcnt_mutex);
- 38 }
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/count/count_lim@utility.fcv}
 \caption{Simple Limit Counter Utility Functions}
 \label{lst:count:Simple Limit Counter Utility Functions}
 \end{listing}
@@ -1663,20 +1577,25 @@ shows a number of utility functions used by the \co{add_count()},
 \co{sub_count()}, and \co{read_count()} primitives shown in
 Listing~\ref{lst:count:Simple Limit Counter Add, Subtract, and Read}.
 
-Lines~1-7 show \co{globalize_count()}, which zeros the current thread's
+\begin{lineref}[ln:count:count_lim:utility:globalize]
+Lines~\lnref{b}-\lnref{e} show \co{globalize_count()},
+which zeros the current thread's
 per-thread counters, adjusting the global variables appropriately.
 It is important to note that this function does not change the aggregate
 value of the counter, but instead changes how the counter's current value
 is represented.
-Line~3 adds the thread's \co{counter} variable to \co{globalcount},
-and line~4 zeroes \co{counter}.
-Similarly, line~5 subtracts the per-thread \co{countermax} from
-\co{globalreserve}, and line~6 zeroes \co{countermax}.
+Line~\lnref{add} adds the thread's \co{counter} variable to \co{globalcount},
+and line~\lnref{zero} zeroes \co{counter}.
+Similarly, line~\lnref{sub} subtracts the per-thread \co{countermax} from
+\co{globalreserve}, and line~\lnref{zeromax} zeroes \co{countermax}.
 It is helpful to refer to
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
 when reading both this function and \co{balance_count()}, which is next.
+\end{lineref}
 
-Lines~9-19 show \co{balance_count()}, which is roughly speaking
+\begin{lineref}[ln:count:count_lim:utility:balance]
+Lines~\lnref{b}-\lnref{e} show \co{balance_count()},
+which is roughly speaking
 the inverse of \co{globalize_count()}.
 This function's job is to set the current thread's
 \co{countermax} variable to the largest value that avoids the risk
@@ -1690,26 +1609,31 @@ By doing this, \co{balance_count()} maximizes use of
 As with \co{globalize_count()}, \co{balance_count()} is not permitted
 to change the aggregate value of the counter.
 
-Lines~11-13 compute this thread's share of that portion of
+Lines~\lnref{share:b}-\lnref{share:e} compute this thread's share of
+that portion of
 \co{globalcountmax} that is not already covered by either
 \co{globalcount} or \co{globalreserve}, and assign the
 computed quantity to this thread's \co{countermax}.
-Line~14 makes the corresponding adjustment to \co{globalreserve}.
-Line~15 sets this thread's \co{counter} to the middle of the range
+Line~\lnref{adjreserve} makes the corresponding adjustment to \co{globalreserve}.
+Line~\lnref{middle} sets this thread's \co{counter} to the middle of the range
 from zero to \co{countermax}.
-Line~16 checks to see whether \co{globalcount} can in fact accommodate
-this value of \co{counter}, and, if not, line~17 decreases \co{counter}
+Line~\lnref{check} checks to see whether \co{globalcount} can in fact accommodate
+this value of \co{counter}, and, if not,
+line~\lnref{adjcounter} decreases \co{counter}
 accordingly.
-Finally, in either case, line~18 makes the corresponding adjustment to
+Finally, in either case,
+line~\lnref{adjglobal} makes the corresponding adjustment to
 \co{globalcount}.
+\end{lineref}
 
 \QuickQuiz{}
-	Why set \co{counter} to \co{countermax / 2} in line~15 of
+	Why set \co{counter} to \co{countermax / 2} in
+	line~\ref{ln:count:count_lim:utility:balance:middle} of
 	Listing~\ref{lst:count:Simple Limit Counter Utility Functions}?
 	Wouldn't it be simpler to just take \co{countermax} counts?
 \QuickQuizAnswer{
 	First, it really is reserving \co{countermax} counts
-	(see line~14), however,
+	(see line~\ref{ln:count:count_lim:utility:balance:adjreserve}), however,
 	it adjusts so that only half of these are actually in use
 	by the thread at the moment.
 	This allows the thread to carry out at least \co{countermax / 2}
@@ -1789,19 +1713,27 @@ thread~0 can once again increment the counter locally.
 	what it does.
 } \QuickQuizEnd
 
-Lines~21-28 show \co{count_register_thread()}, which sets up state for
+\begin{lineref}[ln:count:count_lim:utility:register]
+Lines~\lnref{b}-\lnref{e} show \co{count_register_thread()},
+which sets up state for
 newly created threads.
 This function simply installs
 a pointer to the newly created thread's \co{counter} variable into
 the corresponding entry of the \co{counterp[]} array under the protection
 of \co{gblcnt_mutex}.
+\end{lineref}
 
-Finally, lines~30-38 show \co{count_unregister_thread()}, which tears down
+\begin{lineref}[ln:count:count_lim:utility:unregister]
+Finally, lines~\lnref{b}-\lnref{e} show \co{count_unregister_thread()},
+which tears down
 state for a soon-to-be-exiting thread.
-Line~34 acquires \co{gblcnt_mutex} and line~37 releases it.
-Line~35 invokes \co{globalize_count()} to clear out this thread's
-counter state, and line~36 clears this thread's entry in the
+Line~\lnref{acquire} acquires \co{gblcnt_mutex} and
+line~\lnref{release} releases it.
+Line~\lnref{globalize} invokes \co{globalize_count()}
+to clear out this thread's
+counter state, and line~\lnref{clear} clears this thread's entry in the
 \co{counterp[]} array.
+\end{lineref}
 
 \subsection{Simple Limit Counter Discussion}
 \label{sec:count:Simple Limit Counter Discussion}
-- 
2.7.4

