Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TLH81YiBzMqocTEKE1AtJYSyzafJdF0OwQHdWKKw7Ws=;
 b=ovL2/nhER89a6aNmu1goMD59VtOYO8bzy2e37z0eFf7ydU+o6nciUAwiWfsZbMNnc/
 QHEDDr9t9BNqCM/HIw1YJkDd2QY3TiCBtJtH3QKlEOFYqJTlexhaCvM6RzkkyHsdSmB/
 GdNZBBpF+I0e9Fg/gEri2YvINhYD8irT59kP38EsqGNhUP/XdTjPwhd12Ef5W8oxMv+5
 HE5WnVcmrKIfCppxpY+edA6RbiNGlBFToqQLaePBhfqGo2xvjjlkt/kI8glT5TIwCRrl
 LrpB/e3RiLmGzTM316T9dC1dyP5WcW4Oj0kmNHIxLlcE5+jKhfvREMczewjJ/fVK+CNz
 YyGQ==
Subject: [PATCH v2 4/8] styleguide: Add listing environment examples
References: <26a47dec-a9a0-87e6-88c8-b9ba82c477d5@gmail.com>
 <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17ee2f1d-b185-14bd-4857-253de2317be7@gmail.com>
Date: Mon, 31 Jul 2017 23:49:06 +0900
MIME-Version: 1.0
In-Reply-To: <11d41e53-5367-1149-8064-8808696a2c33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 33da9b7a0ee4c525b7cd7079722d5a40d5079f37 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 20 Jul 2017 23:50:12 +0900
Subject: [PATCH v2 4/8] styleguide: Add listing environment examples

Add three examples:

  1) Caption at the bottom
  2) Caption at the top
  3) "Ruled" style

Example 2) and 3) change their looks by the floatrow's
"\thisfloatsetup{}" macro.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/hello.c        |  9 +++++++
 appendix/styleguide/styleguide.tex | 48 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)
 create mode 100644 appendix/styleguide/hello.c

diff --git a/appendix/styleguide/hello.c b/appendix/styleguide/hello.c
new file mode 100644
index 0000000..d35d93f
--- /dev/null
+++ b/appendix/styleguide/hello.c
@@ -0,0 +1,9 @@
+/*
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+  printf("Hello world!\n");
+  return 0;
+}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 72b8ca0..b04b62b 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -589,8 +589,21 @@ This section lists up such candidates.
 Strictly speaking, code snippets are \emph{not} figures.
 They deserve their own floating environment.
 The ``floatrow'' package would be of help.
+Figure~\ref{fig:app:styleguide:Sample Code Snippet}
+can be typeset as in
+Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+using an experimental environment ``listing''.

-% TODO: Add example
+\begin{listing}
+{ \scriptsize
+\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}]
+	{appendix/styleguide/hello.c}
+}
+\centering
+\theverbbox
+\caption{Sample Code Snippet}
+\label{lst:app:styleguide:Sample Code Snippet}
+\end{listing}

 \subsubsection{Position of Caption}
 \label{sec:app:styleguide:Position of Caption}
@@ -604,8 +617,39 @@ The same can be said of code snippets, which are read from
 top to bottom.
 The floatrow package mentioned above also has the capability
 to adjust layout of caption.
+For example,
+Listing~\ref{lst:app:styleguide:Sample Code Snippet (Top)}
+has the option \qco{cappostion=top} in its preamble.

-% TODO: Add example
+\begin{listing}\RawFloats
+{ \scriptsize
+\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}]
+	{appendix/styleguide/hello.c}
+}
+\begin{floatrow}[1]\thisfloatsetup{capposition=top}
+  \floatbox{listing}[2.5in]{\caption{Sample Code Snippet (Top)}
+    \label{lst:app:styleguide:Sample Code Snippet (Top)}}{
+\theverbbox
+}
+\end{floatrow}
+\end{listing}
+
+For code snippets, the ``ruled'' style would look even better.
+Listing~\ref{lst:app:styleguide:Sample Code Snippet (Ruled)}
+is an example using the option \qco{style=ruled}.
+
+\begin{listing}\RawFloats
+{ \scriptsize
+\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}]
+	{appendix/styleguide/hello.c}
+}
+\begin{floatrow}[1]\thisfloatsetup{style=ruled}
+  \floatbox{listing}[2.5in]{\caption{Sample Code Snippet (Ruled)}
+    \label{lst:app:styleguide:Sample Code Snippet (Ruled)}}{
+\theverbbox
+}
+\end{floatrow}
+\end{listing}

 Once the conversion of code sippets to a new environment has
 completed, we would be able to choose one of the style options
-- 
2.7.4


