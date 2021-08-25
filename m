Return-Path: <SRS0=Ut+l=NQ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jDl+w/vjulVwZZ91x6amC4ycMHT6x//T2/qTi8Drrt4=;
        b=VAxk+oovbQ+4wPEwlVejLhPQ8wQzhfjRaBEibwOcctOdzoIEewxE69j0J5fxcnVJwc
         oMBgwIl0jxmYkvWk0sUP6WJDgT3pNtFCyxlVonbv7p4R7/eWNScGjBGq8X5DTzymphIg
         krCL3JyK6ZBsmf5tRiye+EOOBuLoAywoqnYAWqXWNa38qaifB5TBQVAUYCHmJGidpKal
         2CJOCizVjSSMmxHSO7RAzhNPBKg26lOZtWLVj+sJjGmQiNWaGhOOPYXiECUuR+PK0Fq2
         G+KhM6D1rF6uZf0HMUJ73Gv+vbVEQiAO/6CS45GB1D+HXxp7WCAcJuSFOxbC18dZGsPK
         X8Gw==
Subject: [PATCH -perfbook 2/5] treewide: Annotate end-of-sentence periods
 after 'Appendix X'
References: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <631c72d5-8d1d-7d38-bbb8-aa7aa445bc72@gmail.com>
Date: Wed, 25 Aug 2021 18:39:25 +0900
MIME-Version: 1.0
In-Reply-To: <8e4ab0b0-2a64-3ff6-e35a-38778d9622cf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

TeX engine treats periods after "Appendix B", "Appendix C", etc. as
mid-sentence ones even if they come after \cref{chp:app:xxxx}.

Annotate them as end-of-sentence ones.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 ack.tex            | 2 +-
 cpu/overheads.tex  | 2 +-
 cpu/overview.tex   | 2 +-
 defer/rcuintro.tex | 2 +-
 howto/howto.tex    | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/ack.tex b/ack.tex
index 5ca46498..743b2bf4 100644
--- a/ack.tex
+++ b/ack.tex
@@ -17,7 +17,7 @@
 
 Akira Yokosawa is this book's \LaTeX\ advisor, which perhaps most
 notably includes the care and feeding of the style guide laid out
-in \cref{chp:app:styleguide:Style Guide}.
+in \cref{chp:app:styleguide:Style Guide}\@.
 This work includes table layout, listings, fonts, rendering of math,
 acronyms, bibliography formatting, epigraphs, hyperlinks, paper size.
 Akira also perfected the cross-referencing of quick quizzes, allowing
diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 2cfe931b..caedd9e9 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -116,7 +116,7 @@ events might ensue:
 This simplified sequence is just the beginning of a discipline called
 \emph{cache-coherency protocols}~\cite{Hennessy95a,DavidECuller1999,MiloMKMartin2012scale,DanielJSorin2011MemModel},
 which is discussed in more detail in
-\cref{chp:app:whymb:Why Memory Barriers?}.
+\cref{chp:app:whymb:Why Memory Barriers?}\@.
 As can be seen in the sequence of events triggered by a \IXacr{cas} operation,
 a single instruction can cause considerable protocol traffic, which
 can significantly degrade your parallel program's performance.
diff --git a/cpu/overview.tex b/cpu/overview.tex
index 33918e49..c68b0756 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -248,7 +248,7 @@ as described in the next section.
 
 Memory barriers will be considered in more detail in
 \cref{chp:Advanced Synchronization: Memory Ordering} and
-\cref{chp:app:whymb:Why Memory Barriers?}.
+\cref{chp:app:whymb:Why Memory Barriers?}\@.
 In the meantime, consider the following simple lock-based \IX{critical
 section}:
 
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 9b327afa..519f1627 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -445,7 +445,7 @@ Linux-kernel environments can be as simple as defining
 and \co{preempt_enable()}, respectively.\footnote{
 	Some toy RCU implementations that handle preempted
 	read-side critical sections are shown in
-	\cref{chp:app:``Toy'' RCU Implementations}.}
+	\cref{chp:app:``Toy'' RCU Implementations}\@.}
 However, this simple non-preemptible approach is conceptually complete,
 and demonstrates that it really is possible to provide read-side
 synchronization at zero cost, even in the face of concurrent updates.
diff --git a/howto/howto.tex b/howto/howto.tex
index 1e3474ff..00522f84 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -422,7 +422,7 @@ find CodeSamples -name rcu_rcpls.c -print
 \end{VerbatimU}
 
 This command will locate the file \path{rcu_rcpls.c}, which is called out in
-\cref{chp:app:``Toy'' RCU Implementations}.
+\cref{chp:app:``Toy'' RCU Implementations}\@.
 Non-UNIX systems have their own well-known ways of locating files by filename.
 
 \section{Whose Book Is This?}
-- 
2.17.1


