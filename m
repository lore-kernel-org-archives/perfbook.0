Return-Path: <SRS0=Nnbh=J3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U46QMmB5uOuJHHDbE6h5vNwjFlnkESlU/UZG/TrQxyo=;
        b=ZyYNguf4Bw1/X7fka96pIiONoiPwRLyyska+Q03z653SmGMnD4am46JcNZ4yHC5bow
         hf3YIevbXv48QaGmffa74DHX+UHpI/LUtysn0WQqvgpVc0Dl/W+c9OR29FT9vmO53IQp
         juM2NCd1mYja1l0Il0/YHynvEaOu4Y+YPrWaRQyPckH5TMi8tDFBL5Eyt19LV9l87/1j
         K88CN4Hb5jL7WQeP3J4A4h9fAZ7wDlOs9wbfaM2BmBP+BKBsb+CrVhkFbdX3TVUXhZ0I
         +7oGSbeA4hkYhEvReKXSEmUdZmG5LbAMiG0QR6H63nIQPE7kt6u1oL3uimddRv6M0Zxz
         X+AA==
Subject: [PATCH -perfbook 4/4] formal: Add v5.12 rcu-test data in Figure 12.4
References: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <38f11f19-0301-233e-0766-b4e25f875d0f@gmail.com>
Date: Fri, 30 Apr 2021 13:55:21 +0900
MIME-Version: 1.0
In-Reply-To: <9ccade63-dbc0-a089-b79d-3f1b619a6932@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/RCU-test-ratio.eps | 1113 +++++++++++++++++++------------------
 formal/data/rcu-test.dat  |    3 +-
 2 files changed, 571 insertions(+), 545 deletions(-)

diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
index aa5a21d8..6c742612 100644
--- a/formal/RCU-test-ratio.eps
+++ b/formal/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Sun Mar 14 14:00:58 2021
+%%CreationDate: Fri Apr 30 10:49:59 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Sun Mar 14 14:00:58 2021)
+  /CreationDate (Fri Apr 30 10:49:59 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1990,21 +1990,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-623 512 M
+622 512 M
 stroke
 LTb
 LCb setrgbcolor
-659 512 M
+658 512 M
 stroke
 LTb
 LCb setrgbcolor
-695 512 M
+693 512 M
 stroke
 LTb
 LCb setrgbcolor
-731 512 M
+729 512 M
 stroke
-731 464 M
+729 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
 ] -26.7 MRshow
@@ -2012,21 +2012,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-767 512 M
+764 512 M
 stroke
 LTb
 LCb setrgbcolor
-803 512 M
+800 512 M
 stroke
 LTb
 LCb setrgbcolor
-839 512 M
+836 512 M
 stroke
 LTb
 LCb setrgbcolor
-875 512 M
+871 512 M
 stroke
-875 464 M
+871 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
 ] -26.7 MRshow
@@ -2034,21 +2034,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-911 512 M
+907 512 M
 stroke
 LTb
 LCb setrgbcolor
-947 512 M
+942 512 M
 stroke
 LTb
 LCb setrgbcolor
-983 512 M
+978 512 M
 stroke
 LTb
 LCb setrgbcolor
-1019 512 M
+1014 512 M
 stroke
-1019 464 M
+1014 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
 ] -26.7 MRshow
@@ -2056,21 +2056,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1055 512 M
+1049 512 M
 stroke
 LTb
 LCb setrgbcolor
-1091 512 M
+1085 512 M
 stroke
 LTb
 LCb setrgbcolor
-1127 512 M
+1120 512 M
 stroke
 LTb
 LCb setrgbcolor
-1163 512 M
+1156 512 M
 stroke
-1163 464 M
+1156 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
 ] -26.7 MRshow
@@ -2078,21 +2078,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1199 512 M
+1191 512 M
 stroke
 LTb
 LCb setrgbcolor
-1235 512 M
+1227 512 M
 stroke
 LTb
 LCb setrgbcolor
-1271 512 M
+1263 512 M
 stroke
 LTb
 LCb setrgbcolor
-1307 512 M
+1298 512 M
 stroke
-1307 464 M
+1298 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
 ] -26.7 MRshow
@@ -2100,21 +2100,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1343 512 M
+1334 512 M
 stroke
 LTb
 LCb setrgbcolor
-1379 512 M
+1369 512 M
 stroke
 LTb
 LCb setrgbcolor
-1415 512 M
+1405 512 M
 stroke
 LTb
 LCb setrgbcolor
-1451 512 M
+1440 512 M
 stroke
-1451 464 M
+1440 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
 ] -26.7 MRshow
@@ -2122,21 +2122,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1487 512 M
+1476 512 M
 stroke
 LTb
 LCb setrgbcolor
-1523 512 M
+1512 512 M
 stroke
 LTb
 LCb setrgbcolor
-1559 512 M
+1547 512 M
 stroke
 LTb
 LCb setrgbcolor
-1595 512 M
+1583 512 M
 stroke
-1595 464 M
+1583 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
 ] -26.7 MRshow
@@ -2144,21 +2144,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1631 512 M
+1618 512 M
 stroke
 LTb
 LCb setrgbcolor
-1667 512 M
+1654 512 M
 stroke
 LTb
 LCb setrgbcolor
-1703 512 M
+1690 512 M
 stroke
 LTb
 LCb setrgbcolor
-1739 512 M
+1725 512 M
 stroke
-1739 464 M
+1725 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
 ] -26.7 MRshow
@@ -2166,21 +2166,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1775 512 M
+1761 512 M
 stroke
 LTb
 LCb setrgbcolor
-1811 512 M
+1796 512 M
 stroke
 LTb
 LCb setrgbcolor
-1847 512 M
+1832 512 M
 stroke
 LTb
 LCb setrgbcolor
-1883 512 M
+1867 512 M
 stroke
-1883 464 M
+1867 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
 ] -26.7 MRshow
@@ -2188,21 +2188,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1919 512 M
+1903 512 M
 stroke
 LTb
 LCb setrgbcolor
-1955 512 M
+1939 512 M
 stroke
 LTb
 LCb setrgbcolor
-1991 512 M
+1974 512 M
 stroke
 LTb
 LCb setrgbcolor
-2028 512 M
+2010 512 M
 stroke
-2028 464 M
+2010 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
 ] -26.7 MRshow
@@ -2210,21 +2210,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2064 512 M
+2045 512 M
 stroke
 LTb
 LCb setrgbcolor
-2100 512 M
+2081 512 M
 stroke
 LTb
 LCb setrgbcolor
-2136 512 M
+2116 512 M
 stroke
 LTb
 LCb setrgbcolor
-2172 512 M
+2152 512 M
 stroke
-2172 464 M
+2152 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
 ] -26.7 MRshow
@@ -2232,21 +2232,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2208 512 M
+2188 512 M
 stroke
 LTb
 LCb setrgbcolor
