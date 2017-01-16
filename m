Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=HLxSVqIqLtIp7obMyurqAC4ilSP0OeVQZr0koIRT8+A=;
 b=nwZUPSkIaLsyoY5GkaCMT+jt2ecDxt2Gh38wOcwNTvMGbR1MYAHeaNbiZsQu/XlGRR
 0fTDFD4QFw5NM3Z1PCmd7n5U5I0xpGvH3xgHXg6+zKn6v763cqSoCikyMoVnw8lcBIIZ
 qfez8upcjzVLCL6sOfNwaRnkHopDHVIorUCgf+4JeTwbineG0vl9OFgGn+gNdWnkRAEV
 NhwRuPfQmQGCGh0THBZ5DJ5yQ1QKlj4bxJ9OYx+3kTbOqbZhmB3ioVG6i+zIIePE0NVw
 GCqdP0N0YEMmwPs3zsWyLN2C+w0YOvAQhHsT6geZrZ6SuCBM1zOQ0pKFJQBZtsNEhIEd
 UrbA==
Subject: [PATCH 6/8] Revert "count: Enclose 'REQACK' in \mbox{}"
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7cf3e472-238e-7690-c4a4-5787c14229bc@gmail.com>
Date: Tue, 17 Jan 2017 00:04:18 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 34eb6e39674ea4e7e59451e83aed1dc186a16a6b Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 19:15:20 +0900
Subject: [PATCH 6/8] Revert "count: Enclose 'REQACK' in \mbox{}"

This reverts commit 452b9bfa7505f72a53857eb6173d2354a5ce65b2.

As "REQACK" is listed in pfhyphex.tex, this tweak can be reverted.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 1543811..cc47554 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2641,7 +2641,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 		the fastpath.
 	\item	The following race would result:
 		\begin{enumerate}
-		\item	The slowpath sets a given thread's state to \mbox{REQACK}.
+		\item	The slowpath sets a given thread's state to REQACK.
 		\item	That thread has just finished its fastpath, and
 			notes the REQACK state.
 		\item	The thread receives the signal, which also notes
@@ -2652,7 +2652,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 		\item	The fastpath sets the state to READY, disabling
 			further fastpath execution for this thread.
 		\end{enumerate}
-		The basic problem here is that the combined \mbox{REQACK} state
+		The basic problem here is that the combined REQACK state
 		can be referenced by both the signal handler and the
 		fastpath.
 		The clear separation maintained by the four-state
-- 
2.7.4


