Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=okvuMFFLVxooHFbWFRlhqg4iFCQ8gSrDVK+3oJbbRho=;
 b=IRb+9oe0YaY/36uQjDM9z0T7ew8oRyZLjBCqPQvTITNYjZWUazd3NcQbPKnMcaH1AS
 lILLKpwup/MhmM0eMlM39mq1+Ck2k1oZMhgyUN5fxaJnSZ4SHeCnwJp2QCTfEku6/u/q
 Oi5onjavbvuor9rVAAWo7QWasB0cnQZLmuiURv8+5TgfIe2CzGBpLZOoTYmzhQEPSqHh
 rF8R4BmlIvGLYRYB2Zv+XYLf5GAoPmGh10vHjWbTiDn8p2wxyMvsgxxD0m/gjgl/0bT9
 CRpvJldAwW1LshzyQeMrtFaa+2TSBlr+EfwI7no0k8RDcsWQIuyqNLU5VhgDnQ8SI1uf
 tD5A==
Subject: [PATCH v2 3/6] formal/spinhint: Adjust option of enumerate list
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <512193a8-a968-f61d-b170-25fed14955e8@gmail.com>
Date: Tue, 14 Mar 2017 21:40:45 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From fe01252839978d67b611eafca1c49e8772582fd2 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:47:56 +0900
Subject: [PATCH v2 3/6] formal/spinhint: Adjust option of enumerate list

This enumeration list can be optimized by specifying starting
count and label format. It is also better to use a narrower
item separation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/spinhint.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index a10b57b..d6acef1 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -924,10 +924,10 @@ sections).
 The \co{readerprogress} array elements have values as follows,
 indicating the state of the corresponding reader:

-\begin{enumerate}
-\item	0: not yet started.
-\item	1: within QRCU read-side critical section.
-\item	2: finished with QRCU read-side critical section.
+\begin{enumerate}[label={\arabic*}:,start=0,itemsep=0pt]
+\item	not yet started.
+\item	within QRCU read-side critical section.
+\item	finished with QRCU read-side critical section.
 \end{enumerate}

 Finally, the \co{mutex} variable is used to serialize updaters' slowpaths.
-- 
2.7.4


