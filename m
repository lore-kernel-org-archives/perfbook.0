Return-Path: <SRS0=7eUo=ZY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YpYF1jhQd1C4lhz7VVPZA/3D/b5P/pBd3lm07mEd4Ec=;
        b=DtTqJucLrIbei4ppKyZbgAuZc4OiL6ug3O5IGKLC6lBTM0uozM3VvyUd8Lc+7qTjEL
         wzMq4JPX6dwTUsGE7QMcK+o3qHV0Ax/IZKEzvbexXQHaXqECJNBp4n63vBdWrRJ+U89i
         nQUbv8IKbOf1No5bsC1yeWm65rfJF1UMHd5cLXkFBsgr6jnZ5xAgUtAB6CL9Ks/3IaZM
         d5Nas23jtif0q2Ur7sEHPxulChpX473gUNwvXFZl6EwkRe/MH4vFeAJ2dDK8Jk+tsCrR
         9vSFblktUT9IB6wQ9rb379pWnugXn20DtvOPcOQEKfmoMo5NA3cF5swF9eWIjOTt6K9r
         DuVQ==
Subject: [PATCH 3/6] appendix/ack: Fill in missing ')'
References: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8c0ce068-687d-f5a4-c8c8-fe7a4b449d44@gmail.com>
Date: Tue, 3 Dec 2019 00:17:42 +0900
MIME-Version: 1.0
In-Reply-To: <bd2bcae7-bfde-241f-281c-832615d1c9c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 484eca4e57909f9f47f8ce0e14cf2f38a33e9e78 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Nov 2019 23:32:02 +0900
Subject: [PATCH 3/6] appendix/ack: Fill in missing ')'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/ack/ack.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/appendix/ack/ack.tex b/appendix/ack/ack.tex
index 3a84bb36..debc3379 100644
--- a/appendix/ack/ack.tex
+++ b/appendix/ack/ack.tex
@@ -31,7 +31,7 @@ changes and automatically determining which source files are present.
 \section{Reviewers}
 
 \begin{itemize}
-\item	Alan Stern (Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
+\item	Alan Stern (Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}).
 \item	Andy Whitcroft (Section~\ref{sec:defer:RCU Fundamentals},
 	Section~\ref{sec:defer:RCU Linux-Kernel API}).
 \item	Artem Bityutskiy (Chapter~\ref{chp:Advanced Synchronization: Memory Ordering},
-- 
2.17.1


