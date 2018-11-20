Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KI73asomz25WUDNKrtKGnX80HP5RqlwPc8kkhkzEDdM=;
        b=lWwWRKHFdSz6uJCnJUg75Y5BKTqiXFMJfeyR8r91RGD5S3Y3e4KGubIUB7yoeq3A9b
         CBQ2bBdoM6R+VcJYXt5BzLPrWDRhArAKFVwv+ouNVRYO+MmMTUtW3SuCiwS5rzxPSWBE
         PITVnpvFoODVnhB13yfJcBCOwOWR6JL2YJJIVrP1LKQ68exao7NDZ/6A87If+ezsO1V9
         gR94ExIZ3TzkdbRo/hAuu6u3NrvJc3JhrzlHZEtSNID1JHOwswaSLRz4ZX+xhqtNURVB
         /V4DcpRzbJMrNJcOJFoJZavgB+OeRiwIssQkt1cy96xpD5ZLfBuQ7TOrNcApg4uUhzGh
         Fykg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 7/7] formal/axiomatic: Add missed parentheses for 'WRITE_ONCE()'
Date: Tue, 20 Nov 2018 09:00:57 +0900
Message-Id: <20181120000057.389-7-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/axiomatic.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/axiomatic.tex b/formal/axiomatic.tex
index 58513eb..65d1b6a 100644
--- a/formal/axiomatic.tex
+++ b/formal/axiomatic.tex
@@ -383,7 +383,7 @@ in the \co{herd} output.
 \QuickQuiz{}
 	\begin{lineref}[ln:formal:C-RomanPenyaev-list-rcu-rr:whole]
 	Also in Listing~\ref{lst:formal:Complex RCU Litmus Test},
-	can't line~\lnref{updfree} be \co{WRITE_ONCE} instead
+	can't line~\lnref{updfree} be \co{WRITE_ONCE()} instead
 	of \co{smp_store_release()}?
 	\end{lineref}
 \QuickQuizAnswer{
-- 
2.10.0

