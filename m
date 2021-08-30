Return-Path: <SRS0=83XW=NV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=2xdZoCNJUV4tkwbpNAAI3drbw5Cq4FkSu+Ie04elTMM=;
        b=oRfa4ceN8FcLun3P6mFtX2Sm1FzfO2gHTdGoGJipnK27tw+R267CURn6vRGQh6t1o+
         zaGnL2+pmkENRaY8hZeNjPEsNlqbEjnkAozAXn0AZ6f6plRgRrqu2tw1Gh07bFXXuSeR
         QFLEcCZ8HOf5jmLZX/fCXDR5YaFNI8Ugb+5vukloSzYwLPshfepcoH+KEBI4FrKTaaoa
         1PoWdVHThXppmcEFGvHwsro2LSD+lLJAkEBizuD0qzX4l3vlGrk01MTWzK6qv6AKSCi5
         1q7OE8D46QleP8xKW3WsVau+73dMpYH1RzmMrvH33SdD0Dv9aOEmrdUlk47ed9owWheo
         ct9w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] formal: Update rcu-test data in Figure 12.4 (as of
 v5.14)
Message-ID: <b82a3623-72cf-c6ad-fe86-2cdb3e388d1e@gmail.com>
Date: Tue, 31 Aug 2021 08:50:37 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

Looks like the trend since v5.12 is continuing.

        Thanks, Akira
--
 formal/RCU-test-ratio.eps | 1448 +++++++++++++++++++------------------
 formal/data/rcu-test.dat  |    2 +
 2 files changed, 754 insertions(+), 696 deletions(-)

diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
index 6c742612..3021ada5 100644
--- a/formal/RCU-test-ratio.eps
+++ b/formal/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Fri Apr 30 10:49:59 2021
+%%CreationDate: Tue Aug 31 08:33:44 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Fri Apr 30 10:49:59 2021)
+  /CreationDate (Tue Aug 31 08:33:44 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1980,9 +1980,9 @@ stroke
 1.000 UL
 LTb
 LCb setrgbcolor
-587 512 M
+586 512 M
 stroke
-587 464 M
+586 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
 ] -26.7 MRshow
@@ -1990,21 +1990,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-622 512 M
+620 512 M
 stroke
 LTb
 LCb setrgbcolor
-658 512 M
+655 512 M
 stroke
 LTb
 LCb setrgbcolor
-693 512 M
+690 512 M
 stroke
 LTb
 LCb setrgbcolor
-729 512 M
+725 512 M
 stroke
-729 464 M
+725 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
 ] -26.7 MRshow
@@ -2012,21 +2012,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-764 512 M
+759 512 M
 stroke
 LTb
 LCb setrgbcolor
-800 512 M
+794 512 M
 stroke
 LTb
 LCb setrgbcolor
-836 512 M
+829 512 M
 stroke
 LTb
 LCb setrgbcolor
-871 512 M
+864 512 M
 stroke
-871 464 M
+864 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
 ] -26.7 MRshow
@@ -2034,21 +2034,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-907 512 M
+898 512 M
 stroke
 LTb
 LCb setrgbcolor
-942 512 M
+933 512 M
 stroke
 LTb
 LCb setrgbcolor
-978 512 M
+968 512 M
 stroke
 LTb
 LCb setrgbcolor
-1014 512 M
+1003 512 M
 stroke
-1014 464 M
+1003 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
 ] -26.7 MRshow
@@ -2056,21 +2056,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1049 512 M
+1037 512 M
 stroke
 LTb
 LCb setrgbcolor
-1085 512 M
+1072 512 M
 stroke
 LTb
 LCb setrgbcolor
-1120 512 M
+1107 512 M
 stroke
 LTb
 LCb setrgbcolor
-1156 512 M
+1142 512 M
 stroke
-1156 464 M
+1142 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
 ] -26.7 MRshow
@@ -2078,21 +2078,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1191 512 M
+1176 512 M
 stroke
 LTb
 LCb setrgbcolor
-1227 512 M
+1211 512 M
 stroke
 LTb
 LCb setrgbcolor
-1263 512 M
+1246 512 M
 stroke
 LTb
 LCb setrgbcolor
-1298 512 M
+1281 512 M
 stroke
-1298 464 M
+1281 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
 ] -26.7 MRshow
@@ -2100,21 +2100,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1334 512 M
+1315 512 M
 stroke
 LTb
 LCb setrgbcolor
-1369 512 M
+1350 512 M
 stroke
 LTb
 LCb setrgbcolor
-1405 512 M
+1385 512 M
 stroke
 LTb
 LCb setrgbcolor
-1440 512 M
+1420 512 M
 stroke
-1440 464 M
+1420 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
 ] -26.7 MRshow
@@ -2122,21 +2122,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1476 512 M
+1454 512 M
 stroke
 LTb
 LCb setrgbcolor
-1512 512 M
+1489 512 M
 stroke
 LTb
 LCb setrgbcolor
-1547 512 M
+1524 512 M
 stroke
 LTb
 LCb setrgbcolor
-1583 512 M
+1558 512 M
 stroke
-1583 464 M
+1558 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
 ] -26.7 MRshow
@@ -2144,21 +2144,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1618 512 M
+1593 512 M
 stroke
 LTb
 LCb setrgbcolor
-1654 512 M
+1628 512 M
 stroke
 LTb
 LCb setrgbcolor
-1690 512 M
+1663 512 M
 stroke
 LTb
 LCb setrgbcolor
-1725 512 M
+1697 512 M
 stroke
-1725 464 M
+1697 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
 ] -26.7 MRshow
@@ -2166,21 +2166,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1761 512 M
+1732 512 M
 stroke
 LTb
 LCb setrgbcolor
-1796 512 M
+1767 512 M
 stroke
 LTb
 LCb setrgbcolor
-1832 512 M
+1802 512 M
 stroke
 LTb
 LCb setrgbcolor
-1867 512 M
+1836 512 M
 stroke
-1867 464 M
+1836 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
 ] -26.7 MRshow
@@ -2188,21 +2188,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1903 512 M
+1871 512 M
 stroke
 LTb
 LCb setrgbcolor
-1939 512 M
+1906 512 M
 stroke
 LTb
 LCb setrgbcolor
-1974 512 M
+1941 512 M
 stroke
 LTb
 LCb setrgbcolor
-2010 512 M
+1975 512 M
 stroke
-2010 464 M
+1975 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
 ] -26.7 MRshow
@@ -2210,21 +2210,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2045 512 M
+2010 512 M
 stroke
 LTb
 LCb setrgbcolor
-2081 512 M
+2045 512 M
 stroke
 LTb
 LCb setrgbcolor
-2116 512 M
+2080 512 M
 stroke
 LTb
 LCb setrgbcolor
-2152 512 M
+2114 512 M
 stroke
-2152 464 M
+2114 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
 ] -26.7 MRshow