-2244 512 M
+2223 512 M
 stroke
 LTb
 LCb setrgbcolor
-2280 512 M
+2259 512 M
 stroke
 LTb
 LCb setrgbcolor
-2316 512 M
+2294 512 M
 stroke
-2316 464 M
+2294 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
 ] -26.7 MRshow
@@ -2254,21 +2254,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2352 512 M
+2330 512 M
 stroke
 LTb
 LCb setrgbcolor
-2388 512 M
+2365 512 M
 stroke
 LTb
 LCb setrgbcolor
-2424 512 M
+2401 512 M
 stroke
 LTb
 LCb setrgbcolor
-2460 512 M
+2437 512 M
 stroke
-2460 464 M
+2437 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
 ] -26.7 MRshow
@@ -2276,21 +2276,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2496 512 M
+2472 512 M
 stroke
 LTb
 LCb setrgbcolor
-2532 512 M
+2508 512 M
 stroke
 LTb
 LCb setrgbcolor
-2568 512 M
+2543 512 M
 stroke
 LTb
 LCb setrgbcolor
-2604 512 M
+2579 512 M
 stroke
-2604 464 M
+2579 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
 ] -26.7 MRshow
@@ -2298,21 +2298,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2640 512 M
+2615 512 M
 stroke
 LTb
 LCb setrgbcolor
-2676 512 M
+2650 512 M
 stroke
 LTb
 LCb setrgbcolor
-2712 512 M
+2686 512 M
 stroke
 LTb
 LCb setrgbcolor
-2748 512 M
+2721 512 M
 stroke
-2748 464 M
+2721 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
 ] -26.7 MRshow
@@ -2320,21 +2320,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2784 512 M
+2757 512 M
 stroke
 LTb
 LCb setrgbcolor
-2820 512 M
+2792 512 M
 stroke
 LTb
 LCb setrgbcolor
-2856 512 M
+2828 512 M
 stroke
 LTb
 LCb setrgbcolor
-2892 512 M
+2864 512 M
 stroke
-2892 464 M
+2864 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
 ] -26.7 MRshow
@@ -2342,25 +2342,25 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2928 512 M
+2899 512 M
 stroke
 LTb
 LCb setrgbcolor
-2964 512 M
+2935 512 M
 stroke
 LTb
 LCb setrgbcolor
-3000 512 M
+2970 512 M
 stroke
 LTb
 LCb setrgbcolor
-3036 512 M
+3006 512 M
 stroke
 LTb
 LCb setrgbcolor
-3072 512 M
+3041 512 M
 stroke
-3072 464 M
+3041 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
 ] -26.7 MRshow
@@ -2368,21 +2368,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3108 512 M
+3077 512 M
 stroke
 LTb
 LCb setrgbcolor
-3144 512 M
+3113 512 M
 stroke
 LTb
 LCb setrgbcolor
-3180 512 M
+3148 512 M
 stroke
 LTb
 LCb setrgbcolor
-3216 512 M
+3184 512 M
 stroke
-3216 464 M
+3184 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
 ] -26.7 MRshow
@@ -2390,21 +2390,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3252 512 M
+3219 512 M
 stroke
 LTb
 LCb setrgbcolor
-3288 512 M
+3255 512 M
 stroke
 LTb
 LCb setrgbcolor
-3324 512 M
+3291 512 M
 stroke
 LTb
 LCb setrgbcolor
-3360 512 M
+3326 512 M
 stroke
-3360 464 M
+3326 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
 ] -26.7 MRshow
@@ -2412,11 +2412,15 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3396 512 M
+3362 512 M
 stroke
 LTb
 LCb setrgbcolor
-3432 512 M
+3397 512 M
+stroke
+LTb
+LCb setrgbcolor
+3433 512 M
 stroke
 LTb
 LCb setrgbcolor
@@ -2424,7 +2428,7 @@ LCb setrgbcolor
 stroke
 3468 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.11)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
 ] -26.7 MRshow
 grestore
 1.000 UL
@@ -2535,89 +2539,89 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 574 512 27 32 BoxColFill
+0.00 0.00 0.00 C 0.180 574 512 26 32 BoxColFill
 LCb setrgbcolor
 574 512 N
 0 31 V
-26 0 V
+25 0 V
 0 -31 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 610 512 27 32 BoxColFill
+0.00 0.00 0.00 C 0.180 610 512 26 32 BoxColFill
 LCb setrgbcolor
 610 512 N
 0 31 V
-26 0 V
+25 0 V
 0 -31 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 646 512 27 42 BoxColFill
+0.00 0.00 0.00 C 0.180 645 512 26 42 BoxColFill
 LCb setrgbcolor
-646 512 N
+645 512 N
 0 41 V
-26 0 V
+25 0 V
 0 -41 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 682 512 27 44 BoxColFill
+0.00 0.00 0.00 C 0.180 681 512 26 44 BoxColFill
 LCb setrgbcolor
-682 512 N
+681 512 N
 0 43 V
-26 0 V
+25 0 V
 0 -43 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 718 512 27 37 BoxColFill
+0.00 0.00 0.00 C 0.180 716 512 26 37 BoxColFill
 LCb setrgbcolor
-718 512 N
+716 512 N
 0 36 V
-26 0 V
+25 0 V
 0 -36 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 754 512 27 37 BoxColFill
+0.00 0.00 0.00 C 0.180 752 512 26 37 BoxColFill
 LCb setrgbcolor
-754 512 N
+752 512 N
 0 36 V
-26 0 V
+25 0 V
 0 -36 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 790 512 27 38 BoxColFill
+0.00 0.00 0.00 C 0.180 788 512 26 38 BoxColFill
 LCb setrgbcolor
-790 512 N
+788 512 N
 0 37 V
-26 0 V
+25 0 V
 0 -37 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 826 512 27 51 BoxColFill
+0.00 0.00 0.00 C 0.180 823 512 26 51 BoxColFill
 LCb setrgbcolor
-826 512 N
+823 512 N
 0 50 V
-26 0 V
+25 0 V
 0 -50 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 863 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 859 512 26 51 BoxColFill
 LCb setrgbcolor
-863 512 N
+859 512 N
 0 50 V
 25 0 V
 0 -50 V
@@ -2625,9 +2629,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 899 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 894 512 26 51 BoxColFill
 LCb setrgbcolor
-899 512 N
+894 512 N
 0 50 V
 25 0 V
 0 -50 V
@@ -2635,9 +2639,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 935 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 930 512 26 51 BoxColFill
 LCb setrgbcolor
-935 512 N
+930 512 N
 0 50 V
 25 0 V
 0 -50 V
@@ -2645,9 +2649,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 971 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 965 512 26 51 BoxColFill
 LCb setrgbcolor
-971 512 N
+965 512 N
 0 50 V
 25 0 V
 0 -50 V
@@ -2655,9 +2659,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1007 512 26 52 BoxColFill
+0.00 0.00 0.00 C 0.180 1001 512 26 52 BoxColFill
 LCb setrgbcolor
