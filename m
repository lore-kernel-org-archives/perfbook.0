Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=twf4rtsrS2baXrw1ti85vRQHbFybrFb7XSczhsfF49g=;
 b=gJcEIYj3YRwR62dZKH5paXXo8uUPSvPcdwHALSUi6yeOZxIbkpYGpNeQykhBt3wMYx
 gey9dhkErfEei3d8F9JSe7h55hOixDpYlRUTfh7Lp2A26hR49dVF6VSLjFfa+TrdWTcE
 BPM60vVxao7gzgXEOHVvhVrnouUhtd34YQ2Qr1M8qGuW7OB+DefPZAMzmiHWn1iTY7VB
 NEJ2W3HZ5vlUzKNpwggn9xgiqft65Xi3Nag6pbR1tosFY1TM2ElM3QvR5KiIDR/yU0p+
 E81NOGckoeZkhuXSKoJggEZzTS9BVyNuiVMgpPIriRdYfHx8jyy1vG0iyTG98v6TcFQO
 dylA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/4] future: Fix a typo: `item` -> `\item`
Date: Tue, 27 Dec 2016 04:43:13 +0900
Message-Id: <20161226194314.7868-3-sj38.park@gmail.com>
In-Reply-To: <20161226194314.7868-1-sj38.park@gmail.com>
References: <20161226194314.7868-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/htm.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/htm.tex b/future/htm.tex
index 9a1271b4dffe..ab1002227dfa 100644
--- a/future/htm.tex
+++ b/future/htm.tex
@@ -632,7 +632,7 @@ semantics of locking, but loses locking's time-based messaging semantics.
 		\co{MAX_LOOP_TIME}.
 	\item	Locks are used sparingly to access and update global
 		state.
-	item	Locks are granted in strict FIFO order within
+	\item	Locks are granted in strict FIFO order within
 		a given thread priority.
 	\end{enumerate}

-- 
2.10.0