@@ -2232,21 +2232,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2188 512 M
+2149 512 M
 stroke
 LTb
 LCb setrgbcolor
-2223 512 M
+2184 512 M
 stroke
 LTb
 LCb setrgbcolor
-2259 512 M
+2219 512 M
 stroke
 LTb
 LCb setrgbcolor
-2294 512 M
+2253 512 M
 stroke
-2294 464 M
+2253 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
 ] -26.7 MRshow
@@ -2254,21 +2254,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2330 512 M
+2288 512 M
 stroke
 LTb
 LCb setrgbcolor
-2365 512 M
+2323 512 M
 stroke
 LTb
 LCb setrgbcolor
-2401 512 M
+2358 512 M
 stroke
 LTb
 LCb setrgbcolor
-2437 512 M
+2392 512 M
 stroke
-2437 464 M
+2392 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
 ] -26.7 MRshow
@@ -2276,21 +2276,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2472 512 M
+2427 512 M
 stroke
 LTb
 LCb setrgbcolor
-2508 512 M
+2462 512 M
 stroke
 LTb
 LCb setrgbcolor
-2543 512 M
+2497 512 M
 stroke
 LTb
 LCb setrgbcolor
-2579 512 M
+2531 512 M
 stroke
-2579 464 M
+2531 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
 ] -26.7 MRshow
@@ -2298,21 +2298,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2615 512 M
+2566 512 M
 stroke
 LTb
 LCb setrgbcolor
-2650 512 M
+2601 512 M
 stroke
 LTb
 LCb setrgbcolor
-2686 512 M
+2635 512 M
 stroke
 LTb
 LCb setrgbcolor
-2721 512 M
+2670 512 M
 stroke
-2721 464 M
+2670 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
 ] -26.7 MRshow
@@ -2320,21 +2320,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2757 512 M
+2705 512 M
 stroke
 LTb
 LCb setrgbcolor
-2792 512 M
+2740 512 M
 stroke
 LTb
 LCb setrgbcolor
-2828 512 M
+2774 512 M
 stroke
 LTb
 LCb setrgbcolor
-2864 512 M
+2809 512 M
 stroke
-2864 464 M
+2809 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
 ] -26.7 MRshow
@@ -2342,25 +2342,25 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2899 512 M
+2844 512 M
 stroke
 LTb
 LCb setrgbcolor
-2935 512 M
+2879 512 M
 stroke
 LTb
 LCb setrgbcolor
-2970 512 M
+2913 512 M
 stroke
 LTb
 LCb setrgbcolor
-3006 512 M
+2948 512 M
 stroke
 LTb
 LCb setrgbcolor
-3041 512 M
+2983 512 M
 stroke
-3041 464 M
+2983 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
 ] -26.7 MRshow
@@ -2368,21 +2368,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3077 512 M
+3018 512 M
 stroke
 LTb
 LCb setrgbcolor
-3113 512 M
+3052 512 M
 stroke
 LTb
 LCb setrgbcolor
-3148 512 M
+3087 512 M
 stroke
 LTb
 LCb setrgbcolor
-3184 512 M
+3122 512 M
 stroke
-3184 464 M
+3122 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
 ] -26.7 MRshow
@@ -2390,21 +2390,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3219 512 M
+3157 512 M
 stroke
 LTb
 LCb setrgbcolor
-3255 512 M
+3191 512 M
 stroke
 LTb
 LCb setrgbcolor
-3291 512 M
+3226 512 M
 stroke
 LTb
 LCb setrgbcolor
-3326 512 M
+3261 512 M
 stroke
-3326 464 M
+3261 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
 ] -26.7 MRshow
@@ -2412,21 +2412,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3362 512 M
+3296 512 M
 stroke
 LTb
 LCb setrgbcolor
-3397 512 M
+3330 512 M
 stroke
 LTb
 LCb setrgbcolor
-3433 512 M
+3365 512 M
 stroke
 LTb
 LCb setrgbcolor
-3468 512 M
+3400 512 M
 stroke
-3468 464 M
+3400 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
 ] -26.7 MRshow
@@ -2434,6 +2434,20 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
+3435 512 M
+stroke
+LTb
+LCb setrgbcolor
+3469 512 M
+stroke
+3469 464 M
+currentpoint gsave translate 90 rotate 0 0 moveto
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.14)]
+] -26.7 MRshow
+grestore
+1.000 UL
+LTb
+LCb setrgbcolor
 3504 512 M
 63 0 V
 stroke
@@ -2539,19 +2553,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 574 512 26 32 BoxColFill
+0.00 0.00 0.00 C 0.180 574 512 25 32 BoxColFill
 LCb setrgbcolor
 574 512 N
 0 31 V
-25 0 V
+24 0 V
 0 -31 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 610 512 26 32 BoxColFill
+0.00 0.00 0.00 C 0.180 608 512 26 32 BoxColFill
 LCb setrgbcolor
-610 512 N
+608 512 N
 0 31 V
 25 0 V
 0 -31 V
@@ -2559,39 +2573,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 645 512 26 42 BoxColFill
+0.00 0.00 0.00 C 0.180 643 512 25 42 BoxColFill
 LCb setrgbcolor
-645 512 N
+643 512 N
 0 41 V
-25 0 V
+24 0 V
 0 -41 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 681 512 26 44 BoxColFill
+0.00 0.00 0.00 C 0.180 678 512 25 44 BoxColFill
 LCb setrgbcolor
-681 512 N
+678 512 N
 0 43 V
-25 0 V
+24 0 V
 0 -43 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 716 512 26 37 BoxColFill
+0.00 0.00 0.00 C 0.180 713 512 25 37 BoxColFill
 LCb setrgbcolor
-716 512 N
+713 512 N
 0 36 V
-25 0 V
+24 0 V
 0 -36 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 752 512 26 37 BoxColFill
+0.00 0.00 0.00 C 0.180 747 512 26 37 BoxColFill
 LCb setrgbcolor
-752 512 N
+747 512 N
 0 36 V
 25 0 V
 0 -36 V
@@ -2599,39 +2613,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 788 512 26 38 BoxColFill
+0.00 0.00 0.00 C 0.180 782 512 25 38 BoxColFill
 LCb setrgbcolor
-788 512 N
+782 512 N
 0 37 V
-25 0 V
+24 0 V
 0 -37 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 823 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 817 512 25 51 BoxColFill
 LCb setrgbcolor
-823 512 N
+817 512 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 859 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 852 512 25 51 BoxColFill
 LCb setrgbcolor
-859 512 N
+852 512 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 894 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 886 512 26 51 BoxColFill
 LCb setrgbcolor
-894 512 N
+886 512 N
 0 50 V
 25 0 V
 0 -50 V
@@ -2639,29 +2653,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 930 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 921 512 25 51 BoxColFill
 LCb setrgbcolor
-930 512 N
+921 512 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 965 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 956 512 25 51 BoxColFill
 LCb setrgbcolor