-1007 512 N
+1001 512 N
 0 51 V
 25 0 V
 0 -51 V
@@ -2665,9 +2669,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1043 512 26 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1037 512 26 128 BoxColFill
 LCb setrgbcolor
-1043 512 N
+1037 512 N
 0 127 V
 25 0 V
 0 -127 V
@@ -2675,9 +2679,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1079 512 26 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1072 512 26 128 BoxColFill
 LCb setrgbcolor
-1079 512 N
+1072 512 N
 0 127 V
 25 0 V
 0 -127 V
@@ -2685,9 +2689,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1115 512 26 161 BoxColFill
+0.00 0.00 0.00 C 0.180 1108 512 26 161 BoxColFill
 LCb setrgbcolor
-1115 512 N
+1108 512 N
 0 160 V
 25 0 V
 0 -160 V
@@ -2695,9 +2699,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1151 512 26 169 BoxColFill
+0.00 0.00 0.00 C 0.180 1143 512 26 169 BoxColFill
 LCb setrgbcolor
-1151 512 N
+1143 512 N
 0 168 V
 25 0 V
 0 -168 V
@@ -2705,9 +2709,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1187 512 26 262 BoxColFill
+0.00 0.00 0.00 C 0.180 1179 512 26 262 BoxColFill
 LCb setrgbcolor
-1187 512 N
+1179 512 N
 0 261 V
 25 0 V
 0 -261 V
@@ -2715,19 +2719,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1223 512 26 264 BoxColFill
+0.00 0.00 0.00 C 0.180 1215 512 25 264 BoxColFill
 LCb setrgbcolor
-1223 512 N
+1215 512 N
 0 263 V
-25 0 V
+24 0 V
 0 -263 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1259 512 26 268 BoxColFill
+0.00 0.00 0.00 C 0.180 1250 512 26 268 BoxColFill
 LCb setrgbcolor
-1259 512 N
+1250 512 N
 0 267 V
 25 0 V
 0 -267 V
@@ -2735,9 +2739,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1295 512 26 182 BoxColFill
+0.00 0.00 0.00 C 0.180 1286 512 26 182 BoxColFill
 LCb setrgbcolor
-1295 512 N
+1286 512 N
 0 181 V
 25 0 V
 0 -181 V
@@ -2745,9 +2749,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1331 512 26 213 BoxColFill
+0.00 0.00 0.00 C 0.180 1321 512 26 213 BoxColFill
 LCb setrgbcolor
-1331 512 N
+1321 512 N
 0 212 V
 25 0 V
 0 -212 V
@@ -2755,9 +2759,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1367 512 26 237 BoxColFill
+0.00 0.00 0.00 C 0.180 1357 512 26 237 BoxColFill
 LCb setrgbcolor
-1367 512 N
+1357 512 N
 0 236 V
 25 0 V
 0 -236 V
@@ -2765,9 +2769,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1403 512 26 246 BoxColFill
+0.00 0.00 0.00 C 0.180 1392 512 26 246 BoxColFill
 LCb setrgbcolor
-1403 512 N
+1392 512 N
 0 245 V
 25 0 V
 0 -245 V
@@ -2775,9 +2779,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1439 512 26 256 BoxColFill
+0.00 0.00 0.00 C 0.180 1428 512 26 256 BoxColFill
 LCb setrgbcolor
-1439 512 N
+1428 512 N
 0 255 V
 25 0 V
 0 -255 V
@@ -2785,19 +2789,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1475 512 26 288 BoxColFill
+0.00 0.00 0.00 C 0.180 1464 512 25 288 BoxColFill
 LCb setrgbcolor
-1475 512 N
+1464 512 N
 0 287 V
-25 0 V
+24 0 V
 0 -287 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1511 512 26 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1499 512 26 317 BoxColFill
 LCb setrgbcolor
-1511 512 N
+1499 512 N
 0 316 V
 25 0 V
 0 -316 V
@@ -2805,9 +2809,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1547 512 26 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1535 512 26 317 BoxColFill
 LCb setrgbcolor
-1547 512 N
+1535 512 N
 0 316 V
 25 0 V
 0 -316 V
@@ -2815,9 +2819,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1583 512 26 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1570 512 26 365 BoxColFill
 LCb setrgbcolor
-1583 512 N
+1570 512 N
 0 364 V
 25 0 V
 0 -364 V
@@ -2825,9 +2829,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1619 512 26 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1606 512 26 365 BoxColFill
 LCb setrgbcolor
-1619 512 N
+1606 512 N
 0 364 V
 25 0 V
 0 -364 V
@@ -2835,9 +2839,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1655 512 26 372 BoxColFill
+0.00 0.00 0.00 C 0.180 1641 512 26 372 BoxColFill
 LCb setrgbcolor
-1655 512 N
+1641 512 N
 0 371 V
 25 0 V
 0 -371 V
@@ -2845,9 +2849,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1691 512 26 393 BoxColFill
+0.00 0.00 0.00 C 0.180 1677 512 26 393 BoxColFill
 LCb setrgbcolor
-1691 512 N
+1677 512 N
 0 392 V
 25 0 V
 0 -392 V
@@ -2855,9 +2859,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1727 512 26 415 BoxColFill
+0.00 0.00 0.00 C 0.180 1713 512 26 415 BoxColFill
 LCb setrgbcolor
-1727 512 N
+1713 512 N
 0 414 V
 25 0 V
 0 -414 V
@@ -2865,9 +2869,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1763 512 26 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1748 512 26 441 BoxColFill
 LCb setrgbcolor
-1763 512 N
+1748 512 N
 0 440 V
 25 0 V
 0 -440 V
@@ -2875,9 +2879,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1799 512 26 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1784 512 26 441 BoxColFill
 LCb setrgbcolor
-1799 512 N
+1784 512 N
 0 440 V
 25 0 V
 0 -440 V
@@ -2885,9 +2889,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1835 512 26 443 BoxColFill
+0.00 0.00 0.00 C 0.180 1819 512 26 443 BoxColFill
 LCb setrgbcolor
-1835 512 N
+1819 512 N
 0 442 V
 25 0 V
 0 -442 V
@@ -2895,9 +2899,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1871 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 1855 512 26 467 BoxColFill
 LCb setrgbcolor
-1871 512 N
+1855 512 N
 0 466 V
 25 0 V
 0 -466 V
@@ -2905,19 +2909,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1907 512 26 476 BoxColFill
+0.00 0.00 0.00 C 0.180 1891 512 25 476 BoxColFill
 LCb setrgbcolor
-1907 512 N
+1891 512 N
 0 475 V
-25 0 V
+24 0 V
 0 -475 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1943 512 26 477 BoxColFill
+0.00 0.00 0.00 C 0.180 1926 512 26 477 BoxColFill
 LCb setrgbcolor
