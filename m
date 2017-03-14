Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=uwbC34wJ9FPXKYS6J+t4NRKMw400ORNPsKgp1p6Ykuo=;
 b=ns3+IIspJPvbPPlbfQkeYs8nqDP5QS56NliWRoHl2klrG41KRiGc/fSZ5SOKlW7TWB
 PFYMYPMkSmTLnsgh+DJL07zQ1kuaTnuvWhs8BVuDO3MI6nJQP7dYhIuaxBgIYpsJGE2E
 Q/79506esgozJRHPECsnupaHpD8nnKkn6NIOZUqOGNDisoJdLKnBC3EF/1bj1NACuDxa
 a7snr614CcRerufb5zPNOthKK86ZDZHuQ7V464pFxqeqwd4P0dq15g69Q1LvhcbiF6CS
 Qc4D5MfzVeaoa/kCzorE3/En9UuW/6Eykt57WkITbzZk2M+X5MAvvxD/vzJ79fufZbn8
 C65Q==
Subject: [PATCH v2 4/6] formal/spinhint: Reference by Figure labels
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b686b4af-0331-d4d2-02a4-2e35bd161b2e@gmail.com>
Date: Tue, 14 Mar 2017 21:41:31 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 267bc5727f8f50d389818c22c81ea9a6e1d810e4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:48:23 +0900
Subject: [PATCH v2 4/6] formal/spinhint: Reference by Figure labels

Reference to floating figures should be done by labels.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index d6acef1..a18ae23 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -742,7 +742,9 @@ Lines~30 and~31 initialize the control variables,
 lines~32-40 atomically sum the havelock array entries,
 line~41 is the assertion, and line~42 exits the loop.

-We can run this model by placing the above two code fragments into
+We can run this model by placing the two code fragments of
+Figures~\ref{fig:analysis:Promela Code for Spinlock}
+and~\ref{fig:analysis:Promela Code to Test Spinlocks} into
 files named \path{lock.h} and \path{lock.spin}, respectively, and then running
 the following commands:

-- 
2.7.4


