Return-Path: <SRS0=TMph=R2=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Gkc2YQGRTIHrj+jWKT4dANR+qsc41ff0NCetPRCDGRI=;
        b=ZnBT2VTbFfY1GkB3UlzwN/ufMRhrZuAxJukGIC/6ghs0WaRFX6dNzqdZLLIeQKlLgj
         d7AzWiDANXey6+iwtMgJ1Z/eTOWYfLQoGvd0JeB+cOH8yM9GS/GnQWH7uzdEP0F/yhIA
         30DmSHw/k7k+buqwTxzHf7OHrocLkL51iNRKlrbCJslB1SE5wm9ieFByRthvafLrUJON
         0neNptEhns/jhnPwfNt+vVygBamfqRuo38YYmQxQIDpV5GVt+DGMY5SvLYJvwqQ6XmpN
         032HuC70GMAfz9gn79rl6cjSFO7Ww0sIj1svNKgECVfVfuWDJ/GttVKD9ZEpDlwnLv7h
         G9aQ==
Subject: [PATCH -perfbook 5/5] formal: Update rcu-test data in Figure 12.4 (as
 of v5.16)
References: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d7dd324b-4e4e-0fd8-072c-042a347d5162@gmail.com>
Date: Mon, 10 Jan 2022 20:21:47 +0900
MIME-Version: 1.0
In-Reply-To: <92fe431a-fa47-add9-3899-77ff9ec57503@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/RCU-test-ratio.eps | 1145 ++++++++++----------
 CodeSamples/formal/data/rcu-test.dat       |    3 +-
 2 files changed, 587 insertions(+), 561 deletions(-)

diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
index 42c021c2..6a37da5f 100644
--- a/CodeSamples/formal/data/RCU-test-ratio.eps
+++ b/CodeSamples/formal/data/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Nov  1 08:58:03 2021
+%%CreationDate: Mon Jan 10 17:24:15 2022
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Nov  1 08:58:03 2021)
+  /CreationDate (Mon Jan 10 17:24:15 2022)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1990,21 +1990,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-620 512 M
+619 512 M
 stroke
 LTb
 LCb setrgbcolor
-654 512 M
+653 512 M
 stroke
 LTb
 LCb setrgbcolor
-688 512 M
+687 512 M
 stroke
 LTb
 LCb setrgbcolor
-723 512 M
+721 512 M
 stroke
-723 464 M
+721 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
 ] -26.7 MRshow
@@ -2012,21 +2012,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-757 512 M
+755 512 M
 stroke
 LTb
 LCb setrgbcolor
-791 512 M
+789 512 M
 stroke
 LTb
 LCb setrgbcolor
-826 512 M
+823 512 M
 stroke
 LTb
 LCb setrgbcolor
-860 512 M
+856 512 M
 stroke
-860 464 M
+856 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
 ] -26.7 MRshow
@@ -2034,21 +2034,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-894 512 M
+890 512 M
 stroke
 LTb
 LCb setrgbcolor
-929 512 M
+924 512 M
 stroke
 LTb
 LCb setrgbcolor
-963 512 M
+958 512 M
 stroke
 LTb
 LCb setrgbcolor
-997 512 M
+992 512 M
 stroke
-997 464 M
+992 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
 ] -26.7 MRshow
@@ -2056,21 +2056,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1032 512 M
+1026 512 M
 stroke
 LTb
 LCb setrgbcolor
-1066 512 M
+1060 512 M
 stroke
 LTb
 LCb setrgbcolor
-1100 512 M
+1094 512 M
 stroke
 LTb
 LCb setrgbcolor
-1135 512 M
+1128 512 M
 stroke
-1135 464 M
+1128 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
 ] -26.7 MRshow
@@ -2078,21 +2078,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1169 512 M
+1162 512 M
 stroke
 LTb
 LCb setrgbcolor
-1203 512 M
+1196 512 M
 stroke
 LTb
 LCb setrgbcolor
-1238 512 M
+1230 512 M
 stroke
 LTb
 LCb setrgbcolor
-1272 512 M
+1264 512 M
 stroke
-1272 464 M
+1264 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
 ] -26.7 MRshow
@@ -2100,21 +2100,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1306 512 M
+1298 512 M
 stroke
 LTb
 LCb setrgbcolor
-1341 512 M
+1332 512 M
 stroke
 LTb
 LCb setrgbcolor
-1375 512 M
+1366 512 M
 stroke
 LTb
 LCb setrgbcolor
-1409 512 M
+1400 512 M
 stroke
-1409 464 M
+1400 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
 ] -26.7 MRshow
@@ -2122,21 +2122,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1444 512 M
+1434 512 M
 stroke
 LTb
 LCb setrgbcolor
-1478 512 M
+1467 512 M
 stroke
 LTb
 LCb setrgbcolor
-1512 512 M
+1501 512 M
 stroke
 LTb
 LCb setrgbcolor
-1547 512 M
+1535 512 M
 stroke
-1547 464 M
+1535 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
 ] -26.7 MRshow
@@ -2144,21 +2144,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1581 512 M
+1569 512 M
 stroke
 LTb
 LCb setrgbcolor
-1615 512 M
+1603 512 M
 stroke
 LTb
 LCb setrgbcolor
-1650 512 M
+1637 512 M
 stroke
 LTb
 LCb setrgbcolor
-1684 512 M
+1671 512 M
 stroke
-1684 464 M
+1671 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
 ] -26.7 MRshow
@@ -2166,21 +2166,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1718 512 M
+1705 512 M
 stroke
 LTb
 LCb setrgbcolor
-1753 512 M
+1739 512 M
 stroke
 LTb
 LCb setrgbcolor
-1787 512 M
+1773 512 M
 stroke
 LTb
 LCb setrgbcolor
-1821 512 M
+1807 512 M
 stroke
-1821 464 M
+1807 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
 ] -26.7 MRshow
@@ -2188,21 +2188,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1856 512 M
+1841 512 M
 stroke
 LTb
 LCb setrgbcolor
-1890 512 M
+1875 512 M
 stroke
 LTb
 LCb setrgbcolor
-1924 512 M
+1909 512 M
 stroke
 LTb
 LCb setrgbcolor
-1959 512 M
+1943 512 M
 stroke
-1959 464 M
+1943 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
 ] -26.7 MRshow
@@ -2210,21 +2210,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-1993 512 M
+1977 512 M
 stroke
 LTb
 LCb setrgbcolor
-2028 512 M
+2011 512 M
 stroke
 LTb
 LCb setrgbcolor
-2062 512 M
+2044 512 M
 stroke
 LTb
 LCb setrgbcolor
-2096 512 M
+2078 512 M
 stroke
-2096 464 M
+2078 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
 ] -26.7 MRshow
@@ -2232,21 +2232,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2131 512 M
+2112 512 M
 stroke
 LTb
 LCb setrgbcolor
-2165 512 M
+2146 512 M
 stroke
 LTb
 LCb setrgbcolor
-2199 512 M
+2180 512 M
 stroke
 LTb
 LCb setrgbcolor
-2234 512 M
+2214 512 M
 stroke
-2234 464 M
+2214 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
 ] -26.7 MRshow
@@ -2254,21 +2254,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2268 512 M
+2248 512 M
 stroke
 LTb
 LCb setrgbcolor
-2302 512 M
+2282 512 M
 stroke
 LTb
 LCb setrgbcolor
