Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6fD3ZAiqft11HrKFnjDHeBxvZhEbZAbcAeWO8r2d44s=;
 b=LrxaniStTPeeo7mV0ocMWWax91Pei1hYeKWqbmyHdGe03jAbP0lF/trG8q7KVTbufi
 dHVd/d6wO0gclyH4WMlci5tS8UGeQbFoB4kl5JLFjbT4NbLL/nCPTDCeS7bQtH5MoX9W
 eXFjd28T00HU3evR5a5a0MPSDwg9RGc4IgD49IWGzrF8ji4+lneXzTAHMB7+JEM/qGwm
 xER7f7jflBEio7OxFZT6p8Hkee+4RlTWQLc9l7QXT5k2D0+W5POSKxlDGhuPeW47kvKX
 K8VuylhBJd9uAye/icRd/8IgoGIHRDJXccrZNA4Hmjq2Z2Z0arwwigLjmiTFyUvutjc8
 XSNw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/4] defer: Insert missing tildes
Date: Fri,  1 Jul 2016 09:43:52 +0900
Message-Id: <1467333834-17050-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
References: <1467333834-17050-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 defer/rcufundamental.tex |  2 +-
 defer/seqlock.tex        | 10 +++++-----
 defer/toyrcu.tex         | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 76f9aee..8c6e0c5 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -734,7 +734,7 @@ Figure~\ref{fig:defer:RCU Replacement in Linked List}.
 As far as the readers are concerned, we are back to having a single version
 of the list, but with the new element in place of the old.

-After the \co{kfree()} on line 7 completes, the list will
+After the \co{kfree()} on line~7 completes, the list will
 appear as shown on the final row of
 Figure~\ref{fig:defer:RCU Replacement in Linked List}.

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index c9f34f7..f56659f 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -287,7 +287,7 @@ increment of the sequence number on line~44, then releases the lock.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Why isn't \co{seq} on line 2 of
+	Why isn't \co{seq} on line~2 of
 	Figure~\ref{fig:defer:Sequence-Locking Implementation}
 	\co{unsigned} rather than \co{unsigned long}?
 	After all, if \co{unsigned} is good enough for the Linux
@@ -297,17 +297,17 @@ increment of the sequence number on line~44, then releases the lock.
 	The Linux kernel has a number of special attributes that allow
 	it to ignore the following sequence of events:
 	\begin{enumerate}
-	\item	Thread 0 executes \co{read_seqbegin()}, picking up
+	\item	Thread~0 executes \co{read_seqbegin()}, picking up
 		\co{->seq} in line~17, noting that the value is even,
 		and thus returning to the caller.
-	\item	Thread 0 starts executing its read-side critical section,
+	\item	Thread~0 starts executing its read-side critical section,
 		but is then preempted for a long time.
 	\item	Other threads repeatedly invoke \co{write_seqlock()} and
 		\co{write_sequnlock()}, until the value of \co{->seq}
 		overflows back to the value that Thread~0 fetched.
-	\item	Thread 0 resumes execution, completing its read-side
+	\item	Thread~0 resumes execution, completing its read-side
 		critical section with inconsistent data.
-	\item	Thread 0 invokes \co{read_seqretry()}, which incorrectly
+	\item	Thread~0 invokes \co{read_seqretry()}, which incorrectly
 		concludes that Thread~0 has seen a consistent view of
 		the data protected by the sequence lock.
 	\end{enumerate}
diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index 3f098c6..2177e6d 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -1578,9 +1578,9 @@ overhead.
 		greater than that of the global \co{rcu_gp_ctr}.
 	\item	Thread~0 acquires a reference to RCU-protected data
 		element~A.
-	\item	Thread 1 now removes the data element~A that thread~0
+	\item	Thread~1 now removes the data element~A that thread~0
 		just acquired a reference to.
-	\item	Thread 1 invokes \co{synchronize_rcu()}, which
+	\item	Thread~1 invokes \co{synchronize_rcu()}, which
 		increments the global \co{rcu_gp_ctr} by
 		\co{RCU_GP_CTR_BOTTOM_BIT}.
 		It then checks all of the per-thread \co{rcu_reader_gp}
@@ -1589,7 +1589,7 @@ overhead.
 		\co{synchronize_rcu()}, so thread~1 does not wait
 		for thread~0 to complete its RCU read-side critical
 		section.
-	\item	Thread 1 then frees up data element~A, which thread~0
+	\item	Thread~1 then frees up data element~A, which thread~0
 		is still referencing.
 	\end{enumerate}

@@ -1707,9 +1707,9 @@ using the aforementioned quiescent states.
 Each of these quiescent states contains a call to
 \co{rcu_quiescent_state()}, which is shown from lines~9-15 in the figure.
 Threads entering extended quiescent states (for example, when blocking)
-may instead call \co{rcu_thread_offline()} (lines 17-23) when entering
+may instead call \co{rcu_thread_offline()} (lines~17-23) when entering
 an extended quiescent state and then call
-\co{rcu_thread_online()} (lines 25-28) when leaving it.
+\co{rcu_thread_online()} (lines~25-28) when leaving it.
 As such, \co{rcu_thread_online()} is analogous to \co{rcu_read_lock()}
 and \co{rcu_thread_offline()} is analogous to \co{rcu_read_unlock()}.
 In addition, \co{rcu_quiescent_state()} can be thought of as a
-- 
1.9.1

