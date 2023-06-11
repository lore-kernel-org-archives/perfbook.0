Return-Path: <SRS0=HWqj=B7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686525679; x=1689117679;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpeHv2kue+h+k3pIv/djyImO6z37fcIvw5az0A7YpTI=;
        b=UYo8LBHyn3hsZRSsH0LnyLIZkg/p+y1vLamgr7PzZxIhR/q99RmBGF5/6/o29Sb/lP
         hipyXOtC1waC2ns5/AZW3z/7bNcQ89VWk04R2OSGUDWOM+kYz5eeI6A8bbFn0y2Oyq6O
         e2jqaHTJuvyjyO90jB6chz8MHS1PgV+5ETjt2oyY2WyKYPeBhn3GJ4WA3ypsfV2KnHi1
         U8e6on3tBwn1On5BlfdAY7u1yR5Ldq2fK/tRBJ52msDfqkKVHOG3SADoeDt8almfIn9k
         pEw6tYVfMu5OpxIx1QGKpzrZAXnYWLwedLsiQW24YWw1msctXPqM2CtvVgbixxWehY0H
         lb0A==
Message-ID: <d6f99279-a618-7733-7f41-684bc33d624a@gmail.com>
Date: Mon, 12 Jun 2023 08:21:15 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuapi: Embed Listing E.3 in Table E.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In 2c layout, Table E.3 goes to the next page of Listing E.3.
This is partly due to the table* environment, but as both of them
are floating, there is no sure way for them to be on the same page.

Embed the listing at the bottom of the table so that they end up
in the same page and adjust the wording in the text.

For 2c layout, using the table* environment causes the snippet to
look unnecessarily wide. Instead, shrink the table by using the
\tcresizewidth macro and use the normal table environment.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Link: https://www.spinics.net/lists/perfbook/msg04070.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Paul,

In 2c layout, the table might become too small.
Does it look acceptable?

        Thanks, Akira
--
 defer/rcuapi.tex | 58 ++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 31 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index eea7259776d1..34791918588d 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -337,40 +337,15 @@ The \apik{rcu_barrier()} primitive does this job.
 	critical sections to complete, \co{rcu_barrier()} instead waits
 	for callbacks from prior calls to \co{call_rcu()} to be invoked.
 
-\begin{listing}
-\begin{fcvlabel}[ln:defer:synchonize-rcu vs rcu-barrier]
-\begin{VerbatimL}[commandchars=\\\@\$]
-	do_something_1();			\lnlbl@ds1$
-	rcu_read_lock();			\lnlbl@rrl$
-	do_something_2();			\lnlbl@ds2$
-	call_rcu(&p->rh, f);			\lnlbl@cr$
-	do_something_3();			\lnlbl@ds3$
-	rcu_read_unlock();			\lnlbl@rrul$
-	do_something_4();			\lnlbl@ds4$
-	// f(&p->rh) invoked			\lnlbl@cb$
-	do_something_5();			\lnlbl@ds5$
-\end{VerbatimL}
-\end{fcvlabel}
-\caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
-\label{lst:defer:synchronize-rcu vs. rcu-barrier}
-\end{listing}
-
-	This distinction is illustrated by
-	\cref{lst:defer:synchronize-rcu vs. rcu-barrier}, which
-	shows code being executed by a given CPU\@.
-	For simplicity, assume that no other CPU is executing
-	\co{rcu_read_lock()}, \co{rcu_read_unlock()}, or
-	\co{call_rcu()}.
-
-
-\begin{table*}
+\begin{table}
 \renewcommand*{\arraystretch}{1.2}
 \centering
 \small
+\tcresizewidth{
 \begin{fcvref}[ln:defer:synchonize-rcu vs rcu-barrier]
 \begin{tabular}{lll}
 \toprule
-            & \multicolumn{2}{c}{Must Wait Until (in \cref{lst:defer:synchronize-rcu vs. rcu-barrier}):} \\
+            & \multicolumn{2}{c}{Must Wait Until (in the snippet):} \\
 \cmidrule{2-3}
 \multicolumn{1}{c}{Invoked at:} & \multicolumn{1}{c}{\tco{synchronize_rcu()}}
 					& \multicolumn{1}{c}{\tco{rcu_barrier()}} \\
@@ -384,12 +359,33 @@ The \apik{rcu_barrier()} primitive does this job.
 \bottomrule
 \end{tabular}
 \end{fcvref}
+}
+
+\begin{fcvlabel}[ln:defer:synchonize-rcu vs rcu-barrier]
+\begin{VerbatimN}[commandchars=\\\@\$]
+	do_something_1();			\lnlbl@ds1$
+	rcu_read_lock();			\lnlbl@rrl$
+	do_something_2();			\lnlbl@ds2$
+	call_rcu(&p->rh, f);			\lnlbl@cr$
+	do_something_3();			\lnlbl@ds3$
+	rcu_read_unlock();			\lnlbl@rrul$
+	do_something_4();			\lnlbl@ds4$
+	// f(&p->rh) invoked			\lnlbl@cb$
+	do_something_5();			\lnlbl@ds5$
+\end{VerbatimN}
+\end{fcvlabel}
 \caption{\tco{synchronize_rcu()} vs. \tco{rcu_barrier()}}
 \label{tab:defer:synchonize-rcu vs rcu-barrier}
-\end{table*}
+\end{table}
+
+	This distinction is illustrated by
+	\cref{tab:defer:synchonize-rcu vs rcu-barrier}, in which
+	the snippet at the bottom shows code being executed by a given CPU\@.
+	For simplicity, assume that no other CPU is executing
+	\co{rcu_read_lock()}, \co{rcu_read_unlock()}, or
+	\co{call_rcu()}.
 
-	\Cref{tab:defer:synchonize-rcu vs rcu-barrier}
-	shows how long each primitive must wait if invoked
+	The table shows how long each primitive must wait if invoked
 	concurrently with each of the \co{do_something_*()}
 	functions, with empty cells indicating that no
 	waiting is necessary.
-- 
2.25.1


