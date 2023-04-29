Return-Path: <SRS0=6f8h=AU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682809726; x=1685401726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUHNOvOaaF0wao24OGIu8f4UaKNemHg1OLgBbE6WyuA=;
        b=E1t+zkwbEwtf+L+hbhjzkPvqGZO34U9lmC2DMWc0eP6oA9w4mSy/dvUF0Y4lmLDeOL
         zu6YUbiEsuiJ42l4WshB7ZOrdvcyWBMaaKC5dSTXXDfD8SKcuvV1QCmUT9NeLFfObQGd
         Yybpo73lqYs0OFIEasIoBhKbKoVxF+KRqJU60BVcJuO0AhlriNpQoPbdhl5JbQvDN/Ip
         xrUKDcA1hu34uO2XvIjc6XDfG+2XNd7Z1XLBkGsZ6Exswo9Og7tYUQ3oJorbaLwr3MBE
         12oF2tAOXY7YjoHBSwUbm+pIkR3XCq3mEjaqpTeWi6P0BHwzCHlCBw3Qbhb9cZGcbdJu
         J4eQ==
Message-ID: <9bfadcbc-39c6-3f01-d510-ffa8cf7826b8@gmail.com>
Date: Sun, 30 Apr 2023 08:08:43 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 3/7] Add acronyms of LKMM and KCSAN
Content-Language: en-US
References: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2403fec1-1f05-c8ee-92cd-0350f9714f18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

LKMM and KCSAN deserve entries in the list of Acronyms
Add them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 debugging/debugging.tex | 2 +-
 formal/axiomatic.tex    | 4 ++--
 glsdict.tex             | 2 ++
 memorder/memorder.tex   | 9 ++++-----
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 191967baa810..42d69a9337fa 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -764,7 +764,7 @@ helpful in production.
 
 An especially bad parallel-code something is unexpected concurrent
 access to data.
-The Kernel Concurrency Sanitizer (KCSAN)~\cite{JonathanCorbet2019KCSAN}
+The \IXBacrfst{kcsan}~\cite{JonathanCorbet2019KCSAN}
 uses existing markings such as \co{READ_ONCE()} and \co{WRITE_ONCE()}
 to determine which concurrent accesses deserve warning messages.
 KCSAN has a significant false-positive rate, especially from the
diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index c970d3bb8382..04adec21c010 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -142,8 +142,8 @@ Axiomatic approaches may also be applied to higher-level
 languages and also to higher-level synchronization primitives, as
 exemplified by the lock-based litmus test shown in
 \cref{lst:formal:Locking Example} (\path{C-Lock1.litmus}).
-This litmus test can be modeled by the Linux kernel memory model
-(LKMM)~\cite{Alglave:2018:FSC:3173162.3177156,LucMaranget2018lock.cat}.
+This litmus test can be modeled by
+the \IXacrf{lkmm}~\cite{Alglave:2018:FSC:3173162.3177156,LucMaranget2018lock.cat}.
 As expected, the \co{herd} tool's output features the string \co{Never},
 correctly indicating that \co{P1()} cannot see \co{x} having a value
 of one.\footnote{
diff --git a/glsdict.tex b/glsdict.tex
index d14688590bbb..ce48154acf5f 100644
--- a/glsdict.tex
+++ b/glsdict.tex
@@ -230,6 +230,8 @@
 \newacronym{gpgpu}{GPGPU}{general\-/purpose graphical processing unit}
 \newacronym{irq}{IRQ}{interrupt request}
 \newacronym{ipi}{IPI}{inter\-/processor interrupt}
+\newacronym{kcsan}{KCSAN}{kernel concurrency sanitizer}
+\newacronym{lkmm}{LKMM}{Linux kernel memory consistency model}
 \newacronym{mpi}{MPI}{Message Passing Interface}
 \newacronym{nbs}{NBS}{non-blocking synchronization}
 \newacronym{nmi}{NMI}{non-maskable interrupt}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index f116ab81aceb..47bde79b5abd 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -60,11 +60,10 @@ provides some reliable intuitions and useful rules of thumb.
 	along with a paper describing differences between the C11 and
 	Linux memory models~\cite{PaulEMcKenney2016P0124R6-LKMM}.
 
-	The kernel concurrency sanitizer
-	(KCSAN)~\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2},
+	The \IXacrf{kcsan}~\cite{MarcoElver2020FearDataRaceDetector1,MarcoElver2020FearDataRaceDetector2},
 	based in part on
 	RacerD~\cite{SamBlackshear2018RacerD}
-	and implementing LKMM, has also been added to the Linux kernel
+	and implementing \IXacr{lkmm}, has also been added to the Linux kernel
 	and is now heavily used.
 
 	Finally, there are now better ways of describing LKMM.
@@ -3749,7 +3748,7 @@ For their part, weakly ordered systems might well choose to execute
 the memory-barrier instructions required to guarantee both orderings,
 possibly simplifying code making advanced use of combinations of locked
 and lockless accesses.
-However, as noted earlier, LKMM chooses not to provide these additional
+However, as noted earlier, \IXacr{lkmm} chooses not to provide these additional
 orderings, in part to avoid imposing performance penalties on the simpler
 and more prevalent locking use cases.
 Instead, the \co{smp_mb__after_spinlock()} and \co{smp_mb__after_unlock_lock()}
@@ -4997,7 +4996,7 @@ None of these instructions exactly match the semantics of Linux's
 The \co{DMB} and \co{DSB} instructions have a recursive definition
 of accesses ordered before and after the barrier, which has an effect
 similar to that of \Power{}'s cumulativity, both of which are
-stronger than LKMM's cumulativity described in
+stronger than \IXacr{lkmm}'s cumulativity described in
 \cref{sec:memorder:Cumulativity}.
 
 \ARM\ also implements control dependencies, so that if a conditional
-- 
2.25.1


