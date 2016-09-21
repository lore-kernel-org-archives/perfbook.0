Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/H3TY7amn8/ML6g89HrG6L1Co8Z8eUCZkY9Q+/y2a30=;
 b=higbUviyGMMq6/RsAIiz7HxKPXz1Lc2Sw84gkgIaQDss8yuW05WSh60gFv8Jxr9eVm
 y4Vg+kCo3ERkElp5OaQgmvZI3bcuXOhFBDOHG9JSVw3O24/u5mlZWkYx2+IjvwZ7e3RO
 ISKT7hXttKcEytbf+vQ6IEGTIsIHFCFzvFMpBbLMvTg2XnIBdI+7fM2Yp3sokQIHtDpL
 GC90QVYwm3uVnlBa/rVb0EAExaDaWwHNPD3j2IJecGvd8HDXDtPs4sj/yfTrARdVCIkA
 eUXQFnFCwAHnFGw3JKj8gSTAfzP6FlDyvxVjOJ3pXZLrUFYVvlH8DIeDLj7Dr2EWo+md
 t2yA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2] formal/dyntickrcu: Adjust font size of sample code
Date: Wed, 21 Sep 2016 22:05:48 +0900
Message-Id: <20160921130548.9393-1-sj38.park@gmail.com>
In-Reply-To: 
 <CAEjAshrzBH+=e7mHU3Dzw5ydOwBFHVtOVU-4Vqg0xJQX3HDewQ@mail.gmail.com>
References: 
 <CAEjAshrzBH+=e7mHU3Dzw5ydOwBFHVtOVU-4Vqg0xJQX3HDewQ@mail.gmail.com>
To: akiyks@gmail.com, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Code for `dyntickRCU-irqnn-ssl.spin` has a too long line.  Because the
line breaks the layout, this commit reduces font size of the sample code
for better layout.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index d0b2c6e..a63d324 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -1252,7 +1252,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.

 The \co{grace_period()} process then becomes as follows:

-{ \scriptsize
+{ \fontsize{6.7pt}{8pt}\selectfont
 \begin{verbatim}
   1 proctype grace_period()
   2 {
-- 
2.10.0

