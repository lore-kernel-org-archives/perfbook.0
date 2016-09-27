Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:34502 "EHLO
 mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1753109AbcI0V4w (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 27
 Sep 2016 17:56:52 -0400
Received: by mail-pa0-f67.google.com with SMTP id r9so528648paz.1 for
 <perfbook@vger.kernel.org>; Tue, 27 Sep 2016 14:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4M6/xwfrPn5aC0P8QqqXXC0CoXsSNQBS4bKO2XlX4Es=;
 b=cU0YVPgUrxpgoxvUdyef9bDyLtJ1U5n1Huj9FXEhDbeC0FOWMmcF4k7sVhePC9dbcI
 d+LrR+10F6Y7b9dN1L4S3E0T8wXTOvu94xavkmCfKmhDZvJFK8VfCjEWGUgDtqoznt1g
 8aa0A1r59cN3OLvoPKJ3eSYdHYWPIq8h7fnaydoDGKpzCk7TqhMAGiR4I+oWbEZjjdu/
 yWz4Tc33RTGGoLMNBJA60knxq/LKaXJTaKkV6k38soFFXsd3SNdTz+TkevDQ6v7UHph/
 k/oXH/yDeN+F4JURaHU+Vb8WaEXYymFIgCwZf6hyZ/6WvAnFvS1q08O3jtyfNC0Nd8/y
 HiIg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 02/17] formal/spinhint: Add missing NBSPs
Date: Wed, 28 Sep 2016 06:56:26 +0900
Message-Id: <20160927215641.7330-2-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>

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

