Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4M6/xwfrPn5aC0P8QqqXXC0CoXsSNQBS4bKO2XlX4Es=;
 b=AZQhGItO8SnvGgcuh/MxUp9v1pHCVs3WLvw7dCPrcdh5DZtwKfnY8K+FgTxFXCPULs
 P3p7d6vKByo+uloMS4yy5p0sSIBl+c1tgUNUSssbIyCKT7XQ2AV8zQTxWyb/KRk5/fMF
 +0vlMABjF2pNDw5W3rLTLsfw2w05NCfwuHOtOjo7eacAG5mpcpVC8Kw9xIhYiztS5qd+
 IFDhcMZLHEF3/t/+5J8IPdoXjy1Cc1naNseDzdkU02FSVaMsrdBDuOqGGx8GP5kiqtWb
 SD3ohkaLziijSKaybA9KYNK28NLx56Y257B5+3q4imOEXOWbSgAPo1Q4A0YV5STgRU0u
 V81Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 02/17] formal/spinhint: Add missing NBSPs
Date: Wed, 21 Sep 2016 11:44:33 +0900
Message-Id: <20160921024448.24744-3-sj38.park@gmail.com>
In-Reply-To: <20160921024448.24744-1-sj38.park@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit adds missing non-breakable spaces.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 10f6263..7787ed8 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -738,7 +738,7 @@ havelock array entry on line~26, starts the current locker on
 line~27, and advances to the next locker on line~28.
 Once all locker processes are spawned, the do-od loop
 moves to line~29, which checks the assertion.
-Lines 30 and 31 initialize the control variables,
+Lines~30 and~31 initialize the control variables,
 lines~32-40 atomically sum the havelock array entries,
 line~41 is the assertion, and line~42 exits the loop.

@@ -1009,7 +1009,7 @@ of the pair and sums them.
 The atomic block consists of a single do-od statement.
 This do-od statement (spanning lines~3-12) is unusual in that
 it contains two unconditional
-branches with guards on lines 4 and 8, which causes Promela to
+branches with guards on lines~4 and~8, which causes Promela to
 non-deterministically choose one of the two (but again, the full
 state-space search causes Promela to eventually make all possible
 choices in each applicable situation).
@@ -1107,7 +1107,7 @@ re-invoke \co{sum_unordered} if the fastpath is potentially
 usable.

 Lines~28-40 execute the slowpath code if need be, with
-lines 30 and 38 acquiring and releasing the update-side lock,
+lines~30 and~38 acquiring and releasing the update-side lock,
 lines~31-33 flipping the index, and lines~34-37 waiting for
 all pre-existing readers to complete.

@@ -1374,7 +1374,7 @@ Is QRCU really correct?
 We have a Promela-based mechanical proof and a by-hand proof that both
 say that it is.
 However, a recent paper by Alglave et al.~\cite{JadeAlglave2013-cav}
-says otherwise (see Section 5.1 of the paper at the bottom of page 12).
+says otherwise (see Section~5.1 of the paper at the bottom of page~12).
 Which is it?

 I do not know, as I never have been able to track down the code in which
-- 
2.10.0

