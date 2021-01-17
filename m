Return-Path: <SRS0=Srvm=GU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tEWkV5pp1/e790UJbffqDQPbPvSE6zyTzdz72W9ha0Q=;
        b=h7OWo8NHRKBUHzbgr1bygvu78Y0OZRyfEuf5TKzSm7xgWU6br6kULR1YOdSKSJeJRa
         H6qZgpQY9p7GMmEKyQqiSsvop3RHIy8S2jDIy4sCWBebuxPyR1JZO0P+xnn2uOEjuw00
         9eAM+3mL3GMc/PS/g+NVZU2ELYK0ySenCL2745m/3McbBSBa9zQVQibVCYcEkaQVgL86
         XAxIASIXt0C9gdYvW2vadi4zZwKIl+dP1Zl7nphgAAM/0rqRQ9Mf8OQVZ+QES3cPZ1Op
         Hf4vYfzHaoC0Yac9024M7AKCrdRHXiJtq1U0yznQN+z7L1ZsPJQ+giqescHLN699RPxD
         qXTQ==
Subject: [PATCH 3/3] formal: Extend bar chart in Figure 12.4 up to Linux v5.10
References: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ed274871-65e1-2843-4e66-83080c57030f@gmail.com>
Date: Mon, 18 Jan 2021 00:08:45 +0900
MIME-Version: 1.0
In-Reply-To: <25e9a0f4-8903-1523-9d04-ce34d7d97db6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Collect data up to Linux v5.10.

It turned out that the data collected in commit b6511301793c
("formal: Add discussion of RCU's evolving test suite")
had offset of 381 lines in RCU code.
Fix the data and bar chart with the data collected in freshly
cloned repository of Linux kernel.
As the x and y labels has become too busy, x labels are put
(mostly) every 4 release, and y label tick is increased to 5000.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/RCU-test-ratio.eps | 2373 ++++++++++++++++++++-----------------
 formal/data/plot.sh       |    4 +-
 formal/data/rcu-test.dat  |  149 +--
 3 files changed, 1337 insertions(+), 1189 deletions(-)

diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
index 6622b441..0825615f 100644
--- a/formal/RCU-test-ratio.eps
+++ b/formal/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Jun 15 22:01:22 2020
+%%CreationDate: Sun Jan 17 22:07:18 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Jun 15 22:01:22 2020)
+  /CreationDate (Sun Jan 17 22:07:18 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1926,29 +1926,11 @@ stroke
 1.000 UL
 LTb
 LCb setrgbcolor
-551 613 M
--63 0 V
-stroke
-440 613 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 2000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
 551 713 M
 -63 0 V
 stroke
 440 713 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 4000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
-551 814 M
--63 0 V
-stroke
-440 814 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 6000)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 5000)]
 ] -26.7 MRshow
 1.000 UL
 LTb
@@ -1957,15 +1939,6 @@ LCb setrgbcolor
 -63 0 V
 stroke
 440 915 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 8000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
-551 1015 M
--63 0 V
-stroke
-440 1015 M
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 10000)]
 ] -26.7 MRshow
 1.000 UL
@@ -1975,16 +1948,7 @@ LCb setrgbcolor
 -63 0 V
 stroke
 440 1116 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 12000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
-551 1217 M
--63 0 V
-stroke
-440 1217 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 14000)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 15000)]
 ] -26.7 MRshow
 1.000 UL
 LTb
@@ -1993,16 +1957,7 @@ LCb setrgbcolor
 -63 0 V
 stroke
 440 1317 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 16000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
-551 1418 M
--63 0 V
-stroke
-440 1418 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 18000)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20000)]
 ] -26.7 MRshow
 1.000 UL
 LTb
@@ -2011,16 +1966,7 @@ LCb setrgbcolor
 -63 0 V
 stroke
 440 1519 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20000)]
-] -26.7 MRshow
-1.000 UL
-LTb
-LCb setrgbcolor
-551 1619 M
--63 0 V
-stroke
-440 1619 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 22000)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 25000)]
 ] -26.7 MRshow
 1.000 UL
 LTb
@@ -2029,14 +1975,14 @@ LCb setrgbcolor
 -63 0 V
 stroke
 440 1720 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 24000)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30000)]
 ] -26.7 MRshow
 1.000 UL
 LTb
 LCb setrgbcolor
-593 512 M
+587 512 M
 stroke
-593 464 M
+587 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
 ] -26.7 MRshow
@@ -2044,27 +1990,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-635 512 M
+624 512 M
 stroke
 LTb
 LCb setrgbcolor
-678 512 M
+660 512 M
 stroke
-678 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.14)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-720 512 M
+697 512 M
 stroke
 LTb
 LCb setrgbcolor
-762 512 M
+733 512 M
 stroke
-762 464 M
+733 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
 ] -26.7 MRshow
@@ -2072,27 +2012,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-804 512 M
+770 512 M
 stroke
 LTb
 LCb setrgbcolor
-846 512 M
+806 512 M
 stroke
-846 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.18)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-888 512 M
+843 512 M
 stroke
 LTb
 LCb setrgbcolor
-931 512 M
+879 512 M
 stroke
-931 464 M
+879 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
 ] -26.7 MRshow
@@ -2100,27 +2034,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-973 512 M
+916 512 M
 stroke
 LTb
 LCb setrgbcolor
-1015 512 M
+952 512 M
 stroke
-1015 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.22)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1057 512 M
+988 512 M
 stroke
 LTb
 LCb setrgbcolor
-1099 512 M
+1025 512 M
 stroke
-1099 464 M
+1025 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
 ] -26.7 MRshow
@@ -2128,27 +2056,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1142 512 M
+1061 512 M
 stroke
 LTb
 LCb setrgbcolor
-1184 512 M
+1098 512 M
 stroke
-1184 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.26)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1226 512 M
+1134 512 M
 stroke
 LTb
 LCb setrgbcolor
-1268 512 M
+1171 512 M
 stroke
-1268 464 M
+1171 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
 ] -26.7 MRshow
@@ -2156,27 +2078,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1310 512 M
+1207 512 M
 stroke
 LTb
 LCb setrgbcolor
-1353 512 M
+1244 512 M
 stroke
-1353 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.30)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1395 512 M
+1280 512 M
 stroke
 LTb
 LCb setrgbcolor
-1437 512 M
+1317 512 M
 stroke
-1437 464 M
+1317 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
 ] -26.7 MRshow
@@ -2184,27 +2100,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1479 512 M
+1353 512 M
 stroke
 LTb
 LCb setrgbcolor
-1521 512 M
+1390 512 M
 stroke
-1521 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.34)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1563 512 M
+1426 512 M
 stroke
 LTb
 LCb setrgbcolor
-1606 512 M
+1462 512 M
 stroke
-1606 464 M
+1462 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
 ] -26.7 MRshow
@@ -2212,27 +2122,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1648 512 M
+1499 512 M
 stroke
 LTb
 LCb setrgbcolor
-1690 512 M
+1535 512 M
 stroke
-1690 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.38)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1732 512 M
+1572 512 M
 stroke
 LTb
 LCb setrgbcolor
-1774 512 M
+1608 512 M
 stroke
-1774 464 M
+1608 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
 ] -26.7 MRshow
@@ -2240,27 +2144,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1817 512 M
+1645 512 M
 stroke
 LTb
 LCb setrgbcolor
-1859 512 M
+1681 512 M
 stroke
-1859 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.2)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-1901 512 M
+1718 512 M
 stroke
 LTb
 LCb setrgbcolor
-1943 512 M
+1754 512 M
 stroke
-1943 464 M
+1754 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
 ] -26.7 MRshow
@@ -2268,27 +2166,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1985 512 M
+1791 512 M
 stroke
 LTb
 LCb setrgbcolor
-2028 512 M
+1827 512 M
 stroke
-2028 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.6)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2070 512 M
+1863 512 M
 stroke
 LTb
 LCb setrgbcolor
-2112 512 M
+1900 512 M
 stroke
-2112 464 M
+1900 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
 ] -26.7 MRshow
@@ -2296,27 +2188,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2154 512 M
+1936 512 M
 stroke
 LTb
 LCb setrgbcolor
-2196 512 M
+1973 512 M
 stroke
-2196 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.10)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2238 512 M
+2009 512 M
 stroke
 LTb
 LCb setrgbcolor
-2281 512 M
+2046 512 M
 stroke
-2281 464 M
+2046 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
 ] -26.7 MRshow
@@ -2324,27 +2210,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2323 512 M
+2082 512 M
 stroke
 LTb
 LCb setrgbcolor
-2365 512 M
+2119 512 M
 stroke
-2365 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.14)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2407 512 M
+2155 512 M
 stroke
 LTb
 LCb setrgbcolor
