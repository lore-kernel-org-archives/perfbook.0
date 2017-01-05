Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=4mgNpbdtCdcJkSG7d6TnZFNTkcfHSz/F13xSMW7kUmo=;
 b=r8rukgrA+K4AYPGb/Cn7EVScNOA2AMdkz5SbuMl9Sn42IiDubTgKNEhI836hKSewZ5
 bzFRfqBf//7n/mkDIkCPAJHi0dtw+3xfjudvgM8bs2YSsLbdcz6tdTFLx8DJQkrS7A0a
 HkYCHhpxnnOac7aCWkPoLbcgbyKeOCeGKIoidHA1rcpEfbnTKng5NyoA7LVfVTynlxz6
 eq8cO6OjmJqeRuL2kRcZLOwvhWGjvgosSa+PleBzSBy0fea4JSL4vfxSJRKi6JUYjUEr
 qoADr4sg7/TvgV8/cwEYfZU7J2vMDZR1PW/pvnN8SvTj5A8DkNSOaRmtKj4862NwN6a8
 v8UA==
Subject: [PATCH 4/5] Revert "formal/dyntickrcu: Adjust font size of sample
 code"
References: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <944afb83-a7e5-13be-6530-3df34bd84222@gmail.com>
Date: Thu, 5 Jan 2017 09:37:04 +0900
MIME-Version: 1.0
In-Reply-To: <f156a2ae-be14-47d5-c0d8-264f2138cf5d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 36e5015882b9e157e6aa8d66c589398dbca02d86 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 28 Dec 2016 20:30:25 +0900
Subject: [PATCH 4/5] Revert "formal/dyntickrcu: Adjust font size of sample code"

This reverts commit c7c5e8a1829e60349cc4eace0479e7ac37ec859d.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 75eb93f..50e87d8 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1252,7 +1252,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.

 The \co{grace_period()} process then becomes as follows:

-{ \fontsize{6.7pt}{8pt}\selectfont
+{ \scriptsize
 \begin{verbatim}
   1 proctype grace_period()
   2 {
-- 
2.7.4


