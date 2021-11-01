Return-Path: <SRS0=sfzb=PU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=41SffF2mS5W2ZmsLUZTGsgFj1trRORs8C3TO1Y5WEpw=;
        b=ONgLPQW2ozI/3ZoLiL+A9OWpVCwkmUZ4WyqaySjGg1M0h/jQ7sWODLoep/GeM45Q6q
         M2H4BNEPSYCa4sH6QSY6M6LQ5Uiblav0N416K6wrKE91dKsM2hxpEUPj+lL5bdZL6C9O
         oGKaDQtBT2UEcoQ84lCBrpBOTasbqc4xb+NcOlrOYITH1VznwnkEETOK0NYM5bFUpL5t
         QP8phN6NgSsgkkRm1lSplZZR6Rb30JpIVd9lY5qDR73bpX9gwdaZ7ot8VuCtToWy06SR
         h16LP8PQ/6Nok7tZCyiYV+Pa+hl3w3fI7ZuJwIr+NGOpqYI6UZA5EbPA5h+yAKH+P1t0
         F9Ow==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] formal: Update rcu-test data in Figure 12.4 (as of v5.15)
Message-ID: <be0d7e53-145d-ec94-ad4b-6b1519856e98@gmail.com>
Date: Mon, 1 Nov 2021 09:08:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/RCU-test-ratio.eps | 1235 ++++++++++----------
 CodeSamples/formal/data/rcu-test.dat       |    3 +-
 2 files changed, 632 insertions(+), 606 deletions(-)

diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
index 3021ada5..42c021c2 100644
--- a/CodeSamples/formal/data/RCU-test-ratio.eps
+++ b/CodeSamples/formal/data/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Tue Aug 31 08:33:44 2021
+%%CreationDate: Mon Nov  1 08:58:03 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Tue Aug 31 08:33:44 2021)
+  /CreationDate (Mon Nov  1 08:58:03 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1980,9 +1980,9 @@ stroke
 1.000 UL
 LTb
 LCb setrgbcolor
-586 512 M
+585 512 M
 stroke
-586 464 M
+585 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
 ] -26.7 MRshow
@@ -1994,17 +1994,17 @@ LCb setrgbcolor
 stroke
 LTb
 LCb setrgbcolor
-655 512 M
+654 512 M
 stroke
 LTb
 LCb setrgbcolor
-690 512 M
+688 512 M
 stroke
 LTb
 LCb setrgbcolor
-725 512 M
+723 512 M
 stroke
-725 464 M
+723 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
 ] -26.7 MRshow
@@ -2012,21 +2012,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-759 512 M
+757 512 M
 stroke
 LTb
 LCb setrgbcolor
-794 512 M
+791 512 M
 stroke
 LTb
 LCb setrgbcolor
-829 512 M
+826 512 M
 stroke
 LTb
 LCb setrgbcolor
-864 512 M
+860 512 M
 stroke
-864 464 M
+860 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
 ] -26.7 MRshow
@@ -2034,21 +2034,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-898 512 M
+894 512 M
 stroke
 LTb
 LCb setrgbcolor
-933 512 M
+929 512 M
 stroke
 LTb
 LCb setrgbcolor
-968 512 M
+963 512 M
 stroke
 LTb
 LCb setrgbcolor
-1003 512 M
+997 512 M
 stroke
-1003 464 M
+997 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
 ] -26.7 MRshow
@@ -2056,21 +2056,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1037 512 M
+1032 512 M
 stroke
 LTb
 LCb setrgbcolor
-1072 512 M
+1066 512 M
 stroke
 LTb
 LCb setrgbcolor
-1107 512 M
+1100 512 M
 stroke
 LTb
 LCb setrgbcolor
-1142 512 M
+1135 512 M
 stroke
-1142 464 M
+1135 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
 ] -26.7 MRshow
@@ -2078,21 +2078,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1176 512 M
+1169 512 M
 stroke
 LTb
 LCb setrgbcolor
-1211 512 M
+1203 512 M
 stroke
 LTb
 LCb setrgbcolor
-1246 512 M
+1238 512 M
 stroke
 LTb
 LCb setrgbcolor
-1281 512 M
+1272 512 M
 stroke
-1281 464 M
+1272 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
 ] -26.7 MRshow
@@ -2100,21 +2100,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1315 512 M
+1306 512 M
 stroke
 LTb
 LCb setrgbcolor
-1350 512 M
+1341 512 M
 stroke
 LTb
 LCb setrgbcolor
-1385 512 M
+1375 512 M
 stroke
 LTb
 LCb setrgbcolor
-1420 512 M
+1409 512 M
 stroke
-1420 464 M
+1409 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
 ] -26.7 MRshow
@@ -2122,21 +2122,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1454 512 M
+1444 512 M
 stroke
 LTb
 LCb setrgbcolor
-1489 512 M
+1478 512 M
 stroke
 LTb
 LCb setrgbcolor
-1524 512 M
+1512 512 M
 stroke
 LTb
 LCb setrgbcolor
-1558 512 M
+1547 512 M
 stroke
-1558 464 M
+1547 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
 ] -26.7 MRshow
@@ -2144,21 +2144,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1593 512 M
+1581 512 M
 stroke
 LTb
 LCb setrgbcolor
-1628 512 M
+1615 512 M
 stroke
 LTb
 LCb setrgbcolor
-1663 512 M
+1650 512 M
 stroke
 LTb
 LCb setrgbcolor
-1697 512 M
+1684 512 M
 stroke
-1697 464 M
+1684 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
 ] -26.7 MRshow
@@ -2166,21 +2166,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1732 512 M
+1718 512 M
 stroke
 LTb
 LCb setrgbcolor
-1767 512 M
+1753 512 M
 stroke
 LTb
 LCb setrgbcolor
-1802 512 M
+1787 512 M
 stroke
 LTb
 LCb setrgbcolor
-1836 512 M
+1821 512 M
 stroke
-1836 464 M
+1821 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
 ] -26.7 MRshow
@@ -2188,21 +2188,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1871 512 M
+1856 512 M
 stroke
 LTb
 LCb setrgbcolor
-1906 512 M
+1890 512 M
 stroke
 LTb
 LCb setrgbcolor
-1941 512 M
+1924 512 M
 stroke
 LTb
 LCb setrgbcolor
-1975 512 M
+1959 512 M
 stroke
-1975 464 M
+1959 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
 ] -26.7 MRshow
@@ -2210,21 +2210,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2010 512 M
+1993 512 M
 stroke
 LTb
 LCb setrgbcolor
-2045 512 M
+2028 512 M
 stroke
 LTb
 LCb setrgbcolor
-2080 512 M
+2062 512 M
 stroke
 LTb
 LCb setrgbcolor
-2114 512 M
+2096 512 M
 stroke
-2114 464 M
+2096 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
 ] -26.7 MRshow
@@ -2232,21 +2232,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2149 512 M
+2131 512 M
 stroke
 LTb
 LCb setrgbcolor
-2184 512 M
+2165 512 M
 stroke
 LTb
 LCb setrgbcolor
