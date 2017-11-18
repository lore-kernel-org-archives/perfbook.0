Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hpNuQzwUlFrOxL57CeD/geZ/SHMiMxfNBpot9Yo3vCg=;
 b=pYL/eODddP7ppgAgOx4xfbKRw3rqoyKBwQ8eJ80+c3mTHLRJpAHGLlnSDL6PkJSt3U
 t+lf+KLDKxvSgdZGvlQE1aSgHsHAmn74MWm3XglWbTLvEi39Xc0PJ80ahliNIQuHu8c7
 m4i971gcWvT1oanXVPJPmOMATl/2kQoXX/na8Cqibr5Q7Me1hB1l9GIl+iIA6iAeGSke
 wWV0xvQgmoJ99XWw82pGaOmfTMuX2ydnXIhcFq8kIyAEVlIGaV0Smh0cpxpnwRouGNa7
 EPb5zmEGxAbzm7Y5S/M1SiI7cXQpfVjXd1Jjqi4RxCmVbmrN8esnpkqIVIk3ZLNIKtH7
 IUpg==
Subject: [PATCH 2/3] Partial revert of 'Fix layout hiccups in answers to quick
 quizzes'
References: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f2865f3f-99bb-d553-487a-aeb45e2eba86@gmail.com>
Date: Sun, 19 Nov 2017 00:06:12 +0900
MIME-Version: 1.0
In-Reply-To: <ec7ed5f9-1986-ba77-5e64-48334404c033@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3f6060fdcfe12b94ac56380e4211c06316b141c5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 18 Nov 2017 23:30:40 +0900
Subject: [PATCH 2/3] Partial revert of 'Fix layout hiccups in answers to quick quizzes'

As qqzreorder.pl can take care of "listing" at the end of QQA now,
some of the changes made in commit 90197e37d310 ("Fix layout hiccups
in answers to quick quizzes") can be reverted.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuapi.tex | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/defer/rcuapi.tex b/defer/rcuapi.tex
index 55811a1..7fbb189 100644
--- a/defer/rcuapi.tex
+++ b/defer/rcuapi.tex
@@ -367,8 +367,8 @@ returns a value that must be passed into the corresponding
 	In practice, however, doing this is almost certainly a bad idea.
 	In particular, the code shown in
 	Listing~\ref{lst:defer:Multistage SRCU Deadlocks}
-	could still result in deadlock.%
-%
+	could still result in deadlock.
+
 \begin{listing}[htbp]
 \scriptsize
 {
@@ -388,8 +388,7 @@ returns a value that must be passed into the corresponding
 \theverbbox
 \caption{Multistage SRCU Deadlocks}
 \label{lst:defer:Multistage SRCU Deadlocks}
-\end{listing}%
-%
+\end{listing}
 } \QuickQuizEnd

 The Linux kernel currently has a surprising number of RCU APIs and
-- 
2.7.4


