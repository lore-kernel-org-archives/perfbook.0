Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YDYJPyI4OvJTsVuJNQhsMPDXg10kAVPyj0bY/Ta3kTo=;
        b=XQgR2qNoV+lTOwFwuN/QKr8b8mw6kwyqS6Wnpt4tvB2CgsEAPSoHCPIDOckLWBuC56
         2W1eu6qDaiwVjiVE9mnLgokD9bFKGFowImMPSrsJxE356esA8RJrGwdSBSFLxE9CIYlv
         SsGPf3xYWAJmsIRT8Ejn/x2+vZW6eyYAV+Wx4Ta1/mo7xsdiYend6NQwchlTLVZT9xOG
         HFduUdfQ2HHbwRVFCxANA0qZFoG6iyeLt4vak36K6Ak4nKjL31CoabM+MoZbKwiJYdKs
         TNGfKn2fKjA/FjbobO8AWLc3jcYOAVqOrUcca+dyyXDuNVEg20UquhhKnmwMx7Nt/YXB
         JNUQ==
Subject: [PATCH 8/9] toolsoftrade: Example of extraction of snippet from
 parallel.sh
References: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <86cb7863-6362-4650-2aaf-578bdee100c2@gmail.com>
Date: Sun, 23 Sep 2018 16:32:49 +0900
MIME-Version: 1.0
In-Reply-To: <b0d4c5e6-6a4c-c475-422d-328eebba4fb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0165c8b80522c46743850978e2756da2190a12ec Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 30 Aug 2018 22:40:40 +0900
Subject: [PATCH 8/9] toolsoftrade: Example of extraction of snippet from parallel.sh

This is a POC of extraction from a .sh file.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/toolsoftrade/parallel.sh | 20 +++++++++++---------
 toolsoftrade/toolsoftrade.tex        | 12 ++----------
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/CodeSamples/toolsoftrade/parallel.sh b/CodeSamples/toolsoftrade/parallel.sh
index 6b87a2a..760dda6 100644
--- a/CodeSamples/toolsoftrade/parallel.sh
+++ b/CodeSamples/toolsoftrade/parallel.sh
@@ -26,15 +26,17 @@ function compute_it {
 	sleep 5
 }
 
-echo Computing in parallel starting at `date`
-compute_it 1 > compute_it.1.out &
-compute_it 2 > compute_it.2.out &
-wait
-echo Computing in parallel finished at `date`
-echo Computation \"output\":
-cat compute_it.1.out
-cat compute_it.2.out
-rm compute_it.1.out compute_it.2.out
+# \begin{snippet}[labelbase=ln:toolsoftrade:parallel:compute_it,commandchars=\\\{\},style=N]
+echo Computing in parallel starting at `date`	#\fcvexclude
+compute_it 1 > compute_it.1.out &		#\lnlbl{comp1}
+compute_it 2 > compute_it.2.out &		#\lnlbl{comp2}
+wait						#\lnlbl{wait}
+echo Computing in parallel finished at `date`	#\fcvexclude
+echo Computation \"output\":			#\fcvexclude
+cat compute_it.1.out				#\lnlbl{cat1}
+cat compute_it.2.out				#\lnlbl{cat2}
+rm compute_it.1.out compute_it.2.out		#\fcvexclude
+# \end{snippet}
 
 echo
 echo Computing sequentially starting at `date`
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index ece92f1..d21bda0 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -42,15 +42,7 @@ For example, suppose that you had a program \co{compute_it}
 that you needed to run twice with two different sets of arguments.
 This can be accomplished using UNIX shell scripting as follows:
 
-\begin{linelabel}[ln:toolsoftrade:jobcontrol:script]
-\begin{VerbatimN}[commandchars=\\\{\}]
-compute_it 1 > compute_it.1.out & \lnlbl{comp1}
-compute_it 2 > compute_it.2.out & \lnlbl{comp2}
-wait \lnlbl{wait}
-cat compute_it.1.out \lnlbl{cat1}
-cat compute_it.2.out \lnlbl{cat2}
-\end{VerbatimN}
-\end{linelabel}
+\input{CodeSamples/toolsoftrade/parallel@compute_it.fcv}
 
 \begin{figure}[tb]
 \centering
@@ -59,7 +51,7 @@ cat compute_it.2.out \lnlbl{cat2}
 \label{fig:toolsoftrade:Execution Diagram for Parallel Shell Execution}
 \end{figure}
 
-\begin{lineref}[ln:toolsoftrade:jobcontrol:script]
+\begin{lineref}[ln:toolsoftrade:parallel:compute_it]
 Lines~\lnref{comp1} and~\lnref{comp2} launch two instances of this
 program, redirecting their
 output to two separate files, with the \co{&} character directing the
-- 
2.7.4


