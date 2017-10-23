Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yjPYUuVhw4ZCQyseQ1uPo4krkQQnZ/nufMFQICg3KaA=;
 b=kP5SL2EnGs7O6TKOKB2L1j2N1TXGewRidT7l6EUAXdRFcDTK3a/cuCsn2MtzIyK/gm
 KGRM4SOKhIUPeXdS7uH1ey5apzkHdZBQXnww/Lv3a0KMzaThSWHiNov7Dwyw6An2vUgb
 sRYcODYt5xpqMPKtm8CmRbmqMU8K5LQoNMz0eU1FfbpUdfI/FUy+PREf4TbUdA8L9z25
 PGuYu3dq2EymTCqxUDKH1PhoE91Z+KNZVzm0HP88Y+GNdoEFfcTmXrbvCnrcWIHhjnZe
 90u4YPPUL3zkFY/OrRdBg8zmwKDFiEjxLACvMqkWctDzKN0+MsVxyolChxibCpJp8iBe
 gBNQ==
Subject: [PATCH 3/3] Convert table of code fragments to 'listing'
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
 <20171023022430.GJ3659@linux.vnet.ibm.com>
 <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9f9a283b-df08-a7e4-0518-b9d6da09707e@gmail.com>
Date: Tue, 24 Oct 2017 00:30:09 +0900
MIME-Version: 1.0
In-Reply-To: <96ff162d-2670-3038-f9c8-c6921d4f374c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8f4cb48165bcd63d8fcbff966f7d3794a5c5863a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 23 Oct 2017 23:33:11 +0900
Subject: [PATCH 3/3] Convert table of code fragments to 'listing'

Also reduce font size to scriptsize.

NOTE: In these cases, the "ruled" style is not appropriate.
"plaintop" style is a better choice.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 38 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index 422948e..efd67c9 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -1345,12 +1345,15 @@ as we will see.\footnote{
 \subsection{Example 1}
 \label{sec:app:whymb:Example 1}

-Table~\ref{tab:app:whymb:Memory Barrier Example 1}
+Listing~\ref{lst:app:whymb:Memory Barrier Example 1}
 shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
 Each of ``a'', ``b'', and ``c'' are initially zero.

-\begin{table*}
-\small
+\floatstyle{plaintop}
+\restylefloat{listing}
+
+\begin{listing}
+\scriptsize
 \centering{\tt
 \begin{tabular}{l|l|l}
 	\multicolumn{1}{c|}{\nf{CPU~0}} &
@@ -1366,8 +1369,8 @@ Each of ``a'', ``b'', and ``c'' are initially zero.
 			 &		& assert(z == 0 || x == 1); \\
 \end{tabular}}
 \caption{Memory Barrier Example 1}
-\label{tab:app:whymb:Memory Barrier Example 1}
-\end{table*}
+\label{lst:app:whymb:Memory Barrier Example 1}
+\end{listing}

 Suppose CPU~0 recently experienced many cache misses, so that its
 message queue is full, but that CPU~1 has been running exclusively within
@@ -1405,12 +1408,12 @@ the assertion.
 \subsection{Example 2}
 \label{sec:app:whymb:Example 2}

-Table~\ref{tab:app:whymb:Memory Barrier Example 2}
+Listing~\ref{lst:app:whymb:Memory Barrier Example 2}
 shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
 Both ``a'' and ``b'' are initially zero.

-\begin{table*}
-\small
+\begin{listing}
+\scriptsize
 \centering{\tt
 \begin{tabular}{l|l|l}
 	\multicolumn{1}{c|}{\nf{CPU~0}} &
@@ -1425,8 +1428,8 @@ Both ``a'' and ``b'' are initially zero.
 		     &			& assert(y == 0 || x == 1); \\
 \end{tabular}}
 \caption{Memory Barrier Example 2}
-\label{tab:app:whymb:Memory Barrier Example 2}
-\end{table*}
+\label{lst:app:whymb:Memory Barrier Example 2}
+\end{listing}

 Again, suppose CPU~0 recently experienced many cache misses, so that its
 message queue is full, but that CPU~1 has been running exclusively within
@@ -1447,11 +1450,11 @@ mainstream computer systems.
 \subsection{Example 3}
 \label{sec:app:whymb:Example 3}

-Table~\ref{tab:app:whymb:Memory Barrier Example 3}
+Listing~\ref{lst:app:whymb:Memory Barrier Example 3}
 shows three code fragments, executed concurrently by CPUs~0, 1, and 2.
 All variables are initially zero.

-\begin{table*}
+\begin{listing*}
 \scriptsize
 \centering{\tt
 \begin{tabular}{r|l|l|l}
@@ -1471,8 +1474,11 @@ All variables are initially zero.
  9 &	e = 1; &			& assert(e == 0 || a == 1); \\
 \end{tabular}}
 \caption{Memory Barrier Example 3}
-\label{tab:app:whymb:Memory Barrier Example 3}
-\end{table*}
+\label{lst:app:whymb:Memory Barrier Example 3}
+\end{listing*}
+
+\floatstyle{ruled}
+\restylefloat{listing}

 Note that neither CPU~1 nor CPU~2 can proceed to line~5 until they see
 CPU~0's assignment to ``b'' on line~3.
@@ -1487,7 +1493,7 @@ Therefore, CPU~2's assertion on line~9 is guaranteed \emph{not} to fire.

 \QuickQuiz{}
 	Suppose that lines~3-5 for CPUs~1 and 2 in
-	Table~\ref{tab:app:whymb:Memory Barrier Example 3}
+	Listing~\ref{lst:app:whymb:Memory Barrier Example 3}
 	are in an interrupt
 	handler, and that the CPU~2's line~9 runs at process level.
 	In other words, the code in all three columns of the table
@@ -1524,7 +1530,7 @@ assert(r1 == 0 || a == 1);

 \QuickQuiz{}
 	If CPU~2 executed an \co{assert(e==0||c==1)} in the example in
-	Table~\ref{tab:app:whymb:Memory Barrier Example 3},
+	Listing~\ref{lst:app:whymb:Memory Barrier Example 3},
 	would this assert ever trigger?
 \QuickQuizAnswer{
 	The result depends on whether the CPU supports ``transitivity''.
-- 
2.7.4


