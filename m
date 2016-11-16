Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ouBcLAKNQRJrBpOtkWRFcGMGJ9im8+HT7VdWcHQijjY=;
 b=OLC1i4J2GiXVBYv/4IWwb1RFvq61zpPabWHJa07Zj2VhG/+qCyOyxY95f3ejzEMr/H
 pPhb/80jA6EoGvXnXAToEy5pB0QXDKpFSlfuzHg0R3oNP0jBd7h/yaYyaMSBpb0OMwu+
 xQXbCA25eLQGk76o9unDNh3hihwtZoZjTk1Ri0ChuxGPMzvGg1pGEK6/HXTFMAMhue7S
 OHTivzc/FogfnXRS1lKE+KlCBkhKEpfR4OkMkEMOxnIx/rCWxQSyUo0nakxX+KmncG9F
 Fh7KhK31gc0yhI+SIeNy9/a8a4AxL9B6YcZ4cFREzHUG+hQBqvmzahSMp7c+EfQKrbTl
 IJiQ==
Subject: [PATCH 2/3] appendix/ack: Adjust labeling in 'Reviewers' section
References: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <97b4c487-6cc1-f0ac-5ba0-74045a368482@gmail.com>
Date: Wed, 16 Nov 2016 09:59:53 +0900
MIME-Version: 1.0
In-Reply-To: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5dab9f44100d397f2b16f01078eb883bb984764d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Nov 2016 00:18:10 +0900
Subject: [PATCH 2/3] appendix/ack: Adjust labeling in 'Reviewers' section

"formal" was promoted to a chapter three years ago.
"whymemorybarriers" is in Appendix from the beginning of git
history.
This commit adjusts their labels in "Reviewers" section.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/ack/ack.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/appendix/ack/ack.tex b/appendix/ack/ack.tex
index a7737ff..8aae702 100644
--- a/appendix/ack/ack.tex
+++ b/appendix/ack/ack.tex
@@ -20,7 +20,7 @@
 	Section~\ref{sec:defer:RCU Linux-Kernel API}).
 \item	Artem Bityutskiy (Section~\ref{sec:advsync:Memory Barriers},
 	Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
-\item	Dave Keck (Chapter~\ref{chp:app:whymb:Why Memory Barriers?}).
+\item	Dave Keck (Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
 \item	David S. Horner
 	(Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
 \item	Gautham Shenoy (Section~\ref{sec:defer:RCU Fundamentals},
@@ -28,14 +28,14 @@
 \item	``jarkao2'', AKA LWN guest \#41960 (Section~\ref{sec:defer:RCU Linux-Kernel API}).
 \item	Jonathan Walpole (Section~\ref{sec:defer:RCU Linux-Kernel API}).
 \item	Josh Triplett
-	(Section~\ref{chp:formal:Formal Verification}).
+	(Chapter~\ref{chp:formal:Formal Verification}).
 \item	Michael Factor (Section~\ref{sec:future:Transactional Memory}).
 \item	Mike Fulton (Section~\ref{sec:defer:RCU Fundamentals}).
 \item	Peter Zijlstra
 	(Section~\ref{sec:defer:RCU Usage}). % Lanin and Shasha citation.
-\item	Richard Woodruff (Section~\ref{chp:app:whymb:Why Memory Barriers?}).
+\item	Richard Woodruff (Appendix~\ref{chp:app:whymb:Why Memory Barriers?}).
 \item	Suparna Bhattacharya
-	(Section~\ref{chp:formal:Formal Verification}).
+	(Chapter~\ref{chp:formal:Formal Verification}).
 \item	Vara Prasad
 	(Section~\ref{sec:formal:Promela Parable: dynticks and Preemptible RCU}).
 \end{itemize}
-- 
2.7.4


