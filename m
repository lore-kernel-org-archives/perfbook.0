Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eybCe06TNMtHRWwgF0OBHD9GYEFqX+ZiG3/gO8I2fVU=;
        b=CZ+WtWBVubujbjlgO205TL0nRc/Ltjygr2ZIw/HHCYNq05K99DdywmGSFvdngcHINl
         +a5ZcsIXyGpOFeCxf6fBJ7o6xLpglBqd73CawybqZxuvqc2iC8pZchfa0f3GW1Zyy+TL
         Zo4N+489Y9XthIMHsuAzknb5nj3peKExs68fmu/fgy3Lamz77MQsCqExdU3D1plDdwq+
         anDWxmpHGp7mHSTZ0bm4JlyUgExd+d16toTxp7vz2VyKQMP9vzCA7x2vR0qq9naV15QV
         /bmHCu9tPkAX5FTs8KxGAdFR1deRDtkqem29FTJsX0GUj4/mPOHvq/J2yvKrN3xrxU6C
         sifg==
Subject: [PATCH 2/4] count: Restore 'fig:count:Atomic Increment Scalability on
 Nehalem'
References: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <79909b43-4c5f-2147-ffc1-032e4d89bb54@gmail.com>
Date: Wed, 5 Dec 2018 00:30:03 +0900
MIME-Version: 1.0
In-Reply-To: <b5e1d894-aed2-0171-7cbc-12a46d67bfb6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ae18c92aaee6e3212df302294131eca14a4bba4e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Dec 2018 23:40:20 +0900
Subject: [PATCH 2/4] count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'

Current "fig:count:Atomic Increment Scalability on Kaby Lake" has
wrong dashed graph of ideal case. Restore old plot of Nehalem
for the moment.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex     | 14 +++++++-------
 defer/rcuintro.tex  |  2 +-
 locking/locking.tex |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index c465634..6fd54b5 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -248,9 +248,9 @@ accuracies far greater than 50\,\% are almost always necessary.
 
 \begin{figure}[tb]
 \centering
-\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic}}
-\caption{Atomic Increment Scalability on Kaby Lake}
-\label{fig:count:Atomic Increment Scalability on Kaby Lake}
+\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem}}
+\caption{Atomic Increment Scalability on Nehalem}
+\label{fig:count:Atomic Increment Scalability on Nehalem}
 \end{figure}
 
 The straightforward way to count accurately is to use atomic operations,
@@ -281,7 +281,7 @@ This poor performance should not be a surprise, given the discussion in
 Chapter~\ref{chp:Hardware and its Habits},
 nor should it be a surprise that the performance of atomic increment
 gets slower as the number of CPUs and threads increase, as shown in
-Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}.
+Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}.
 In this figure, the horizontal dashed line resting on the x~axis
 is the ideal performance that would be achieved
 by a perfectly scalable algorithm: with such an algorithm, a given
@@ -350,7 +350,7 @@ global variable, the cache line containing that variable must
 circulate among all the CPUs, as shown by the red arrows.
 Such circulation will take significant time, resulting in
 the poor performance seen in
-Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake},
+Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem},
 which might be thought of as shown in
 Figure~\ref{fig:count:Waiting to Count}.
 
@@ -2870,7 +2870,7 @@ courtesy of eventual consistency.
 	``Use the right tool for the job.''
 
 	As can be seen from
-	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake},
+	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem},
 	single-variable atomic increment need not apply for any job
 	involving heavy use of parallel updates.
 	In contrast, the algorithms shown in
@@ -3156,7 +3156,7 @@ Summarizing the summary:
 \item	Different levels of performance and scalability will affect
 	algorithm and data-structure design, as do a large number of
 	other factors.
-	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
+	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
 	illustrates this point:  Atomic increment might be completely
 	acceptable for a two-CPU system, but be completely inadequate for an
 	eight-CPU system.
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 3259a19..b93136d 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -76,7 +76,7 @@ the figure.
 But how can we tell when the readers are finished?
 
 It is tempting to consider a reference-counting scheme, but
-Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
+Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
 in
 Chapter~\ref{chp:Counting}
 shows that this can also result in long delays, just as can
diff --git a/locking/locking.tex b/locking/locking.tex
index 874fb3b..ce99007 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1534,7 +1534,7 @@ Either way, line~\lnref{rel2} releases the root \co{rcu_node} structure's
 	but only for relatively small numbers of CPUs.
 	To see why it is problematic in systems with many hundreds of
 	CPUs, look at
-	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
+	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
 	and extrapolate the delay from eight to 1,000 CPUs.
 } \QuickQuizEnd
 
-- 
2.7.4


