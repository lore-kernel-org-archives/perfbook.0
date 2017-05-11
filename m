Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xikDatcE2qaPA8VMOUQuv5NbkN30yPJ/J+svs4ohPY8=;
 b=ldDtaSBUEHJ75gajuyBvB14C3SlxZq968+yKQdoXaetmFKfPduuTGhYKu8SmyyrDAF
 KH0ewPw1otWmSLTmza5Q/7V6XAT0LKILd9bRZ0bfyD10w0jV3bk08Wk4mOCNWhlIxvh2
 2ZeV5An2EOFM+5tkdn6YjbBiN3nHpFo31gRlkBaDFw5vBV6ZUinOaqRMl0FY4VMl1Ifw
 3FXYH/bA5mepYy+eTfLQDljmqhMXRevraoF1K5kXF7CTYFrGNF9eYO4hS6b3el2XgyTW
 Kwz35j6F8bemoidKNHNzZ/RXf31eZn4xAAccL4tuTwNxsttRDSW/vTmn8A7L9boerZTO
 O0iQ==
Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27
References: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
 <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
 <CABoNC81561Cdif7=LnT0z3xdkM++Ldznnd5uGNzMuyVv_XU56g@mail.gmail.com>
 <838da0fb-e7c9-8a0d-a0a9-52bff6095702@gmail.com>
 <CABoNC80oag9-esaYM2aDs0kf5ve=GJuHf8MAEVjGGzJin0QT-g@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c324d63f-7da2-2c9c-f99f-c74fecb2bcc3@gmail.com>
Date: Thu, 11 May 2017 09:47:58 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CABoNC80oag9-esaYM2aDs0kf5ve=GJuHf8MAEVjGGzJin0QT-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Junchang Wang <junchangwang@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 557aa593d97bf2b8cc47ff14fbcaf3f80703866a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 May 2017 23:39:57 +0900
Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27

Reported-by: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Acked-by: Junchang Wang <junchangwang@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index cc47554..096b53d 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1260,7 +1260,7 @@ machine.
 \QuickQuizAnswer{
 	One approach would be to maintain a global approximation
 	to the value.
-	Readers would increment their per-thread variable, but when it
+	Updaters would increment their per-thread variable, but when it
 	reached some predefined limit, atomically add it to a global
 	variable, then zero their per-thread variable.
 	This would permit a tradeoff between average increment overhead
-- 
2.7.4


