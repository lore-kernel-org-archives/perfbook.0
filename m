Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+mP07rC39eJYuXlYwABhglhvx5Q5J4NTHdeOYS3f3i8=;
        b=BvhVpkVUKKp2HmqCgxKX247BSsH2dsBAc5zRWLAN/grckC652LLC3yUX/9BCX1TcsG
         BDuXWcZZkuwOBcXADiaDLDjK0kRTu0/Bc077ZaKe1QYaqX7K8ggQv/6wyxbon7houSuv
         QfXA0mrHzA0QnL1UgHzRcL4+l0K3snphSK0qAI80CcP/xJ/4LjViLK043VSGKueqA0wk
         ufdG90yKPKYhD6202QF1beHEYzrB1VmvSjfrYO6jApqDSbBhBnAMp2VB0jRzb6YPzbGc
         VfCtBCVm4sqHTeQJwyOJ8HeqFKuh7Y4De7hxcc8Zb2mAylNovuFEUe1r466HggSiV3Uv
         Wsow==
Subject: [PATCH 3/3] CodeSamples: Fix commandchars collision
References: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <f635a33f-ebdf-edbb-9d1d-853218a9adff@gmail.com>
Date: Sun, 27 Jan 2019 00:12:40 +0900
MIME-Version: 1.0
In-Reply-To: <85136a6e-539f-4c51-0c49-fce3500e957d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c09a36aaa2f6fbb56f61e4d39785ee3601b919da Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 26 Jan 2019 21:56:37 +0900
Subject: [PATCH 3/3] CodeSamples: Fix commandchars collision

These collision were detected by checkfcv.pl.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/defer/route_hazptr.c                        | 2 +-
 CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/defer/route_hazptr.c b/CodeSamples/defer/route_hazptr.c
index 1d777cf..2f3dd63 100644
--- a/CodeSamples/defer/route_hazptr.c
+++ b/CodeSamples/defer/route_hazptr.c
@@ -23,7 +23,7 @@
 #include "hazptr.h"
 
 /* Route-table entry to be included in the routing list. */
-//\begin{snippet}[labelbase=ln:defer:route_hazptr:lookup,commandchars=\\\[\]]
+//\begin{snippet}[labelbase=ln:defer:route_hazptr:lookup,commandchars=\\\@\$]
 struct route_entry {
 	struct hazptr_head hh;				//\lnlbl{hh}
 	struct route_entry *re_next;
diff --git a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
index b899369..962d1ce 100644
--- a/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
+++ b/CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus
@@ -1,5 +1,5 @@
 C C-ISA2+o-r+a-r+a-r+a-o
-//\begin[snippet][labelbase=ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole,commandchars=\\\@\$]
+//\begin[snippet][labelbase=ln:formal:litmus:C-ISA2+o-r+a-r+a-r+a-o:whole,commandchars=\@\[\]]
 {
 }
 
-- 
2.7.4


