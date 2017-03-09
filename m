Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=PxCK7LHW/CYE7h6NATv7zt2pE+kvTCXr83nS2VEYv8o=;
 b=Pu6Xys3+gWBWQf0WLRObIfuv0bXUy6ZY+PbtbVZCEV+3WhxAFOH7K/a55re5ZLGDWf
 Z08yBzAplG7apXrriOlVXKKvuOvJBDMw5iRso9F5kr4InkfG/kpCtaYNwVppZnILVNjd
 fbO4Vjb4veucKkl1TFPTNO0wtXabrfoHt34Gdws2OcBwDUzdvGr06g85+0o0hRpKEOSE
 H5OUt01hIHikYCD4G8I9DQRGjrGFsrFYfab4AmDJhTw37PFznCEgnu96rj1yONLxsJmJ
 aupUjqGfmmSNRCnbWGT0fGmO+E/72xd9zcD4KUYD7z+2ld8s0hQsYei8jTxNCsZB8dvu
 IT+A==
Subject: [PATCH 5/5] together: Covert to 'description'
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bedf396d-4b1d-f510-5d16-6c7bf90af8bf@gmail.com>
Date: Fri, 10 Mar 2017 00:28:37 +0900
MIME-Version: 1.0
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e4a223315e3db9ffe303a95e15ee662935baaea9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:55:30 +0900
Subject: [PATCH 5/5] together: Covert to 'description'

This list looks better in "description" environment with
"nextline" style.
The long label is properly line broken by the help of
"enumitem" package.
Note that ";" is preserved in the labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/refcnt.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index e7884a4..626c375 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -563,40 +563,40 @@ summarized in the following list.
 	    so a brief overview with citations is included in
 	    Section~\ref{sec:together:Background on RCU}.}

-\begin{itemize}
-\item	\co{atomic_t}
+\begin{description}[style=nextline]
+\item	[\tco{atomic_t}]
 	Type definition for 32-bit quantity to be manipulated atomically.
-\item	\co{void atomic_dec(atomic_t *var);}
+\item	[\tco{void atomic_dec(atomic_t *var);}]
 	Atomically decrements the referenced variable without necessarily
 	issuing a memory barrier or disabling compiler optimizations.
-\item	\co{int atomic_dec_and_test(atomic_t *var);}
+\item	[\tco{int atomic_dec_and_test(atomic_t *var);}]
 	Atomically decrements the referenced variable, returning
 	\co{true} (non-zero) if the result is zero.
 	Issues a memory barrier and disables compiler optimizations that
 	might otherwise move memory references across this primitive.
-\item	\co{void atomic_inc(atomic_t *var);}
+\item	[\tco{void atomic_inc(atomic_t *var);}]
 	Atomically increments the referenced variable without necessarily
 	issuing a memory barrier or disabling compiler optimizations.
-\item	\co{int atomic_inc_not_zero(atomic_t *var);}
+\item	[\tco{int atomic_inc_not_zero(atomic_t *var);}]
 	Atomically increments the referenced variable, but only if the
 	value is non-zero, and returning \co{true} (non-zero) if the
 	increment occurred.
 	Issues a memory barrier and disables compiler optimizations that
 	might otherwise move memory references across this primitive.
-\item	\co{int atomic_read(atomic_t *var);}
+\item	[\tco{int atomic_read(atomic_t *var);}]
 	Returns the integer value of the referenced variable.
 	This need not be an atomic operation, and it need not issue any
 	memory-barrier instructions.
 	Instead of thinking of as ``an atomic read'', think of it as
 	``a normal read from an atomic variable''.
-\item	\co{void atomic_set(atomic_t *var, int val);}
+\item	[\tco{void atomic_set(atomic_t *var, int val);}]
 	Sets the value of the referenced atomic variable to ``val''.
 	This need not be an atomic operation, and it is not required
 	to either issue memory
 	barriers or disable compiler optimizations.
 	Instead of thinking of as ``an atomic set'', think of it as
 	``a normal set of an atomic variable''.
-\item	\co{void call_rcu(struct rcu_head *head, void (*func)(struct rcu_head *head));}
+\item	[\tco{void call_rcu(struct rcu_head *head, void (*func)(struct rcu_head *head));}]
 	Invokes \co{func(head)} some time after all currently executing RCU
 	read-side critical sections complete, however, the \co{call_rcu()}
 	primitive returns immediately.
@@ -607,24 +607,24 @@ summarized in the following list.
 	the invocation of \co{func} is termed a ``grace period''.
 	Any interval of time containing a grace period is itself a
 	grace period.
-\item	\co{type *container_of(p, type, f);}
+\item	[\tco{type *container_of(p, type, f);}]
 	Given a pointer \co{p} to a field \co{f} within a structure
 	of the specified type, return a pointer to the structure.
-\item	\co{void rcu_read_lock(void);}
+\item	[\tco{void rcu_read_lock(void);}]
 	Marks the beginning of an RCU read-side critical section.
-\item	\co{void rcu_read_unlock(void);}
+\item	[\tco{void rcu_read_unlock(void);}]
 	Marks the end of an RCU read-side critical section.
 	RCU read-side critical sections may be nested.
-\item	\co{void smp_mb__before_atomic_dec(void);}
+\item	[\tco{void smp_mb__before_atomic_dec(void);}]
 	Issues a memory barrier and disables code-motion compiler
 	optimizations only if the platform's \co{atomic_dec()}
 	primitive does not already do so.
-\item	\co{struct rcu_head}
+\item	[\tco{struct rcu_head}]
 	A data structure used by the RCU infrastructure to track
 	objects awaiting a grace period.
 	This is normally included as a field within an RCU-protected
 	data structure.
-\end{itemize}
+\end{description}

 \QuickQuiz{}
 	An \co{atomic_read()} and an \co{atomic_set()} that are
-- 
2.7.4


