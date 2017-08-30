Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35148 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751917AbdH3OMj (ORCPT <rfc822;perfbook@vger.kernel.org>); Wed, 30
 Aug 2017 10:12:39 -0400
Received: by mail-pf0-f194.google.com with SMTP id g13so4396766pfm.2 for
 <perfbook@vger.kernel.org>; Wed, 30 Aug 2017 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=xKH++ixjW3EdVXMeW291s63L+L70LAh2gMZdmZ36Q/4=;
 b=a9Ie/SPt8Sf9xuYpFFwmuTsoT6s0PUcoQb8Obeb+SlaMjlC5v6u9xQUMWCD/oCLI0D
 wJKtYSCFMPtMovsSIrcoiOcRJtnZBBOOuR0N29m0QtJ8JEnXKbDrB4eFoT7SCPCbUDqu
 izUoUFWNf6wI8L/h62mNOGKxEpG7b99r3L36TYA5QkoBL1LTNZ7hFBk42r8Lm7xQUAHQ
 9s8qgKSvCGyDWJcR9VM8eJZKfnSn719BuXyN3EZf7Potm7X6NTNoR2/wdqwHK7gFiDno
 r1LZLAPgI+D6pjgHAyVlTyy6ZTCY1ttr3EXIe+gFo9JnYudunqcN7DunlYOH05504PHK
 /Beg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] memorder: Adjust position of wide tables in 1c layout
Message-ID: <5ecfbfc6-2a3f-407e-1d03-01d7a088261c@gmail.com>
Date: Wed, 30 Aug 2017 23:12:31 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 10938ccbfc54a9a99f177455cb1beee2892ea3e4 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 30 Aug 2017 23:03:31 +0900
Subject: [PATCH] memorder: Adjust position of wide tables in 1c layout

Also fix typo in row count.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index e059384..56d94c3 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -424,7 +424,7 @@ things out in the end.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-0.1in}
+\centering\OneColumnHSpace{-0.7in}
 \begin{tabular}{l||c||c|c|c|c||c|c|c|c|c|c}
 	& & \multicolumn{4}{c||}{Prior Ordered Operation} &
 		\multicolumn{6}{c}{Subsequent Ordered Operation} \\
@@ -1811,7 +1811,7 @@ line to carry this new value to them.

 \begin{table*}
 \small
-\centering\OneColumnHSpace{-0.1in}
+\centering\OneColumnHSpace{-0.8in}
 \begin{tabular}{r||l|l|l|l||l|l|l}
 	& \tco{P0()} & \multicolumn{2}{c|}{\tco{P0()} \& \tco{P1()}} & \tco{P1()} & \multicolumn{3}{c}{\tco{P2()}} \\
 	\cline{2-8}
@@ -1853,7 +1853,7 @@ line to carry this new value to them.
 	11 & & \tco{x==&x} & \tco{x==&a} &
 		 & (Respond \co{x}) & & \tco{y==&c} \\
 	\hline
-	11 & (Finish store) & & \tco{x==&x} &
+	12 & (Finish store) & & \tco{x==&x} &
 		 &  & & \tco{y==&c} \\
 \end{tabular}
 \caption{Memory Ordering: WWC Sequence of Events}
-- 
2.7.4

