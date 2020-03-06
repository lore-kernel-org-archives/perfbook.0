Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AHTPHyIE+edNG85yuR/mfoErWGoGhdhNHoZ+bQWb994=;
        b=IY1xqr3msQC/9DdfF3LhCWQSRcH1tO7dePzzYHRr/G6TCPv6aIddjp/hCK8AXT09Oe
         fm52wAt9+Th5f0+N9Zi/RL7IkfX75JREv6UuqsHuEocGAP2OXE5rNwg/DWPKSeFRYTUO
         jVjCduxm3I82rT9pTMxE1gs39b6vTxMx1dJEw2GDoWp2/tra3SYvk5JcejVD0lVNR0o/
         DHKhfA4aYZV1zEVT8CP2BMzYu6CBTPKkHRkM2zEGwJVgxGSUcr/wcalZv19NK2E70M26
         0qSQk3Ll3KWQ7hc7ZM0pcjqk35DnPBWHJWhnaPxHl/V7hGBUfuGIy8IF3/CjTct7J20v
         ggTg==
Subject: [PATCH 6/6] SMPdesign/partexercises: Move figure env next to first
 paragraph in QQA
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5df58040-1f56-a3cb-6a2d-9f9ffcd324bc@gmail.com>
Date: Sat, 7 Mar 2020 07:53:40 +0900
MIME-Version: 1.0
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6a10517e8890a37b34c4d3dbbb91372df1906ac1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Mar 2020 21:14:19 +0900
Subject: [PATCH 6/6] SMPdesign/partexercises: Move figure env next to first paragraph in QQA

This change removes the extra indent at the beginning of the
answer.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 SMPdesign/partexercises.tex | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 4ceaefeb..12945935 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -134,14 +134,6 @@ the acquisition and release algorithms.
 	Is there a better solution to the Dining
 	Philosophers Problem?
 \QuickQuizAnswer{
-%
-\begin{figure}[tb]
-\centering
-\includegraphics[scale=.7]{SMPdesign/DiningPhilosopher5PEM}
-\caption{Dining Philosophers Problem, Fully Partitioned}
-\QContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem, Fully Partitioned}{Kornilios Kourtis}
-\end{figure}
-%
 	One such improved solution is shown in
 	Figure~\ref{fig:SMPdesign:Dining Philosophers Problem, Fully Partitioned},
 	where the philosophers are simply provided with an additional
@@ -150,6 +142,13 @@ the acquisition and release algorithms.
 	is never any need for philosophers to wait on one another.
 	In addition, this approach offers greatly improved disease control.
 
+\begin{figure}[tb]
+\centering
+\includegraphics[scale=.7]{SMPdesign/DiningPhilosopher5PEM}
+\caption{Dining Philosophers Problem, Fully Partitioned}
+\QContributedBy{Figure}{fig:SMPdesign:Dining Philosophers Problem, Fully Partitioned}{Kornilios Kourtis}
+\end{figure}
+
 	This solution might seem like cheating to some, but such
 	``cheating'' is key to finding good solutions to many
 	concurrency problems.
-- 
2.17.1


