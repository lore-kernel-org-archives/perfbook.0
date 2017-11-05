Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=95GOAZYnOW/zMshhmIBJqst3i9DzYoXRIH9JxBc4RxY=;
 b=cyMz8WX0b9ccbuehFWeZ0jwceLYLf9hQ/ul/rLOUIcfTdeUmu8MUgLqaACFEfgr8sQ
 gUUVQtVteRor2AKiUokAyZNf3sjQRv2vzNjZufVILNmXuLpRBoGHLxvDD6b46xvWA09D
 zRwSjCsM2lD5sa8oDgG6ZgPp6dly9TCuoCiyRS+Tl4W1WC9F+Yc2KBMQS0p1YOM4Aso4
 Lh6O9z2d8g1zpRg96tn+SrkHAlMPtJccFRP6Y9Yect3ikWEm/S5dEdWFrrjvJiyR8Ux1
 XNWVv/kq5fxrQ4mHfOEslkCp/vFMTHYkFWw/AGfqlENlaQqqXRIxYyGd/pH55vF6wIkj
 LPdA==
Subject: [PATCH 4/4] Fix typos in answers to quick quizzes
References: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <57b193be-fab3-69b9-335e-1b3aa55c20bb@gmail.com>
Date: Sun, 5 Nov 2017 23:53:22 +0900
MIME-Version: 1.0
In-Reply-To: <5a0c3a27-0b4e-8d2b-b43c-26e75cdfe05f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7902d9405a7e92aef281297af179c0696bc389b8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 5 Nov 2017 23:05:29 +0900
Subject: [PATCH 4/4] Fix typos in answers to quick quizzes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex    | 2 +-
 memorder/memorder.tex         | 6 +++---
 toolsoftrade/toolsoftrade.tex | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index cd6541c..a796401 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -1920,7 +1920,7 @@ certain types of library functions.
 	effect extended beyond the enclosing
 	\co{rcu_read_lock()} and \co{rcu_read_unlock()}, out to
 	the previous and next call to \co{rcu_quiescent_state()}.
-	This \co{rcu_quiescent_state} can be thought of as a
+	This \co{rcu_quiescent_state} can be thought of as an
 	\co{rcu_read_unlock()} immediately followed by an
 	\co{rcu_read_lock()}.

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 0e823d4..23638da 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -608,7 +608,7 @@ are at most two threads involved.
 	reordered against later stores, which brings us to the remaining
 	rows in this table.

-	The \co{smp_mb())} row corresponds to the full memory barrier
+	The \co{smp_mb()} row corresponds to the full memory barrier
 	available on most platforms, with Itanium being the exception
 	that proves the rule.

@@ -1452,10 +1452,10 @@ dependent-load case.
 	address dependencies.
 	And this is why DEC Alpha requires the explicit memory barrier
 	supplied for it by the \co{lockless_dereference()} on line~21 of
-	Listings~\ref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}.
+	Listing~\ref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test}.
 	However, DEC Alpha does track load-to-store address dependencies,
 	which is why line~20 of
-	Listings~\ref{lst:memorder:S Address-Dependency Litmus Test}
+	Listing~\ref{lst:memorder:S Address-Dependency Litmus Test}
 	does not have a \co{lockless_dereference()}.

 	To sum up, current platforms either respect address dependencies
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 7d3e038..771d8a9 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -606,7 +606,7 @@ Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}
 (\path{lock.c}).
 Line~1 defines and initializes a POSIX lock named \co{lock_a}, while
 line~2 similarly defines and initializes a lock named \co{lock_b}.
-Line~3 defines and initializes a shared variable ~\co{x}.
+Line~3 defines and initializes a shared variable~\co{x}.

 Lines~5-28 defines a function \co{lock_reader()} which repeatedly
 reads the shared variable \co{x} while holding
-- 
2.7.4


