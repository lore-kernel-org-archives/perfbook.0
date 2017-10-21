Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kwSVjqPCX7o4cQN6D5byjgPZ+APiHIfysJX16FtAu48=;
 b=H5Tbjyj6tUkfsEi+xHW8eLRJqqv9GxZredI39cW/RqnhHhWHCmrHGl7NAsfxTrYtqC
 XMieaSOMZN69kViWUpAeyO/qjSOiDFpMwbxcFHLF2usqw9gd70S3YP9vAhMdRnx60xWe
 Cjb0uo/dLkUs+lNr3RpZEq3W9l1WRhDBFJQvZ54mzZLLOaE68cRr1dIKciZ0Mg6ZdYlp
 DySCr4WQTs6PQa6rz0JhMIi8/DuDNZEmeuekpC9SA3hWuKwGXaWxMJ/K18SFDcmyZFjZ
 wUFQyTCJnuq7HhUFs45zTg3anR0tGyG/w2VeEDlUsmGDFRoZEOoyZFgNXqeZwEtyYQc3
 txpA==
Subject: [PATCH 2/3] Remove trademark and registered symbols in text
References: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5b6d6358-4cc2-12bf-14a6-66a00acbe2c2@gmail.com>
Date: Sat, 21 Oct 2017 09:09:20 +0900
MIME-Version: 1.0
In-Reply-To: <6d7b64ad-0a50-74f9-cae4-5800334e5569@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 75d006892f834a75f6901d666d0276722ce276f5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 21 Oct 2017 08:25:47 +0900
Subject: [PATCH 2/3] Remove trademark and registered symbols in text

The Legal page should have covered these trade marks.

Instead of removing the macros, substitute custom macros for them.
When a part of the text will be exported as a separate document,
these macros can be defined to output actual symbols as are shown
in comment in perfbook.tex.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/beyond.tex      | 4 ++--
 datastruct/datastruct.tex | 4 ++--
 memorder/memorder.tex     | 4 ++--
 perfbook.tex              | 4 ++++
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/SMPdesign/beyond.tex b/SMPdesign/beyond.tex
index 65f2518..72862c5 100644
--- a/SMPdesign/beyond.tex
+++ b/SMPdesign/beyond.tex
@@ -195,7 +195,7 @@ Lines~8-9 of this listing must use fetch-and-add to arbitrate concurrent
 attempts to record cells in the \co{->visited[]} array.

 This approach does provide significant speedups on a dual-CPU
-Lenovo\textsuperscript\texttrademark W500
+Lenovo\mytexttrademark\ W500
 running at 2.53\,GHz, as shown in
 Figure~\ref{fig:SMPdesign:CDF of Solution Times For SEQ and PWQ},
 which shows the cumulative distribution functions (CDFs) for the solution
@@ -575,7 +575,7 @@ the solution line.
 This disappointing performance compared to results in
 Figure~\ref{fig:SMPdesign:Varying Maze Size vs. COPART}
 is due to the less-tightly integrated hardware available in the
-larger and older Xeon\textsuperscript\textregistered
+larger and older Xeon\mytextregistered\
 system running at 2.66\,GHz.

 \subsection{Future Directions and Conclusions}
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index e6c3f17..c5038b6 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -394,8 +394,8 @@ The \co{hashtab_free()} function on lines~20-23 is straightforward.
 \end{figure}

 The performance results for an eight-CPU 2\,GHz
-Intel\textsuperscript\textregistered
-Xeon\textsuperscript\textregistered
+Intel\mytextregistered\
+Xeon\mytextregistered\
 system using a bucket-locked hash table with 1024 buckets are shown in
 Figure~\ref{fig:datastruct:Read-Only Hash-Table Performance For Schroedinger's Zoo}.
 The performance does scale nearly linearly, but is not much more than half
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 752e321..bd3af16 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -4408,7 +4408,7 @@ barrier.
 \subsection{\Power{} / PowerPC}
 \label{sec:memorder:POWER / PowerPC}

-The \Power{} and PowerPC\textsuperscript{\textregistered}
+The \Power{} and PowerPC\mytextregistered\
 CPU families have a wide variety of memory-barrier
 instructions~\cite{PowerPC94,MichaelLyons05a}:
 \begin{description}
@@ -4623,7 +4623,7 @@ it~\cite[Section 8.1.3]{Intel64IA32v3A2011}.

 \subsection{z Systems}

-The z~Systems machines make up the IBM\textsuperscript{\texttrademark}
+The z~Systems machines make up the IBM\mytexttrademark\
 mainframe family, previously
 known as the 360, 370, 390 and zSeries~\cite{IBMzSeries04a}.
 Parallelism came late to z~Systems, but given that these mainframes first
diff --git a/perfbook.tex b/perfbook.tex
index 049f028..1c23b3a 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -146,6 +146,10 @@
 %\newcommand{\GCC}{\co{gcc}} % For those who prefer "gcc"
 \newcommand{\IRQ}{IRQ}
 %\newcommand{\IRQ}{irq}      % For those who prefer "irq"
+\newcommand{\mytexttrademark}{}
+\newcommand{\mytextregistered}{}
+%\newcommand{\mytexttrademark}{\textsuperscript\texttrademark}
+%\newcommand{\mytextregistered}{\textsuperscript\textregistered}

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

-- 
2.7.4


