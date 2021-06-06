Return-Path: <SRS0=2uZh=LA=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qDCa4rm7LFA6qFTapStrWj4y6m8pJ/a3MhmF/ZP3a7Q=;
        b=DXx8Emh+NrIklsKlPbbSPtwWsAEhStsST2iYeaVbE6OigM6d1AY/6+4V/skTf5SkzD
         rGRugV+G1Jvs+MEiBmGBP/3TmTUS3vCf219dXalBibWDbTrEBMEtPf5K9I2BAVZMu90W
         xShRZlJEh1XAkW+jdquHcuzw1RQ+Fp1ll2OR4aSPEyYZOIYo50M2+hVIZGN78AcLHEFZ
         CmpbwOn6nLw95MbSTepVGFG0VGj1Um0BjUTm2Uwhs9oH+EShy09vrq3Ng8u3whGByHQl
         8LFvnYWUSJ7GeAxKZY4lrHpeycowPbx7WZrs33GubS8tK8BU+cQhRTlo6+dmky7mkY7g
         GgCg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] intro: Fix a wrong opening quote ('' -> ``)
Date: Sun,  6 Jun 2021 10:17:26 +0200
Message-Id: <20210606081727.2125-2-sj38.park@gmail.com>
In-Reply-To: <20210606081727.2125-1-sj38.park@gmail.com>
References: <20210606081727.2125-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Closing quote ('') is used in place of opening quote for a sentence.
This commit fixes it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 intro/intro.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/intro/intro.tex b/intro/intro.tex
index b40abeb5..991a5f5d 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -155,7 +155,7 @@ as discussed in \cref{sec:cpu:Hardware Free Lunch?}.
 	how could a large number of open-source projects, ranging from Apache
 	to MySQL to the Linux kernel, have managed to master it?
 
-	A better question might be: ''Why is parallel programming {\em
+	A better question might be: ``Why is parallel programming {\em
 	perceived} to be so difficult?''
 	To see the answer, let's go back to the year 1991.
 	Paul McKenney was walking across the parking lot to Sequent's
-- 
2.17.1

