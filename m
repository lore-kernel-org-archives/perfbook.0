Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iNwHUiYCc9QnsSo0ycnyrlGP1dRK0Ne16+OBPh1Pnw0=;
 b=kh3wm71v8OI0gu6WHbKrRfJrR47GKfCrJkkJL1zilX54uXoKQRiv4/kSdjO+YXdkqa
 +O0NhEq+VZ0Yzw/tetPPzoMYi58rnAubGCA1DlT9QXZSbecYdIN9Lvg5zqAJ/xYQOMiI
 qlwatATtDiErHXBrMTCKM+r5mhHchg9N/HSzgi3NMFr3tSPd8B4qBIv8qcPR7EW3ByK4
 sM6shPwEp25STH/avgU7RD9MExrIML9aPF8qE5kW8Qq3m8kriSN5NRHgy2MFIaxR9oZD
 w1RZoq1sYc/WFBaIah80BdcOxtM+/ClCkZVd50uRc2k4Rt2OrKCObMSI8woBpsO7j10D
 O9Mw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/2] SMPdesign: add missing tildes
Date: Wed, 27 Apr 2016 08:33:14 +0900
Message-Id: <1461713595-29898-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1461713595-29898-1-git-send-email-sj38.park@gmail.com>
References: <1461713595-29898-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 SMPdesign/SMPdesign.tex     | 2 +-
 SMPdesign/partexercises.tex | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/SMPdesign/SMPdesign.tex b/SMPdesign/SMPdesign.tex
index 72ea870..d2b092d 100644
--- a/SMPdesign/SMPdesign.tex
+++ b/SMPdesign/SMPdesign.tex
@@ -954,7 +954,7 @@ We could simply assign each CPU one gigabyte of memory, and allow
 each CPU to access its own private chunk of memory, without the
 need for locking and its complexities and overheads.
 Unfortunately, this simple scheme breaks down if an algorithm happens
-to have CPU 0 allocate all of the memory and CPU 1 the free it, as
+to have CPU~0 allocate all of the memory and CPU~1 the free it, as
 would happen in a simple producer-consumer workload.

 The other extreme, code locking, suffers from excessive lock contention
diff --git a/SMPdesign/partexercises.tex b/SMPdesign/partexercises.tex
index 5d46e70..8b3aa18 100644
--- a/SMPdesign/partexercises.tex
+++ b/SMPdesign/partexercises.tex
@@ -597,7 +597,7 @@ and \co{pdeq_pop_r()} implementations separately.

 The \co{pdeq_pop_l()} implementation is shown on lines~1-16
 of the figure.
-Line 5 acquires the left-hand lock, which line~14 releases.
+Line~5 acquires the left-hand lock, which line~14 releases.
 Line~6 attempts to left-dequeue an element from the left-hand underlying
 double-ended queue, and, if successful, skips lines~8-13 to simply
 return this element.
-- 
1.9.1