-965 512 N
+956 512 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1001 512 26 52 BoxColFill
+0.00 0.00 0.00 C 0.180 990 512 26 52 BoxColFill
 LCb setrgbcolor
-1001 512 N
+990 512 N
 0 51 V
 25 0 V
 0 -51 V
@@ -2669,9 +2683,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1037 512 26 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1025 512 26 128 BoxColFill
 LCb setrgbcolor
-1037 512 N
+1025 512 N
 0 127 V
 25 0 V
 0 -127 V
@@ -2679,29 +2693,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1072 512 26 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1060 512 25 128 BoxColFill
 LCb setrgbcolor
-1072 512 N
+1060 512 N
 0 127 V
-25 0 V
+24 0 V
 0 -127 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1108 512 26 161 BoxColFill
+0.00 0.00 0.00 C 0.180 1095 512 25 161 BoxColFill
 LCb setrgbcolor
-1108 512 N
+1095 512 N
 0 160 V
-25 0 V
+24 0 V
 0 -160 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1143 512 26 169 BoxColFill
+0.00 0.00 0.00 C 0.180 1129 512 26 169 BoxColFill
 LCb setrgbcolor
-1143 512 N
+1129 512 N
 0 168 V
 25 0 V
 0 -168 V
@@ -2709,9 +2723,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1179 512 26 262 BoxColFill
+0.00 0.00 0.00 C 0.180 1164 512 26 262 BoxColFill
 LCb setrgbcolor
-1179 512 N
+1164 512 N
 0 261 V
 25 0 V
 0 -261 V
@@ -2719,9 +2733,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1215 512 25 264 BoxColFill
+0.00 0.00 0.00 C 0.180 1199 512 25 264 BoxColFill
 LCb setrgbcolor
-1215 512 N
+1199 512 N
 0 263 V
 24 0 V
 0 -263 V
@@ -2729,19 +2743,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1250 512 26 268 BoxColFill
+0.00 0.00 0.00 C 0.180 1234 512 25 268 BoxColFill
 LCb setrgbcolor
-1250 512 N
+1234 512 N
 0 267 V
-25 0 V
+24 0 V
 0 -267 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1286 512 26 182 BoxColFill
+0.00 0.00 0.00 C 0.180 1268 512 26 182 BoxColFill
 LCb setrgbcolor
-1286 512 N
+1268 512 N
 0 181 V
 25 0 V
 0 -181 V
@@ -2749,39 +2763,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1321 512 26 213 BoxColFill
+0.00 0.00 0.00 C 0.180 1303 512 25 213 BoxColFill
 LCb setrgbcolor
-1321 512 N
+1303 512 N
 0 212 V
-25 0 V
+24 0 V
 0 -212 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1357 512 26 237 BoxColFill
+0.00 0.00 0.00 C 0.180 1338 512 25 237 BoxColFill
 LCb setrgbcolor
-1357 512 N
+1338 512 N
 0 236 V
-25 0 V
+24 0 V
 0 -236 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1392 512 26 246 BoxColFill
+0.00 0.00 0.00 C 0.180 1373 512 25 246 BoxColFill
 LCb setrgbcolor
-1392 512 N
+1373 512 N
 0 245 V
-25 0 V
+24 0 V
 0 -245 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1428 512 26 256 BoxColFill
+0.00 0.00 0.00 C 0.180 1407 512 26 256 BoxColFill
 LCb setrgbcolor
-1428 512 N
+1407 512 N
 0 255 V
 25 0 V
 0 -255 V
@@ -2789,9 +2803,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1464 512 25 288 BoxColFill
+0.00 0.00 0.00 C 0.180 1442 512 25 288 BoxColFill
 LCb setrgbcolor
-1464 512 N
+1442 512 N
 0 287 V
 24 0 V
 0 -287 V
@@ -2799,29 +2813,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1499 512 26 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1477 512 25 317 BoxColFill
 LCb setrgbcolor
-1499 512 N
+1477 512 N
 0 316 V
-25 0 V
+24 0 V
 0 -316 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1535 512 26 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1512 512 25 317 BoxColFill
 LCb setrgbcolor
-1535 512 N
+1512 512 N
 0 316 V
-25 0 V
+24 0 V
 0 -316 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1570 512 26 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1546 512 26 365 BoxColFill
 LCb setrgbcolor
-1570 512 N
+1546 512 N
 0 364 V
 25 0 V
 0 -364 V
@@ -2829,39 +2843,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1606 512 26 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1581 512 25 365 BoxColFill
 LCb setrgbcolor
-1606 512 N
+1581 512 N
 0 364 V
-25 0 V
+24 0 V
 0 -364 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1641 512 26 372 BoxColFill
+0.00 0.00 0.00 C 0.180 1616 512 25 372 BoxColFill
 LCb setrgbcolor
-1641 512 N
+1616 512 N
 0 371 V
-25 0 V
+24 0 V
 0 -371 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1677 512 26 393 BoxColFill
+0.00 0.00 0.00 C 0.180 1651 512 25 393 BoxColFill
 LCb setrgbcolor
-1677 512 N
+1651 512 N
 0 392 V
-25 0 V
+24 0 V
 0 -392 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1713 512 26 415 BoxColFill
+0.00 0.00 0.00 C 0.180 1685 512 26 415 BoxColFill
 LCb setrgbcolor
-1713 512 N
+1685 512 N
 0 414 V
 25 0 V
 0 -414 V
@@ -2869,39 +2883,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1748 512 26 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1720 512 25 441 BoxColFill
 LCb setrgbcolor
-1748 512 N
+1720 512 N
 0 440 V
-25 0 V
+24 0 V
 0 -440 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1784 512 26 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1755 512 25 441 BoxColFill
 LCb setrgbcolor
-1784 512 N
+1755 512 N
 0 440 V
-25 0 V
+24 0 V
 0 -440 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1819 512 26 443 BoxColFill
+0.00 0.00 0.00 C 0.180 1790 512 25 443 BoxColFill
 LCb setrgbcolor
-1819 512 N
+1790 512 N
 0 442 V
-25 0 V
+24 0 V
 0 -442 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1855 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 1824 512 26 467 BoxColFill
 LCb setrgbcolor
-1855 512 N
+1824 512 N
 0 466 V
 25 0 V
 0 -466 V
@@ -2909,9 +2923,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1891 512 25 476 BoxColFill
+0.00 0.00 0.00 C 0.180 1859 512 25 476 BoxColFill
 LCb setrgbcolor
-1891 512 N
+1859 512 N
 0 475 V
 24 0 V
 0 -475 V
@@ -2919,19 +2933,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1926 512 26 477 BoxColFill
+0.00 0.00 0.00 C 0.180 1894 512 25 477 BoxColFill
 LCb setrgbcolor
-1926 512 N
+1894 512 N
 0 476 V
-25 0 V
+24 0 V
 0 -476 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1962 512 26 433 BoxColFill
