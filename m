Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DINuU+aqpTMj9hEQ9TQgbLbl9dy5HaJtB6S/VYzn6Qk=;
 b=P6PGpqLNTXRyDQh1WhmmhsPuI8nNorT75fsmTcj1G6UooX1gFOeYWTIPWEZEz/Bn3n
 cPff7S29yHR+V2I+l/G0A4cvuynlQwq4wj++qqf0rcqbnTWV5vle6zpdvCANO6hUvwtw
 cKNbHbVDMGeirUAAAx2wuRErlRHo9INGnrwFe+IxEvbk5zPudNSp9dLjUBE4gUMsS4HF
 wHvi0woWmkk/IiEjg9RuXYLgXm5neUZ8YCzScAW6R60hrgbMUN2kI76PpFGNWa8XWN94
 NiyZhK00ik5JNdyw3Dp0uglJHh6BTH++zBIIwkO5T9Rspplctq9TgTKaerVfY1lbhE4U
 ll9w==
Subject: [PATCH 3/3] Fix layout hiccups in answers to quick quizzes
References: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2747567f-60ef-551d-a08b-386fe781ad19@gmail.com>
Date: Sat, 4 Nov 2017 10:41:33 +0900
MIME-Version: 1.0
In-Reply-To: <2495dd31-1b4c-99e2-46aa-dc55671007ff@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fa20d77f7a35114dd6bf93e362b44235b163f1ad Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 4 Nov 2017 08:34:01 +0900
Subject: [PATCH 3/3] Fix layout hiccups in answers to quick quizzes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex              | 7 ++++---
 defer/rcufundamental.tex      | 1 +
 memorder/memorder.tex         | 7 ++++---
 toolsoftrade/toolsoftrade.tex | 2 +-
 4 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index d4e434d..55811a1 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -367,9 +367,10 @@ returns a value that must be passed into the corresponding
 	In practice, however, doing this is almost certainly a bad idea.
 	In particular, the code shown in
 	Listing~\ref{lst:defer:Multistage SRCU Deadlocks}
-	could still result in deadlock.
-
+	could still result in deadlock.%
+%
 \begin{listing}[htbp]
+\scriptsize
 {
 \begin{verbbox}
   1 idx = srcu_read_lock(&ssa);
@@ -387,7 +388,7 @@ returns a value that must be passed into the corresponding
 \theverbbox
 \caption{Multistage SRCU Deadlocks}
 \label{lst:defer:Multistage SRCU Deadlocks}
-\end{listing}
+\end{listing}%
 %
 } \QuickQuizEnd

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 4c16478..f2cfab2 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -750,6 +750,7 @@ versions of the list active at a given time.
 	Listing~\ref{lst:defer:Concurrent RCU Deletion}.

 \begin{listing}[htbp]
+\scriptsize
 {
 \begin{verbbox}
   1 spin_lock(&mylock);
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 3ba4d3a..0e823d4 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1854,8 +1854,8 @@ exists (1:r1=1 /\ 1:r2=0)
 \theverbbox
 \caption{Litmus Test Distinguishing Multicopy Atomic From Other Multicopy Atomic}
 \label{lst:memorder:Litmus Test Distinguishing Multicopy Atomic From Other Multicopy Atomic}
-\end{listing}
-
+\end{listing}%
+%
 	Listing~\ref{lst:memorder:Litmus Test Distinguishing Multicopy Atomic From Other Multicopy Atomic}
 	(\path{C-MP-OMCA+o-o-o+o-rmb-o.litmus})
 	shows such a test.
@@ -2299,7 +2299,8 @@ exists (1:r2=0 /\ x1=2)
 \theverbbox
 \caption{R Litmus Test With Write Memory Barrier (No Ordering)}
 \label{lst:memorder:R Litmus Test With Write Memory Barrier (No Ordering)}
-\end{listing}
+\end{listing}%
+%
 	Wrong.

 	Listing~\ref{lst:memorder:R Litmus Test With Write Memory Barrier (No Ordering)}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index d37a295..7d3e038 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -727,7 +727,7 @@ by \co{lock_writer()} while holding the lock.
 	The reason that ``x = 0'' was output was that \co{lock_reader()}
 	acquired the lock first.
 	Had \co{lock_writer()} instead acquired the lock first, then
-	the output would have been ``x = 3''.
+	the output would have been \mbox{``x = 3''}.
 	However, because the code fragment started \co{lock_reader()} first
 	and because this run was performed on a multiprocessor,
 	one would normally expect \co{lock_reader()} to acquire the
-- 
2.7.4


