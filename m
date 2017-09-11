Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=vU+g8eci1GwHu0i7lkOXCcWoDyPlcyTZnzImTMZslGY=;
 b=sQYb1zvimRDHQBveD4P5lEAJRTiXnM8bqoMRSFVxrzojQxt6UodZCXWWTwkvcAlImK
 Rid8IUdn8+ybAmRVzE7IMCH6LBfOuEa1kOT4Siqpk1IhabLEq6IzTjqxZ4BzS0BHpCcc
 oqJVMEHO0wwe2aS4Lx0jo8lGQ5VaUzvqDenUxS3MGSO6NnDUTSDjvYXXx6FhO9x9cxXx
 2fxmv4ETIr4VNxfcElj/hyMM3lOfH5P2ASmlnSW7m2Z7626V92q/51bUP09BGiOgUMpU
 RF+Lc+B1pBlg2iE5nEA+dADyL5OKEOrbj1xRiDWKofOaWvSO6YVdHzED0NZu0mtHOcYm
 4COA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Reword footnote on cumulativity
Message-ID: <fe6143ec-d858-b3de-682f-0d5e3a3122d2@gmail.com>
Date: Mon, 11 Sep 2017 23:49:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bfbd4d2c5c43a436795d4f352c54c3bb6b8d5304 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 11 Sep 2017 23:41:26 +0900
Subject: [PATCH] memorder: Reword footnote on cumulativity

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index a916eeb..96b598b 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3583,7 +3583,7 @@ invoked by those two clauses), not to code following that ``\co{if}''.

 Finally, control dependencies do \emph{not} provide cumulativity.\footnote{
 	Refer to Section~\ref{sec:memorder:Cumulativity} for
-	the meaning of transitivity.}
+	the meaning of cumulativity.}
 This is demonstrated by two related examples, with the initial values
 of~\co{x} and~\co{y} both being zero:

-- 
2.7.4

