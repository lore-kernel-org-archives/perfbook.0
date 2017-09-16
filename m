Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ilfnt/4M2cCjmM0dsGU01PYKDI3KYjrxmMdrY4Ec9gA=;
 b=WRzV0dAjnKIUmewTV40e62TKGw9Ao1eIzdvBlLbpLNIjpjoGZ0bGlbcKpafSGxWpoB
 fIJn+0Dt1Ereyxw0f05csyOxbvij7eRDXqz80Vn4kOWgPQ/7SVdUxrnCjIyQryUOepxq
 RV5yyw0VyBw1J4sv2LwlnGbnsWaluDpORwlV08p30KmX0jRbNFbxdGJYUkU0gAdE3xJH
 ws5dWfi9W7ESRse7pPy2+ooNpElv5lnKy3YFk/EZQSTxgp6fAEC9BM81hBEcxTK4rd0v
 hyZQfbu7EG6fbZ7OehPD4jstoCIwaw7jQSRAhsyHy9fQXo9syaFXIxN7vtDG2sxs16MU
 jPyg==
Subject: [PATCH v2 1/5] memorder: Adjust hspace of table 'Summary of Memory
 Ordering' in 1c
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
 <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3d28d3f0-63af-6445-bfff-c172b666b452@gmail.com>
Date: Sun, 17 Sep 2017 00:07:42 +0900
MIME-Version: 1.0
In-Reply-To: <95974ff0-250c-e25b-cca1-76281383e22a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7eec5812868178d3845f11abbe36e90c1d0cc602 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 14 Sep 2017 23:51:34 +0900
Subject: [PATCH v2 1/5] memorder: Adjust hspace of table 'Summary of Memory Ordering' in 1c

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 4194c42..9a66829 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3702,7 +3702,7 @@ dependencies.
 \begin{table*}
 \small
 \centering
-\renewcommand*{\arraystretch}{1.2}
+\renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
 \begin{tabular}{l|p{2in}|c|c|c|c|c|c|c|c|c|c|c}
 	\multicolumn{2}{l|}{~}
 	& \begin{picture}(6,60)(0,0)
-- 
2.7.4


