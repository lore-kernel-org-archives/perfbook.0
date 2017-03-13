Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=EOyOSO1tt48CHYMpKXZUweb4ejbGz4WVYgquscE4LTE=;
 b=M+mMinxPKCqqPojb65CPqILK8kcxcaU9vybJWLHWpuCXXWT9U7TM7+KIU6MlzOHCuX
 yGkOIcdQ0ES1Lk3YNE+2ISMyJIOBu6cyYTzRwFqmDiYhXnLvsN2BYVKqUYz3kDe02IXq
 HjszaxMhGo72so7QJlGakzFrxGvfFbEu0TWDKRbr/7j8q6ZgNU38KZtQ8k2YO33WRHmg
 +dz7VL5OOaJngYRtyITejhoKcPFo3jJbJnFcub0ThD5jzR3Ir7HbOy2SpNPQZIcQ2viJ
 Ta+rPLMeavSpV230mfJxsq+H22MtiYGnXJJR8RRDc0QrS7BJAsXe13Z+2Gfg3ZxkOMmG
 hTxw==
Subject: [PATCH 6/6] advsync/memorybarriers: Distinguish 'CPU family' from
 'CPU'
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <cf0de98b-48cf-760e-a790-f03be7a8dc15@gmail.com>
Date: Tue, 14 Mar 2017 07:49:25 +0900
MIME-Version: 1.0
In-Reply-To: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 93e02eca9bb8361be47e0936f5d2ca56586bc093 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:50:56 +0900
Subject: [PATCH 6/6] advsync/memorybarriers: Distinguish 'CPU family' from 'CPU'

In these paragraphs, "CPU" stands for either "CPU core" or
"CPU family".  Explicitly use "CPU family" for the latter.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 85e9162..15ed1f6 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -415,11 +415,11 @@ If you just want to be told what the rules are rather than suffering
 through the actual derivation,
 please feel free to skip to Section~\ref{sec:advsync:A Few Simple Rules}.

-The exact semantics of memory barriers vary wildly from one CPU to
+The exact semantics of memory barriers vary wildly from one CPU family to
 another, so portable code must rely only on the least-common-denominator
 semantics of memory barriers.

-Fortunately, all CPUs impose the following rules:
+Fortunately, all CPU families impose the following rules:
 \begin{enumerate}
 \item	All accesses by a given CPU will appear to that CPU to have
 	occurred in program order.
@@ -442,9 +442,9 @@ Each of these properties is described in the following sections.
 A given CPU will see its own accesses as occurring in ``program order'',
 as if the CPU was executing only one instruction at a time with no
 reordering or speculation.
-For older CPUs, this restriction is necessary for binary compatibility,
+For older CPU families, this restriction is necessary for binary compatibility,
 and only secondarily for the sanity of us software types.
-There have been a few CPUs that violate this rule to a limited extent,
+There have been a few CPU families that violate this rule to a limited extent,
 but in those cases, the compiler has been responsible
 for ensuring that ordering is explicitly enforced as needed.

@@ -511,7 +511,7 @@ of an external logic analyzer
 However, if CPU~2's access to B sees the result of CPU~1's access
 to B, then CPU~2's access to A is guaranteed to see the result of
 CPU~1's access to A.
-Although some CPUs' memory barriers do in fact provide stronger,
+Although some CPU families' memory barriers do in fact provide stronger,
 unconditional ordering guarantees, portable code may rely only
 on this weaker if-then conditional ordering guarantee.

-- 
2.7.4