-2449 512 M
+2192 512 M
 stroke
-2449 464 M
+2192 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
 ] -26.7 MRshow
@@ -2352,27 +2232,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2492 512 M
+2228 512 M
 stroke
 LTb
 LCb setrgbcolor
-2534 512 M
+2264 512 M
 stroke
-2534 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.18)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2576 512 M
+2301 512 M
 stroke
 LTb
 LCb setrgbcolor
-2618 512 M
+2337 512 M
 stroke
-2618 464 M
+2337 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
 ] -26.7 MRshow
@@ -2380,27 +2254,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2660 512 M
+2374 512 M
 stroke
 LTb
 LCb setrgbcolor
-2702 512 M
+2410 512 M
 stroke
-2702 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.2)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2745 512 M
+2447 512 M
 stroke
 LTb
 LCb setrgbcolor
-2787 512 M
+2483 512 M
 stroke
-2787 464 M
+2483 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
 ] -26.7 MRshow
@@ -2408,27 +2276,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2829 512 M
+2520 512 M
 stroke
 LTb
 LCb setrgbcolor
-2871 512 M
+2556 512 M
 stroke
-2871 464 M
-currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.6)]
-] -26.7 MRshow
-grestore
-1.000 UL
 LTb
 LCb setrgbcolor
-2913 512 M
+2593 512 M
 stroke
 LTb
 LCb setrgbcolor
-2956 512 M
+2629 512 M
 stroke
-2956 464 M
+2629 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
 ] -26.7 MRshow
@@ -2436,85 +2298,129 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2998 512 M
+2665 512 M
 stroke
 LTb
 LCb setrgbcolor
-3040 512 M
+2702 512 M
+stroke
+LTb
+LCb setrgbcolor
+2738 512 M
+stroke
+LTb
+LCb setrgbcolor
+2775 512 M
 stroke
-3040 464 M
+2775 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.10)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
 ] -26.7 MRshow
 grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3082 512 M
+2811 512 M
 stroke
 LTb
 LCb setrgbcolor
-3124 512 M
+2848 512 M
 stroke
-3124 464 M
+LTb
+LCb setrgbcolor
+2884 512 M
+stroke
+LTb
+LCb setrgbcolor
+2921 512 M
+stroke
+2921 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
 ] -26.7 MRshow
 grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3167 512 M
+2957 512 M
+stroke
+LTb
+LCb setrgbcolor
+2994 512 M
 stroke
 LTb
 LCb setrgbcolor
-3209 512 M
+3030 512 M
 stroke
-3209 464 M
+LTb
+LCb setrgbcolor
+3067 512 M
+stroke
+LTb
+LCb setrgbcolor
+3103 512 M
+stroke
+3103 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.14)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
 ] -26.7 MRshow
 grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3251 512 M
+3139 512 M
 stroke
 LTb
 LCb setrgbcolor
-3293 512 M
+3176 512 M
 stroke
-3293 464 M
+LTb
+LCb setrgbcolor
+3212 512 M
+stroke
+LTb
+LCb setrgbcolor
+3249 512 M
+stroke
+3249 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
 ] -26.7 MRshow
 grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3335 512 M
+3285 512 M
+stroke
+LTb
+LCb setrgbcolor
+3322 512 M
+stroke
+LTb
+LCb setrgbcolor
+3358 512 M
 stroke
 LTb
 LCb setrgbcolor
-3377 512 M
+3395 512 M
 stroke
-3377 464 M
+3395 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.18)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
 ] -26.7 MRshow
 grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3420 512 M
+3431 512 M
 stroke
 LTb
 LCb setrgbcolor
-3462 512 M
+3468 512 M
 stroke
-3462 464 M
+3468 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.20)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.10)]
 ] -26.7 MRshow
 grestore
 1.000 UL
@@ -2625,693 +2531,803 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 578 512 31 59 BoxColFill
+0.00 0.00 0.00 C 0.200 575 512 26 32 BoxColFill
 LCb setrgbcolor
-578 512 N
-0 58 V
-30 0 V
-0 -58 V
--30 0 V
+575 512 N
+0 31 V
+25 0 V
+0 -31 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 621 512 30 59 BoxColFill
+0.00 0.00 0.00 C 0.200 611 512 27 32 BoxColFill
 LCb setrgbcolor
-621 512 N
-0 58 V
-29 0 V
-0 -58 V
--29 0 V
+611 512 N
+0 31 V
+26 0 V
+0 -31 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 663 512 30 71 BoxColFill
+0.00 0.00 0.00 C 0.200 648 512 26 42 BoxColFill
 LCb setrgbcolor
-663 512 N
-0 70 V
-29 0 V
-0 -70 V
--29 0 V
+648 512 N
+0 41 V
+25 0 V
+0 -41 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 705 512 31 74 BoxColFill
+0.00 0.00 0.00 C 0.200 684 512 27 44 BoxColFill
 LCb setrgbcolor
-705 512 N
-0 73 V
-30 0 V
-0 -73 V
--30 0 V
+684 512 N
+0 43 V
+26 0 V
+0 -43 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 747 512 31 65 BoxColFill
+0.00 0.00 0.00 C 0.200 721 512 26 37 BoxColFill
 LCb setrgbcolor
-747 512 N
-0 64 V
-30 0 V
-0 -64 V
--30 0 V
+721 512 N
+0 36 V
+25 0 V
+0 -36 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 789 512 31 66 BoxColFill
+0.00 0.00 0.00 C 0.200 757 512 27 37 BoxColFill
 LCb setrgbcolor
-789 512 N
-0 65 V
-30 0 V
-0 -65 V
--30 0 V
+757 512 N
+0 36 V
+26 0 V
+0 -36 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 832 512 30 67 BoxColFill
+0.00 0.00 0.00 C 0.200 793 512 27 38 BoxColFill
 LCb setrgbcolor
-832 512 N
-0 66 V
-29 0 V
-0 -66 V
--29 0 V
+793 512 N
+0 37 V
+26 0 V
+0 -37 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 874 512 30 82 BoxColFill
+0.00 0.00 0.00 C 0.200 830 512 26 51 BoxColFill
 LCb setrgbcolor
-874 512 N
-0 81 V
-29 0 V
-0 -81 V
--29 0 V
+830 512 N
+0 50 V
+25 0 V
+0 -50 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 916 512 30 82 BoxColFill
+0.00 0.00 0.00 C 0.200 866 512 27 51 BoxColFill
 LCb setrgbcolor
-916 512 N
-0 81 V
-29 0 V
-0 -81 V
--29 0 V
+866 512 N
+0 50 V
+26 0 V
+0 -50 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 958 512 31 82 BoxColFill
+0.00 0.00 0.00 C 0.200 903 512 26 51 BoxColFill
 LCb setrgbcolor
-958 512 N
-0 81 V
-30 0 V
-0 -81 V
--30 0 V
+903 512 N
+0 50 V
+25 0 V
+0 -50 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1000 512 31 82 BoxColFill
+0.00 0.00 0.00 C 0.200 939 512 27 51 BoxColFill
 LCb setrgbcolor
-1000 512 N
-0 81 V
-30 0 V
-0 -81 V
--30 0 V
+939 512 N
+0 50 V
+26 0 V
+0 -50 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1042 512 31 82 BoxColFill
+0.00 0.00 0.00 C 0.200 976 512 26 51 BoxColFill
 LCb setrgbcolor
-1042 512 N
-0 81 V
-30 0 V
-0 -81 V
--30 0 V
+976 512 N
+0 50 V
+25 0 V
+0 -50 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1085 512 30 84 BoxColFill
+0.00 0.00 0.00 C 0.200 1012 512 27 52 BoxColFill
+LCb setrgbcolor
+1012 512 N
+0 51 V
+26 0 V
+0 -51 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1049 512 26 128 BoxColFill
+LCb setrgbcolor
+1049 512 N
+0 127 V
+25 0 V
+0 -127 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1085 512 27 128 BoxColFill
 LCb setrgbcolor
 1085 512 N
-0 83 V
-29 0 V
-0 -83 V
--29 0 V
+0 127 V
+26 0 V
+0 -127 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1127 512 30 179 BoxColFill
+0.00 0.00 0.00 C 0.200 1122 512 26 161 BoxColFill
 LCb setrgbcolor
-1127 512 N
-0 178 V
-29 0 V
-0 -178 V
--29 0 V
+1122 512 N
+0 160 V
+25 0 V
+0 -160 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1169 512 31 178 BoxColFill
+0.00 0.00 0.00 C 0.200 1158 512 27 169 BoxColFill
 LCb setrgbcolor
