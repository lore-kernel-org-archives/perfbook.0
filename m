Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=jlXMVcNCV2VKevFNMSVk29j5s6KckpJLcLPT5pCnbXs=;
 b=MfbeUIqacHAhR12/Q0PBjoPJURvNoyeJzHMh9suluOavLhDg8WQtULuCTtyeQQIggb
 Pt9WfcbkLA+QTOdOs3s2Oa8BB7G1RxQwfyYQM8dYFzys5i4/DHNX1gna8Btf1RMHvF9C
 xYjXxy7cK670F6QRue0+hRxpWsviymbTRTycWFLKZrgEM9or8kC74JmWGGgoJvQDM8dV
 DnH+SzlZqzHxQZG2K7OFa6X5x89m/OQcnEStfSRdCvH0ybO43lw6+rfmKYKqjBCRVa+G
 tDslBn2W5GXxdNAViysTvoksmN8JJboY44rFdq3rd/DhYo/piCIrWvHcxfv9cp5Bph4Q
 UUPw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] count: Enclose 'REQACK' in \mbox{}
Message-ID: <c2f828ca-14da-971e-427a-2edeb9d7e916@gmail.com>
Date: Thu, 29 Sep 2016 23:23:53 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 793c4a74be5cb0997b82789d19eebb2b7836d2fa Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Sep 2016 23:17:12 +0900
Subject: [PATCH] count: Enclose 'REQACK' in \mbox{}

This commit prevents "REQACK" from being hyphenated in Answer of
Quick Quiz 5.47.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index 39747d0..0eb95c3 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2641,7 +2641,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 		the fastpath.
 	\item	The following race would result:
 		\begin{enumerate}
-		\item	The slowpath sets a given thread's state to REQACK.
+		\item	The slowpath sets a given thread's state to \mbox{REQACK}.
 		\item	That thread has just finished its fastpath, and
 			notes the REQACK state.
 		\item	The thread receives the signal, which also notes
@@ -2652,7 +2652,7 @@ The slowpath then sets that thread's \co{theft} state to IDLE.
 		\item	The fastpath sets the state to READY, disabling
 			further fastpath execution for this thread.
 		\end{enumerate}
-		The basic problem here is that the combined REQACK state
+		The basic problem here is that the combined \mbox{REQACK} state
 		can be referenced by both the signal handler and the
 		fastpath.
 		The clear separation maintained by the four-state
-- 
2.7.4

