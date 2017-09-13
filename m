Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:38024 "EHLO
 mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752111AbdIMPA6 (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 13
 Sep 2017 11:00:58 -0400
Received: by mail-pg0-f66.google.com with SMTP id m30so216256pgn.5 for
 <perfbook@vger.kernel.org>; Wed, 13 Sep 2017 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=7aw0rk19ZvAsRNC4wx+dqYBZ8ia7r2sQ2z1YkbMfVy4=;
 b=IkYTsDSStJgaV82HCuiWzlCn/JC9BWLoV/oKOeysLJ+qvU6TwJQtFS2Dfl25+fyzb+
 CkZ1/kOVgyp/SDh3YsJH3/2etiesrFH4wlLrs0vO4mVhlS+P5W1WKONzlWU6fUQFvdrl
 xXuiBBiqtV107QpKa3myJfdEFJrIZXMTXnw6Cd1bD4N+jmd0o8HkZmvNAIxT+4bTMzNP
 sS8y0Ju7VtQ7TmlNelzoUPE45lrmH6I8VJcPWjqzw+kQhU6JfhMa2/PhjJxY3chwNh/C
 BZYQ73qtuzSp20kq5hjTc5yEpE7NGxvw+Ir8G1ZEIRfknzP5MKiG1jos8yzcCszjOhN1
 MB+g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix trivial typo
Message-ID: <07a3d744-40b8-69e2-6d3a-29c7232a6a25@gmail.com>
Date: Thu, 14 Sep 2017 00:00:51 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From f0494167b80f2c2760628e34f592982325f41c26 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 13 Sep 2017 23:56:41 +0900
Subject: [PATCH] memorder: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index ac03c23..28b9a37 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2021,7 +2021,7 @@ P2's cache.

 Row~2 shows the immediate effect of \co{P0()} executing its store on line~13.
 Because the cacheline containing \co{x} is not in \co{P0()}'s and \co{P1()}'s
-shared cache, the new value (\co{&x})is stored in the shared store buffer.
+shared cache, the new value (\co{&x}) is stored in the shared store buffer.

 Row~3 shows two transitions.
 First, \co{P0()} issues a read-invalidate operation to fetch the cacheline
@@ -2335,7 +2335,7 @@ returned the value stored by the \co{smp_store_release()} on line~12,
 the \co{1:r2=0} indicates that the \co{WRITE_ONCE()} on line~28 came
 too late to affect the value returned by the \co{READ_ONCE()} on line~21,
 and finally the \co{2:r3=0} indicates that the
-\co{WRITE_ONCE()} on line~11 came to late to affect the value returned
+\co{WRITE_ONCE()} on line~11 came too late to affect the value returned
 by the \co{READ_ONCE()} on line~30.
 In this case, the fact that the \co{exists} clause can trigger means that
 the cycle is said to be \emph{allowed}.
@@ -2631,7 +2631,7 @@ but these chains can be much longer, as shown in
 Listing~\ref{lst:memorder:Long LB Release-Acquire Chain}.
 The longer the release-acquire chain, the more benefit is gained
 from the passage of time, so that no matter how many threads are
-involved, the corresponding \co{exists} clause cannot trigger..
+involved, the corresponding \co{exists} clause cannot trigger.
 Give or take the increased computational demands of the larger number
 of threads, of course!

-- 
2.7.4

