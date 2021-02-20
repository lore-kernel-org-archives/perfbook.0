Return-Path: <SRS0=aA8C=HW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1OUTUIx/OdTu6CeF7GQdEd51daVi50ldONCibYGl1+Y=;
        b=MN4aFgmGzFDLnA6PQF/5rGwLR2+jQbuWpF3LvUfynPLIaoSf2TDXlxJXV/0y5XS7BZ
         5pHaNMeETfyA5Ce+lDXoBkAc8hqpQ41BSxVdf1wfNxBRO3yxBCx1Yq8ZiqhJSS455CX+
         8u18fuikjpNuOaY28KsbNKoxWH3FQvLGIcqsH22nmVorbKeqjjrfuS3g1RikJKCc9dot
         wBh7dyyU9pvCLPIT5bme5vCcWKErBQcCHP3qeJnUclzqdVKpVY3ckA3TOQ4NAXeJUJGz
         3s56jx1BhQcj4lFhJoeoYTuRNORWA62lgabY8ZojQBcwRYsmiGjwXHpjM+LsoMnSodFt
         SVrw==
Subject: [PATCH -perfbook 3/3] datastruct: Shorten X label of cat-only lookup
 performance plot
References: <6a73f889-005e-e8a9-c015-afeb31353b56@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <797f956b-1353-0da1-3dfe-790e7d6615c7@gmail.com>
Date: Sun, 21 Feb 2021 00:20:09 +0900
MIME-Version: 1.0
In-Reply-To: <6a73f889-005e-e8a9-c015-afeb31353b56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Removing "(Threads)" allows these labels to fit the the plot-area.

Plots in the other subdirectories are not touched.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../hash/data/hps.perf.2020.11.26a/perftest.eps        |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/perftestlin.eps     |  4 ++--
 .../datastruct/hash/data/hps.perf.2020.11.26a/plots.sh | 10 +++++-----
 .../data/hps.perf.2020.11.26a/zoocatall-unsync.eps     |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/zoocatall.eps       |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/zoocatalllin.eps    |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/zoocatonly.eps      |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/zoocatonlylin.eps   |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/zoocpu-unsync.eps   |  4 ++--
 .../data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps     |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpu.eps          |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpubktlin.eps    |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpubktlin8.eps   |  4 ++--
 .../data/hps.perf.2020.11.26a/zoocpubktsizelin.eps     |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpulin.eps       |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zoocpulinqsbr.eps   |  4 ++--
 .../data/hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps  |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zooupdate.eps       |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zooupdatelu.eps     |  4 ++--
 .../hash/data/hps.perf.2020.11.26a/zooupdatelulin.eps  |  4 ++--
 20 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftest.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftest.eps
index 89aba0fb..cdec71fa 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftest.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftest.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: perftest.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftestlin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftestlin.eps
index 2c4be05e..94f3529a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftestlin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/perftestlin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: perftestlin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
index 5d6ab75a..11b7d4d3 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
@@ -236,7 +236,7 @@ gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
 set size square ${plotsize},${plotsize}
 set output "zoocatall.eps"
-set xlabel "Number of CPUs (Threads) Looking Up The Cat"
+set xlabel "Number of CPUs Looking Up The Cat"
 set ylabel "Total Lookups per Millisecond"
 set logscale xy
 #set yrange [1:10000]
@@ -254,7 +254,7 @@ gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
 set size square ${plotsize},${plotsize}
 set output "zoocatalllin.eps"
-set xlabel "Number of CPUs (Threads) Looking Up The Cat"
+set xlabel "Number of CPUs Looking Up The Cat"
 set ylabel "Total Lookups per Millisecond"
 #set logscale xy
 #set yrange [1:10000]
@@ -272,7 +272,7 @@ gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
 set size square ${plotsize},${plotsize}
 set output "zoocatall-unsync.eps"
-set xlabel "Number of CPUs (Threads) Looking Up The Cat"
+set xlabel "Number of CPUs Looking Up The Cat"
 set ylabel "Total Lookups per Millisecond"
 set logscale xy
 #set yrange [1:10000]
