Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/OTb4Ks8P5eYTwfcL/A/NqWNlZj/TisIS/S+f8ZsVXE=;
        b=MwH0tCfQ/pStEpWZcd8LhdtX9ZO1qk6SsLd1FJGD02HBn4vw/R9lGRv6K1xTGihzRu
         dGw61oKVAcJv/QMEfqaI8syUGVyeK6GbBlnebYQZ12Kr6KLwsbba5IpOgfSPZrdv2eY1
         cnP+vgOF6mkN5W08etGJeIKucN1Clb89F3QEPn0efEapuY/EQcgHy76rTfoT3CyZZFeb
         XLL2sC7KcN5OvOSsb43Z7LSUGw8YKL2d30Cq+kAYs2/Vvb6ODBhIvAK9miskzKWo5KPP
         SzC69VkQfnou2clq8J4q0pID3qEGpEd4wdRTbLC80O/1iKq1LC9nDKjtfZxom2CrDR9r
         ZiOw==
Subject: [PATCH 4/6] appendix/ack: Use \Cref{} for cross references in
 reviewers list
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e1fcbae1-a77d-0679-8b4d-148e6669c575@gmail.com>
Date: Tue, 3 Dec 2019 00:19:09 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 82ef05b1df7feaf48f2eac9d6555126a27c3fce1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Nov 2019 23:34:42 +0900
Subject: [PATCH 4/6] appendix/ack: Use \Cref{} for cross references in reviewers list

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/ack/ack.tex | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/appendix/ack/ack.tex b/appendix/ack/ack.tex
index debc3379..9166fee4 100644
--- a/appendix/ack/ack.tex
+++ b/appendix/ack/ack.tex
@@ -31,27 +31,27 @@ changes and automatically determining which source files are present.
 \section{Reviewers}
 
 \begin{itemize}
-\item	Alan Stern (Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}).
-\item	Andy Whitcroft (Section~\ref{sec:defer:RCU Fundamentals},
-	Section~\ref{sec:defer:RCU Linux-Kernel API}).
-\item	Artem Bityutskiy (Chapter~\ref{chp:Advanced Synchronization: Memory Ordering},
-	Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
-\item	Dave Keck (Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
+\item	Alan Stern (\Cref{chp:Advanced Synchronization: Memory Ordering}).
+\item	Andy Whitcroft (\Cref{sec:defer:RCU Fundamentals},
+	\Cref{sec:defer:RCU Linux-Kernel API}).
+\item	Artem Bityutskiy (\Cref{chp:Advanced Synchronization: Memory Ordering},
+	\Cref{chp:app:whymb:Why Memory Barriers?}).
+\item	Dave Keck (\Cref{chp:app:whymb:Why Memory Barriers?}).
 \item	David S. Horner
-	(Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
-\item	Gautham Shenoy (Section~\ref{sec:defer:RCU Fundamentals},
-	Section~\ref{sec:defer:RCU Linux-Kernel API}).
-\item	``jarkao2'', AKA LWN guest \#41960 (Section~\ref{sec:defer:RCU Linux-Kernel API}).
-\item	Jonathan Walpole (Section~\ref{sec:defer:RCU Linux-Kernel API}).
-\item	Josh Triplett (Chapter~\ref{chp:Formal Verification}).
-\item	Michael Factor (Section~\ref{sec:future:Transactional Memory}).
-\item	Mike Fulton (Section~\ref{sec:defer:RCU Fundamentals}).
+	(\Cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
+\item	Gautham Shenoy (\Cref{sec:defer:RCU Fundamentals},
+	\Cref{sec:defer:RCU Linux-Kernel API}).
+\item	``jarkao2'', AKA LWN guest \#41960 (\Cref{sec:defer:RCU Linux-Kernel API}).
+\item	Jonathan Walpole (\Cref{sec:defer:RCU Linux-Kernel API}).
+\item	Josh Triplett (\Cref{chp:Formal Verification}).
+\item	Michael Factor (\Cref{sec:future:Transactional Memory}).
+\item	Mike Fulton (\Cref{sec:defer:RCU Fundamentals}).
 \item	Peter Zijlstra
-	(Section~\ref{sec:defer:RCU Usage}). % Lanin and Shasha citation.
-\item	Richard Woodruff (Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
-\item	Suparna Bhattacharya (Chapter~\ref{chp:Formal Verification}).
+	(\Cref{sec:defer:RCU Usage}). % Lanin and Shasha citation.
+\item	Richard Woodruff (\Cref{chp:app:whymb:Why Memory Barriers?}).
+\item	Suparna Bhattacharya (\Cref{chp:Formal Verification}).
 \item	Vara Prasad
-	(Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
+	(\Cref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
 \end{itemize}
 
 Reviewers whose feedback took the extremely welcome form of a patch
-- 
2.17.1


