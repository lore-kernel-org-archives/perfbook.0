Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vsFKCZDgcTZY/RBG6KLOczm2JkNII3DJwFSHPVvk7xQ=;
        b=beFJKh8wo0iUEf3DxK/zDjWlXx6luicdpRO10+DOP8pySV7wWqqHakXtvhGl6vrvd0
         NQc1uPkKe2z1R9omAX7sSDBxbJ+oTCsvfE9DBPXvnvKb8l8qIwuV1/vu/25OJP0ZCUzi
         nkwQzBo86SoHx/w1Ru5jr5JNCI3jv/5igOrgirfvpylCjthAUreaKWgT6dtXpA+w4+Yy
         SRRJtucynzgT/JekAPsEAKAbMZa1SXjFKdq2yVMOwVtjlecVg0C86KzohB4DQkTB2h1e
         gcdvzoLelF/YzoXGFV1Kq/jH2LlcG7qYdjQtZOlMQdm/1c/TfO9yW57cSnZjcIeClzFP
         msVQ==
Subject: [PATCH RESEND -perfbook 09/10] treewide: Add acronym tags for QSBR
 and EBR
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <42b265e9-37d2-3233-b6d5-779296c6f8fc@gmail.com>
Date: Thu, 6 Jan 2022 16:43:06 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 defer/rcuintro.tex        | 3 +--
 defer/rcurelated.tex      | 4 ++--
 defer/rcuusage.tex        | 2 +-
 defer/whichtochoose.tex   | 3 +--
 memorder/memorder.tex     | 2 +-
 6 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 99da03bf..27f6b9a3 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -694,7 +694,7 @@ But why is RCU's performance a factor of five less than ideal?
 One possibility is that the per-thread counters manipulated by
 \co{rcu_read_lock()} and \co{rcu_read_unlock()} are slowing things down.
 \Cref{fig:datastruct:Read-Only RCU-Protected Hash-Table Performance For Schroedinger's Zoo including QSBR; Linear Scale}
-therefore adds the results for the QSBR variant of RCU, whose read-side
+therefore adds the results for the \IXacr{qsbr} variant of RCU, whose read-side
 primitives do nothing.
 And although QSBR does perform slightly better than does RCU, it is still
 about a factor of five short of ideal.
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index d87c18c1..b03eef26 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -328,8 +328,7 @@ state shown at the bottom of
 \label{fig:defer:QSBR: Waiting for Pre-Existing Readers}
 \end{figure}
 
-This approach is termed \emph{quiescent state based reclamation}
-(QSBR)~\cite{ThomasEHart2006a}.
+This approach is termed \IXacrfst{qsbr}~\cite{ThomasEHart2006a}.
 A QSBR schematic is shown in
 \cref{fig:defer:QSBR: Waiting for Pre-Existing Readers},
 with time advancing from the top of the figure to the bottom.
diff --git a/defer/rcurelated.tex b/defer/rcurelated.tex
index 48622df8..57b2679d 100644
--- a/defer/rcurelated.tex
+++ b/defer/rcurelated.tex
@@ -267,8 +267,8 @@ other aspects of concurrency.
 \ppl{Joseph}{Tassarotti} (Carnegie-Mellon University), \ppl{Derek}{Dreyer} (Max
 Planck Institute for Software Systems), and \ppl{Viktor}{Vafeiadis}
 (also MPI-SWS)~\cite{JosephTassarotti2015RCUproof}
-produced a manual formal proof of correctness of the quiescent-state-based
-reclamation (QSBR) variant of userspace
+produced a manual formal proof of correctness of the \IXacrf{qsbr}
+variant of userspace
 RCU~\cite{MathieuDesnoyers2009URCU,MathieuDesnoyers2012URCU}.
 \ppl{Lihao}{Liang} (University of Oxford), \pplmdl{Paul E.}{McKenney} (IBM),
 \ppl{Daniel}{Kroening}, and \ppl{Tom}{Melham}
diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index a3a17f61..5f1e2aa2 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -110,7 +110,7 @@ flavor of userspace
 RCU~\cite{MathieuDesnoyers2009URCU,PaulMcKenney2013LWNURCU},
 for which \co{rcu_read_lock()} and \co{rcu_read_unlock()}
 generate a small amount of code.
-What happens for the QSBR flavor of RCU, which generates no code at all
+What happens for the \IXacr{qsbr} flavor of RCU, which generates no code at all
 for \co{rcu_read_lock()} and \co{rcu_read_unlock()}?
 (See \cref{sec:defer:Introduction to RCU},
 and especially
diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index e54ad1df..4fec94df 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -524,8 +524,7 @@ In 2015, Maxim Khizhinsky added RCU to
 libcds~\cite{MaxKhiszinsky2015C++RCU}.
 
 Mindaugas Rasiukevicius implemented libqsbr in 2016, which features
-QSBR and epoch-based reclamation
-(EBR)~\cite{MindaugasRasiukevicius2016libqsbr},
+\IXacr{qsbr} and \IXacrf{ebr}~\cite{MindaugasRasiukevicius2016libqsbr},
 both of which are types of implementations of RCU\@.
 
 Sheth et al.~\cite{HarshalSheth2016goRCU}
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index cd828b0a..0305a71a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3683,7 +3683,7 @@ This litmus test's cycle is also allowed.
 
 Of course, lack of ordering in both these litmus tests should be absolutely
 no surprise, given that both \co{rcu_read_lock()} and \co{rcu_read_unlock()}
-are no-ops in the QSBR implementation of RCU\@.
+are no-ops in the \IXacr{qsbr} implementation of RCU\@.
 
 \subsubsection{RCU Update-Side Ordering}
 \label{sec:memorder:RCU Update-Side Ordering}
-- 
2.17.1