-1169 512 N
-0 177 V
-30 0 V
-0 -177 V
--30 0 V
+1158 512 N
+0 168 V
+26 0 V
+0 -168 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1211 512 31 221 BoxColFill
+0.00 0.00 0.00 C 0.200 1194 512 27 262 BoxColFill
 LCb setrgbcolor
-1211 512 N
-0 220 V
-30 0 V
-0 -220 V
--30 0 V
+1194 512 N
+0 261 V
+26 0 V
+0 -261 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1253 512 31 230 BoxColFill
+0.00 0.00 0.00 C 0.200 1231 512 26 264 BoxColFill
 LCb setrgbcolor
-1253 512 N
-0 229 V
-30 0 V
-0 -229 V
--30 0 V
+1231 512 N
+0 263 V
+25 0 V
+0 -263 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1267 512 27 268 BoxColFill
+LCb setrgbcolor
+1267 512 N
+0 267 V
+26 0 V
+0 -267 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1296 512 30 346 BoxColFill
+0.00 0.00 0.00 C 0.200 1304 512 26 182 BoxColFill
 LCb setrgbcolor
-1296 512 N
-0 345 V
-29 0 V
-0 -345 V
--29 0 V
+1304 512 N
+0 181 V
+25 0 V
+0 -181 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1338 512 30 349 BoxColFill
+0.00 0.00 0.00 C 0.200 1340 512 27 213 BoxColFill
 LCb setrgbcolor
-1338 512 N
-0 348 V
-29 0 V
-0 -348 V
--29 0 V
+1340 512 N
+0 212 V
+26 0 V
+0 -212 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1380 512 30 354 BoxColFill
+0.00 0.00 0.00 C 0.200 1377 512 26 237 BoxColFill
 LCb setrgbcolor
-1380 512 N
-0 353 V
-29 0 V
-0 -353 V
--29 0 V
+1377 512 N
+0 236 V
+25 0 V
+0 -236 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1422 512 31 246 BoxColFill
+0.00 0.00 0.00 C 0.200 1413 512 27 246 BoxColFill
 LCb setrgbcolor
-1422 512 N
+1413 512 N
 0 245 V
-30 0 V
+26 0 V
 0 -245 V
--30 0 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1464 512 31 285 BoxColFill
+0.00 0.00 0.00 C 0.200 1450 512 26 256 BoxColFill
 LCb setrgbcolor
-1464 512 N
-0 284 V
-30 0 V
-0 -284 V
--30 0 V
+1450 512 N
+0 255 V
+25 0 V
+0 -255 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1507 512 30 315 BoxColFill
+0.00 0.00 0.00 C 0.200 1486 512 27 288 BoxColFill
 LCb setrgbcolor
-1507 512 N
-0 314 V
-29 0 V
-0 -314 V
--29 0 V
+1486 512 N
+0 287 V
+26 0 V
+0 -287 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1523 512 26 317 BoxColFill
+LCb setrgbcolor
+1523 512 N
+0 316 V
+25 0 V
+0 -316 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1549 512 30 327 BoxColFill
+0.00 0.00 0.00 C 0.200 1559 512 27 317 BoxColFill
 LCb setrgbcolor
-1549 512 N
-0 326 V
-29 0 V
-0 -326 V
--29 0 V
+1559 512 N
+0 316 V
+26 0 V
+0 -316 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1591 512 30 339 BoxColFill
+0.00 0.00 0.00 C 0.200 1595 512 27 365 BoxColFill
 LCb setrgbcolor
-1591 512 N
-0 338 V
-29 0 V
-0 -338 V
--29 0 V
+1595 512 N
+0 364 V
+26 0 V
+0 -364 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1633 512 31 379 BoxColFill
+0.00 0.00 0.00 C 0.200 1632 512 26 365 BoxColFill
 LCb setrgbcolor
-1633 512 N
-0 378 V
-30 0 V
-0 -378 V
--30 0 V
+1632 512 N
+0 364 V
+25 0 V
+0 -364 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1675 512 31 415 BoxColFill
+0.00 0.00 0.00 C 0.200 1668 512 27 372 BoxColFill
 LCb setrgbcolor
-1675 512 N
+1668 512 N
+0 371 V
+26 0 V
+0 -371 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1705 512 26 393 BoxColFill
+LCb setrgbcolor
+1705 512 N
+0 392 V
+25 0 V
+0 -392 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 1741 512 27 415 BoxColFill
+LCb setrgbcolor
+1741 512 N
 0 414 V
-30 0 V
+26 0 V
 0 -414 V
--30 0 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1717 512 31 416 BoxColFill
+0.00 0.00 0.00 C 0.200 1778 512 26 441 BoxColFill
 LCb setrgbcolor
-1717 512 N
-0 415 V
-30 0 V
-0 -415 V
--30 0 V
+1778 512 N
+0 440 V
+25 0 V
+0 -440 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1760 512 30 475 BoxColFill
+0.00 0.00 0.00 C 0.200 1814 512 27 441 BoxColFill
 LCb setrgbcolor
-1760 512 N
-0 474 V
-29 0 V
-0 -474 V
--29 0 V
+1814 512 N
+0 440 V
+26 0 V
+0 -440 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1802 512 30 475 BoxColFill
+0.00 0.00 0.00 C 0.200 1851 512 26 443 BoxColFill
 LCb setrgbcolor
-1802 512 N
-0 474 V
-29 0 V
-0 -474 V
--29 0 V
+1851 512 N
+0 442 V
+25 0 V
+0 -442 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1844 512 31 484 BoxColFill
+0.00 0.00 0.00 C 0.200 1887 512 27 467 BoxColFill
 LCb setrgbcolor
-1844 512 N
-0 483 V
-30 0 V
-0 -483 V
--30 0 V
+1887 512 N
+0 466 V
+26 0 V
+0 -466 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1886 512 31 511 BoxColFill
+0.00 0.00 0.00 C 0.200 1924 512 26 476 BoxColFill
 LCb setrgbcolor
-1886 512 N
-0 510 V
-30 0 V
-0 -510 V
--30 0 V
+1924 512 N
+0 475 V
+25 0 V
+0 -475 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1928 512 31 538 BoxColFill
+0.00 0.00 0.00 C 0.200 1960 512 27 477 BoxColFill
 LCb setrgbcolor
-1928 512 N
-0 537 V
-30 0 V
-0 -537 V
--30 0 V
+1960 512 N
+0 476 V
+26 0 V
+0 -476 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 1971 512 30 570 BoxColFill
+0.00 0.00 0.00 C 0.200 1997 512 26 433 BoxColFill
 LCb setrgbcolor
-1971 512 N
-0 569 V
-29 0 V
-0 -569 V
--29 0 V
+1997 512 N
+0 432 V
+25 0 V
+0 -432 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2013 512 30 570 BoxColFill
+0.00 0.00 0.00 C 0.200 2033 512 26 450 BoxColFill
 LCb setrgbcolor
-2013 512 N
-0 569 V
-29 0 V
-0 -569 V
--29 0 V
+2033 512 N
+0 449 V
+25 0 V
+0 -449 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2055 512 30 572 BoxColFill
+0.00 0.00 0.00 C 0.200 2069 512 27 458 BoxColFill
 LCb setrgbcolor
-2055 512 N
-0 571 V
-29 0 V
-0 -571 V
--29 0 V
+2069 512 N
+0 457 V
+26 0 V
+0 -457 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2097 512 31 603 BoxColFill
+0.00 0.00 0.00 C 0.200 2106 512 26 467 BoxColFill
 LCb setrgbcolor
-2097 512 N
-0 602 V
-30 0 V
-0 -602 V
--30 0 V
+2106 512 N
+0 466 V
+25 0 V
+0 -466 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2139 512 31 613 BoxColFill
+0.00 0.00 0.00 C 0.200 2142 512 27 469 BoxColFill
 LCb setrgbcolor
-2139 512 N
-0 612 V
-30 0 V
-0 -612 V
--30 0 V
+2142 512 N
+0 468 V
+26 0 V
+0 -468 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2181 512 31 616 BoxColFill
+0.00 0.00 0.00 C 0.200 2179 512 26 478 BoxColFill
 LCb setrgbcolor
-2181 512 N
-0 615 V
-30 0 V
-0 -615 V
--30 0 V
+2179 512 N
+0 477 V
+25 0 V
+0 -477 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2224 512 30 561 BoxColFill
+0.00 0.00 0.00 C 0.200 2215 512 27 488 BoxColFill
 LCb setrgbcolor
-2224 512 N
-0 560 V
-29 0 V
-0 -560 V
--29 0 V
+2215 512 N
+0 487 V
+26 0 V
+0 -487 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2266 512 30 581 BoxColFill
+0.00 0.00 0.00 C 0.200 2252 512 26 512 BoxColFill
 LCb setrgbcolor
