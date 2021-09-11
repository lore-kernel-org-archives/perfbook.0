Return-Path: <SRS0=Xarl=OB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ZAU3qI1v9ZVsYFTvuAWyzVvbRlxFUEKRP+K2aso90nk=;
        b=UUXK3XIeZh+WVgabWRadUx8bompKI/omFMnF+z/R26jVlt6tcc4fLm/13DtL1gfkv9
         /TyyyYLmFfMGjCV1jfugjGdwavIyCJ8sj4BHgI0x3rutshP1LoRpiwV/wrUELffPJUrZ
         RGzQ420UlaWXpaekXACw0/GLV3KeAEy8McoTbLk6LkyfrGbr+lm6Uvu9KxDkicn/o9kh
         X77EdzjZDR7UKXflTcAjkuNP2G7yFd9akGc1Me/eGDJXZDVMbrxRKlKbcjRKjBvpya8D
         4HhNQqw9L2D3jxUyD1Om3/Cd4ii3euip4yOj1Z1GdhzKErLGJHhYzY2IRnxx8lM61Hyj
         Fv6Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] CodeSamples/defer: Comment out 'cp' commands of
 .eps files
Message-ID: <dd6cee88-16ba-31d1-224a-469a25c76aa0@gmail.com>
Date: Sun, 12 Sep 2021 08:52:01 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

They are supposed to have been commented out in commit d49e63354d45
("defer: Mark directories of unused data, take 2").

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/data/OLD-paulmck.2016/plots.sh     | 10 +++++-----
 .../defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh |  4 ++--
 .../defer/data/rcuscale.hps.2020.05.28a/plots.sh     | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh b/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
index a1ced80d..ef5bfcc2 100644
--- a/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
+++ b/CodeSamples/defer/data/OLD-paulmck.2016/plots.sh
@@ -50,7 +50,7 @@ set label 2 "refcnt" at 7.8,30000 right
 # set label 5 "refcnt" at 0.15,2.8 left
 plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e
 ---EOF---
-cp perf-refcnt.eps ../..
+# cp perf-refcnt.eps ../..
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -69,7 +69,7 @@ set label 3 "hazptr" at 5,48000 left
 # set label 5 "refcnt" at 0.15,2.8 left
 plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e
 ---EOF---
-cp perf-hazptr.eps ../..
+# cp perf-hazptr.eps ../..
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -88,7 +88,7 @@ set label 4 "seqlock" at 7.8,165000 right
 # set label 5 "refcnt" at 0.15,2.8 left
 plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e
 ---EOF---
-cp perf-seqlock.eps ../..
+# cp perf-seqlock.eps ../..
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -107,7 +107,7 @@ set label 4 "seqlock" at 7.8,165000 right
 set label 5 "RCU" at 7.8,286000 right
 plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e, "route_rcu.paulmck.2016.07.07a.dat" w l, "route_rcu.paulmck.2016.07.07a.dat" w e
 ---EOF---
-cp perf-rcu.eps ../..
+# cp perf-rcu.eps ../..
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -126,4 +126,4 @@ set label 4 "seqlock" at 7.8,165000 right
 set label 5 "RCU" at 7.8,286000 right
 plot "route_seq.paulmck.2016.07.07a.dat" w l, "route_seq.paulmck.2016.07.07a.dat" w e, "route_refcnt.paulmck.2016.07.07a.dat" w l, "route_refcnt.paulmck.2016.07.07a.dat" w e, "route_hazptr.paulmck.2016.07.07a.dat" w l, "route_hazptr.paulmck.2016.07.07a.dat" w e, "route_seqlock.paulmck.2016.07.07a.dat" w l, "route_seqlock.paulmck.2016.07.07a.dat" w e, "route_rcu.paulmck.2016.07.07a.dat" w l, "route_rcu.paulmck.2016.07.07a.dat" w e, "route_rcu_qsbr.paulmck.2016.07.12a.dat" w l, "route_rcu_qsbr.paulmck.2016.07.12a.dat" w e
 ---EOF---
