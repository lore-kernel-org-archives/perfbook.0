Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=8cHA0EuvgPBVC+ZWu5MYURfLzd+qIEpw3xfk9+sEv1E=;
 b=Tu8UDKsN8KorVmNA4guKxxaqQeG7JstALT1TQxWttGU3I73tUkDXp+eAOsrn2OyEvw
 6YULb51kvNzkUx6QN6ag1EuljNcMEBK6nF/5CnG4hJ32tH1IKgZ5jUxtzyX+nSOPeyW+
 jspPU0bAo1S5e+ugLJCQpVFzQPQQmaVD4sclAzoF6DbjNyh+/Rvx2IPZocnPRx92ieGk
 vcWcCXKAnluThGaYfKqpHbk9eLE26AlFWjdIT7s3ngxe4bbPMYt7lxSPb7di6tE40iSG
 N5T3XK7dMhb7ahH8nAuRaXk9r+IMGEIsqiswEgn4cUlFR+/UGXyjjvZB2XIiFqlV627i
 Sxtw==
Subject: [PATCH 5/5] toolsoftrade: Enclose short verbatim in minipage
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a658a572-092f-0a7b-fd6b-d3be76d7ae8b@gmail.com>
Date: Thu, 5 Jan 2017 09:38:05 +0900
MIME-Version: 1.0
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From a1d64d31f52b7b2f96fb6e15ef30dde7f8d521bf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 1 Jan 2017 00:59:39 +0900
Subject: [PATCH 5/5] toolsoftrade: Enclose short verbatim in minipage

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index bc51437..0d1bf8c 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1252,7 +1252,7 @@ These last two primitives are not provided directly by gcc,
 but may be implemented straightforwardly as follows:

 \vspace{5pt}
-{
+\begin{minipage}[t]{\columnwidth}
 \scriptsize
 \begin{verbatim}
 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
@@ -1260,7 +1260,7 @@ but may be implemented straightforwardly as follows:
 #define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
 #define barrier() __asm__ __volatile__("": : :"memory")
 \end{verbatim}
-}
+\end{minipage}
 \vspace{5pt}

 \QuickQuiz{}
-- 
2.7.4


