Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vALjwmLcPKksChIG1Xpm96cCaXjsF8QVdJQrVwEh+/0=;
 b=fl5uX+UEQ64AjkuIE+LrOCR5JRDDfHVGCLz9J6nJ4ibJPV1u7Fdcza1zJG11tUSfsY
 MWst+qKx3/iYcRruhxAJvTKadLiY7QFXMiez5/F7MyCd9GbdhxPa0dEIJOQaFTmVJbZ8
 yRPkLqeuqPo2kRZdxprP1+gft3E8Ge6CfWPLEnApRJVX5rS37g+fl+CochI0aFlVk8ll
 rl6djlzHzX6sayltMhMG6ZvDrpjC7tUewZ2CfLwlzJoK8sUejlBPSHmEoU4TsGPEinpc
 l9Rw9f0dLOLi16dqEEBTkJz/jkROlNBcQff6/KUVOEkj6tZ4T90k9hyZFYaGNt8RVVLq
 6O8g==
Subject: [PATCH 3/5] Use \O{} macro for 'order-of'
References: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <820a8c5a-5666-3d18-c4fa-7c6692e806fd@gmail.com>
Date: Mon, 23 Oct 2017 00:25:19 +0900
MIME-Version: 1.0
In-Reply-To: <6f0085b1-ca8e-d6f7-e613-1b1c8d119af6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e63ddb2e13bb0467de8ad00a767c35a5c75e6cc6 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Oct 2017 20:40:59 +0900
Subject: [PATCH 3/5] Use \O{} macro for 'order-of'

This macro was defined in commit b4ad25eae241 ("future/QC: Use
upright glyph for math constant and descriptive suffix").
Use the same macro in other cases for consistency.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/rt.tex            | 8 ++++----
 count/count.tex           | 4 ++--
 datastruct/datastruct.tex | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/advsync/rt.tex b/advsync/rt.tex
index 4d86c5d..0406efa 100644
--- a/advsync/rt.tex
+++ b/advsync/rt.tex
@@ -843,7 +843,7 @@ timed delays (as in \co{sleep(1)}, which are rarely cancelled),
 and timeouts for the \co{poll()} system call (which are often
 cancelled before they have a chance to fire).
 A good data structure for such timers would therefore be a priority queue
-whose addition and deletion primitives were fast and $O(1)$ in the number
+whose addition and deletion primitives were fast and $\O{1}$ in the number
 of timers posted.

 The classic data structure for this purpose is the \emph{calendar queue},
@@ -897,7 +897,7 @@ which, taken together, is much smaller than the 256-element array that
 would be required for a single array.

 This approach works extremely well for throughput-based systems.
-Each timer operation is $O(1)$ with small constant, and each timer
+Each timer operation is $\O{1}$ with small constant, and each timer
 element is touched at most $m+1$ times, where $m$ is the number of
 levels.

@@ -949,7 +949,7 @@ degradations of latency in real-time systems.

 Of course, real-time systems could simply choose a different data
 structure, for example, some form of heap or tree, giving up
-$O(1)$ bounds on insertion and deletion operations to gain $O(\log n)$
+$\O{1}$ bounds on insertion and deletion operations to gain $\O{\log n}$
 limits on data-structure-maintenance operations.
 This can be a good choice for special-purpose RTOSes, but is inefficient
 for general-purpose systems such as Linux, which routinely support
@@ -964,7 +964,7 @@ is good and sufficient.
 Another key observation is that error-handling timeouts are normally
 cancelled very early, often before they can be cascaded.
 A final observation is that systems commonly have many more error-handling
-timeouts than they do timer events, so that an $O(\log n)$
+timeouts than they do timer events, so that an $\O{\log n}$
 data structure should provide acceptable performance for timer events.

 In short, the Linux kernel's -rt patchset uses timer wheels for
diff --git a/count/count.tex b/count/count.tex
index 9638971..c35c7c2 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -414,13 +414,13 @@ avoids the delays inherent in such circulation.
 	The hardware could also apply an order to the requests, thus
 	returning to each CPU the return value corresponding to its
 	particular atomic increment.
-	This results in instruction latency that varies as $O(\log N)$,
+	This results in instruction latency that varies as $\O{\log N}$,
 	where $N$ is the number of CPUs, as shown in
 	Figure~\ref{fig:count:Data Flow For Global Combining-Tree Atomic Increment}.
 	And CPUs with this sort of hardware optimization are starting to
 	appear as of 2011.

-	This is a great improvement over the $O(N)$ performance
+	This is a great improvement over the $\O{N}$ performance
 	of current hardware shown in
 	Figure~\ref{fig:count:Data Flow For Global Atomic Increment},
 	and it is possible that hardware latencies might decrease
diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index c5038b6..46b4d8b 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1800,7 +1800,7 @@ a resize operation.

 It turns out that it is possible to reduce the per-element memory overhead
 from a pair of pointers to a single pointer, while still retaining
-$O(1)$ deletions.
+$\O{1}$ deletions.
 This is accomplished by augmenting split-order
 list~\cite{OriShalev2006SplitOrderListHash}
 with RCU
-- 
2.7.4


