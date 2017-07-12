Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D8ZWPUJqgx4m1MJiy1SFC0iCeIKkKlbLtB3NCX9smtA=;
 b=mRDCc7XMnCMHPDDaBW946xP+4U6yT5bJiWkG5oU4Mw9NIsI5rGjGeqfvarjLpUboKP
 GdIb69yOZ5VSvzLLjToBVnj86UMp5perYEhpRItlYRt+LN70+7Z4i38BEFVcAZowZL70
 mMqi6PTdFXmuduM8rzUZK1IuYeYwGmA1uRBOAhiuBYX3MxVZstLUqxGoxejNY/hH5sEV
 0GY0KFWAJnDm2Cheg77h1qD9C/ulYsSe2Tf4p70vJ3YRFzWOkWdM15qbFyKtkOmV3m/n
 V2tP3pkuViHpsjnYKeEvLPJKBQ/YfydDvw3L642KOJ/wQpSUVsSddCCgNqhUR37HS14O
 hOrA==
Subject: [PATCH 2/6] advsync: Fix typos in load-buffering litmus tests
References: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b26bb4c4-010b-f226-fbea-7ce800c1d37b@gmail.com>
Date: Thu, 13 Jul 2017 00:10:06 +0900
MIME-Version: 1.0
In-Reply-To: <1dd8bb1c-ce48-1de0-0032-fdab3bd68b46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5fd378b832e773d13db4196c6c8b6145eea00774 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 12 Jul 2017 20:41:26 +0900
Subject: [PATCH 2/6] advsync: Fix typos in load-buffering litmus tests

Also replace contents of Figure 14.11: Load-Buffering Litmus
Test with the correct one.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus |  2 +-
 CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus |  4 +--
 advsync/memorybarriers.tex                   | 43 ++++++++++++++--------------
 3 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus b/CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus
index 808071f..8ee530d 100644
--- a/CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus
+++ b/CodeSamples/advsync/herd/C-LB+o-o+o-o.litmus
@@ -23,4 +23,4 @@ P1(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);
 }

-exists (1:r2=1 /\ 0:r2=1)
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus b/CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus
index e171ce5..f1b6dba 100644
--- a/CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus
+++ b/CodeSamples/advsync/herd/C-LB+o-r+a-o.litmus
@@ -1,4 +1,4 @@
-C C-LB+o-mb-o+o-mb-o.litmus
+C C-LB+o-r+a-o.litmus
 {
 }

@@ -23,4 +23,4 @@ P1(int *x0, int *x1)
 	WRITE_ONCE(*x1, 2);
 }

-exists (1:r2=1 /\ 0:r2=1)
+exists (1:r2=2 /\ 0:r2=2)
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index a354a54..936b95e 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -677,29 +677,28 @@ Figure~\ref{fig:advsync:Enforcing Order of Message-Passing Litmus Test}.
 \begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
- 1 C C-MP+o-wmb-o+o-o.litmus
- 2
- 3 {
- 4 }
- 5
- 6 P0(int* x0, int* x1) {
- 7
- 8   WRITE_ONCE(*x0, 2);
- 9   smp_wmb();
-10   WRITE_ONCE(*x1, 2);
-11
-12 }
+ 1 C C-LB+o-o+o-o
+ 2 {
+ 3 }
+ 4
+ 5 P0(int *x0, int *x1)
+ 6 {
+ 7   int r2;
+ 8
+ 9   r2 = READ_ONCE(*x1);
+10   WRITE_ONCE(*x0, 2);
+11 }
+12
 13
-14 P1(int* x0, int* x1) {
-15
+14 P1(int *x0, int *x1)
+15 {
 16   int r2;
-17   int r3;
-18
-19   r2 = READ_ONCE(*x1);
-20   r3 = READ_ONCE(*x0);
+17
+18   r2 = READ_ONCE(*x0);
+19   WRITE_ONCE(*x1, 2);
+20 }
 21
-22 }
-23 exists (1:r2=2 /\ 1:r3=0)
+22 exists (1:r2=2 /\ 0:r2=2)
 \end{verbbox}
 }
 \centering
@@ -719,7 +718,7 @@ reordering~\cite{JadeAlglave2011ppcmem}.
 \begin{figure}[tbp]
 { \scriptsize
 \begin{verbbox}
- 1 C C-LB+o-mb-o+o-mb-o.litmus
+ 1 C C-LB+o-r+a-o.litmus
  2 {
  3 }
  4
@@ -740,7 +739,7 @@ reordering~\cite{JadeAlglave2011ppcmem}.
 19   WRITE_ONCE(*x1, 2);
 20 }
 21
-22 exists (1:r2=1 /\ 0:r2=1)
+22 exists (1:r2=2 /\ 0:r2=2)
 \end{verbbox}
 }
 \centering
-- 
2.7.4


