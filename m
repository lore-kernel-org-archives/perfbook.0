Return-Path: <SRS0=Xarl=OB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TGeuQ855SWSVRMt8onsCdgmTEUPUwIkgpVfX6d6NBbM=;
        b=RTeqSMYMdVugxzshFS9ENJ0vB42TLeRKkSIq5N4gFwOL41JJvISZ3f6ZJx7HZbFBPG
         Gqt5e0ekMDuRSqOYFcpf2/I2MbJIsKHHDyB0YYOq3JvtRb8lNmiuAAXR64oa0y/2+QbN
         FbMwwT6+fLHEMb5D/bBfctavqX7b3toUPBRNrfHgFZoRO42JxwxBgk2UmB6Jz+FHk15P
         n/jRhDvgAF25R5OWIN8LkYNfXmhDjccRrtIFQDdyfps+htl6/lkm7DLObBBaV4eBAX2k
         AC33F4D0d0kRUyIQab335nOjgyYF8grt7GCphNudixurB1dHDPTRNO+TbNvk1OkYcAK6
         ZAxg==
Subject: [PATCH -perfbook 2/2] defer: Restore change of trace labels from
 'rcu' to 'RCU'
References: <72178e63-faf4-0853-1243-1bae45cbdd5f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <552c29bd-e1b4-f26b-ad5e-f17b8944f70d@gmail.com>
Date: Sat, 11 Sep 2021 23:25:38 +0900
MIME-Version: 1.0
In-Reply-To: <72178e63-faf4-0853-1243-1bae45cbdd5f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Several .eps files under defer/ removed by commit d49e63354d45
("defer: Mark directories of unused data, take 2") had label
strings updated in commit 2a2ca773005f ("Change trace labels from
"rcu" to "RCU"").

.eps files under CodeSamples/, to which \includegraphics{} commands now
point, were not updated by 2a2ca773005f.

Update those files by running the plots.sh script which was updated in
2a2ca773005f.

Fixes: d49e63354d45 ("defer: Mark directories of unused data, take 2")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperf.eps     | 6 +++---
 .../rcuscale.hps.2020.05.28a/prz-rwlockRCUperfPREEMPT.eps   | 6 +++---
 .../data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwt.eps   | 6 +++---
 .../rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwtlin.eps     | 6 +++---
 .../data/rcuscale.hps.2020.05.28a/rwlockRCUperf-pc.eps      | 6 +++---
 .../defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf.eps   | 6 +++---
 .../data/rcuscale.hps.2020.05.28a/rwlockRCUperfPREEMPT.eps  | 6 +++---
 .../defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwt.eps | 6 +++---
 .../data/rcuscale.hps.2020.05.28a/rwlockRCUperfwtlin.eps    | 6 +++---
 9 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperf.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperf.eps
index 463ac72d..82128a39 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperf.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperf.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: prz-rwlockRCUperf.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Wed Jun  3 17:47:09 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 352 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Wed Jun  3 17:47:09 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2252,7 +2252,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 2055 859 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1199 1390 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfPREEMPT.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfPREEMPT.eps
index 4caccce6..a0b67c65 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfPREEMPT.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfPREEMPT.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: prz-rwlockRCUperfPREEMPT.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Sun May 31 13:34:10 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 352 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Sun May 31 13:34:10 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2209,7 +2209,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 2055 649 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1199 1312 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwt.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwt.eps
index 8305624b..228217b1 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwt.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwt.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: prz-rwlockRCUperfwt.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Jun  1 14:36:59 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 352 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Jun  1 14:36:59 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2170,7 +2170,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1330 642 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 954 1219 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwtlin.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwtlin.eps
index 4928aa71..f447b2a5 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwtlin.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/prz-rwlockRCUperfwtlin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: prz-rwlockRCUperfwtlin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Jun  1 14:36:59 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 352 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Jun  1 14:36:59 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2050,7 +2050,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1258 596 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 643 784 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf-pc.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf-pc.eps
index 2b6f97ea..55628b47 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf-pc.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf-pc.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: rwlockRCUperf-pc.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Fri May 29 12:54:14 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Fri May 29 12:54:14 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2252,7 +2252,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1471 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2325 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf.eps
index 4b17fffc..df59742b 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperf.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: rwlockRCUperf.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Wed Jun  3 17:47:09 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Wed Jun  3 17:47:09 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2252,7 +2252,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1721 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2386 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfPREEMPT.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfPREEMPT.eps
index c5d088fc..33d97264 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfPREEMPT.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfPREEMPT.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: rwlockRCUperfPREEMPT.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Fri May 29 12:54:14 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Fri May 29 12:54:14 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2209,7 +2209,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1458 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2288 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwt.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwt.eps
index e6dd6840..6c4b2816 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwt.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwt.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: rwlockRCUperfwt.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Jun  1 14:36:59 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Jun  1 14:36:59 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2170,7 +2170,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1189 1454 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 888 2188 M
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwtlin.eps b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwtlin.eps
index 62842304..f26830c5 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwtlin.eps
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/rwlockRCUperfwtlin.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: rwlockRCUperfwtlin.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Mon Jun  1 14:36:59 2020
+%%CreationDate: Sat Sep 11 14:55:10 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Mon Jun  1 14:36:59 2020)
+  /CreationDate (Sat Sep 11 14:55:10 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2050,7 +2050,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1111 1391 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 636 1626 M
-- 
2.17.1


