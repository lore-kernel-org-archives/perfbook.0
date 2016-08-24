Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=KYMTg1TidbqG8s/M9ho2VnbwB+BiWZDNAO7YS+6YPso=;
 b=xd9KL9vElH/v35sdraMk099mpS5X/1mDZW1QG696ab+0Uyi3gJngx52LY1MlfgDKuD
 Dpu7Ex5KD9Uhbc6VlqqcF6y67iDJ2pVf5xsiFEO4vAn+clwLrPTUGWN0bt1pLefvwOOw
 qvVACU7HhSAMFrJQK8u2Il0RoyUehqFSTl4m2ouvZCAj+Vi8EDL95+fWgb7WQjPQrxpR
 4uX/UfgxKjh24wjZsgfCzY2pkDupyuSoYjMurQCWexdsdtULbrv/O+Y8cJPzTYPwOM3y
 8aeavOGOHElQzNpZ+lmpDYRPpnCgYUgMnFg8YqYHYuEU6RP2ChaO73gPo7Zrkojvuv2K
 XxTA==
Subject: [PATCH 3/3] locking: Typo fixes
References: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eeb07795-6105-b8dc-9a55-f664c64e440a@gmail.com>
Date: Wed, 24 Aug 2016 23:11:57 +0900
MIME-Version: 1.0
In-Reply-To: <bd90da8b-ed06-e104-8a70-96b029ad666a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 98c6fbbe2a7b04bc1ad11d70d96995425d8635de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 24 Aug 2016 20:41:41 +0900
Subject: [PATCH 3/3] locking: Typo fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 locking/locking.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index 9eafcf5..48a3520 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -234,7 +234,7 @@ containing locks from both the library and the caller.
 	\begin{enumerate}
 	\item	If one of the library function's arguments is a pointer
 		to a lock that this library function acquires, and if
-		the library function holds one if its locks while
+		the library function holds one of its locks while
 		acquiring the caller's lock, then we could have a
 		deadlock cycle involving both caller and library locks.
 	\item	If one of the library functions returns a pointer to
@@ -469,7 +469,7 @@ Chapter~\ref{chp:Deferred Processing}.
 \subsubsection{Locking Hierarchies and Pointers to Locks}
 \label{sec:locking:Locking Hierarchies and Pointers to Locks}

-Althought there are some exceptions, an external API containing a pointer
+Although there are some exceptions, an external API containing a pointer
 to a lock is very often a misdesigned API.
 Handing an internal lock to some other software component is after all
 the antithesis of information hiding, which is in turn a key design
@@ -495,7 +495,7 @@ prevents hangs due to lost wakeups.
 \QuickQuizAnswer{
 	Absolutely not!

-	Consider the a program that acquires \co{mutex_a}, and then
+	Consider a program that acquires \co{mutex_a}, and then
 	\co{mutex_b}, in that order, and then passes \co{mutex_a}
 	to \co{pthread_cond_wait}.
 	Now, \co{pthread_cond_wait} will release \co{mutex_a}, but
@@ -622,7 +622,7 @@ must release the locks and start over.
 	the code will always retry, never making forward progress.
 	This is termed ``livelock'' if no thread makes any forward progress or
 	``starvation''
-	if some threads make forward progress but other do not
+	if some threads make forward progress but others do not
 	(see Section~\ref{sec:locking:Livelock and Starvation}).
 } \QuickQuizEnd

-- 
1.9.1