-2219 512 M
+2199 512 M
 stroke
 LTb
 LCb setrgbcolor
-2253 512 M
+2234 512 M
 stroke
-2253 464 M
+2234 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
 ] -26.7 MRshow
@@ -2254,21 +2254,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2288 512 M
+2268 512 M
 stroke
 LTb
 LCb setrgbcolor
-2323 512 M
+2302 512 M
 stroke
 LTb
 LCb setrgbcolor
-2358 512 M
+2337 512 M
 stroke
 LTb
 LCb setrgbcolor
-2392 512 M
+2371 512 M
 stroke
-2392 464 M
+2371 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
 ] -26.7 MRshow
@@ -2276,21 +2276,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2427 512 M
+2405 512 M
 stroke
 LTb
 LCb setrgbcolor
-2462 512 M
+2440 512 M
 stroke
 LTb
 LCb setrgbcolor
-2497 512 M
+2474 512 M
 stroke
 LTb
 LCb setrgbcolor
-2531 512 M
+2508 512 M
 stroke
-2531 464 M
+2508 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
 ] -26.7 MRshow
@@ -2298,21 +2298,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2566 512 M
+2543 512 M
 stroke
 LTb
 LCb setrgbcolor
-2601 512 M
+2577 512 M
 stroke
 LTb
 LCb setrgbcolor
-2635 512 M
+2611 512 M
 stroke
 LTb
 LCb setrgbcolor
-2670 512 M
+2646 512 M
 stroke
-2670 464 M
+2646 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
 ] -26.7 MRshow
@@ -2320,21 +2320,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2705 512 M
+2680 512 M
 stroke
 LTb
 LCb setrgbcolor
-2740 512 M
+2714 512 M
 stroke
 LTb
 LCb setrgbcolor
-2774 512 M
+2749 512 M
 stroke
 LTb
 LCb setrgbcolor
-2809 512 M
+2783 512 M
 stroke
-2809 464 M
+2783 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
 ] -26.7 MRshow
@@ -2342,25 +2342,25 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2844 512 M
+2817 512 M
 stroke
 LTb
 LCb setrgbcolor
-2879 512 M
+2852 512 M
 stroke
 LTb
 LCb setrgbcolor
-2913 512 M
+2886 512 M
 stroke
 LTb
 LCb setrgbcolor
-2948 512 M
+2920 512 M
 stroke
 LTb
 LCb setrgbcolor
-2983 512 M
+2955 512 M
 stroke
-2983 464 M
+2955 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
 ] -26.7 MRshow
@@ -2368,21 +2368,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3018 512 M
+2989 512 M
 stroke
 LTb
 LCb setrgbcolor
-3052 512 M
+3023 512 M
 stroke
 LTb
 LCb setrgbcolor
-3087 512 M
+3058 512 M
 stroke
 LTb
 LCb setrgbcolor
-3122 512 M
+3092 512 M
 stroke
-3122 464 M
+3092 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
 ] -26.7 MRshow
@@ -2390,21 +2390,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3157 512 M
+3126 512 M
 stroke
 LTb
 LCb setrgbcolor
-3191 512 M
+3161 512 M
 stroke
 LTb
 LCb setrgbcolor
-3226 512 M
+3195 512 M
 stroke
 LTb
 LCb setrgbcolor
-3261 512 M
+3229 512 M
 stroke
-3261 464 M
+3229 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
 ] -26.7 MRshow
@@ -2412,21 +2412,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3296 512 M
+3264 512 M
 stroke
 LTb
 LCb setrgbcolor
-3330 512 M
+3298 512 M
 stroke
 LTb
 LCb setrgbcolor
-3365 512 M
+3332 512 M
 stroke
 LTb
 LCb setrgbcolor
-3400 512 M
+3367 512 M
 stroke
-3400 464 M
+3367 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
 ] -26.7 MRshow
@@ -2434,15 +2434,19 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
+3401 512 M
+stroke
+LTb
+LCb setrgbcolor
 3435 512 M
 stroke
 LTb
 LCb setrgbcolor
-3469 512 M
+3470 512 M
 stroke
-3469 464 M
+3470 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.14)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.15)]
 ] -26.7 MRshow
 grestore
 1.000 UL
@@ -2553,9 +2557,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 574 512 25 32 BoxColFill
+0.00 0.00 0.00 C 0.180 573 512 25 32 BoxColFill
 LCb setrgbcolor
-574 512 N
+573 512 N
 0 31 V
 24 0 V
 0 -31 V
@@ -2563,19 +2567,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 608 512 26 32 BoxColFill
+0.00 0.00 0.00 C 0.180 608 512 25 32 BoxColFill
 LCb setrgbcolor
 608 512 N
 0 31 V
-25 0 V
+24 0 V
 0 -31 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 643 512 25 42 BoxColFill
+0.00 0.00 0.00 C 0.180 642 512 25 42 BoxColFill
 LCb setrgbcolor
-643 512 N
+642 512 N
 0 41 V
 24 0 V
 0 -41 V
@@ -2583,9 +2587,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 678 512 25 44 BoxColFill
+0.00 0.00 0.00 C 0.180 676 512 25 44 BoxColFill
 LCb setrgbcolor
-678 512 N
+676 512 N
 0 43 V
 24 0 V
 0 -43 V
@@ -2593,9 +2597,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 713 512 25 37 BoxColFill
+0.00 0.00 0.00 C 0.180 711 512 25 37 BoxColFill
 LCb setrgbcolor
-713 512 N
+711 512 N
 0 36 V
 24 0 V
 0 -36 V
@@ -2603,19 +2607,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 747 512 26 37 BoxColFill
+0.00 0.00 0.00 C 0.180 745 512 25 37 BoxColFill
 LCb setrgbcolor
-747 512 N
+745 512 N
 0 36 V
-25 0 V
+24 0 V
 0 -36 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 782 512 25 38 BoxColFill
+0.00 0.00 0.00 C 0.180 779 512 25 38 BoxColFill
 LCb setrgbcolor
-782 512 N
+779 512 N
 0 37 V
 24 0 V
 0 -37 V
@@ -2623,9 +2627,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 817 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 814 512 25 51 BoxColFill
 LCb setrgbcolor
-817 512 N
+814 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2633,9 +2637,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 852 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 848 512 25 51 BoxColFill
 LCb setrgbcolor
-852 512 N
+848 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2643,19 +2647,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 886 512 26 51 BoxColFill
+0.00 0.00 0.00 C 0.180 882 512 25 51 BoxColFill
 LCb setrgbcolor
-886 512 N
+882 512 N
 0 50 V
-25 0 V
+24 0 V
 0 -50 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 921 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 917 512 25 51 BoxColFill
 LCb setrgbcolor
-921 512 N
+917 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2663,9 +2667,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 956 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 951 512 25 51 BoxColFill
 LCb setrgbcolor
-956 512 N
+951 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2673,29 +2677,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 990 512 26 52 BoxColFill
+0.00 0.00 0.00 C 0.180 985 512 25 52 BoxColFill
 LCb setrgbcolor
-990 512 N
+985 512 N
 0 51 V
