Return-Path: <SRS0=B9ic=RF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=b3zIxeGnNQclhVeQ7zwyY8jLvRTmQ5s3EF0Qes++RNM=;
        b=l4RjQFT2jsRK52RaAuCqC10yLBRjUEMZLnne0X6rJA+FLl44fCWR8DO3qgP0LBdlIU
         KddgingXjHOTk1rktXb7gIor6lENyoWUil4p/M3ZHZ0PTY+/UPsdEQ/GWOjISff4vX8L
         9z8UpHi2QxB1qGV+Rnr0m9a1NFZS37y/8oQKx0/5mhYIX6FzXEN0cyVVgjBy5ajgdkTy
         q5R68N+iQ8fmzapgOxfaSCK2V7jqZrk4hV/7wxcneEcB+E+nKBGY6Tcqh+zf5ZdH7+ZT
         L79dz7RxDWvAf+llM5SrWDCRabOmdLL9LB24XWxmv6viLlvdiKYNQAue3N9WyuxUMnJV
         ueOg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuusage: Fix minor nits
Message-ID: <a2981f7d-d551-5fd1-7fc7-685c8059ca32@gmail.com>
Date: Mon, 20 Dec 2021 20:49:15 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

In this patch, 1st and 2nd hunks are trivial typo fixes.

3rd and 4th hunks remove "Code" and "Semantics" in paragraph titles,
which look redundant to me.

Please feel free to pick whichever hunk you'd like.

        Thanks, Akira
--
 defer/rcuusage.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 7e154fac..3fbe73be 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -273,7 +273,7 @@ the Linux kernel.
 In this example, the \co{timer_stop} function uses
 \co{synchronize_sched()} to ensure that all in-flight NMI
 notifications have completed before freeing the associated resources.
-A simplified version of this code is shown
+A simplified version of this code is shown in
 \cref{lst:defer:Using RCU to Wait for NMIs to Finish}.
 
 \begin{listing}
@@ -324,7 +324,7 @@ region of memory.
 \Clnrefrange{b}{e} define the \co{nmi_profile()} function,
 which is called from within an NMI handler.
 As such, it cannot be preempted, nor can it be interrupted by a normal
-interrupts handler, however, it is still subject to delays due to cache misses,
+interrupt handler, however, it is still subject to delays due to cache misses,
 ECC errors, and cycle stealing by other hardware threads within the same
 core.
 \Clnref{rcu_deref} gets a local pointer to the profile buffer using the
@@ -1367,7 +1367,7 @@ and \co{poll_state_synchronize_rcu()}), this situation is a major reason
 for the rule of thumb that RCU be used in read-mostly situations.
 
 \paragraph{Code:
-		 Reader-Writer Locking vs.\@ RCU Code}
+		 Reader-Writer Locking vs.\@ RCU}
 
 In the best case, the conversion from reader-writer locking to RCU
 is quite simple, as shown in
@@ -1475,7 +1475,7 @@ may be found
 elsewhere~\cite{NeilBrown2015PathnameLookup,NeilBrown2015RCUwalk}.
 
 \paragraph{Semantics:
-		      Reader-Writer Locking vs.\@ RCU Semantics}
+		      Reader-Writer Locking vs.\@ RCU}
 
 Reader-writer locking semantics can be roughly and informally summarized
 by the following three temporal constraints:

base-commit: f52aad5df39cdd2fdddaa5dc9244789fd638bef8
-- 
2.17.1

