Return-Path: <SRS0=aA8C=HW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sxQbf1sHx4MCuWOSLEPzPYRd80fYbunXFDWxJOFGegw=;
        b=GIyKWLmXKvhm3l8/QGUTPFAJC5ADH5n3+thY8DolXE6dJveUF2Ts9OUOIFuBndtleY
         883mYrAwn15rF/zar+2GyYSRYSCHwd3ru7oRO7T+mCq5/l8nYuwMBJ7PzbHZ6RY/sAtZ
         td/xpghZzgBrAYrkp6vhtcLtkvyRnRzhSG1ni+m+rKHS/97LGsfqSqz963/Q7Q2kJ0sr
         huJumhDjOGnYtNjnEufInYDNjZiKU9dlSCN8UTjULecthogbYVpJoZ3ERlLuoCG6/5iG
         XdRDFB795Rv3lRxtYWfqCNfk9/FiSmc8pOKt9Xi12+x5uEUCQ4RJfsGdP+juAQWItIf8
         xLBw==
Subject: [PATCH -perfbook 2/3] datastruct: Fix typo
References: <6a73f889-005e-e8a9-c015-afeb31353b56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e06baec6-17f5-838c-8a9a-31f2d564499b@gmail.com>
Date: Sun, 21 Feb 2021 00:16:20 +0900
MIME-Version: 1.0
In-Reply-To: <6a73f889-005e-e8a9-c015-afeb31353b56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This looks like a staccato. 

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 52ff3c35..00dc3b60 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -775,7 +775,7 @@ data structure represented by the pre-BSD routing table.
 	sets of queries than performed by the benchmarks in this chapter.
 	For example, such systems might be processing images or video
 	streams stored in each element, providing further performance
-	benefits due to the that that the resulting sequential memory
+	benefits due to the fact that the resulting sequential memory
 	accesses will make better use of the available memory bandwidth
 	than will a pure pointer-following workload.
 
-- 
2.17.1


