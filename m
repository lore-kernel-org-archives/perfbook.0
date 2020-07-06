Return-Path: <SRS0=FJjT=AR=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=090AGZS3X54paJlMLdJzTe9sJMoPE+WlpEevUOggrYg=;
        b=ZU9FYk7CgA7ysVz+nd/IO732WXM6Ug7rNa1zfnhjy8JEbHR85g+kQhBYJPfyakhL+V
         twGyW0SdOZ3YjYbMyCW5EAiSTxCh3HL8EFncFG6cTUmWY8I+jM2V+txsP7pf+ken9OrJ
         uc3sJ4dAqyhu4vE9qDj1Bbl5yipjaGmW81rPwQZz/i+LAsR5Q8zdTxpN5G7GBRwMiB0C
         4/q3EaW8/URDQE6NpXdSaXq47jAAf3eii5nDGyL3bereXzhmiD3B3+jvX6/j+TiPGWYV
         kqTyD4Vr4tOFaepukghjrVl+EZUQyvsO/hfvjRk/7MmtQIH6MagVRz0Ii2UqjfKxfEUn
         Uqog==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] appendix/whymb: Use 'step' as ref name in QQs
Message-ID: <7f8a8abc-b2f1-8632-2025-493966f50496@gmail.com>
Date: Tue, 7 Jul 2020 00:00:25 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From d88020c19e6bf66f3055d4cdae2648d545bcfa6e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 6 Jul 2020 23:41:06 +0900
Subject: [PATCH] appendix/whymb: Use 'step' as ref name in QQs

