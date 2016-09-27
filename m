Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fzcSj2DSSCvN10m+V/vURCH4WrKs7segaK1Z8jKXeyk=;
 b=QcrePubHs0V1PiSncvoXePjhH9QzGIsri3gZEOXIeaPuD6t/ufoCCr/pWgEcuDr8pO
 s46+HjiibZYS6/rJ1BtMvKfKITlFfkzPeB0fQTJx3x89KijPQ7o9GjIie+MtQKUW5jvJ
 1M7TkrRN9++kPptEJsPPMWCrdCKks2QKP608kMoWCnXP3T7BrL1SLpkgCq9GlqExm+kk
 MLfF+odcJ7K/9ydFXOQQcFYRGBbR6hhhvOLbMwKBdukjmA7ifDr2eITTeDzSyzVQy5TN
 nDTps7DHoXsFwQb1dP+J0A7teIgH3J+ATlVhAHkL10bCcryWTmgLRbrxqIg2koZUsNwq
 10rg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 11/17] formal/dyntickrcu: Fix wrong function name quotation
Date: Wed, 28 Sep 2016 06:56:35 +0900
Message-Id: <20160927215641.7330-11-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/dyntickrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
index 1c99a0b..d0b2c6e 100644
--- a/formal/dyntickrcu.tex
+++ b/formal/dyntickrcu.tex
@@ -2197,7 +2197,7 @@ true if the CPU was in a quiescent state.
 \end{figure}

 Figure~\ref{fig:formal:Checking Dyntick Progress Counters}
-shows \co{dyntick_save_progress_counter}, which is called to check
+shows \co{rcu_implicit_dynticks_qs()}, which is called to check
 whether a CPU has entered dyntick-idle mode subsequent to a call
 to \co{dynticks_save_progress_counter()}.
 Lines~9 and~11 take new snapshots of the corresponding CPU's
-- 
2.10.0

