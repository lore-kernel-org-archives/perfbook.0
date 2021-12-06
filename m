Return-Path: <SRS0=KNbq=QX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7yC9ZUr1w2Vlx75e9eQax3XyWRX+JiPmqa/69RemM38=;
        b=WNRpq6Qi3KNj+3V/FykL2J1xpHmrgncI8vlv3rDY8suDQfR05Ntf+NCDAmYLCDbnFg
         Ll1WZaNefRbdOjVHZOXj/PCW4lGSw29FFTYWPwBhzvM4cH9yiccxGz6E2MhZHFinI5pE
         rtibN59fNCbLqDIiEA5Xf6nmda0PgdlzMdL/v0nqf8Dm1oymWf8DKE3SYZk7C7HduMsS
         WIlGLA5ISICdBiunm0BirUuHRBgos3tag/HFZ1idf5VsTi+SLZnYBAC+MBe5h0aSZZyj
         nx0XkScYCGUkNSbBkTctMv8foHB7L2bb9SP5dlmYNQ/eyj+2+Z7hAWgBXAEybNP5HLYj
         1Jig==
Subject: [PATCH 2/2] defer/rcuusage: Move float objects away of section titles
References: <739396e3-6ade-95cf-07dc-098cd8066bde@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cc2aa713-25e1-8daf-a381-609b7d217bfb@gmail.com>
Date: Mon, 6 Dec 2021 12:03:00 +0900
MIME-Version: 1.0
In-Reply-To: <739396e3-6ade-95cf-07dc-098cd8066bde@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Float objects are treated as page/column break candidates.
They can cause widowed section titles.

Move a pair of such objects in recently added contents.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 01342fda..9f2a428e 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -6,6 +6,14 @@
 \label{sec:defer:RCU Usage}
 \OriginallyPublished{Section}{sec:defer:RCU Usage}{RCU Usage}{Linux Weekly News}{PaulEMcKenney2008WhatIsRCUUsage}
 
+This section answers the question ``What is RCU?'' from the viewpoint
+of the uses to which RCU can be put.
+Because RCU is most frequently used to replace some existing mechanism,
+we look at it primarily in terms of its relationship to such mechanisms,
+as listed in \cref{tab:defer:RCU Usage}.
+Following the sections listed in this table,
+\cref{sec:defer:RCU Usage Summary} provides a summary.
+
 \begin{table}
 \renewcommand*{\arraystretch}{1.2}
 \centering
@@ -40,14 +48,6 @@ Quasi multi-version concurrency control (MVCC) &
 \label{tab:defer:RCU Usage}
 \end{table}
 
-This section answers the question ``What is RCU?'' from the viewpoint
-of the uses to which RCU can be put.
-Because RCU is most frequently used to replace some existing mechanism,
-we look at it primarily in terms of its relationship to such mechanisms,
-as listed in \cref{tab:defer:RCU Usage}.
-Following the sections listed in this table,
-\cref{sec:defer:RCU Usage Summary} provides a summary.
-
 \subsubsection{RCU for Pre-BSD Routing}
 \label{sec:defer:RCU for Pre-BSD Routing}
 
@@ -414,13 +414,6 @@ was shown in the previous sections.
 \subsubsection{Phased State Change}
 \label{sec:defer:Phased State Change}
 
-\begin{figure}
-\centering
-\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
-\caption{Phased State Change for Maintenance Operation}
-\label{fig:defer:Phased State Change for Maintenance Operation}
-\end{figure}
-
 \Cref{fig:defer:Phased State Change for Maintenance Operation}
 shows a timeline for an example phased state change to efficiently
 handle maintenance operations.
@@ -431,6 +424,13 @@ operations must be undertaken carefully, taking into account added
 complexities due to their running concurrently with that maintenance
 operation.
 
+\begin{figure}
+\centering
+\resizebox{\twocolumnwidth}{!}{\includegraphics{defer/RCUphasedstatechange}}
+\caption{Phased State Change for Maintenance Operation}
+\label{fig:defer:Phased State Change for Maintenance Operation}
+\end{figure}
+
 In the figure, these apparently conflicting requirements are resolved by
 having a prepare phase prior to the maintenance operation and a cleanup
 phase after it, during which the common-case operations can proceed
-- 
2.17.1