-25 0 V
+24 0 V
 0 -51 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1025 512 26 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1020 512 25 128 BoxColFill
 LCb setrgbcolor
-1025 512 N
+1020 512 N
 0 127 V
-25 0 V
+24 0 V
 0 -127 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1060 512 25 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1054 512 25 128 BoxColFill
 LCb setrgbcolor
-1060 512 N
+1054 512 N
 0 127 V
 24 0 V
 0 -127 V
@@ -2703,9 +2707,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1095 512 25 161 BoxColFill
+0.00 0.00 0.00 C 0.180 1088 512 25 161 BoxColFill
 LCb setrgbcolor
-1095 512 N
+1088 512 N
 0 160 V
 24 0 V
 0 -160 V
@@ -2713,29 +2717,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1129 512 26 169 BoxColFill
+0.00 0.00 0.00 C 0.180 1123 512 25 169 BoxColFill
 LCb setrgbcolor
-1129 512 N
+1123 512 N
 0 168 V
-25 0 V
+24 0 V
 0 -168 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1164 512 26 262 BoxColFill
+0.00 0.00 0.00 C 0.180 1157 512 25 262 BoxColFill
 LCb setrgbcolor
-1164 512 N
+1157 512 N
 0 261 V
-25 0 V
+24 0 V
 0 -261 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1199 512 25 264 BoxColFill
+0.00 0.00 0.00 C 0.180 1191 512 25 264 BoxColFill
 LCb setrgbcolor
-1199 512 N
+1191 512 N
 0 263 V
 24 0 V
 0 -263 V
@@ -2743,9 +2747,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1234 512 25 268 BoxColFill
+0.00 0.00 0.00 C 0.180 1226 512 25 268 BoxColFill
 LCb setrgbcolor
-1234 512 N
+1226 512 N
 0 267 V
 24 0 V
 0 -267 V
@@ -2753,19 +2757,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1268 512 26 182 BoxColFill
+0.00 0.00 0.00 C 0.180 1260 512 25 182 BoxColFill
 LCb setrgbcolor
-1268 512 N
+1260 512 N
 0 181 V
-25 0 V
+24 0 V
 0 -181 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1303 512 25 213 BoxColFill
+0.00 0.00 0.00 C 0.180 1294 512 25 213 BoxColFill
 LCb setrgbcolor
-1303 512 N
+1294 512 N
 0 212 V
 24 0 V
 0 -212 V
@@ -2773,9 +2777,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1338 512 25 237 BoxColFill
+0.00 0.00 0.00 C 0.180 1329 512 25 237 BoxColFill
 LCb setrgbcolor
-1338 512 N
+1329 512 N
 0 236 V
 24 0 V
 0 -236 V
@@ -2783,9 +2787,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1373 512 25 246 BoxColFill
+0.00 0.00 0.00 C 0.180 1363 512 25 246 BoxColFill
 LCb setrgbcolor
-1373 512 N
+1363 512 N
 0 245 V
 24 0 V
 0 -245 V
@@ -2793,19 +2797,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1407 512 26 256 BoxColFill
+0.00 0.00 0.00 C 0.180 1397 512 25 256 BoxColFill
 LCb setrgbcolor
-1407 512 N
+1397 512 N
 0 255 V
-25 0 V
+24 0 V
 0 -255 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1442 512 25 288 BoxColFill
+0.00 0.00 0.00 C 0.180 1432 512 25 288 BoxColFill
 LCb setrgbcolor
-1442 512 N
+1432 512 N
 0 287 V
 24 0 V
 0 -287 V
@@ -2813,9 +2817,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1477 512 25 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1466 512 25 317 BoxColFill
 LCb setrgbcolor
-1477 512 N
+1466 512 N
 0 316 V
 24 0 V
 0 -316 V
@@ -2823,9 +2827,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1512 512 25 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1500 512 25 317 BoxColFill
 LCb setrgbcolor
-1512 512 N
+1500 512 N
 0 316 V
 24 0 V
 0 -316 V
@@ -2833,19 +2837,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1546 512 26 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1535 512 25 365 BoxColFill
 LCb setrgbcolor
-1546 512 N
+1535 512 N
 0 364 V
-25 0 V
+24 0 V
 0 -364 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1581 512 25 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1569 512 25 365 BoxColFill
 LCb setrgbcolor
-1581 512 N
+1569 512 N
 0 364 V
 24 0 V
 0 -364 V
@@ -2853,9 +2857,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1616 512 25 372 BoxColFill
+0.00 0.00 0.00 C 0.180 1603 512 25 372 BoxColFill
 LCb setrgbcolor
-1616 512 N
+1603 512 N
 0 371 V
 24 0 V
 0 -371 V
@@ -2863,9 +2867,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1651 512 25 393 BoxColFill
+0.00 0.00 0.00 C 0.180 1638 512 25 393 BoxColFill
 LCb setrgbcolor
-1651 512 N
+1638 512 N
 0 392 V
 24 0 V
 0 -392 V
@@ -2873,19 +2877,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1685 512 26 415 BoxColFill
+0.00 0.00 0.00 C 0.180 1672 512 25 415 BoxColFill
 LCb setrgbcolor
-1685 512 N
+1672 512 N
 0 414 V
-25 0 V
+24 0 V
 0 -414 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1720 512 25 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1706 512 25 441 BoxColFill
 LCb setrgbcolor
-1720 512 N
+1706 512 N
 0 440 V
 24 0 V
 0 -440 V
@@ -2893,9 +2897,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1755 512 25 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1741 512 25 441 BoxColFill
 LCb setrgbcolor
-1755 512 N
+1741 512 N
 0 440 V
 24 0 V
 0 -440 V
@@ -2903,9 +2907,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1790 512 25 443 BoxColFill
+0.00 0.00 0.00 C 0.180 1775 512 25 443 BoxColFill
 LCb setrgbcolor
-1790 512 N
+1775 512 N
 0 442 V
 24 0 V
 0 -442 V
@@ -2913,19 +2917,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1824 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 1809 512 25 467 BoxColFill
 LCb setrgbcolor
-1824 512 N
+1809 512 N
 0 466 V
-25 0 V
+24 0 V
 0 -466 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1859 512 25 476 BoxColFill
+0.00 0.00 0.00 C 0.180 1844 512 25 476 BoxColFill
 LCb setrgbcolor
-1859 512 N
+1844 512 N
 0 475 V
 24 0 V
 0 -475 V
@@ -2933,9 +2937,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1894 512 25 477 BoxColFill
+0.00 0.00 0.00 C 0.180 1878 512 25 477 BoxColFill
 LCb setrgbcolor
-1894 512 N
+1878 512 N
 0 476 V
 24 0 V
 0 -476 V
@@ -2943,9 +2947,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1928 512 26 433 BoxColFill
+0.00 0.00 0.00 C 0.180 1912 512 26 433 BoxColFill
 LCb setrgbcolor
-1928 512 N
+1912 512 N
 0 432 V
 25 0 V
 0 -432 V
@@ -2953,19 +2957,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1963 512 26 450 BoxColFill
+0.00 0.00 0.00 C 0.180 1947 512 25 450 BoxColFill
 LCb setrgbcolor
