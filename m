Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S9JKBM/rIxGSKAoCwRQVda+LCNTItDOUtyWue5DibNY=;
 b=Ki+xl2OkeWsFfA/GHfUUuwksWW0SKeiY6ZYLyMzgo36JJCIGBXVZLy3gAtNmA3OBSF
 Yujk7jazyGg9zKVQtytNirRe0ecnvIwGIkCJpzbmCXn9suoWERDzjuriUAlBx2Bnylle
 zYHCjQVsHpmQheTx+hhxAf/wLOmour6v+Z9Itw5z1P7S6buD+ux9mbidvHmuhyJeUQI3
 j8WrfqBLD5NRWyDk5s6WCKNdhdbklJyuSgPjpNyp/wPFfE0lzF4SaOqn/MrX/TwYd2T+
 NGjpbrFfwjipK/fvkS1QUPp3I5MKHERgCHqM8XaOVs3AevDwuZe9Bza0Qmll9OXeaO3+
 Q7PA==
Subject: [PATCH 3/3] future/QC: Another math mode fix
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5ce0e6c1-961b-ba71-7372-c6603ab5240e@gmail.com>
Date: Tue, 20 Jun 2017 23:29:49 +0900
MIME-Version: 1.0
In-Reply-To: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 2d0d9c606bf94a9c993f84fb8b5087de6c00b212 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 20 Jun 2017 23:12:40 +0900
Subject: [PATCH 3/3] future/QC: Another math mode fix

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/QC.tex b/future/QC.tex
index bd85217..d16c080 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -993,7 +993,7 @@ too early to start thinking in terms of replacing RSA.
 \paragraph{Grover's Search Algorithm}
 \label{sec:future:Grover's Search Algorithm}

-Grover's algorithm searches an unordered list of N items
+Grover's algorithm searches an unordered list of $N$ items
 in $O(\sqrt N)$ time.
 But before this can happen, the list must be downloaded into
 the QC system.
-- 
2.7.4