-2266 512 N
-0 580 V
-29 0 V
-0 -580 V
--29 0 V
+2252 512 N
+0 511 V
+25 0 V
+0 -511 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2308 512 31 592 BoxColFill
+0.00 0.00 0.00 C 0.200 2288 512 27 517 BoxColFill
 LCb setrgbcolor
-2308 512 N
-0 591 V
-30 0 V
-0 -591 V
--30 0 V
+2288 512 N
+0 516 V
+26 0 V
+0 -516 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2350 512 31 602 BoxColFill
+0.00 0.00 0.00 C 0.200 2325 512 26 515 BoxColFill
 LCb setrgbcolor
-2350 512 N
-0 601 V
-30 0 V
-0 -601 V
--30 0 V
+2325 512 N
+0 514 V
+25 0 V
+0 -514 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2392 512 31 605 BoxColFill
+0.00 0.00 0.00 C 0.200 2361 512 27 525 BoxColFill
 LCb setrgbcolor
-2392 512 N
-0 604 V
-30 0 V
-0 -604 V
--30 0 V
+2361 512 N
+0 524 V
+26 0 V
+0 -524 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2435 512 30 616 BoxColFill
+0.00 0.00 0.00 C 0.200 2398 512 26 526 BoxColFill
 LCb setrgbcolor
-2435 512 N
-0 615 V
-29 0 V
-0 -615 V
--29 0 V
+2398 512 N
+0 525 V
+25 0 V
+0 -525 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2477 512 30 628 BoxColFill
+0.00 0.00 0.00 C 0.200 2434 512 27 532 BoxColFill
 LCb setrgbcolor
-2477 512 N
-0 627 V
-29 0 V
-0 -627 V
--29 0 V
+2434 512 N
+0 531 V
+26 0 V
+0 -531 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2519 512 30 659 BoxColFill
+0.00 0.00 0.00 C 0.200 2470 512 27 557 BoxColFill
 LCb setrgbcolor
-2519 512 N
-0 658 V
-29 0 V
-0 -658 V
--29 0 V
+2470 512 N
+0 556 V
+26 0 V
+0 -556 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2561 512 31 665 BoxColFill
+0.00 0.00 0.00 C 0.200 2507 512 26 564 BoxColFill
 LCb setrgbcolor
-2561 512 N
-0 664 V
-30 0 V
-0 -664 V
--30 0 V
+2507 512 N
+0 563 V
+25 0 V
+0 -563 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2603 512 31 663 BoxColFill
+0.00 0.00 0.00 C 0.200 2543 512 27 568 BoxColFill
 LCb setrgbcolor
-2603 512 N
-0 662 V
-30 0 V
-0 -662 V
--30 0 V
+2543 512 N
+0 567 V
+26 0 V
+0 -567 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2646 512 30 675 BoxColFill
+0.00 0.00 0.00 C 0.200 2580 512 26 574 BoxColFill
 LCb setrgbcolor
-2646 512 N
-0 674 V
-29 0 V
-0 -674 V
--29 0 V
+2580 512 N
+0 573 V
+25 0 V
+0 -573 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2688 512 30 676 BoxColFill
+0.00 0.00 0.00 C 0.200 2616 512 27 577 BoxColFill
 LCb setrgbcolor
-2688 512 N
-0 675 V
-29 0 V
-0 -675 V
--29 0 V
+2616 512 N
+0 576 V
+26 0 V
+0 -576 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2730 512 30 683 BoxColFill
+0.00 0.00 0.00 C 0.200 2653 512 26 580 BoxColFill
 LCb setrgbcolor
-2730 512 N
-0 682 V
-29 0 V
-0 -682 V
--29 0 V
+2653 512 N
+0 579 V
+25 0 V
+0 -579 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2772 512 31 715 BoxColFill
+0.00 0.00 0.00 C 0.200 2689 512 27 583 BoxColFill
 LCb setrgbcolor
-2772 512 N
-0 714 V
-30 0 V
-0 -714 V
--30 0 V
+2689 512 N
+0 582 V
+26 0 V
+0 -582 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2814 512 31 724 BoxColFill
+0.00 0.00 0.00 C 0.200 2726 512 26 591 BoxColFill
 LCb setrgbcolor
-2814 512 N
-0 723 V
-30 0 V
-0 -723 V
--30 0 V
+2726 512 N
+0 590 V
+25 0 V
+0 -590 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2856 512 31 729 BoxColFill
+0.00 0.00 0.00 C 0.200 2762 512 27 691 BoxColFill
 LCb setrgbcolor
-2856 512 N
-0 728 V
-30 0 V
-0 -728 V
--30 0 V
+2762 512 N
+0 690 V
+26 0 V
+0 -690 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2899 512 30 736 BoxColFill
+0.00 0.00 0.00 C 0.200 2799 512 26 625 BoxColFill
 LCb setrgbcolor
-2899 512 N
-0 735 V
-29 0 V
-0 -735 V
--29 0 V
+2799 512 N
+0 624 V
+25 0 V
+0 -624 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2941 512 30 740 BoxColFill
+0.00 0.00 0.00 C 0.200 2835 512 27 621 BoxColFill
 LCb setrgbcolor
-2941 512 N
-0 739 V
-29 0 V
-0 -739 V
--29 0 V
+2835 512 N
+0 620 V
+26 0 V
+0 -620 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 2983 512 31 744 BoxColFill
+0.00 0.00 0.00 C 0.200 2871 512 27 624 BoxColFill
 LCb setrgbcolor
-2983 512 N
-0 743 V
-30 0 V
-0 -743 V
--30 0 V
+2871 512 N
+0 623 V
+26 0 V
+0 -623 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3025 512 31 747 BoxColFill
+0.00 0.00 0.00 C 0.200 2908 512 26 621 BoxColFill
 LCb setrgbcolor
-3025 512 N
-0 746 V
-30 0 V
-0 -746 V
--30 0 V
+2908 512 N
+0 620 V
+25 0 V
+0 -620 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3067 512 31 758 BoxColFill
+0.00 0.00 0.00 C 0.200 2944 512 27 621 BoxColFill
 LCb setrgbcolor
-3067 512 N
-0 757 V
-30 0 V
-0 -757 V
--30 0 V
+2944 512 N
+0 620 V
+26 0 V
+0 -620 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3110 512 30 882 BoxColFill
+0.00 0.00 0.00 C 0.200 2981 512 26 620 BoxColFill
 LCb setrgbcolor
-3110 512 N
-0 881 V
-29 0 V
-0 -881 V
--29 0 V
+2981 512 N
+0 619 V
+25 0 V
+0 -619 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3152 512 30 800 BoxColFill
+0.00 0.00 0.00 C 0.200 3017 512 27 629 BoxColFill
 LCb setrgbcolor
-3152 512 N
-0 799 V
-29 0 V
-0 -799 V
--29 0 V
+3017 512 N
+0 628 V
+26 0 V
+0 -628 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3194 512 30 795 BoxColFill
+0.00 0.00 0.00 C 0.200 3054 512 26 611 BoxColFill
 LCb setrgbcolor
-3194 512 N
-0 794 V
-29 0 V
-0 -794 V
--29 0 V
+3054 512 N
+0 610 V
+25 0 V
+0 -610 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3236 512 31 799 BoxColFill
+0.00 0.00 0.00 C 0.200 3090 512 27 614 BoxColFill
+LCb setrgbcolor
+3090 512 N
+0 613 V
+26 0 V
+0 -613 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 3127 512 26 596 BoxColFill
+LCb setrgbcolor
+3127 512 N
+0 595 V
+25 0 V
+0 -595 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 3163 512 27 594 BoxColFill
+LCb setrgbcolor
+3163 512 N
+0 593 V
+26 0 V
+0 -593 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 3200 512 26 599 BoxColFill
+LCb setrgbcolor
+3200 512 N
+0 598 V
+25 0 V
+0 -598 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 3236 512 27 620 BoxColFill
 LCb setrgbcolor
 3236 512 N
-0 798 V
-30 0 V
-0 -798 V
--30 0 V
+0 619 V
+26 0 V
+0 -619 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3278 512 31 795 BoxColFill
+0.00 0.00 0.00 C 0.200 3272 512 27 623 BoxColFill
 LCb setrgbcolor
-3278 512 N
-0 794 V
-30 0 V
-0 -794 V
--30 0 V
+3272 512 N
+0 622 V
+26 0 V
+0 -622 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3320 512 31 795 BoxColFill
+0.00 0.00 0.00 C 0.200 3309 512 26 632 BoxColFill
 LCb setrgbcolor
-3320 512 N
-0 794 V
-30 0 V
-0 -794 V
--30 0 V
+3309 512 N
+0 631 V
+25 0 V
+0 -631 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3363 512 30 794 BoxColFill
+0.00 0.00 0.00 C 0.200 3345 512 27 645 BoxColFill
 LCb setrgbcolor
