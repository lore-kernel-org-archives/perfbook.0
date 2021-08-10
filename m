Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w3D8WB8/WcJdp7J20qUWxmux4r+7g7XIExNeUjCRsEc=;
        b=TA6sVx7+4dgw/2+8nxzRnJkl5OmC/fH24duMrV/EB0P4r0lsDxvSUAwcgtNx7lmwJh
         58y8833dIQ7KMLuT3foJjhCLohmzaDlWA6vAVvkET8jQ1QC0D7kVrc1mxVk7pTIkA8I4
         DF2ZaQVfQPbLrBQkdsg9HYLcsdvR37QAC5+J/Cb0AbXgt+zf/2GjrIVCMTuIwu5Eu25U
         HIMgowkZ+nXrhVfmXHdu4H89am1q6LAN9WP/dxRYtF+f3W7g0VyQvlgOLeisF6sxu7VP
         N9VzfDtMUDWcpoe4OVLU1xMazHfZnI9ilrSQu6dh2xBRRy1eckXpK1HCibtCrHkzuLXI
         7BFA==
Subject: [PATCH 3/7] formal: Use \co{} for pan messages containing colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b41e629e-b949-9455-a5ce-e238d1e5bbc0@gmail.com>
Date: Tue, 10 Aug 2021 13:43:14 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Messages inside \co{} will be ignored by the check scripts.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 16f216e0..c1fe2d40 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -275,7 +275,7 @@ Given a source file \path{qrcu.spin}, one can use the following commands:
 	10.5\,GB of memory even with the \co{-DCOLLAPSE} flag.
 
 	If you see a message from \co{./pan} saying:
-	``error: max search depth too small'', you need to increase
+	``\co{error: max search depth too small}'', you need to increase
 	the maximum depth by a \co{-mN} option for a complete search.
 	The default is \co{-m10000}.
 
@@ -582,7 +582,7 @@ cc -DSAFETY -o pan pan.c
 
 The output will look something like that shown in
 \cref{lst:formal:Output for Spinlock Test}.
-As expected, this run has no assertion failures (``errors: 0'').
+As expected, this run has no assertion failures (``\co{errors: 0}'').
 
 \QuickQuizSeries{%
 \QuickQuizB{
-- 
2.17.1


