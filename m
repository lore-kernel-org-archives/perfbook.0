Return-Path: <SRS0=QZ2n=I2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=npHe79vbR8xCLueqgjvsgYsA56OH52pw+7qJ4JSVU7A=;
        b=h+irk4/c8RAUEMFcAn+MbALgqqXbXzMMN9mZfAv1/5Jucal3LLIrFfgsW3lVw0kutn
         uqgzpNNGund6wJw+3MYguXTTK5vkYr/a0tTlOAoBf5zkQn33Nr0xUj6QpJe5GeL9e+Ve
         uNIf8ZWThLg8MRQK8gjKLZfB/otCKtYujlPQjhOdCZf+q9ZkgX6jg9jlvTW4tk3NJzbx
         CYMirqSLfIZHbBJh/XiNe7sSGlLXkvY8Q/wMxhhy5SXClfLAcT1y2REvmdbZlgSp/fxz
         b8Tv1drBrQdpkyC955TgaY4WKdY8LXJf/5mglFIstTIUspqMn9S/Jsz1t7VbfdcuUUQX
         wd8Q==
Subject: [PATCH -perfbook 3/5] index: Enable balanced layout of last page of
 multi-column index
References: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6a28ee1a-2a53-312f-d104-c083c401bf4e@gmail.com>
Date: Sun, 28 Mar 2021 17:55:44 +0900
MIME-Version: 1.0
In-Reply-To: <d63ba139-abc7-3837-b44a-294a48a1b216@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Seeing this is the default of the idxlayout package and the result
looks better, remove the option disabling it.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 8a29310d..1003b153 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -74,7 +74,7 @@
 \usepackage[breakable,skins]{tcolorbox}
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
-\usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in,unbalanced]{idxlayout}
+\usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table
-- 
2.17.1


