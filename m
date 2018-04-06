Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vTCitO6ZkJv3PTE7Gcj+PZ1BHLxmnGV1rUE5Tdg46+U=;
 b=R4V9Tjy5dfJfZNj8/ysOINYIeEoIC8nWZ7UjjSmQA+Co63SMXl7nHElP7JxGl99m9l
 TFemhlc/gecbDtTunz2Q2NgTSl5OHJ4YRKPBttwyQ/hZvejEbjOM/OYnDd4ZdlCm1Ydb
 1x3oY8R4E7gokNggy0B9pkNM+sIKyZzii8I6m5lJ7AHvl7n9n0dXjxVGu7jQ6LSHVHZE
 PBr95t6r1Cta3wSU9Q6R1evwU0X+PXoilaBbQ7IoMCyVPGwnJZvS1Podad4rRhLSVgP/
 /KrKx6eVjbBLsLgWh8Na7pJGLEraPfxouXa5aHWAnJpogKxJ9XqRj9j/8MBccZ09Re0d
 i8Zg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] count: Add unbreakable spaces for line numbers
Date: Fri,  6 Apr 2018 09:31:05 +0900
Message-Id: <20180406003105.7332-2-sj38.park@gmail.com>
In-Reply-To: <20180406003105.7332-1-sj38.park@gmail.com>
References: <20180406003105.7332-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 count/count.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index cf79753..c02e2c7 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1576,7 +1576,7 @@ Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
 which clears the thread-local variables, adjusting the global variables
 as needed, thus simplifying global processing.
 (But don't take \emph{my} word for it, try coding it yourself!)
-Lines~9 and 10 check to see if addition of \co{delta} can be accommodated,
+Lines~9 and~10 check to see if addition of \co{delta} can be accommodated,
 with the meaning of the expression preceding the less-than sign shown in
 Figure~\ref{fig:count:Simple Limit Counter Variable Relationships}
 as the difference in height of the two red (leftmost) bars.
@@ -1967,7 +1967,7 @@ Similarly,
 Listing~\ref{lst:count:Approximate Limit Counter Balancing}
 is identical to the \co{balance_count()} function in
 Listing~\ref{lst:count:Simple Limit Counter Utility Functions},
-with the addition of lines~6 and 7, which enforce the
+with the addition of lines~6 and~7, which enforce the
 \co{MAX_COUNTERMAX} limit on the per-thread \co{countermax} variable.

 \subsection{Approximate Limit Counter Discussion}
@@ -2292,7 +2292,7 @@ execution continues in the loop at line~9.
 Lines~16-31 of
 Listing~\ref{lst:count:Atomic Limit Counter Add and Subtract}
 show \co{add_count()}'s slowpath, which is protected by \co{gblcnt_mutex},
-which is acquired on line~17 and released on lines~24 and 30.
+which is acquired on line~17 and released on lines~24 and~30.
 Line~18 invokes \co{globalize_count()}, which moves this thread's
 state to the global counters.
 Lines~19-20 check whether the \co{delta} value can be accommodated by
@@ -2709,7 +2709,7 @@ implementation.
 Lines~1-7 define the states and values for the per-thread theft state machine
 described in the preceding section.
 Lines~8-17 are similar to earlier implementations, with the addition of
-lines~14 and 15 to allow remote access to a thread's \co{countermax}
+lines~14 and~15 to allow remote access to a thread's \co{countermax}
 and \co{theft} variables, respectively.

 \begin{listing}[tbp]
@@ -2793,7 +2793,7 @@ Lines~1-7 shows \co{globalize_count()}, which is identical to earlier
 implementations.
 Lines~9-19 shows \co{flush_local_count_sig()}, which is the signal
 handler used in the theft process.
-Lines~11 and 12 check to see if the \co{theft} state is REQ, and, if not
+Lines~11 and~12 check to see if the \co{theft} state is REQ, and, if not
 returns without change.
 Line~13 executes a memory barrier to ensure that the sampling of the
 theft variable happens before any change to that variable.
@@ -2809,7 +2809,7 @@ state to READY.
 	\co{theft} per-thread variable?
 \QuickQuizAnswer{
 	The first one (on line~11) can be argued to be unnecessary.
-	The last two (lines~14 and 16) are important.
+	The last two (lines~14 and~16) are important.
 	If these are removed, the compiler would be within its rights
 	to rewrite lines~14-17 as follows:

@@ -3005,7 +3005,7 @@ set the \co{theft} state to ACK rather than READY, allowing this
 fastpath to complete properly.
 Line~6 prevents the compiler from reordering any of the fastpath body
 to precede the setting of \co{counting}.
-Lines~7 and 8 check to see if the per-thread data can accommodate
+Lines~7 and~8 check to see if the per-thread data can accommodate
 the \co{add_count()} and if there is no ongoing theft in progress,
 and if so line~9 does the fastpath addition and line~10 notes that
 the fastpath was taken.
@@ -3221,7 +3221,7 @@ Code for doing I/O might be as follows:
 \end{minipage}
 \vspace{5pt}

-Line~1 read-acquires the lock, and either line~3 or 7 releases it.
+Line~1 read-acquires the lock, and either line~3 or~7 releases it.
 Line~2 checks to see if the device is being removed, and, if so,
 line~3 releases the lock and line~4 cancels the I/O, or takes whatever
 action is appropriate given that the device is to be removed.
-- 
2.10.0

