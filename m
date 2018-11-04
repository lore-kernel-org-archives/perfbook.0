Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IhwpVVPbRZNHcQiqu8YqBmkXpQflZFj3kyEW/WIQX7c=;
        b=oUgzGmpp1KmpRfWI3gEskLez4ewxKrxDDt22ZxJt+GWn2tsYINw8h95Sl2TjpL3YK6
         sNjJLHI8MG0tdRBer8l3j9G0EWI3wgPwVk5SHR4QXQksP3gI2P7RaFMf2ohrd8IHtXSX
         JhHqp4UBXWr1FmgOPZAakf6c8Xv4WY+A/N2Zy8jh384T6+vLD1P/COfCZbK2nIiY81mr
         TaBm4QX29MizsBAVgkcytLMB5/pI9yJnpYeigBdMm4mOrFHUclZBCvf+3eBY6TiHC/xB
         o7ICEytaz3mSF/nHVxWj26QSzEvE2AvwVYhtQs+A4Q9N0UDug/usar/sXdmXSyUPBvvN
         t0uQ==
Subject: [PATCH 1/7] howto, cpu: Employ new scheme for command/code snippets
References: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6c8a1153-c585-f99c-604a-059437a75469@gmail.com>
Date: Sun, 4 Nov 2018 09:08:43 +0900
MIME-Version: 1.0
In-Reply-To: <fc130ee3-dbd0-b0d1-41a6-b49baa6b00e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 687613a6796f9c2b2539757e9041b6f89e94f426 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 28 Oct 2018 17:41:47 +0900
Subject: [PATCH 1/7] howto, cpu: Employ new scheme for command/code snippets

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 cpu/overview.tex | 15 +++++---------
 howto/howto.tex  | 60 ++++++++++++++++++++++----------------------------------
 2 files changed, 28 insertions(+), 47 deletions(-)

diff --git a/cpu/overview.tex b/cpu/overview.tex
index 7c02c13..071cf7c 100644
--- a/cpu/overview.tex
+++ b/cpu/overview.tex
@@ -203,16 +203,11 @@ Appendix~\ref{chp:app:whymb:Why Memory Barriers?}.
 In the meantime, consider the following simple lock-based critical
 section:
 
-\vspace{5pt}
-\begin{minipage}[t]{\columnwidth}
-\small
-\begin{verbatim}
-  1 spin_lock(&mylock);
-  2 a = a + 1;
-  3 spin_unlock(&mylock);
-\end{verbatim}
-\end{minipage}
-\vspace{5pt}
+\begin{VerbatimN}
+spin_lock(&mylock);
+a = a + 1;
+spin_unlock(&mylock);
+\end{VerbatimN}
 
 \begin{figure}[tb]
 \centering
diff --git a/howto/howto.tex b/howto/howto.tex
index e88bd90..2fbf8a3 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -346,13 +346,9 @@ this source code may be found in the \path{CodeSamples} directory
 of this book's git tree.
 For example, on UNIX systems, you should be able to type the following:
 
-\begin{quote}
-	{\scriptsize
-	\begin{verbatim}
-		find CodeSamples -name rcu_rcpls.c -print
-	\end{verbatim}
-	}
-\end{quote}
+\begin{VerbatimU}
+find CodeSamples -name rcu_rcpls.c -print
+\end{VerbatimU}
 
 This command will locate the file \path{rcu_rcpls.c}, which is called out in
 Appendix~\ref{chp:app:``Toy'' RCU Implementations}.
@@ -362,36 +358,28 @@ Other types of systems have well-known ways of locating files by filename.
 \label{sec:howto:Whose Book Is This?}
 
 \begin{listing*}[tbp]
-{
-\scriptsize
-\begin{verbbox}
-  1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
-  2 cd perfbook
-  3 # You may need to install a font here. See item 1 in FAQ.txt.
-  4 make
-  5 evince perfbook.pdf & # Two-column version
-  6 make perfbook-1c.pdf
-  7 evince perfbook-1c.pdf & # One-column version for e-readers
-\end{verbbox}
-}
-\hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
+\begin{VerbatimL}
+git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
+cd perfbook
+# You may need to install a font here. See item 1 in FAQ.txt.
+make
+evince perfbook.pdf & # Two-column version
+make perfbook-1c.pdf
+evince perfbook-1c.pdf & # One-column version for e-readers
+\end{VerbatimL}
 \caption{Creating an Up-To-Date PDF}
 \label{lst:howto:Creating a Up-To-Date PDF}
 \end{listing*}
 
 \begin{listing*}[tbp]
-{
-\scriptsize
-\begin{verbbox}
-  1 git remote update
-  2 git checkout origin/master
-  3 make
-  4 evince perfbook.pdf & # Two-column version
-  5 make perfbook-1c.pdf
-  6 evince perfbook-1c.pdf & # One-column version for e-readers
-\end{verbbox}
-}
-\hspace*{1in}\OneColumnHSpace{-0.5in}\theverbbox
+\begin{VerbatimL}
+git remote update
+git checkout origin/master
+make
+evince perfbook.pdf & # Two-column version
+make perfbook-1c.pdf
+evince perfbook-1c.pdf & # One-column version for e-readers
+\end{VerbatimL}
 \caption{Generating an Updated PDF}
 \label{lst:howto:Generating an Updated PDF}
 \end{listing*}
@@ -441,11 +429,9 @@ One important requirement is that each patch (or commit, in the case
 of a \co{git pull} request) must contain a valid \co{Signed-off-by:} line,
 which has the following format:
 
-\begin{quote}
-	{ \scriptsize
-	\co{Signed-off-by: My Name <myname@example.org>}
-	}
-\end{quote}
+\begin{VerbatimU}
+Signed-off-by: My Name <myname@example.org>
+\end{VerbatimU}
 
 Please see \url{http://lkml.org/lkml/2007/1/15/219} for an example
 patch containing a \co{Signed-off-by:} line.
-- 
2.7.4


