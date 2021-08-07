Return-Path: <SRS0=R++e=M6=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1ziJg5yoQ3zsC6hbKYTUkKa1Dg6nIDroPCyV3ugQRlI=;
        b=ECJznPWy7h7pLvdhrtSvuAq7BKcr125Of838x/vo3gUJrD7dWBiPKGDLQrcG48/h52
         yPp67PbjGA9pm9RDl5T70+ZYccpzktcYPARHC/E8Os/GuAONmoV9iIlz10SayWc5uSEc
         ANWxTpLDTSo/4UIw3qMMo+RJ1osP7XHz0SHIFlRtVQMQn04roTlYSbyWEPciFF89T9Oq
         xManU5dfkFkeP2ln7Lcm+tuzNGxeTI0IS/95nnyDlkn0vZedt0wSkYox7E6PfeF0Ozj+
         D1beaBdgsW4hS8/xsxNPu1G5KJE3l5uLTloEWCn4O8+v4wBINN9QZI5DtfyLt460XPkA
         iFLw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] cpu/overheads: Add missing unbreakable spaces
Date: Sat,  7 Aug 2021 09:05:04 +0200
Message-Id: <20210807070504.31076-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds missing unbreakable spaces in 'cpu/'.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 cpu/overheads.tex | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 28462d49..2cfe931b 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -48,21 +48,21 @@ events might ensue:
 \begin{enumerate}
 \item	CPU~0 checks its local cache, and does not find the cacheline.
 	It therefore records the write in its store buffer.
-\item	A request for this cacheline is forwarded to CPU~0's and 1's
+\item	A request for this cacheline is forwarded to CPU~0's and~1's
 	interconnect, which checks CPU~1's local cache, and does not
 	find the cacheline.
 \item	This request is forwarded to the system interconnect, which
 	checks with the other three dies, learning that the cacheline
-	is held by the die containing CPU~6 and 7.
-\item	This request is forwarded to CPU~6's and 7's interconnect, which
+	is held by the die containing CPU~6 and~7.
+\item	This request is forwarded to CPU~6's and~7's interconnect, which
 	checks both CPUs' caches, finding the value in CPU~7's cache.
 \item	CPU~7 forwards the cacheline to its interconnect, and also
 	flushes the cacheline from its cache.
-\item	CPU~6's and 7's interconnect forwards the cacheline to the
+\item	CPU~6's and~7's interconnect forwards the cacheline to the
 	system interconnect.
-\item	The system interconnect forwards the cacheline to CPU~0's and 1's
+\item	The system interconnect forwards the cacheline to CPU~0's and~1's
 	interconnect.
-\item	CPU~0's and 1's interconnect forwards the cacheline to CPU~0's
+\item	CPU~0's and~1's interconnect forwards the cacheline to CPU~0's
 	cache.
 \item	CPU~0 can now complete the write, updating the relevant portions
 	of the newly arrived cacheline from the value previously
@@ -106,7 +106,7 @@ events might ensue:
 	Why is it necessary to flush the cacheline from CPU~7's cache?
 }\QuickQuizAnswerE{
 	If the cacheline was not flushed from CPU~7's cache, then
-	CPUs~0 and 7 might have different values for the same set
+	CPUs~0 and~7 might have different values for the same set
 	of variables in the cacheline.
 	This sort of incoherence greatly complicates parallel software,
 	which is why so wise hardware architects avoid it.
@@ -358,7 +358,7 @@ thousand clock cycles.
 	threads.
 	Smaller systems often achieve better latency, as may be seen in
 	\cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System},
-	which represents a much smaller system with only 16 hardware threads.
+	which represents a much smaller system with only 16~hardware threads.
 	A similar view is provided by the rows of
 	\cref{tab:cpu:CPU 0 View of Synchronization Mechanisms on 8-Socket System With Intel Xeon Platinum 8176 CPUs at 2.10GHz}
 	down to and including the two ``Off-core'' rows.
-- 
2.17.1

