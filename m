Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ds8v34B1uBw1Xl53Ofs90I8+qoTY+dCFhnxBHG4FlX4=;
 b=s9qo1jLyBnki7hwS5Ot8i02j10zYhbDgqeum5K08UxH3ZeTsZdPIohNOIkSqG+doSw
 MEN65E0TEPHv41bvQQBoCRC35MWvR1jevZmMwHMdR07j5vu/PTXOn7sB4SEYPocsdka/
 rhVoclvUeCB3MWd5mt+xlweXMxHJVaKBJUFIGz+6k/JUWKfWypFUSvMOHCSxlXhMXr3t
 UbvI5m1JQqo/LWXZFLCfOW0xzxNJalEN3W/YSgUhUto95Z001WtluKtSpxyPvTKRKsfA
 +G6okkSDyx9g8rcIawlkiPDKsVRNkSsZhJWDLVXHpFVequTLAOKh5ywKdT243kk0pfYg
 iFOQ==
Subject: [PATCH 4/5] memorder: Add multi-column headers to 'Summary of Memory
 Ordering' table
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3b84c143-7bae-236b-2cba-a4c737252fb3@gmail.com>
Date: Mon, 25 Sep 2017 07:06:19 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6aa821a7b0717c2944aa67b53086b7da09abee55 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 24 Sep 2017 00:43:51 +0900
Subject: [PATCH 4/5] memorder: Add multi-column headers to 'Summary of Memory Ordering' table

Also tweak the cell of "Atomic Instructions Reordered With Loads or
Stores?" for it to be vertically positioned at the center of the row.
The width of the column is now specified by the width of the parbox.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 00ff31c..4f0029a 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -3680,9 +3680,11 @@ dependencies.
 \small
 \centering
 \renewcommand*{\arraystretch}{1.2}\OneColumnHSpace{-.6in}
-\begin{tabular}{lp{2in}ccccccccccc}
+\begin{tabular}{llccccccccccc}
 	\toprule
-	\multicolumn{2}{l}{~}
+	\multicolumn{2}{l}{~} & \multicolumn{11}{c}{CPU Family} \\
+	\cmidrule{3-13}
+	\multicolumn{2}{c}{\raisebox{.5ex}{Property}}
 	& \begin{picture}(6,60)(0,0)
 		\rotatebox{90}{Alpha}
 	  \end{picture}
@@ -3728,7 +3730,7 @@ dependencies.
 \cellcolor{white}
 	& Stores Reordered After Loads?
 		 & Y   & Y   & Y   & Y     & Y  & Y     & ~   & Y & Y   & Y & Y \\
-	& Atomic Instructions Reordered With Loads or Stores?
+	& \parbox[c][6ex]{2in}{\raggedright Atomic Instructions Reordered With\par Loads or Stores?}
 		 & Y   & Y   & Y   & ~     & Y  & ~     & ~   & Y & ~   & ~ & ~ \\
 \cellcolor{white}
 	& Dependent Loads Reordered?
-- 
2.7.4