-3363 512 N
-0 793 V
-29 0 V
-0 -793 V
--29 0 V
+3345 512 N
+0 644 V
+26 0 V
+0 -644 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3405 512 30 805 BoxColFill
+0.00 0.00 0.00 C 0.200 3382 512 26 703 BoxColFill
 LCb setrgbcolor
-3405 512 N
-0 804 V
-29 0 V
-0 -804 V
--29 0 V
+3382 512 N
+0 702 V
+25 0 V
+0 -702 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3447 512 31 782 BoxColFill
+0.00 0.00 0.00 C 0.200 3418 512 27 742 BoxColFill
 LCb setrgbcolor
-3447 512 N
-0 781 V
-30 0 V
-0 -781 V
--30 0 V
+3418 512 N
+0 741 V
+26 0 V
+0 -741 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.200 3455 512 26 749 BoxColFill
+LCb setrgbcolor
+3455 512 N
+0 748 V
+25 0 V
+0 -748 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
@@ -3335,687 +3351,797 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 578 570 31 1 BoxColFill
+0.90 0.62 0.00 C 0.200 575 543 26 1 BoxColFill
 LCb setrgbcolor
-578 570 N
-30 0 V
--30 0 V
+575 543 N
+25 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 621 570 30 1 BoxColFill
+0.90 0.62 0.00 C 0.200 611 543 27 1 BoxColFill
 LCb setrgbcolor
-621 570 N
-29 0 V
--29 0 V
+611 543 N
+26 0 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 663 582 30 1 BoxColFill
+0.90 0.62 0.00 C 0.200 648 553 26 1 BoxColFill
 LCb setrgbcolor
-663 582 N
-29 0 V
--29 0 V
+648 553 N
+25 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 705 585 31 27 BoxColFill
+0.90 0.62 0.00 C 0.200 684 555 27 22 BoxColFill
 LCb setrgbcolor
-705 585 N
-0 26 V
-30 0 V
-0 -26 V
--30 0 V
+684 555 N
+0 21 V
+26 0 V
+0 -21 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 747 576 31 31 BoxColFill
+0.90 0.62 0.00 C 0.200 721 548 26 25 BoxColFill
 LCb setrgbcolor
-747 576 N
-0 30 V
-30 0 V
-0 -30 V
--30 0 V
+721 548 N
+0 24 V
+25 0 V
+0 -24 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 789 577 31 31 BoxColFill
+0.90 0.62 0.00 C 0.200 757 548 27 26 BoxColFill
 LCb setrgbcolor
-789 577 N
-0 30 V
-30 0 V
-0 -30 V
--30 0 V
+757 548 N
+0 25 V
+26 0 V
+0 -25 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 832 578 30 37 BoxColFill
+0.90 0.62 0.00 C 0.200 793 549 27 30 BoxColFill
 LCb setrgbcolor
-832 578 N
-0 36 V
-29 0 V
-0 -36 V
--29 0 V
+793 549 N
+0 29 V
+26 0 V
+0 -29 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 874 593 30 52 BoxColFill
+0.90 0.62 0.00 C 0.200 830 562 26 41 BoxColFill
 LCb setrgbcolor
-874 593 N
-0 51 V
-29 0 V
-0 -51 V
--29 0 V
+830 562 N
+0 40 V
+25 0 V
+0 -40 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 916 593 30 52 BoxColFill
+0.90 0.62 0.00 C 0.200 866 562 27 41 BoxColFill
 LCb setrgbcolor
-916 593 N
-0 51 V
-29 0 V
-0 -51 V
--29 0 V
+866 562 N
+0 40 V
+26 0 V
+0 -40 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 958 593 31 52 BoxColFill
+0.90 0.62 0.00 C 0.200 903 562 26 41 BoxColFill
 LCb setrgbcolor
-958 593 N
-0 51 V
-30 0 V
-0 -51 V
--30 0 V
+903 562 N
+0 40 V
+25 0 V
+0 -40 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1000 593 31 52 BoxColFill
+0.90 0.62 0.00 C 0.200 939 562 27 41 BoxColFill
 LCb setrgbcolor
-1000 593 N
-0 51 V
-30 0 V
-0 -51 V
--30 0 V
+939 562 N
+0 40 V
+26 0 V
+0 -40 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1042 593 31 52 BoxColFill
+0.90 0.62 0.00 C 0.200 976 562 26 41 BoxColFill
 LCb setrgbcolor
-1042 593 N
-0 51 V
-30 0 V
-0 -51 V
--30 0 V
+976 562 N
+0 40 V
+25 0 V
+0 -40 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1085 595 30 51 BoxColFill
+0.90 0.62 0.00 C 0.200 1012 563 27 41 BoxColFill
 LCb setrgbcolor
-1085 595 N
+1012 563 N
+0 40 V
+26 0 V
+0 -40 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1049 639 26 41 BoxColFill
+LCb setrgbcolor
+1049 639 N
+0 40 V
+25 0 V
+0 -40 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1085 639 27 41 BoxColFill
+LCb setrgbcolor
+1085 639 N
+0 40 V
+26 0 V
+0 -40 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1122 672 26 48 BoxColFill
+LCb setrgbcolor
+1122 672 N
+0 47 V
+25 0 V
+0 -47 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1158 680 27 48 BoxColFill
+LCb setrgbcolor
+1158 680 N
+0 47 V
+26 0 V
+0 -47 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1194 773 27 50 BoxColFill
+LCb setrgbcolor
+1194 773 N
+0 49 V
+26 0 V
+0 -49 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1231 775 26 51 BoxColFill
+LCb setrgbcolor
+1231 775 N
 0 50 V
-29 0 V
+25 0 V
 0 -50 V
--29 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1127 690 30 51 BoxColFill
+0.90 0.62 0.00 C 0.200 1267 779 27 51 BoxColFill
 LCb setrgbcolor
-1127 690 N
+1267 779 N
 0 50 V
-29 0 V
+26 0 V
 0 -50 V
--29 0 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1169 689 31 52 BoxColFill
+0.90 0.62 0.00 C 0.200 1304 693 26 52 BoxColFill
 LCb setrgbcolor
-1169 689 N
+1304 693 N
 0 51 V
-30 0 V
+25 0 V
 0 -51 V
--30 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1211 732 31 59 BoxColFill
+0.90 0.62 0.00 C 0.200 1340 724 27 53 BoxColFill
 LCb setrgbcolor
-1211 732 N
-0 58 V
-30 0 V
-0 -58 V
--30 0 V
+1340 724 N
+0 52 V
+26 0 V
+0 -52 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1253 741 31 59 BoxColFill
+0.90 0.62 0.00 C 0.200 1377 748 26 56 BoxColFill
 LCb setrgbcolor
-1253 741 N
-0 58 V
-30 0 V
-0 -58 V
--30 0 V
+1377 748 N
+0 55 V
+25 0 V
+0 -55 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1296 857 30 63 BoxColFill
+0.90 0.62 0.00 C 0.200 1413 757 27 57 BoxColFill
 LCb setrgbcolor
-1296 857 N
-0 62 V
-29 0 V
-0 -62 V
--29 0 V
+1413 757 N
+0 56 V
+26 0 V
+0 -56 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1338 860 30 63 BoxColFill
+0.90 0.62 0.00 C 0.200 1450 767 26 57 BoxColFill
 LCb setrgbcolor
-1338 860 N
-0 62 V
-29 0 V
-0 -62 V
--29 0 V
+1450 767 N
+0 56 V
+25 0 V
+0 -56 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1380 865 30 63 BoxColFill
+0.90 0.62 0.00 C 0.200 1486 799 27 57 BoxColFill
 LCb setrgbcolor
-1380 865 N
-0 62 V
-29 0 V
-0 -62 V
--29 0 V
+1486 799 N
+0 56 V
+26 0 V
+0 -56 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1422 757 31 65 BoxColFill
+0.90 0.62 0.00 C 0.200 1523 828 26 66 BoxColFill
 LCb setrgbcolor
-1422 757 N
-0 64 V
-30 0 V
-0 -64 V
--30 0 V
+1523 828 N
+0 65 V
+25 0 V
+0 -65 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1464 796 31 66 BoxColFill
+0.90 0.62 0.00 C 0.200 1559 828 27 67 BoxColFill
 LCb setrgbcolor
-1464 796 N
-0 65 V
-30 0 V
-0 -65 V
--30 0 V
+1559 828 N
+0 66 V
+26 0 V
+0 -66 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 1595 876 27 67 BoxColFill
+LCb setrgbcolor
+1595 876 N
+0 66 V
+26 0 V
+0 -66 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1507 826 30 70 BoxColFill
+0.90 0.62 0.00 C 0.200 1632 876 26 67 BoxColFill
 LCb setrgbcolor