+0.00 0.00 0.00 C 0.180 1928 512 26 433 BoxColFill
 LCb setrgbcolor
-1962 512 N
+1928 512 N
 0 432 V
 25 0 V
 0 -432 V
@@ -2939,9 +2953,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1997 512 26 450 BoxColFill
+0.00 0.00 0.00 C 0.180 1963 512 26 450 BoxColFill
 LCb setrgbcolor
-1997 512 N
+1963 512 N
 0 449 V
 25 0 V
 0 -449 V
@@ -2949,29 +2963,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2033 512 26 458 BoxColFill
+0.00 0.00 0.00 C 0.180 1998 512 25 458 BoxColFill
 LCb setrgbcolor
-2033 512 N
+1998 512 N
 0 457 V
-25 0 V
+24 0 V
 0 -457 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2068 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 2033 512 25 467 BoxColFill
 LCb setrgbcolor
-2068 512 N
+2033 512 N
 0 466 V
-25 0 V
+24 0 V
 0 -466 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2104 512 26 469 BoxColFill
+0.00 0.00 0.00 C 0.180 2067 512 26 469 BoxColFill
 LCb setrgbcolor
-2104 512 N
+2067 512 N
 0 468 V
 25 0 V
 0 -468 V
@@ -2979,39 +2993,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2140 512 25 478 BoxColFill
+0.00 0.00 0.00 C 0.180 2102 512 26 478 BoxColFill
 LCb setrgbcolor
-2140 512 N
+2102 512 N
 0 477 V
-24 0 V
+25 0 V
 0 -477 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2175 512 26 488 BoxColFill
+0.00 0.00 0.00 C 0.180 2137 512 25 488 BoxColFill
 LCb setrgbcolor
-2175 512 N
+2137 512 N
 0 487 V
-25 0 V
+24 0 V
 0 -487 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2211 512 26 512 BoxColFill
+0.00 0.00 0.00 C 0.180 2172 512 25 512 BoxColFill
 LCb setrgbcolor
-2211 512 N
+2172 512 N
 0 511 V
-25 0 V
+24 0 V
 0 -511 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2246 512 26 517 BoxColFill
+0.00 0.00 0.00 C 0.180 2206 512 26 517 BoxColFill
 LCb setrgbcolor
-2246 512 N
+2206 512 N
 0 516 V
 25 0 V
 0 -516 V
@@ -3019,39 +3033,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2282 512 26 515 BoxColFill
+0.00 0.00 0.00 C 0.180 2241 512 25 515 BoxColFill
 LCb setrgbcolor
-2282 512 N
+2241 512 N
 0 514 V
-25 0 V
+24 0 V
 0 -514 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2317 512 26 525 BoxColFill
+0.00 0.00 0.00 C 0.180 2276 512 25 525 BoxColFill
 LCb setrgbcolor
-2317 512 N
+2276 512 N
 0 524 V
-25 0 V
+24 0 V
 0 -524 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2353 512 26 526 BoxColFill
+0.00 0.00 0.00 C 0.180 2311 512 25 526 BoxColFill
 LCb setrgbcolor
-2353 512 N
+2311 512 N
 0 525 V
-25 0 V
+24 0 V
 0 -525 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2389 512 26 532 BoxColFill
+0.00 0.00 0.00 C 0.180 2345 512 26 532 BoxColFill
 LCb setrgbcolor
-2389 512 N
+2345 512 N
 0 531 V
 25 0 V
 0 -531 V
@@ -3059,39 +3073,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2424 512 26 557 BoxColFill
+0.00 0.00 0.00 C 0.180 2380 512 25 557 BoxColFill
 LCb setrgbcolor
-2424 512 N
+2380 512 N
 0 556 V
-25 0 V
+24 0 V
 0 -556 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2460 512 26 564 BoxColFill
+0.00 0.00 0.00 C 0.180 2415 512 25 564 BoxColFill
 LCb setrgbcolor
-2460 512 N
+2415 512 N
 0 563 V
-25 0 V
+24 0 V
 0 -563 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2495 512 26 568 BoxColFill
+0.00 0.00 0.00 C 0.180 2450 512 25 568 BoxColFill
 LCb setrgbcolor
-2495 512 N
+2450 512 N
 0 567 V
-25 0 V
+24 0 V
 0 -567 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2531 512 26 574 BoxColFill
+0.00 0.00 0.00 C 0.180 2484 512 26 574 BoxColFill
 LCb setrgbcolor
-2531 512 N
+2484 512 N
 0 573 V
 25 0 V
 0 -573 V
@@ -3099,9 +3113,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2567 512 25 577 BoxColFill
+0.00 0.00 0.00 C 0.180 2519 512 25 577 BoxColFill
 LCb setrgbcolor
-2567 512 N
+2519 512 N
 0 576 V
 24 0 V
 0 -576 V
@@ -3109,29 +3123,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2602 512 26 580 BoxColFill
+0.00 0.00 0.00 C 0.180 2554 512 25 580 BoxColFill
 LCb setrgbcolor
-2602 512 N
+2554 512 N
 0 579 V
-25 0 V
+24 0 V
 0 -579 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2638 512 26 583 BoxColFill
+0.00 0.00 0.00 C 0.180 2589 512 25 583 BoxColFill
 LCb setrgbcolor
-2638 512 N
+2589 512 N
 0 582 V
-25 0 V
+24 0 V
 0 -582 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2673 512 26 591 BoxColFill
+0.00 0.00 0.00 C 0.180 2623 512 26 591 BoxColFill
 LCb setrgbcolor
-2673 512 N
+2623 512 N
 0 590 V
 25 0 V
 0 -590 V
@@ -3139,69 +3153,69 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2709 512 26 691 BoxColFill
+0.00 0.00 0.00 C 0.180 2658 512 25 691 BoxColFill
 LCb setrgbcolor
-2709 512 N
+2658 512 N
 0 690 V
-25 0 V
+24 0 V
 0 -690 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2744 512 26 625 BoxColFill
+0.00 0.00 0.00 C 0.180 2693 512 25 625 BoxColFill
 LCb setrgbcolor
-2744 512 N
+2693 512 N
 0 624 V
-25 0 V
+24 0 V
 0 -624 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2780 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2728 512 25 621 BoxColFill
 LCb setrgbcolor
-2780 512 N
+2728 512 N
 0 620 V
-25 0 V
+24 0 V
 0 -620 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2816 512 25 624 BoxColFill
+0.00 0.00 0.00 C 0.180 2762 512 26 624 BoxColFill
 LCb setrgbcolor
-2816 512 N
+2762 512 N
 0 623 V
-24 0 V
+25 0 V
 0 -623 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2851 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2797 512 25 621 BoxColFill
 LCb setrgbcolor
-2851 512 N
+2797 512 N
 0 620 V
-25 0 V
+24 0 V
 0 -620 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2887 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2832 512 25 621 BoxColFill
 LCb setrgbcolor
-2887 512 N
+2832 512 N
 0 620 V
