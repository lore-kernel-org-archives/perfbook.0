Return-Path: <SRS0=dwV0=3F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L9PJWw99lQJWSh3aGNMRM7/nWYaof3c53EqVxzJEV3A=;
        b=SagPbfVO9wpbrt+y+TXz0HmphcS9Jw7xRSYbCp+6Zie2dZsEXO6nIdziuoHlTww1/r
         npr9Kp/s6VMXjxNYNy7IdaAikilDpdVv8Ax1/+tuLU+L7kbrkRLRJOmoTTWb7Ft6/dKN
         blEjDqezqN57l5exzoSYdVFIHSj/64og/NOCqy5Cc4Pfwhgend4QDnV76ioZCiv49RHz
         qWXZ4Bizjbh17Lnx0a7IvHgY7UkGACkDjlx2Oo0pIu1jUkjwMdqebX/MYmYpGMyMOHYi
         Mu5vwe9C6RdX2bgD6l0jVYI1WFCffyTgHrBwwR6pXJDmBL5A66kbVq5/RdicYc3WA2L4
         Lm6w==
Subject: [PATCH 2/3] howto: Fix typo
References: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7d340ee9-e333-67f5-863f-9d81fbf068db@gmail.com>
Date: Fri, 17 Jan 2020 06:59:10 +0900
MIME-Version: 1.0
In-Reply-To: <805bd7c5-477f-c398-b025-34a630f663f9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cd352d3dfd20d8fcfdddafe5547ad191cbdda37e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Jan 2020 16:18:19 +0900
Subject: [PATCH 2/3] howto: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 howto/howto.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index bbdacbf1..fe80cca8 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -23,7 +23,7 @@ Parallel programming is not as hard as some say, and we hope
 that this book makes your parallel-programming projects easier and
 more fun.
 
-In short, where parallel programming once focused on science, research,
+In short, while parallel programming once focused on science, research,
 and grand-challenge projects, it is quickly becoming an engineering
 discipline.
 We therefore examine specific parallel-programming tasks
-- 
2.17.1


