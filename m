Return-Path: <SRS0=ieQ4=SS=jklaehn.de=johann@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jklaehn.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=t35QV1PLvr8XCFPPipA78/75p3JqWzFbD2JsZm
	PeGeE=; b=qql74B7/gYNjlC2G4lGoU11JWOIKVWRveEeKAs7yvN6rqL50dVdec3
	1+qyQh8TNPD/qU+dqwdUPYOGk71iHkvu/OvD/NR6r8Vxu8jGWnDHFs6oly/8FK6s
	3ENyfcO4oXnn36ZUyW3sg/+sTFQ7+lygj5iRpMwW5wDrX+KWcBFgPq0y23XAerZ6
	6aPZn0PVp22XzQNp7R71ZKiEV6AGbj8HkoPyvfqxPtpGZVt2L+mBUVnK32Gpnzwa
	JY6/2IrjfnI+y9vzeHtg6V8PAebAafaZKursTRUOvuW1aFC7caxE9t0DbGiqVACo
	/iS63sB8n9jyD4RO9/qlf7BQGGrN3Uyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=t35QV1
	PLvr8XCFPPipA78/75p3JqWzFbD2JsZmPeGeE=; b=VNNXz9c+Ozt08gXoHS1oTk
	HFMkBASus5TLB5kyEhKldmabc7dapD6/gIlExKY1wbUoUN6r/JpIwu4CGR6+I3at
	tIYpe+BiJFfx7RgVwxjd2UxMAuoJ8FmnBcQHsk7a4h07cSiVR0RwgKiBAa0Fr7Ng
	rjireimSIws8nnKIi3xMEEIFX5jrhMi++IT7fEVCngI2IKUwmhdREFDCkspnM9T+
	rAzyVlP8zt+omYmeGq7Wz35RH/j93vIn1iwkOMytKZ1+meFhP/SHiS9QOENzImPw
	ypCiVSEMo6uRKego+UUK6SrBsArGT+V8ubQQpfnUXklG6gCr/rpewsWG7oFyYnJA
	==
From: =?UTF-8?q?Johann=20Kl=C3=A4hn?= <johann@jklaehn.de>
Subject: [PATCH-perfbook] memorder: Fix typos
Date: Thu,  3 Feb 2022 22:10:01 +0100
Message-Id: <20220203211001.83673-1-johann@jklaehn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Johann Klähn <johann@jklaehn.de>
---
 memorder/memorder.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 865eff95..9792099f 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2169,7 +2169,7 @@ from a particular store, then, courtesy of the finite speed of light and
 the non-zero size of modern computing systems, the store absolutely has
 to have executed at an earlier time than did the load.
 This means that carefully constructed programs can rely on the
-passage of time itself as an memory-ordering operation.
+passage of time itself as a memory-ordering operation.
 
 \begin{figure}
 \centering
@@ -2588,7 +2588,7 @@ if (p == &reserve_int) {
 \item	Although it is permissible to compute offsets from a
 	pointer, these offsets must not result in total cancellation.
 	For example, given a \co{char} pointer \co{cp},
-	\co{cp-(uintptr_t)cp)} will cancel and can allow the compiler
+	\co{cp-(uintptr_t)cp} will cancel and can allow the compiler
 	to break your dependency chain.
 	On the other hand, canceling offset values with each other
 	is perfectly safe and legal.
@@ -2753,7 +2753,7 @@ void updater(void)		\lnlbl[upd:b]
 {
 	struct foo *p;
 
-	p = malloc(sizeo(*p));		\lnlbl[upd:alloc]
+	p = malloc(sizeof(*p));		\lnlbl[upd:alloc]
 	BUG_ON(!p);			\lnlbl[upd:bug]
 	p->a = 42;			\lnlbl[upd:init:a]
 	p->b = 43;
@@ -2803,7 +2803,7 @@ bitterly on \clnref{bug} if none is available.
 \Clnrefrange{init:a}{init:c} initialize the newly allocated structure,
 and then \clnref{assign1} assigns the pointer to \co{gp1}.
 \Clnref{upd:b,upd:c} then update two of the structure's fields, and does
-so \co{after} \clnref{assign1} has made those fields visible to readers.
+so \emph{after} \clnref{assign1} has made those fields visible to readers.
 Please note that unsynchronized update of reader-visible fields
 often constitutes a bug.
 Although there are legitimate use cases doing just this, such use cases
@@ -3032,7 +3032,7 @@ if (q || 1 > 0)
 
 Because the first condition cannot fault and the second condition is
 always true, the compiler can transform this example as following,
-defeating control dependency:
+defeating the control dependency:
 
 \begin{VerbatimN}
 q = READ_ONCE(x);
@@ -3238,7 +3238,7 @@ These facts are what enables the lockless fastpaths in
 \cref{lst:SMPdesign:Allocator-Cache Allocator Function,%
 lst:SMPdesign:Allocator-Cache Free Function},
 respectively.
-However, this also why the developer is responsible for providing
+However, this is also why the developer is responsible for providing
 appropriate ordering (for example, by using \co{smp_store_release()})
 when publishing a pointer to a newly allocated block of memory.
 After all, in the CPU-local case, the allocator has not necessarily
@@ -3307,7 +3307,7 @@ As it turns out, quite a bit:
 	Is some other CPU or thread not holding that lock guaranteed to
 	see A and B in order?
 \item	As above, but with the lock reacquisition carried out by some
-	other CPU or threads?
+	other CPU or thread?
 \item	As above, but with the lock reacquisition being some other lock?
 \item	What ordering guarantees are provided by \co{spin_is_locked()}?
 \end{enumerate}
@@ -3571,7 +3571,7 @@ One reason is modeling performance, as shown in
 on
 \cpageref{tab:formal:Locking: Modeling vs. Emulation Time (s)}.
 Directly modeling locking in general is orders of magnitude faster
-than modeling even a trivial implementation.
+than emulating even a trivial implementation.
 This should be no surprise, given the combinatorial explosion experienced
 by present-day formal-verification tools with increases in the number of
 memory accesses executed by the code being modeled.
-- 
2.34.1