-1963 512 N
+1947 512 N
 0 449 V
-25 0 V
+24 0 V
 0 -449 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1998 512 25 458 BoxColFill
+0.00 0.00 0.00 C 0.180 1981 512 25 458 BoxColFill
 LCb setrgbcolor
-1998 512 N
+1981 512 N
 0 457 V
 24 0 V
 0 -457 V
@@ -2973,49 +2977,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2033 512 25 467 BoxColFill
+0.00 0.00 0.00 C 0.180 2015 512 26 467 BoxColFill
 LCb setrgbcolor
-2033 512 N
+2015 512 N
 0 466 V
-24 0 V
+25 0 V
 0 -466 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2067 512 26 469 BoxColFill
+0.00 0.00 0.00 C 0.180 2050 512 25 469 BoxColFill
 LCb setrgbcolor
-2067 512 N
+2050 512 N
 0 468 V
-25 0 V
+24 0 V
 0 -468 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2102 512 26 478 BoxColFill
+0.00 0.00 0.00 C 0.180 2084 512 25 478 BoxColFill
 LCb setrgbcolor
-2102 512 N
+2084 512 N
 0 477 V
-25 0 V
+24 0 V
 0 -477 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2137 512 25 488 BoxColFill
+0.00 0.00 0.00 C 0.180 2118 512 26 488 BoxColFill
 LCb setrgbcolor
-2137 512 N
+2118 512 N
 0 487 V
-24 0 V
+25 0 V
 0 -487 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2172 512 25 512 BoxColFill
+0.00 0.00 0.00 C 0.180 2153 512 25 512 BoxColFill
 LCb setrgbcolor
-2172 512 N
+2153 512 N
 0 511 V
 24 0 V
 0 -511 V
@@ -3023,19 +3027,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2206 512 26 517 BoxColFill
+0.00 0.00 0.00 C 0.180 2187 512 25 517 BoxColFill
 LCb setrgbcolor
-2206 512 N
+2187 512 N
 0 516 V
-25 0 V
+24 0 V
 0 -516 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2241 512 25 515 BoxColFill
+0.00 0.00 0.00 C 0.180 2222 512 25 515 BoxColFill
 LCb setrgbcolor
-2241 512 N
+2222 512 N
 0 514 V
 24 0 V
 0 -514 V
@@ -3043,9 +3047,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2276 512 25 525 BoxColFill
+0.00 0.00 0.00 C 0.180 2256 512 25 525 BoxColFill
 LCb setrgbcolor
-2276 512 N
+2256 512 N
 0 524 V
 24 0 V
 0 -524 V
@@ -3053,9 +3057,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2311 512 25 526 BoxColFill
+0.00 0.00 0.00 C 0.180 2290 512 25 526 BoxColFill
 LCb setrgbcolor
-2311 512 N
+2290 512 N
 0 525 V
 24 0 V
 0 -525 V
@@ -3063,19 +3067,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2345 512 26 532 BoxColFill
+0.00 0.00 0.00 C 0.180 2325 512 25 532 BoxColFill
 LCb setrgbcolor
-2345 512 N
+2325 512 N
 0 531 V
-25 0 V
+24 0 V
 0 -531 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2380 512 25 557 BoxColFill
+0.00 0.00 0.00 C 0.180 2359 512 25 557 BoxColFill
 LCb setrgbcolor
-2380 512 N
+2359 512 N
 0 556 V
 24 0 V
 0 -556 V
@@ -3083,9 +3087,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2415 512 25 564 BoxColFill
+0.00 0.00 0.00 C 0.180 2393 512 25 564 BoxColFill
 LCb setrgbcolor
-2415 512 N
+2393 512 N
 0 563 V
 24 0 V
 0 -563 V
@@ -3093,9 +3097,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2450 512 25 568 BoxColFill
+0.00 0.00 0.00 C 0.180 2428 512 25 568 BoxColFill
 LCb setrgbcolor
-2450 512 N
+2428 512 N
 0 567 V
 24 0 V
 0 -567 V
@@ -3103,19 +3107,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2484 512 26 574 BoxColFill
+0.00 0.00 0.00 C 0.180 2462 512 25 574 BoxColFill
 LCb setrgbcolor
-2484 512 N
+2462 512 N
 0 573 V
-25 0 V
+24 0 V
 0 -573 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2519 512 25 577 BoxColFill
+0.00 0.00 0.00 C 0.180 2496 512 25 577 BoxColFill
 LCb setrgbcolor
-2519 512 N
+2496 512 N
 0 576 V
 24 0 V
 0 -576 V
@@ -3123,9 +3127,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2554 512 25 580 BoxColFill
+0.00 0.00 0.00 C 0.180 2531 512 25 580 BoxColFill
 LCb setrgbcolor
-2554 512 N
+2531 512 N
 0 579 V
 24 0 V
 0 -579 V
@@ -3133,9 +3137,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2589 512 25 583 BoxColFill
+0.00 0.00 0.00 C 0.180 2565 512 25 583 BoxColFill
 LCb setrgbcolor
-2589 512 N
+2565 512 N
 0 582 V
 24 0 V
 0 -582 V
@@ -3143,19 +3147,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2623 512 26 591 BoxColFill
+0.00 0.00 0.00 C 0.180 2599 512 25 591 BoxColFill
 LCb setrgbcolor
-2623 512 N
+2599 512 N
 0 590 V
-25 0 V
+24 0 V
 0 -590 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2658 512 25 691 BoxColFill
+0.00 0.00 0.00 C 0.180 2634 512 25 691 BoxColFill
 LCb setrgbcolor
-2658 512 N
+2634 512 N
 0 690 V
 24 0 V
 0 -690 V
@@ -3163,9 +3167,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2693 512 25 625 BoxColFill
+0.00 0.00 0.00 C 0.180 2668 512 25 625 BoxColFill
 LCb setrgbcolor
-2693 512 N
+2668 512 N
 0 624 V
 24 0 V
 0 -624 V
@@ -3173,9 +3177,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2728 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2702 512 25 621 BoxColFill
 LCb setrgbcolor
-2728 512 N
+2702 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3183,19 +3187,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2762 512 26 624 BoxColFill
+0.00 0.00 0.00 C 0.180 2737 512 25 624 BoxColFill
 LCb setrgbcolor
-2762 512 N
+2737 512 N
 0 623 V
-25 0 V
+24 0 V
 0 -623 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2797 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2771 512 25 621 BoxColFill
 LCb setrgbcolor
-2797 512 N
+2771 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3203,9 +3207,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2832 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2805 512 25 621 BoxColFill
 LCb setrgbcolor
-2832 512 N
+2805 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3213,29 +3217,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2866 512 26 620 BoxColFill
+0.00 0.00 0.00 C 0.180 2840 512 25 620 BoxColFill
 LCb setrgbcolor
-2866 512 N
+2840 512 N
 0 619 V
-25 0 V
+24 0 V
 0 -619 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2901 512 26 629 BoxColFill
+0.00 0.00 0.00 C 0.180 2874 512 25 629 BoxColFill
 LCb setrgbcolor