-25 0 V
+24 0 V
 0 -620 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2922 512 26 620 BoxColFill
+0.00 0.00 0.00 C 0.180 2866 512 26 620 BoxColFill
 LCb setrgbcolor
-2922 512 N
+2866 512 N
 0 619 V
 25 0 V
 0 -619 V
@@ -3209,9 +3223,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2958 512 26 629 BoxColFill
+0.00 0.00 0.00 C 0.180 2901 512 26 629 BoxColFill
 LCb setrgbcolor
-2958 512 N
+2901 512 N
 0 628 V
 25 0 V
 0 -628 V
@@ -3219,29 +3233,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2993 512 26 611 BoxColFill
+0.00 0.00 0.00 C 0.180 2936 512 25 611 BoxColFill
 LCb setrgbcolor
-2993 512 N
+2936 512 N
 0 610 V
-25 0 V
+24 0 V
 0 -610 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3029 512 26 614 BoxColFill
+0.00 0.00 0.00 C 0.180 2971 512 25 614 BoxColFill
 LCb setrgbcolor
-3029 512 N
+2971 512 N
 0 613 V
-25 0 V
+24 0 V
 0 -613 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3065 512 26 596 BoxColFill
+0.00 0.00 0.00 C 0.180 3005 512 26 596 BoxColFill
 LCb setrgbcolor
-3065 512 N
+3005 512 N
 0 595 V
 25 0 V
 0 -595 V
@@ -3249,9 +3263,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3100 512 26 594 BoxColFill
+0.00 0.00 0.00 C 0.180 3040 512 26 594 BoxColFill
 LCb setrgbcolor
-3100 512 N
+3040 512 N
 0 593 V
 25 0 V
 0 -593 V
@@ -3259,29 +3273,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3136 512 26 599 BoxColFill
+0.00 0.00 0.00 C 0.180 3075 512 25 599 BoxColFill
 LCb setrgbcolor
-3136 512 N
+3075 512 N
 0 598 V
-25 0 V
+24 0 V
 0 -598 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3171 512 26 620 BoxColFill
+0.00 0.00 0.00 C 0.180 3110 512 25 620 BoxColFill
 LCb setrgbcolor
-3171 512 N
+3110 512 N
 0 619 V
-25 0 V
+24 0 V
 0 -619 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3207 512 26 623 BoxColFill
+0.00 0.00 0.00 C 0.180 3144 512 26 623 BoxColFill
 LCb setrgbcolor
-3207 512 N
+3144 512 N
 0 622 V
 25 0 V
 0 -622 V
@@ -3289,39 +3303,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3242 512 26 632 BoxColFill
+0.00 0.00 0.00 C 0.180 3179 512 25 632 BoxColFill
 LCb setrgbcolor
-3242 512 N
+3179 512 N
 0 631 V
-25 0 V
+24 0 V
 0 -631 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3278 512 26 645 BoxColFill
+0.00 0.00 0.00 C 0.180 3214 512 25 645 BoxColFill
 LCb setrgbcolor
-3278 512 N
+3214 512 N
 0 644 V
-25 0 V
+24 0 V
 0 -644 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3314 512 26 703 BoxColFill
+0.00 0.00 0.00 C 0.180 3249 512 25 703 BoxColFill
 LCb setrgbcolor
-3314 512 N
+3249 512 N
 0 702 V
-25 0 V
+24 0 V
 0 -702 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3349 512 26 713 BoxColFill
+0.00 0.00 0.00 C 0.180 3283 512 26 713 BoxColFill
 LCb setrgbcolor
-3349 512 N
+3283 512 N
 0 712 V
 25 0 V
 0 -712 V
@@ -3329,36 +3343,56 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3385 512 26 720 BoxColFill
+0.00 0.00 0.00 C 0.180 3318 512 25 720 BoxColFill
 LCb setrgbcolor
-3385 512 N
+3318 512 N
 0 719 V
-25 0 V
+24 0 V
 0 -719 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3420 512 26 725 BoxColFill
+0.00 0.00 0.00 C 0.180 3353 512 25 725 BoxColFill
 LCb setrgbcolor
-3420 512 N
+3353 512 N
 0 724 V
-25 0 V
+24 0 V
 0 -724 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3456 512 26 765 BoxColFill
+0.00 0.00 0.00 C 0.180 3388 512 25 765 BoxColFill
 LCb setrgbcolor
-3456 512 N
+3388 512 N
 0 764 V
-25 0 V
+24 0 V
 0 -764 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.180 3422 512 26 774 BoxColFill
+LCb setrgbcolor
+3422 512 N
+0 773 V
+25 0 V
+0 -773 V
 -25 0 V
 Z stroke
 1.000 UL
 LTb
+0.00 0.00 0.00 C 0.180 3457 512 25 781 BoxColFill
+LCb setrgbcolor
+3457 512 N
+0 780 V
+24 0 V
+0 -780 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
 0.00 0.00 0.00 C % End plot #1
 % Begin plot #2
 1.000 UL
@@ -3379,53 +3413,53 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 574 543 26 1 BoxColFill
+0.90 0.62 0.00 C 0.180 574 543 25 1 BoxColFill
 LCb setrgbcolor
 574 543 N
-25 0 V
--25 0 V
+24 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 610 543 26 1 BoxColFill
+0.90 0.62 0.00 C 0.180 608 543 26 1 BoxColFill
 LCb setrgbcolor
-610 543 N
+608 543 N
 25 0 V
 -25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 645 553 26 1 BoxColFill
+0.90 0.62 0.00 C 0.180 643 553 25 1 BoxColFill
 LCb setrgbcolor
-645 553 N
-25 0 V
--25 0 V
+643 553 N
+24 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 681 555 26 22 BoxColFill
+0.90 0.62 0.00 C 0.180 678 555 25 22 BoxColFill
 LCb setrgbcolor
-681 555 N
+678 555 N
 0 21 V
-25 0 V
+24 0 V
 0 -21 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 716 548 26 25 BoxColFill
+0.90 0.62 0.00 C 0.180 713 548 25 25 BoxColFill
 LCb setrgbcolor
-716 548 N
+713 548 N
 0 24 V
-25 0 V
+24 0 V
 0 -24 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 752 548 26 26 BoxColFill
+0.90 0.62 0.00 C 0.180 747 548 26 26 BoxColFill
 LCb setrgbcolor
-752 548 N
+747 548 N
 0 25 V
 25 0 V
 0 -25 V
@@ -3433,39 +3467,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 788 549 26 30 BoxColFill
+0.90 0.62 0.00 C 0.180 782 549 25 30 BoxColFill
 LCb setrgbcolor
-788 549 N
+782 549 N
 0 29 V
-25 0 V
+24 0 V
 0 -29 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 823 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 817 562 25 41 BoxColFill
 LCb setrgbcolor
-823 562 N
+817 562 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 859 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 852 562 25 41 BoxColFill
 LCb setrgbcolor
