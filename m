Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=FDsuPkmjY0b54Y9DJH2cKR/DQn9gVybN3jf3nAidvWk=;
 b=CiwjzSOUy+wrAXPgc+AMEqf/3xVv75IJ0sOXl9OkemSakZKWGrXMiOKhZ28+pghi8a
 hjb1oNwVbgqJ9evktPqFI7izujGDLjHBweSQWccSf2mFkLUiMehACKZ5qMCmqD4vMkoi
 XrGZ/+eYbNrKOAXgi0/kfall22KiCaLLb6enUpEgYDx/lLLSB8dA8CTfKbJ1gje551Ms
 P2Y4pCON8sEYfldnngk6q7V4pF3bCcbagoNw+9XjJg+cGDo8AVeegSCmBc17H2xeQtWT
 pfPzynoVOb8cwwF+8MMIvStibOWCYvDVYmJ0yi6McFmmlqQP0i1dBKJeogYXZW4qW2e2
 XIdw==
Subject: [RFC PATCH 06/12] advsync: Modify usage of definite article
References: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8f76114b-1bd5-6007-152a-f1bc6bae329d@gmail.com>
Date: Sat, 1 Apr 2017 11:16:11 +0900
MIME-Version: 1.0
In-Reply-To: <b00db59a-a0b0-42d6-7546-01872ad3e404@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6dcde543c62b0effd48ae684fd0a305f0ae8338e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 26 Mar 2017 08:55:07 +0900
Subject: [RFC PATCH 06/12] advsync: Modify usage of definite article

These "ACQUIRE/RELEASE"s do not need definite articles.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 60d32b0..6215311 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2731,16 +2731,16 @@ These implicit memory barriers provide the following guarantees:
 \begin{enumerate}
 \item	ACQUIRE operation guarantee:
 	\begin{itemize}
-	\item	Memory operations issued after the ACQUIRE will be completed
+	\item	Memory operations issued after an ACQUIRE will be completed
 		after the ACQUIRE operation has completed.
-	\item	Memory operations issued before the ACQUIRE may be completed
+	\item	Memory operations issued before an ACQUIRE may be completed
 		after the ACQUIRE operation has completed.
 	\end{itemize}
 \item	RELEASE operation guarantee:
 	\begin{itemize}
-	\item	Memory operations issued before the RELEASE will be
+	\item	Memory operations issued before a RELEASE will be
 		completed before the RELEASE operation has completed.
-	\item	Memory operations issued after the RELEASE may be completed
+	\item	Memory operations issued after a RELEASE may be completed
 		before the RELEASE operation has completed.
 	\end{itemize}
 \item	ACQUIRE vs ACQUIRE guarantee:
@@ -2757,7 +2757,7 @@ These implicit memory barriers provide the following guarantees:
 	\end{itemize}
 \item	Failed conditional ACQUIRE guarantee:
 	\begin{itemize}
-	\item	Certain variants of the ACQUIRE operation may fail, either
+	\item	Certain variants of ACQUIRE operation may fail, either
 		due to being unable to get the lock immediately, or due
 		to receiving an unblocked signal or exception
 		whilst asleep waiting
-- 
2.7.4


