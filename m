Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=i6mPCd9WTVE6boSv1YWze6I1bi3i+iifnwJXB+4++GA=;
 b=Wuq5A8hRokRBBEKOo5n5AHVZaY1/USG+0R/R/nDSlf6H1JoDN3q4FvQ7EvHF7FEVcf
 1gpcncDr8BqewK5OOP6cEPR7SWITKwMAMZ/sp9oeap5zfQ7a4qMakJjGilYUcUPyRLqn
 hCHYlJ7eL/Wf4oOZzVjE17XSDp5IA7xChdq5TuLnOxrmCBjrqqDNKTtaqLyWIPPGYsY8
 cZyhHbiu8boYe1OrMtfxazpyyl3glrUzoRx/s/BbWAJJWW5jxyd983k/rmubMiUAA84J
 YADo1YKX8nuFVJwRDJcZPPvp16L53kUI/aWezPoV+AxC47DUw0XxTyX3Ufpa/WVzB2fP
 +cGw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 13/17] formal/ppcmem: Use \co{} for instruction quotation
Date: Wed, 28 Sep 2016 06:56:37 +0900
Message-Id: <20160927215641.7330-13-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Sentences about PPCMEM litmus test uses \co{} for machine instruction
quotations but missed it for `bne`.  This commit uses \co{} for `bne`
quotation.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index c18cb9a..5dfddd8 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -182,7 +182,7 @@ and line~11 is equivalent to the C statement \co{r3=x}.
 	The implementation of powerpc version of \co{atomic_add_return()}
 	loops when the \co{stwcx} instruction fails, which it communicates
 	by setting non-zero status in the condition-code register,
-	which in turn is tested by the bne instruction. Because actually
+	which in turn is tested by the \co{bne} instruction. Because actually
 	modeling the loop would result in state-space explosion, we
 	instead branch to the Fail: label, terminating the model with
 	the initial value of 2 in thread~1's \co{r3} register, which
-- 
2.10.0

