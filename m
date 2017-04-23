Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BPPwyZX3L41B671kk5YSbtz9feagXiZrLNtsamYWWYY=;
 b=fvNuoRXlzI/wq9aPhGGj0Ck+SB9CAnvZIAef5wXFa10omJuzcWZydIn+tKvGmgnxkS
 3KhLG0pCyo9ai/2xR3Ua1H4D+4bTEQKdApf/Ja/W4JgZ55agYbb0JAP6MtC6ncM1uhJ2
 mNAKYt+q3xKvVwIXgw5gYWS9OAaskeCkTNbUKxjOx5MQdi9ZhZSho2Xp2NZ4OQKHffzS
 rAYPLh2VtQrmjjEq8lL1otiHJiV4m3guQ9j67MzV0kCbhHwZqPkIHpZ8C27G6Japs02G
 7mJHAZsYm4/clgZ7FlKNo7DOSnk+zfpkM3s+PwuIV9UUifB/aJfXc8U+O1pLEGS3ksKS
 nCOw==
Subject: [PATCH 4/4] Add 'GPGPU' to non-hyphenation list
References: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <807905b2-3ce1-4150-3821-68833e302fbf@gmail.com>
Date: Mon, 24 Apr 2017 08:55:45 +0900
MIME-Version: 1.0
In-Reply-To: <01efa9e6-095c-2db8-2a93-e07ffa48b7d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 343ea80f45c224bf2ecb4bcb84bdc924e8b9cb80 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 22 Apr 2017 00:20:41 +0900
Subject: [PATCH 4/4] Add 'GPGPU' to non-hyphenation list

Also add hyphenation list files to LATEXSOURCES in Makefile

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Makefile     | 1 +
 pfhyphex.tex | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 88a23e2..8799313 100644
--- a/Makefile
+++ b/Makefile
@@ -4,6 +4,7 @@ LATEXSOURCES = \
 	glossary.tex \
 	qqz.sty origpub.sty \
 	book.cls \
+	ushyphex.tex pfhyphex.tex \
 	*/*.tex \
 	*/*/*.tex

diff --git a/pfhyphex.tex b/pfhyphex.tex
index 768de86..fbcae67 100644
--- a/pfhyphex.tex
+++ b/pfhyphex.tex
@@ -1,4 +1,6 @@
 \hyphenation{
   REQACK
   COPART
+  GPGPU
+  GPGPUs
 }
-- 
2.7.4