-1943 512 N
+1926 512 N
 0 476 V
 25 0 V
 0 -476 V
@@ -2925,9 +2929,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1979 512 26 433 BoxColFill
+0.00 0.00 0.00 C 0.180 1962 512 26 433 BoxColFill
 LCb setrgbcolor
-1979 512 N
+1962 512 N
 0 432 V
 25 0 V
 0 -432 V
@@ -2935,9 +2939,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2015 512 26 450 BoxColFill
+0.00 0.00 0.00 C 0.180 1997 512 26 450 BoxColFill
 LCb setrgbcolor
-2015 512 N
+1997 512 N
 0 449 V
 25 0 V
 0 -449 V
@@ -2945,9 +2949,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2051 512 26 458 BoxColFill
+0.00 0.00 0.00 C 0.180 2033 512 26 458 BoxColFill
 LCb setrgbcolor
-2051 512 N
+2033 512 N
 0 457 V
 25 0 V
 0 -457 V
@@ -2955,9 +2959,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2087 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 2068 512 26 467 BoxColFill
 LCb setrgbcolor
-2087 512 N
+2068 512 N
 0 466 V
 25 0 V
 0 -466 V
@@ -2965,9 +2969,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2123 512 26 469 BoxColFill
+0.00 0.00 0.00 C 0.180 2104 512 26 469 BoxColFill
 LCb setrgbcolor
-2123 512 N
+2104 512 N
 0 468 V
 25 0 V
 0 -468 V
@@ -2975,19 +2979,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2159 512 26 478 BoxColFill
+0.00 0.00 0.00 C 0.180 2140 512 25 478 BoxColFill
 LCb setrgbcolor
-2159 512 N
+2140 512 N
 0 477 V
-25 0 V
+24 0 V
 0 -477 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2195 512 26 488 BoxColFill
+0.00 0.00 0.00 C 0.180 2175 512 26 488 BoxColFill
 LCb setrgbcolor
-2195 512 N
+2175 512 N
 0 487 V
 25 0 V
 0 -487 V
@@ -2995,9 +2999,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2231 512 26 512 BoxColFill
+0.00 0.00 0.00 C 0.180 2211 512 26 512 BoxColFill
 LCb setrgbcolor
-2231 512 N
+2211 512 N
 0 511 V
 25 0 V
 0 -511 V
@@ -3005,9 +3009,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2267 512 26 517 BoxColFill
+0.00 0.00 0.00 C 0.180 2246 512 26 517 BoxColFill
 LCb setrgbcolor
-2267 512 N
+2246 512 N
 0 516 V
 25 0 V
 0 -516 V
@@ -3015,9 +3019,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2303 512 26 515 BoxColFill
+0.00 0.00 0.00 C 0.180 2282 512 26 515 BoxColFill
 LCb setrgbcolor
-2303 512 N
+2282 512 N
 0 514 V
 25 0 V
 0 -514 V
@@ -3025,9 +3029,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2339 512 26 525 BoxColFill
+0.00 0.00 0.00 C 0.180 2317 512 26 525 BoxColFill
 LCb setrgbcolor
-2339 512 N
+2317 512 N
 0 524 V
 25 0 V
 0 -524 V
@@ -3035,9 +3039,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2375 512 26 526 BoxColFill
+0.00 0.00 0.00 C 0.180 2353 512 26 526 BoxColFill
 LCb setrgbcolor
-2375 512 N
+2353 512 N
 0 525 V
 25 0 V
 0 -525 V
@@ -3045,9 +3049,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2411 512 26 532 BoxColFill
+0.00 0.00 0.00 C 0.180 2389 512 26 532 BoxColFill
 LCb setrgbcolor
-2411 512 N
+2389 512 N
 0 531 V
 25 0 V
 0 -531 V
@@ -3055,9 +3059,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2447 512 26 557 BoxColFill
+0.00 0.00 0.00 C 0.180 2424 512 26 557 BoxColFill
 LCb setrgbcolor
-2447 512 N
+2424 512 N
 0 556 V
 25 0 V
 0 -556 V
@@ -3065,9 +3069,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2483 512 26 564 BoxColFill
+0.00 0.00 0.00 C 0.180 2460 512 26 564 BoxColFill
 LCb setrgbcolor
-2483 512 N
+2460 512 N
 0 563 V
 25 0 V
 0 -563 V
@@ -3075,9 +3079,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2519 512 26 568 BoxColFill
+0.00 0.00 0.00 C 0.180 2495 512 26 568 BoxColFill
 LCb setrgbcolor
-2519 512 N
+2495 512 N
 0 567 V
 25 0 V
 0 -567 V
@@ -3085,9 +3089,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2555 512 26 574 BoxColFill
+0.00 0.00 0.00 C 0.180 2531 512 26 574 BoxColFill
 LCb setrgbcolor
-2555 512 N
+2531 512 N
 0 573 V
 25 0 V
 0 -573 V
@@ -3095,19 +3099,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2591 512 26 577 BoxColFill
+0.00 0.00 0.00 C 0.180 2567 512 25 577 BoxColFill
 LCb setrgbcolor
-2591 512 N
+2567 512 N
 0 576 V
-25 0 V
+24 0 V
 0 -576 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2627 512 26 580 BoxColFill
+0.00 0.00 0.00 C 0.180 2602 512 26 580 BoxColFill
 LCb setrgbcolor
-2627 512 N
+2602 512 N
 0 579 V
 25 0 V
 0 -579 V
@@ -3115,9 +3119,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2663 512 26 583 BoxColFill
+0.00 0.00 0.00 C 0.180 2638 512 26 583 BoxColFill
 LCb setrgbcolor
-2663 512 N
+2638 512 N
 0 582 V
 25 0 V
 0 -582 V
@@ -3125,9 +3129,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2699 512 26 591 BoxColFill
+0.00 0.00 0.00 C 0.180 2673 512 26 591 BoxColFill
 LCb setrgbcolor
-2699 512 N
+2673 512 N
 0 590 V
 25 0 V
 0 -590 V
@@ -3135,9 +3139,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2735 512 26 691 BoxColFill
+0.00 0.00 0.00 C 0.180 2709 512 26 691 BoxColFill
 LCb setrgbcolor
-2735 512 N
+2709 512 N
 0 690 V
 25 0 V
 0 -690 V
@@ -3145,9 +3149,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2771 512 26 625 BoxColFill
+0.00 0.00 0.00 C 0.180 2744 512 26 625 BoxColFill
 LCb setrgbcolor
-2771 512 N
+2744 512 N
 0 624 V
 25 0 V
 0 -624 V
@@ -3155,9 +3159,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2807 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2780 512 26 621 BoxColFill
 LCb setrgbcolor
-2807 512 N
+2780 512 N
 0 620 V
 25 0 V
 0 -620 V
@@ -3165,19 +3169,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2843 512 26 624 BoxColFill
+0.00 0.00 0.00 C 0.180 2816 512 25 624 BoxColFill
 LCb setrgbcolor