-859 562 N
+852 562 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 894 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 886 562 26 41 BoxColFill
 LCb setrgbcolor
-894 562 N
+886 562 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3473,29 +3507,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 930 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 921 562 25 41 BoxColFill
 LCb setrgbcolor
-930 562 N
+921 562 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 965 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 956 562 25 41 BoxColFill
 LCb setrgbcolor
-965 562 N
+956 562 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1001 563 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 990 563 26 41 BoxColFill
 LCb setrgbcolor
-1001 563 N
+990 563 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3503,9 +3537,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1037 639 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1025 639 26 41 BoxColFill
 LCb setrgbcolor
-1037 639 N
+1025 639 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3513,29 +3547,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1072 639 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1060 639 25 41 BoxColFill
 LCb setrgbcolor
-1072 639 N
+1060 639 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1108 672 26 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1095 672 25 48 BoxColFill
 LCb setrgbcolor
-1108 672 N
+1095 672 N
 0 47 V
-25 0 V
+24 0 V
 0 -47 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1143 680 26 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1129 680 26 48 BoxColFill
 LCb setrgbcolor
-1143 680 N
+1129 680 N
 0 47 V
 25 0 V
 0 -47 V
@@ -3543,9 +3577,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1179 773 26 50 BoxColFill
+0.90 0.62 0.00 C 0.180 1164 773 26 50 BoxColFill
 LCb setrgbcolor
-1179 773 N
+1164 773 N
 0 49 V
 25 0 V
 0 -49 V
@@ -3553,9 +3587,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1215 775 25 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1199 775 25 51 BoxColFill
 LCb setrgbcolor
-1215 775 N
+1199 775 N
 0 50 V
 24 0 V
 0 -50 V
@@ -3563,19 +3597,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1250 779 26 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1234 779 25 51 BoxColFill
 LCb setrgbcolor
-1250 779 N
+1234 779 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1286 693 26 52 BoxColFill
+0.90 0.62 0.00 C 0.180 1268 693 26 52 BoxColFill
 LCb setrgbcolor
-1286 693 N
+1268 693 N
 0 51 V
 25 0 V
 0 -51 V
@@ -3583,39 +3617,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1321 724 26 53 BoxColFill
+0.90 0.62 0.00 C 0.180 1303 724 25 53 BoxColFill
 LCb setrgbcolor
-1321 724 N
+1303 724 N
 0 52 V
-25 0 V
+24 0 V
 0 -52 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1357 748 26 56 BoxColFill
+0.90 0.62 0.00 C 0.180 1338 748 25 56 BoxColFill
 LCb setrgbcolor
-1357 748 N
+1338 748 N
 0 55 V
-25 0 V
+24 0 V
 0 -55 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1392 757 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1373 757 25 57 BoxColFill
 LCb setrgbcolor
-1392 757 N
+1373 757 N
 0 56 V
-25 0 V
+24 0 V
 0 -56 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1428 767 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1407 767 26 57 BoxColFill
 LCb setrgbcolor
-1428 767 N
+1407 767 N
 0 56 V
 25 0 V
 0 -56 V
@@ -3623,9 +3657,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1464 799 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1442 799 25 57 BoxColFill
 LCb setrgbcolor
-1464 799 N
+1442 799 N
 0 56 V
 24 0 V
 0 -56 V
@@ -3633,29 +3667,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1499 828 26 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1477 828 25 66 BoxColFill
 LCb setrgbcolor
-1499 828 N
+1477 828 N
 0 65 V
-25 0 V
+24 0 V
 0 -65 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1535 828 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1512 828 25 67 BoxColFill
 LCb setrgbcolor
-1535 828 N
+1512 828 N
 0 66 V
-25 0 V
+24 0 V
 0 -66 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1570 876 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1546 876 26 67 BoxColFill
 LCb setrgbcolor
-1570 876 N
+1546 876 N
 0 66 V
 25 0 V
 0 -66 V
@@ -3663,39 +3697,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1606 876 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1581 876 25 67 BoxColFill
 LCb setrgbcolor
-1606 876 N
+1581 876 N
 0 66 V
-25 0 V
+24 0 V
 0 -66 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1641 883 26 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1616 883 25 66 BoxColFill
 LCb setrgbcolor
-1641 883 N
+1616 883 N
 0 65 V
-25 0 V
+24 0 V
 0 -65 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1677 904 26 75 BoxColFill
+0.90 0.62 0.00 C 0.180 1651 904 25 75 BoxColFill
 LCb setrgbcolor
-1677 904 N
+1651 904 N
 0 74 V
-25 0 V
+24 0 V
 0 -74 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1713 926 26 78 BoxColFill
+0.90 0.62 0.00 C 0.180 1685 926 26 78 BoxColFill
 LCb setrgbcolor
-1713 926 N
+1685 926 N
 0 77 V
 25 0 V
 0 -77 V
@@ -3703,39 +3737,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1748 952 26 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1720 952 25 87 BoxColFill
 LCb setrgbcolor
-1748 952 N
+1720 952 N
 0 86 V
-25 0 V
+24 0 V
 0 -86 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1784 952 26 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1755 952 25 88 BoxColFill
 LCb setrgbcolor
-1784 952 N
+1755 952 N
 0 87 V
-25 0 V
+24 0 V
 0 -87 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1819 954 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1790 954 25 89 BoxColFill
 LCb setrgbcolor
-1819 954 N
+1790 954 N
 0 88 V
-25 0 V
+24 0 V
 0 -88 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1855 978 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1824 978 26 89 BoxColFill
 LCb setrgbcolor
-1855 978 N
+1824 978 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3743,9 +3777,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1891 987 25 90 BoxColFill
+0.90 0.62 0.00 C 0.180 1859 987 25 90 BoxColFill
 LCb setrgbcolor
-1891 987 N
+1859 987 N
 0 89 V
 24 0 V
 0 -89 V
@@ -3753,19 +3787,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1926 988 26 91 BoxColFill
+0.90 0.62 0.00 C 0.180 1894 988 25 91 BoxColFill
 LCb setrgbcolor
-1926 988 N
+1894 988 N
 0 90 V
-25 0 V
+24 0 V
 0 -90 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1962 944 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1928 944 26 89 BoxColFill
 LCb setrgbcolor
-1962 944 N
+1928 944 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3773,9 +3807,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1997 961 26 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1963 961 26 87 BoxColFill
 LCb setrgbcolor
-1997 961 N
+1963 961 N
 0 86 V
 25 0 V
 0 -86 V
@@ -3783,29 +3817,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2033 969 26 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1998 969 25 88 BoxColFill
 LCb setrgbcolor
-2033 969 N
+1998 969 N
 0 87 V
-25 0 V
+24 0 V
 0 -87 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2068 978 26 139 BoxColFill
+0.90 0.62 0.00 C 0.180 2033 978 25 139 BoxColFill
 LCb setrgbcolor