-1507 826 N
-0 69 V
-29 0 V
-0 -69 V
--29 0 V
+1632 876 N
+0 66 V
+25 0 V
+0 -66 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1549 838 30 70 BoxColFill
+0.90 0.62 0.00 C 0.200 1668 883 27 66 BoxColFill
 LCb setrgbcolor
-1549 838 N
-0 69 V
-29 0 V
-0 -69 V
--29 0 V
+1668 883 N
+0 65 V
+26 0 V
+0 -65 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1591 850 30 71 BoxColFill
+0.90 0.62 0.00 C 0.200 1705 904 26 75 BoxColFill
 LCb setrgbcolor
-1591 850 N
-0 70 V
-29 0 V
-0 -70 V
--29 0 V
+1705 904 N
+0 74 V
+25 0 V
+0 -74 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1633 890 31 71 BoxColFill
+0.90 0.62 0.00 C 0.200 1741 926 27 78 BoxColFill
 LCb setrgbcolor
-1633 890 N
-0 70 V
-30 0 V
-0 -70 V
--30 0 V
+1741 926 N
+0 77 V
+26 0 V
+0 -77 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1675 926 31 83 BoxColFill
+0.90 0.62 0.00 C 0.200 1778 952 26 87 BoxColFill
 LCb setrgbcolor
-1675 926 N
-0 82 V
-30 0 V
-0 -82 V
--30 0 V
+1778 952 N
+0 86 V
+25 0 V
+0 -86 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1717 927 31 83 BoxColFill
+0.90 0.62 0.00 C 0.200 1814 952 27 88 BoxColFill
 LCb setrgbcolor
-1717 927 N
-0 82 V
-30 0 V
-0 -82 V
--30 0 V
+1814 952 N
+0 87 V
+26 0 V
+0 -87 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1760 986 30 83 BoxColFill
+0.90 0.62 0.00 C 0.200 1851 954 26 89 BoxColFill
 LCb setrgbcolor
-1760 986 N
-0 82 V
-29 0 V
-0 -82 V
--29 0 V
+1851 954 N
+0 88 V
+25 0 V
+0 -88 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1802 986 30 83 BoxColFill
+0.90 0.62 0.00 C 0.200 1887 978 27 89 BoxColFill
 LCb setrgbcolor
-1802 986 N
-0 82 V
-29 0 V
-0 -82 V
--29 0 V
+1887 978 N
+0 88 V
+26 0 V
+0 -88 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1844 995 31 83 BoxColFill
+0.90 0.62 0.00 C 0.200 1924 987 26 90 BoxColFill
 LCb setrgbcolor
-1844 995 N
-0 82 V
-30 0 V
-0 -82 V
--30 0 V
+1924 987 N
+0 89 V
+25 0 V
+0 -89 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1886 1022 31 93 BoxColFill
+0.90 0.62 0.00 C 0.200 1960 988 27 91 BoxColFill
 LCb setrgbcolor
-1886 1022 N
-0 92 V
-30 0 V
-0 -92 V
--30 0 V
+1960 988 N
+0 90 V
+26 0 V
+0 -90 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1928 1049 31 97 BoxColFill
+0.90 0.62 0.00 C 0.200 1997 944 26 89 BoxColFill
 LCb setrgbcolor
-1928 1049 N
-0 96 V
-30 0 V
-0 -96 V
--30 0 V
+1997 944 N
+0 88 V
+25 0 V
+0 -88 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 1971 1081 30 109 BoxColFill
+0.90 0.62 0.00 C 0.200 2033 961 26 87 BoxColFill
 LCb setrgbcolor
-1971 1081 N
-0 108 V
-29 0 V
-0 -108 V
--29 0 V
+2033 961 N
+0 86 V
+25 0 V
+0 -86 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2013 1081 30 110 BoxColFill
+0.90 0.62 0.00 C 0.200 2069 969 27 88 BoxColFill
 LCb setrgbcolor
-2013 1081 N
-0 109 V
-29 0 V
-0 -109 V
--29 0 V
+2069 969 N
+0 87 V
+26 0 V
+0 -87 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2055 1083 30 112 BoxColFill
+0.90 0.62 0.00 C 0.200 2106 978 26 139 BoxColFill
 LCb setrgbcolor
-2055 1083 N
-0 111 V
-29 0 V
-0 -111 V
--29 0 V
+2106 978 N
+0 138 V
+25 0 V
+0 -138 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2097 1114 31 111 BoxColFill
+0.90 0.62 0.00 C 0.200 2142 980 27 157 BoxColFill
 LCb setrgbcolor
-2097 1114 N
-0 110 V
-30 0 V
-0 -110 V
--30 0 V
+2142 980 N
+0 156 V
+26 0 V
+0 -156 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2139 1124 31 113 BoxColFill
+0.90 0.62 0.00 C 0.200 2179 989 26 165 BoxColFill
 LCb setrgbcolor
-2139 1124 N
-0 112 V
-30 0 V
-0 -112 V
--30 0 V
+2179 989 N
+0 164 V
+25 0 V
+0 -164 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2181 1127 31 112 BoxColFill
+0.90 0.62 0.00 C 0.200 2215 999 27 165 BoxColFill
 LCb setrgbcolor
-2181 1127 N
-0 111 V
-30 0 V
-0 -111 V
--30 0 V
+2215 999 N
+0 164 V
+26 0 V
+0 -164 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2224 1072 30 110 BoxColFill
+0.90 0.62 0.00 C 0.200 2252 1023 26 171 BoxColFill
 LCb setrgbcolor
-2224 1072 N
-0 109 V
-29 0 V
-0 -109 V
--29 0 V
+2252 1023 N
+0 170 V
+25 0 V
+0 -170 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2266 1092 30 109 BoxColFill
+0.90 0.62 0.00 C 0.200 2288 1028 27 171 BoxColFill
 LCb setrgbcolor
-2266 1092 N
-0 108 V
-29 0 V
-0 -108 V
--29 0 V
+2288 1028 N
+0 170 V
+26 0 V
+0 -170 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2308 1103 31 109 BoxColFill
+0.90 0.62 0.00 C 0.200 2325 1026 26 173 BoxColFill
 LCb setrgbcolor
-2308 1103 N
-0 108 V
-30 0 V
-0 -108 V
--30 0 V
+2325 1026 N
+0 172 V
+25 0 V
+0 -172 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2350 1113 31 174 BoxColFill
+0.90 0.62 0.00 C 0.200 2361 1036 27 174 BoxColFill
 LCb setrgbcolor
-2350 1113 N
+2361 1036 N
 0 173 V
-30 0 V
+26 0 V
 0 -173 V
--30 0 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2392 1116 31 197 BoxColFill
+0.90 0.62 0.00 C 0.200 2398 1037 26 176 BoxColFill
 LCb setrgbcolor
-2392 1116 N
-0 196 V
-30 0 V
-0 -196 V
--30 0 V
+2398 1037 N
+0 175 V
+25 0 V
+0 -175 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2435 1127 30 206 BoxColFill
+0.90 0.62 0.00 C 0.200 2434 1043 27 176 BoxColFill
 LCb setrgbcolor
-2435 1127 N
-0 205 V
-29 0 V
-0 -205 V
--29 0 V
+2434 1043 N
+0 175 V
+26 0 V
+0 -175 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2477 1139 30 207 BoxColFill
+0.90 0.62 0.00 C 0.200 2470 1068 27 177 BoxColFill
 LCb setrgbcolor
-2477 1139 N
-0 206 V
-29 0 V
-0 -206 V
--29 0 V
+2470 1068 N
+0 176 V
+26 0 V
+0 -176 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2519 1170 30 214 BoxColFill
+0.90 0.62 0.00 C 0.200 2507 1075 26 179 BoxColFill
 LCb setrgbcolor
-2519 1170 N
-0 213 V
-29 0 V
-0 -213 V
--29 0 V
+2507 1075 N
+0 178 V
+25 0 V
+0 -178 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2561 1176 31 214 BoxColFill
+0.90 0.62 0.00 C 0.200 2543 1079 27 179 BoxColFill
 LCb setrgbcolor
-2561 1176 N
-0 213 V
-30 0 V
-0 -213 V
--30 0 V
+2543 1079 N
+0 178 V
+26 0 V
+0 -178 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2603 1174 31 215 BoxColFill
+0.90 0.62 0.00 C 0.200 2580 1085 26 222 BoxColFill
 LCb setrgbcolor