@@ -291,7 +291,7 @@ gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
 set size square ${plotsize},${plotsize}
 set output "zoocatonly.eps"
-set xlabel "Number of CPUs (Threads) Looking Up The Cat"
+set xlabel "Number of CPUs Looking Up The Cat"
 set ylabel "Cat Lookups per Millisecond"
 set logscale xy
 #set yrange [1:10000]
@@ -309,7 +309,7 @@ gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
 set size square ${plotsize},${plotsize}
 set output "zoocatonlylin.eps"
-set xlabel "Number of CPUs (Threads) Looking Up The Cat"
+set xlabel "Number of CPUs Looking Up The Cat"
 set ylabel "Cat Lookups per Millisecond"
 #set logscale xy
 #set yrange [1:10000]
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall-unsync.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall-unsync.eps
index 3de41316..13fe8753 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall-unsync.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall-unsync.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocatall-unsync.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2218,7 +2218,7 @@ grestore
 LTb
 LCb setrgbcolor
 1504 825 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\) Looking Up The Cat)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs Looking Up The Cat)]
 ] -33.3 MCshow
 LTb
 % Begin plot #1
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps
index a6295c11..86b97f0a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatall.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocatall.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2214,7 +2214,7 @@ grestore
 LTb
 LCb setrgbcolor
 1504 825 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\) Looking Up The Cat)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs Looking Up The Cat)]
 ] -33.3 MCshow
 LTb
 % Begin plot #1
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatalllin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatalllin.eps
index 57c32e73..739cec6a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatalllin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatalllin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocatalllin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2166,7 +2166,7 @@ grestore
 LTb
 LCb setrgbcolor
 1504 825 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\) Looking Up The Cat)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs Looking Up The Cat)]
 ] -33.3 MCshow
 LTb
 % Begin plot #1
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonly.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonly.eps
index 45e21f40..125c303a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonly.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonly.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocatonly.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2300,7 +2300,7 @@ grestore
 LTb
 LCb setrgbcolor
 1504 825 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\) Looking Up The Cat)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs Looking Up The Cat)]
 ] -33.3 MCshow
 LTb
 % Begin plot #1
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonlylin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonlylin.eps
index fc9a0eff..b6e71ce6 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonlylin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocatonlylin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocatonlylin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2162,7 +2162,7 @@ grestore
 LTb
 LCb setrgbcolor
 1504 825 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\) Looking Up The Cat)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs Looking Up The Cat)]
 ] -33.3 MCshow
 LTb
 % Begin plot #1
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsync.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsync.eps
index 0270bf06..35f16b19 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsync.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsync.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpu-unsync.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps
index 7fdcc108..303b88ab 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu-unsynclin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpu-unsynclin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu.eps
index 0f149c49..b6812ecc 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpu.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpu.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin.eps
index 399f68ff..f6b2d631 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpubktlin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin8.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin8.eps
index c5df471d..2644df6c 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin8.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktlin8.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpubktlin8.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktsizelin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktsizelin.eps
index cf21c090..cd8f341a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktsizelin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpubktsizelin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpubktsizelin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulin.eps
index b4e40dbd..9cfab2a7 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpulin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbr.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbr.eps
index 1e2c121d..a2dee4c4 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbr.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbr.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpulinqsbr.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps
index 593a8f1e..1f452a23 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zoocpulinqsbrunsync.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zoocpulinqsbrunsync.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdate.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdate.eps
index 1c091c99..ac767eff 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdate.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdate.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zooupdate.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelu.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelu.eps
index 6c560af7..8def236a 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelu.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelu.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zooupdatelu.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelulin.eps b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelulin.eps
index 46172fb6..34e1f5d2 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelulin.eps
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/zooupdatelulin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: zooupdatelulin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Dec 28 16:51:52 2020
+%%CreationDate: Sat Feb 20 18:10:20 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Dec 28 16:51:52 2020)
+  /CreationDate (Sat Feb 20 18:10:20 2021)
   /DOCINFO pdfmark
 end
 } ifelse
-- 
2.17.1


