Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p3m+x1Bj/HW5fscl2Xaw/sQ6F3KwBETWnMvrZQV5rW4=;
 b=Tf68NSPlljJ5ZVJiPoE/7MSrJihSu0hyv+uIfvh+1vgKqDN1atmqcb0q4cFp4bAjOR
 w0P5hhMupnQnHVq2aqsVRwECLOe0nt8WBWhbxebPyaw4l2DnYPwQc5CkdlSHgtsblClK
 6bFuzrE9mNSt1HN2by85JfQMONUXlFU+41zaeYRghLzIGisy+EAshl75zDvrmISdim/A
 o0gAti3zUSpiqYFhm7ChTxXwehZwNQBMPJegnTgicBQLNbMZLw355yjhVhVnJJEOwFSo
 PnwNNiFlH3hkcXsKZqEHnfNnpzdVLTERQy4sLyDpczj72c9KN2x5G9De0JhjGkwG2NbS
 zT4w==
From: Imre Palik <imrep.amz@gmail.com>
Subject: [PATCH 3/4] Updating count.tex with new counter code
Date: Mon, 23 Jul 2018 22:07:27 +0200
Message-Id: <1532376448-15103-4-git-send-email-imrep.amz@gmail.com>
In-Reply-To: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
References: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, "Palik, Imre" <imrep.amz@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Palik, Imre" <imrep.amz@gmail.com>

Now count.text reflects the changes made to the counter implementations, to
restrict too eager compilers.

Signed-off-by: Imre Palik <imrep.amz@gmail.com>
---
 count/count.tex | 93 +++++++++++++++++++++++++++++----------------------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 561256a..82d4a7f 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1003,41 +1003,42 @@ comes at the cost of the additional thread running \co{eventual()}.
   5 
   6 void inc_count(void)
   7 {
-  8   counter++;
-  9 }
- 10 
- 11 long read_count(void)
- 12 {
- 13   int t;
- 14   long sum;
- 15 
- 16   spin_lock(&final_mutex);
- 17   sum = finalcount;
- 18   for_each_thread(t)
- 19     if (counterp[t] != NULL)
- 20       sum += *counterp[t];
- 21   spin_unlock(&final_mutex);
- 22   return sum;
- 23 }
- 24 
- 25 void count_register_thread(void)
- 26 {
- 27   int idx = smp_thread_id();
- 28 
- 29   spin_lock(&final_mutex);
- 30   counterp[idx] = &counter;
- 31   spin_unlock(&final_mutex);
- 32 }
- 33 
- 34 void count_unregister_thread(int nthreadsexpected)
- 35 {
- 36   int idx = smp_thread_id();
- 37 
- 38   spin_lock(&final_mutex);
- 39   finalcount += counter;
- 40   counterp[idx] = NULL;
- 41   spin_unlock(&final_mutex);
- 42 }
+  8   WRITE_ONCE(counter,
+  9              READ_ONCE(counter) + 1);counter++;
+ 10 }
+ 11 
+ 12 long read_count(void)
+ 13 {
+ 14   int t;
+ 15   long sum;
+ 16 
+ 17   spin_lock(&final_mutex);
+ 18   sum = finalcount;
+ 19   for_each_thread(t)
+ 20     if (counterp[t] != NULL)
+ 21       sum += *counterp[t];
+ 22   spin_unlock(&final_mutex);
+ 23   return sum;
+ 24 }
+ 25 
+ 26 void count_register_thread(void)
+ 27 {
+ 28   int idx = smp_thread_id();
+ 29 
+ 30   spin_lock(&final_mutex);
+ 31   counterp[idx] = &counter;
+ 32   spin_unlock(&final_mutex);
+ 33 }
+ 34 
+ 35 void count_unregister_thread(int nthreadsexpected)
+ 36 {
+ 37   int idx = smp_thread_id();
+ 38 
+ 39   spin_lock(&final_mutex);
+ 40   finalcount += counter;
+ 41   counterp[idx] = NULL;
+ 42   spin_unlock(&final_mutex);
+ 43 }
 \end{verbbox}
 }
 \centering
@@ -1105,18 +1106,18 @@ value of the counter and exiting threads.
 } \QuickQuizEnd

 The \co{inc_count()} function used by updaters is quite simple, as can
-be seen on lines~6-9.
+be seen on lines~6-10.

 The \co{read_count()} function used by readers is a bit more complex.
-Line~16 acquires a lock to exclude exiting threads, and line~21 releases
+Line~17 acquires a lock to exclude exiting threads, and line~22 releases
 it.
-Line~17 initializes the sum to the count accumulated by those threads that
-have already exited, and lines~18-20 sum the counts being accumulated
+Line~18 initializes the sum to the count accumulated by those threads that
+have already exited, and lines~19-21 sum the counts being accumulated
 by threads currently running.
-Finally, line~22 returns the sum.
+Finally, line~23 returns the sum.

 \QuickQuiz{}
-	Doesn't the check for \co{NULL} on line~19 of
+	Doesn't the check for \co{NULL} on line~20 of
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}
 	add extra branch mispredictions?
 	Why not have a variable set permanently to zero, and point
@@ -1156,7 +1157,7 @@ Finally, line~22 returns the sum.
 	\co{inc_count()} fastpath.
 } \QuickQuizEnd

-Lines~25-32 show the \co{count_register_thread()} function, which
+Lines~26-33 show the \co{count_register_thread()} function, which
 must be called by each thread before its first use of this counter.
 This function simply sets up this thread's element of the \co{counterp[]}
 array to point to its per-thread \co{counter} variable.
@@ -1177,14 +1178,14 @@ array to point to its per-thread \co{counter} variable.
 	a hundred or so CPUs, there is no need to get fancy.
 } \QuickQuizEnd

-Lines~34-42 show the \co{count_unregister_thread()} function, which
+Lines~35-43 show the \co{count_unregister_thread()} function, which
 must be called prior to exit by each thread that previously called
 \co{count_register_thread()}.
-Line~38 acquires the lock, and line~41 releases it, thus excluding any
+Line~39 acquires the lock, and line~42 releases it, thus excluding any
 calls to \co{read_count()} as well as other calls to
 \co{count_unregister_thread()}.
-Line~39 adds this thread's \co{counter} to the global \co{finalcount},
-and then line~40 \co{NULL}s out its \co{counterp[]} array entry.
+Line~40 adds this thread's \co{counter} to the global \co{finalcount},
+and then line~41 \co{NULL}s out its \co{counterp[]} array entry.
 A subsequent call to \co{read_count()} will see the exiting thread's
 count in the global \co{finalcount}, and will skip the exiting thread
 when sequencing through the \co{counterp[]} array, thus obtaining
-- 
2.7.4

