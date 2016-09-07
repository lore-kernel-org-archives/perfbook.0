Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=KBqZbo+VMyO2DVnpzDNSlux5RlxQOoF0DOLkOngiQw8=;
 b=fcAfIaN9lR6a+ZO9nyKowYT6NdwkAayxGDY98a+AqxpZtPm3FfsPvCZIWF4k8DFcjy
 4Q58FTC6Mm486ue2Kqp3cW715/t0D35nAECP17ca9FJAIzNCHI2g3Sx+njwsYEPC+56F
 BYDT28YXBFALKiGZGvmfEbYupuzEZrIjzwug87JqnpYd3fZ8bPvdX87jfjfEUCJQ9wR4
 uvC7CUncnd3kfv+rNyBYm7Y+Te0VNKWCh9I+n50TZoN+0Eo9lKL4TAhFSLXCqtJkg1zU
 Pt9/9c8w7k4FfAwaTqYhYo0DpGj/fPu1O+10W2lQzGd9lmmvoumcIhemZxGRXWWorbnq
 LS8Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment
Message-ID: <b76692c9-330c-2531-67dd-b7f445644227@gmail.com>
Date: Thu, 8 Sep 2016 00:47:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 480c37c4749ae4957791636e84e77566265613c2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 8 Sep 2016 00:20:29 +0900
Subject: [PATCH] TRIAL: Indentation tweaks around 'verbbox' environment

This is a trial commit to avoid the side-effect of the "verbbox"
environment, i.e., when it is used just after a section heading,
the following paragraph loses implicit non-indentation.

This commit moves such a "verbbox" environment *before* the section
heading.

There are also cases where two "verbbox" environments are placed just
after section headings. To accommodate such cases, one of such
"verbbox" need to be replaced with "myverbbox" environment to give
another temporary verbatimbox content holder.

This commit includes an example of such a case.

Note that the "myverbbox" environment is provided in recent versions
of the "verbatimbox" package, namely after v3.0.

If you have older versions of "verbatimbox" package, you need to
update. Also the newer one requires the "readarray" package.

Please make sure you have those required packages.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/toyrcu.tex | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/defer/toyrcu.tex b/defer/toyrcu.tex
index cd334ed..01da2cc 100644
--- a/defer/toyrcu.tex
+++ b/defer/toyrcu.tex
@@ -30,9 +30,6 @@ and free-running counters.
 Finally, Section~\ref{defer:Summary of Toy RCU Implementations}
 provides a summary and a list of desirable RCU properties.

-\subsubsection{Lock-Based RCU}
-\label{defer:Lock-Based RCU}
-
 { \scriptsize
 \begin{verbbox}
   1 static void rcu_read_lock(void)
@@ -52,6 +49,10 @@ provides a summary and a list of desirable RCU properties.
  15 }
 \end{verbbox}
 }
+
+\subsubsection{Lock-Based RCU}
+\label{defer:Lock-Based RCU}
+
 \begin{figure}[bp]
 \centering
 \theverbbox
@@ -434,9 +435,6 @@ suitable for a high-stress debugging environment.
 The next section describes a variation on the reference-counting
 scheme that is more favorable to writers.

-\subsubsection{Starvation-Free Counter-Based RCU}
-\label{defer:Starvation-Free Counter-Based RCU}
-
 { \scriptsize
 \begin{verbbox}
   1 DEFINE_SPINLOCK(rcu_gp_lock);
@@ -446,15 +444,9 @@ scheme that is more favorable to writers.
   5 DEFINE_PER_THREAD(int, rcu_read_idx);
 \end{verbbox}
 }
-\begin{figure}[tbp]
-\centering
-\theverbbox
-\caption{RCU Global Reference-Count Pair Data}
-\label{fig:defer:RCU Global Reference-Count Pair Data}
-\end{figure}

 { \scriptsize
-\begin{verbbox}
+\begin{myverbbox}{\verbboxa}
   1 static void rcu_read_lock(void)
   2 {
   3   int i;
@@ -483,11 +475,22 @@ scheme that is more favorable to writers.
  26   }
  27   __get_thread_var(rcu_nesting) = n - 1;
  28 }
-\end{verbbox}
+\end{myverbbox}
 }
+
+\subsubsection{Starvation-Free Counter-Based RCU}
+\label{defer:Starvation-Free Counter-Based RCU}
+
 \begin{figure}[tbp]
 \centering
 \theverbbox
+\caption{RCU Global Reference-Count Pair Data}
+\label{fig:defer:RCU Global Reference-Count Pair Data}
+\end{figure}
+
+\begin{figure}[tbp]
+\centering
+\verbboxa
 \caption{RCU Read-Side Using Global Reference-Count Pair}
 \label{fig:defer:RCU Read-Side Using Global Reference-Count Pair}
 \end{figure}
-- 
1.9.1