-2337 512 M
+2316 512 M
 stroke
 LTb
 LCb setrgbcolor
-2371 512 M
+2350 512 M
 stroke
-2371 464 M
+2350 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
 ] -26.7 MRshow
@@ -2276,21 +2276,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2405 512 M
+2384 512 M
 stroke
 LTb
 LCb setrgbcolor
-2440 512 M
+2418 512 M
 stroke
 LTb
 LCb setrgbcolor
-2474 512 M
+2452 512 M
 stroke
 LTb
 LCb setrgbcolor
-2508 512 M
+2486 512 M
 stroke
-2508 464 M
+2486 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
 ] -26.7 MRshow
@@ -2298,21 +2298,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2543 512 M
+2520 512 M
 stroke
 LTb
 LCb setrgbcolor
-2577 512 M
+2554 512 M
 stroke
 LTb
 LCb setrgbcolor
-2611 512 M
+2588 512 M
 stroke
 LTb
 LCb setrgbcolor
-2646 512 M
+2621 512 M
 stroke
-2646 464 M
+2621 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
 ] -26.7 MRshow
@@ -2320,21 +2320,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2680 512 M
+2655 512 M
 stroke
 LTb
 LCb setrgbcolor
-2714 512 M
+2689 512 M
 stroke
 LTb
 LCb setrgbcolor
-2749 512 M
+2723 512 M
 stroke
 LTb
 LCb setrgbcolor
-2783 512 M
+2757 512 M
 stroke
-2783 464 M
+2757 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
 ] -26.7 MRshow
@@ -2342,25 +2342,25 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2817 512 M
+2791 512 M
 stroke
 LTb
 LCb setrgbcolor
-2852 512 M
+2825 512 M
 stroke
 LTb
 LCb setrgbcolor
-2886 512 M
+2859 512 M
 stroke
 LTb
 LCb setrgbcolor
-2920 512 M
+2893 512 M
 stroke
 LTb
 LCb setrgbcolor
-2955 512 M
+2927 512 M
 stroke
-2955 464 M
+2927 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
 ] -26.7 MRshow
@@ -2368,21 +2368,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-2989 512 M
+2961 512 M
 stroke
 LTb
 LCb setrgbcolor
-3023 512 M
+2995 512 M
 stroke
 LTb
 LCb setrgbcolor
-3058 512 M
+3029 512 M
 stroke
 LTb
 LCb setrgbcolor
-3092 512 M
+3063 512 M
 stroke
-3092 464 M
+3063 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
 ] -26.7 MRshow
@@ -2390,21 +2390,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3126 512 M
+3097 512 M
 stroke
 LTb
 LCb setrgbcolor
-3161 512 M
+3131 512 M
 stroke
 LTb
 LCb setrgbcolor
-3195 512 M
+3165 512 M
 stroke
 LTb
 LCb setrgbcolor
-3229 512 M
+3199 512 M
 stroke
-3229 464 M
+3199 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
 ] -26.7 MRshow
@@ -2412,21 +2412,21 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3264 512 M
+3232 512 M
 stroke
 LTb
 LCb setrgbcolor
-3298 512 M
+3266 512 M
 stroke
 LTb
 LCb setrgbcolor
-3332 512 M
+3300 512 M
 stroke
 LTb
 LCb setrgbcolor
-3367 512 M
+3334 512 M
 stroke
-3367 464 M
+3334 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
 ] -26.7 MRshow
@@ -2434,11 +2434,15 @@ grestore
 1.000 UL
 LTb
 LCb setrgbcolor
-3401 512 M
+3368 512 M
 stroke
 LTb
 LCb setrgbcolor
-3435 512 M
+3402 512 M
+stroke
+LTb
+LCb setrgbcolor
+3436 512 M
 stroke
 LTb
 LCb setrgbcolor
@@ -2446,7 +2450,7 @@ LCb setrgbcolor
 stroke
 3470 464 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.15)]
+[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
 ] -26.7 MRshow
 grestore
 1.000 UL
@@ -2567,9 +2571,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 608 512 25 32 BoxColFill
+0.00 0.00 0.00 C 0.180 607 512 25 32 BoxColFill
 LCb setrgbcolor
-608 512 N
+607 512 N
 0 31 V
 24 0 V
 0 -31 V
@@ -2577,9 +2581,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 642 512 25 42 BoxColFill
+0.00 0.00 0.00 C 0.180 641 512 25 42 BoxColFill
 LCb setrgbcolor
-642 512 N
+641 512 N
 0 41 V
 24 0 V
 0 -41 V
@@ -2587,9 +2591,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 676 512 25 44 BoxColFill
+0.00 0.00 0.00 C 0.180 675 512 25 44 BoxColFill
 LCb setrgbcolor
-676 512 N
+675 512 N
 0 43 V
 24 0 V
 0 -43 V
@@ -2597,9 +2601,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 711 512 25 37 BoxColFill
+0.00 0.00 0.00 C 0.180 709 512 25 37 BoxColFill
 LCb setrgbcolor
-711 512 N
+709 512 N
 0 36 V
 24 0 V
 0 -36 V
@@ -2607,9 +2611,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 745 512 25 37 BoxColFill
+0.00 0.00 0.00 C 0.180 743 512 25 37 BoxColFill
 LCb setrgbcolor
-745 512 N
+743 512 N
 0 36 V
 24 0 V
 0 -36 V
@@ -2617,49 +2621,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 779 512 25 38 BoxColFill
+0.00 0.00 0.00 C 0.180 777 512 24 38 BoxColFill
 LCb setrgbcolor
-779 512 N
+777 512 N
 0 37 V
-24 0 V
+23 0 V
 0 -37 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 814 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 811 512 24 51 BoxColFill
 LCb setrgbcolor
-814 512 N
+811 512 N
 0 50 V
-24 0 V
+23 0 V
 0 -50 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 848 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 845 512 24 51 BoxColFill
 LCb setrgbcolor
-848 512 N
+845 512 N
 0 50 V
-24 0 V
+23 0 V
 0 -50 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 882 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 879 512 24 51 BoxColFill
 LCb setrgbcolor
-882 512 N
+879 512 N
 0 50 V
-24 0 V
+23 0 V
 0 -50 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 917 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 912 512 25 51 BoxColFill
 LCb setrgbcolor
-917 512 N
+912 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2667,9 +2671,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 951 512 25 51 BoxColFill
+0.00 0.00 0.00 C 0.180 946 512 25 51 BoxColFill
 LCb setrgbcolor
-951 512 N
+946 512 N
 0 50 V
 24 0 V
 0 -50 V
@@ -2677,9 +2681,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 985 512 25 52 BoxColFill
+0.00 0.00 0.00 C 0.180 980 512 25 52 BoxColFill
 LCb setrgbcolor
-985 512 N
+980 512 N
 0 51 V
 24 0 V
 0 -51 V
@@ -2687,9 +2691,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1020 512 25 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1014 512 25 128 BoxColFill
 LCb setrgbcolor
-1020 512 N
+1014 512 N
 0 127 V
 24 0 V
 0 -127 V
@@ -2697,9 +2701,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1054 512 25 128 BoxColFill
+0.00 0.00 0.00 C 0.180 1048 512 25 128 BoxColFill
 LCb setrgbcolor
-1054 512 N
+1048 512 N
 0 127 V
 24 0 V
 0 -127 V
