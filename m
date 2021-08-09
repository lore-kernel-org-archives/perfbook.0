Return-Path: <SRS0=D3T3=NA=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K8DzdbG/pnXQrnLOp0kSGQDQlGzJUdZxpoqA4zno8oc=;
        b=oul8S77CXusDYyuNkg9qpAE2e7BhOWufykVUcWrCPnMEkJH1ZgqMAMg79MVaNpTGfJ
         xglZacCp0mfVAOqAKJCsJOUL0lfFYo7LxEgInek5rkQnG8joNaFDbfTRqtivw+8opT6P
         +av2hdqOTFpxa6HSapo6utN2XboXxVixdICCJkveRo7Ym19UVDh8ZzMcOMOnxi0heJ4F
         dAvXvFg6/fNMQ089lKfL3tNKnmCgyRV9wPwcp7MeKBaJKUhc0ZfdqI11lm2aoi5MQ0Cd
         aV5xB/xTIFGn729OTRPTFexRonu/rMwKCHU4rAa5QLP8nXoapGYGa6Qv+cYzI1r2AH4P
         CR1A==
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH-perfbook V3] turn abbreviation for rcu to upcase
Date: Tue, 10 Aug 2021 02:19:41 +0800
Message-Id: <20210809181941.4578-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: paulmck@kernel.org, perfbook@vger.kernel.org, luyang.co@gmail.com
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I turned the letters of abbreviation for rcu to upcase in the text,
the figures, and the scripts which generate the figures.

I use following command to find all the scripts involved:
find . -name "*.sh"|xargs grep "label"|grep "\"rcu\""

I use following command to modify the scripts:
sed -i 's/label 1 "rcu" at/label 1 "RCU" at/g'

I invoked make command to validate the result pdf file, and double
checked the patch with naked eyes, hoping it won't cause trouble after
so many lines have been changed.

Have a nice day ;-)
Zhouyi

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

---
 CodeSamples/SMPdesign/smpalloc.sh             |  2 +-
 CodeSamples/count/plots.sh                    |  6 +++---
 CodeSamples/datastruct/Issaquah/plots.sh      |  8 ++++----
 .../hash/data/hps.perf.2020.10.15a/plots.sh   | 14 ++++++-------
 .../hash/data/hps.perf.2020.10.22a/plots.sh   | 14 ++++++-------
 .../hash/data/hps.perf.2020.10.24a/plots.sh   |  6 +++---
 .../hash/data/hps.perf.2020.11.26a/plots.sh   |  2 +-
 CodeSamples/datastruct/hash/plots.sh          | 14 ++++++-------
 CodeSamples/debugging/plots.sh                |  2 +-
 .../defer/data/3a20/2007.11.19a/plots.sh      |  4 ++--
 .../defer/data/3a20/2007.11.20a/plots.sh      |  2 +-
 .../defer/data/3a20/2007.11.22a/plots.sh      |  4 ++--
 .../defer/data/3a20/2007.11.26a/plots.sh      |  4 ++--
 .../defer/data/3a20/2007.12.09a/plots.sh      |  4 ++--
 .../data/rcuscale.hps.2020.05.27a/plots.sh    |  6 +++---
 .../data/rcuscale.hps.2020.05.28a/plots.sh    | 20 +++++++++----------
 SMPdesign/plots.sh                            |  2 +-
 defer/rcuusage.tex                            |  4 ++--
 defer/refRCUperfPREEMPT.eps                   |  2 +-
 defer/refRCUperfwt.eps                        |  2 +-
 defer/refRCUperfwtPREEMPT.eps                 |  2 +-
 defer/refcntRCUperf.eps                       |  2 +-
 defer/rwlockRCUperf.eps                       |  2 +-
 defer/rwlockRCUperfPREEMPT.eps                |  2 +-
 defer/rwlockRCUperfwt.eps                     |  2 +-
 defer/rwlockRCUperfwtPREEMPT.eps              |  2 +-
 26 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/CodeSamples/SMPdesign/smpalloc.sh b/CodeSamples/SMPdesign/smpalloc.sh