-2901 512 N
+2874 512 N
 0 628 V
-25 0 V
+24 0 V
 0 -628 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2936 512 25 611 BoxColFill
+0.00 0.00 0.00 C 0.180 2908 512 25 611 BoxColFill
 LCb setrgbcolor
-2936 512 N
+2908 512 N
 0 610 V
 24 0 V
 0 -610 V
@@ -3243,9 +3247,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2971 512 25 614 BoxColFill
+0.00 0.00 0.00 C 0.180 2943 512 25 614 BoxColFill
 LCb setrgbcolor
-2971 512 N
+2943 512 N
 0 613 V
 24 0 V
 0 -613 V
@@ -3253,29 +3257,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3005 512 26 596 BoxColFill
+0.00 0.00 0.00 C 0.180 2977 512 25 596 BoxColFill
 LCb setrgbcolor
-3005 512 N
+2977 512 N
 0 595 V
-25 0 V
+24 0 V
 0 -595 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3040 512 26 594 BoxColFill
+0.00 0.00 0.00 C 0.180 3011 512 25 594 BoxColFill
 LCb setrgbcolor
-3040 512 N
+3011 512 N
 0 593 V
-25 0 V
+24 0 V
 0 -593 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3075 512 25 599 BoxColFill
+0.00 0.00 0.00 C 0.180 3046 512 25 599 BoxColFill
 LCb setrgbcolor
-3075 512 N
+3046 512 N
 0 598 V
 24 0 V
 0 -598 V
@@ -3283,9 +3287,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3110 512 25 620 BoxColFill
+0.00 0.00 0.00 C 0.180 3080 512 25 620 BoxColFill
 LCb setrgbcolor
-3110 512 N
+3080 512 N
 0 619 V
 24 0 V
 0 -619 V
@@ -3293,19 +3297,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3144 512 26 623 BoxColFill
+0.00 0.00 0.00 C 0.180 3114 512 25 623 BoxColFill
 LCb setrgbcolor
-3144 512 N
+3114 512 N
 0 622 V
-25 0 V
+24 0 V
 0 -622 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3179 512 25 632 BoxColFill
+0.00 0.00 0.00 C 0.180 3149 512 25 632 BoxColFill
 LCb setrgbcolor
-3179 512 N
+3149 512 N
 0 631 V
 24 0 V
 0 -631 V
@@ -3313,9 +3317,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3214 512 25 645 BoxColFill
+0.00 0.00 0.00 C 0.180 3183 512 25 645 BoxColFill
 LCb setrgbcolor
-3214 512 N
+3183 512 N
 0 644 V
 24 0 V
 0 -644 V
@@ -3323,9 +3327,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3249 512 25 703 BoxColFill
+0.00 0.00 0.00 C 0.180 3217 512 25 703 BoxColFill
 LCb setrgbcolor
-3249 512 N
+3217 512 N
 0 702 V
 24 0 V
 0 -702 V
@@ -3333,19 +3337,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3283 512 26 713 BoxColFill
+0.00 0.00 0.00 C 0.180 3252 512 25 713 BoxColFill
 LCb setrgbcolor
-3283 512 N
+3252 512 N
 0 712 V
-25 0 V
+24 0 V
 0 -712 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3318 512 25 720 BoxColFill
+0.00 0.00 0.00 C 0.180 3286 512 25 720 BoxColFill
 LCb setrgbcolor
-3318 512 N
+3286 512 N
 0 719 V
 24 0 V
 0 -719 V
@@ -3353,9 +3357,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3353 512 25 725 BoxColFill
+0.00 0.00 0.00 C 0.180 3320 512 25 725 BoxColFill
 LCb setrgbcolor
-3353 512 N
+3320 512 N
 0 724 V
 24 0 V
 0 -724 V
@@ -3363,9 +3367,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3388 512 25 765 BoxColFill
+0.00 0.00 0.00 C 0.180 3355 512 25 765 BoxColFill
 LCb setrgbcolor
-3388 512 N
+3355 512 N
 0 764 V
 24 0 V
 0 -764 V
@@ -3373,19 +3377,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3422 512 26 774 BoxColFill
+0.00 0.00 0.00 C 0.180 3389 512 25 774 BoxColFill
 LCb setrgbcolor
-3422 512 N
+3389 512 N
 0 773 V
-25 0 V
+24 0 V
 0 -773 V
--25 0 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.180 3423 512 25 781 BoxColFill
+LCb setrgbcolor
+3423 512 N
+0 780 V
+24 0 V
+0 -780 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3457 512 25 781 BoxColFill
+0.00 0.00 0.00 C 0.180 3458 512 25 781 BoxColFill
 LCb setrgbcolor
-3457 512 N
+3458 512 N
 0 780 V
 24 0 V
 0 -780 V
@@ -3413,33 +3427,33 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 574 543 25 1 BoxColFill
+0.90 0.62 0.00 C 0.180 573 543 25 1 BoxColFill
 LCb setrgbcolor
-574 543 N
+573 543 N
 24 0 V
 -24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 608 543 26 1 BoxColFill
+0.90 0.62 0.00 C 0.180 608 543 25 1 BoxColFill
 LCb setrgbcolor
 608 543 N
-25 0 V
--25 0 V
+24 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 643 553 25 1 BoxColFill
+0.90 0.62 0.00 C 0.180 642 553 25 1 BoxColFill
 LCb setrgbcolor
-643 553 N
+642 553 N
 24 0 V
 -24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 678 555 25 22 BoxColFill
+0.90 0.62 0.00 C 0.180 676 555 25 22 BoxColFill
 LCb setrgbcolor
-678 555 N
+676 555 N
 0 21 V
 24 0 V
 0 -21 V
@@ -3447,9 +3461,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 713 548 25 25 BoxColFill
+0.90 0.62 0.00 C 0.180 711 548 25 25 BoxColFill
 LCb setrgbcolor
-713 548 N
+711 548 N
 0 24 V
 24 0 V
 0 -24 V
@@ -3457,19 +3471,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 747 548 26 26 BoxColFill
+0.90 0.62 0.00 C 0.180 745 548 25 26 BoxColFill
 LCb setrgbcolor
-747 548 N
+745 548 N
 0 25 V
-25 0 V
+24 0 V
 0 -25 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 782 549 25 30 BoxColFill
+0.90 0.62 0.00 C 0.180 779 549 25 30 BoxColFill
 LCb setrgbcolor
-782 549 N
+779 549 N
 0 29 V
 24 0 V
 0 -29 V
@@ -3477,9 +3491,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 817 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 814 562 25 41 BoxColFill
 LCb setrgbcolor
-817 562 N
+814 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3487,9 +3501,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 852 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 848 562 25 41 BoxColFill
 LCb setrgbcolor
-852 562 N
+848 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3497,19 +3511,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 886 562 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 882 562 25 41 BoxColFill
 LCb setrgbcolor
-886 562 N
+882 562 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 921 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 917 562 25 41 BoxColFill
 LCb setrgbcolor
-921 562 N
+917 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3517,9 +3531,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 956 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 951 562 25 41 BoxColFill
 LCb setrgbcolor
