Return-Path: <SRS0=Si6l=NB=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CJNPYU5gs2ZMyMaX0njUb0wDI297wcAPXY32rRMD3MM=;
        b=q+3JvYawZSd17JvRTTewqiiCzz8DhsZQ1FZX0vzt1V+QrlYzcGZpQDy3QBZ2B4KwHj
         rlqCmjxGHxt82ZmkhXUW1R+Kv1TxPggh77mt/e3LYaFJ9Uai2rZ8aIapANbIuYiC+7TW
         lX5FKgLRW0PEemOY7nTXo3r4O6LwmNzv2PPeS8ZiIsc8eGHc/aZ3vkkgNm46CpbHz+WF
         gb+GDozH4/IJ6AwqkFsLv4a2iKH6o0xVPCBwVNkcxlcn5YUUtjf5wutkJpLQnnp64AkT
         y4+P+Nlc/n/KVhQAdknTHZwTfZfev/srD168G4qkmJPAooZqJgqJFR0NnrV2RI/0LEdA
         n5ZQ==
Subject: [PATCH 4/7] together: Break and capitalize after colon
References: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e72b776c-5e25-96a5-f505-f0702ab1870e@gmail.com>
Date: Tue, 10 Aug 2021 13:44:14 +0900
MIME-Version: 1.0
In-Reply-To: <ba83888b-a10e-4a9e-d55d-e6e2ca5cacb9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 together/applyrcu.tex |  6 +++---
 together/count.tex    | 10 +++++-----
 together/refcnt.tex   |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 1f157a21..975a10a6 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -394,9 +394,9 @@ data element shown in
 The \co{meas_1}, \co{meas_2}, and \co{meas_3} fields are a set
 of correlated measurements that are updated periodically.
 It is critically important that readers see these three values from
-a single measurement update: If a reader sees an old value of
-\co{meas_1} but new values of \co{meas_2} and \co{meas_3}, that
-reader will become fatally confused.
+a single measurement update:
+If a reader sees an old value of \co{meas_1} but new values of
+\co{meas_2} and \co{meas_3}, that reader will become fatally confused.
 How can we guarantee that readers will see coordinated sets of these
 three values?\footnote{
 	This situation is similar to that described in
diff --git a/together/count.tex b/together/count.tex
index 882e975c..2650f5ba 100644
--- a/together/count.tex
+++ b/together/count.tex
@@ -46,16 +46,16 @@ which would be a severe bottleneck on large systems.
 
 Another approach is to ``just say no'' to counting, following the example
 of the \co{noatime} mount option.
-If this approach is feasible, it is clearly the best:  After all, nothing
-is faster than doing nothing.
+If this approach is feasible, it is clearly the best:
+After all, nothing is faster than doing nothing.
 If the lookup count cannot be dispensed with, read on!
 
 Any of the counters from \cref{chp:Counting}
 could be pressed into service, with the statistical counters described in
 \cref{sec:count:Statistical Counters} being perhaps the most common choice.
-However, this results in a large memory footprint: The number of counters
-required is the number of data elements multiplied by the number of
-threads.
+However, this results in a large memory footprint:
+The number of counters required is the number of data elements multiplied
+by the number of threads.
 
 If this memory overhead is excessive, then one approach is to keep
 per-core or even per-socket counters rather than per-CPU counters,
diff --git a/together/refcnt.tex b/together/refcnt.tex
index 5cdde7cc..b30acf5b 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -139,7 +139,7 @@ contain memory barriers, and all checked acquisition operations also
 contain memory barriers.
 Therefore, cases ``CA'' and ``MCA'' are equivalent to ``CAM'', so that
 there are sections below for only the first four cases and the sixth case:
-``$-$'', ``A'', ``AM'', ``CAM'', and ``M''.
+``$-$'', ``A'', ``AM'', ``CAM'', and ``M\@''.
 Later sections describe optimizations that can improve performance
 if reference acquisition and release is very frequent, and the
 reference count need be checked for zero only very rarely.
-- 
2.17.1