@@ -2707,9 +2711,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1088 512 25 161 BoxColFill
+0.00 0.00 0.00 C 0.180 1082 512 25 161 BoxColFill
 LCb setrgbcolor
-1088 512 N
+1082 512 N
 0 160 V
 24 0 V
 0 -160 V
@@ -2717,9 +2721,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1123 512 25 169 BoxColFill
+0.00 0.00 0.00 C 0.180 1116 512 25 169 BoxColFill
 LCb setrgbcolor
-1123 512 N
+1116 512 N
 0 168 V
 24 0 V
 0 -168 V
@@ -2727,9 +2731,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1157 512 25 262 BoxColFill
+0.00 0.00 0.00 C 0.180 1150 512 25 262 BoxColFill
 LCb setrgbcolor
-1157 512 N
+1150 512 N
 0 261 V
 24 0 V
 0 -261 V
@@ -2737,9 +2741,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1191 512 25 264 BoxColFill
+0.00 0.00 0.00 C 0.180 1184 512 25 264 BoxColFill
 LCb setrgbcolor
-1191 512 N
+1184 512 N
 0 263 V
 24 0 V
 0 -263 V
@@ -2747,9 +2751,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1226 512 25 268 BoxColFill
+0.00 0.00 0.00 C 0.180 1218 512 25 268 BoxColFill
 LCb setrgbcolor
-1226 512 N
+1218 512 N
 0 267 V
 24 0 V
 0 -267 V
@@ -2757,9 +2761,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1260 512 25 182 BoxColFill
+0.00 0.00 0.00 C 0.180 1252 512 25 182 BoxColFill
 LCb setrgbcolor
-1260 512 N
+1252 512 N
 0 181 V
 24 0 V
 0 -181 V
@@ -2767,9 +2771,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1294 512 25 213 BoxColFill
+0.00 0.00 0.00 C 0.180 1286 512 25 213 BoxColFill
 LCb setrgbcolor
-1294 512 N
+1286 512 N
 0 212 V
 24 0 V
 0 -212 V
@@ -2777,9 +2781,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1329 512 25 237 BoxColFill
+0.00 0.00 0.00 C 0.180 1320 512 25 237 BoxColFill
 LCb setrgbcolor
-1329 512 N
+1320 512 N
 0 236 V
 24 0 V
 0 -236 V
@@ -2787,9 +2791,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1363 512 25 246 BoxColFill
+0.00 0.00 0.00 C 0.180 1354 512 25 246 BoxColFill
 LCb setrgbcolor
-1363 512 N
+1354 512 N
 0 245 V
 24 0 V
 0 -245 V
@@ -2797,49 +2801,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1397 512 25 256 BoxColFill
+0.00 0.00 0.00 C 0.180 1388 512 24 256 BoxColFill
 LCb setrgbcolor
-1397 512 N
+1388 512 N
 0 255 V
-24 0 V
+23 0 V
 0 -255 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1432 512 25 288 BoxColFill
+0.00 0.00 0.00 C 0.180 1422 512 24 288 BoxColFill
 LCb setrgbcolor
-1432 512 N
+1422 512 N
 0 287 V
-24 0 V
+23 0 V
 0 -287 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1466 512 25 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1456 512 24 317 BoxColFill
 LCb setrgbcolor
-1466 512 N
+1456 512 N
 0 316 V
-24 0 V
+23 0 V
 0 -316 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1500 512 25 317 BoxColFill
+0.00 0.00 0.00 C 0.180 1490 512 24 317 BoxColFill
 LCb setrgbcolor
-1500 512 N
+1490 512 N
 0 316 V
-24 0 V
+23 0 V
 0 -316 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1535 512 25 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1523 512 25 365 BoxColFill
 LCb setrgbcolor
-1535 512 N
+1523 512 N
 0 364 V
 24 0 V
 0 -364 V
@@ -2847,9 +2851,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1569 512 25 365 BoxColFill
+0.00 0.00 0.00 C 0.180 1557 512 25 365 BoxColFill
 LCb setrgbcolor
-1569 512 N
+1557 512 N
 0 364 V
 24 0 V
 0 -364 V
@@ -2857,9 +2861,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1603 512 25 372 BoxColFill
+0.00 0.00 0.00 C 0.180 1591 512 25 372 BoxColFill
 LCb setrgbcolor
-1603 512 N
+1591 512 N
 0 371 V
 24 0 V
 0 -371 V
@@ -2867,9 +2871,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1638 512 25 393 BoxColFill
+0.00 0.00 0.00 C 0.180 1625 512 25 393 BoxColFill
 LCb setrgbcolor
-1638 512 N
+1625 512 N
 0 392 V
 24 0 V
 0 -392 V
@@ -2877,9 +2881,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1672 512 25 415 BoxColFill
+0.00 0.00 0.00 C 0.180 1659 512 25 415 BoxColFill
 LCb setrgbcolor
-1672 512 N
+1659 512 N
 0 414 V
 24 0 V
 0 -414 V
@@ -2887,9 +2891,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1706 512 25 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1693 512 25 441 BoxColFill
 LCb setrgbcolor
-1706 512 N
+1693 512 N
 0 440 V
 24 0 V
 0 -440 V
@@ -2897,9 +2901,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1741 512 25 441 BoxColFill
+0.00 0.00 0.00 C 0.180 1727 512 25 441 BoxColFill
 LCb setrgbcolor
-1741 512 N
+1727 512 N
 0 440 V
 24 0 V
 0 -440 V
@@ -2907,9 +2911,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1775 512 25 443 BoxColFill
+0.00 0.00 0.00 C 0.180 1761 512 25 443 BoxColFill
 LCb setrgbcolor
-1775 512 N
+1761 512 N
 0 442 V
 24 0 V
 0 -442 V
@@ -2917,9 +2921,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1809 512 25 467 BoxColFill
+0.00 0.00 0.00 C 0.180 1795 512 25 467 BoxColFill
 LCb setrgbcolor
-1809 512 N
+1795 512 N
 0 466 V
 24 0 V
 0 -466 V
@@ -2927,9 +2931,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1844 512 25 476 BoxColFill
+0.00 0.00 0.00 C 0.180 1829 512 25 476 BoxColFill
 LCb setrgbcolor
-1844 512 N
+1829 512 N
 0 475 V
 24 0 V
 0 -475 V
@@ -2937,9 +2941,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1878 512 25 477 BoxColFill
+0.00 0.00 0.00 C 0.180 1863 512 25 477 BoxColFill
 LCb setrgbcolor
-1878 512 N
+1863 512 N
 0 476 V
 24 0 V
 0 -476 V
@@ -2947,19 +2951,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1912 512 26 433 BoxColFill
+0.00 0.00 0.00 C 0.180 1897 512 25 433 BoxColFill
 LCb setrgbcolor
-1912 512 N
+1897 512 N
 0 432 V
-25 0 V
+24 0 V
 0 -432 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1947 512 25 450 BoxColFill
+0.00 0.00 0.00 C 0.180 1931 512 25 450 BoxColFill
 LCb setrgbcolor
-1947 512 N
+1931 512 N
 0 449 V
 24 0 V
 0 -449 V
@@ -2967,59 +2971,59 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 1981 512 25 458 BoxColFill
+0.00 0.00 0.00 C 0.180 1965 512 24 458 BoxColFill
 LCb setrgbcolor
