Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=+jPlFCW7Ewf2cMfmO3wTPev2EB7UTOvVQc/HYPZmq4s=;
 b=ZRwFfRQYek5Cp+IbUWkeOoos08osPj31WnF16HE4KwJQ5jndu0mlX8BkiB8KKYsDGP
 mMNYLuAbgUlpHlwh1roS7LzaczqS40KEU+1cCVwuq4pnVPAMveD/umRRc4SST3kTBbuG
 k7CeEjK7Pm9NVyz3eTlXO3KTyT5m/38MEX4fkTZie7oxL49DqgDYKAcJJT9x8OwVhTQB
 HEF+dGGfTWKqyBL+FM4mEe35gcm9IPb0Quxp56Nfgkn4cMjV+QH669nw3WvBYu3CZ4bp
 TSWnz6/o8LXuzyhEDz79XQfxOMDab0+3H1x74C1H5TpcVcbu8D+JZF+EPysn6WtctiFE
 Wh0w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] toolsoftrade: Trivial typo fixes
Message-ID: <692c6e8e-07e0-2c8c-daba-8961890e4086@gmail.com>
Date: Thu, 29 Dec 2016 20:16:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 898b1101cf7f88f42b57f88d7539c6a579f3106a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 29 Dec 2016 19:42:34 +0900
Subject: [PATCH] toolsoftrade: Trivial typo fixes

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index f76b250..1946599 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -1280,7 +1280,7 @@ The C11 standard added atomic operations,
 including loads (\co{atomic_load()}),
 stores (\co{atomic_store()}),
 memory barriers (\co{atomic_thread_fence()} and
-\co{atomic_signal_fence()}), and read-modified-write atomics.
+\co{atomic_signal_fence()}), and read-modify-write atomics.
 The read-modify-write atomics include
 \co{atomic_fetch_add()},
 \co{atomic_fetch_sub()},
@@ -1849,7 +1849,7 @@ shown in
 Section~\ref{sec:toolsoftrade:Atomic Operations}
 to that of per-CPU (or per-thread) variables
 (see Section~\ref{sec:toolsoftrade:Per-CPU Variables}),
-as well as to conventional increment (as in ``counter++'').
+as well as to conventional increment (as in ``\co{counter++}'').

 % \emph{@@@ need parable on cache thrashing.}

-- 
2.7.4

