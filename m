Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=mOmwSOLDpf0udY0pgywos9ZKjnOXUPLy000VK7FY31Y=;
 b=DUzzU8l08wTrnu33KY0MSAtAVHAEdXnsjZW1bGqDmOkz4SA4rzpheiSnI1orqUO73I
 EP+sIOR5Zl2VZmQ8lyEPhkFz8v7DhvCnsYy9JUpUQEnaY4E28lD3D/np1gPIW252vv5C
 gczSyabA5KmSWrZ6phOCtaiBA1Tc3e9HLlgbvuTMkoZu+Yg9Exhuy00mTmorIZQSQelu
 TEY3vIklq5Bldd5BAlhbZQ/T5KqPFUehZ9VP8aSWB1LDAuz9/vSElwJhxrF+/eRcjd8d
 WMNCGn3Tu7YluQchtFBNqM7krWD3ybUdljlp2ZoyugU3jHEBMM9FZuGGIT4ZJSRHDAUK
 noqg==
Subject: [PATCH v2 6/6] advsync/memorybarriers: Distinguish 'CPU family' from
 'CPU'
References: <b0933155-7c2b-d271-c2a4-8cf78b133193@gmail.com>
 <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0756e203-7bfa-0d50-0d50-439b8e607bcf@gmail.com>
Date: Tue, 14 Mar 2017 21:43:19 +0900
MIME-Version: 1.0
In-Reply-To: <c00849e8-cff8-2db0-d14a-d46593766761@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From ad3fca471bd3a6178f7988bbe5c9ab903f86722a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 13 Mar 2017 20:50:56 +0900
Subject: [PATCH v2 6/6] advsync/memorybarriers: Distinguish 'CPU family' from 'CPU'

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


