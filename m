Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=RcESz3QoFmGqGyRwMdKs+FupRjmn2X1y0XGmCuOaga4=;
 b=E7Ip87pBcxRNMR9UfatjNk1OWTqnEBHbEXWCjUlbJ54ACVR8inH4SS8LskkK113DWb
 gXpcMEO0Gjjrt/sBKMuztUj98fGNHWhkvLFAKgNUtI3v1XXU/u0CcKymBN9Uuz1CN7By
 alyLQ6fL0TB22Ou6Wi6LMXmYHbEUfBJlmGZp4m82lG3dJn7gWkZ3KenPKgsY7/tB9nk1
 Ji1YtPTExBtynYjeFh4scKZeAt967rUQeQWjoLKTqx0cztkmH/vAJoY0MVbw9pVZxFwo
 +rOfoHG9PQKZjF6JRM0lfwCTFzNGLwxn+Zf0jIL1Pof3t4a7n25lRoS1UyK/TKRnV206
 hPTA==
Subject: [RFC PATH 5/6] epigraph: Increase width a little
References: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3ba1ae26-4666-fd61-3bc6-75d7243b3710@gmail.com>
Date: Mon, 19 Sep 2016 12:07:31 +0900
MIME-Version: 1.0
In-Reply-To: <029d0339-e50a-3b7e-1fb1-2322cb519dac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 57f60ab066cd0f1a54f4888baed19a7a289e59bc Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 11 Sep 2016 20:34:47 +0900
Subject: [RFC PATH 5/6] epigraph: Increase width a little

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook.tex b/perfbook.tex
index 564b214..77342c6 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -32,7 +32,7 @@
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
 \usepackage{epigraph}
-\setlength{\epigraphwidth}{2.3in}
+\setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}

 % custom packages
-- 
1.9.1


