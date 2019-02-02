Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U7trbG29eSvyDmt2GWuj46tSGzocs1hTrLbbPU9qHNg=;
        b=B1fh6FCz6AX9EInz2Clngm7J3/BZ9E/rfA0kg7452OvYR2P3Rh7eju+4L+CkXw/EYT
         4OJ7L912r+bEnOxX3mIzHGtNZJ9OawscmSPvfLnmnRBuK+0IH6HlMBQQaTjs9MK7L9bd
         YbwvEMLcyFaskZ9NeEta7Egbskh2vjj/2ck0DqJVkjZ5C1XhBiYdcuQLwu9Fh937lW7B
         Qfo7KTMG7xqRTgVy+QyePOLHDgT2rs7TPYEtm0fx9UEj+NxqCYin2JC+VWRr1NZpOUU6
         aTUzJMk/hGhpe8Q/Km2bFknb9HT1AC9UFUPZpIxvDF2HtcbHj6uYfI1XIPw12sFBIR51
         Nseg==
Subject: [PATCH 6/6] formal/spinhint: Use \co{...} rather than {\tt ...}
References: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fc164e74-1187-1ea5-f1d1-6d360522a7d6@gmail.com>
Date: Sun, 3 Feb 2019 00:15:47 +0900
MIME-Version: 1.0
In-Reply-To: <db974b96-dd4f-dce2-44a5-1b33f5ed495e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 211a647f0530d7c7fbdab93ae5e76e71e04295f6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 2 Feb 2019 20:00:36 +0900
Subject: [PATCH 6/6] formal/spinhint: Use \co{...} rather than {\tt ...}

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a13374a..d99254e 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -99,9 +99,9 @@ we lose no verification coverage by making them atomic.
 
 The \co{do-od} construct on lines~\lnref{dood1:b}-\lnref{dood1:e}
 implements a Promela loop,
-which can be thought of as a C {\tt for (;;)} loop containing a
+which can be thought of as a C \co{for (;;)} loop containing a
 \co{switch} statement that allows expressions in case labels.
-The condition blocks (prefixed by {\tt ::})
+The condition blocks (prefixed by \co{::})
 are scanned non-deterministically,
 though in this case only one of the conditions can possibly hold at a given
 time.
@@ -190,7 +190,7 @@ It is easy to fix this example by placing the body of the incrementer
 processes in an atomic blocks as shown in
 Listing~\ref{lst:analysis:Promela Code for Atomic Increment}.
 One could also have simply replaced the pair of statements with
-{\tt counter = counter + 1}, because Promela statements are
+\co{counter = counter + 1}, because Promela statements are
 atomic.
 Either way, running this modified model gives us an error-free traversal
 of the state space, as shown in
@@ -223,7 +223,7 @@ Listing~\ref{lst:analysis:Atomic Increment spin Output}.
 Table~\ref{tab:advsync:Memory Usage of Increment Model}
 shows the number of states and memory consumed
 as a function of number of incrementers modeled
-(by redefining {\tt NUMPROCS}):
+(by redefining \co{NUMPROCS}):
 
 Running unnecessarily large models is thus subtly discouraged, although
 882\,MB is well within the limits of modern desktop and laptop machines.
@@ -571,15 +571,15 @@ As expected, this run has no assertion failures (``errors: 0'').
 \QuickQuizAnswer{
 	There are several:
 	\begin{enumerate}
-	\item	The declaration of {\tt sum} should be moved to within
+	\item	The declaration of \co{sum} should be moved to within
 		the init block, since it is not used anywhere else.
 	\item	The assertion code should be moved outside of the
 		initialization loop.  The initialization loop can
 		then be placed in an atomic block, greatly reducing
 		the state space (by how much?).
 	\item	The atomic block covering the assertion code should
-		be extended to include the initialization of {\tt sum}
-		and {\tt j}, and also to cover the assertion.
+		be extended to include the initialization of \co{sum}
+		and \co{j}, and also to cover the assertion.
 		This also reduces the state space (again, by how
 		much?).
 	\end{enumerate}
-- 
2.7.4


