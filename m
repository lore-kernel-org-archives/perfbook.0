Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cwAF7sbTcjR8d46k6X+KE4qtAY+cZvuSXUx9Q+guJKE=;
        b=GZHeFTlaC/mez9uq40OetJ3zwwUwKJrw1FjbLfgmvZBjiBbWYFe2lvYVGFv1DUJfBL
         lY2dQRLx9pVkPEBajKBfKP5XRf7QO0lnLNMhfnocKeWBzCK9B0JPOpO6vmRIz3hrrCwc
         jebMfKoeWnItsbuvfqaCXxLRt2+fYM7uMqIFB8MX8ZsQFzipH0mKPv925FNfUdWB7wls
         zfYRsk+5X85n0mz9mALUE7jBs1+WCqfJka52+pIsUqe3muMtzY1wQwGqOXYOyzL/17Ly
         tksP9RfUdMCfH6O8KUfTHCfNU0XttkGARFKQrjfnQ3iHDcl0V+4m+6FX9a7TP1PBa/Qn
         tTNA==
Subject: [PATCH 6/7] toyrcu: Extract Listing B.13 from rcu.h
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <84ebfab3-1c39-295e-19b4-86063f230018@gmail.com>
Date: Sun, 21 Jul 2019 09:12:04 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f37685cb3821daf0d9ee55a538ec462e5de0a6a8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 4 Jun 2019 00:35:02 +0900
Subject: [PATCH 6/7] toyrcu: Extract Listing B.13 from rcu.h

Commit 686f3f3b721c ("rcu: Use READ_ONCE() and WRITE_ONCE() for
shared variable rcu_gp_ctr") updated B.14 to reflect the changes
in rcu.[hc]. For consistency, extract Listing B.13 from rcu.h.

Cc: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/rcu.h    |  2 ++
 appendix/toyrcu/toyrcu.tex | 11 +----------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/CodeSamples/defer/rcu.h b/CodeSamples/defer/rcu.h
index 3641c33a..b3c3e2c4 100644
--- a/CodeSamples/defer/rcu.h
+++ b/CodeSamples/defer/rcu.h
@@ -20,10 +20,12 @@
 
 #include "rcu_pointer.h"
 
+//\begin{snippet}[labelbase=ln:defer:rcu:define,commandchars=\%\@\$]
 DEFINE_SPINLOCK(rcu_gp_lock);
 long rcu_gp_ctr = 0;	/* always even, +=2 at start of each grace period. */
 DEFINE_PER_THREAD(long, rcu_reader_gp);
 DEFINE_PER_THREAD(long, rcu_reader_gp_snap);
+//\end{snippet}
 
 static inline void rcu_init(void)
 {
diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 81f222c6..f6ce2bee 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1185,16 +1185,7 @@ thread-local accesses to one, as is done in the next section.
 \label{sec:app:toyrcu:RCU Based on Free-Running Counter}
 
 \begin{listing}[tbp]
-{ \scriptsize
-\begin{verbbox}
-  1 DEFINE_SPINLOCK(rcu_gp_lock);
-  2 long rcu_gp_ctr = 0;
-  3 DEFINE_PER_THREAD(long, rcu_reader_gp);
-  4 DEFINE_PER_THREAD(long, rcu_reader_gp_snap);
-\end{verbbox}
-}
-\centering
-\theverbbox
+\input{CodeSamples/defer/rcu@define.fcv}
 \caption{Data for Free-Running Counter Using RCU}
 \label{lst:app:toyrcu:Data for Free-Running Counter Using RCU}
 \end{listing}
-- 
2.17.1


