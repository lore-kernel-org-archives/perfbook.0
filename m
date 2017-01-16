Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=q6uSZZG4weHPbQ35xlUGGSeIkNlSZCce+tG6YqWv8Iw=;
 b=j1MCHk73VcQGHIOfE/6wHelIVw+FvWpfk9auPb8L+PoPon/AmIiKxR/gvC+L3a7h2C
 RO2oBK+sC+oke+WTE0mnitOBl8msP9PlcsRx6Hqhw5OB9aaC/LDEYqlJSxwR4guhKE/L
 lWOxBkQBtjMV7cmeY7bRpqBk89Fg3HWffWXzIO8nd9o9l4olQD4u8wHNx9Kb4v3hTkiu
 lnW7OwcREkZRvBTrtCLFYt4dVUjbqzBbdOG7sS+8QZYmqpkuk1Qg+ryZz2WR4kriATJw
 X8NLsRZNT0bVGMBR5y4AxjdM8HQYwL57lOLoL2ma192AhyCg5d/Svi6AxWA83s5fneKz
 R29w==
Subject: [PATCH 1/8] count: Use \log in math mode
References: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <53227da2-4d36-496b-5435-18629c3f2202@gmail.com>
Date: Mon, 16 Jan 2017 23:56:48 +0900
MIME-Version: 1.0
In-Reply-To: <2c5427c4-463a-d118-3c30-d2c9f7ffd5a7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 9c2d2a3fd6e16918431b0a389b542a653d8b64a6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 15 Jan 2017 11:57:36 +0900
Subject: [PATCH 1/8] count: Use \log in math mode

Function "log" should be printed in upright font.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 0ba7af5..1543811 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -414,7 +414,7 @@ avoids the delays inherent in such circulation.
 	The hardware could also apply an order to the requests, thus
 	returning to each CPU the return value corresponding to its
 	particular atomic increment.
-	This results in instruction latency that varies as $O(log N)$,
+	This results in instruction latency that varies as $O(\log N)$,
 	where $N$ is the number of CPUs, as shown in
 	Figure~\ref{fig:count:Data Flow For Global Combining-Tree Atomic Increment}.
 	And CPUs with this sort of hardware optimization are starting to
-- 
2.7.4


