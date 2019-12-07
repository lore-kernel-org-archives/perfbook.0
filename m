Return-Path: <SRS0=gDlb=Z5=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kW+7/Jz7JjyDxLWhK2ALm24WeK7TSEMNGc+tmHBzahg=;
        b=M+ovL313Zb9LnrZLI5zFG3q4G+I8fOwOtYMXCz4O7bvG1Z2S0emTTP1VG8gagWz4h8
         tMRcVShJjqFs7pBbWpO36XQTS7979qjTBVNc9QsDB4KNtzOmtDRhcypmmVMG4ryJZto+
         KV8v+iTEyjglQ5PrXFOT0Rslq4nbz5rEWVBV7gJzf85otv/JgWskmsSAWNj2yRkHbsu8
         WTTr7pcSZfGxajUpCMEOfD32sjfjyeEx3d3CfJzXKc2Yv3zqEezssn/ZmO6/9+bf/zYY
         87kCBBe+tznAB46Gl1opqWviRapAJjg+TsGZnkPlRZ1ypyeZuLz06JdvZek9gDM5oAGD
         lOEA==
Subject: [PATCH 2/2] defer/rcuusage: Fix typo (that -> than)
References: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e88e409c-0725-f10e-ea72-2afb86a9d9aa@gmail.com>
Date: Sat, 7 Dec 2019 13:07:58 +0900
MIME-Version: 1.0
In-Reply-To: <eb5c3f76-c84f-c801-ceb4-27efd64e2d0f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e991e75d28adcc5c07546c980a0ec0b3e5ba345e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 7 Dec 2019 11:13:45 +0900
Subject: [PATCH 2/2] defer/rcuusage: Fix typo (that -> than)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuusage.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index 58688b48..004f6665 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -126,7 +126,7 @@ that of the ideal synchronization-free workload.
 	back to ideal.
 
 	The RCU variant of the \co{route_lookup()} search loop actually
-	has one more x86 instructions that does the sequential version,
+	has one more x86 instructions than does the sequential version,
 	namely the \co{lea} in the sequence
 	\co{cmp}, \co{je}, \co{mov}, \co{cmp}, \co{lea}, and \co{jne}.
 	This extra instruction is due to the \co{rcu_head} structure
-- 
2.17.1


