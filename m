Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qk5YwYZlCg3MjZnnvBUGL6YcYGALLE+2r6jdXIUdp/8=;
        b=MdVYdq5U32W4/LtCVsgZlFU6ByuX/9ZDO80AMW+n8KHNH6+KjY80IIBylFvPJNKybx
         LhjkBofPdpYln+DQcSwK2mDvsQLCnxcLanC3nXNensVal6RraXR/3KO8g9IL6xfsM6rz
         Ie28yzoNRTRarDoVkhC609XyWkbvmcURSzLu8itpm/5nFYDgv+57AYkq9yzgEBMNTWuw
         cVpcWxaqoTlcv3xBFQcauf1KnJqEgG7P6xMFDd8So3U39UvXYjj9bC+/u/ifpadSjlKM
         EVApccQkr3cnFOJu2cxNoUGIuTfm9TNW4dtJF9EeNonkGOCZHcxzILT4Dd7Tfpeolzm7
         +r2Q==
Subject: [PATCH 4/8] formal/axiomatic: Import snippet from C-RCU-remove.litmus
References: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b4315d5f-dce3-7a4f-9660-b3bc96d5c84a@gmail.com>
Date: Thu, 1 Nov 2018 00:13:00 +0900
MIME-Version: 1.0
In-Reply-To: <a0be104e-0043-36bb-a639-4ecd6db77d59@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f7553e5f74241123c3f2a850a870b892176056cf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 31 Oct 2018 07:55:15 +0900
Subject: [PATCH 4/8] formal/axiomatic: Import snippet from C-RCU-remove.litmus

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/axiomatic.tex | 36 ++++--------------------------------
 1 file changed, 4 insertions(+), 32 deletions(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 41af129..8706635 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -235,40 +235,12 @@ And in this case, the \co{herd} tool's output features the string
 \label{sec:formal:Axiomatic Approaches and RCU}
 
 \begin{listing}[tb]
-\begin{linelabel}[ln:formal:Canonical RCU Removal Litmus Test]
-\begin{VerbatimL}[commandchars=\\\[\]]
-C C-RCU-remove
-
-{
-	int *z=1;\lnlbl[tail:2]
-	int *y=2;\lnlbl[tail:1]
-	int *x=y;\lnlbl[head]
-}
-
-P0(int *x, int *y, int *z)\lnlbl[P0start]
-{
-	rcu_assign_pointer(*x, z);\lnlbl[assignnewtail]
-	synchronize_rcu();\lnlbl[sync]
-	WRITE_ONCE(*y, 0);\lnlbl[free]
-}\lnlbl[P0end]
-
-P1(int *x, int *y, int *z)\lnlbl[P1start]
-{
-	rcu_read_lock();\lnlbl[rl]
-	r1 = rcu_dereference(*x);\lnlbl[rderef]
-	r2 = READ_ONCE(*r1);\lnlbl[read]
-	rcu_read_unlock();\lnlbl[rul]
-}\lnlbl[P1end]
-
-locations [0:r1; 1:r1; x; y; z]\lnlbl[locations]
-exists (1:r2=0)\lnlbl[exists]
-\end{VerbatimL}
-\end{linelabel}
+\input{CodeSamples/formal/herd/C-RCU-remove@whole.fcv}
 \caption{Canonical RCU Removal Litmus Test}
 \label{lst:formal:Canonical RCU Removal Litmus Test}
 \end{listing}
 
-\begin{lineref}[ln:formal:Canonical RCU Removal Litmus Test]
+\begin{lineref}[ln:formal:C-RCU-remove:whole]
 Axiomatic approaches can also analyze litmus tests involving RCU.
 To that end,
 Listing~\ref{lst:formal:Canonical RCU Removal Litmus Test}
@@ -289,9 +261,9 @@ executes within an RCU read-side critical section
 picking up the list head (line~\lnref{rderef}) and then
 loading the next element (line~\lnref{read}).
 The next element should be non-zero, that is, not yet freed
-(line~\lnref{exists}).
+(line~\lnref{exists_}).
 Several other variables are output for debugging purposes
-(line~\lnref{locations}).
+(line~\lnref{locations_}).
 
 The output of the \co{herd} tool when running this litmus test features
 \co{Never}, indicating that \co{P0()} never accesses a freed element,
-- 
2.7.4


