Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Z+tpm/IeoI+ujALNtjg4eBE6G3kMTSKWi34xSKIiiic=;
 b=045Oq2EMZWrfOICF3kaO/r+XilZlMZjnHYT9+64Q6LQwb23P2EDce0DuYXR53kVs0i
 DFl/cT2a9TRboPtg2QV9P6qEs89bAqRW1eXOmFoDPq6iQTPK9MAaj54tlS6kA0tKTTd3
 05LjO+PglXus73GqAHULfrvbsDX41yjkQuwtaNUHE1d9T4o74KB28QqZPGReQwadyp2J
 ejSawHuRq67kvE4R9W1rekDzh4HJhYr82MG+nJRCcGFsq1hJj0muLAd1TV53/9XCeAo1
 AOZ3EJ7sToHvkKE0f5mLSehBXXzvDuuVqDFOfmoHYOOy1uyV53ES5Um/0ZNbEazo52mo
 XBsw==
Subject: [PATCH 1/5] Trial use of extdash package with shortcuts option
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ca0566a4-291c-a438-46dd-2becabaf101b@gmail.com>
Date: Tue, 9 Aug 2016 00:02:23 +0900
MIME-Version: 1.0
In-Reply-To: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 554632b41d91d5c8aa8eb217d2709d9cf0e56a02 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 6 Aug 2016 23:29:46 +0900
Subject: [PATCH 1/5] Trial use of extdash package with shortcuts option

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex               | 4 ++--
 howto/howto.tex               | 2 +-
 intro/intro.tex               | 6 +++---
 perfbook.tex                  | 1 +
 toolsoftrade/toolsoftrade.tex | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index dbb3530..29ad3fb 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -895,7 +895,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 } \QuickQuizEnd

 \QuickQuiz{}
-	Given that in the eventually-consistent algorithm shown in
+	Given that in the eventually\-/consistent algorithm shown in
 	Figure~\ref{fig:count:Array-Based Per-Thread Eventually Consistent Counters}
 	both reads and updates have extremely low overhead
 	and are extremely scalable, why would anyone bother with the
@@ -904,7 +904,7 @@ comes at the cost of the additional thread running \co{eventual()}.
 	given its costly read-side code?
 \QuickQuizAnswer{
 	The thread executing \co{eventual()} consumes CPU time.
-	As more of these eventually-consistent counters are added,
+	As more of these eventually\-/consistent counters are added,
 	the resulting \co{eventual()} threads will eventually
 	consume all available CPUs.
 	This implementation therefore suffers a different sort of
diff --git a/howto/howto.tex b/howto/howto.tex
index 63ca842..753a89f 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -270,7 +270,7 @@ Fortunately, there are many alternatives available to you:
 	the first formally published academic textbook to include a
 	section devoted to RCU.
 \item	If you would like an academic treatment of parallel
-	programming from a programming-language-pragmatics viewpoint,
+	programming from a programming\-/language\-/pragmatics viewpoint,
 	you might be interested in the concurrency chapter from Scott's
 	textbook~\cite{MichaelScott2006Textbook}
 	on programming-language pragmatics.
diff --git a/intro/intro.tex b/intro/intro.tex
index 4527f19..e54e5ad 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -108,7 +108,7 @@ and message-passing systems~\cite{OpenMPI2008,BOINC2008}.
 This book will draw primarily from the Linux kernel, but will
 provide much material suitable for user-level applications.

-Fourth, even though the large-scale parallel-programming projects of
+Fourth, even though the large-scale parallel\-/programming projects of
 the 1980s and 1990s were almost all proprietary projects, these
 projects have seeded other communities with a cadre of developers who
 understand the engineering discipline required to develop production-quality
@@ -731,8 +731,8 @@ difficult issues surrounding parallelism and persistence.

 In addition, there are a growing number of parallel library functions,
 particularly for numeric computation.
-Even better, some libraries take advantage of special-purpose
-hardware such as vector units and general-purpose graphical processing
+Even better, some libraries take advantage of special\-/purpose
+hardware such as vector units and general\-/purpose graphical processing
 units (GPGPUs).

 Taking this approach often sacrifices some performance, at least when
diff --git a/perfbook.tex b/perfbook.tex
index 95902be..34059e0 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -19,6 +19,7 @@
 \usepackage{enumerate}
 \usepackage{ifthen}
 \usepackage{xcolor}
+\usepackage[shortcuts]{extdash}
 \usepackage{listings}
 \lstset{basicstyle=\ttfamily}
 % \usepackage[strings]{underscore}
diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 97f46fc..9ed50fe 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -785,7 +785,7 @@ values of \co{x} stored by \co{lock_writer()}.

 	One possible exception to this rule is ``transactional memory'',
 	which is currently a research topic.
-	Transactional-memory semantics can be loosely thought of as those
+	Transactional\-/memory semantics can be loosely thought of as those
 	of a single global lock with optimizations permitted and
 	with the addition of rollback~\cite{HansJBoehm2009HOTPAR}.
 } \QuickQuizEnd
-- 
1.9.1