index 7fb8c422..a55aeacd 100644
--- a/CodeSamples/SMPdesign/smpalloc.sh
+++ b/CodeSamples/SMPdesign/smpalloc.sh
@@ -49,7 +49,7 @@ set xlabel "Allocation Run Length"
 set ylabel "Allocations/Frees Per Microsecond"
 #set yrange [1:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/count/plots.sh b/CodeSamples/count/plots.sh
index 03582a4f..627fd66b 100644
--- a/CodeSamples/count/plots.sh
+++ b/CodeSamples/count/plots.sh
@@ -36,7 +36,7 @@ set ylabel "Time Per Increment (nanoseconds)"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -54,7 +54,7 @@ set ylabel "Time Per Increment (ns)"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -75,7 +75,7 @@ set ylabel "Time Per Increment (ns)"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/Issaquah/plots.sh b/CodeSamples/datastruct/Issaquah/plots.sh
index 1f2438ce..6aa2c4d2 100644
--- a/CodeSamples/datastruct/Issaquah/plots.sh
+++ b/CodeSamples/datastruct/Issaquah/plots.sh
@@ -43,7 +43,7 @@ set ylabel "Lookups Per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -61,7 +61,7 @@ set ylabel "Operations Per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -79,7 +79,7 @@ set ylabel "Moves Per Millisecond"
 set xrange [0:8]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -97,7 +97,7 @@ set ylabel "Moves Per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.15a/plots.sh b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.15a/plots.sh
index 192a0818..81649515 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.15a/plots.sh
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.15a/plots.sh
@@ -43,7 +43,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -61,7 +61,7 @@ set ylabel "Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -133,7 +133,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -169,7 +169,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -187,7 +187,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -223,7 +223,7 @@ set ylabel "Cat Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -259,7 +259,7 @@ set logscale y
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.22a/plots.sh b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.22a/plots.sh
index 5d8d96e7..b9c9dea7 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.22a/plots.sh
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.22a/plots.sh
@@ -43,7 +43,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -61,7 +61,7 @@ set ylabel "Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -133,7 +133,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -169,7 +169,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -187,7 +187,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -223,7 +223,7 @@ set ylabel "Cat Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -259,7 +259,7 @@ set logscale y
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.24a/plots.sh b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.24a/plots.sh
index f77c9ba3..61c99682 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.10.24a/plots.sh
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.10.24a/plots.sh
@@ -43,7 +43,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -61,7 +61,7 @@ set ylabel "Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -169,7 +169,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
index 41007292..9bf74f14 100644
--- a/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
+++ b/CodeSamples/datastruct/hash/data/hps.perf.2020.11.26a/plots.sh
@@ -206,7 +206,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/datastruct/hash/plots.sh b/CodeSamples/datastruct/hash/plots.sh
index 49556b8b..5fcaa652 100644
--- a/CodeSamples/datastruct/hash/plots.sh
+++ b/CodeSamples/datastruct/hash/plots.sh
@@ -43,7 +43,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -61,7 +61,7 @@ set ylabel "Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -133,7 +133,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -169,7 +169,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -187,7 +187,7 @@ set ylabel "Total Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -223,7 +223,7 @@ set ylabel "Cat Lookups per Millisecond"
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
@@ -259,7 +259,7 @@ set logscale y
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/debugging/plots.sh b/CodeSamples/debugging/plots.sh
index 2a5bc82d..552f41c7 100644
--- a/CodeSamples/debugging/plots.sh
+++ b/CodeSamples/debugging/plots.sh
@@ -36,7 +36,7 @@ set logscale y
 #set yrange [1:10000]
 set xrange [0:1]
 set nokey
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
diff --git a/CodeSamples/defer/data/3a20/2007.11.19a/plots.sh b/CodeSamples/defer/data/3a20/2007.11.19a/plots.sh
index 366a66c7..45aa41b8 100644
--- a/CodeSamples/defer/data/3a20/2007.11.19a/plots.sh
+++ b/CodeSamples/defer/data/3a20/2007.11.19a/plots.sh
@@ -11,7 +11,7 @@ set ylabel "Overhead (nanoseconds)"
 set data style lines
 set nokey
 set logscale y
