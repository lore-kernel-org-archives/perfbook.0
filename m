Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1fjh1RoREl3dO1dOza1W/jgQsXuTFAsZ1QjAHKK1umI=;
        b=qtdF4ge34B4KDV2Xuk9fqbo+a74zM5Ep2X6hMzWeBzhi9UIBouZmiO5FjGha4t2dOJ
         /I1MDStEfk/csjXAk9BJlhqYsQGv7KbWbrHqBi8z++yyFxBJS/TJN4p7b0Uocs2CL5or
         oWo0P9lSPhmajchnKn2A4f5eqnpGyrlWI9nw4WUnFuzLROVm5kIa6W0vhvlK503LTxbg
         Iti9Mu5mLgTacUP0ny3XG82phoSUmdN1RjXsSZDbm4YO4rm7TkM/kI3av1NRO3vIzMO7
         S5uMMswL6n5rnPlefFRX49+W72aQhaEZS1Sk0zWnEw0oldZYOH28c2x6apSahYQ2+c26
         OFLA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/7] datastruct: Update an outdated footnote
Date: Tue, 20 Nov 2018 09:00:52 +0900
Message-Id: <20181120000057.389-2-sj38.park@gmail.com>
In-Reply-To: <20181120000057.389-1-sj38.park@gmail.com>
References: <20181120000057.389-1-sj38.park@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

'Bits and Bytes' subsection says smartphones with gigabytes of memory as
an impossible case.  However, such smartphones are prevalent now.  This
commit updates the sentence for trends in these days.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index fb8fc20..744a8cb 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -2055,7 +2055,7 @@ Fortunately, the relatively large memories available on modern
 systems have allowed us to prioritize performance and simplicity
 over memory overhead.
 However, even with today's large-memory systems\footnote{
-	Smartphones with gigabytes of memory, anyone?}
+	Smartphones with hundreds of gigabytes of memory, anyone?}
 it is sometime necessary to take extreme measures to reduce
 memory overhead.
 
-- 
2.10.0

