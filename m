Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jKMJaHnTLHlEmzUCfIM0wmlVjP26tatCbz8YHfW3sGU=;
 b=DkDyx1xEJagFxMO8d5zg/15QQ4RorSs8S0s4ly5EOa4rtpuZzNyjDJRMJ/cmERlCJd
 YQgx8YzUcjt/JsIuDe5XkVZLaCZiXbUvC+6DsPvu9SzwlToOSVl4uyzUrOkwUX8+LBzU
 pYVdcG/ve2l/KViy2zehpkFz3kTizE+5117+lidLPO6ITTn2zCdJxIvQrylS1bkSfW3G
 N9IpLm8tQVEt7bEBDRtY4MwtkDdyanpcjI0Bc3x4QxXWBRe1zeuq3IAuqd8RmmZ6zE40
 wB1mvxRjuBTl8gEfCRjkXgvEXXs+ttMVGrQKGP5BTCmxVKD0MV6b1sEr6b3wHLgd2+3L
 5YdQ==
Subject: [PATCH 5/5] memorder: Reduce color saturation of MoreThanOneValue
 figure
References: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3ae1419b-cb6d-67ff-0207-49a14dc53f6e@gmail.com>
Date: Mon, 25 Sep 2017 07:07:18 +0900
MIME-Version: 1.0
In-Reply-To: <3c66b20a-8a88-b033-e7ff-c80a6c503a36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From acefbb69d69562438d7a7568f671fc85528d5b5f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 24 Sep 2017 23:47:34 +0900
Subject: [PATCH 5/5] memorder: Reduce color saturation of MoreThanOneValue figure

Also add a label at t == 0 and separate unit (ns) from numbers
in x-axis labels.
Also add unit of (tick) to x axis of MoreThanOneValue-15CPU figure.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/MoreThanOneValue-15CPU.fig |  2 ++
 memorder/MoreThanOneValue.fig       | 26 +++++++++++++++-----------
 memorder/memorder.tex               |  2 +-
 utilities/MoreThanOneValue-15CPU.c  |  3 +++
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/memorder/MoreThanOneValue-15CPU.fig b/memorder/MoreThanOneValue-15CPU.fig
index 3171197..e36c06a 100644
--- a/memorder/MoreThanOneValue-15CPU.fig
+++ b/memorder/MoreThanOneValue-15CPU.fig
@@ -310,6 +310,7 @@ Single
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 8200 4200 8200 4300
 4 1 0 50 0 16 9 0.0000 4 90 375 8200 4450 500\001
+4 1 0 50 0 16 9 0.0000 4 90 375 8800 4450 (tick)\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 200 CPU  1\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 470 CPU  2\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 740 CPU  3\001
@@ -465,6 +466,7 @@ Single
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 7450 9060 7450 9160
 4 1 0 50 0 16 9 0.0000 4 90 375 7450 9310 45\001
+4 1 0 50 0 16 9 0.0000 4 90 375 8050 9310 (tick)\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5060 CPU  1\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5330 CPU  2\001
 4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5600 CPU  3\001
diff --git a/memorder/MoreThanOneValue.fig b/memorder/MoreThanOneValue.fig
index ae46c75..e271344 100644
--- a/memorder/MoreThanOneValue.fig
+++ b/memorder/MoreThanOneValue.fig
@@ -8,13 +8,13 @@ Single
 -2
 1200 2
 6 525 0 5055 1575
-2 2 0 1 0 4 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 4 50 0 30 0.000 0 0 -1 0 0 5
 	 765 0 2970 0 2970 270 765 270 765 0
 2 2 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 5
 	 585 270 5040 270 5040 540 585 540 585 270
-2 2 0 1 0 2 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 2 50 0 30 0.000 0 0 -1 0 0 5
 	 675 810 540 810 540 540 675 540 675 810
-2 2 0 1 0 11 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 11 50 0 30 0.000 0 0 -1 0 0 5
 	 720 810 4770 810 4770 1080 720 1080 720 810
 2 2 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 5
 	 5040 810 675 810 675 540 5040 540 5040 810
