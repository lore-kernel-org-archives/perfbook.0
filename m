Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMLqG (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 13 Aug 2022 07:46:06 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C761C931
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:46:04 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c20so2532804qtw.8
        for <perfbook@vger.kernel.org>; Sat, 13 Aug 2022 04:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=TKswuW9RleoXwVbx4nR7s9SEBsmUZJ4ttZd+Y704prM=;
        b=Pflim35hmfgUaaE6BjGXJvtdMyb6bjr4SX++Tkn4PM2OebuqbrXudJ0ESBWYdKVdtq
         HrfjS4EvqUCapL54WMBvEjyxK4LrCQH37xvxBQE5gIeuB0psOS/0tFf2Rtrrn4ldMWEP
         /anJvXdjWHdHAiEb2elngXZcQlIVxOsBlvdPVqRvAAAzTj3CHLTUUh6U2A5z7Y2rliuQ
         vF6vN6HR6jibJjB9glzAME0Fpza8JELjZ8zLaQ2z5O7cFyaOh+LPuA52/7vWowBAYohM
         /VhABeBZK0GmdtLIIuwPdYfgu/TeFclwnuwl4uPp78qGh/7moLHsZC7SKP0WP1E5taRN
         JsYA==
From: Elad Lahav <e2lahav@gmail.com>
Subject: [PATCH] count: Switch from GCC to C11 thread-local storage
Date: Sat, 13 Aug 2022 07:45:59 -0400
Message-Id: <20220813114559.2082323-1-e2lahav@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: Elad Lahav <e2lahav@gmail.com>

Signed-off-by: Elad Lahav <e2lahav@gmail.com>
---
 CodeSamples/count/count_end.c | 12 ++++++------
 count/count.tex               |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

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
index 523789e2..173b964c 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -721,8 +721,8 @@ This is the topic of the next section.
 \subsection{Per-Thread-Variable-Based Implementation}
 \label{sec:count:Per-Thread-Variable-Based Implementation}
 
-\GCC\ provides an \apig{__thread} storage class that provides
-per-thread storage.
+The C language, since C11, features a \apig{_Thread_local} storage class that
+provides per-thread storage.
 This can be used as shown in
 \cref{lst:count:Per-Thread Statistical Counters} (\path{count_end.c})
 to implement
-- 
2.25.1

