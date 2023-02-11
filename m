Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XcLt3/IiuZUusK+gmKBed6RUCJy5btidtjnMCYMS8MY=;
        b=KakjdC5MDp2tLFpFzWBsi/fQa0/yaQwFiHPsuVXOlE4gr5Gk/udAhpV+Jwi2pd90YT
         XFQUSQFFCZVw7nD0f5nZJ0SKdeyd3SrNnoRZnrhfXUQIk0D9MUO3QOK4Xx3b5YWM+rPX
         U7qP/ThBLCf2qHolBhfopZdml7//vMRcecHk2wOUqggI60eXrZOFZ8IE+1wXCL1eYkir
         0u6AtsdF6tRpykMlua1jiP4WP55HqNTkulUuVY77taNMeOz+PzB8y6tfG1Gbr4m4b3Xg
         gIlhfiWcJO/PS0MlC9fXcBoaPycxujzf6MHGn3qUgeRJaAk1bdGnLg+fMpR1i3ukkJzp
         vtfQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 3/4] debugging: Remove unnecessary space in a sentence
Date: Sat, 11 Feb 2023 09:10:07 -0800
Message-Id: <20230211171008.9415-4-sj38.park@gmail.com>
In-Reply-To: <20230211171008.9415-1-sj38.park@gmail.com>
References: <20230211171008.9415-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj38.park@gmail.com, sj@kernel.org
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