-1981 512 N
+1965 512 N
 0 457 V
-24 0 V
+23 0 V
 0 -457 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2015 512 26 467 BoxColFill
+0.00 0.00 0.00 C 0.180 1999 512 24 467 BoxColFill
 LCb setrgbcolor
-2015 512 N
+1999 512 N
 0 466 V
-25 0 V
+23 0 V
 0 -466 V
--25 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2050 512 25 469 BoxColFill
+0.00 0.00 0.00 C 0.180 2033 512 24 469 BoxColFill
 LCb setrgbcolor
-2050 512 N
+2033 512 N
 0 468 V
-24 0 V
+23 0 V
 0 -468 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2084 512 25 478 BoxColFill
+0.00 0.00 0.00 C 0.180 2067 512 24 478 BoxColFill
 LCb setrgbcolor
-2084 512 N
+2067 512 N
 0 477 V
-24 0 V
+23 0 V
 0 -477 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2118 512 26 488 BoxColFill
+0.00 0.00 0.00 C 0.180 2100 512 25 488 BoxColFill
 LCb setrgbcolor
-2118 512 N
+2100 512 N
 0 487 V
-25 0 V
+24 0 V
 0 -487 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2153 512 25 512 BoxColFill
+0.00 0.00 0.00 C 0.180 2134 512 25 512 BoxColFill
 LCb setrgbcolor
-2153 512 N
+2134 512 N
 0 511 V
 24 0 V
 0 -511 V
@@ -3027,9 +3031,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2187 512 25 517 BoxColFill
+0.00 0.00 0.00 C 0.180 2168 512 25 517 BoxColFill
 LCb setrgbcolor
-2187 512 N
+2168 512 N
 0 516 V
 24 0 V
 0 -516 V
@@ -3037,9 +3041,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2222 512 25 515 BoxColFill
+0.00 0.00 0.00 C 0.180 2202 512 25 515 BoxColFill
 LCb setrgbcolor
-2222 512 N
+2202 512 N
 0 514 V
 24 0 V
 0 -514 V
@@ -3047,9 +3051,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2256 512 25 525 BoxColFill
+0.00 0.00 0.00 C 0.180 2236 512 25 525 BoxColFill
 LCb setrgbcolor
-2256 512 N
+2236 512 N
 0 524 V
 24 0 V
 0 -524 V
@@ -3057,9 +3061,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2290 512 25 526 BoxColFill
+0.00 0.00 0.00 C 0.180 2270 512 25 526 BoxColFill
 LCb setrgbcolor
-2290 512 N
+2270 512 N
 0 525 V
 24 0 V
 0 -525 V
@@ -3067,9 +3071,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2325 512 25 532 BoxColFill
+0.00 0.00 0.00 C 0.180 2304 512 25 532 BoxColFill
 LCb setrgbcolor
-2325 512 N
+2304 512 N
 0 531 V
 24 0 V
 0 -531 V
@@ -3077,9 +3081,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2359 512 25 557 BoxColFill
+0.00 0.00 0.00 C 0.180 2338 512 25 557 BoxColFill
 LCb setrgbcolor
-2359 512 N
+2338 512 N
 0 556 V
 24 0 V
 0 -556 V
@@ -3087,9 +3091,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2393 512 25 564 BoxColFill
+0.00 0.00 0.00 C 0.180 2372 512 25 564 BoxColFill
 LCb setrgbcolor
-2393 512 N
+2372 512 N
 0 563 V
 24 0 V
 0 -563 V
@@ -3097,9 +3101,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2428 512 25 568 BoxColFill
+0.00 0.00 0.00 C 0.180 2406 512 25 568 BoxColFill
 LCb setrgbcolor
-2428 512 N
+2406 512 N
 0 567 V
 24 0 V
 0 -567 V
@@ -3107,9 +3111,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2462 512 25 574 BoxColFill
+0.00 0.00 0.00 C 0.180 2440 512 25 574 BoxColFill
 LCb setrgbcolor
-2462 512 N
+2440 512 N
 0 573 V
 24 0 V
 0 -573 V
@@ -3117,9 +3121,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2496 512 25 577 BoxColFill
+0.00 0.00 0.00 C 0.180 2474 512 25 577 BoxColFill
 LCb setrgbcolor
-2496 512 N
+2474 512 N
 0 576 V
 24 0 V
 0 -576 V
@@ -3127,9 +3131,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2531 512 25 580 BoxColFill
+0.00 0.00 0.00 C 0.180 2508 512 25 580 BoxColFill
 LCb setrgbcolor
-2531 512 N
+2508 512 N
 0 579 V
 24 0 V
 0 -579 V
@@ -3137,49 +3141,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2565 512 25 583 BoxColFill
+0.00 0.00 0.00 C 0.180 2542 512 24 583 BoxColFill
 LCb setrgbcolor
-2565 512 N
+2542 512 N
 0 582 V
-24 0 V
+23 0 V
 0 -582 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2599 512 25 591 BoxColFill
+0.00 0.00 0.00 C 0.180 2576 512 24 591 BoxColFill
 LCb setrgbcolor
-2599 512 N
+2576 512 N
 0 590 V
-24 0 V
+23 0 V
 0 -590 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2634 512 25 691 BoxColFill
+0.00 0.00 0.00 C 0.180 2610 512 24 691 BoxColFill
 LCb setrgbcolor
-2634 512 N
+2610 512 N
 0 690 V
-24 0 V
+23 0 V
 0 -690 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2668 512 25 625 BoxColFill
+0.00 0.00 0.00 C 0.180 2644 512 24 625 BoxColFill
 LCb setrgbcolor
-2668 512 N
+2644 512 N
 0 624 V
-24 0 V
+23 0 V
 0 -624 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2702 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2677 512 25 621 BoxColFill
 LCb setrgbcolor
-2702 512 N
+2677 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3187,9 +3191,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2737 512 25 624 BoxColFill
+0.00 0.00 0.00 C 0.180 2711 512 25 624 BoxColFill
 LCb setrgbcolor
-2737 512 N
+2711 512 N
 0 623 V
 24 0 V
 0 -623 V
@@ -3197,9 +3201,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2771 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2745 512 25 621 BoxColFill
 LCb setrgbcolor
-2771 512 N
+2745 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3207,9 +3211,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2805 512 25 621 BoxColFill
+0.00 0.00 0.00 C 0.180 2779 512 25 621 BoxColFill
 LCb setrgbcolor
-2805 512 N
+2779 512 N
 0 620 V
 24 0 V
 0 -620 V
@@ -3217,9 +3221,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2840 512 25 620 BoxColFill
+0.00 0.00 0.00 C 0.180 2813 512 25 620 BoxColFill
 LCb setrgbcolor
-2840 512 N
+2813 512 N
 0 619 V
 24 0 V
 0 -619 V
@@ -3227,9 +3231,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2874 512 25 629 BoxColFill
+0.00 0.00 0.00 C 0.180 2847 512 25 629 BoxColFill
 LCb setrgbcolor
-2874 512 N
+2847 512 N
 0 628 V
 24 0 V
 0 -628 V
@@ -3237,9 +3241,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2908 512 25 611 BoxColFill
+0.00 0.00 0.00 C 0.180 2881 512 25 611 BoxColFill
 LCb setrgbcolor
-2908 512 N
+2881 512 N
 0 610 V
 24 0 V
 0 -610 V
