Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113; h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding; bh=/TzQtCuAtlI09p0DJB9e4V3qQ3WfAKyHLi5sIc4SACA=;
 b=NMOaXJTrPyOnCppbmKH+xNFaSNU1fzUe2zqPAW7OCmvpwm8EDfwznTrcmVxKox7LOO
 lMGpGCPnbUY4+CAJkdpaEOBqb+rJ9GM7NzR7Wy2xGw1P7HrXcaEJIpvi0A3GADsKtRwV
 kHDWPgzWBAfnXqxNL24rCIZcqWyzV3U/dupltGLR3g3AdUgy93ZcPThObhflJ6DOYwZs
 +hbwZiK4VcpmFxGJ3XtIC3Fota4ew1GC1/DwI+mw0c2wBb1+UDQhSLCl5Df9ygisHrfT
 3ksVusO4Crpg0Cd+Jt036324svmGv0wTYhskrixiS0PgOmOXzNfyb61v6BMOkjt/jK6Q 7sjQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] qqz: Add another hyperlink to black box in QQA
Message-ID: <0bf67306-7169-4ce5-ca66-b68c2833ee99@gmail.com>
Date: Sun, 17 Jul 2016 14:50:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

 From 2a74b30f0a1d036e45c6aa5ef431034c23f790db Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 12 Jul 2016 20:28:08 +0900
Subject: [PATCH] qqz: Add another hyperlink to black box in QQA

This commit adds another cross-link to the black boxes in QQA.
I think this change would meet readers' expectation.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
  qqz.sty | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qqz.sty b/qqz.sty
index 12dc85e..0c97df9 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -78,7 +78,8 @@
  	\noindent
  	\QuickQHeading{QQA}{QQ}{\QuickQuizAnswerChapter.\thequickquizctrC} #1 ~ \\ }
  
-\newcommand{\QuickA}[1]{\rule{7pt}{7pt}
+\newcommand{\QuickA}[1]{%
+	\hyperref[QQ.\QuickQuizAnswerChapter.\thequickquizctrC]{\rule{7pt}{7pt}}
  	\par\vspace{0.8\baselineskip}
  	\noindent\textbf{Answer:} \\ }
  
-- 
1.9.1

