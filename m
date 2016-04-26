Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=from:to:cc:subject:date:message-id;
 bh=yBazt3g2An1kcbIhLixlwvXYkHv9ynW/V6PtTi9/rG8=;
 b=MLbgD8i78kSq0T1GcT5bd1IcqzGUsXcUcAr58RP1s50QvXKHFMm4Os3FbfrYPNA/0R
 aG2QeLgyBrRfHsrAOVNBAERlTpj8uVVOxULswK9MHMAsBZPSD0WoGbfhc0fZJ7Sr+eb3
 z3W00aPFAE2d0WCFj5oHqxMkRAguiCdFrgMZj4wVhPxD9FHrQzJWKogg1ien8a0KVVcs
 vfnaq+h5BI5jcDFUA9Y2rAfVmmM4KZRcL3xdhYZ86LFiyJblNutqKeSZAad7fE+ftKxN
 yR2x/pJyiLdwrWLGRjTbBzpEOIiQgdEzN5mSH/m2noBvu3Ol5pO8k/6n9zkTHu8a1EL2
 ZrQA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] advsync: fix trivial typos
Date: Tue, 26 Apr 2016 10:22:30 +0900
Message-Id: <1461633750-17992-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Earlier two commits to advsync/memorybarriers.tex file, commit
8de1474e3282 ("Add larger multiple-value-write scenario") and commit
514f21cd4156 ("Add caveats to the Software Logic Analyzer") has made few
trivial typos.  This commit fixes them.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index cc39d2d..a0ef76d 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -363,7 +363,7 @@ consistent with the increase in number of CPUs.
 The remaining 15 columns in the table record the values most recently
 observed by the corresponding CPU at each point in time, with changes
 in value marked by italics and parentheses.
-Again, CPU 0 coordinates the test, so does not record any values.
+Again, CPU~0 coordinates the test, so does not record any values.

 \begin{table*}[htbp]
 \scriptsize
@@ -508,7 +508,7 @@ We have entered a regime where we must bid a fond farewell to
 comfortable intuitions about values of variables and the passage of time.
 This is the regime where memory barriers are needed.

-All that aside, is is important to remember the lessons from
+All that aside, it is important to remember the lessons from
 Chapters~\ref{chp:Hardware and its Habits}
 and~\ref{cha:Partitioning and Synchronization Design}.
 Having all CPUs write concurrently to the same variable
-- 
1.9.1