@@ -3247,9 +3251,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2943 512 25 614 BoxColFill
+0.00 0.00 0.00 C 0.180 2915 512 25 614 BoxColFill
 LCb setrgbcolor
-2943 512 N
+2915 512 N
 0 613 V
 24 0 V
 0 -613 V
@@ -3257,9 +3261,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 2977 512 25 596 BoxColFill
+0.00 0.00 0.00 C 0.180 2949 512 25 596 BoxColFill
 LCb setrgbcolor
-2977 512 N
+2949 512 N
 0 595 V
 24 0 V
 0 -595 V
@@ -3267,9 +3271,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3011 512 25 594 BoxColFill
+0.00 0.00 0.00 C 0.180 2983 512 25 594 BoxColFill
 LCb setrgbcolor
-3011 512 N
+2983 512 N
 0 593 V
 24 0 V
 0 -593 V
@@ -3277,9 +3281,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3046 512 25 599 BoxColFill
+0.00 0.00 0.00 C 0.180 3017 512 25 599 BoxColFill
 LCb setrgbcolor
-3046 512 N
+3017 512 N
 0 598 V
 24 0 V
 0 -598 V
@@ -3287,9 +3291,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3080 512 25 620 BoxColFill
+0.00 0.00 0.00 C 0.180 3051 512 25 620 BoxColFill
 LCb setrgbcolor
-3080 512 N
+3051 512 N
 0 619 V
 24 0 V
 0 -619 V
@@ -3297,9 +3301,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3114 512 25 623 BoxColFill
+0.00 0.00 0.00 C 0.180 3085 512 25 623 BoxColFill
 LCb setrgbcolor
-3114 512 N
+3085 512 N
 0 622 V
 24 0 V
 0 -622 V
@@ -3307,9 +3311,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3149 512 25 632 BoxColFill
+0.00 0.00 0.00 C 0.180 3119 512 25 632 BoxColFill
 LCb setrgbcolor
-3149 512 N
+3119 512 N
 0 631 V
 24 0 V
 0 -631 V
@@ -3317,49 +3321,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3183 512 25 645 BoxColFill
+0.00 0.00 0.00 C 0.180 3153 512 24 645 BoxColFill
 LCb setrgbcolor
-3183 512 N
+3153 512 N
 0 644 V
-24 0 V
+23 0 V
 0 -644 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3217 512 25 703 BoxColFill
+0.00 0.00 0.00 C 0.180 3187 512 24 703 BoxColFill
 LCb setrgbcolor
-3217 512 N
+3187 512 N
 0 702 V
-24 0 V
+23 0 V
 0 -702 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3252 512 25 713 BoxColFill
+0.00 0.00 0.00 C 0.180 3221 512 24 713 BoxColFill
 LCb setrgbcolor
-3252 512 N
+3221 512 N
 0 712 V
-24 0 V
+23 0 V
 0 -712 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3286 512 25 720 BoxColFill
+0.00 0.00 0.00 C 0.180 3255 512 24 720 BoxColFill
 LCb setrgbcolor
-3286 512 N
+3255 512 N
 0 719 V
-24 0 V
+23 0 V
 0 -719 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3320 512 25 725 BoxColFill
+0.00 0.00 0.00 C 0.180 3288 512 25 725 BoxColFill
 LCb setrgbcolor
-3320 512 N
+3288 512 N
 0 724 V
 24 0 V
 0 -724 V
@@ -3367,9 +3371,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3355 512 25 765 BoxColFill
+0.00 0.00 0.00 C 0.180 3322 512 25 765 BoxColFill
 LCb setrgbcolor
-3355 512 N
+3322 512 N
 0 764 V
 24 0 V
 0 -764 V
@@ -3377,9 +3381,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3389 512 25 774 BoxColFill
+0.00 0.00 0.00 C 0.180 3356 512 25 774 BoxColFill
 LCb setrgbcolor
-3389 512 N
+3356 512 N
 0 773 V
 24 0 V
 0 -773 V
@@ -3387,9 +3391,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.180 3423 512 25 781 BoxColFill
+0.00 0.00 0.00 C 0.180 3390 512 25 781 BoxColFill
 LCb setrgbcolor
-3423 512 N
+3390 512 N
+0 780 V
+24 0 V
+0 -780 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C 0.180 3424 512 25 781 BoxColFill
+LCb setrgbcolor
+3424 512 N
 0 780 V
 24 0 V
 0 -780 V
@@ -3435,25 +3449,25 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 608 543 25 1 BoxColFill
+0.90 0.62 0.00 C 0.180 607 543 25 1 BoxColFill
 LCb setrgbcolor
-608 543 N
+607 543 N
 24 0 V
 -24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 642 553 25 1 BoxColFill
+0.90 0.62 0.00 C 0.180 641 553 25 1 BoxColFill
 LCb setrgbcolor
-642 553 N
+641 553 N
 24 0 V
 -24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 676 555 25 22 BoxColFill
+0.90 0.62 0.00 C 0.180 675 555 25 22 BoxColFill
 LCb setrgbcolor
-676 555 N
+675 555 N
 0 21 V
 24 0 V
 0 -21 V
@@ -3461,9 +3475,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 711 548 25 25 BoxColFill
+0.90 0.62 0.00 C 0.180 709 548 25 25 BoxColFill
 LCb setrgbcolor
-711 548 N
+709 548 N
 0 24 V
 24 0 V
 0 -24 V
@@ -3471,9 +3485,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 745 548 25 26 BoxColFill
+0.90 0.62 0.00 C 0.180 743 548 25 26 BoxColFill
 LCb setrgbcolor
-745 548 N
+743 548 N
 0 25 V
 24 0 V
 0 -25 V
@@ -3481,49 +3495,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 779 549 25 30 BoxColFill
+0.90 0.62 0.00 C 0.180 777 549 24 30 BoxColFill
 LCb setrgbcolor
-779 549 N
+777 549 N
 0 29 V
-24 0 V
+23 0 V
 0 -29 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 814 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 811 562 24 41 BoxColFill
 LCb setrgbcolor
-814 562 N
+811 562 N
 0 40 V
-24 0 V
+23 0 V
 0 -40 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 848 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 845 562 24 41 BoxColFill
 LCb setrgbcolor
-848 562 N
+845 562 N
 0 40 V
-24 0 V
+23 0 V
 0 -40 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 882 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 879 562 24 41 BoxColFill
 LCb setrgbcolor
-882 562 N
+879 562 N
 0 40 V
-24 0 V
+23 0 V
 0 -40 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 917 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 912 562 25 41 BoxColFill
 LCb setrgbcolor
-917 562 N
+912 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3531,9 +3545,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 951 562 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 946 562 25 41 BoxColFill
 LCb setrgbcolor
-951 562 N
+946 562 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3541,9 +3555,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 985 563 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 980 563 25 41 BoxColFill
 LCb setrgbcolor
-985 563 N
+980 563 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3551,9 +3565,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1020 639 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1014 639 25 41 BoxColFill
 LCb setrgbcolor
-1020 639 N
+1014 639 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3561,9 +3575,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1054 639 25 41 BoxColFill
+0.90 0.62 0.00 C 0.180 1048 639 25 41 BoxColFill
 LCb setrgbcolor
-1054 639 N
+1048 639 N
 0 40 V
 24 0 V
 0 -40 V