-956 562 N
+951 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3527,29 +3541,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 990 563 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 985 563 25 41 BoxColFill
 LCb setrgbcolor
-990 563 N
+985 563 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1025 639 26 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1020 639 25 41 BoxColFill
 LCb setrgbcolor
-1025 639 N
+1020 639 N
 0 40 V
-25 0 V
+24 0 V
 0 -40 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1060 639 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1054 639 25 41 BoxColFill
 LCb setrgbcolor
-1060 639 N
+1054 639 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3557,9 +3571,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1095 672 25 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1088 672 25 48 BoxColFill
 LCb setrgbcolor
-1095 672 N
+1088 672 N
 0 47 V
 24 0 V
 0 -47 V
@@ -3567,29 +3581,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1129 680 26 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1123 680 25 48 BoxColFill
 LCb setrgbcolor
-1129 680 N
+1123 680 N
 0 47 V
-25 0 V
+24 0 V
 0 -47 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1164 773 26 50 BoxColFill
+0.90 0.62 0.00 C 0.180 1157 773 25 50 BoxColFill
 LCb setrgbcolor
-1164 773 N
+1157 773 N
 0 49 V
-25 0 V
+24 0 V
 0 -49 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1199 775 25 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1191 775 25 51 BoxColFill
 LCb setrgbcolor
-1199 775 N
+1191 775 N
 0 50 V
 24 0 V
 0 -50 V
@@ -3597,9 +3611,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1234 779 25 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1226 779 25 51 BoxColFill
 LCb setrgbcolor
-1234 779 N
+1226 779 N
 0 50 V
 24 0 V
 0 -50 V
@@ -3607,19 +3621,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1268 693 26 52 BoxColFill
+0.90 0.62 0.00 C 0.180 1260 693 25 52 BoxColFill
 LCb setrgbcolor
-1268 693 N
+1260 693 N
 0 51 V
-25 0 V
+24 0 V
 0 -51 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1303 724 25 53 BoxColFill
+0.90 0.62 0.00 C 0.180 1294 724 25 53 BoxColFill
 LCb setrgbcolor
-1303 724 N
+1294 724 N
 0 52 V
 24 0 V
 0 -52 V
@@ -3627,9 +3641,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1338 748 25 56 BoxColFill
+0.90 0.62 0.00 C 0.180 1329 748 25 56 BoxColFill
 LCb setrgbcolor
-1338 748 N
+1329 748 N
 0 55 V
 24 0 V
 0 -55 V
@@ -3637,9 +3651,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1373 757 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1363 757 25 57 BoxColFill
 LCb setrgbcolor
-1373 757 N
+1363 757 N
 0 56 V
 24 0 V
 0 -56 V
@@ -3647,19 +3661,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1407 767 26 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1397 767 25 57 BoxColFill
 LCb setrgbcolor
-1407 767 N
+1397 767 N
 0 56 V
-25 0 V
+24 0 V
 0 -56 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1442 799 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1432 799 25 57 BoxColFill
 LCb setrgbcolor
-1442 799 N
+1432 799 N
 0 56 V
 24 0 V
 0 -56 V
@@ -3667,9 +3681,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1477 828 25 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1466 828 25 66 BoxColFill
 LCb setrgbcolor
-1477 828 N
+1466 828 N
 0 65 V
 24 0 V
 0 -65 V
@@ -3677,9 +3691,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1512 828 25 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1500 828 25 67 BoxColFill
 LCb setrgbcolor
-1512 828 N
+1500 828 N
 0 66 V
 24 0 V
 0 -66 V
@@ -3687,19 +3701,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1546 876 26 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1535 876 25 67 BoxColFill
 LCb setrgbcolor
-1546 876 N
+1535 876 N
 0 66 V
-25 0 V
+24 0 V
 0 -66 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1581 876 25 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1569 876 25 67 BoxColFill
 LCb setrgbcolor
-1581 876 N
+1569 876 N
 0 66 V
 24 0 V
 0 -66 V
@@ -3707,9 +3721,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1616 883 25 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1603 883 25 66 BoxColFill
 LCb setrgbcolor
-1616 883 N
+1603 883 N
 0 65 V
 24 0 V
 0 -65 V
@@ -3717,9 +3731,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1651 904 25 75 BoxColFill
+0.90 0.62 0.00 C 0.180 1638 904 25 75 BoxColFill
 LCb setrgbcolor
-1651 904 N
+1638 904 N
 0 74 V
 24 0 V
 0 -74 V
@@ -3727,19 +3741,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1685 926 26 78 BoxColFill
+0.90 0.62 0.00 C 0.180 1672 926 25 78 BoxColFill
 LCb setrgbcolor
-1685 926 N
+1672 926 N
 0 77 V
-25 0 V
+24 0 V
 0 -77 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1720 952 25 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1706 952 25 87 BoxColFill
 LCb setrgbcolor
-1720 952 N
+1706 952 N
 0 86 V
 24 0 V
 0 -86 V
@@ -3747,9 +3761,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1755 952 25 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1741 952 25 88 BoxColFill
 LCb setrgbcolor
-1755 952 N
+1741 952 N
 0 87 V
 24 0 V
 0 -87 V
@@ -3757,9 +3771,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1790 954 25 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1775 954 25 89 BoxColFill
 LCb setrgbcolor
-1790 954 N
+1775 954 N
 0 88 V
 24 0 V
 0 -88 V
@@ -3767,19 +3781,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1824 978 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1809 978 25 89 BoxColFill
 LCb setrgbcolor
-1824 978 N
+1809 978 N
 0 88 V
-25 0 V
+24 0 V
 0 -88 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1859 987 25 90 BoxColFill
+0.90 0.62 0.00 C 0.180 1844 987 25 90 BoxColFill
 LCb setrgbcolor
-1859 987 N
+1844 987 N
 0 89 V
 24 0 V
 0 -89 V
@@ -3787,9 +3801,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1894 988 25 91 BoxColFill
+0.90 0.62 0.00 C 0.180 1878 988 25 91 BoxColFill
 LCb setrgbcolor
-1894 988 N
+1878 988 N
 0 90 V
 24 0 V
 0 -90 V
@@ -3797,9 +3811,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1928 944 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1912 944 26 89 BoxColFill
 LCb setrgbcolor
-1928 944 N
+1912 944 N
 0 88 V
 25 0 V
 0 -88 V
@@ -3807,19 +3821,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1963 961 26 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1947 961 25 87 BoxColFill
 LCb setrgbcolor
-1963 961 N
+1947 961 N
 0 86 V
-25 0 V
+24 0 V
 0 -86 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1998 969 25 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1981 969 25 88 BoxColFill
 LCb setrgbcolor
-1998 969 N
+1981 969 N
 0 87 V
 24 0 V
 0 -87 V
@@ -3827,49 +3841,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2033 978 25 139 BoxColFill
+0.90 0.62 0.00 C 0.180 2015 978 26 139 BoxColFill
 LCb setrgbcolor
-2033 978 N
+2015 978 N
 0 138 V
-24 0 V
+25 0 V
 0 -138 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2067 980 26 157 BoxColFill
