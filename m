Return-Path: <SRS0=yarM=MZ=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f8a00deIfen2wzjz9WobIiGcZ4cT7Dt730XfsdLtQU8=;
        b=opx0DGNS9Fz1eUtmuwIpC6jUPiIMn3lQEm46LUwJX03sRAikFSX3KiyoBn7ReHZ7+a
         KODukN06a4EENtAEfYRQdb5dynpFilr3wgzTKxNmT3dfTK9Mtlz0HmNgEuC4XkIh7mgS
         vpwgoSy1pgAxDcFGv0ATGcKXJ5sEjQUURkGQxr694YWP1MFlGThYsjdQO/A1jm5hiwk1
         Y6eUCx4fyaPVGnlLuNi7tSdmMjVjTZA5/8SqvTm4DkJAH0ts5nluc2qLFPpzCYMlOgn7
         yFT6rdb9x0PWkBW1tcntqt7ncV/DCW/8GV4aq+7ZIdAjTuRtCy7c+Act6oL7H03Tq/Mb
         cQQQ==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook] defer: turn letters of abbreviation for rcu to upcase 
Date: Mon,  2 Aug 2021 17:28:42 +0800
Message-Id: <20210802092842.10435-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I think turn letters of abbreviation for rcu to upcase in
the figures and the text is more academic.

Correct me if I am wrong.

As too blow my own horn and sing my own praises, 
I have the experience of publishing short paper in
one of ACM flagship conference once ;-)

https://dl.acm.org/doi/10.1145/2769458.2769486

Best Wishes
Zhouyi

---
 defer/rcuusage.tex               | 4 ++--
 defer/refRCUperfPREEMPT.eps      | 2 +-
 defer/refRCUperfwt.eps           | 2 +-
 defer/refRCUperfwtPREEMPT.eps    | 2 +-
 defer/refcntRCUperf.eps          | 2 +-
 defer/rwlockRCUperf.eps          | 2 +-
 defer/rwlockRCUperfPREEMPT.eps   | 2 +-
 defer/rwlockRCUperfwt.eps        | 2 +-
 defer/rwlockRCUperfwtPREEMPT.eps | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/defer/rcuusage.tex b/defer/rcuusage.tex
index b08a31d7..ddbb180c 100644
--- a/defer/rcuusage.tex
+++ b/defer/rcuusage.tex
@@ -335,11 +335,11 @@ which was generated on a 448-CPU 2.10\,GHz Intel x86 system.
 }\QuickQuizEndM
 
 \QuickQuizE{
-	Why is there such large variation for the \co{rcu} trace in
+	Why is there such large variation for the \co{RCU} trace in
 	\cref{fig:defer:Performance Advantage of RCU Over Reader-Writer Locking}?
 }\QuickQuizAnswerE{
 	Keep in mind that this is a log-log plot, so those large-seeming
-	\co{rcu} variances in reality span only a few hundred picoseconds.
+	\co{RCU} variances in reality span only a few hundred picoseconds.
 	And that is such a short time that anything could cause it.
 	However, given that the variance decreases with both small and
 	large numbers of CPUs, one hypothesis is that the variation is
diff --git a/defer/refRCUperfPREEMPT.eps b/defer/refRCUperfPREEMPT.eps
index 7a1c1885..2da2a21c 100644
--- a/defer/refRCUperfPREEMPT.eps
+++ b/defer/refRCUperfPREEMPT.eps
@@ -2209,7 +2209,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1458 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2212 M
diff --git a/defer/refRCUperfwt.eps b/defer/refRCUperfwt.eps
index dd02435f..1020096b 100644
--- a/defer/refRCUperfwt.eps
+++ b/defer/refRCUperfwt.eps
@@ -2170,7 +2170,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1453 1632 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 888 2188 M
diff --git a/defer/refRCUperfwtPREEMPT.eps b/defer/refRCUperfwtPREEMPT.eps
index 282ad76a..039379ad 100644
--- a/defer/refRCUperfwtPREEMPT.eps
+++ b/defer/refRCUperfwtPREEMPT.eps
@@ -446,7 +446,7 @@ grestore
 LTb
 1146 587 M
 gsave 0 setgray
-(rcu) Lshow
+(RCU) Lshow
 grestore
 LTb
 716 830 M
diff --git a/defer/refcntRCUperf.eps b/defer/refcntRCUperf.eps
index 6c6bec49..cff69001 100644
--- a/defer/refcntRCUperf.eps
+++ b/defer/refcntRCUperf.eps
@@ -2252,7 +2252,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1471 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2309 M
diff --git a/defer/rwlockRCUperf.eps b/defer/rwlockRCUperf.eps
index 4b17fffc..3211a40a 100644
--- a/defer/rwlockRCUperf.eps
+++ b/defer/rwlockRCUperf.eps
@@ -2252,7 +2252,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1721 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2386 M
diff --git a/defer/rwlockRCUperfPREEMPT.eps b/defer/rwlockRCUperfPREEMPT.eps
index c5d088fc..01f735a3 100644
--- a/defer/rwlockRCUperfPREEMPT.eps
+++ b/defer/rwlockRCUperfPREEMPT.eps
@@ -2209,7 +2209,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1729 1458 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 1066 2288 M
diff --git a/defer/rwlockRCUperfwt.eps b/defer/rwlockRCUperfwt.eps
index e6dd6840..33704a59 100644
--- a/defer/rwlockRCUperfwt.eps
+++ b/defer/rwlockRCUperfwt.eps
@@ -2170,7 +2170,7 @@ Z stroke
 1.000 UP
 LCb setrgbcolor
 1189 1454 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (rcu)]
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (RCU)]
 ] -33.3 MLshow
 LCb setrgbcolor
 888 2188 M
diff --git a/defer/rwlockRCUperfwtPREEMPT.eps b/defer/rwlockRCUperfwtPREEMPT.eps
index b17b4585..d994e607 100644
--- a/defer/rwlockRCUperfwtPREEMPT.eps
+++ b/defer/rwlockRCUperfwtPREEMPT.eps
@@ -446,7 +446,7 @@ grestore
 LTb
 1146 587 M
 gsave 0 setgray
-(rcu) Lshow
+(RCU) Lshow
 grestore
 LTb
 802 1375 M
-- 
2.25.1