@@ -3571,9 +3585,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1088 672 25 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1082 672 25 48 BoxColFill
 LCb setrgbcolor
-1088 672 N
+1082 672 N
 0 47 V
 24 0 V
 0 -47 V
@@ -3581,9 +3595,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1123 680 25 48 BoxColFill
+0.90 0.62 0.00 C 0.180 1116 680 25 48 BoxColFill
 LCb setrgbcolor
-1123 680 N
+1116 680 N
 0 47 V
 24 0 V
 0 -47 V
@@ -3591,9 +3605,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1157 773 25 50 BoxColFill
+0.90 0.62 0.00 C 0.180 1150 773 25 50 BoxColFill
 LCb setrgbcolor
-1157 773 N
+1150 773 N
 0 49 V
 24 0 V
 0 -49 V
@@ -3601,9 +3615,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1191 775 25 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1184 775 25 51 BoxColFill
 LCb setrgbcolor
-1191 775 N
+1184 775 N
 0 50 V
 24 0 V
 0 -50 V
@@ -3611,9 +3625,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1226 779 25 51 BoxColFill
+0.90 0.62 0.00 C 0.180 1218 779 25 51 BoxColFill
 LCb setrgbcolor
-1226 779 N
+1218 779 N
 0 50 V
 24 0 V
 0 -50 V
@@ -3621,9 +3635,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1260 693 25 52 BoxColFill
+0.90 0.62 0.00 C 0.180 1252 693 25 52 BoxColFill
 LCb setrgbcolor
-1260 693 N
+1252 693 N
 0 51 V
 24 0 V
 0 -51 V
@@ -3631,9 +3645,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1294 724 25 53 BoxColFill
+0.90 0.62 0.00 C 0.180 1286 724 25 53 BoxColFill
 LCb setrgbcolor
-1294 724 N
+1286 724 N
 0 52 V
 24 0 V
 0 -52 V
@@ -3641,9 +3655,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1329 748 25 56 BoxColFill
+0.90 0.62 0.00 C 0.180 1320 748 25 56 BoxColFill
 LCb setrgbcolor
-1329 748 N
+1320 748 N
 0 55 V
 24 0 V
 0 -55 V
@@ -3651,9 +3665,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1363 757 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1354 757 25 57 BoxColFill
 LCb setrgbcolor
-1363 757 N
+1354 757 N
 0 56 V
 24 0 V
 0 -56 V
@@ -3661,49 +3675,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1397 767 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1388 767 24 57 BoxColFill
 LCb setrgbcolor
-1397 767 N
+1388 767 N
 0 56 V
-24 0 V
+23 0 V
 0 -56 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1432 799 25 57 BoxColFill
+0.90 0.62 0.00 C 0.180 1422 799 24 57 BoxColFill
 LCb setrgbcolor
-1432 799 N
+1422 799 N
 0 56 V
-24 0 V
+23 0 V
 0 -56 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1466 828 25 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1456 828 24 66 BoxColFill
 LCb setrgbcolor
-1466 828 N
+1456 828 N
 0 65 V
-24 0 V
+23 0 V
 0 -65 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1500 828 25 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1490 828 24 67 BoxColFill
 LCb setrgbcolor
-1500 828 N
+1490 828 N
 0 66 V
-24 0 V
+23 0 V
 0 -66 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1535 876 25 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1523 876 25 67 BoxColFill
 LCb setrgbcolor
-1535 876 N
+1523 876 N
 0 66 V
 24 0 V
 0 -66 V
@@ -3711,9 +3725,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1569 876 25 67 BoxColFill
+0.90 0.62 0.00 C 0.180 1557 876 25 67 BoxColFill
 LCb setrgbcolor
-1569 876 N
+1557 876 N
 0 66 V
 24 0 V
 0 -66 V
@@ -3721,9 +3735,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1603 883 25 66 BoxColFill
+0.90 0.62 0.00 C 0.180 1591 883 25 66 BoxColFill
 LCb setrgbcolor
-1603 883 N
+1591 883 N
 0 65 V
 24 0 V
 0 -65 V
@@ -3731,9 +3745,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1638 904 25 75 BoxColFill
+0.90 0.62 0.00 C 0.180 1625 904 25 75 BoxColFill
 LCb setrgbcolor
-1638 904 N
+1625 904 N
 0 74 V
 24 0 V
 0 -74 V
@@ -3741,9 +3755,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1672 926 25 78 BoxColFill
+0.90 0.62 0.00 C 0.180 1659 926 25 78 BoxColFill
 LCb setrgbcolor
-1672 926 N
+1659 926 N
 0 77 V
 24 0 V
 0 -77 V
@@ -3751,9 +3765,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1706 952 25 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1693 952 25 87 BoxColFill
 LCb setrgbcolor
-1706 952 N
+1693 952 N
 0 86 V
 24 0 V
 0 -86 V
@@ -3761,9 +3775,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1741 952 25 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1727 952 25 88 BoxColFill
 LCb setrgbcolor
-1741 952 N
+1727 952 N
 0 87 V
 24 0 V
 0 -87 V
@@ -3771,9 +3785,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1775 954 25 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1761 954 25 89 BoxColFill
 LCb setrgbcolor
-1775 954 N
+1761 954 N
 0 88 V
 24 0 V
 0 -88 V
@@ -3781,9 +3795,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1809 978 25 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1795 978 25 89 BoxColFill
 LCb setrgbcolor
-1809 978 N
+1795 978 N
 0 88 V
 24 0 V
 0 -88 V
@@ -3791,9 +3805,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1844 987 25 90 BoxColFill
+0.90 0.62 0.00 C 0.180 1829 987 25 90 BoxColFill
 LCb setrgbcolor
-1844 987 N
+1829 987 N
 0 89 V
 24 0 V
 0 -89 V
@@ -3801,9 +3815,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1878 988 25 91 BoxColFill
+0.90 0.62 0.00 C 0.180 1863 988 25 91 BoxColFill
 LCb setrgbcolor
-1878 988 N
+1863 988 N
 0 90 V
 24 0 V
 0 -90 V
@@ -3811,19 +3825,19 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1912 944 26 89 BoxColFill
+0.90 0.62 0.00 C 0.180 1897 944 25 89 BoxColFill
 LCb setrgbcolor
-1912 944 N
+1897 944 N
 0 88 V
-25 0 V
+24 0 V
 0 -88 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1947 961 25 87 BoxColFill
+0.90 0.62 0.00 C 0.180 1931 961 25 87 BoxColFill
 LCb setrgbcolor
-1947 961 N
+1931 961 N
 0 86 V
 24 0 V
 0 -86 V
@@ -3831,59 +3845,59 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 1981 969 25 88 BoxColFill
+0.90 0.62 0.00 C 0.180 1965 969 24 88 BoxColFill
 LCb setrgbcolor
-1981 969 N
+1965 969 N
 0 87 V
-24 0 V
+23 0 V
 0 -87 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2015 978 26 139 BoxColFill
+0.90 0.62 0.00 C 0.180 1999 978 24 139 BoxColFill
 LCb setrgbcolor
-2015 978 N
+1999 978 N
 0 138 V
-25 0 V
+23 0 V
 0 -138 V
--25 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2050 980 25 157 BoxColFill
+0.90 0.62 0.00 C 0.180 2033 980 24 157 BoxColFill
 LCb setrgbcolor