-2068 978 N
+2033 978 N
 0 138 V
-25 0 V
+24 0 V
 0 -138 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2104 980 26 157 BoxColFill
+0.90 0.62 0.00 C 0.180 2067 980 26 157 BoxColFill
 LCb setrgbcolor
-2104 980 N
+2067 980 N
 0 156 V
 25 0 V
 0 -156 V
@@ -3813,39 +3847,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2140 989 25 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2102 989 26 165 BoxColFill
 LCb setrgbcolor
-2140 989 N
+2102 989 N
 0 164 V
-24 0 V
+25 0 V
 0 -164 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2175 999 26 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2137 999 25 165 BoxColFill
 LCb setrgbcolor
-2175 999 N
+2137 999 N
 0 164 V
-25 0 V
+24 0 V
 0 -164 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2211 1023 26 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2172 1023 25 171 BoxColFill
 LCb setrgbcolor
-2211 1023 N
+2172 1023 N
 0 170 V
-25 0 V
+24 0 V
 0 -170 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2246 1028 26 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2206 1028 26 171 BoxColFill
 LCb setrgbcolor
-2246 1028 N
+2206 1028 N
 0 170 V
 25 0 V
 0 -170 V
@@ -3853,39 +3887,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2282 1026 26 173 BoxColFill
+0.90 0.62 0.00 C 0.180 2241 1026 25 173 BoxColFill
 LCb setrgbcolor
-2282 1026 N
+2241 1026 N
 0 172 V
-25 0 V
+24 0 V
 0 -172 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2317 1036 26 174 BoxColFill
+0.90 0.62 0.00 C 0.180 2276 1036 25 174 BoxColFill
 LCb setrgbcolor
-2317 1036 N
+2276 1036 N
 0 173 V
-25 0 V
+24 0 V
 0 -173 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2353 1037 26 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2311 1037 25 176 BoxColFill
 LCb setrgbcolor
-2353 1037 N
+2311 1037 N
 0 175 V
-25 0 V
+24 0 V
 0 -175 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2389 1043 26 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2345 1043 26 176 BoxColFill
 LCb setrgbcolor
-2389 1043 N
+2345 1043 N
 0 175 V
 25 0 V
 0 -175 V
@@ -3893,39 +3927,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2424 1068 26 177 BoxColFill
+0.90 0.62 0.00 C 0.180 2380 1068 25 177 BoxColFill
 LCb setrgbcolor
-2424 1068 N
+2380 1068 N
 0 176 V
-25 0 V
+24 0 V
 0 -176 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2460 1075 26 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2415 1075 25 179 BoxColFill
 LCb setrgbcolor
-2460 1075 N
+2415 1075 N
 0 178 V
-25 0 V
+24 0 V
 0 -178 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2495 1079 26 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2450 1079 25 179 BoxColFill
 LCb setrgbcolor
-2495 1079 N
+2450 1079 N
 0 178 V
-25 0 V
+24 0 V
 0 -178 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2531 1085 26 222 BoxColFill
+0.90 0.62 0.00 C 0.180 2484 1085 26 222 BoxColFill
 LCb setrgbcolor
-2531 1085 N
+2484 1085 N
 0 221 V
 25 0 V
 0 -221 V
@@ -3933,9 +3967,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2567 1088 25 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2519 1088 25 225 BoxColFill
 LCb setrgbcolor
-2567 1088 N
+2519 1088 N
 0 224 V
 24 0 V
 0 -224 V
@@ -3943,29 +3977,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2602 1091 26 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2554 1091 25 224 BoxColFill
 LCb setrgbcolor
-2602 1091 N
+2554 1091 N
 0 223 V
-25 0 V
+24 0 V
 0 -223 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2638 1094 26 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2589 1094 25 224 BoxColFill
 LCb setrgbcolor
-2638 1094 N
+2589 1094 N
 0 223 V
-25 0 V
+24 0 V
 0 -223 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2673 1102 26 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2623 1102 26 225 BoxColFill
 LCb setrgbcolor
-2673 1102 N
+2623 1102 N
 0 224 V
 25 0 V
 0 -224 V
@@ -3973,69 +4007,69 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2709 1202 26 226 BoxColFill
+0.90 0.62 0.00 C 0.180 2658 1202 25 226 BoxColFill
 LCb setrgbcolor
-2709 1202 N
+2658 1202 N
 0 225 V
-25 0 V
+24 0 V
 0 -225 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2744 1136 26 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2693 1136 25 229 BoxColFill
 LCb setrgbcolor
-2744 1136 N
+2693 1136 N
 0 228 V
-25 0 V
+24 0 V
 0 -228 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2780 1132 26 231 BoxColFill
+0.90 0.62 0.00 C 0.180 2728 1132 25 231 BoxColFill
 LCb setrgbcolor
-2780 1132 N
+2728 1132 N
 0 230 V
-25 0 V
+24 0 V
 0 -230 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2816 1135 25 232 BoxColFill
+0.90 0.62 0.00 C 0.180 2762 1135 26 232 BoxColFill
 LCb setrgbcolor
-2816 1135 N
+2762 1135 N
 0 231 V
-24 0 V
+25 0 V
 0 -231 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2851 1132 26 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2797 1132 25 229 BoxColFill
 LCb setrgbcolor
-2851 1132 N
+2797 1132 N
 0 228 V
-25 0 V
+24 0 V
 0 -228 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2887 1132 26 230 BoxColFill
+0.90 0.62 0.00 C 0.180 2832 1132 25 230 BoxColFill
 LCb setrgbcolor
-2887 1132 N
+2832 1132 N
 0 229 V
-25 0 V
+24 0 V
 0 -229 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2922 1131 26 233 BoxColFill
+0.90 0.62 0.00 C 0.180 2866 1131 26 233 BoxColFill
 LCb setrgbcolor
-2922 1131 N
+2866 1131 N
 0 232 V
 25 0 V
 0 -232 V
@@ -4043,9 +4077,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2958 1140 26 241 BoxColFill
+0.90 0.62 0.00 C 0.180 2901 1140 26 241 BoxColFill
 LCb setrgbcolor
-2958 1140 N
+2901 1140 N
 0 240 V
 25 0 V
 0 -240 V
@@ -4053,29 +4087,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2993 1122 26 244 BoxColFill
+0.90 0.62 0.00 C 0.180 2936 1122 25 244 BoxColFill
 LCb setrgbcolor
-2993 1122 N
+2936 1122 N
 0 243 V
-25 0 V
+24 0 V
 0 -243 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3029 1125 26 345 BoxColFill
+0.90 0.62 0.00 C 0.180 2971 1125 25 345 BoxColFill
 LCb setrgbcolor
-3029 1125 N
+2971 1125 N
 0 344 V
-25 0 V
+24 0 V
 0 -344 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3065 1107 26 256 BoxColFill
+0.90 0.62 0.00 C 0.180 3005 1107 26 256 BoxColFill
 LCb setrgbcolor
