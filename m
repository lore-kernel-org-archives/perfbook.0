Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mOAomiy/3DMl34Pc0NNJu/Yv/DKn6Q1qWDx5T17h/yo=;
        b=RJyP5BQdJvnUWAGKx1b8OGJJeyLjO5xvYk8idr/midIAOcyLRguSuCpHsTMF7vjwKZ
         71OohWoe9ESFVmozbJBygeEahQupJmBQ9UK7am7i6q8wsjPlU86BFs9F3DCe4+WBRePJ
         zQIX91wAmTpJzlXQgWVZXstiLx9yY4z4LjkyU2HMeNlV9nk+T8QXql1R8QraA50Mpn/1
         rdYMzUsF9clLPyhxCfVLCbQ1SVqy+y2x7G39Pb9nPKczs9Vlj5o9lOA74Kh1pQsyS6yJ
         oY8uK5BNpVQ+4n45hsfV6pbAtUP6SgOQ9iTbBqOXvpeiGo/CFLPYyJTvfiEYJGMctIqW
         /Yaw==
Subject: [PATCH 1/2] defer/rcuapi: Employ new scheme for snippets in Answers
 to Quick Quizzes
References: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8fc2a323-d878-ee17-2267-1f578c3412ec@gmail.com>
Date: Wed, 19 Dec 2018 00:03:16 +0900
MIME-Version: 1.0
In-Reply-To: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 290135eea4ff9f839c48c1ac0dbe4c7adf047e3f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 15 Dec 2018 22:20:08 +0900
Subject: [PATCH 1/2] defer/rcuapi: Employ new scheme for snippets in Answers to Quick Quizzes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 51 +++++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index a50dcbe..0b4c812 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -370,22 +370,17 @@ returns a value that must be passed into the corresponding
 	could still result in deadlock.
 
 \begin{listing}[htbp]
-\scriptsize
-{
-\begin{verbbox}
-  1 idx = srcu_read_lock(&ssa);
-  2 synchronize_srcu(&ssb);
-  3 srcu_read_unlock(&ssa, idx);
-  4
-  5 /* . . . */
-  6
-  7 idx = srcu_read_lock(&ssb);
-  8 synchronize_srcu(&ssa);
-  9 srcu_read_unlock(&ssb, idx);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+idx = srcu_read_lock(&ssa);
+synchronize_srcu(&ssb);
+srcu_read_unlock(&ssa, idx);
+
+/* . . . */
+
+idx = srcu_read_lock(&ssb);
+synchronize_srcu(&ssa);
+srcu_read_unlock(&ssb, idx);
+\end{VerbatimL}
 \caption{Multistage SRCU Deadlocks}
 \label{lst:defer:Multistage SRCU Deadlocks}
 \end{listing}
@@ -622,20 +617,16 @@ dereferences are protected by RCU.
 	Listing~\ref{lst:defer:Diverse RCU Read-Side Nesting}.
 
 \begin{listing}[htbp]
-{ \scriptsize
-\begin{verbbox}
-  1 rcu_read_lock();
-  2 preempt_disable();
-  3 p = rcu_dereference(global_pointer);
-  4
-  5 /* . . . */
-  6
-  7 preempt_enable();
-  8 rcu_read_unlock();
-\end{verbbox}
-}
-\centering
-\theverbbox
+\begin{VerbatimL}
+rcu_read_lock();
+preempt_disable();
+p = rcu_dereference(global_pointer);
+
+/* . . . */
+
+preempt_enable();
+rcu_read_unlock();
+\end{VerbatimL}
 \caption{Diverse RCU Read-Side Nesting}
 \label{lst:defer:Diverse RCU Read-Side Nesting}
 \end{listing}
-- 
2.7.4


