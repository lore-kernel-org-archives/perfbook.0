Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ae7DDvuCbYPA5wIBheWAvhNgrtUDYSgVC5Ttyg5ylNY=;
 b=pxY9iJsU9KMil7TX66N+nH3qYxK41QRdtUP6OkHLumoH4KcQ27/0tRdhW03d7WPsI9
 d1QHzbKGJgm/hP9S7KTWyUGMy6Efe8haUkJQo8Tm01DYaeb6Zo6wa4NXitHW3hXpJ34T
 O6dmm15NrIAAfrJmdIC7eXtKzf54uMtYPGbTqnTLeQdNzFKlGqlo1e76BUE7nWVXj7Do
 +8liV/EImw27NftPMTUvDLdAPI/LRUMsRmrvMM17IaEkpnyv4Z7dsaae7Rnb0XzrpuBo
 PBAk3ADnrSIs7fbnOTf1iMhvpm1/Y1fQ6tkl/vf4k7RLvMsR2KN85dVGFHIbTN7RY3g6
 Ht0A==
Subject: [PATCH 1/5] memorder: Adjust hspace of table 'Summary of Memory
 Ordering' in 1c
References: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <982e1c37-53c8-1816-77a2-7fdd9bceb2fa@gmail.com>
Date: Sat, 16 Sep 2017 23:57:33 +0900
MIME-Version: 1.0
In-Reply-To: <7b420fff-97d1-fcb2-2bbd-8d1a8c2ec1ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7eec5812868178d3845f11abbe36e90c1d0cc602 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 14 Sep 2017 23:51:34 +0900
Subject: [PATCH 1/5] memorder: Adjust hspace of table 'Summary of Memory Ordering' in 1c

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