-2603 1174 N
-0 214 V
-30 0 V
-0 -214 V
--30 0 V
+2580 1085 N
+0 221 V
+25 0 V
+0 -221 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2646 1186 30 217 BoxColFill
+0.90 0.62 0.00 C 0.200 2616 1088 27 225 BoxColFill
 LCb setrgbcolor
-2646 1186 N
-0 216 V
-29 0 V
-0 -216 V
--29 0 V
+2616 1088 N
+0 224 V
+26 0 V
+0 -224 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2688 1187 30 220 BoxColFill
+0.90 0.62 0.00 C 0.200 2653 1091 26 224 BoxColFill
 LCb setrgbcolor
-2688 1187 N
-0 219 V
-29 0 V
-0 -219 V
--29 0 V
+2653 1091 N
+0 223 V
+25 0 V
+0 -223 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2730 1194 30 221 BoxColFill
+0.90 0.62 0.00 C 0.200 2689 1094 27 224 BoxColFill
 LCb setrgbcolor
-2730 1194 N
-0 220 V
-29 0 V
-0 -220 V
--29 0 V
+2689 1094 N
+0 223 V
+26 0 V
+0 -223 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2772 1226 31 221 BoxColFill
+0.90 0.62 0.00 C 0.200 2726 1102 26 225 BoxColFill
 LCb setrgbcolor
-2772 1226 N
-0 220 V
-30 0 V
-0 -220 V
--30 0 V
+2726 1102 N
+0 224 V
+25 0 V
+0 -224 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2814 1235 31 223 BoxColFill
+0.90 0.62 0.00 C 0.200 2762 1202 27 226 BoxColFill
 LCb setrgbcolor
-2814 1235 N
-0 222 V
-30 0 V
-0 -222 V
--30 0 V
+2762 1202 N
+0 225 V
+26 0 V
+0 -225 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2856 1240 31 223 BoxColFill
+0.90 0.62 0.00 C 0.200 2799 1136 26 229 BoxColFill
 LCb setrgbcolor
-2856 1240 N
-0 222 V
-30 0 V
-0 -222 V
--30 0 V
+2799 1136 N
+0 228 V
+25 0 V
+0 -228 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2899 1247 30 277 BoxColFill
+0.90 0.62 0.00 C 0.200 2835 1132 27 231 BoxColFill
 LCb setrgbcolor
-2899 1247 N
-0 276 V
-29 0 V
-0 -276 V
--29 0 V
+2835 1132 N
+0 230 V
+26 0 V
+0 -230 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2941 1251 30 281 BoxColFill
+0.90 0.62 0.00 C 0.200 2871 1135 27 232 BoxColFill
 LCb setrgbcolor
-2941 1251 N
-0 280 V
-29 0 V
-0 -280 V
--29 0 V
+2871 1135 N
+0 231 V
+26 0 V
+0 -231 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 2983 1255 31 279 BoxColFill
+0.90 0.62 0.00 C 0.200 2908 1132 26 229 BoxColFill
 LCb setrgbcolor
-2983 1255 N
-0 278 V
-30 0 V
-0 -278 V
--30 0 V
+2908 1132 N
+0 228 V
+25 0 V
+0 -228 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3025 1258 31 280 BoxColFill
+0.90 0.62 0.00 C 0.200 2944 1132 27 230 BoxColFill
 LCb setrgbcolor
-3025 1258 N
-0 279 V
-30 0 V
-0 -279 V
--30 0 V
+2944 1132 N
+0 229 V
+26 0 V
+0 -229 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3067 1269 31 280 BoxColFill
+0.90 0.62 0.00 C 0.200 2981 1131 26 233 BoxColFill
 LCb setrgbcolor
-3067 1269 N
-0 279 V
-30 0 V
-0 -279 V
--30 0 V
+2981 1131 N
+0 232 V
+25 0 V
+0 -232 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3110 1393 30 282 BoxColFill
+0.90 0.62 0.00 C 0.200 3017 1140 27 241 BoxColFill
 LCb setrgbcolor
-3110 1393 N
-0 281 V
-29 0 V
-0 -281 V
--29 0 V
+3017 1140 N
+0 240 V
+26 0 V
+0 -240 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3152 1311 30 287 BoxColFill
+0.90 0.62 0.00 C 0.200 3054 1122 26 244 BoxColFill
 LCb setrgbcolor
-3152 1311 N
-0 286 V
-29 0 V
-0 -286 V
--29 0 V
+3054 1122 N
+0 243 V
+25 0 V
+0 -243 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3194 1306 30 289 BoxColFill
+0.90 0.62 0.00 C 0.200 3090 1125 27 345 BoxColFill
 LCb setrgbcolor
-3194 1306 N
-0 288 V
-29 0 V
-0 -288 V
--29 0 V
+3090 1125 N
+0 344 V
+26 0 V
+0 -344 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3236 1310 31 289 BoxColFill
+0.90 0.62 0.00 C 0.200 3127 1107 26 256 BoxColFill
 LCb setrgbcolor
-3236 1310 N
-0 288 V
-30 0 V
-0 -288 V
--30 0 V
+3127 1107 N
+0 255 V
+25 0 V
+0 -255 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3278 1306 31 286 BoxColFill
+0.90 0.62 0.00 C 0.200 3163 1105 27 246 BoxColFill
 LCb setrgbcolor
-3278 1306 N
-0 285 V
-30 0 V
-0 -285 V
--30 0 V
+3163 1105 N
+0 245 V
+26 0 V
+0 -245 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3320 1306 31 288 BoxColFill
+0.90 0.62 0.00 C 0.200 3200 1110 26 250 BoxColFill
 LCb setrgbcolor
-3320 1306 N
-0 287 V
-30 0 V
-0 -287 V
--30 0 V
+3200 1110 N
+0 249 V
+25 0 V
+0 -249 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3363 1305 30 291 BoxColFill
+0.90 0.62 0.00 C 0.200 3236 1131 27 251 BoxColFill
 LCb setrgbcolor
-3363 1305 N
-0 290 V
-29 0 V
-0 -290 V
--29 0 V
+3236 1131 N
+0 250 V
+26 0 V
+0 -250 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 3272 1134 27 251 BoxColFill
+LCb setrgbcolor
+3272 1134 N
+0 250 V
+26 0 V
+0 -250 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 3309 1143 26 258 BoxColFill
+LCb setrgbcolor
+3309 1143 N
+0 257 V
+25 0 V
+0 -257 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3405 1316 30 301 BoxColFill
+0.90 0.62 0.00 C 0.200 3345 1156 27 261 BoxColFill
 LCb setrgbcolor
-3405 1316 N
-0 300 V
-29 0 V
-0 -300 V
--29 0 V
+3345 1156 N
+0 260 V
+26 0 V
+0 -260 V
+-26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3447 1293 31 306 BoxColFill
+0.90 0.62 0.00 C 0.200 3382 1214 26 267 BoxColFill
 LCb setrgbcolor
-3447 1293 N
-0 305 V
-30 0 V
-0 -305 V
--30 0 V
+3382 1214 N
+0 266 V
+25 0 V
+0 -266 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 3418 1253 27 285 BoxColFill
+LCb setrgbcolor
+3418 1253 N
+0 284 V
+26 0 V
+0 -284 V
+-26 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.200 3455 1260 26 291 BoxColFill
+LCb setrgbcolor
+3455 1260 N
+0 290 V
+25 0 V
+0 -290 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
@@ -4031,75 +4157,86 @@ LTb
 LTb
 0.00 0.62 0.45 C 2092 1457 M
 255 0 V
