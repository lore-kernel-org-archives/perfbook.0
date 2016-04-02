Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7sVOBcKued47z54Zr1HaOL/0Qk541kRzwyVeyQxkFiY=;
 b=b0whgMs6AHtEZvEZp4g1IrYqbdJsI0eBzaag37LBgNAILttcJTa+bQB2Fe4I950Igu
 1AieRu6ClLf8WWV915JWSStdjVDKPe4XEvuDTt5/dbrqHhD0wL5BsZQFifSwXCQPf80t
 zj4j/lWzq0w6bQhoJJVTRLc0kZG0ak7L+yLz7CJyj8jJiHH6GUgZoWNv5h9VMzRxvM3y
 QqYL9kALwWzaGGbpmXOtRMbzQkW/EULrbm1Q8BNqG6gTeBLm+HYsRz12gPKR1chH5RiZ
 wkDSIAVrwTHblzvCI9LgEUG61VfFDjdoWj6WMk9ebMqK6IYNvqitpybQR0oZhDAxjAnc
 UylQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 1/6] advsync: fix trivial typos
Date: Sat,  2 Apr 2016 09:28:26 +0900
Message-Id: <1459556911-11538-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
References: <1459556911-11538-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: dhowells@redhat.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

This commit fixes trivial typos under `advsync/` directory.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 advsync/advsync.tex        | 4 ++--
 advsync/memorybarriers.tex | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/advsync/advsync.tex b/advsync/advsync.tex
index 7250e96..118dc74 100644
--- a/advsync/advsync.tex
+++ b/advsync/advsync.tex
@@ -30,7 +30,7 @@ gives a brief overview of non-blocking synchronization.

 Although locking is the workhorse of parallelism in production, in
 many situations performance, scalability, and real-time response can
-all be greatly improved though use of lockless techniques.
+all be greatly improved through use of lockless techniques.
 A particularly impressive example of such a lockless technique are
 the statistical counters describe in
 Section~\ref{sec:count:Statistical Counters},
@@ -45,7 +45,7 @@ Other examples we have covered include:
 	Section~\ref{sec:SMPdesign:Resource Allocator Caches}.
 \item	The maze solver in Section~\ref{sec:SMPdesign:Beyond Partitioning}.
 \item	The data-ownership techniques described in
-	Section~\ref{chp:Data Ownership}.
+	Chapter~\ref{chp:Data Ownership}.
 \item	The reference-counting and RCU techinques described in
 	Chapter~\ref{chp:Deferred Processing}.
 \item	The lookup code paths described in Chapter~\ref{chp:Data Structures}.
diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 99e074d..c668f3c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -759,7 +759,7 @@ these combinations in order to fully understand how this works.
 	it is not possible for one of the loads to see the
 	results of the other load.
 	However, if we know that CPU~2's load from B returned a
-	newer value than CPU~1's load from B, the we also know
+	newer value than CPU~1's load from B, then we also know
 	that CPU~2's load from A returned either the same value
 	as CPU~1's load from A or some later value.

@@ -1047,7 +1047,7 @@ a few simple rules:
 	by the first CPU, then the second CPU's load from A must
 	give the value stored by the first CPU.
 \item	If one CPU does a load from A ordered before a store to B,
-	and if a second CPU does a load from B ordered before a store from A,
+	and if a second CPU does a load from B ordered before a store to A,
 	and if the second CPU's load from B gives the value stored by
 	the first CPU, then the first CPU's load from A must \emph{not}
 	give the value stored by the second CPU.
-- 
1.9.1