+0.90 0.62 0.00 C 0.180 2050 980 25 157 BoxColFill
 LCb setrgbcolor
-2067 980 N
+2050 980 N
 0 156 V
-25 0 V
+24 0 V
 0 -156 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2102 989 26 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2084 989 25 165 BoxColFill
 LCb setrgbcolor
-2102 989 N
+2084 989 N
 0 164 V
-25 0 V
+24 0 V
 0 -164 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2137 999 25 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2118 999 26 165 BoxColFill
 LCb setrgbcolor
-2137 999 N
+2118 999 N
 0 164 V
-24 0 V
+25 0 V
 0 -164 V
--24 0 V
+-25 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2172 1023 25 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2153 1023 25 171 BoxColFill
 LCb setrgbcolor
-2172 1023 N
+2153 1023 N
 0 170 V
 24 0 V
 0 -170 V
@@ -3877,19 +3891,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2206 1028 26 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2187 1028 25 171 BoxColFill
 LCb setrgbcolor
-2206 1028 N
+2187 1028 N
 0 170 V
-25 0 V
+24 0 V
 0 -170 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2241 1026 25 173 BoxColFill
+0.90 0.62 0.00 C 0.180 2222 1026 25 173 BoxColFill
 LCb setrgbcolor
-2241 1026 N
+2222 1026 N
 0 172 V
 24 0 V
 0 -172 V
@@ -3897,9 +3911,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2276 1036 25 174 BoxColFill
+0.90 0.62 0.00 C 0.180 2256 1036 25 174 BoxColFill
 LCb setrgbcolor
-2276 1036 N
+2256 1036 N
 0 173 V
 24 0 V
 0 -173 V
@@ -3907,9 +3921,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2311 1037 25 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2290 1037 25 176 BoxColFill
 LCb setrgbcolor
-2311 1037 N
+2290 1037 N
 0 175 V
 24 0 V
 0 -175 V
@@ -3917,19 +3931,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2345 1043 26 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2325 1043 25 176 BoxColFill
 LCb setrgbcolor
-2345 1043 N
+2325 1043 N
 0 175 V
-25 0 V
+24 0 V
 0 -175 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2380 1068 25 177 BoxColFill
+0.90 0.62 0.00 C 0.180 2359 1068 25 177 BoxColFill
 LCb setrgbcolor
-2380 1068 N
+2359 1068 N
 0 176 V
 24 0 V
 0 -176 V
@@ -3937,9 +3951,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2415 1075 25 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2393 1075 25 179 BoxColFill
 LCb setrgbcolor
-2415 1075 N
+2393 1075 N
 0 178 V
 24 0 V
 0 -178 V
@@ -3947,9 +3961,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2450 1079 25 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2428 1079 25 179 BoxColFill
 LCb setrgbcolor
-2450 1079 N
+2428 1079 N
 0 178 V
 24 0 V
 0 -178 V
@@ -3957,19 +3971,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2484 1085 26 222 BoxColFill
+0.90 0.62 0.00 C 0.180 2462 1085 25 222 BoxColFill
 LCb setrgbcolor
-2484 1085 N
+2462 1085 N
 0 221 V
-25 0 V
+24 0 V
 0 -221 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2519 1088 25 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2496 1088 25 225 BoxColFill
 LCb setrgbcolor
-2519 1088 N
+2496 1088 N
 0 224 V
 24 0 V
 0 -224 V
@@ -3977,9 +3991,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2554 1091 25 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2531 1091 25 224 BoxColFill
 LCb setrgbcolor
-2554 1091 N
+2531 1091 N
 0 223 V
 24 0 V
 0 -223 V
@@ -3987,9 +4001,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2589 1094 25 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2565 1094 25 224 BoxColFill
 LCb setrgbcolor
-2589 1094 N
+2565 1094 N
 0 223 V
 24 0 V
 0 -223 V
@@ -3997,19 +4011,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2623 1102 26 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2599 1102 25 225 BoxColFill
 LCb setrgbcolor
-2623 1102 N
+2599 1102 N
 0 224 V
-25 0 V
+24 0 V
 0 -224 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2658 1202 25 226 BoxColFill
+0.90 0.62 0.00 C 0.180 2634 1202 25 226 BoxColFill
 LCb setrgbcolor
-2658 1202 N
+2634 1202 N
 0 225 V
 24 0 V
 0 -225 V
@@ -4017,9 +4031,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2693 1136 25 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2668 1136 25 229 BoxColFill
 LCb setrgbcolor
-2693 1136 N
+2668 1136 N
 0 228 V
 24 0 V
 0 -228 V
@@ -4027,9 +4041,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2728 1132 25 231 BoxColFill
+0.90 0.62 0.00 C 0.180 2702 1132 25 231 BoxColFill
 LCb setrgbcolor
-2728 1132 N
+2702 1132 N
 0 230 V
 24 0 V
 0 -230 V
@@ -4037,19 +4051,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2762 1135 26 232 BoxColFill
+0.90 0.62 0.00 C 0.180 2737 1135 25 232 BoxColFill
 LCb setrgbcolor
-2762 1135 N
+2737 1135 N
 0 231 V
-25 0 V
+24 0 V
 0 -231 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2797 1132 25 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2771 1132 25 229 BoxColFill
 LCb setrgbcolor
-2797 1132 N
+2771 1132 N
 0 228 V
 24 0 V
 0 -228 V
@@ -4057,9 +4071,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2832 1132 25 230 BoxColFill
+0.90 0.62 0.00 C 0.180 2805 1132 25 230 BoxColFill
 LCb setrgbcolor
-2832 1132 N
+2805 1132 N
 0 229 V
 24 0 V
 0 -229 V
@@ -4067,29 +4081,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2866 1131 26 233 BoxColFill
+0.90 0.62 0.00 C 0.180 2840 1131 25 233 BoxColFill
 LCb setrgbcolor
-2866 1131 N
+2840 1131 N
 0 232 V
-25 0 V
+24 0 V
 0 -232 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2901 1140 26 241 BoxColFill
+0.90 0.62 0.00 C 0.180 2874 1140 25 241 BoxColFill
 LCb setrgbcolor
-2901 1140 N
+2874 1140 N
 0 240 V
-25 0 V
+24 0 V
 0 -240 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2936 1122 25 244 BoxColFill
+0.90 0.62 0.00 C 0.180 2908 1122 25 244 BoxColFill
 LCb setrgbcolor
-2936 1122 N
+2908 1122 N
 0 243 V
 24 0 V
 0 -243 V
@@ -4097,9 +4111,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2971 1125 25 345 BoxColFill
+0.90 0.62 0.00 C 0.180 2943 1125 25 345 BoxColFill
 LCb setrgbcolor
-2971 1125 N
+2943 1125 N
 0 344 V
 24 0 V
 0 -344 V
@@ -4107,29 +4121,29 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3005 1107 26 256 BoxColFill
+0.90 0.62 0.00 C 0.180 2977 1107 25 256 BoxColFill
 LCb setrgbcolor
-3005 1107 N
+2977 1107 N
 0 255 V
