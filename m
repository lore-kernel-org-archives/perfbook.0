Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=o/xTL0B3oL8/Ux8n8i5Lj1XUtePky0U9x8KWPQYjRAw=;
 b=HIEbR2hd5bo9/Irqd2WWFw0S9CtZ54B5uz+jK7Y+DjILFIWAWMVKTA/qgOlGmQKH3P
 AV7nn7G7qypJ/gOquBALc/W9BLC3HgvqaGG3FRxYii7RD26CvX+pQ8WEdH8V+2aj95si
 VFAy5tdqFZBXkH55XT0ZRl71Uft9TzMrHcf5oOLEpdYwG5SvM/Izu7PiU2IahCV2gdUV
 2T/U7FA0zdOyyJXoBblYoiYhu5EdM6jY7uzWOk6EWhMT5fRR5Qa19bosKAi+7gzd0avr
 ACHtjF0GXnFVW7ajH6btYuzM/WeOu3tJTT/Vhu32tkKYBV4981k54NCCvVvK+GU0DqbH
 YE/Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] Tweak width of epigraph for two-column layout
Message-ID: <7dd18275-9406-b024-9766-6fe6aa3cb7e4@gmail.com>
Date: Tue, 26 Jul 2016 23:49:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From aa7969fe4675ab8ee3c7da0470b04f90574b641c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 26 Jul 2016 20:31:20 +0900
Subject: [PATCH] Tweak width of epigraph for two-column layout

The default of \epigraphwidth is .5\textwidth.
It is too wide for two-column layout.
This commit modifies it to .65\columnwidth for two-column
layout.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/perfbook.tex b/perfbook.tex
index 9216485..24fffc6 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -102,6 +102,10 @@
 \setlength{\evensidemargin}{-4pt}
 }{}

+\IfTwoColumn{
+\setlength{\epigraphwidth}{0.65\columnwidth}
+}{}
+
 \setcounter{secnumdepth}{3}

 \frontmatter
-- 
1.9.1


