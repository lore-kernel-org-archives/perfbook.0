Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=kFuspK1F0g1Ix9fBNiNJ3zcsb7oCuefBG72QiDeY1EA=;
 b=AfJUv49Y5DOdePO4mtFtq3RaPkp/wrCq2YYezXYKKozFjw4aB6kmM+4I0MKt9hPLsE
 EVqbAVzszadXG4ql/1/OUN2nB9E2UGqpVdvyp8GuC/iwOV+u0y3HuBRbKz1+lBvJoQJg
 J8v+wYp5YCil7nFOBay8O22q76wGxT7uAB/lxKdosA12N5WbfjCCFyWS0RAIiesVzb2y
 LoyWm9X+AiNfOwE8TOgG88Rv3TXfSiRAtysXv/+aWPkhFSLxFIhLGqdiL/rHLqBP5KNN
 7//hbEYJkGpYJdSjOQKtGr1JcV6pT23aP7Uwy0C6Ox0bfIZfkp9gL7hZ+GAWRrVI/Idn
 PTqw==
Subject: [PATCH 4/5] formal: Convert to 'description'
References: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0945bab3-3f56-7420-7c69-b634e1a361d7@gmail.com>
Date: Fri, 10 Mar 2017 00:27:07 +0900
MIME-Version: 1.0
In-Reply-To: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 040963d9bd65a17500a5ccff5603505decc1e513 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:54:32 +0900
Subject: [PATCH 4/5] formal: Convert to 'description'

These lists look better in "description" environment with
"nextline" style. The style is good because of variation of
label lengths. Note that colons at the tails of labels are removed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 14 +++++++-------
 formal/spinhint.tex   | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 50e87d8..16d1f73 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1890,33 +1890,33 @@ the NMI code path will also reference (but not modify) the
 \co{dynticks_nesting} variable.
 These variables are used as follows:

-\begin{itemize}
-\item	\co{dynticks_nesting}:
+\begin{description}[style=nextline]
+\item	[\tco{dynticks_nesting}]
 	This counts the number of reasons that the corresponding
 	CPU should be monitored for RCU read-side critical sections.
 	If the CPU is in dynticks-idle mode, then this counts the
 	irq nesting level, otherwise it is one greater than the
 	irq nesting level.
-\item	\co{dynticks}:
+\item	[\tco{dynticks}]
 	This counter's value is even if the corresponding CPU is
 	in dynticks-idle mode and there are no irq handlers currently
 	running on that CPU, otherwise the counter's value is odd.
 	In other words, if this counter's value is odd, then the
 	corresponding CPU might be in an RCU read-side critical section.
-\item	\co{dynticks_nmi}:
+\item	[\tco{dynticks_nmi}]
 	This counter's value is odd if the corresponding CPU is
 	in an NMI handler, but only if the NMI arrived while this
 	CPU was in dyntick-idle mode with no irq handlers running.
 	Otherwise, the counter's value will be even.
-\item	\co{dynticks_snap}:
+\item	[\tco{dynticks_snap}]
 	This will be a snapshot of the \co{dynticks} counter, but
 	only if the current RCU grace period has extended for too
 	long a duration.
-\item	\co{dynticks_nmi_snap}:
+\item	[\tco{dynticks_nmi_snap}]
 	This will be a snapshot of the \co{dynticks_nmi} counter, but
 	again only if the current RCU grace period has extended for too
 	long a duration.
-\end{itemize}
+\end{description}

 If both \co{dynticks} and \co{dynticks_nmi} have taken on an even
 value during a given time interval, then the corresponding CPU has
diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 906de31..eb029ca 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -389,10 +389,10 @@ elaborate examples.

 Given a source file \path{qrcu.spin}, one can use the following commands:

-\begin{itemize}
-\item	\co{spin -a qrcu.spin}
+\begin{description}[style=nextline]
+\item	[\tco{spin -a qrcu.spin}]
 	Create a file \path{pan.c} that fully searches the state machine.
-\item	\co{cc -DSAFETY -o pan pan.c}
+\item	[\tco{cc -DSAFETY -o pan pan.c}]
 	Compile the generated state-machine search.  The \co{-DSAFETY}
 	generates optimizations that are appropriate if you have only
 	assertions (and perhaps \co{never} statements).  If you have
@@ -405,7 +405,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	An example situation where you cannot use \co{-DSAFETY} is
 	when checking for livelocks (AKA ``non-progress cycles'')
 	via \co{-DNP}.
-\item	\co{./pan}
+\item	[\tco{./pan}]
 	This actually searches the state space.  The number of states
 	can reach into the tens of millions with very small state
 	machines, so you will need a machine with large memory.
@@ -431,13 +431,13 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	you will also need the \co{-a} argument.
 	% forward reference to model: formal.2009.02.19a in
 	% /home/linux/git/userspace-rcu/formal-model.
-\item	\co{spin -t -p qrcu.spin}
+\item	[\tco{spin -t -p qrcu.spin}]
 	Given \co{trail} file output by a run that encountered an
 	error, output the sequence of steps leading to that error.
 	The \co{-g} flag will also include the values of changed
 	global variables, and the  \co{-l} flag will also include
 	the values of changed local variables.
-\end{itemize}
+\end{description}

 \subsubsection{Promela Peculiarities}
 \label{sec:formal:Promela Peculiarities}
-- 
2.7.4


