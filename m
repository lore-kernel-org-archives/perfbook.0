Return-Path: <SRS0=5QGv=MA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P8lC5EiixJtAYIFr0REk7i0Mec7sGL5xjH7deZHmn/Q=;
        b=MO1HQVfuupnhSpJIlS+te/oyqnW1DU8Lekp4sMz6sw7/n2bz/S+W4R+yo3FBddM19Q
         1wRGGNvtxBX9XvImUU2BIBb+XKPppL/wZ9/EnDDrAD3XePk9cOyIYQXrT1uZsoqWoF7P
         47Ilz+neSASN1/vlGnBvBdYxu2EqSS2M8exm00uoFrRwoFBfGmgHQSmMX1nUWwcPJJkG
         Hx8kMT+QOING1WxIoXGqrPHkjAmeVZoh1ad2vCxTntHHHpR7trujjKi1aJ+ZjcYS86e+
         iAiN9L1WkdwxWkQmDRnB3Dpx0WgwzFn7hzp2mzVIV90OFESHhG/Glr0IG1SCJV9foiKC
         3XKQ==
Subject: [PATCH -perfbook 4/6] count: Remove Oxford comma in two-item
 enumeration list
References: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <439e8ec3-eb48-903a-6c54-d4811c9a1768@gmail.com>
Date: Thu, 8 Jul 2021 19:44:32 +0900
MIME-Version: 1.0
In-Reply-To: <b502a83e-5a41-8ccb-1170-8cefd589e1a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index afe0539b..db4b1144 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1736,7 +1736,7 @@ thread~0 can once again increment the counter locally.
 	There are two purposes for taking this approach:
 	\begin{enumerate*}[(1)]
 	\item To allow thread~0 to use the fastpath for decrements as
-	well as increments, and
+	well as increments and
 	\item To reduce the inaccuracies if all threads are monotonically
 	incrementing up towards the limit.
 	\end{enumerate*}
-- 
2.17.1