The \cref{} command added in commit e68dcb9a4f1a ("appendix/whymb:
Add QQ on cachelines in dirty shared state") puts "item" as the
reference name.  This is the default behavior for enumerate list.

As is observed in a couple of existing QQs in this appendix, "step"
is the right word to reference an entry in a sequence of operations.

With the help of "enumitem" package, we can define a new list
environment "sequence" and specify "step" as the name used by
cleveref's \cref{} commands.

Converting existing lists of sequences to the new "sequence" lists
and putting necessary labels can automatically use "step" in the
references to the sequence lists.

As a bonus, cross-references from the other QQs are now enabled.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/whymb/whymemorybarriers.tex | 34 ++++++++++++++++------------
 perfbook-lt.tex                      |  4 ++++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
index e41cc931..a6e9fcdf 100644
--- a/appendix/whymb/whymemorybarriers.tex
+++ b/appendix/whymb/whymemorybarriers.tex
@@ -704,7 +704,7 @@ shown in
 \cref{fig:app:whymb:Caches With Store Buffers},
 one would be surprised.
 Such a system could potentially see the following sequence of events:
-\begin{enumerate}
+\begin{sequence}
 \item	CPU~0 starts executing the \co{a = 1}.
 \item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
 \item	CPU~0 therefore sends a ``read invalidate'' message in order to
@@ -725,7 +725,7 @@ Such a system could potentially see the following sequence of events:
 	and stores it into the cache line containing ``b''
 	(which we will assume is already owned by CPU~0).
 \item	CPU~0 executes \co{assert(b == 2)}, which fails.
-\end{enumerate}
+\end{sequence}
 
 The problem is that we have two copies of ``a'', one in the cache and
 the other in the store buffer.
@@ -778,10 +778,11 @@ Suppose CPU~0 executes foo() and CPU~1 executes bar().
 Suppose further that the cache line containing ``a'' resides only in CPU~1's
 cache, and that the cache line containing ``b'' is owned by CPU~0.
 Then the sequence of operations might be as follows:
-\begin{enumerate}
+\begin{sequence}
 \item	CPU~0 executes \co{a = 1}.  The cache line is not in
 	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
 	store buffer and transmits a ``read invalidate'' message.
+	\label{seq:app:whymb:Store Buffers and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
 	It therefore transmits a ``read'' message.
@@ -806,10 +807,11 @@ Then the sequence of operations might be as follows:
 \item	CPU~0 receives the cache line containing ``a'' and applies
 	the buffered store just in time to fall victim to CPU~1's
 	failed assertion.
-\end{enumerate}
+\end{sequence}
 
 \QuickQuiz{
-	In step~1 above, why does CPU~0 need to issue a ``read invalidate''
+	In \cref{seq:app:whymb:Store Buffers and Memory Barriers} above,
+	why does CPU~0 need to issue a ``read invalidate''
 	rather than a simple ``invalidate''?
 }\QuickQuizAnswer{
 	Because the cache line in question contains more than just the
@@ -845,7 +847,7 @@ stores until all of the prior entries in the store buffer had been
 applied.
 
 With this latter approach the sequence of operations might be as follows:
-\begin{enumerate}
+\begin{sequence}
 \item	CPU~0 executes \co{a = 1}.  The cache line is not in
 	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
 	store buffer and transmits a ``read invalidate'' message.
@@ -896,7 +898,7 @@ With this latter approach the sequence of operations might be as follows:
 	cache line containing the new value of ``b''
 	to CPU~1.
 	It also marks its own copy of this cache line as ``shared''.
-	\label{label:app:whymb:Store buffers: All copies shared}
+	\label{seq:app:whymb:Store buffers: All copies shared}
 \item	CPU~1 receives the cache line containing ``b'' and installs
 	it in its cache.
 \item	CPU~1 can now load the value of ``b'',
@@ -908,12 +910,12 @@ With this latter approach the sequence of operations might be as follows:
 	Once it gets this cache from CPU~0, it will be
 	working with the up-to-date value of ``a'', and the assertion
 	therefore passes.
-\end{enumerate}
+\end{sequence}
 
 \QuickQuiz{
-	After \cref{label:app:whymb:Store buffers: All copies shared}
+	After \cref{seq:app:whymb:Store buffers: All copies shared}
 	in \cref{sec:app:whymb:Store Buffers and Memory Barriers} on
-	page~\pageref{label:app:whymb:Store buffers: All copies shared},
+	page~\pageref{seq:app:whymb:Store buffers: All copies shared},
 	both CPUs might drop the cache line containing the new value of
 	``b''.
 	Wouldn't that cause this new value to be lost?
@@ -1037,12 +1039,13 @@ void bar(void)
 
 Then the sequence of operations might be as follows:
 \begin{fcvref}[ln:app:whymb:Breaking mb]
-\begin{enumerate}
+\begin{sequence}
 \item	CPU~0 executes \co{a = 1}.  The corresponding
 	cache line is read-only in
 	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
 	store buffer and transmits an ``invalidate'' message in order
 	to flush the corresponding cache line from CPU~1's cache.
+	\label{seq:app:whymb:Invalidate Queues and Memory Barriers}
 \item	CPU~1 executes \co{while (b == 0) continue}, but the cache line
 	containing ``b'' is not in its cache.
 	It therefore transmits a ``read'' message.
@@ -1069,11 +1072,12 @@ Then the sequence of operations might be as follows:
 \item	Despite the assertion failure, CPU~1 processes the queued
 	``invalidate'' message, and (tardily)
 	invalidates the cache line containing ``a'' from its own cache.
-\end{enumerate}
+\end{sequence}
 \end{fcvref}
 
 \QuickQuiz{
-	In step~1 of the first scenario in
+	In \cref{seq:app:whymb:Invalidate Queues and Memory Barriers}
+	of the first scenario in
 	\cref{sec:app:whymb:Invalidate Queues and Memory Barriers},
 	why is an ``invalidate'' sent instead of a ''read invalidate''
 	message?
@@ -1161,7 +1165,7 @@ void bar(void)
 
 \begin{fcvref}[ln:app:whymb:Add mb]
 With this change, the sequence of operations might be as follows:
-\begin{enumerate}
+\begin{sequence}
 \item	CPU~0 executes \co{a = 1}.  The corresponding
 	cache line is read-only in
 	CPU~0's cache, so CPU~0 places the new value of ``a'' in its
@@ -1199,7 +1203,7 @@ With this change, the sequence of operations might be as follows:
 	containing the new value of ``a''.
 \item	CPU~1 receives this cache line, which contains a value of 1 for
 	``a'', so that the assertion does not trigger.
-\end{enumerate}
+\end{sequence}
 \end{fcvref}
 
 With much passing of MESI messages, the CPUs arrive at the correct answer.
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 3f21bb92..46b6ad06 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -40,6 +40,8 @@
 \usepackage{setspace}
 \usepackage{enumitem}
 \setlist[description]{style=unboxed}
+\newlist{sequence}{enumerate}{10}
+\setlist[sequence]{label*=\arabic*}
 %\usepackage{enumerate}
 \usepackage{ifthen}
 \usepackage[table,svgnames]{xcolor}
@@ -218,6 +220,8 @@
 \usepackage[capitalise,noabbrev,nosort]{cleveref}
 \crefname{subsubsubappendix}{Appendix}{Appendices}
 \crefname{sublisting}{Listing}{Listings}
+\crefname{sequencei}{step}{steps}
+\Crefname{sequencei}{Step}{Steps}
 \newcommand{\crefrangeconjunction}{--}
 \newcommand{\creflastconjunction}{, and~}
 
-- 
2.17.1