-2843 512 N
+2816 512 N
 0 623 V
-25 0 V
+24 0 V
 0 -623 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2879 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2851 512 26 621 BoxColFill
 LCb setrgbcolor
-2879 512 N
+2851 512 N
 0 620 V
 25 0 V
 0 -620 V
@@ -3185,9 +3189,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2915 512 26 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2887 512 26 621 BoxColFill
 LCb setrgbcolor
-2915 512 N
+2887 512 N
 0 620 V
 25 0 V
 0 -620 V
@@ -3195,9 +3199,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2951 512 26 620 BoxColFill
+0.00 0.00 0.00 C 0.180 2922 512 26 620 BoxColFill
 LCb setrgbcolor
-2951 512 N
+2922 512 N
 0 619 V
 25 0 V
 0 -619 V
@@ -3205,9 +3209,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2987 512 26 629 BoxColFill
+0.00 0.00 0.00 C 0.180 2958 512 26 629 BoxColFill
 LCb setrgbcolor
-2987 512 N
+2958 512 N
 0 628 V
 25 0 V
 0 -628 V
@@ -3215,9 +3219,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3023 512 26 611 BoxColFill
+0.00 0.00 0.00 C 0.180 2993 512 26 611 BoxColFill
 LCb setrgbcolor
-3023 512 N
+2993 512 N
 0 610 V
 25 0 V
 0 -610 V
@@ -3225,9 +3229,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3059 512 26 614 BoxColFill
+0.00 0.00 0.00 C 0.180 3029 512 26 614 BoxColFill
 LCb setrgbcolor
-3059 512 N
+3029 512 N
 0 613 V
 25 0 V
 0 -613 V
@@ -3235,9 +3239,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3095 512 26 596 BoxColFill
+0.00 0.00 0.00 C 0.180 3065 512 26 596 BoxColFill
 LCb setrgbcolor
-3095 512 N
+3065 512 N
 0 595 V
 25 0 V
 0 -595 V
@@ -3245,9 +3249,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3131 512 26 594 BoxColFill
+0.00 0.00 0.00 C 0.180 3100 512 26 594 BoxColFill
 LCb setrgbcolor
-3131 512 N
+3100 512 N
 0 593 V
 25 0 V
 0 -593 V
@@ -3255,9 +3259,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3167 512 26 599 BoxColFill
+0.00 0.00 0.00 C 0.180 3136 512 26 599 BoxColFill
 LCb setrgbcolor
-3167 512 N
+3136 512 N
 0 598 V
 25 0 V
 0 -598 V
@@ -3265,83 +3269,93 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3203 512 27 620 BoxColFill
+0.00 0.00 0.00 C 0.180 3171 512 26 620 BoxColFill
 LCb setrgbcolor
-3203 512 N
+3171 512 N
 0 619 V
-26 0 V
+25 0 V
 0 -619 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3239 512 27 623 BoxColFill
+0.00 0.00 0.00 C 0.180 3207 512 26 623 BoxColFill
 LCb setrgbcolor
-3239 512 N
+3207 512 N
 0 622 V
-26 0 V
+25 0 V
 0 -622 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3275 512 27 632 BoxColFill
+0.00 0.00 0.00 C 0.180 3242 512 26 632 BoxColFill
 LCb setrgbcolor
-3275 512 N
+3242 512 N
 0 631 V
-26 0 V
+25 0 V
 0 -631 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3311 512 27 645 BoxColFill
+0.00 0.00 0.00 C 0.180 3278 512 26 645 BoxColFill
 LCb setrgbcolor
-3311 512 N
+3278 512 N
 0 644 V
-26 0 V
+25 0 V
 0 -644 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3347 512 27 703 BoxColFill
+0.00 0.00 0.00 C 0.180 3314 512 26 703 BoxColFill
 LCb setrgbcolor
-3347 512 N
+3314 512 N
 0 702 V
-26 0 V
+25 0 V
 0 -702 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3383 512 27 713 BoxColFill
+0.00 0.00 0.00 C 0.180 3349 512 26 713 BoxColFill
 LCb setrgbcolor
-3383 512 N
+3349 512 N
 0 712 V
-26 0 V
+25 0 V
 0 -712 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3419 512 27 720 BoxColFill
+0.00 0.00 0.00 C 0.180 3385 512 26 720 BoxColFill
 LCb setrgbcolor
-3419 512 N
+3385 512 N
 0 719 V
-26 0 V
+25 0 V
 0 -719 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3455 512 27 725 BoxColFill
+0.00 0.00 0.00 C 0.180 3420 512 26 725 BoxColFill
 LCb setrgbcolor
-3455 512 N
+3420 512 N
 0 724 V
-26 0 V
+25 0 V
 0 -724 V
--26 0 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.180 3456 512 26 765 BoxColFill
+LCb setrgbcolor
+3456 512 N
+0 764 V
+25 0 V
+0 -764 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
@@ -3365,83 +3379,83 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 574 543 27 1 BoxColFill
+0.90 0.62 0.00 C 0.180 574 543 26 1 BoxColFill
 LCb setrgbcolor
 574 543 N
-26 0 V
--26 0 V
+25 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 610 543 27 1 BoxColFill
+0.90 0.62 0.00 C 0.180 610 543 26 1 BoxColFill
 LCb setrgbcolor
 610 543 N
-26 0 V
--26 0 V
+25 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 646 553 27 1 BoxColFill
+0.90 0.62 0.00 C 0.180 645 553 26 1 BoxColFill
 LCb setrgbcolor
-646 553 N
-26 0 V
--26 0 V
+645 553 N
+25 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 682 555 27 22 BoxColFill
+0.90 0.62 0.00 C 0.180 681 555 26 22 BoxColFill
 LCb setrgbcolor
-682 555 N
+681 555 N
 0 21 V
-26 0 V
+25 0 V
 0 -21 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 718 548 27 25 BoxColFill
+0.90 0.62 0.00 C 0.180 716 548 26 25 BoxColFill
 LCb setrgbcolor
-718 548 N
+716 548 N
 0 24 V
-26 0 V
+25 0 V
 0 -24 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 754 548 27 26 BoxColFill
+0.90 0.62 0.00 C 0.180 752 548 26 26 BoxColFill
 LCb setrgbcolor
-754 548 N
+752 548 N
 0 25 V
-26 0 V
+25 0 V
 0 -25 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 790 549 27 30 BoxColFill
+0.90 0.62 0.00 C 0.180 788 549 26 30 BoxColFill
 LCb setrgbcolor
-790 549 N
+788 549 N
 0 29 V
-26 0 V
+25 0 V
 0 -29 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 826 562 27 41 BoxColFill
+0.90 0.62 0.00 C 0.180 823 562 26 41 BoxColFill
 LCb setrgbcolor
-826 562 N
+823 562 N
 0 40 V