@@ -22,11 +22,11 @@ Single
 	 5040 1080 4770 1080 4770 810 5040 810 5040 1080
 2 2 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 5
 	 5040 0 2970 0 2970 270 5040 270 5040 0
-2 2 0 1 0 0 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 0 50 0 10 0.000 0 0 -1 0 0 5
 	 720 1080 540 1080 540 810 720 810 720 1080
-2 2 0 1 0 0 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 0 50 0 10 0.000 0 0 -1 0 0 5
 	 585 540 540 540 540 270 585 270 585 540
-2 2 0 1 0 0 50 0 20 0.000 0 0 -1 0 0 5
+2 2 0 1 0 0 50 0 10 0.000 0 0 -1 0 0 5
 	 765 270 540 270 540 0 765 0 765 270
 2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2
 	1 1 1.00 60.00 120.00
@@ -43,17 +43,21 @@ Single
 	 2250 1305 2250 1440
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 1395 1305 1395 1440
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 540 1305 540 1440
 4 1 0 50 0 18 9 0.0000 4 90 75 1890 180 1\001
 4 1 0 50 0 18 9 0.0000 4 90 75 2835 450 2\001
 4 1 0 50 0 18 9 0.0000 4 90 75 2745 990 4\001
 4 1 0 50 0 18 9 0.0000 4 90 75 4005 180 2\001
 4 1 0 50 0 18 9 0.0000 4 90 75 2880 720 2\001
 4 1 0 50 0 18 9 0.0000 4 90 75 4905 990 2\001
-4 1 0 50 0 16 9 0.0000 4 90 375 1395 1575 100ns\001
-4 1 0 50 0 16 9 0.0000 4 90 375 2250 1575 200ns\001
-4 1 0 50 0 16 9 0.0000 4 90 375 3060 1575 300ns\001
-4 1 0 50 0 16 9 0.0000 4 90 375 3915 1575 400ns\001
-4 1 0 50 0 16 9 0.0000 4 90 375 4770 1575 500ns\001
+4 1 0 50 0 16 9 0.0000 4 90 375 540 1575 0\001
+4 1 0 50 0 16 9 0.0000 4 90 375 1395 1575 100\001
+4 1 0 50 0 16 9 0.0000 4 90 375 2250 1575 200\001
+4 1 0 50 0 16 9 0.0000 4 90 375 3060 1575 300\001
+4 1 0 50 0 16 9 0.0000 4 90 375 3915 1575 400\001
+4 1 0 50 0 16 9 0.0000 4 90 375 4770 1575 500\001
+4 1 0 50 0 16 9 0.0000 4 90 375 5100 1575 (ns)\001
 4 1 0 50 0 18 9 0.0000 4 90 75 604 720 3\001
 -6
 4 0 0 50 0 16 9 0.0000 4 105 420 0 450 CPU 2\001
diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 4f0029a..3885787 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -841,7 +841,7 @@ to allow observations of intermediate cache states.
 \end{figure}

 Each horizontal bar represents the observations of a given CPU over time,
-with the black regions to the left indicating the time before the
+with the gray regions to the left indicating the time before the
 corresponding CPU's first measurement.
 During the first 5\,ns, only CPU~3 has an opinion about the value of the
 variable.
diff --git a/utilities/MoreThanOneValue-15CPU.c b/utilities/MoreThanOneValue-15CPU.c
index d9fbc75..e06d78b 100644
--- a/utilities/MoreThanOneValue-15CPU.c
+++ b/utilities/MoreThanOneValue-15CPU.c
@@ -146,6 +146,9 @@ int draw_diagram(int n, int m, const struct color_table_s *col_table, int y_offs
 	       (ruler_tick * i)/tim_width);
 	i++;
     } while (ruler_tick * i < fig_width);
+    printf("4 1 0 50 0 16 9 0.0000 4 90 375 %d %d %s\\001\n",
+	   fig_base + ruler_tick * i - 150, bar_height * CPU_NUM + 400 + y_offset,
+	   "(tick)");
     /* label CPU */
     for (i = 0; i < CPU_NUM; i++) {
 	printf("4 2 0 50 0 16 8.5 0.0000 4 105 420 %d %d CPU %2d\\001\n",
-- 
2.7.4


