Return-Path: <SRS0=q0D/=2S=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Zpi8ItND5eecUX8S0JVmwkekBCJghXGT/kM6l04vo50=;
        b=WXNO4BSS9m7XQuxbKsPXxZ5VIH3lteN9Js49kktsHBaZAw1OZeb0cBV6Vpqs2BMslY
         9WpLKjotX/5EsKyfvamPUdb1mDu31O25SYuiclFX9gwUQchHfuz/zmozOySRSDL2bRCZ
         QHuscayAz8LPT63Q+nif+8WqOnD6kAmOLjha0Frwpc4NpUDa7jUiERKyQtda2Shbydjg
         UGXKlyHKAUVQ76LM/evJQ2mrTyEsMd/DRliusnobDa/+/0HmK47vQ0z5GCwvQLHrNoEE
         Dpb/8Mp65TMchBpXjucO2R/s91yvQnkqi+eZT9zcUSjOJ5OGmBYp4DZZt5JnuxxYXtZU
         cCQA==
Subject: [PATCH 2/2] appendix/questions: Use nbsp in 'value n'
References: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3827cb4b-c44b-86a2-9097-abe47bc57ab4@gmail.com>
Date: Sun, 29 Dec 2019 08:35:21 +0900
MIME-Version: 1.0
In-Reply-To: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fa89c4d8097dd4db2a7a4f0ba0b59a859d990b06 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Dec 2019 07:59:22 +0900
Subject: [PATCH 2/2] appendix/questions: Use nbsp in 'value n'

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/ordering.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
index 43df44a9..a9b29e4d 100644
--- a/appendix/questions/ordering.tex
+++ b/appendix/questions/ordering.tex
@@ -108,11 +108,11 @@ than the semantics given by the options above.
 	\cref{lst:count:Just Count Atomically!}
 	to the statistical counter of
 	\cref{sec:count:Statistical Counters}.
-	Suppose that one thread is adding the value 3 and another is
-	adding the value 5, while two other threads are concurrently
+	Suppose that one thread is adding the value~3 and another is
+	adding the value~5, while two other threads are concurrently
 	reading the counter's value.
 	With atomic counters, it is not possible for one of the readers
-	to obtain the value 3 while the other obtains the value 5.
+	to obtain the value~3 while the other obtains the value~5.
 	With statistical counters, this outcome really can happen.
 	In fact, in some computing environments, this outcome can happen
 	even on relatively strongly ordered hardware such as x86.
-- 
2.17.1


