Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235694AbiHQLBP (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 17 Aug 2022 07:01:15 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF21E3A48B
        for <perfbook@vger.kernel.org>; Wed, 17 Aug 2022 04:01:14 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id w28so10063186qtc.7
        for <perfbook@vger.kernel.org>; Wed, 17 Aug 2022 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=czG37+aRoyeq/e5Zlx1ILcCY0XpOjXLGcIBKXfsOKVg=;
        b=cGuxiUO7bTYtwbXsbC2j7IZPuBKXL7g55Ajsuakv9mxBUpuPqQaGTJ8ju6jdQUe1kd
         nb4nDfgTpLxAZMvdLDtBwmmffrbm8HuOnrBWrOaa1lkCTslZpct2LB6BI9mb3Vci1ZmF
         LcaxrqMhVlC1TFyZ1t/xFB5sw9oGRD6rivuljcZES/fRyg0FZEc3mRNrp0KJjs5AweLY
         lwhyMLXznzmCQzWVrpaVHFtgfjdJ3UTRz7z6yZ/MJxXmhznUBcHXdCPkMxlCgPuxm/LM
         puEN9OKZv6PZMbuqTc4Gif/LLNRw1wboJGL7Jx/lu5ECshIDaci2EOw0fuPV17xnkXOd
         iORg==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH v2] count: Switch from GCC to C11 thread-local storage
Date: Wed, 17 Aug 2022 07:00:50 -0400
Message-Id: <20220817110049.182128-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/count/count_end.c | 12 ++++++------
 count/count.tex               | 20 ++++++++++++--------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/CodeSamples/count/count_end.c b/CodeSamples/count/count_end.c
index 722ad2f7..5e7b9ee1 100644
--- a/CodeSamples/count/count_end.c
+++ b/CodeSamples/count/count_end.c
@@ -1,6 +1,6 @@
 /*
  * count_end.c: Per-thread statistical counters that provide sum at end.
- *	Uses __thread for each thread's counter.
+ *	Uses _Thread_local for each thread's counter.
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -23,17 +23,17 @@
 #include "../api.h"
 
 //\begin{snippet}[labelbase=ln:count:count_end:whole,commandchars=\\\@\$]
-unsigned long __thread counter = 0;		//\lnlbl{var:b}
+unsigned long _Thread_local counter = 0;		//\lnlbl{var:b}
 unsigned long *counterp[NR_THREADS] = { NULL };
 unsigned long finalcount = 0;
 DEFINE_SPINLOCK(final_mutex);			//\lnlbl{var:e}
 
-static __inline__ void inc_count(void)		//\lnlbl{inc:b}
+static inline void inc_count(void)		//\lnlbl{inc:b}
 {
 	WRITE_ONCE(counter, counter + 1);
 }						//\lnlbl{inc:e}
 
-static __inline__ unsigned long read_count(void)
+static inline unsigned long read_count(void)
 {
 	int t;
 	unsigned long sum;
@@ -48,7 +48,7 @@ static __inline__ unsigned long read_count(void)
 }
 
 #ifndef FCV_SNIPPET
-__inline__ void count_init(void)
+inline void count_init(void)
 {
 }
 #endif /* FCV_SNIPPET */
@@ -73,7 +73,7 @@ void count_unregister_thread(int nthreadsexpected)	//\lnlbl{unreg:b}
 }							//\lnlbl{unreg:e}
 //\end{snippet}
 
-__inline__ void count_cleanup(void)
+inline void count_cleanup(void)
 {
 }
 
diff --git a/count/count.tex b/count/count.tex
index 523789e2..775cf77e 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -490,7 +490,7 @@ thread (presumably cache aligned and padded to avoid false sharing).
 	It can, and in this toy implementation, it does.
 	But it is not that hard to come up with an alternative
 	implementation that permits an arbitrary number of threads,
-	for example, using \GCC's \co{__thread} facility,
+	for example, using C11's \co{_Thread_local} facility,
 	as shown in
 	\cref{sec:count:Per-Thread-Variable-Based Implementation}.
 }\QuickQuizEnd
@@ -721,8 +721,12 @@ This is the topic of the next section.
 \subsection{Per-Thread-Variable-Based Implementation}
 \label{sec:count:Per-Thread-Variable-Based Implementation}
 
-\GCC\ provides an \apig{__thread} storage class that provides
-per-thread storage.
+The C language, since C11, features a \apig{_Thread_local} storage class that
+provides per-thread storage.
+\footnote{\GCC\ provides its own \apig{__thread} storage class, which was used
+in previous versions of this book.
+The two methods for specifying a thread-local variable are interchangeable
+when using \GCC\@.}
 This can be used as shown in
 \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
 to implement
@@ -749,14 +753,14 @@ value of the counter and exiting threads.
 	Doesn't that explicit \co{counterp} array in
 	\cref{lst:count:Per-Thread Statistical Counters}
 	reimpose an arbitrary limit on the number of threads?
-	Why doesn't \GCC\ provide a \co{per_thread()} interface, similar
+	Why doesn't the C language provide a \co{per_thread()} interface, similar
 	to the Linux kernel's \co{per_cpu()} primitive, to allow
 	threads to more easily access each others' per-thread variables?
 }\QuickQuizAnswer{
 	Why indeed?
 
-	To be fair, \GCC\ faces some challenges that the Linux kernel
-	gets to ignore.
+	To be fair, user-mode thread-local storage faces some challenges
+	that the Linux kernel gets to ignore.
 	When a user-level thread exits, its per-thread variables all
 	disappear, which complicates the problem of per-thread-variable
 	access, particularly before the advent of user-level RCU
@@ -940,7 +944,7 @@ variables vanish when that thread exits.
 	more graceful manner.
 }\QuickQuizEnd
 
-Both the array-based and \co{__thread}-based approaches offer excellent
+Both the array-based and \co{_Thread_local}-based approaches offer excellent
 update-side performance and scalability.
 However, these benefits result in large read-side expense for large
 numbers of threads.
@@ -2961,7 +2965,7 @@ courtesy of eventual consistency.
 	work when there are more threads.
 	In addition, the last two algorithms interpose an additional
 	level of indirection because they map from integer thread ID
-	to the corresponding \co{__thread} variable.
+	to the corresponding \co{_Thread_local} variable.
 }\QuickQuizEndB
 %
 \QuickQuizE{
-- 
2.25.1

