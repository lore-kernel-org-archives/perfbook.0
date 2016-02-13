Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+aBytkVl5pkYHJSSoUs3NItrcbMtrJu3wXlufBELqpE=;
 b=bcdooDnDOqHXX0LAegnoGTdqhI9dKvdHzGoK7JOpyQi+2J9tiSdF5ArU8qwLCEuaTi
 70VPFM+cr18yu4p80mWuY5lIifevs4ls4UTphdkrzNkZWWDy2ITfjr4J9CcimwcHSaxl
 mdx/Pej4PEsEHGn6G8EgRe0f1oHnuuTqHYpfDvC+tSfuLS2nt8jvVW3Y+ycwgil7xXLU
 IpblQlJ7CaySQ3foZT1YjBznYv821UQBAc2401+pZgV3+Tj/0L6UJtyRetUd4xJi53cz
 HwyloJvcs81F3krmhSYC1PgPbZG4fe+L4G5p5aDZ89gzBxetw9C7upLeQcDU8d5CTIqZ
 LPYQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 2/2] cpu: rearrange summary of chapter
Date: Sun, 14 Feb 2016 08:28:37 +0900
Message-Id: <1455406117-6924-2-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
References: <1455406117-6924-1-git-send-email-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Summary of chapter and introduction about following chapters is in the
end part of `swdesign.tex` though it is not software design specific
content.  Moreover, the detailed introduction about following chapters
is in `cpu.tex`, too.  It would be better to gather them in one `tex`
file.  This commit gather them in `cpu.tex`.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 cpu/cpu.tex      | 13 +++++++++++++
 cpu/swdesign.tex | 13 -------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/cpu/cpu.tex b/cpu/cpu.tex
index 6f1ae54..d765e71 100644
--- a/cpu/cpu.tex
+++ b/cpu/cpu.tex
@@ -43,6 +43,19 @@ text~\cite{Hennessy95a}.
 \input{cpu/hwfreelunch}
 \input{cpu/swdesign}

+So, to sum up:
+
+\begin{enumerate}
+\item	The good news is that multicore systems are inexpensive and
+	readily available.
+\item	More good news:  The overhead of many synchronization operations
+	is much lower than it was on parallel systems from the early 2000s.
+\item	The bad news is that the overhead of cache misses is still high,
+	especially on large systems.
+\end{enumerate}
+
+The remainder of this book describes ways of handling this bad news.
+
 In particular,
 Chapter~\ref{chp:Tools of the Trade} will cover some of the low-level
 tools used for parallel programming,
diff --git a/cpu/swdesign.tex b/cpu/swdesign.tex
index cdae106..4e9e91d 100644
--- a/cpu/swdesign.tex
+++ b/cpu/swdesign.tex
@@ -88,16 +88,3 @@ problem into one for which an embarrassingly parallel solution exists.
 	techniques to be used on the non-performance-critical bulk of
 	the program.
 } \QuickQuizEnd
-
-So, to sum up:
-
-\begin{enumerate}
-\item	The good news is that multicore systems are inexpensive and
-	readily available.
-\item	More good news:  The overhead of many synchronization operations
-	is much lower than it was on parallel systems from the early 2000s.
-\item	The bad news is that the overhead of cache misses is still high,
-	especially on large systems.
-\end{enumerate}
-
-The remainder of this book describes ways of handling this bad news.
-- 
1.9.1

