Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bVx+XiWMMhX5xves9aMlICKASubBs9Pxr4uj9RI/puo=;
        b=Qpm8yZ9l2CcV0hNPCsZe3vxCmO6fpkweKCuqjqoQGpAZXYfWKBdZnxm25TuSCTGU+x
         ZNF9D24Vs+7oil2axSMnIpX9EoGtCHiqwHZ6WDFzlj9KPiNC9oMDvlyZlcGQwFbvKGj7
         c0oEPxHkP+vJ9faqJs/zWSDqYWgq6oUioS4e6I/rxtE9pDrjdiLCDTDvViixEL1vBvU7
         3BTL4FZ8gpXzthBmr7zutrKAP81qtzA3PWC6FudgYteSCE4zpUc/Z1SbVlpuI8EjHeB9
         kPApTMz5TaGizRIIB/Xi3WFXnhgGSkT+RCpN6uhrahP/do1zwZd06TZMBRZguTNgzHwU
         U3mA==
Subject: [PATCH RESEND -perfbook 01/10] index: Add tags for 'reference count'
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a049a88d-2811-7f62-2fb3-8c6cf84a3115@gmail.com>
Date: Thu, 6 Jan 2022 16:30:55 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH -perfbook 01/10] index: Add tags for 'reference count'

"Reference count" covers "reference counter" and "reference counting"
as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex    | 3 ++-
 count/count.tex               | 2 +-
 defer/rcuusage.tex            | 3 ++-
 defer/refcnt.tex              | 3 ++-
 defer/whichtochoose.tex       | 4 ++--
 future/tm.tex                 | 3 ++-
 together/applyrcu.tex         | 2 +-
 together/refcnt.tex           | 3 ++-
 toolsoftrade/toolsoftrade.tex | 4 ++--
 9 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 9c474a37..2dbffbfc 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -29,7 +29,8 @@ RCU implementation based on simple locking, while
 \crefthro{sec:app:toyrcu:Per-Thread Lock-Based RCU}
 {sec:app:toyrcu:RCU Based on Quiescent States}
 present a series of
-simple RCU implementations based on locking, reference counters,
+simple RCU implementations based on locking,
+\IXalt{reference counters}{reference count},
 and free-running counters.
 Finally, \cref{sec:app:toyrcu:Summary of Toy RCU Implementations}
 provides a summary and a list of desirable RCU properties.
diff --git a/count/count.tex b/count/count.tex
index c8aa959b..2870506b 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -114,7 +114,7 @@ counting.
 
 \EQuickQuiz{
 	{\bfseries Removable I/O device access-count problem.}
-	Suppose that you need to maintain a reference count on a
+	Suppose that you need to maintain a \IX{reference count} on a
 	heavily used removable mass-storage device, so that you
 	can tell the user when it is safe to remove the device.
 	As usual, the user indicates a desire to remove the device, and
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 811dd32a..c663be0b 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -1729,7 +1729,8 @@ Again, part of the answer is performance, as shown in
 fig:defer:Performance of Preemptible RCU vs. Reference Counting},
 again showing data taken on a 448-CPU 2.1\,GHz Intel x86 system
 for non-preemptible and preemptible Linux-kernel RCU, respectively.
-Non-preemptible RCU's advantage over reference counting ranges from
+Non-preemptible RCU's advantage over
+\IXalt{reference counting}{reference count} ranges from
 more than an order of magnitude at one CPU up to about four orders of
 magnitude at 192~CPUs.
 Preemptible RCU's advantage ranges from about a factor of three at
diff --git a/defer/refcnt.tex b/defer/refcnt.tex
index 14e2def6..179c0521 100644
--- a/defer/refcnt.tex
+++ b/defer/refcnt.tex
@@ -7,7 +7,8 @@
 %
 \epigraph{I am never letting you go!}{Unknown}
 
-Reference counting tracks the number of references to a given object in
+\IXalt{Reference counting}{reference count}
+tracks the number of references to a given object in
 order to prevent that object from being prematurely freed.
 As such, it has a long and honorable history of use dating back to
 at least an early 1960s Weizenbaum
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index e3ce4540..4782c036 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -82,8 +82,8 @@ techniques from one another.
 
 The ``Readers'' row summarizes the results presented in
 \cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
-which shows that all but reference counting are enjoy reasonably
-fast and scalable readers.
+which shows that all but \IXalt{reference counting}{reference count}
+are enjoy reasonably fast and scalable readers.
 
 The ``Number of Protected Objects'' row evaluates each technique's need
 for external storage with which to record reader protection.
diff --git a/future/tm.tex b/future/tm.tex
index 50e7d6dc..8ed44405 100644
--- a/future/tm.tex
+++ b/future/tm.tex
@@ -869,7 +869,8 @@ exclusive locking.
 
 This section focuses mainly on RCU\@.
 Similar issues and possible resolutions arise when combining TM with
-other deferred-reclamation mechanisms such as reference counters and
+other deferred-reclamation mechanisms such as
+\IXalt{reference counters}{reference count} and
 hazard pointers.
 In the text below, known differences are specifically called out.
 
diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index b26c7b6e..e3a0d2fe 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -575,7 +575,7 @@ update rates.
 \subsection{Scalable Reference Count Two}
 \label{sec:together:Scalable Reference Count Two}
 
-Suppose a reference count is becoming a performance or scalability
+Suppose a \IX{reference count} is becoming a performance or scalability
 bottleneck.
 What can you do?
 
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 958fa383..292bdbd1 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -13,7 +13,8 @@ Although reference counting is a conceptually simple technique,
 many devils hide in the details when it is applied to concurrent
 software.
 After all, if the object was not subject to premature disposal,
-there would be no need for the reference counter in the first place.
+there would be no need for the
+\IXalt{reference counter}{reference count} in the first place.
 But if the object can be disposed of, what prevents disposal during
 the reference-acquisition process itself?
 
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index a6606e24..d2117fde 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -2459,8 +2459,8 @@ An atomic add that returns the new value is provided by
 Both \apik{atomic_add_unless()} and \apik{atomic_inc_not_zero()} provide
 conditional atomic operations, where nothing happens unless the
 original value of the atomic variable is different than the value
-specified (these are very handy for managing reference counters, for
-example).
+specified (these are very handy for managing
+\IXalt{reference counters}{reference count}, for example).
 
 An atomic exchange operation is provided by \apik{atomic_xchg()}, and
 the celebrated \acrmf{cas} operation is provided by
-- 
2.17.1


