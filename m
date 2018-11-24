Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5WiRwIStPsiuORX6fH6mhuYw1fLADk88mGyfOruyJRo=;
        b=eM8Reva4Oh15crzT+9YQ/vdvvXce+Q0dylZjlEeNTMege4wvLsfVSJ8pW+JSKUSgio
         93Sml/FViJbkXX56v0OSN8HKAzWOM0FNatiwnmmJ9hbgJUupn9HZSYeEJIBHKs5+7S8X
         kelqGsgnFvuHZTxzl7ejZrMXeyOUJxcrNE96oY5Qxp2phxToWxThw+XmM3zr0KurX1TM
         YIRVh1OZzWSs6lQbhuGUxX+0s/tiZ59P0hA62clxKmWPHt3xqUrFpHgjw41nebIkCsNT
         +B2/rherorB0/tylwSxcFld/oYzaffqxN4/HhL1GTNHLNwHT60AuJML7HxVPSW+56Z1m
         z/jg==
From: Junchang Wang <junchangwang@gmail.com>
Subject: [PATCH 3/3] defer: Fix a typo
Date: Sat, 24 Nov 2018 17:34:54 +0800
Message-Id: <1543052094-8306-4-git-send-email-junchangwang@gmail.com>
In-Reply-To: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
References: <1543052094-8306-1-git-send-email-junchangwang@gmail.com>
To: paulmck@linux.ibm.com
Cc: perfbook@vger.kernel.org, Junchang Wang <junchangwang@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Junchang Wang <junchangwang@gmail.com>
---
 defer/hazptr.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/hazptr.tex b/defer/hazptr.tex
index 346146f..09c5f21 100644
--- a/defer/hazptr.tex
+++ b/defer/hazptr.tex
@@ -91,7 +91,7 @@ recorded a hazard pointer for the data element.
 	It might be inefficient in some sense, but the fact is that
 	such restarting is absolutely required for correctness.
 	To see this, consider a hazard-pointer-protected linked list
-	containing elements~A, B, and~C that is subjecte to the
+	containing elements~A, B, and~C that is subjected to the
 	following sequence of events:
 
 	\begin{enumerate}
-- 
2.7.4

