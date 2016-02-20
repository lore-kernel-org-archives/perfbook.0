Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:36537 "EHLO
 mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1948978AbcBTIwT (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 20
 Feb 2016 03:52:19 -0500
Received: by mail-pf0-f178.google.com with SMTP id e127so64518053pfe.3 for
 <perfbook@vger.kernel.org>; Sat, 20 Feb 2016 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=mjXX+BhKx+scbeNCtIf8EfL/DkT+EQ5Q4Lh2aF8/cEs=;
 b=D5COaHvyryj1fnQLqA/1eTyARaNzLELjtvJT/91niGBEc0ZVNUnLN/RT9iqqifwcCx
 8d0bpMX4AUYlByxmxvwJ4IQAwobeCc0yABMJ8K+yYVALlQlnq4YDkNoy/rbbWcAN7aPc
 2Jt8Eo0QHgm1q99OOaDWRvI9vN7sw9iFHyQldDiHHQ5z3J/aPy2IzzRNRdVgdoA9YqMF
 A3y366fzcbDb2Y8Qx5DZx5Bcx4z36Hnd+MqyhxVQ0UoFpKdVqKQesaZr7XlKL/wT5jKg
 Cg6ylBbYLTRBeSDqLkWiUlXL4TqVgPfB5U9HBfbRnY9Zk2bNASsYxFd3X/EpdgB7AAOp
 PE+w==
From: Hitoshi Mitake <mitake.hitoshi@gmail.com>
Subject: [PATCH 1/2] Improve the figure of QSBR
Date: Sat, 20 Feb 2016 17:52:01 +0900
Message-Id: <1455958322-25225-1-git-send-email-mitake.hitoshi@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: mitake.hitoshi@gmail.com

This commit improves the description of QSBR figure. It would make
understanding of how context switch and run_on() in the pseudo code
relate a little bit easier.

Signed-off-by: Hitoshi Mitake <mitake.hitoshi@gmail.com>
---
 defer/QSBRGracePeriod.eps | 56 ++++++++++++++++++++++++++++++++++++++---------
 defer/QSBRGracePeriod.fig | 36 ++++++++++++++++++++----------
 2 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/defer/QSBRGracePeriod.eps b/defer/QSBRGracePeriod.eps
index 1d7a97e..6895f40 100644
--- a/defer/QSBRGracePeriod.eps
+++ b/defer/QSBRGracePeriod.eps
@@ -1,8 +1,8 @@
-%!PS-Adobe-2.0 EPSF-2.0
+%!PS-Adobe-3.0 EPSF-3.0
 %%Title: QSBRGracePeriod.fig
-%%Creator: fig2dev Version 3.2 Patchlevel 5c
-%%CreationDate: Thu May 19 06:58:39 2011
-%%BoundingBox: 0 0 221 250
+%%Creator: fig2dev Version 3.2 Patchlevel 5e
+%%CreationDate: Sat Feb 20 17:39:00 2016
+%%BoundingBox: 0 0 232 250
 %Magnification: 1.0000
 %%EndComments
 %%BeginProlog
@@ -94,8 +94,8 @@ end

 /pageheader {
 save
-newpath 0 250 moveto 0 0 lineto 221 0 lineto 221 250 lineto closepath clip newpath
--1.7 259.1 translate
+newpath 0 250 moveto 0 0 lineto 232 0 lineto 232 250 lineto closepath clip newpath
+-0.0 259.1 translate
 1 -1 scale
 $F2psBegin
 10 setmiterlimit
@@ -200,6 +200,33 @@ n 1200 3450 m

 % arrowhead
 n 847 3649 m 764 3741 l 880 3699 l  col0 s
+% Polyline
+gs  clippath
+1370 1848 m 1245 1933 l 1279 1983 l 1404 1897 l 1404 1897 l 1289 1941 l 1370 1848 l cp
+eoclip
+n 2250 1275 m
+ 1275 1950 l gs col0 s gr gr
+
+% arrowhead
+n 1370 1848 m 1289 1941 l 1404 1897 l  col0 s
+% Polyline
+gs  clippath
+2213 3140 m 2311 3255 l 2357 3216 l 2258 3101 l 2258 3101 l 2314 3212 l 2213 3140 l cp
+eoclip
+n 1875 2700 m
+ 2325 3225 l gs col0 s gr gr
+
+% arrowhead
+n 2213 3140 m 2314 3212 l 2258 3101 l  col0 s
+% Polyline
+gs  clippath
+1585 2406 m 1734 2432 l 1744 2372 l 1595 2347 l 1595 2347 l 1709 2397 l 1585 2406 l cp
+eoclip
+n 1275 2325 m
+ 1725 2400 l gs col0 s gr gr
+
+% arrowhead
+n 1585 2406 m 1709 2397 l 1595 2347 l  col0 s
 /NimbusSanL-Regu ff 150.00 scf sf
 2550 1200 m
 gs 1 -1 sc (Context Switch) col0 sh gr
@@ -227,6 +254,15 @@ gs 1 -1 sc  90.0 rot (list_del\(\)) col0 sh gr
 /NimbusMonL-Regu-Bold ff 150.00 scf sf
 675 3750 m
 gs 1 -1 sc  90.0 rot (free\(\)) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 100.00 scf sf
+1275 1500 m
+gs 1 -1 sc (run_on\(1\)) col0 sh gr
+/NimbusSanL-Regu ff 100.00 scf sf
+1350 2325 m
+gs 1 -1 sc (run_on\(2\)) col0 sh gr
+/NimbusSanL-Regu ff 100.00 scf sf
+1950 2700 m
+gs 1 -1 sc (run_on\(3\)) col0 sh gr
 % Ellipse
 n 2400 3375 75 75 0 360 DrawEllipse gs col28 1.00 shd ef gr gs col0 s gr

@@ -242,12 +278,12 @@ n 1800 2550 75 75 0 360 DrawEllipse gs col28 1.00 shd ef gr gs col0 s gr
 % Polyline
 15.000 slw
  [60] 0 sd
-n 600 2100 m
- 2625 2100 l gs col28 s gr  [] 0 sd
-% Polyline
- [60] 0 sd
 n 600 3450 m
  2625 3450 l gs col2 s gr  [] 0 sd
+% Polyline
+ [60] 0 sd
+n 600 2100 m
+ 2625 2100 l gs col28 s gr  [] 0 sd
 % here ends figure;
 pagefooter
 showpage
diff --git a/defer/QSBRGracePeriod.fig b/defer/QSBRGracePeriod.fig
index 3bee0de..77b232a 100644
--- a/defer/QSBRGracePeriod.fig
+++ b/defer/QSBRGracePeriod.fig
@@ -1,4 +1,4 @@
-#FIG 3.2  Produced by xfig version 3.2.5b
+#FIG 3.2  Produced by xfig version 3.2.5c
 Landscape
 Center
 Inches
@@ -28,8 +28,6 @@ Single
 	 1200 900 1200 3900
 2 2 0 1 0 3 50 -1 20 0.000 0 0 -1 0 0 5
 	 1200 2550 1275 2550 1275 2850 1200 2850 1200 2550
-2 1 1 2 28 7 49 -1 -1 4.000 0 0 -1 0 0 2
-	 600 2100 2625 2100
 2 1 1 2 2 7 49 -1 -1 4.000 0 0 -1 0 0 2
 	 600 3450 2625 3450
 2 1 0 1 0 7 50 -1 -1 0.000 0 0 -1 1 1 2
@@ -49,12 +47,26 @@ Single
 2 1 0 1 0 7 50 -1 -1 0.000 0 0 -1 1 0 2
 	0 0 1.00 60.00 120.00
 	 1200 3450 750 3750
-4 0 0 50 -1 16 9 0.0000 4 120 1110 2550 1200 Context Switch\001
-4 0 0 50 -1 16 9 0.0000 4 120 480 2550 1725 Reader\001
-4 1 0 50 -1 16 9 1.5708 4 120 900 750 2700 Grace Period\001
-4 1 0 50 -1 16 9 0.0000 4 120 480 1200 825 CPU 1\001
-4 1 0 50 -1 16 9 0.0000 4 120 480 1800 825 CPU 2\001
-4 1 0 50 -1 16 9 0.0000 4 120 480 2400 825 CPU 3\001
-4 0 0 50 -1 14 9 1.5708 4 105 1440 150 1650 wait for readers\001
-4 0 0 50 -1 14 9 1.5708 4 135 900 525 1350 list_del()\001
-4 2 0 50 -1 14 9 1.5708 4 120 540 675 3750 free()\001
+2 1 0 1 0 7 50 -1 -1 0.000 0 0 -1 1 0 2
+	0 0 1.00 60.00 120.00
+	 2250 1275 1275 1950
+2 1 0 1 0 7 50 -1 -1 0.000 0 0 -1 1 0 2
+	0 0 1.00 60.00 120.00
+	 1875 2700 2325 3225
+2 1 0 1 0 7 50 -1 -1 0.000 0 0 -1 1 0 2
+	0 0 1.00 60.00 120.00
+	 1275 2325 1725 2400
+2 1 1 2 28 7 49 -1 -1 4.000 0 0 -1 0 0 2
+	 600 2100 2625 2100
+4 0 0 50 -1 16 9 0.0000 4 135 1260 2550 1200 Context Switch\001
+4 0 0 50 -1 16 9 0.0000 4 135 540 2550 1725 Reader\001
+4 1 0 50 -1 16 9 1.5708 4 135 1080 750 2700 Grace Period\001
+4 1 0 50 -1 16 9 0.0000 4 135 450 1200 825 CPU 1\001
+4 1 0 50 -1 16 9 0.0000 4 135 450 1800 825 CPU 2\001
+4 1 0 50 -1 16 9 0.0000 4 135 450 2400 825 CPU 3\001
+4 0 0 50 -1 14 9 1.5708 4 135 1440 150 1650 wait for readers\001
+4 0 0 50 -1 14 9 1.5708 4 165 900 525 1350 list_del()\001
+4 2 0 50 -1 14 9 1.5708 4 165 540 675 3750 free()\001
+4 0 0 50 -1 0 6 0.0000 4 165 810 1275 1500 run_on(1)\001
+4 0 0 50 -1 0 6 0.0000 4 165 810 1350 2325 run_on(2)\001
+4 0 0 50 -1 0 6 0.0000 4 165 810 1950 2700 run_on(3)\001
-- 
1.9.1