-25 0 V
+24 0 V
 0 -255 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3040 1105 26 246 BoxColFill
+0.90 0.62 0.00 C 0.180 3011 1105 25 246 BoxColFill
 LCb setrgbcolor
-3040 1105 N
+3011 1105 N
 0 245 V
-25 0 V
+24 0 V
 0 -245 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3075 1110 25 250 BoxColFill
+0.90 0.62 0.00 C 0.180 3046 1110 25 250 BoxColFill
 LCb setrgbcolor
-3075 1110 N
+3046 1110 N
 0 249 V
 24 0 V
 0 -249 V
@@ -4137,9 +4151,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3110 1131 25 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3080 1131 25 251 BoxColFill
 LCb setrgbcolor
-3110 1131 N
+3080 1131 N
 0 250 V
 24 0 V
 0 -250 V
@@ -4147,19 +4161,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3144 1134 26 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3114 1134 25 251 BoxColFill
 LCb setrgbcolor
-3144 1134 N
+3114 1134 N
 0 250 V
-25 0 V
+24 0 V
 0 -250 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3179 1143 25 258 BoxColFill
+0.90 0.62 0.00 C 0.180 3149 1143 25 258 BoxColFill
 LCb setrgbcolor
-3179 1143 N
+3149 1143 N
 0 257 V
 24 0 V
 0 -257 V
@@ -4167,9 +4181,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3214 1156 25 261 BoxColFill
+0.90 0.62 0.00 C 0.180 3183 1156 25 261 BoxColFill
 LCb setrgbcolor
-3214 1156 N
+3183 1156 N
 0 260 V
 24 0 V
 0 -260 V
@@ -4177,9 +4191,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3249 1214 25 267 BoxColFill
+0.90 0.62 0.00 C 0.180 3217 1214 25 267 BoxColFill
 LCb setrgbcolor
-3249 1214 N
+3217 1214 N
 0 266 V
 24 0 V
 0 -266 V
@@ -4187,19 +4201,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3283 1224 26 314 BoxColFill
+0.90 0.62 0.00 C 0.180 3252 1224 25 314 BoxColFill
 LCb setrgbcolor
-3283 1224 N
+3252 1224 N
 0 313 V
-25 0 V
+24 0 V
 0 -313 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3318 1231 25 320 BoxColFill
+0.90 0.62 0.00 C 0.180 3286 1231 25 320 BoxColFill
 LCb setrgbcolor
-3318 1231 N
+3286 1231 N
 0 319 V
 24 0 V
 0 -319 V
@@ -4207,9 +4221,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3353 1236 25 324 BoxColFill
+0.90 0.62 0.00 C 0.180 3320 1236 25 324 BoxColFill
 LCb setrgbcolor
-3353 1236 N
+3320 1236 N
 0 323 V
 24 0 V
 0 -323 V
@@ -4217,9 +4231,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3388 1276 25 364 BoxColFill
+0.90 0.62 0.00 C 0.180 3355 1276 25 364 BoxColFill
 LCb setrgbcolor
-3388 1276 N
+3355 1276 N
 0 363 V
 24 0 V
 0 -363 V
@@ -4227,19 +4241,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3422 1285 26 386 BoxColFill
+0.90 0.62 0.00 C 0.180 3389 1285 25 386 BoxColFill
 LCb setrgbcolor
-3422 1285 N
+3389 1285 N
 0 385 V
-25 0 V
+24 0 V
 0 -385 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3457 1292 25 403 BoxColFill
+0.90 0.62 0.00 C 0.180 3423 1292 25 403 BoxColFill
 LCb setrgbcolor
-3457 1292 N
+3423 1292 N
 0 402 V
 24 0 V
 0 -402 V
@@ -4247,6 +4261,16 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
+0.90 0.62 0.00 C 0.180 3458 1292 25 417 BoxColFill
+LCb setrgbcolor
+3458 1292 N
+0 416 V
+24 0 V
+0 -416 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
 0.90 0.62 0.00 C % End plot #2
 % Begin plot #3
 1.000 UL
@@ -4259,90 +4283,91 @@ LTb
 LTb
 0.55 0.00 0.00 C 2092 1457 M
 255 0 V
-586 512 M
-34 0 V
+585 512 M
 35 0 V
-35 778 V
+34 0 V
+34 778 V
 35 193 V
 34 -5 V
-35 87 V
+34 87 V
 35 29 V
-35 3 V
+34 3 V
 34 0 V
 35 -5 V
-35 0 V
-35 -17 V
-34 -483 V
-35 2 V
-35 -38 V
+34 0 V
+34 -17 V
+35 -483 V
+34 2 V
+34 -38 V
 35 -20 V
 34 -140 V
-35 0 V
+34 0 V
 35 -5 V
-35 150 V
+34 150 V
 34 -51 V
 35 -17 V
-35 -14 V
-35 -15 V
-34 -38 V
-35 24 V
-35 -2 V
-34 -46 V
-35 0 V
-35 -8 V
+34 -14 V
+34 -15 V
+35 -38 V
+34 24 V
+34 -2 V
+35 -46 V
+34 0 V
+34 -8 V
 35 20 V
 34 -3 V
-35 17 V
+34 17 V
 35 3 V
-35 4 V
+34 4 V
 34 -21 V
 35 0 V
-35 0 V
-35 26 V
-34 -19 V
-35 -5 V
+34 0 V
+34 26 V
+35 -19 V
+34 -5 V
 35 169 V
-35 51 V
+34 51 V
 34 14 V
 35 -7 V
-35 -7 V
-35 -5 V
-34 5 V
-35 -5 V
+34 -7 V
+34 -5 V
 35 5 V
+34 -5 V
+34 5 V
 35 -2 V
 34 -22 V
-35 0 V
+34 0 V
 35 -3 V
-35 95 V
+34 95 V
 34 2 V
 35 -2 V
-35 -3 V
+34 -3 V
 34 -5 V
 35 -70 V
-35 53 V
-35 8 V
-34 -3 V
-35 -2 V
-35 2 V
+34 53 V
+34 8 V
+35 -3 V
+34 -2 V
+34 2 V
 35 5 V
 34 12 V
-35 22 V
+34 22 V
 35 176 V
-35 -142 V
+34 -142 V
 34 -20 V
 35 5 V
-35 -14 V
-35 -3 V
-34 5 V
-35 -2 V
-35 -29 V
+34 -14 V
+34 -3 V
+35 5 V
+34 -2 V
+34 -29 V
 35 72 V
 34 3 V
-35 5 V
+34 5 V
 35 31 V
-35 24 V
+34 24 V
 34 19 V
+35 20 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 8dc59f55..24aa9daa 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -81,4 +81,5 @@ v5.8  17424 6627 24051 27.6
 ""    17978 8033 26011 30.9
 v5.12 18965 9025 27990 32.2
 ""    19205 9556 28761 33.2
-v5.14 19362 9983 29345 34.0
+""    19362 9983 29345 34.0
+v5.15 19366 10332 29698 34.8

base-commit: 06e8346fa1f903c6cfec32287ad0b92c2b8741ec
-- 
2.17.1