-26 0 V
+25 0 V
 0 -40 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 863 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 859 562 26 41 BoxColFill
 LCb setrgbcolor
-863 562 N
+859 562 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3449,9 +3463,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 899 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 894 562 26 41 BoxColFill
 LCb setrgbcolor
-899 562 N
+894 562 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3459,9 +3473,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 935 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 930 562 26 41 BoxColFill
 LCb setrgbcolor
-935 562 N
+930 562 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3469,9 +3483,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 971 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 965 562 26 41 BoxColFill
 LCb setrgbcolor
-971 562 N
+965 562 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3479,9 +3493,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1007 563 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1001 563 26 41 BoxColFill
 LCb setrgbcolor
-1007 563 N
+1001 563 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3489,9 +3503,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1043 639 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1037 639 26 41 BoxColFill
 LCb setrgbcolor
-1043 639 N
+1037 639 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3499,9 +3513,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1079 639 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1072 639 26 41 BoxColFill
 LCb setrgbcolor
-1079 639 N
+1072 639 N
 0 40 V
 25 0 V
 0 -40 V
@@ -3509,9 +3523,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1115 672 26 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1108 672 26 48 BoxColFill
 LCb setrgbcolor
-1115 672 N
+1108 672 N
 0 47 V
 25 0 V
 0 -47 V
@@ -3519,9 +3533,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1151 680 26 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1143 680 26 48 BoxColFill
 LCb setrgbcolor
-1151 680 N
+1143 680 N
 0 47 V
 25 0 V
 0 -47 V
@@ -3529,9 +3543,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1187 773 26 50 BoxColFill
+0.90 0.62 0.00 C 0.180 1179 773 26 50 BoxColFill
 LCb setrgbcolor
-1187 773 N
+1179 773 N
 0 49 V
 25 0 V
 0 -49 V
@@ -3539,19 +3553,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1223 775 26 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1215 775 25 51 BoxColFill
 LCb setrgbcolor
-1223 775 N
+1215 775 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1259 779 26 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1250 779 26 51 BoxColFill
 LCb setrgbcolor
-1259 779 N
+1250 779 N
 0 50 V
 25 0 V
 0 -50 V
@@ -3559,9 +3573,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1295 693 26 52 BoxColFill
+0.90 0.62 0.00 C 0.180 1286 693 26 52 BoxColFill
 LCb setrgbcolor
-1295 693 N
+1286 693 N
 0 51 V
 25 0 V
 0 -51 V
@@ -3569,9 +3583,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1331 724 26 53 BoxColFill
+0.90 0.62 0.00 C 0.180 1321 724 26 53 BoxColFill
 LCb setrgbcolor
-1331 724 N
+1321 724 N
 0 52 V
 25 0 V
 0 -52 V
@@ -3579,9 +3593,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1367 748 26 56 BoxColFill
+0.90 0.62 0.00 C 0.180 1357 748 26 56 BoxColFill
 LCb setrgbcolor
-1367 748 N
+1357 748 N
 0 55 V
 25 0 V
 0 -55 V
@@ -3589,9 +3603,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1403 757 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1392 757 26 57 BoxColFill
 LCb setrgbcolor
-1403 757 N
+1392 757 N
 0 56 V
 25 0 V
 0 -56 V
@@ -3599,9 +3613,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1439 767 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1428 767 26 57 BoxColFill
 LCb setrgbcolor
-1439 767 N
+1428 767 N
 0 56 V
 25 0 V
 0 -56 V
@@ -3609,19 +3623,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1475 799 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1464 799 25 57 BoxColFill
 LCb setrgbcolor
-1475 799 N
+1464 799 N
 0 56 V
-25 0 V
+24 0 V
 0 -56 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1511 828 26 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1499 828 26 66 BoxColFill
 LCb setrgbcolor
-1511 828 N
+1499 828 N
 0 65 V
 25 0 V
 0 -65 V
@@ -3629,9 +3643,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1547 828 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1535 828 26 67 BoxColFill
 LCb setrgbcolor
-1547 828 N
+1535 828 N
 0 66 V
 25 0 V
 0 -66 V
@@ -3639,9 +3653,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1583 876 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1570 876 26 67 BoxColFill
 LCb setrgbcolor
-1583 876 N
+1570 876 N
 0 66 V
 25 0 V
 0 -66 V
@@ -3649,9 +3663,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1619 876 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1606 876 26 67 BoxColFill
 LCb setrgbcolor
-1619 876 N
+1606 876 N
 0 66 V
 25 0 V
 0 -66 V
@@ -3659,9 +3673,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1655 883 26 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1641 883 26 66 BoxColFill
 LCb setrgbcolor
-1655 883 N
+1641 883 N
 0 65 V
 25 0 V
 0 -65 V
@@ -3669,9 +3683,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1691 904 26 75 BoxColFill
+0.90 0.62 0.00 C 0.180 1677 904 26 75 BoxColFill
 LCb setrgbcolor
-1691 904 N
+1677 904 N
 0 74 V
 25 0 V
 0 -74 V
@@ -3679,9 +3693,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1727 926 26 78 BoxColFill
+0.90 0.62 0.00 C 0.180 1713 926 26 78 BoxColFill
 LCb setrgbcolor
-1727 926 N
+1713 926 N
 0 77 V
 25 0 V
 0 -77 V
@@ -3689,9 +3703,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1763 952 26 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1748 952 26 87 BoxColFill
 LCb setrgbcolor
-1763 952 N
+1748 952 N
 0 86 V
 25 0 V
 0 -86 V
@@ -3699,9 +3713,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1799 952 26 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1784 952 26 88 BoxColFill
 LCb setrgbcolor
-1799 952 N
+1784 952 N
 0 87 V
 25 0 V
 0 -87 V
@@ -3709,9 +3723,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1835 954 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1819 954 26 89 BoxColFill
 LCb setrgbcolor
-1835 954 N
+1819 954 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3719,9 +3733,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1871 978 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1855 978 26 89 BoxColFill
 LCb setrgbcolor
-1871 978 N
+1855 978 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3729,19 +3743,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1907 987 26 90 BoxColFill
+0.90 0.62 0.00 C 0.180 1891 987 25 90 BoxColFill
 LCb setrgbcolor
-1907 987 N
+1891 987 N
 0 89 V
-25 0 V
+24 0 V
 0 -89 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1943 988 26 91 BoxColFill
+0.90 0.62 0.00 C 0.180 1926 988 26 91 BoxColFill
 LCb setrgbcolor
-1943 988 N
+1926 988 N
 0 90 V
 25 0 V
 0 -90 V
@@ -3749,9 +3763,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1979 944 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1962 944 26 89 BoxColFill
 LCb setrgbcolor
-1979 944 N
+1962 944 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3759,9 +3773,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2015 961 26 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1997 961 26 87 BoxColFill
 LCb setrgbcolor