-593 512 M
-42 0 V
-43 0 V
-42 628 V
-42 145 V
-42 0 V
-42 82 V
-42 70 V
-43 0 V
-42 0 V
-42 -2 V
-42 0 V
-42 -15 V
-43 -376 V
-42 2 V
-42 -27 V
-42 -17 V
-42 -123 V
-43 0 V
-42 -5 V
-42 133 V
-42 -43 V
-42 -15 V
-42 -12 V
-43 -12 V
-42 -36 V
-42 24 V
-42 0 V
-42 -43 V
-43 0 V
-42 -8 V
-42 20 V
-42 -3 V
-42 17 V
-43 3 V
-42 4 V
-42 -19 V
-42 0 V
-42 0 V
-42 24 V
-43 -17 V
-42 -7 V
-42 167 V
-42 51 V
-42 14 V
-43 -7 V
-42 -5 V
-42 -5 V
-42 5 V
-42 -5 V
-42 5 V
-43 -2 V
-42 -22 V
-42 0 V
-42 -3 V
-42 95 V
-43 2 V
-42 -5 V
-42 0 V
-42 -5 V
-42 -67 V
-43 50 V
-42 8 V
-42 -3 V
-42 -2 V
-42 5 V
-42 4 V
-43 10 V
-42 22 V
+587 512 M
+37 0 V
+36 0 V
+37 778 V
+36 193 V
+37 -5 V
+36 87 V
+37 29 V
+36 3 V
+37 0 V
+36 -5 V
+36 0 V
+37 -17 V
+36 -483 V
+37 2 V
+36 -38 V
+37 -20 V
+36 -140 V
+37 0 V
+36 -5 V
+37 150 V
+36 -51 V
+37 -17 V
+36 -14 V
+36 -15 V
+37 -38 V
+36 24 V
+37 -2 V
+36 -46 V
+37 0 V
+36 -8 V
+37 20 V
+36 -3 V
+37 17 V
+36 3 V
+36 4 V
+37 -21 V
+36 0 V
+37 0 V
+36 26 V
+37 -19 V
+36 -5 V
+37 169 V
+36 51 V
+37 14 V
+36 -7 V
+36 -7 V
+37 -5 V
+36 5 V
+37 -5 V
+36 5 V
+37 -2 V
+36 -22 V
+37 0 V
+36 -3 V
+37 95 V
+36 2 V
+36 -2 V
+37 -3 V
+36 -5 V
+37 -70 V
+36 53 V
+37 8 V
+36 -3 V
+37 -2 V
+36 2 V
+37 5 V
+36 12 V
+37 22 V
+36 176 V
+36 -142 V
+37 -20 V
+36 5 V
+37 -14 V
+36 -3 V
+37 5 V
+36 -2 V
+37 -29 V
+36 2 V
+37 5 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/formal/data/plot.sh b/formal/data/plot.sh
index 429970f7..8f678cf2 100644
--- a/formal/data/plot.sh
+++ b/formal/data/plot.sh
@@ -16,12 +16,12 @@ set y2label "\% Test"
 set boxwidth 0.7 relative
 unset xtics
 set xtics 1,2 nomirror rotate by 90 right scale 0
-set ytics 1 2000
+set ytics 1 5000
 set ytics out
 set y2tics 1 10
 set y2tics out
 set ytics nomirror
-set yrange [0:24000]
+set yrange [0:30000]
 set y2range [0:50]
 set style data histogram
 set style histogram rowstacked
diff --git a/formal/data/rcu-test.dat b/formal/data/rcu-test.dat
index 185c40cb..3419fd65 100644
--- a/formal/data/rcu-test.dat
+++ b/formal/data/rcu-test.dat
@@ -1,69 +1,80 @@
-v2.6.12 1151    0 1151  0.0
-""      1151    0 1151  0.0
-v2.6.14 1397    0 1397  0.0
-""      1459  513 1972 26.0
-v2.6.16 1270  598 1868 32.0
-""      1287  605 1892 32.0
-v2.6.18 1308  718 2026 35.4
-""      1613 1001 2614 38.3
-v2.6.20 1615 1004 2619 38.3
-""      1615 1004 2619 38.3
-v2.6.22 1617 1001 2618 38.2
-""      1616  999 2615 38.2
-v2.6.24 1649  995 2644 37.6
-""      3532  995 4527 22.0
-v2.6.26 3523  999 4522 22.1
-""      4361 1157 5518 21.0
-v2.6.28 4552 1157 5709 20.3
-""      6863 1227 8090 15.2
-v2.6.30 6911 1236 8147 15.2
-""      7012 1236 8248 15.0
-v2.6.32 4876 1257 6133 20.5
-""      5641 1296 6937 18.7
-v2.6.34 6235 1380 7615 18.1
-""      6470 1382 7852 17.6
-v2.6.36 6716 1381 8097 17.1
-""      7513 1390 8903 15.6
-v2.6.38 8217 1638 9855 16.6
-""      8237 1637 9874 16.6
-v3.0  9422 1633 11055 14.8
-""    9422 1631 11053 14.8
-v3.2  9594 1622 11216 14.5
-""    10126 1833 11959 15.3
-v3.4  10668 1914 12582 15.2
-""    11303 2141 13444 15.9
-v3.6  11313 2157 13470 16.0
-""    11349 2192 13541 16.2
-v3.8  11965 2174 14139 15.4
-""    12165 2216 14381 15.4
-v3.10 12211 2216 14427 15.4
-""    11120 2177 13297 16.4
-v3.12 11527 2139 13666 15.7
-""    11739 2145 13884 15.4
-v3.14 11942 3428 15370 22.3
-""    12007 3882 15889 24.4
-v3.16 12222 4074 16296 25.0
-""    12465 4088 16553 24.7
-v3.18 13065 4238 17303 24.5
-""    13190 4230 17420 24.3
-v4.0  13148 4265 17413 24.5
-""    13396 4290 17686 24.3
-v4.2  13408 4348 17756 24.5
-""    13557 4364 17921 24.4
-v4.4  14192 4363 18555 23.5
-""    14359 4421 18780 23.5
-v4.6  14461 4423 18884 23.4
-""    14612 5480 20092 27.3
-v4.8  14688 5549 20237 27.4
-""    14762 5527 20289 27.2
-v4.10 14831 5541 20372 27.2
-""    15030 5559 20589 27.0
-v4.12 17508 5588 23096 24.2
-""    15884 5663 21547 26.3
-v4.14 15781 5712 21493 26.6
-""    15857 5726 21583 26.5
-v4.16 15777 5670 21447 26.4
-""    15774 5703 21477 26.6
-v4.18 15751 5756 21507 26.8
-""    15974 5967 21941 27.2
-v4.20 15519 6054 21573 28.1
+v2.6.12  770    0  770  0.0
+""       770    0  770  0.0
+""      1016    0 1016  0.0
+""      1078  513 1591 32.2
+v2.6.16  889  598 1487 40.2
+""       906  605 1511 40.0
+""       927  718 1645 43.6
+""      1232 1001 2233 44.8
+v2.6.20 1234 1004 2238 44.9
+""      1234 1004 2238 44.9
+""      1236 1001 2237 44.7
+""      1235  999 2234 44.7
+v2.6.24 1268  995 2263 44.0
+""      3151  995 4146 24.0
+""      3142  999 4141 24.1
+""      3980 1157 5137 22.5
+v2.6.28 4171 1157 5328 21.7
+""      6482 1227 7709 15.9
+""      6530 1236 7766 15.9
+""      6631 1236 7867 15.7
+v2.6.32 4495 1257 5752 21.9
+""      5260 1296 6556 19.8
+""      5854 1380 7234 19.1
+""      6089 1382 7471 18.5
+v2.6.36 6335 1381 7716 17.9
+""      7132 1390 8522 16.3
+""      7836 1638 9474 17.3
+""      7856 1637 9493 17.2
+v3.0  9041 1633 10674 15.3
+""    9041 1631 10672 15.3
+""    9213 1622 10835 15.0
+""    9745 1833 11578 15.8
+v3.4  10287 1914 12201 15.7
+""    10922 2141 13063 16.4
+""    10932 2157 13089 16.5
+""    10968 2192 13160 16.7
+v3.8  11584 2174 13758 15.8
+""    11784 2216 14000 15.8
+""    11830 2216 14046 15.8
+""    10739 2177 12916 16.9
+v3.12 11146 2139 13285 16.1
+""    11358 2145 13503 15.9
+""    11561 3428 14989 22.9
+""    11626 3882 15508 25.0
+v3.16 11841 4074 15915 25.6
+""    12084 4088 16172 25.3
+""    12684 4238 16922 25.0
+""    12809 4230 17039 24.8
+v4.0  12767 4265 17032 25.0
+""    13015 4290 17305 24.8
+""    13027 4348 17375 25.0
+""    13176 4364 17540 24.9
+v4.4  13811 4363 18174 24.0
+""    13978 4421 18399 24.0
+""    14080 4423 18503 23.9
+""    14231 5480 19711 27.8
+v4.8  14307 5549 19856 27.9
+""    14381 5527 19908 27.8
+""    14450 5541 19991 27.7
+""    14649 5559 20208 27.5
+v4.12 17127 5588 22715 24.6
+""    15503 5663 21166 26.8
+""    15400 5712 21112 27.1
+""    15476 5726 21202 27.0
+v4.16 15396 5670 21066 26.9
+""    15393 5703 21096 27.0
+""    15370 5756 21126 27.2
+""    15593 5967 21560 27.7
+""    15138 6054 21192 28.6
+v5.0  15226 8534 23760 35.9
+""    14769 6339 21108 30.0
+""    14733 6075 20808 29.2
+""    14861 6185 21046 29.4
+v5.4  15379 6209 21588 28.8
+""    15448 6211 21659 28.7
+""    15675 6373 22048 28.9
+""    15986 6455 22441 28.8
+v5.8  17424 6627 24051 27.6
+""    18395 7062 25457 27.7
+v5.10 18582 7197 25779 27.9
-- 
2.17.1


