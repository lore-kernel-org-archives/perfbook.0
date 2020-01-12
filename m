Return-Path: <SRS0=UsGV=3B=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NXWvwQoOruD+VF3HcSBh50QHkB8khLJgKn6GwoEQx0c=;
        b=J2u5zOq9Sm1iniFama8ROx921Vqa3Fkvb2bpFhNLXPr87R3eY/3Sw//ZaCuZRSBxtT
         ybs/yQPKh21FTJmiTdeXEpqL+pawY1O28wBBiNY+07YOVcr/6p1FfD1UIsHXfQJQ7iMx
         3T18XYBAn+ZyD42P6t9O0d+6e4ZvAP2M79tlkf7G4KP4u54Z06P/FlDikf7CfW3XCf3V
         zfCHTfqHCdsHLpGxd/ODD+RqocBQNM0EccUHL8l6g0d1mjUjDrfL6NkW3WRdcrP/ksnl
         iJvR4Q6wJB8Qq+mDaAJsBuzWzJC/8e3aXw0Dmw5ehKqiO5n8vZzP4O50BXEeqBzVdDiy
         JXYw==
Subject: [PATCH 1/6] together/count: Fix double quotes in epigraph
References: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e516bf85-03ea-7b75-c437-58e3bb486585@gmail.com>
Date: Sun, 12 Jan 2020 13:04:46 +0900
MIME-Version: 1.0
In-Reply-To: <053c308d-64ca-f1da-99e5-94740e0a55ed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ecbe4b6536dbc2801a9bc919287ae172d058ac84 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 6 Jan 2020 00:32:04 +0900
Subject: [PATCH 1/6] together/count: Fix double quotes in epigraph

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/count.tex b/together/count.tex
index 0374d396..23615403 100644
--- a/together/count.tex
+++ b/together/count.tex
@@ -8,7 +8,7 @@
 \epigraph{Ford carried on counting quietly.
 	  This is about the most aggressive thing you can do to a
 	  computer, the equivalent of going up to a human being and saying
-	  "Blood \dots blood \dots blood \dots blood \dots"}
+	  ``Blood \dots blood \dots blood \dots blood \dots''}
 	 {\emph{Douglas Adams}}
 
 This \lcnamecref{sec:together:Counter Conundrums}
-- 
2.17.1