-3065 1107 N
+3005 1107 N
 0 255 V
 25 0 V
 0 -255 V
@@ -4083,9 +4117,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3100 1105 26 246 BoxColFill
+0.90 0.62 0.00 C 0.180 3040 1105 26 246 BoxColFill
 LCb setrgbcolor
-3100 1105 N
+3040 1105 N
 0 245 V
 25 0 V
 0 -245 V
@@ -4093,29 +4127,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3136 1110 26 250 BoxColFill
+0.90 0.62 0.00 C 0.180 3075 1110 25 250 BoxColFill
 LCb setrgbcolor
-3136 1110 N
+3075 1110 N
 0 249 V
-25 0 V
+24 0 V
 0 -249 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3171 1131 26 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3110 1131 25 251 BoxColFill
 LCb setrgbcolor
-3171 1131 N
+3110 1131 N
 0 250 V
-25 0 V
+24 0 V
 0 -250 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3207 1134 26 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3144 1134 26 251 BoxColFill
 LCb setrgbcolor
-3207 1134 N
+3144 1134 N
 0 250 V
 25 0 V
 0 -250 V
@@ -4123,39 +4157,39 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3242 1143 26 258 BoxColFill
+0.90 0.62 0.00 C 0.180 3179 1143 25 258 BoxColFill
 LCb setrgbcolor
-3242 1143 N
+3179 1143 N
 0 257 V
-25 0 V
+24 0 V
 0 -257 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3278 1156 26 261 BoxColFill
+0.90 0.62 0.00 C 0.180 3214 1156 25 261 BoxColFill
 LCb setrgbcolor
-3278 1156 N
+3214 1156 N
 0 260 V
-25 0 V
+24 0 V
 0 -260 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3314 1214 26 267 BoxColFill
+0.90 0.62 0.00 C 0.180 3249 1214 25 267 BoxColFill
 LCb setrgbcolor
-3314 1214 N
+3249 1214 N
 0 266 V
-25 0 V
+24 0 V
 0 -266 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3349 1224 26 314 BoxColFill
+0.90 0.62 0.00 C 0.180 3283 1224 26 314 BoxColFill
 LCb setrgbcolor
-3349 1224 N
+3283 1224 N
 0 313 V
 25 0 V
 0 -313 V
@@ -4163,36 +4197,56 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3385 1231 26 320 BoxColFill
+0.90 0.62 0.00 C 0.180 3318 1231 25 320 BoxColFill
 LCb setrgbcolor
-3385 1231 N
+3318 1231 N
 0 319 V
-25 0 V
+24 0 V
 0 -319 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3420 1236 26 324 BoxColFill
+0.90 0.62 0.00 C 0.180 3353 1236 25 324 BoxColFill
 LCb setrgbcolor
-3420 1236 N
+3353 1236 N
 0 323 V
-25 0 V
+24 0 V
 0 -323 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3456 1276 26 364 BoxColFill
+0.90 0.62 0.00 C 0.180 3388 1276 25 364 BoxColFill
 LCb setrgbcolor
-3456 1276 N
+3388 1276 N
 0 363 V
-25 0 V
+24 0 V
 0 -363 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.180 3422 1285 26 386 BoxColFill
+LCb setrgbcolor
+3422 1285 N
+0 385 V
+25 0 V
+0 -385 V
 -25 0 V
 Z stroke
 1.000 UL
 LTb
+0.90 0.62 0.00 C 0.180 3457 1292 25 403 BoxColFill
+LCb setrgbcolor
+3457 1292 N
+0 402 V
+24 0 V
+0 -402 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
 0.90 0.62 0.00 C % End plot #2
 % Begin plot #3
 1.000 UL
@@ -4205,88 +4259,90 @@ LTb
 LTb
 0.55 0.00 0.00 C 2092 1457 M
 255 0 V
-587 512 M
+586 512 M
+34 0 V
 35 0 V
-36 0 V
 35 778 V
-36 193 V
-35 -5 V
-36 87 V
-36 29 V
+35 193 V
+34 -5 V
+35 87 V
+35 29 V
 35 3 V
-36 0 V
+34 0 V
 35 -5 V
-36 0 V
-36 -17 V
-35 -483 V
-36 2 V
+35 0 V
+35 -17 V
+34 -483 V
+35 2 V
 35 -38 V
-36 -20 V
-35 -140 V
-36 0 V
-36 -5 V
+35 -20 V
+34 -140 V
+35 0 V
+35 -5 V
 35 150 V
-36 -51 V
+34 -51 V
 35 -17 V
-36 -14 V
+35 -14 V
 35 -15 V
-36 -38 V
-36 24 V
+34 -38 V
+35 24 V
 35 -2 V
-36 -46 V
+34 -46 V
 35 0 V
-36 -8 V
-36 20 V
-35 -3 V
-36 17 V
+35 -8 V
+35 20 V
+34 -3 V
+35 17 V
 35 3 V
-36 4 V
-35 -21 V
-36 0 V
-36 0 V
+35 4 V
+34 -21 V
+35 0 V
+35 0 V
 35 26 V
-36 -19 V
+34 -19 V
 35 -5 V
-36 169 V
+35 169 V
 35 51 V
-36 14 V
-36 -7 V
+34 14 V
 35 -7 V
-36 -5 V
-35 5 V
-36 -5 V
+35 -7 V
+35 -5 V
+34 5 V
+35 -5 V
 35 5 V
-36 -2 V
-36 -22 V
+35 -2 V
+34 -22 V
 35 0 V
-36 -3 V
+35 -3 V
 35 95 V
-36 2 V
-36 -2 V
+34 2 V
+35 -2 V
 35 -3 V
-36 -5 V
+34 -5 V
 35 -70 V
-36 53 V
+35 53 V
 35 8 V
-36 -3 V
-36 -2 V
+34 -3 V
+35 -2 V
 35 2 V
-36 5 V
-35 12 V
-36 22 V
+35 5 V
+34 12 V
+35 22 V
 35 176 V
-36 -142 V
-36 -20 V
+35 -142 V
+34 -20 V
 35 5 V
-36 -14 V
+35 -14 V
 35 -3 V
-36 5 V
-36 -2 V
+34 5 V
+35 -2 V
 35 -29 V
-36 72 V
-35 3 V
-36 5 V
+35 72 V
+34 3 V
+35 5 V
 35 31 V
+35 24 V
+34 19 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/formal/data/rcu-test.dat b/formal/data/rcu-test.dat
index 26ccd27e..8dc59f55 100644
--- a/formal/data/rcu-test.dat
+++ b/formal/data/rcu-test.dat
@@ -80,3 +80,5 @@ v5.8  17424 6627 24051 27.6
 ""    17863 7916 25779 30.7
 ""    17978 8033 26011 30.9
 v5.12 18965 9025 27990 32.2
+""    19205 9556 28761 33.2
+v5.14 19362 9983 29345 34.0
-- 
2.17.1

