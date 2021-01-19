Return-Path: <SRS0=LJs/=GW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=qpQtGEWIVoOCES/zYB2Tww6VyBT0dL3qh94nzemvy40=;
        b=uT4sZ6vg70OPzjQ1Ah1z08dQY/oVZR0DCvaAN0L9cqBQu5W7P9AdGQ2I+dOmPSwlGf
         gSeD+yeOa22LGkuGYFDsqMqx+jkLPdWNw1pyoVkJ5HZxlt8Uesr+G//gJNopK49sflHW
         Ht4oGl3HFtM8cEjzYjStkE0HX2FTnSlpKQT/V5CiUGYjkohb8wdvZOGTb4KPmWlEHESv
         AHkNKHBASzaaiSuncjNOaRJEq1ExQqy5hI0KdI/RoYbPFheDiFIoAanrcGdRdSeJd+MJ
         GUJnjVdqgNP+aT4e1INvukjjkK/I5jOAIHnTqPf5I14v/Ghox6XFVyWkZpI+9msmGTiy
         ru2Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] formal: Update Figure 12.4 (refscale.c as test
 code)
Message-ID: <9ba078ef-0cc4-7d83-acc8-c4ae8a807bff@gmail.com>
Date: Wed, 20 Jan 2021 07:45:27 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Update the data and plot based on rcutorture.sh of commit
1e0319874e40 ("formal: Make rcutorture.sh account for refperf->refscale").

Note that rcu-test.dat is manually edited to replace Linux version
strings with empty ones to put labels (mostly) every four releases
in the plot.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 formal/RCU-test-ratio.eps | 36 ++++++++++++++++++------------------
 formal/data/rcu-test.dat  |  4 ++--
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
index 0825615f..8e2b676f 100644
--- a/formal/RCU-test-ratio.eps
+++ b/formal/RCU-test-ratio.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 2
-%%CreationDate: Sun Jan 17 22:07:18 2021
+%%CreationDate: Wed Jan 20 07:13:31 2021
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 50 453 230
 %%Orientation: Portrait
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 2)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Sun Jan 17 22:07:18 2021)
+  /CreationDate (Wed Jan 20 07:13:31 2021)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -3311,22 +3311,22 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3418 512 27 742 BoxColFill
+0.00 0.00 0.00 C 0.200 3418 512 27 713 BoxColFill
 LCb setrgbcolor
 3418 512 N
-0 741 V
+0 712 V
 26 0 V
-0 -741 V
+0 -712 V
 -26 0 V
 Z stroke
 1.000 UL
 LTb
-0.00 0.00 0.00 C 0.200 3455 512 26 749 BoxColFill
+0.00 0.00 0.00 C 0.200 3455 512 26 720 BoxColFill
 LCb setrgbcolor
 3455 512 N
-0 748 V
+0 719 V
 25 0 V
-0 -748 V
+0 -719 V
 -25 0 V
 Z stroke
 1.000 UL
@@ -4125,22 +4125,22 @@ LCb setrgbcolor
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3418 1253 27 285 BoxColFill
+0.90 0.62 0.00 C 0.200 3418 1224 27 314 BoxColFill
 LCb setrgbcolor
-3418 1253 N
-0 284 V
+3418 1224 N
+0 313 V
 26 0 V
-0 -284 V
+0 -313 V
 -26 0 V
 Z stroke
 1.000 UL
 LTb
-0.90 0.62 0.00 C 0.200 3455 1260 26 291 BoxColFill
+0.90 0.62 0.00 C 0.200 3455 1231 26 320 BoxColFill
 LCb setrgbcolor
-3455 1260 N
-0 290 V
+3455 1231 N
+0 319 V
 25 0 V
-0 -290 V
+0 -319 V
 -25 0 V
 Z stroke
 1.000 UL
@@ -4235,8 +4235,8 @@ LTb
 37 5 V
 36 -2 V
 37 -29 V
-36 2 V
-37 5 V
+36 72 V
+37 3 V
 % End plot #3
 stroke
 2.000 UL
diff --git a/formal/data/rcu-test.dat b/formal/data/rcu-test.dat
index 3419fd65..4bd65599 100644
--- a/formal/data/rcu-test.dat
+++ b/formal/data/rcu-test.dat
@@ -76,5 +76,5 @@ v5.4  15379 6209 21588 28.8
 ""    15675 6373 22048 28.9
 ""    15986 6455 22441 28.8
 v5.8  17424 6627 24051 27.6
-""    18395 7062 25457 27.7
-v5.10 18582 7197 25779 27.9
+""    17678 7779 25457 30.6
+v5.10 17863 7916 25779 30.7
-- 
2.17.1

