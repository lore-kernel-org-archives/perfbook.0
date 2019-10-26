Return-Path: <SRS0=nXUX=YT=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rrmSDX/rcb5U8xJG7/duF5+3lnXCSVp3NwGPyv3CKQ0=;
        b=d8oOs1cOPkgBGUH0jdeP6avl7xNc5i8le4gb0hjLSJQG7NINK1aaujAlIKvldQt8ye
         P5zqbUGMQDBq84dRYNyHTiP/EuiiDwg5g/sq1UzderM+OxxPoExC68nKJmQZSnMqDX/X
         RnIwJfTBZipO57tpI31VbOwIBS4MyFURCeQvhPsLj4KkyvkjP4DEvPHsTmaEy2Dn9ScJ
         CBMT78hPb67py1uiVX4PwNBlw7pCZSrR071PqnMdIDebgx7XNipBubhPmws77ACOR5KP
         iYSoFXgMU1kwUwoi1Lxqy5JXbVwIP5bLgxeJv3qXIzBfaA5qHzFIwl5Vg+xJNfYsGtJ6
         BwQg==
Subject: [PATCH 2/3] count: Add dashed line indicating ideal time of
 (non-atomic) increment
References: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <51feceaa-47ab-0125-91f4-d42e8153707d@gmail.com>
Date: Sat, 26 Oct 2019 09:21:17 +0900
MIME-Version: 1.0
In-Reply-To: <74f205ba-a530-288b-d211-8ef8db70f365@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5329aeeca8bcdc96241f902748ea4c8d52099031 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 27 Oct 2019 08:48:49 +0900
Subject: [PATCH 2/3] count: Add dashed line indicating ideal time of (non-atomic) increment

This line is mentioned in Quick Quiz 5.8
The value 1.46041 is taken from count_nonatomic:u.hps.2019.10.23a.dat.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/count/atomic_hps.eps | 111 ++++++++++++++++++++++++++++++-
 CodeSamples/count/atomic_hps.png | Bin 3113 -> 3120 bytes
 CodeSamples/count/plots.sh       |   2 +-
 3 files changed, 110 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/count/atomic_hps.eps b/CodeSamples/count/atomic_hps.eps
index 05dedb24..df873ec0 100644
--- a/CodeSamples/count/atomic_hps.eps
+++ b/CodeSamples/count/atomic_hps.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: Is Parallel Programming Hard, And, If So, What Can You Do About It?
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Thu Oct 24 06:55:35 2019
+%%CreationDate: Sat Oct 26 08:12:20 2019
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 95 302 355
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Thu Oct 24 06:55:35 2019)
+  /CreationDate (Sat Oct 26 08:12:20 2019)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -2546,6 +2546,113 @@ LCb setrgbcolor
 50 24 V
 25 8 V
 % End plot #2
+% Begin plot #3
+stroke
+LTb
+LT2
+LCb setrgbcolor
+/NimbusSanL-Regu findfont 100 scalefont setfont
+670 1265 M
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+17 0 V
+16 0 V
+17 0 V
+17 0 V
+17 0 V
+% End plot #3
 stroke
 2.000 UL
 LTb
diff --git a/CodeSamples/count/atomic_hps.png b/CodeSamples/count/atomic_hps.png
index 8f000fdf09313ff13e2ab1adc49b5d2b6bbfe623..b0f211726dba0190cd5425b8534cc10e2b915226 100644
GIT binary patch
delta 2657
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
DkK8_*

delta 2669
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
Qk9N~wdEWM1nJFgfzuLq%5&!@I

diff --git a/CodeSamples/count/plots.sh b/CodeSamples/count/plots.sh
index cf0f7374..a76ab07b 100644
--- a/CodeSamples/count/plots.sh
+++ b/CodeSamples/count/plots.sh
@@ -96,7 +96,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-plot "data/count_atomic:u.hps.2019.10.23a.dat" w e, "data/count_atomic:u.hps.2019.10.23a.dat" w l
+plot "data/count_atomic:u.hps.2019.10.23a.dat" w e, "data/count_atomic:u.hps.2019.10.23a.dat" w l, 1.46041
 set term png medium
 set output "atomic_hps.png"
 replot
-- 
2.17.1


