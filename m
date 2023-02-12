Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XcLt3/IiuZUusK+gmKBed6RUCJy5btidtjnMCYMS8MY=;
        b=TCS0wl8z8pxF9vzzRC/swJonmCzWRxUT9PJFsFYebhiugOjdycKxZ2RG0OT8e4g4Yx
         9P/5GHNn2UHCrp6pTmE3b7LYHXDu96NkbxrFvGdw+K6DKf8tPbNUM446dVxUNcFxG6iL
         nJLxHKvyw5BmCpnLUPwprYf4RMi30xfIDN2+Gr2tVnrNFKNrQ05Rl+nc3tqAdYxisC2H
         Rxk/GW8A83BQ1agkeooI57gxRxxJJO9XN2vJgzMUrUnCzlusC0MUI4SqRTEuJ8wuH14/
         KRzaPjti2khM/JYHp4gRfuK96P83rMC45Mt/bN4Bc3KLN3NHf0nvkQbs+7+Hm9iRfTYC
         G8Xg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 3/4] debugging: Remove unnecessary space in a sentence
Date: Sun, 12 Feb 2023 08:56:29 -0800
Message-Id: <20230212165630.26268-4-sj38.park@gmail.com>
In-Reply-To: <20230212165630.26268-1-sj38.park@gmail.com>
References: <20230212165630.26268-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj@kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Two spaces are usually used between sentences, but a sentence in
debugging is using two spaces inside a sentence.  Make it uses only one
space for consistency.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index 4dfb1229..b7538620 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2153,7 +2153,7 @@ serve four major purposes:
 	against your competitors' offerings.
 \end{enumerate}
 
-Of course,  the only completely fair framework is the intended
+Of course, the only completely fair framework is the intended
 application itself.
 So why would anyone who cared about fairness in benchmarking
 bother creating imperfect benchmarks rather than simply
-- 
2.17.1