-2050 980 N
+2033 980 N
 0 156 V
-24 0 V
+23 0 V
 0 -156 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2084 989 25 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2067 989 24 165 BoxColFill
 LCb setrgbcolor
-2084 989 N
+2067 989 N
 0 164 V
-24 0 V
+23 0 V
 0 -164 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2118 999 26 165 BoxColFill
+0.90 0.62 0.00 C 0.180 2100 999 25 165 BoxColFill
 LCb setrgbcolor
-2118 999 N
+2100 999 N
 0 164 V
-25 0 V
+24 0 V
 0 -164 V
--25 0 V
+-24 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2153 1023 25 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2134 1023 25 171 BoxColFill
 LCb setrgbcolor
-2153 1023 N
+2134 1023 N
 0 170 V
 24 0 V
 0 -170 V
@@ -3891,9 +3905,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2187 1028 25 171 BoxColFill
+0.90 0.62 0.00 C 0.180 2168 1028 25 171 BoxColFill
 LCb setrgbcolor
-2187 1028 N
+2168 1028 N
 0 170 V
 24 0 V
 0 -170 V
@@ -3901,9 +3915,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2222 1026 25 173 BoxColFill
+0.90 0.62 0.00 C 0.180 2202 1026 25 173 BoxColFill
 LCb setrgbcolor
-2222 1026 N
+2202 1026 N
 0 172 V
 24 0 V
 0 -172 V
@@ -3911,9 +3925,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2256 1036 25 174 BoxColFill
+0.90 0.62 0.00 C 0.180 2236 1036 25 174 BoxColFill
 LCb setrgbcolor
-2256 1036 N
+2236 1036 N
 0 173 V
 24 0 V
 0 -173 V
@@ -3921,9 +3935,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2290 1037 25 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2270 1037 25 176 BoxColFill
 LCb setrgbcolor
-2290 1037 N
+2270 1037 N
 0 175 V
 24 0 V
 0 -175 V
@@ -3931,9 +3945,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2325 1043 25 176 BoxColFill
+0.90 0.62 0.00 C 0.180 2304 1043 25 176 BoxColFill
 LCb setrgbcolor
-2325 1043 N
+2304 1043 N
 0 175 V
 24 0 V
 0 -175 V
@@ -3941,9 +3955,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2359 1068 25 177 BoxColFill
+0.90 0.62 0.00 C 0.180 2338 1068 25 177 BoxColFill
 LCb setrgbcolor
-2359 1068 N
+2338 1068 N
 0 176 V
 24 0 V
 0 -176 V
@@ -3951,9 +3965,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2393 1075 25 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2372 1075 25 179 BoxColFill
 LCb setrgbcolor
-2393 1075 N
+2372 1075 N
 0 178 V
 24 0 V
 0 -178 V
@@ -3961,9 +3975,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2428 1079 25 179 BoxColFill
+0.90 0.62 0.00 C 0.180 2406 1079 25 179 BoxColFill
 LCb setrgbcolor
-2428 1079 N
+2406 1079 N
 0 178 V
 24 0 V
 0 -178 V
@@ -3971,9 +3985,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2462 1085 25 222 BoxColFill
+0.90 0.62 0.00 C 0.180 2440 1085 25 222 BoxColFill
 LCb setrgbcolor
-2462 1085 N
+2440 1085 N
 0 221 V
 24 0 V
 0 -221 V
@@ -3981,9 +3995,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2496 1088 25 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2474 1088 25 225 BoxColFill
 LCb setrgbcolor
-2496 1088 N
+2474 1088 N
 0 224 V
 24 0 V
 0 -224 V
@@ -3991,9 +4005,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2531 1091 25 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2508 1091 25 224 BoxColFill
 LCb setrgbcolor
-2531 1091 N
+2508 1091 N
 0 223 V
 24 0 V
 0 -223 V
@@ -4001,49 +4015,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2565 1094 25 224 BoxColFill
+0.90 0.62 0.00 C 0.180 2542 1094 24 224 BoxColFill
 LCb setrgbcolor
-2565 1094 N
+2542 1094 N
 0 223 V
-24 0 V
+23 0 V
 0 -223 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2599 1102 25 225 BoxColFill
+0.90 0.62 0.00 C 0.180 2576 1102 24 225 BoxColFill
 LCb setrgbcolor
-2599 1102 N
+2576 1102 N
 0 224 V
-24 0 V
+23 0 V
 0 -224 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2634 1202 25 226 BoxColFill
+0.90 0.62 0.00 C 0.180 2610 1202 24 226 BoxColFill
 LCb setrgbcolor
-2634 1202 N
+2610 1202 N
 0 225 V
-24 0 V
+23 0 V
 0 -225 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2668 1136 25 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2644 1136 24 229 BoxColFill
 LCb setrgbcolor
-2668 1136 N
+2644 1136 N
 0 228 V
-24 0 V
+23 0 V
 0 -228 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2702 1132 25 231 BoxColFill
+0.90 0.62 0.00 C 0.180 2677 1132 25 231 BoxColFill
 LCb setrgbcolor
-2702 1132 N
+2677 1132 N
 0 230 V
 24 0 V
 0 -230 V
@@ -4051,9 +4065,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2737 1135 25 232 BoxColFill
+0.90 0.62 0.00 C 0.180 2711 1135 25 232 BoxColFill
 LCb setrgbcolor
-2737 1135 N
+2711 1135 N
 0 231 V
 24 0 V
 0 -231 V
@@ -4061,9 +4075,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2771 1132 25 229 BoxColFill
+0.90 0.62 0.00 C 0.180 2745 1132 25 229 BoxColFill
 LCb setrgbcolor
-2771 1132 N
+2745 1132 N
 0 228 V
 24 0 V
 0 -228 V
@@ -4071,9 +4085,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2805 1132 25 230 BoxColFill
+0.90 0.62 0.00 C 0.180 2779 1132 25 230 BoxColFill
 LCb setrgbcolor
-2805 1132 N
+2779 1132 N
 0 229 V
 24 0 V
 0 -229 V
@@ -4081,9 +4095,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2840 1131 25 233 BoxColFill
+0.90 0.62 0.00 C 0.180 2813 1131 25 233 BoxColFill
 LCb setrgbcolor
-2840 1131 N
+2813 1131 N
 0 232 V
 24 0 V
 0 -232 V
@@ -4091,9 +4105,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2874 1140 25 241 BoxColFill
+0.90 0.62 0.00 C 0.180 2847 1140 25 241 BoxColFill
 LCb setrgbcolor
-2874 1140 N
+2847 1140 N
 0 240 V
 24 0 V
 0 -240 V
@@ -4101,9 +4115,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2908 1122 25 244 BoxColFill
+0.90 0.62 0.00 C 0.180 2881 1122 25 244 BoxColFill
 LCb setrgbcolor
-2908 1122 N
+2881 1122 N
 0 243 V
 24 0 V
 0 -243 V
@@ -4111,9 +4125,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2943 1125 25 345 BoxColFill
+0.90 0.62 0.00 C 0.180 2915 1125 25 345 BoxColFill
 LCb setrgbcolor
-2943 1125 N
+2915 1125 N
 0 344 V
 24 0 V
 0 -344 V
@@ -4121,9 +4135,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 2977 1107 25 256 BoxColFill
+0.90 0.62 0.00 C 0.180 2949 1107 25 256 BoxColFill
 LCb setrgbcolor
