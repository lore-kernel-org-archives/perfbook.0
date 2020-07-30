Return-Path: <SRS0=rnhZ=BJ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sMc2BFk/uSVke+O4lB87d7C0jW+HiA4TFzSi5Gh+C94=;
        b=JNHWcrJnaXqW6I3IlIz5tmedZj5oUymfojUQgExDf+QhUhd0G3UZG+8V/OrQ1XaTOF
         LlOQXMFen/3lVv3Ivh6SfWtQg/8NPz5K41PFZkgZ8yO3plL/d+5dJ80Zxy+WhkYq3CUt
         rr9WUa6AiYDd62SiVfMGhYZe2k6SmeSsZMi1+Z7DRI0oTvPUCcwdbTg8QmepNynvbANb
         xWc6pGmabDKzbUdAmBD26yOSERq3I2surAzTvpCXWc5JF1oGmFQCopA2hYbvRtfuFWQN
         gYDCp1a+zeprU6MgMiT8eowbh4amBiIUM3vK30v153Hk4wunobEiNiQdN8X030msjiqB
         QqQQ==
Subject: [PATCH 2/2] toyrcu: Minor fixes
References: <d21641e4-ad62-8cee-3479-98b059994661@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8ce1dd35-099c-a4df-0536-c787b971f96f@gmail.com>
Date: Fri, 31 Jul 2020 06:45:16 +0900
MIME-Version: 1.0
In-Reply-To: <d21641e4-ad62-8cee-3479-98b059994661@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From da7b054019f8377b87a050a8b2544f2e5ace607d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 31 Jul 2020 00:28:42 +0900
Subject: [PATCH 2/2] toyrcu: Minor fixes

The floating snippet at the beginning of QQZ answer caused small skip
at the start of the answer part.
It might also cause an orphaned "Answer" heading.
Fix this by moving the snippet a few sentences down.

Note: I made a paragraph break in the middle of the long paragraph.

The other change is to use \O{} macro in the same way as the other
places.
I missed this one in commit 5e9a9c723a0b ("toyrcu: Use mathcal O for
'orders of'")

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/toyrcu/toyrcu.tex | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
index 6feff768..72211e39 100644
--- a/appendix/toyrcu/toyrcu.tex
+++ b/appendix/toyrcu/toyrcu.tex
@@ -78,7 +78,15 @@ preventing grace-period sharing.
 	\cref{lst:app:toyrcu:Lock-Based RCU Implementation}
 	also be a deadlock in any other RCU implementation?
 }\QuickQuizAnswerB{
-%
+	\begin{fcvref}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
+	Suppose the functions \co{foo()} and \co{bar()} in
+	\cref{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
+	are invoked concurrently from different CPUs.
+	Then \co{foo()} will acquire \co{my_lock()} on \clnref{foo:acq},
+	while \co{bar()} will acquire \co{rcu_gp_lock} on
+	\clnref{bar:rrl}.
+	\end{fcvref}
+
 \begin{listing}[tbp]
 \begin{fcvlabel}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
 \begin{VerbatimL}[commandchars=\\\[\]]
@@ -106,14 +114,8 @@ void bar(void)
 \caption{Deadlock in Lock-Based RCU Implementation}
 \label{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
 \end{listing}
-%
+
 	\begin{fcvref}[ln:app:toyrcu:Deadlock in Lock-Based RCU Implementation]
-	Suppose the functions \co{foo()} and \co{bar()} in
-	\cref{lst:app:toyrcu:Deadlock in Lock-Based RCU Implementation}
-	are invoked concurrently from different CPUs.
-	Then \co{foo()} will acquire \co{my_lock()} on \clnref{foo:acq},
-	while \co{bar()} will acquire \co{rcu_gp_lock} on
-	\clnref{bar:rrl}.
 	When \co{foo()} advances to \clnref{foo:rrl}, it will attempt to
 	acquire \co{rcu_gp_lock}, which is held by \co{bar()}.
 	Then when \co{bar()} advances to \clnref{bar:acq}, it will attempt
@@ -930,7 +932,7 @@ RCU implementation being used in production in real-life applications.
 	overhead that increases linearly with the number of threads.
 	Under what circumstances could an RCU implementation enjoy
 	lightweight implementations for all three of these primitives,
-	all having deterministic ($O\left(1\right)$) overheads and latencies?
+	all having deterministic ($\O{1}$) overheads and latencies?
 }\QuickQuizAnswer{
 	Special-purpose uniprocessor implementations of RCU can attain
 	this ideal~\cite{PaulEMcKenney2009BloatwatchRCU}.
-- 
2.17.1