-2015 961 N
+1997 961 N
 0 86 V
 25 0 V
 0 -86 V
@@ -3769,9 +3783,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2051 969 26 88 BoxColFill
+0.90 0.62 0.00 C 0.180 2033 969 26 88 BoxColFill
 LCb setrgbcolor
-2051 969 N
+2033 969 N
 0 87 V
 25 0 V
 0 -87 V
@@ -3779,9 +3793,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2087 978 26 139 BoxColFill
+0.90 0.62 0.00 C 0.180 2068 978 26 139 BoxColFill
 LCb setrgbcolor
-2087 978 N
+2068 978 N
 0 138 V
 25 0 V
 0 -138 V
@@ -3789,9 +3803,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2123 980 26 157 BoxColFill
+0.90 0.62 0.00 C 0.180 2104 980 26 157 BoxColFill
 LCb setrgbcolor
-2123 980 N
+2104 980 N
 0 156 V
 25 0 V
 0 -156 V
@@ -3799,19 +3813,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2159 989 26 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2140 989 25 165 BoxColFill
 LCb setrgbcolor
-2159 989 N
+2140 989 N
 0 164 V
-25 0 V
+24 0 V
 0 -164 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2195 999 26 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2175 999 26 165 BoxColFill
 LCb setrgbcolor
-2195 999 N
+2175 999 N
 0 164 V
 25 0 V
 0 -164 V
@@ -3819,9 +3833,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2231 1023 26 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2211 1023 26 171 BoxColFill
 LCb setrgbcolor
-2231 1023 N
+2211 1023 N
 0 170 V
 25 0 V
 0 -170 V
@@ -3829,9 +3843,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2267 1028 26 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2246 1028 26 171 BoxColFill
 LCb setrgbcolor
-2267 1028 N
+2246 1028 N
 0 170 V
 25 0 V
 0 -170 V
@@ -3839,9 +3853,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2303 1026 26 173 BoxColFill
+0.90 0.62 0.00 C 0.180 2282 1026 26 173 BoxColFill
 LCb setrgbcolor
-2303 1026 N
+2282 1026 N
 0 172 V
 25 0 V
 0 -172 V
@@ -3849,9 +3863,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2339 1036 26 174 BoxColFill
+0.90 0.62 0.00 C 0.180 2317 1036 26 174 BoxColFill
 LCb setrgbcolor
-2339 1036 N
+2317 1036 N
 0 173 V
 25 0 V
 0 -173 V
@@ -3859,9 +3873,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2375 1037 26 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2353 1037 26 176 BoxColFill
 LCb setrgbcolor
-2375 1037 N
+2353 1037 N
 0 175 V
 25 0 V
 0 -175 V
@@ -3869,9 +3883,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2411 1043 26 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2389 1043 26 176 BoxColFill
 LCb setrgbcolor
-2411 1043 N
+2389 1043 N
 0 175 V
 25 0 V
 0 -175 V
@@ -3879,9 +3893,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2447 1068 26 177 BoxColFill
+0.90 0.62 0.00 C 0.180 2424 1068 26 177 BoxColFill
 LCb setrgbcolor
-2447 1068 N
+2424 1068 N
 0 176 V
 25 0 V
 0 -176 V
@@ -3889,9 +3903,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2483 1075 26 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2460 1075 26 179 BoxColFill
 LCb setrgbcolor
-2483 1075 N
+2460 1075 N
 0 178 V
 25 0 V
 0 -178 V
@@ -3899,9 +3913,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2519 1079 26 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2495 1079 26 179 BoxColFill
 LCb setrgbcolor
-2519 1079 N
+2495 1079 N
 0 178 V
 25 0 V
 0 -178 V
@@ -3909,9 +3923,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2555 1085 26 222 BoxColFill
+0.90 0.62 0.00 C 0.180 2531 1085 26 222 BoxColFill
 LCb setrgbcolor
-2555 1085 N
+2531 1085 N
 0 221 V
 25 0 V
 0 -221 V
@@ -3919,19 +3933,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2591 1088 26 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2567 1088 25 225 BoxColFill
 LCb setrgbcolor
-2591 1088 N
+2567 1088 N
 0 224 V
-25 0 V
+24 0 V
 0 -224 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2627 1091 26 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2602 1091 26 224 BoxColFill
 LCb setrgbcolor
-2627 1091 N
+2602 1091 N
 0 223 V
 25 0 V
 0 -223 V
@@ -3939,9 +3953,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2663 1094 26 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2638 1094 26 224 BoxColFill
 LCb setrgbcolor
-2663 1094 N
+2638 1094 N
 0 223 V
 25 0 V
 0 -223 V
@@ -3949,9 +3963,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2699 1102 26 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2673 1102 26 225 BoxColFill
 LCb setrgbcolor
-2699 1102 N
+2673 1102 N
 0 224 V
 25 0 V
 0 -224 V
@@ -3959,9 +3973,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2735 1202 26 226 BoxColFill
+0.90 0.62 0.00 C 0.180 2709 1202 26 226 BoxColFill
 LCb setrgbcolor
-2735 1202 N
+2709 1202 N
 0 225 V
 25 0 V
 0 -225 V
@@ -3969,9 +3983,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2771 1136 26 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2744 1136 26 229 BoxColFill
 LCb setrgbcolor
-2771 1136 N
+2744 1136 N
 0 228 V
 25 0 V
 0 -228 V
@@ -3979,9 +3993,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2807 1132 26 231 BoxColFill
+0.90 0.62 0.00 C 0.180 2780 1132 26 231 BoxColFill
 LCb setrgbcolor
-2807 1132 N
+2780 1132 N
 0 230 V
 25 0 V
 0 -230 V
@@ -3989,19 +4003,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2843 1135 26 232 BoxColFill
+0.90 0.62 0.00 C 0.180 2816 1135 25 232 BoxColFill
 LCb setrgbcolor
-2843 1135 N
+2816 1135 N
 0 231 V
-25 0 V
+24 0 V
 0 -231 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2879 1132 26 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2851 1132 26 229 BoxColFill
 LCb setrgbcolor
-2879 1132 N
+2851 1132 N
 0 228 V
 25 0 V
 0 -228 V
@@ -4009,9 +4023,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2915 1132 26 230 BoxColFill
+0.90 0.62 0.00 C 0.180 2887 1132 26 230 BoxColFill
 LCb setrgbcolor
-2915 1132 N
+2887 1132 N
 0 229 V
 25 0 V
 0 -229 V
@@ -4019,9 +4033,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2951 1131 26 233 BoxColFill
+0.90 0.62 0.00 C 0.180 2922 1131 26 233 BoxColFill
 LCb setrgbcolor
-2951 1131 N
+2922 1131 N
 0 232 V
 25 0 V
 0 -232 V
@@ -4029,9 +4043,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2987 1140 26 241 BoxColFill
+0.90 0.62 0.00 C 0.180 2958 1140 26 241 BoxColFill
 LCb setrgbcolor