-2977 1107 N
+2949 1107 N
 0 255 V
 24 0 V
 0 -255 V
@@ -4131,9 +4145,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3011 1105 25 246 BoxColFill
+0.90 0.62 0.00 C 0.180 2983 1105 25 246 BoxColFill
 LCb setrgbcolor
-3011 1105 N
+2983 1105 N
 0 245 V
 24 0 V
 0 -245 V
@@ -4141,9 +4155,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3046 1110 25 250 BoxColFill
+0.90 0.62 0.00 C 0.180 3017 1110 25 250 BoxColFill
 LCb setrgbcolor
-3046 1110 N
+3017 1110 N
 0 249 V
 24 0 V
 0 -249 V
@@ -4151,9 +4165,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3080 1131 25 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3051 1131 25 251 BoxColFill
 LCb setrgbcolor
-3080 1131 N
+3051 1131 N
 0 250 V
 24 0 V
 0 -250 V
@@ -4161,9 +4175,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3114 1134 25 251 BoxColFill
+0.90 0.62 0.00 C 0.180 3085 1134 25 251 BoxColFill
 LCb setrgbcolor
-3114 1134 N
+3085 1134 N
 0 250 V
 24 0 V
 0 -250 V
@@ -4171,9 +4185,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3149 1143 25 258 BoxColFill
+0.90 0.62 0.00 C 0.180 3119 1143 25 258 BoxColFill
 LCb setrgbcolor
-3149 1143 N
+3119 1143 N
 0 257 V
 24 0 V
 0 -257 V
@@ -4181,49 +4195,49 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3183 1156 25 261 BoxColFill
+0.90 0.62 0.00 C 0.180 3153 1156 24 261 BoxColFill
 LCb setrgbcolor
-3183 1156 N
+3153 1156 N
 0 260 V
-24 0 V
+23 0 V
 0 -260 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3217 1214 25 267 BoxColFill
+0.90 0.62 0.00 C 0.180 3187 1214 24 267 BoxColFill
 LCb setrgbcolor
-3217 1214 N
+3187 1214 N
 0 266 V
-24 0 V
+23 0 V
 0 -266 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3252 1224 25 314 BoxColFill
+0.90 0.62 0.00 C 0.180 3221 1224 24 314 BoxColFill
 LCb setrgbcolor
-3252 1224 N
+3221 1224 N
 0 313 V
-24 0 V
+23 0 V
 0 -313 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3286 1231 25 320 BoxColFill
+0.90 0.62 0.00 C 0.180 3255 1231 24 320 BoxColFill
 LCb setrgbcolor
-3286 1231 N
+3255 1231 N
 0 319 V
-24 0 V
+23 0 V
 0 -319 V
--24 0 V
+-23 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3320 1236 25 324 BoxColFill
+0.90 0.62 0.00 C 0.180 3288 1236 25 324 BoxColFill
 LCb setrgbcolor
-3320 1236 N
+3288 1236 N
 0 323 V
 24 0 V
 0 -323 V
@@ -4231,9 +4245,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3355 1276 25 364 BoxColFill
+0.90 0.62 0.00 C 0.180 3322 1276 25 364 BoxColFill
 LCb setrgbcolor
-3355 1276 N
+3322 1276 N
 0 363 V
 24 0 V
 0 -363 V
@@ -4241,9 +4255,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3389 1285 25 386 BoxColFill
+0.90 0.62 0.00 C 0.180 3356 1285 25 386 BoxColFill
 LCb setrgbcolor
-3389 1285 N
+3356 1285 N
 0 385 V
 24 0 V
 0 -385 V
@@ -4251,9 +4265,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3423 1292 25 403 BoxColFill
+0.90 0.62 0.00 C 0.180 3390 1292 25 403 BoxColFill
 LCb setrgbcolor
-3423 1292 N
+3390 1292 N
 0 402 V
 24 0 V
 0 -402 V
@@ -4261,9 +4275,9 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.180 3458 1292 25 417 BoxColFill
+0.90 0.62 0.00 C 0.180 3424 1292 25 417 BoxColFill
 LCb setrgbcolor
-3458 1292 N
+3424 1292 N
 0 416 V
 24 0 V
 0 -416 V
@@ -4271,6 +4285,16 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
+0.90 0.62 0.00 C 0.180 3458 1292 25 418 BoxColFill
+LCb setrgbcolor
+3458 1292 N
+0 417 V
+24 0 V
+0 -417 V
+-24 0 V
+Z stroke
+1.000 UL
+LTb
 0.90 0.62 0.00 C % End plot #2
 % Begin plot #3
 1.000 UL
@@ -4284,90 +4308,91 @@ LTb
 0.55 0.00 0.00 C 2092 1457 M
 255 0 V
 585 512 M
-35 0 V
+34 0 V
 34 0 V
 34 778 V
-35 193 V
+34 193 V
 34 -5 V
 34 87 V
-35 29 V
-34 3 V
+34 29 V
+33 3 V
 34 0 V
-35 -5 V
+34 -5 V
 34 0 V
 34 -17 V
-35 -483 V
+34 -483 V
 34 2 V
 34 -38 V
-35 -20 V
+34 -20 V
 34 -140 V
 34 0 V
-35 -5 V
+34 -5 V
 34 150 V
 34 -51 V
-35 -17 V
+34 -17 V
 34 -14 V
 34 -15 V
-35 -38 V
-34 24 V
+34 -38 V
+33 24 V
 34 -2 V
-35 -46 V
+34 -46 V
 34 0 V
 34 -8 V
-35 20 V
+34 20 V
 34 -3 V
 34 17 V
-35 3 V
+34 3 V
 34 4 V
 34 -21 V
-35 0 V
+34 0 V
 34 0 V
 34 26 V
-35 -19 V
+34 -19 V
 34 -5 V
-35 169 V
-34 51 V
+34 169 V
+33 51 V
 34 14 V
-35 -7 V
+34 -7 V
 34 -7 V
 34 -5 V
-35 5 V
+34 5 V
 34 -5 V
 34 5 V
-35 -2 V
+34 -2 V
 34 -22 V
 34 0 V
-35 -3 V
+34 -3 V
 34 95 V
 34 2 V
-35 -2 V
+34 -2 V
 34 -3 V
 34 -5 V
-35 -70 V
+33 -70 V
 34 53 V
 34 8 V
-35 -3 V
+34 -3 V
 34 -2 V
 34 2 V
-35 5 V
+34 5 V
 34 12 V
 34 22 V
-35 176 V
+34 176 V
 34 -142 V
 34 -20 V
-35 5 V
+34 5 V
 34 -14 V
 34 -3 V
-35 5 V
+34 5 V
 34 -2 V
 34 -29 V
-35 72 V
+33 72 V
 34 3 V
 34 5 V
-35 31 V
+34 31 V
 34 24 V
 34 19 V
-35 20 V
+34 20 V
+34 2 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 24aa9daa..a929dead 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -82,4 +82,5 @@ v5.8  17424 6627 24051 27.6
 v5.12 18965 9025 27990 32.2
 ""    19205 9556 28761 33.2
 ""    19362 9983 29345 34.0
-v5.15 19366 10332 29698 34.8
+""    19366 10332 29698 34.8
+v5.16 19359 10362 29721 34.9
-- 
2.17.1


