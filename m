Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=BtAVbcg9DXdsZ+EkXKUYACA7RhUmVcvA7biMa8ze7Uw=;
 b=HZF9FLfj766vayWmgqF2/ZCzPhzEbYFYqyvYI/u7FYQDWbpdtdo6QLwx3Ob9WVC8T3
 /xVb9IdMZW1+Qq5DDexv3n8eO05r6LFXT7ctvA1ZPUmzf+5cezEEEgcoaXco7OHys4eX
 vm7mIfYjiCl65ytxGlTfpAuRo6CgT0+yk4q+Rsl2782GCJEQ/kaTQIxTGjxnhuAvLELn
 J/hacUSGEU718T9708pJvZqP3NEZypduVU6LfhZr7AvkMMwu+s4c2eOgIlMLDbqAZGa2
 8oK8vQvNP/5on+8RUsnoRgLNZZOwPsrWAgF2i5TrdccDr+WkYCbBcyLfn/JO1HuwYP8K
 6gww==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Fix typo
Message-ID: <80b3d435-7485-0e5c-ba2d-c2d8c463f4a7@gmail.com>
Date: Thu, 24 Aug 2017 23:49:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 8d70beda36d683ee6869581155db91153b68338c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 24 Aug 2017 23:30:50 +0900
Subject: [PATCH] advsync: Fix typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This patch fixes a few typos after your self-review.
I'm not sure if the 1st hunk of "stop -> step" is necessary.
If "stop" was your intended word choice, please omit it.

     Thanks, Akira
--
 advsync/memorybarriers.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index dd8acf8..db6d486 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -341,7 +341,7 @@ exists (1:r2=0 /\ 0:r2=0)
 However, if you need to implement the synchronization primitives
 themselves, or if you are simply interested in understanding how memory
 ordering and memory barriers work, read on!
-The first stop is
+The first step is
 Listing~\ref{lst:advsync:Memory Ordering: Store-Buffering Litmus Test}
 (\path{C-SB+o-mb-o+o-mb-o.litmus}),
 which the \co{smp_mb()} Linux-kernel full memory barrier placed between
@@ -613,7 +613,7 @@ Section~\ref{sec:advsync:Memory Ordering and Memory Barriers}
 showed that even relatively strongly ordered systems like x86
 can reorder prior stores with later loads, at least when the
 store and load are to different variables.
-This section buids on that result, looking at the other combinations of
+This section builds on that result, looking at the other combinations of
 loads and stores.

 % @@@ Rationale for further reordering.
@@ -665,7 +665,7 @@ but no ordering is specified for the reads.
 Relatively strongly ordered architectures, such as x86, do enforce ordering.
 However, weakly ordered architectures often do
 not~\cite{JadeAlglave2011ppcmem}.
-Therefore, the \co{exists} clause on line~25 of the figure \emph{can}
+Therefore, the \co{exists} clause on line~25 of the listing \emph{can}
 trigger.

 \begin{listing}[tbp]
-- 
2.7.4

