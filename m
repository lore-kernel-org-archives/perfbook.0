Return-Path: <SRS0=Y4Pl=5B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yu4iyRRx7h8g6qsBWKTxy3jMiBfogFCh140r/qgG4pY=;
        b=lKx7TxfP5RNUZSynv9AFfjTwpGKs3ASUyqWw7FDL9EyMd+i6AeRdHFRQFsZ4lgNoub
         RTLcp3q74CUdVwPEKiDYi4WBrqd7JvRQaObofxu5g/P6UCWhl2rGRxbQtdrgBptUkVke
         lPANdCx/AUiatdrISw7eaInbU4GMH4gkx8dp19artouCVrzqly1Fb2V88bX7kWh1tvtV
         WvrrIj7ds6G5xkDBbAwnCn77gphP354BA/ZSTJZmRro6COuVoKiz3cKPwKEoj9TeJL+l
         yRqq4g434M7ll4U3irRUp/KjiPBep2VkIN7LbLa88ckCdyMEoGrT0eB4efU7t0vL2GGa
         SdqQ==
Subject: [PATCH 3/3] defer/seqlock: Move figure env next to 1st paragraph
References: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <27f9e270-a028-bc97-65da-58fa1610ea11@gmail.com>
Date: Tue, 17 Mar 2020 00:18:22 +0900
MIME-Version: 1.0
In-Reply-To: <70bc6ef5-e823-ae3f-7753-169ba1190d5f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 62edb155faac3b554f38b6d5f939cbad3e5030e1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 10 Mar 2020 07:58:31 +0900
Subject: [PATCH 3/3] defer/seqlock: Move figure env next to 1st paragraph

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/seqlock.tex | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/defer/seqlock.tex b/defer/seqlock.tex
index 1df6efad..c3a9773f 100644
--- a/defer/seqlock.tex
+++ b/defer/seqlock.tex
@@ -7,13 +7,6 @@
 %
 \epigraph{It'll be just like starting over.}{\emph{John Lennon}}
 
-\begin{figure}[tb]
-\centering
-\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Start-over}}
-\caption{Reader And Uncooperative Sequence Lock}
-\label{fig:defer:Reader And Uncooperative Sequence Lock}
-\end{figure}
-
 Sequence locks are used in the Linux kernel for read-mostly data that
 must be seen in a consistent state by readers.
 However, unlike reader-writer locking, readers do not exclude writers.
@@ -24,6 +17,13 @@ Figure~\ref{fig:defer:Reader And Uncooperative Sequence Lock},
 it is important to design code using sequence locks so that readers
 very rarely need to retry.
 
+\begin{figure}[tb]
+\centering
+\resizebox{3in}{!}{\includegraphics{cartoons/r-2014-Start-over}}
+\caption{Reader And Uncooperative Sequence Lock}
+\label{fig:defer:Reader And Uncooperative Sequence Lock}
+\end{figure}
+
 \QuickQuiz{
 	Why isn't this sequence-lock discussion in Chapter~\ref{chp:Locking},
 	you know, the one on \emph{locking}?
-- 
2.17.1