-2987 1140 N
+2958 1140 N
 0 240 V
 25 0 V
 0 -240 V
@@ -4039,9 +4053,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3023 1122 26 244 BoxColFill
+0.90 0.62 0.00 C 0.180 2993 1122 26 244 BoxColFill
 LCb setrgbcolor
-3023 1122 N
+2993 1122 N
 0 243 V
 25 0 V
 0 -243 V
@@ -4049,9 +4063,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3059 1125 26 345 BoxColFill
+0.90 0.62 0.00 C 0.180 3029 1125 26 345 BoxColFill
 LCb setrgbcolor
-3059 1125 N
+3029 1125 N
 0 344 V
 25 0 V
 0 -344 V
@@ -4059,9 +4073,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3095 1107 26 256 BoxColFill
+0.90 0.62 0.00 C 0.180 3065 1107 26 256 BoxColFill
 LCb setrgbcolor
-3095 1107 N
+3065 1107 N
 0 255 V
 25 0 V
 0 -255 V
@@ -4069,9 +4083,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3131 1105 26 246 BoxColFill
+0.90 0.62 0.00 C 0.180 3100 1105 26 246 BoxColFill
 LCb setrgbcolor
-3131 1105 N
+3100 1105 N
 0 245 V
 25 0 V
 0 -245 V
@@ -4079,9 +4093,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3167 1110 26 250 BoxColFill
+0.90 0.62 0.00 C 0.180 3136 1110 26 250 BoxColFill
 LCb setrgbcolor
-3167 1110 N
+3136 1110 N
 0 249 V
 25 0 V
 0 -249 V
@@ -4089,83 +4103,93 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3203 1131 27 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3171 1131 26 251 BoxColFill
 LCb setrgbcolor
-3203 1131 N
+3171 1131 N
 0 250 V
-26 0 V
+25 0 V
 0 -250 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3239 1134 27 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3207 1134 26 251 BoxColFill
 LCb setrgbcolor
-3239 1134 N
+3207 1134 N
 0 250 V
-26 0 V
+25 0 V
 0 -250 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3275 1143 27 258 BoxColFill
+0.90 0.62 0.00 C 0.180 3242 1143 26 258 BoxColFill
 LCb setrgbcolor
-3275 1143 N
+3242 1143 N
 0 257 V
-26 0 V
+25 0 V
 0 -257 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3311 1156 27 261 BoxColFill
+0.90 0.62 0.00 C 0.180 3278 1156 26 261 BoxColFill
 LCb setrgbcolor
-3311 1156 N
+3278 1156 N
 0 260 V
-26 0 V
+25 0 V
 0 -260 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3347 1214 27 267 BoxColFill
+0.90 0.62 0.00 C 0.180 3314 1214 26 267 BoxColFill
 LCb setrgbcolor
-3347 1214 N
+3314 1214 N
 0 266 V
-26 0 V
+25 0 V
 0 -266 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3383 1224 27 314 BoxColFill
+0.90 0.62 0.00 C 0.180 3349 1224 26 314 BoxColFill
 LCb setrgbcolor
-3383 1224 N
+3349 1224 N
 0 313 V
-26 0 V
+25 0 V
 0 -313 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3419 1231 27 320 BoxColFill
+0.90 0.62 0.00 C 0.180 3385 1231 26 320 BoxColFill
 LCb setrgbcolor
-3419 1231 N
+3385 1231 N
 0 319 V
-26 0 V
+25 0 V
 0 -319 V
--26 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3455 1236 27 324 BoxColFill
+0.90 0.62 0.00 C 0.180 3420 1236 26 324 BoxColFill
 LCb setrgbcolor
-3455 1236 N
+3420 1236 N
 0 323 V
-26 0 V
+25 0 V
 0 -323 V
--26 0 V
+-25 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C 0.180 3456 1276 26 364 BoxColFill
+LCb setrgbcolor
+3456 1276 N
+0 363 V
+25 0 V
+0 -363 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
@@ -4182,86 +4206,87 @@ LTb
 0.55 0.00 0.00 C 2092 1457 M
 255 0 V
 587 512 M
+35 0 V
 36 0 V
-36 0 V
-36 778 V
+35 778 V
 36 193 V
-36 -5 V
+35 -5 V
 36 87 V
 36 29 V
-36 3 V
+35 3 V
 36 0 V
-36 -5 V
+35 -5 V
 36 0 V
 36 -17 V
-36 -483 V
+35 -483 V
 36 2 V
-36 -38 V
+35 -38 V
 36 -20 V
-36 -140 V
+35 -140 V
 36 0 V
 36 -5 V
-36 150 V
+35 150 V
 36 -51 V
-36 -17 V
+35 -17 V
 36 -14 V
-36 -15 V
+35 -15 V
 36 -38 V
 36 24 V
-36 -2 V
+35 -2 V
 36 -46 V
-36 0 V
+35 0 V
 36 -8 V
 36 20 V
-36 -3 V
+35 -3 V
 36 17 V
-36 3 V
+35 3 V
 36 4 V
-36 -21 V
+35 -21 V
 36 0 V
 36 0 V
-36 26 V
-37 -19 V
-36 -5 V
+35 26 V
+36 -19 V
+35 -5 V
 36 169 V
-36 51 V
+35 51 V
 36 14 V
 36 -7 V
-36 -7 V
+35 -7 V
 36 -5 V
-36 5 V
+35 5 V
 36 -5 V
-36 5 V
+35 5 V
 36 -2 V
 36 -22 V
-36 0 V
+35 0 V
 36 -3 V
-36 95 V
+35 95 V
 36 2 V
 36 -2 V
-36 -3 V
+35 -3 V
 36 -5 V
-36 -70 V
+35 -70 V
 36 53 V
-36 8 V
+35 8 V
 36 -3 V
 36 -2 V
-36 2 V
+35 2 V
 36 5 V
-36 12 V
+35 12 V
 36 22 V
-36 176 V
+35 176 V
 36 -142 V
 36 -20 V
-36 5 V
+35 5 V
 36 -14 V
-36 -3 V
+35 -3 V
 36 5 V
 36 -2 V
-36 -29 V
+35 -29 V
 36 72 V
-36 3 V
+35 3 V
 36 5 V
+35 31 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/formal/data/rcu-test.dat b/formal/data/rcu-test.dat
index 9aea4f8e..26ccd27e 100644
--- a/formal/data/rcu-test.dat
+++ b/formal/data/rcu-test.dat
@@ -78,4 +78,5 @@ v5.4  15379 6209 21588 28.8
 v5.8  17424 6627 24051 27.6
 ""    17678 7779 25457 30.6
 ""    17863 7916 25779 30.7
-v5.11 17978 8033 26011 30.9
+""    17978 8033 26011 30.9
+v5.12 18965 9025 27990 32.2
-- 
2.17.1


