Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=XOQ1+cz3PetB1NCmpOls2CJV9cPod96vAXKDNJn7w90=;
 b=FvRHOA62QZN/ieczSBqUmgQMiGdXS5+ta0JABdvDfciU7dSxYTAMPoJuYsZyWq+y6o
 yQUcJYLiD2TdiBiK0dvUheiXNSVHdwLHfhat1MUPCYQs88LyIStC4sHDgm+jGqTEc4K/
 I/VTBod1J6eRgbG4kDJI6EGSpxDb44LSmRjNqK8TZJ5TlHkV5qVl49V1tm8pcplFTMnm
 QW/OcmhRVMqXfmlq1WkWw5lorww+5bBg3AGmvGWIOCkIZL6CHw8iNBihUPbiAAOhkDjH
 0Udwp+j9g/AKBAUYj4T3rth4HN9QFmW72uq7IPkGLqt5vrYyPNcEE5rtcqm4D+Vf3Me8
 DFwA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Fix conjugation
Message-ID: <b59bfc8c-5681-9e52-a407-7898fe22f821@gmail.com>
Date: Thu, 7 Sep 2017 23:47:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 52de440ceddf2f7bd97b4ad31b656d089f4b7f78 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 7 Sep 2017 23:39:54 +0900
Subject: [PATCH] memorder: Fix conjugation

Fixes: bee1892d96f3 ("memorder: Shift more towards "load" and "store"")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index c0d30c0..80b8ac3 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -256,7 +256,7 @@ record their stores in their respective store buffers.

 Row~3 shows the two loads (lines~10 and~19 of
 Listing~\ref{lst:memorder:Memory Misordering: Store-Buffering Litmus Test}).
-Because the variable being load by each CPU is in that CPU's cache,
+Because the variable being loaded by each CPU is in that CPU's cache,
 each load immediately returns the cached value, which in both cases
 is zero.

-- 
2.7.4

