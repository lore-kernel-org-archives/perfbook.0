Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jgdbFSE0fzb3Sc/FaxRZcw3R5NvTO8gxMCcLpievlrs=;
        b=VDxQCspZuGASaqR+eVEJfeJZY2N4uQSNvjD3qp87dr2S8ex6Nc92mtBO0Ww0JYY3e0
         duuxpgck+Hfhe6kv24xHfD8ZbSAZWZJR03FFKgkOakR3UXBpkJ7cSxmotGjFpCbD4nu4
         2ZCcmE1yLnAbrRk0AISqiLz7H1YoABlwuYcYVJ/hNfwdeesf7KqtkXSzxdAiaB073Piq
         C0trfIyY4J0dumiIkr1YGDcsWEYWIKgJjYTo8pFekTTlAwmv/C0rI9YwY3RtZvIddNt7
         TqDys5YSj4vKBbZRN0anysTXszjYJtFxMLazdCU4qhjCZrT/nqlaHisFZiZdm9d2pHIT
         Hjug==
Subject: [PATCH -perfbook 1/9] Annotate mid-sentence and end-of-sentence
 periods
References: <c298d82f-dc09-6b59-2b4b-3bedd5c48cec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <080c0f21-8418-6d50-d935-ab62de45b77a@gmail.com>
Date: Wed, 28 Apr 2021 00:05:16 +0900
MIME-Version: 1.0
In-Reply-To: <c298d82f-dc09-6b59-2b4b-3bedd5c48cec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ae551669fa11abdeebd8f4b99d49dfc59866398a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Apr 2021 10:23:18 +0900
Subject: [PATCH -perfbook 1/9] Annotate mid-sentence and end-of-sentence periods

These were caught by the check script to be added in
the following updates.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 ack.tex             | 2 +-
 advsync/rt.tex      | 2 +-
 howto/howto.tex     | 2 +-
 locking/locking.tex | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/ack.tex b/ack.tex
index b8cffa37..ce64d325 100644
--- a/ack.tex
+++ b/ack.tex
@@ -126,4 +126,4 @@ organizations that keep Internet and the World Wide Web up and running,
 and this one is no exception.
 
 Portions of this material are based upon work supported by the National
-Science Foundation under Grant No. CNS-0719851.
+Science Foundation under Grant No.\@ CNS-0719851.
diff --git a/advsync/rt.tex b/advsync/rt.tex
index bb8465ff..71ab0661 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -573,7 +573,7 @@ as depicted in
 \cref{fig:advsync:Real-Time Reflexes}.
 The hard real-time reflexes, which read from sensors and control
 actuators, run real-time on a single CPU or on special-purpose hardware
-such as an FPGA.
+such as an FPGA\@.
 The non-real-time strategy and planning portion of the application runs
 on the remaining CPUs.
 Strategy and planning activities might include statistical analysis,
diff --git a/howto/howto.tex b/howto/howto.tex
index c3d0a101..0f0ba293 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -304,7 +304,7 @@ Fortunately, there are many alternatives available to you:
 	\pplsur{Victor}{Luchangco}, and \pplsur{Michael}{Spear} did
 	catch up in their second edition by adding short sections on
 	hazard pointers and on \acr{rcu}, with the latter in the guise
-	of \acr{ebr}.
+	of \acr{ebr}\@.
 	They also include a brief history of both, albeit with an
 	abbreviated history of \acr{rcu} that picks up almost a year after
 	it was accepted into the Linux kernel and more than 20~years
diff --git a/locking/locking.tex b/locking/locking.tex
index 5313f926..6bc93e49 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -713,7 +713,7 @@ outside of a signal handler without blocking signals.
 	handler without blocking signals, a signal might be handled while
 	holding this lock.
 	The corresponding signal handler might then acquire
-	Lock~B, so that Lock~B is acquired while holding Lock~A.
+	Lock~B, so that Lock~B is acquired while holding Lock~A\@.
 	Therefore, if we also acquire Lock~A while holding Lock~B,
 	we will have a deadlock cycle.
 	Note that this problem exists even if signals are blocked while
-- 
2.17.1