-cp perf-rcu-qsbr.eps ../..
+# cp perf-rcu-qsbr.eps ../..
diff --git a/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh b/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
index 64035066..2a4634ac 100644
--- a/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
+++ b/CodeSamples/defer/data/OLD-rcuscale.hps.2020.05.27a/plots.sh
@@ -49,7 +49,7 @@ set label 2 "rwlock" at 4,650 left
 # set label 5 "RCU" at 400,1.4e7 right
 plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "rwlock-eb.$tag.dat" w l, "rwlock-eb.$tag.dat" w e
 ---EOF---
-cp rwlockRCUperf.eps ../../../../defer
+# cp rwlockRCUperf.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -87,7 +87,7 @@ set label 2 "refcnt" at 4,450 left
 # set label 5 "RCU" at 400,1.4e7 right
 plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "refcnt-eb.$tag.dat" w l, "refcnt-eb.$tag.dat" w e
 ---EOF---
-cp refcntRCUperf.eps ../../../../defer
+# cp refcntRCUperf.eps ../../../../defer
 
 exit 0
 
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
index 99f2e8d0..f967e358 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
@@ -72,7 +72,7 @@ set output "prz-rwlockRCUperf.eps"
 set size $przsize
 replot
 ---EOF---
-cp rwlockRCUperf.eps ../../../../defer
+# cp rwlockRCUperf.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -94,7 +94,7 @@ set output "prz-rwlockRCUperfPREEMPT.eps"
 set size $przsize
 replot
 ---EOF---
-cp rwlockRCUperfPREEMPT.eps ../../../../defer
+# cp rwlockRCUperfPREEMPT.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -132,7 +132,7 @@ set label 2 "refcnt" at 4,450 left
 # set label 5 "RCU" at 400,1.4e7 right
 plot "rcu-eb.$tag.dat" w l, "rcu-eb.$tag.dat" w e, "refcnt-eb.$tag.dat" w l, "refcnt-eb.$tag.dat" w e
 ---EOF---
-cp refcntRCUperf.eps ../../../../defer
+# cp refcntRCUperf.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -151,7 +151,7 @@ set label 2 "refcnt" at 4,500 left
 # set label 5 "RCU" at 400,1.4e7 right
 plot "rcu-eb.$tag.preempt.dat" w l, "rcu-eb.$tag.preempt.dat" w e, "refcnt-eb.$tag.preempt.dat" w l, "refcnt-eb.$tag.preempt.dat" w e
 ---EOF---
-cp refRCUperfPREEMPT.eps ../../../../defer
+# cp refRCUperfPREEMPT.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -189,7 +189,7 @@ set output "prz-rwlockRCUperfwtlin.eps"
 set size $przsize
 replot
 ---EOF---
-cp rwlockRCUperfwt.eps ../../../../defer
+# cp rwlockRCUperfwt.eps ../../../../defer
 
 gnuplot << ---EOF---
 set term postscript portrait ${fontsize} enhanced "NimbusSanL-Regu" fontfile "${font}fonts/uhvr8a.pfb"
@@ -208,7 +208,7 @@ set label 4 "1 CPU" at 120,500 left
 # set label 5 "RCU" at 400,1.4e7 right
 plot "rcu-1-eb.$tag.dat" w l, "refcnt-1-eb.$tag.dat" w l, "refcnt-1-eb.$tag.dat" w e, "refcnt-10-eb.$tag.dat" w l, "refcnt-10-eb.$tag.dat" w e, "refcnt-100-eb.$tag.dat" w l, "refcnt-100-eb.$tag.dat" w e
 ---EOF---
-cp refRCUperfwt.eps ../../../../defer
+# cp refRCUperfwt.eps ../../../../defer
 
 exit 0
 @@@  The following are needed when regenerating the pre-BSD routing plots
-- 
2.17.1


