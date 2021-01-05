Return-Path: <SRS0=HPzZ=GI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/A4GSxHAzr5usQZ0L4R73db8IDMj62IQIPepcJv0d+0=;
        b=Qpcwzmh2FCEXQHrJpqTt9t1UlvYaXXGMedOjH/AifWfVq6Yd7ZS+xCwI5tf8ea1VXn
         w0G5fH+GiOnLgCrrIax6OaYUxrnT0Xib+t71Q0rMRtZeSSjkbn/o3RwruLER1zkxiwIS
         hTnadSswLFdkbxIBLgVJ/iwJ+jX2fXDuuWW+A7dhAjnkAsFNEpQ7BgESRRHM3+0qqGGg
         u6Z7jxaL7y+OubqPZlefGP4M6hQ4rfw7Fl769udqxPSVMXaqcUGS7mx53IdLVCNdg9LB
         3Ugc5yj2xCZpwgcglpT+L2n/4GxQFR4TG278midJFy/tra+Jh1y45qIjeZTuWOAwc3xc
         0X3w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs
Message-ID: <6e41a126-f08e-5ad2-3667-416cea540627@gmail.com>
Date: Tue, 5 Jan 2021 09:23:11 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e98f36b3a91d406c2375863dc003727bc8153f4f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 4 Jan 2021 21:14:10 +0900
Subject: [PATCH -perfbook] defer/rcuexercises: Annotate essential QQs

Quick Quizzes in this section should be presented in "nq" builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuexercises.tex | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/defer/rcuexercises.tex b/defer/rcuexercises.tex
index 9438c9e5..476819a9 100644
--- a/defer/rcuexercises.tex
+++ b/defer/rcuexercises.tex
@@ -13,8 +13,7 @@ The \co{rcu_read_lock()}, \co{rcu_read_unlock()}, \co{rcu_dereference()},
 \co{rcu_assign_pointer()}, and \co{synchronize_rcu()} primitives should
 suffice for most of these exercises.
 
-\QuickQuizSeries{%
-\QuickQuizB{
+\EQuickQuiz{
 	The statistical-counter implementation shown in
 	Listing~\ref{lst:count:Per-Thread Statistical Counters}
 	(\path{count_end.c})
@@ -25,7 +24,7 @@ suffice for most of these exercises.
 	(Keep in mind that \co{read_count()}'s scalability will
 	necessarily be limited by its need to scan all threads'
 	counters.)
-}\QuickQuizAnswerB{
+}\EQuickQuizAnswer{
 	Hint: place the global variable \co{finalcount} and the
 	array \co{counterp[]} into a single RCU-protected struct.
 	At initialization time, this structure would be allocated
@@ -59,9 +58,9 @@ suffice for most of these exercises.
 	on
 	page~\pageref{sec:together:RCU and Per-Thread-Variable-Based Statistical Counters}
 	for more details.
-}\QuickQuizEndB
-%
-\QuickQuizE{
+}\EQuickQuizEnd
+
+\EQuickQuiz{
 	Section~\ref{sec:count:Applying Exact Limit Counters}
 	showed a fanciful pair of code fragments that dealt with counting
 	I/O accesses to removable devices.
@@ -73,7 +72,7 @@ suffice for most of these exercises.
 	(Keep in mind that the performance of the common-case first
 	code fragment that does I/O accesses is much more important
 	than that of the device-removal code fragment.)
-}\QuickQuizAnswerE{
+}\EQuickQuizAnswer{
 	Hint: replace the read-acquisitions of the reader-writer lock
 	with RCU read-side critical sections, then adjust the
 	device-removal code fragment to suit.
@@ -83,5 +82,4 @@ suffice for most of these exercises.
 	on
 	Page~\pageref{sec:together:RCU and Counters for Removable I/O Devices}
 	for one solution to this problem.
-}\QuickQuizEndE
-}
+}\EQuickQuizEnd
-- 
2.17.1

