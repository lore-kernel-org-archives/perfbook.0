Return-Path: <SRS0=onBR=PQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y3T6LYG4QHKRmgLUbUM9LyriahpOIcdSLzFaSF1F+7M=;
        b=DjjTZN2Ud4VAlAbooghZO0PP6KKgvnLFZD4SDLvgvH24jYLCUqeOMeLik9C1r1AyIH
         oiQYXJTNqKAX9zl+kZfYm8Jbut1lIAwLY6+q7FgDKAPzpCny6wQK7pZFtGPcYBs7xvni
         6cjJQnr80obNASIYQailIBPVT7uKgsz9C9O8U2JF5O0tO7qfNtCyuO22QTI58sTGYEmB
         5SxAmN1lpdfAexF/WLl4eI3P6yDvyf0Vi3ox6WBbeMyaY4OpPrUZS1jvWPaNai3wuN3O
         ybZQffT57I2Tfx2ZMmPgXLpHoUjYVAOR/mNlKsnC9Kmtz8CNnPKKcrWCCJjiz3KRjbuZ
         7o0Q==
Subject: [PATCH -perfbook 2/5] datastruct: Break gnuplot command line per each
 plot trace
References: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d401e371-35cb-796f-d9a4-ff6180ae09dc@gmail.com>
Date: Thu, 28 Oct 2021 09:15:24 +0900
MIME-Version: 1.0
In-Reply-To: <48719e0e-2828-7017-8efe-249dff1ef2a2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This change has no effect on the resulting plots.
It is meant for ease of seeing diffs in the following change.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../hash/data/hps.resize.2020.09.05a/plots-resize.sh      | 7 ++++++-
 .../hash/data/hps.resize.2020.09.27a/plots-resize.sh      | 8 +++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
index e431c817..892c801a 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.05a/plots-resize.sh
@@ -48,5 +48,10 @@ set label 2 "2,097,152" at 10,8000 left
 # set label 3 "131,072" at 10,5000 left
 # set label 4 "rwlock" at 0.3,1.6 left
 # set label 5 "refcnt" at 0.15,2.8 left
-plot "perftestS.2097152.${tag}.dat" w l, "perftestR.2097152.${tag}.dat" w l, "perftestL.2097152.${tag}.dat" w l, "perftestS.262144.${tag}.dat" w l, "perftestR.262144.${tag}.dat" w l, "perftestL.262144.${tag}.dat" w l
+plot "perftestS.2097152.${tag}.dat" w l,\
+     "perftestR.2097152.${tag}.dat" w l,\
+     "perftestL.2097152.${tag}.dat" w l,\
+     "perftestS.262144.${tag}.dat" w l,\
+     "perftestR.262144.${tag}.dat" w l,\
+     "perftestL.262144.${tag}.dat" w l
 ---EOF---
diff --git a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
index e43a33af..f06727cb 100644
--- a/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
+++ b/CodeSamples/datastruct/hash/data/hps.resize.2020.09.27a/plots-resize.sh
@@ -50,5 +50,11 @@ set label 2 "2,097,152" at 10,8000 left
 # set label 3 "131,072" at 10,5000 left
 # set label 4 "rwlock" at 0.3,1.6 left
 # set label 5 "refcnt" at 0.15,2.8 left
-plot "perftestS.2097152.${tag}.dat" w l, "perftestR.2097152.${tag}.dat" w l, "perftestL.2097152.${tag}.dat" w l, "perftestS.262144.${tag}.dat" w l, "perftestR.262144.${tag}.dat" w l, "perftestL.262144.${tag}.dat" w l, "perftestL.2097152.hps.2020.09.27a.dat" w l
+plot "perftestS.2097152.${tag}.dat" w l,\
+     "perftestR.2097152.${tag}.dat" w l,\
+     "perftestL.2097152.${tag}.dat" w l,\
+     "perftestS.262144.${tag}.dat" w l,\
+     "perftestR.262144.${tag}.dat" w l,\
+     "perftestL.262144.${tag}.dat" w l,\
+     "perftestL.2097152.hps.2020.09.27a.dat" w l
 ---EOF---
-- 
2.17.1


