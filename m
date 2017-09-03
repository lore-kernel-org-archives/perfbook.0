Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g0xfiGYVpfirCT8u6uRkBGqfUJInUWewjKW5oboyETA=;
 b=dDpMnrWI3UjbFLS7rO/T0img4nohnbPSfK59Im1pGrvmHviG3jSbUNSQhsMWT8zfH1
 MXL8mlXpS+mDOEbb2qyE5D60jv0ZxUr29fofxd3A0H8bBIUlyeK9YUbR/Hv1q3eSYjXY
 9qzpmWrP9mxWQ/wjxfLZT725jR1FXwjXs/5KqsorZ0EnnDX2dApid08RfVNZNczg36bI
 MEfOqVv5EYmFSeWyy5AXLJd/cMbXPgvS0b1GpvB85BgWnahzJLn8/wu9V9VPdgtIf0Bv
 3jGjSEjWmzWg4TufiqHCLxAj5Y9e8HLzKX2PbyKZh8Q5eftOwpTxvldjQzkblnBtkLkI
 yP/g==
Subject: [PATCH 1/2] styleguide: Add 'Ellipsis' section
References: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6d972b77-bcd4-1c42-6ece-9b0612050afd@gmail.com>
Date: Sun, 3 Sep 2017 23:56:16 +0900
MIME-Version: 1.0
In-Reply-To: <f5647f1b-5849-d267-4310-b18d72b9f63d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6b98c9422799b125cd80930060b3ce027f6adea5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 2 Sep 2017 20:52:42 +0900
Subject: [PATCH 1/2] styleguide: Add 'Ellipsis' section

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index a11b9be..831e7c2 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -676,6 +676,61 @@ namely \qco{$-$}. For example,
   $-30$, rather than -30.
 \end{quote}

+\subsection{Punctuation}
+\label{sec:app:styleguide:Punctuation}
+
+\subsubsection{Ellipsis}
+\label{sec:app:styleguide:Ellipsis}
+
+In monospace fonts, ellipses can be expressed by
+series of periods. For example:
+
+\begin{quote}
+  \verb|Great ... So how do I fix it?|
+\end{quote}
+
+However, in proportional fonts, the series of periods is printed
+with tight spaces as follows:
+
+\begin{quote}
+  Great ... So how do I fix it?
+\end{quote}
+
+Standard \LaTeX\ defines the \verb|\dots| macro for this purpose.
+However, it has a kludge in the evenness of spaces.
+The ``ellipsis'' package redefines the \verb|\dots| macro to fix
+the issue.\footnote{To be exact, it is the \co{\\textellipsis} macro
+  that is redefined. The behavior of \co{\\dots} macro in math
+  mode is not affected. The ``amsmath'' package has another definition
+  of \co{\\dots}. It is not used in perfbook at the moment.}
+By using \verb|\dots|, the above example is typeset as the following:
+
+\begin{quote}
+  Great \dots So how do I fix it?
+\end{quote}
+
+Note that the ``xspace'' option specified to the ``ellipsis'' package
+adjusts the spaces after ellipses depending on what follows them.
+
+For example:
+
+\begin{itemize}[itemsep=.2ex]
+\item He said, ``I~\dots really don't remember~\dots''
+\item Sequence A: (one, two, three, \dots)
+\item Sequence B: (4, 5, \dots, $n$)
+\end{itemize}
+
+As you can see, extra space is placed before the comma.
+
+\verb|\dots| macro can also be used in math mode:
+
+\begin{itemize}[itemsep=.2ex]
+\item Sequence C: $(1, 2, 3, 5, 8, \dots)$
+\item Sequence D: $(10, 12, \dots, 20)$
+\end{itemize}
+
+The \verb|\ldots| macro behaves the same as the \verb|\dots| macro.
+
 \subsection{Improvement Candidates}
 \label{sec:app:styleguide:Improvement Candidates}

-- 
2.7.4


