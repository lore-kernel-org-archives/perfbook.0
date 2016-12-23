Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LA3KWyp/zZaQ3lqhLEdrurLVSxPADnf3ZNYhlY5FYbA=;
 b=mY9qtgbaBa5+ZMe1VaisDzc7N7AZFlJhJ880Ft2whw6K20fiClnp7FBTIHBJ7kUrS3
 CChvkuIgasovwv0amRsAABuG+mTP5aWCVZa83n4VF95CQJrVnIDshBwsuNnxkMo2tuwM
 tkVh5cDtWbQceRr/jI9iHx+Crmh0vf5n4NEwAWRa8efRdbtRhFoI3O57p9pifZek9y0M
 bRrVWvzVwLuNWxPmjixubOU1haL4OuNilgLml0v3i8ooitpHq3bWmAuCwq7/TEZessJw
 8XEcKd6J3AiFt8iKfLFwlmyH8QQNExpAX3YJeWcXR2T8u03JigWJapGCOcv5w4N9VWKK
 THzQ==
Subject: [PATCH 1/3] advsync/memorybarriers: Use consistent quotation marks
References: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7c50a507-aa49-7b4e-e59e-848803fba60d@gmail.com>
Date: Fri, 23 Dec 2016 17:09:11 +0900
MIME-Version: 1.0
In-Reply-To: <729a5146-a533-0511-d3a0-88ca20a10106@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3a094a4d803cb8b38edc292dd4233e16d8acfd9a Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 23 Dec 2016 16:00:05 +0900
Subject: [PATCH 1/3] advsync/memorybarriers: Use consistent quotation marks

Recent update of "Data Dependency Barriers" section inherits
inconsistent quotation of variable names and C language keywords
in memory-barriers.txt.
To make them look consistent, this commit uses double quotation
marks around \co{} macro for them.
It also fixes a typo of atomic64_read().

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 10eafd1..8018f8c 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -1795,7 +1795,7 @@ Consider the following bit of code:
 This will not have the desired effect because there is no actual data
 dependency, but rather a control dependency that the CPU may short-circuit
 by attempting to predict the outcome in advance, so that other CPUs see
-the load from b as having happened before the load from a.
+the load from ``\co{b}'' as having happened before the load from ``\co{a}''.
 In such a case what's actually required is:

 \vspace{5pt}
@@ -1830,13 +1830,13 @@ Control dependencies pair normally with other types of barriers.
 That said, please note that neither \co{READ_ONCE()} nor \co{WRITE_ONCE()}
 are optional!
 Without the \co{READ_ONCE()}, the compiler might combine the load
-from `\co{a}' with other loads from `\co{a}'.
+from ``\co{a}'' with other loads from ``\co{a}''.
 Without the \co{WRITE_ONCE()}, the compiler might combine the store to
-`\co{b}' with other stores to `\co{b}'.
+``\co{b}'' with other stores to ``\co{b}''.
 Either can result in highly counterintuitive effects on ordering.

 Worse yet, if the compiler is able to prove (say) that the value of
-variable `\co{a}' is always non-zero, it would be well within its rights
+variable ``\co{a}'' is always non-zero, it would be well within its rights
 to optimize the original example by eliminating the ``\co{if}'' statement
 as follows:

@@ -1890,8 +1890,8 @@ optimization levels:
 \end{minipage}
 \vspace{5pt}

-Now there is no conditional between the load from `\co{a}' and the store to
-`\co{b}', which means that the CPU is within its rights to reorder them:
+Now there is no conditional between the load from ``\co{a}'' and the store to
+``\co{b}'', which means that the CPU is within its rights to reorder them:
 The conditional is absolutely required, and must be present in the
 assembly code even after all compiler optimizations have been applied.
 Therefore, if you need ordering in this example, you need explicit
@@ -1914,10 +1914,10 @@ memory barriers, for example, a release store:
 \vspace{5pt}

 The initial \co{READ_ONCE()} is still required to prevent the compiler from
-proving the value of `\co{a}'.
+proving the value of ``\co{a}''.

 In addition, you need to be careful what you do with the local variable
-`\co{q}',
+``\co{q}'',
 otherwise the compiler might be able to guess the value and again remove
 the needed conditional.
 For example:
@@ -1954,7 +1954,7 @@ transform the above code into the following:
 \vspace{5pt}

 Given this transformation, the CPU is not required to respect the ordering
-between the load from variable `\co{a}' and the store to variable `\co{b}'.
+between the load from variable ``\co{a}'' and the store to variable ``\co{b}''.
 It is tempting to add a \co{barrier()} to constrain the compiler,
 but this does not help.
 The conditional is gone, and the barrier won't bring it back.
@@ -1978,7 +1978,7 @@ that \co{MAX} is greater than one, perhaps as follows:
 \end{minipage}
 \vspace{5pt}

-Please note once again that the stores to `\co{b}' differ.
+Please note once again that the stores to ``\co{b}'' differ.
 If they were identical, as noted earlier, the compiler could pull this
 store outside of the ``\co{if}'' statement.

@@ -2131,7 +2131,7 @@ The following list of rules summarizes the lessons of this section:
 	\co{smp_wmb()}, or, in the case of prior stores and later loads,
 	\co{smp_mb()}.

-\item	If both legs of the "if" statement begin with identical stores
+\item	If both legs of the ``\co{if}'' statement begin with identical stores
 	to the same variable, then those stores must be ordered,
 	either by preceding both of them with \co{smp_mb()} or by using
 	\co{smp_store_release()} to carry out the stores.
@@ -2151,14 +2151,14 @@ The following list of rules summarizes the lessons of this section:
 \item	Control dependencies require that the compiler avoid reordering
 	the dependency into nonexistence.
 	Careful use of \co{READ_ONCE()}, \co{atomic_read()}, or
-	\co{atomic,64_read()} can help to preserve your control
+	\co{atomic64_read()} can help to preserve your control
 	dependency.

 \item	Control dependencies apply only to the ``\co{then}'' and
 	``\co{else}'' of the ``\co{if}'' containing the control
 	dependency, including any functions that these two clauses call.
 	Control dependencies do \emph{not} apply to code following the
-	`\co{if}'' containing the control dependency.
+	``\co{if}'' containing the control dependency.

 \item	Control dependencies pair normally with other types of barriers.

-- 
2.7.4