-set label 1 "rcu" at 7.5,27 right
+set label 1 "RCU" at 7.5,27 right
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 7.5,3000 right
@@ -32,7 +32,7 @@ set ylabel "Overhead (nanoseconds)"
 set data style lines
 set nokey
 set logscale y
-set label 1 "rcu" at 15,0.0007 right
+set label 1 "RCU" at 15,0.0007 right
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 15,1000 right
diff --git a/CodeSamples/defer/data/3a20/2007.11.20a/plots.sh b/CodeSamples/defer/data/3a20/2007.11.20a/plots.sh
index 7e83cf4e..cf7e9266 100644
--- a/CodeSamples/defer/data/3a20/2007.11.20a/plots.sh
+++ b/CodeSamples/defer/data/3a20/2007.11.20a/plots.sh
@@ -11,7 +11,7 @@ set ylabel "Overhead (nanoseconds)"
 set data style lines
 set nokey
 set logscale y
-set label 1 "rcu" at 15,9 right
+set label 1 "RCU" at 15,9 right
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 15,4000 right
diff --git a/CodeSamples/defer/data/3a20/2007.11.22a/plots.sh b/CodeSamples/defer/data/3a20/2007.11.22a/plots.sh
index 59a3acdd..1b61b8d8 100644
--- a/CodeSamples/defer/data/3a20/2007.11.22a/plots.sh
+++ b/CodeSamples/defer/data/3a20/2007.11.22a/plots.sh
@@ -11,7 +11,7 @@ set ylabel "Overhead (nanoseconds)"
 set data style lines
 set nokey
 set logscale y
-set label 1 "rcu" at 15,9 right
+set label 1 "RCU" at 15,9 right
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 15,3400 right
@@ -32,7 +32,7 @@ set ylabel "Overhead (nanoseconds)"
 set data style lines
 set nokey
 set logscale y
-set label 1 "rcu" at 15,9 right
+set label 1 "RCU" at 15,9 right
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 15,4000 right
diff --git a/CodeSamples/defer/data/3a20/2007.11.26a/plots.sh b/CodeSamples/defer/data/3a20/2007.11.26a/plots.sh
index 88579e41..a49dcc4f 100644
--- a/CodeSamples/defer/data/3a20/2007.11.26a/plots.sh
+++ b/CodeSamples/defer/data/3a20/2007.11.26a/plots.sh
@@ -12,7 +12,7 @@ set data style lines
 set nokey
 # set logscale y
 set xrange [0:10]
-set label 1 "rcu" at 3,2000 left
+set label 1 "RCU" at 3,2000 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 1,7500 left
@@ -34,7 +34,7 @@ set data style lines
 set nokey
 # set logscale y
 set xrange [0:10]
-set label 1 "rcu" at 3,2000 left
+set label 1 "RCU" at 3,2000 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 15,4000 right
diff --git a/CodeSamples/defer/data/3a20/2007.12.09a/plots.sh b/CodeSamples/defer/data/3a20/2007.12.09a/plots.sh
index fb8d9dae..a0629096 100644
--- a/CodeSamples/defer/data/3a20/2007.12.09a/plots.sh
+++ b/CodeSamples/defer/data/3a20/2007.12.09a/plots.sh
@@ -12,7 +12,7 @@ set data style lines
 set nokey
 # set logscale y
 set xrange [0:10]
-set label 1 "rcu" at 3,2000 left
+set label 1 "RCU" at 3,2000 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 set label 4 "rwlock" at 1,7500 left
@@ -34,7 +34,7 @@ set data style lines
 set nokey
 # set logscale y
 set xrange [0:10]
-set label 1 "rcu" at 3,2000 left
+set label 1 "RCU" at 3,2000 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 15,4000 right
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.27a/plots.sh b/CodeSamples/defer/data/rcuscale.hps.2020.05.27a/plots.sh
index 5a32c191..942aefda 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.27a/plots.sh
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.27a/plots.sh
@@ -42,7 +42,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,1.7 left
+set label 1 "RCU" at 30,1.7 left
 set label 2 "rwlock" at 4,650 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -61,7 +61,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,1.7 left
+set label 1 "RCU" at 30,1.7 left
 set label 2 "rwlock" at 4,500 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -80,7 +80,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,1.7 left
