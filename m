Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3TjxcmMKC0yh7Nfa8F5IUtgfvgq2nS85++nnaAn9iFE=;
 b=OYKVB4ETlwdhCFCfjLDW/Oj7bNpjsRiNqhbDg+FClD7j2zPt2HaMN5NBv1qo8AKCZY
 +ywBXeM6q407uH8E11Uiykm0XeyBdwzvt7hCZeoo1kCP0np0dHelWnbpALknYGkZiYyy
 fVYVZ7toEsJgxqUh2XW6xwrHPr1jSdfMmVfhtLlgmHwtnnlsSxXlBsE9NKl2vI//Jni0
 2fhandIT21HjQI2MYd/Z3g3hkA5M2IPZE8JRt1jHAWwe+hk6D7dRs64KcaraWc7uz27q
 OD0OQ+hfCgDPQu87nWlWOVgdGWc5R3O6IvVZQlN3gBc8nG4PM76Ps/ZOC9xuF9ybZloF
 qR2g==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] locking: fix typos
Date: Thu, 19 May 2016 07:54:00 +0900
Message-Id: <1463612040-21728-3-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
References: <1463612040-21728-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes trivial typos.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 locking/locking.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/locking/locking.tex b/locking/locking.tex
index a313284..e8ff812 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -242,7 +242,7 @@ containing locks from both the library and the caller.
 		deadlock cycle involving both caller and library locks.
 	\item	If one of the library functions returns a pointer to
 		a lock that is acquired by the caller, and if the
-		caller acquires one if its locks while holding the
+		caller acquires one of its locks while holding the
 		library's lock, we could again have a deadlock
 		cycle involving both caller and library locks.
 	\item	If one of the library functions acquires a lock and
@@ -1599,7 +1599,7 @@ Either way, line~21 releases the root \co{rcu_node} structure's
 This function illustrates the not-uncommon pattern of hierarchical
 locking.
 This pattern is quite difficult to implement using RAII locking,
-just like the interator encapsulation noted earlier,
+just like the iterator encapsulation noted earlier,
 and so the lock/unlock primitives will be needed for the foreseeable
 future.

@@ -1690,7 +1690,7 @@ Line~14 atomically exchanges the value zero (``unlocked'') into
 the lock, thus marking it as having been released.

 \QuickQuiz{}
-	Why not simply store zero into the lock word on line 14 of
+	Why not simply store zero into the lock word on line~14 of
 	Figure~\ref{fig:locking:Sample Lock Based on Atomic Exchange}?
 \QuickQuizAnswer{
 	This can be a legitimate implementation, but only if
-- 
1.9.1

