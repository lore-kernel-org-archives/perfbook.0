Return-Path: <SRS0=tsBt=3K=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6KEl+Xp1tMy4setjARPUI3Mxc+yn0Lixlms/OL1liOY=;
        b=gSTc7xEaOBrbLOgtPmroV56N9rnRhTF+jK7jErJwu6m+A+OBBrxZ1bnwMnnQAnVRzv
         +Bi6jRqWk0GoSrOlIdUOg5333zGHjKVxkeFEHJBmqNZGARZ+1pXdIXhh085s2RIN8tEs
         aIEcb7E3dSm6DznFXO6IJ2uSrDId06hBH6tQNkWr//9SANYL2x651KnO55Ee1akt+LsE
         6rgpPsFoihPd/eyg3mB522h3GOpd8uu7gHcHaQ73oLpxnUy3530slI2/0+77IJcMu2OR
         OfCriGKuJefEHb7wrHJUejAuKfjHC0erwXSBUSbZ1gMsj9GoR/xEpAFRuLsBp9gKZZnb
         HZ/Q==
Subject: [PATCH 2/2] count: Move floats away from top of sections
References: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17ff4f4b-7d78-8a6c-a012-4d1243e52c24@gmail.com>
Date: Wed, 22 Jan 2020 07:38:01 +0900
MIME-Version: 1.0
In-Reply-To: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 4ffdccdb87f3ae8663b3d9bda7bec4528e68c456 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 22 Jan 2020 00:15:39 +0900
Subject: [PATCH 2/2] count: Move floats away from top of sections

At the top of a few sections, there remain floats left over in
commit e589003f0a1b ("Prevent section heading from orphaned").
This commit moves them.

Fixes: e589003f0a1b ("Prevent section heading from orphaned")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 2b1bbff9..032f3a3c 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -161,12 +161,6 @@ are more appropriate for advanced students.
 %
 \epigraph{Seek simplicity, and distrust it.}{\emph{Alfred North Whitehead}}
 
-\begin{listing}[tbp]
-\input{CodeSamples/count/count_nonatomic@inc-read.fcv}
-\caption{Just Count!}
-\label{lst:count:Just Count!}
-\end{listing}
-
 Let's start with something simple, for example, the straightforward
 use of arithmetic shown in
 Listing~\ref{lst:count:Just Count!} (\path{count_nonatomic.c}).
@@ -176,6 +170,12 @@ line~\lnref{inc}, and we read out its value on line~\lnref{read}.
 What could be simpler?
 \end{lineref}
 
+\begin{listing}[tbp]
+\input{CodeSamples/count/count_nonatomic@inc-read.fcv}
+\caption{Just Count!}
+\label{lst:count:Just Count!}
+\end{listing}
+
 This approach has the additional advantage of being blazingly fast if
 you are doing lots of reading and almost no incrementing, and on small
 systems, the performance is excellent.
@@ -2260,6 +2260,12 @@ atomic operations are not necessary, as shown in the next section.
 \subsection{Signal-Theft Limit Counter Design}
 \label{sec:count:Signal-Theft Limit Counter Design}
 
+Even though per-thread state will now be manipulated only by the
+corresponding thread, there will still need to be synchronization
+with the signal handlers.
+This synchronization is provided by the state machine shown in
+Figure~\ref{fig:count:Signal-Theft State Machine}.
+
 \begin{figure}[tb]
 \centering
 \resizebox{2in}{!}{\includegraphics{count/sig-theft}}
@@ -2267,11 +2273,6 @@ atomic operations are not necessary, as shown in the next section.
 \label{fig:count:Signal-Theft State Machine}
 \end{figure}
 
-Even though per-thread state will now be manipulated only by the
-corresponding thread, there will still need to be synchronization
-with the signal handlers.
-This synchronization is provided by the state machine shown in
-Figure~\ref{fig:count:Signal-Theft State Machine}.
 The state machine starts out in the IDLE state, and when \co{add_count()}
 or \co{sub_count()} find that the combination of the local thread's count
 and the global count cannot accommodate the request, the corresponding
@@ -2811,9 +2812,6 @@ Section~\ref{sec:count:Parallel Counting Lessons}
 enumerates lessons learned and calls attention to later chapters that
 will expand on these lessons.
 
-\subsection{Parallel Counting Performance}
-\label{sec:count:Parallel Counting Performance}
-
 \begin{table*}
 \rowcolors{4}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
@@ -2859,6 +2857,9 @@ will expand on these lessons.
 \label{tab:count:Statistical/Limit Counter Performance on x86}
 \end{table*}
 
+\subsection{Parallel Counting Performance}
+\label{sec:count:Parallel Counting Performance}
+
 The top half of \cref{tab:count:Statistical/Limit Counter Performance on x86}
 shows the performance of the four parallel statistical counting
 algorithms.
-- 
2.17.1


