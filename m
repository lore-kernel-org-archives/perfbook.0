Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6zcYxvBw+a4++wsVnJRX1/aj9Vm9wCvxWOs14AxGSVI=;
 b=QZf+M1m8zImh0oD68RJE5M6sFM7z1m+dU5aPR4dfJLblhVlxDhTvW2R7+ZIyWitEZY
 EItSc4nPnW407qACSW2DOnhKpyyqK1llnq/qiMPHGORvGz/dSSC3UJSY93WX5f3lzcHr
 Dn9Hue2m0DiLtAghwvPZ5rClNZLfW5+BE06zqePJvS/LXyxjnuhsVxoVtJgS/pUdRqIw
 X3957DFr9M9XWWUYb2/XvZe+kg/CcWKxi3ViotFRpmVGju689nGYlk+VhomHTuN9PkSs
 ni14MI3VF1YuJCkInpTZOC60UKyAXOKsm4T5Bj6ps0uVOj7uVhFyYUiwqlcyl0u/Nas0
 yVBw==
Subject: [PATCH 3/5] defer/rcufundamental: Adjust hspace for 1c layout
References: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <24b8d2c9-ae86-2515-ad3f-a9d3fb86a832@gmail.com>
Date: Fri, 27 Oct 2017 07:53:33 +0900
MIME-Version: 1.0
In-Reply-To: <225c5748-05bd-b97f-398f-50e09c58c701@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From bc8c675a5cb92407aacb90c55473080f40b80236 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 26 Oct 2017 23:48:30 +0900
Subject: [PATCH 3/5] defer/rcufundamental: Adjust hspace for 1c layout

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcufundamental.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/defer/rcufundamental.tex b/defer/rcufundamental.tex
index 27c6421..9b0ffa7 100644
--- a/defer/rcufundamental.tex
+++ b/defer/rcufundamental.tex
@@ -382,7 +382,7 @@ circular list:
 \begin{table*}[tb]
 \renewcommand*{\arraystretch}{1.2}
 \centering
-\footnotesize
+\footnotesize\OneColumnHSpace{-0.4in}
 \begin{tabular}{llll}
 \toprule
 Category  & Publish	& Retract	& Subscribe \\
-- 
2.7.4


