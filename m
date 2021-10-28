Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0CevqBcEQJ4Go3uVErcMrnK4Ayo0W4gjxKV7PaGJn20=;
        b=cdd2bGx8eK6fvucehjJpB29pbTSp63Q9A7nuLnbQbr3GRIWRXLo7Gb4snqQi8Ht1Ly
         +xhA7/LO+JgJaqP892QGIz4jc1WJp7f2LNDz4wcmlbwhN2JRCbaKUTot+2L2HNxShB84
         WXXnuutLN1jqAT0n+HlFymLdQebNI+bsxBe8OAHjpUQMO0IfltS1bOienvjiidVcwJSf
         DEyYFIf5Y5ENbCaRftsH4WCnsWN4vf/jpHWDui++yv1/07RrG/Qtd9tKp5hqTVx2VD59
         16+Vz0vFpLw4QHAD+dwXZu0/f8Q/phY+v19zw4yEfhk6XfllWXhYL4L7XD7BWwAdeC+0
         nKgg==
Subject: [PATCH -perfbook 3/5] datastruct: Use consistent dash type in Figures
 10.19 and E.7
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <37f535c0-7fa3-95d7-1003-18dfe59e8819@gmail.com>
Date: Thu, 28 Oct 2021 09:16:36 +0900
MIME-Version: 1.0
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Use solid lines for traces of resizable hash tables.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../data/hps.resize.2020.09.05a/perftestresize.eps | 10 +++++-----
 .../data/hps.resize.2020.09.05a/plots-resize.sh    | 12 ++++++------
 .../hps.resize.2020.09.27a/perftestresizebig.eps   | 10 +++++-----
 .../data/hps.resize.2020.09.27a/plots-resize.sh    | 14 +++++++-------
 4 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/perftestresize.eps b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/perftestresize.eps
index be3e621f..31d609e4 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/perftestresize.eps
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/perftestresize.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: perftestresize.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Sat Sep 26 14:47:30 2020
+%%CreationDate: Fri Oct 22 17:49:45 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Sat Sep 26 14:47:30 2020)
+  /CreationDate (Fri Oct 22 17:49:45 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2247,6 +2247,7 @@ LTb
 % Begin plot #1
 1.000 UL
 LTb
+LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 /vshift -33 def
@@ -2308,7 +2309,6 @@ LCb setrgbcolor
 % Begin plot #2
 stroke
 LTb
-LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1161 M
@@ -2430,7 +2430,7 @@ LCb setrgbcolor
 % Begin plot #4
 stroke
 LTb
-LT3
+LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1576 M
@@ -2553,7 +2553,7 @@ LCb setrgbcolor
 stroke
 1.200 UL
 LTb
-[8.0 dl1 4.0 dl2 1.0 dl1 2.5 dl2 1.0 dl1 2.5 dl2 1.0 dl1 4.0 dl2 ] 0 setdash
+LT2
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1577 M
diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
index 892c801a..4a91c638 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
@@ -48,10 +48,10 @@ set label 2 "2,097,152" at 10,8000 left
 # set label 3 "131,072" at 10,5000 left
 # set label 4 "rwlock" at 0.3,1.6 left
 # set label 5 "refcnt" at 0.15,2.8 left
-plot "perftestS.2097152.${tag}.dat" w l,\
-     "perftestR.2097152.${tag}.dat" w l,\
-     "perftestL.2097152.${tag}.dat" w l,\
-     "perftestS.262144.${tag}.dat" w l,\
-     "perftestR.262144.${tag}.dat" w l,\
-     "perftestL.262144.${tag}.dat" w l
+plot "perftestS.2097152.${tag}.dat" dt 2 w l,\
+     "perftestR.2097152.${tag}.dat" dt 1 w l,\
+     "perftestL.2097152.${tag}.dat" dt 3 w l,\
+     "perftestS.262144.${tag}.dat" dt 2 w l,\
+     "perftestR.262144.${tag}.dat" dt 1 w l,\
+     "perftestL.262144.${tag}.dat" dt 3 w l
 ---EOF---
diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/perftestresizebig.eps b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/perftestresizebig.eps
index 1a2f31a1..ddc0b91e 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/perftestresizebig.eps
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/perftestresizebig.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: perftestresizebig.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Sun Sep 27 15:11:07 2020
+%%CreationDate: Fri Oct 22 18:24:07 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 302 410
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Sun Sep 27 15:11:07 2020)
+  /CreationDate (Fri Oct 22 18:24:07 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2247,6 +2247,7 @@ LTb
 % Begin plot #1
 1.000 UL
 LTb
+LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 /vshift -33 def
@@ -2308,7 +2309,6 @@ LCb setrgbcolor
 % Begin plot #2
 stroke
 LTb
-LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1161 M
@@ -2430,7 +2430,7 @@ LCb setrgbcolor
 % Begin plot #4
 stroke
 LTb
-LT3
+LT1
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1576 M
@@ -2553,7 +2553,7 @@ LCb setrgbcolor
 stroke
 1.200 UL
 LTb
-[8.0 dl1 4.0 dl2 1.0 dl1 2.5 dl2 1.0 dl1 2.5 dl2 1.0 dl1 4.0 dl2 ] 0 setdash
+LT2
 LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
 670 1577 M
diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
index f06727cb..2a7abd63 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
@@ -50,11 +50,11 @@ set label 2 "2,097,152" at 10,8000 left
 # set label 3 "131,072" at 10,5000 left
 # set label 4 "rwlock" at 0.3,1.6 left
 # set label 5 "refcnt" at 0.15,2.8 left
-plot "perftestS.2097152.${tag}.dat" w l,\
-     "perftestR.2097152.${tag}.dat" w l,\
-     "perftestL.2097152.${tag}.dat" w l,\
-     "perftestS.262144.${tag}.dat" w l,\
-     "perftestR.262144.${tag}.dat" w l,\
-     "perftestL.262144.${tag}.dat" w l,\
-     "perftestL.2097152.hps.2020.09.27a.dat" w l
+plot "perftestS.2097152.${tag}.dat" dt 2 w l,\
+     "perftestR.2097152.${tag}.dat" dt 1 w l,\
+     "perftestL.2097152.${tag}.dat" dt 3 w l,\
+     "perftestS.262144.${tag}.dat" dt 2 w l,\
+     "perftestR.262144.${tag}.dat" dt 1 w l,\
+     "perftestL.262144.${tag}.dat" dt 3 w l,\
+     "perftestL.2097152.hps.2020.09.27a.dat" dt 7 w l
 ---EOF---
-- 
2.17.1


