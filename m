Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sz3TBSGOxcoWMABVzol/Ema+1X5/uWE6rVy9/YLmnxs=;
 b=q4ZRxJJCcQbR/zLm4kaKjOxFS/MYcG6P7iW+HmsZmrgkfXJXBwuuup6LW4MnEYNZDN
 NfLMcTpfFGqWl9Dp8zwmg7XR/LUZoXE7MifnCSecZn42go0+18SktREinX2nJrgAT/uB
 zGK6B+acA45NgSusy9A0xoUl1pm3A+qWKTB83EleiYvzsXBUhdlvEA7rJbJ3pa+XJyn9
 Ji21Fmv8KnTSsjZKdDFwndOPwj99RPhIqvXOoikjqKbQESJsaQlBmH3C0F3Ihx1myRH5
 DlNvN4nNlE1uWN9wxgc/RKWseU0y6SADNMbzYq39b0mtsLqjXV+fAxyS8JQS1GyT9Gbf
 m5+g==
Subject: [PATCH 1/2] toolsoftrade: Update definition of READ_ONCE()
References: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b08d7dbc-c3f3-8686-3b70-f5a792312d73@gmail.com>
Date: Tue, 23 May 2017 00:11:45 +0900
MIME-Version: 1.0
In-Reply-To: <ee37ed49-8952-0e35-1cb8-e9261e274cf3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e61f1ef20186fe24d7cec92b43f41a5efda524cb Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 22 May 2017 23:42:06 +0900
Subject: [PATCH 1/2] toolsoftrade: Update definition of READ_ONCE()

Reflect the change in commit 85747990ec80 ("count: Don't in-place
increment a READ_ONCE()").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index cecb2d3..9ccd4bc 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1258,7 +1258,8 @@ but may be implemented straightforwardly as follows:
 \scriptsize
 \begin{verbatim}
 #define ACCESS_ONCE(x) (*(volatile typeof(x) *)&(x))
-#define READ_ONCE(x) ACCESS_ONCE(x)
+#define READ_ONCE(x) \
+            ({ typeof(x) ___x = ACCESS_ONCE(x); ___x; })
 #define WRITE_ONCE(x, val) ({ ACCESS_ONCE(x) = (val); })
 #define barrier() __asm__ __volatile__("": : :"memory")
 \end{verbatim}
-- 
2.7.4


