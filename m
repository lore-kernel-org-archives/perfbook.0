Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=sqUIucMmAZLBQ9LEmO/j2DcMiFN5E7kOOF7jKOyYqgI=;
 b=IZlH1iY2VE24rOvIEoe4hX91VM5l8gPpOL3N4xq1ugj9yjf9Z/IggJ9IIXc+OEvDN7
 6rr2yBpP693GKSxq30J/z3SKHXku1z7o2sl2hCHAYKyxjlz8TGq9gnIdHIsjGwIPF29S
 6xfSkPGg/kDaoDd4cr7H7QdnbDOTPkSeZz8S8DtPyGHgURaQJCV3vpWJl4ew/dtupqF7
 lUYjPdvHyDW8ryW/Y91HvkrcITwUzcNf/sQ4obL4eoMIwTuLKRyuILBPhreKf8+LusPU
 YLb9p/mqrPxxMSvsUyCjNUFTZ8mwrbIcNGpLQNWHY+KvotamLNwtQgPJhD52L1/2YQvH
 Gx5w==
Subject: [PATCH 3/3] advsync/memorybarriers: Fix trivial typo
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <88db270a-b9e7-79ff-8cbc-66ef84ef97f1@gmail.com>
Date: Fri, 23 Dec 2016 17:11:47 +0900
MIME-Version: 1.0
In-Reply-To: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cbb7797d6b307850a280248589bc09b8852e8a68 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 16:27:22 +0900
Subject: [PATCH 3/3] advsync/memorybarriers: Fix trivial typo

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index e117c2c..e35e04c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1770,7 +1770,7 @@ for a larger example.
 \subsubsection{Control Dependencies}
 \label{sec:advsync:Control Dependencies}

-Control dependencies are expecially tricky because current compilers
+Control dependencies are especially tricky because current compilers
 do not understand them.
 The rules and examples in this section are intended to help you
 prevent your compiler's ignorance from breaking your code.
-- 
2.7.4


