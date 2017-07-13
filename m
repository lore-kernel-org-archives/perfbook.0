Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:34191 "EHLO
 mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751017AbdGMW2s (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 13
 Jul 2017 18:28:48 -0400
Received: by mail-pf0-f193.google.com with SMTP id c24so8660229pfe.1 for
 <perfbook@vger.kernel.org>; Thu, 13 Jul 2017 15:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=BgkJ9sbc0FkwVTsOH7z2P3fn20qOAo7PPm0BZzNVXmk=;
 b=gbgfMo08EZCAZA4a2exbFK4tpofoxDcEldjkhUhMNlI9ZWUNB2U39Ga20FyWdHP10g
 /7Ra9BFStiBTR7ImooulSuRAiitK3ZDGNW1G9YaVicLuP9xckAg4vLhDuGPQKu+VGDoI
 kYKYkPUhBkyzJ0USqy68xsXfc6YmwxF0GaXS07Hisp1xaNOvQef+DzVuwyr6IZoeokuC
 6xzs8JtLoQXLrUmRIG4f5p6PNhqv5j7irBVYdsFGMU7f1z6+2wAdsccTptSdRbOjsvSv
 ZU+05st9QAR5LjNRkk3JmTDg00eRML20SejQd94C+qR1dTCitEzkc7bBDhODGNFw18WI
 Herg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Readjust spacing for one-column layout
Message-ID: <7b4d4adf-c186-554f-9d14-58267cc29715@gmail.com>
Date: Fri, 14 Jul 2017 07:28:44 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 451df962a4cd6a0138714f1ddde5bc82e0fb04a9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 14 Jul 2017 07:18:09 +0900
Subject: [PATCH] advsync: Readjust spacing for one-column layout

The spacing parameters in commit 360582b94cb2 ("advsync: Adjust
spacing in Tables 14.1 and 14.2, consistent indirection") was
chosen for different changes of the tables in mind. Readjust them
to match the now narrower tables.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index c9c975c..0fd0b87 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -179,7 +179,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-.2in}
+\centering\OneColumnHSpace{-0.1in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
@@ -343,7 +343,7 @@ Figure~\ref{fig:advsync:Memory Misordering: Store-Buffering Litmus Test}.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-0.2in}
+\centering\OneColumnHSpace{-0.1in}
 \begin{tabular}{r||l|l|l||l|l|l}
 	& \multicolumn{3}{c||}{CPU 0} & \multicolumn{3}{c}{CPU 1} \\
 	\cline{2-7}
-- 
2.7.4

