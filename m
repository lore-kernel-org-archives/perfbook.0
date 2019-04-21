Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4j8FfmTTCYa7m018rO8skYfz7VeaZBoFOlS584xwtrs=;
        b=JTXqXDjuNBEvgKbQ85PZ3sb7xLAevb0PoRbOZGVBZDrkxvC84RZEj9ZiTfgVLpUryl
         xcBFdXMxTF/ukKyhQAzoKPvEhrnlPHzlVUfInA0NS0zM9fzcXR9nqMoebTyZt3CaqSnh
         wLZImxqULvVChTA9Lpg2dv/jShxBH7hsF86KBX+odNiAKLLDB8r/513KJE99nH1fktWE
         WDDd2xDzJX1PTkbxU3d+jGCB1yHWd30lmOzdEw77h9vbZHy6f5YjHR2F117Sn8yy44S0
         FQqL9bB07w0R5LU5jbZSopibkCc7umQBClnGhP0tspHY9taFDoQKR8/xkX8VfXvSwh42
         fR2A==
Subject: [PATCH 4/4] formal/dyntickrcu: Adjust context and fix typo
References: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <483b9232-6dfc-5bae-026c-bba0f19cc4ea@gmail.com>
Date: Sun, 21 Apr 2019 19:10:32 +0900
MIME-Version: 1.0
In-Reply-To: <6cf9cea0-09ad-7a66-34b1-5ee5f52258bc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 199c8cb24044010e6079899cfb9e8cf97be78eee Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 16 Apr 2019 00:42:25 +0900
Subject: [PATCH 4/4] formal/dyntickrcu: Adjust context and fix typo

List of changes:
    o Remove redundant reference to Promela and Spin. (We are
      in the middle of that chapter.)
    o Mention compiler flags to reduce memory usage of Spin.
    o Update introduction of section organization.
    o Mention Linux kernel version whose code we are talking
      about.
    o Fix a trivial typo.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 2ba58cd3..4b7a8ade 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -44,7 +44,7 @@ interfaces called from the
 entry/exit functions.
 These \co{rcu_irq_enter()} and \co{rcu_irq_exit()}
 functions are needed to allow RCU to reliably handle situations where
-a dynticks-idle CPUs is momentarily powered up for an interrupt
+a dynticks-idle CPU is momentarily powered up for an interrupt
 handler containing RCU read-side critical sections.
 With these changes in place, Steve's system booted reliably,
 but Paul continued inspecting the code periodically on the assumption
@@ -58,8 +58,7 @@ illusory.
 
 Near the end of February, Paul grew tired of this game.
 He therefore decided to enlist the aid of
-Promela and Spin~\cite{Holzmann03a}, as described in
-Chapter~\ref{chp:Formal Verification}.
+Promela and Spin.
 The following presents a series of seven increasingly realistic
 Promela models, the last of which passes, consuming about
 40\,GB of main memory for the state space.
@@ -74,6 +73,9 @@ More important, Promela and Spin did find a very subtle bug for me!
 	Relax, there are a number of lawful answers to
 	this question:
 	\begin{enumerate}
+	\item	Try compiler flags \co{-DCOLLAPSE} and \co{-DMA=N}
+		to reduce memory consumption.
+		See Section~\ref{sec:formal:Running the QRCU Example}.
 	\item	Further optimize the model, reducing its memory consumption.
 	\item	Work out a pencil-and-paper proof, perhaps starting with the
 		comments in the code in the Linux kernel.
@@ -96,12 +98,11 @@ that has a smaller state space.
 Even better would be an algorithm so simple that its correctness was
 obvious to the casual observer!
 
-Section~\ref{sec:formal:Introduction to Preemptible RCU and dynticks}
-gives an overview of preemptible RCU's dynticks interface,
-Section~\ref{sec:formal:Validating Preemptible RCU and dynticks},
-and
-Section~\ref{sec:formal:Lessons (Re)Learned} lists
-lessons (re)learned during this effort.
+Sections~\ref{sec:formal:Introduction to Preemptible RCU and dynticks}-\ref{sec:formal:Grace-Period Interface}
+give an overview of preemptible RCU's dynticks interface,
+followed by
+Section~\ref{sec:formal:Validating Preemptible RCU and dynticks}'s
+discussion of the validation of the interface.
 
 \subsubsection{Introduction to Preemptible RCU and dynticks}
 \label{sec:formal:Introduction to Preemptible RCU and dynticks}
@@ -126,7 +127,7 @@ determine when a dynticks-idle CPU may safely be ignored.
 The following three sections give an overview of the task
 interface, the interrupt/NMI interface, and the use of
 the \co{dynticks_progress_counter} variable by the
-grace-period machinery.
+grace-period machinery as of Linux kernel v2.6.25-rc4.
 
 \subsubsection{Task Interface}
 \label{sec:formal:Task Interface}
@@ -438,10 +439,16 @@ code.
 \label{sec:formal:Validating Preemptible RCU and dynticks}
 
 This section develops a Promela model for the interface between
-dynticks and RCU step by step, with each of the following sections
+dynticks and RCU step by step, with each of
+Sections~\ref{sec:formal:Basic Model}-\ref{sec:formal:Validating NMI Handlers}
 illustrating one step, starting with the process-level code,
 adding assertions, interrupts, and finally NMIs.
 
+Section~\ref{sec:formal:Lessons (Re)Learned} lists
+lessons (re)learned during this effort, and
+Sections~\ref{sec:formal:Simplicity Avoids Formal Verification}-\ref{sec:formal:Discussion}
+present a simpler solution to RCU's dynticks problem.
+
 \subsubsection{Basic Model}
 \label{sec:formal:Basic Model}
 
@@ -1196,6 +1203,8 @@ for \IRQ s and NMIs, as has been done for
 hierarchical RCU~\cite{PaulEMcKenney2008HierarchicalRCU}
 as indirectly suggested by
 Manfred Spraul~\cite{ManfredSpraul2008StateMachineRCU}.
+This work was pulled into mainline kernel during the v2.6.29
+development cycle~\cite{PaulEMcKenney2008commit:64db4cfff99c}.
 
 \subsubsection{State Variables for Simplified Dynticks Interface}
 \label{sec:formal:State Variables for Simplified Dynticks Interface}
-- 
2.17.1