+set label 1 "RCU" at 30,1.7 left
 set label 2 "refcnt" at 4,450 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
diff --git a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
index 9feddc13..2579a633 100644
--- a/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
+++ b/CodeSamples/defer/data/rcuscale.hps.2020.05.28a/plots.sh
@@ -43,7 +43,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-# set label 1 "rcu" at 30,1.7 left
+# set label 1 "RCU" at 30,1.7 left
 # set label 2 "rwlock" at 4,650 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -62,7 +62,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,9 left
+set label 1 "RCU" at 30,9 left
 set label 2 "rwlock" at 4,750 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -84,7 +84,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,9 left
+set label 1 "RCU" at 30,9 left
 set label 2 "rwlock" at 4,750 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -106,7 +106,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,1.7 left
+set label 1 "RCU" at 30,1.7 left
 set label 2 "rwlock" at 4,500 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -125,7 +125,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,1.7 left
+set label 1 "RCU" at 30,1.7 left
 set label 2 "refcnt" at 4,450 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -144,7 +144,7 @@ set logscale xy
 #set yrange [1:10000]
 #set yrange [100:10000]
 set nokey
-set label 1 "rcu" at 30,9 left
+set label 1 "RCU" at 30,9 left
 set label 2 "refcnt" at 4,500 left
 # set label 3 "hazptr" at 360,3.5e6 left
 # set label 4 "seqlock" at 250,5.6e6 right
@@ -163,7 +163,7 @@ set logscale xy
 #set yrange [1:10000]
 # set xrange [0:10]
 set nokey
-set label 1 "rcu" at 520,480 left
+set label 1 "RCU" at 520,480 left
 set label 2 "rwlock 100 CPUs" at 200,10000 left
 set label 3 "10 CPUs" at 110,1900 left
 set label 4 "1 CPU" at 120,500 left
@@ -171,7 +171,7 @@ set label 4 "1 CPU" at 120,500 left
 plot "rcu-1-eb.$tag.dat" w l, "rwlock-1-eb.$tag.dat" w l, "rwlock-1-eb.$tag.dat" w e, "rwlock-10-eb.$tag.dat" w l, "rwlock-10-eb.$tag.dat" w e, "rwlock-100-eb.$tag.dat" w l, "rwlock-100-eb.$tag.dat" w e
 set output "prz-rwlockRCUperfwt.eps"
 set size $przsize
-set label 1 "rcu" at 500,500 left
+set label 1 "RCU" at 500,500 left
 set label 2 "rwlock 100 CPUs" at 200,9000 left
 set label 3 "10 CPUs" at 130,1800 left
 set label 4 "1 CPU" at 120,440 left
@@ -179,7 +179,7 @@ replot
 set output "rwlockRCUperfwtlin.eps"
 set size square ${plotsize},${plotsize}
 set nologscale xy
-set label 1 "rcu" at 5800,5000 left
+set label 1 "RCU" at 5800,5000 left
 set label 2 "rwlock" at 300,8400 left
 set nolabel 3
 set nolabel 4
@@ -201,7 +201,7 @@ set logscale xy
 #set yrange [1:10000]
 #set xrange [0:10]
 set nokey
-set label 1 "rcu" at 1200,1000 left
+set label 1 "RCU" at 1200,1000 left
 set label 2 "refcnt 100 CPUs" at 200,10000 left
 set label 3 "10 CPUs" at 150,2200 left
 set label 4 "1 CPU" at 120,500 left
diff --git a/SMPdesign/plots.sh b/SMPdesign/plots.sh
index 3d669340..163599c4 100644
--- a/SMPdesign/plots.sh
+++ b/SMPdesign/plots.sh
@@ -35,7 +35,7 @@ set logscale y
 set yrange [0.1:10000]
 set nokey
 set xtics rotate
-# set label 1 "rcu" at 0.1,10 left
+# set label 1 "RCU" at 0.1,10 left
 # set label 2 "spinlock" at 0.5,3.0 left
 # set label 3 "brlock" at 0.4,0.6 left
 # set label 4 "rwlock" at 0.3,1.6 left
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

