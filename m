Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+N7L0CjGAgEpVHez/M4ImG5/clTRTIs+X5vc8MxO59o=;
 b=SHxGS1RX1KdfkFuK5JqO9nL4R6p1PflTli6JAmSPgqDDIC8hP5k26SpEjIKwdZ4/vB
 vCO9gZlnhC9q8jmkPRcAjABsylb3nMU2EGGQAmRuBDjqK1KXLK9RP2SZOrJpiMgDuZkX
 RfwIkrUKZohqjGYBHnAxjtUBA70XWNOMmWvUfgwXosJ+CtL2Un/Gp1sNmCbpDnerIeIp
 rAXmuGr9iIC2+V0ua4MDxxrv9QZXXgC4h6sXJ8kbpyK+eIGIJ5DRHSZltBI1MEu1N1Mk
 xgUDRPKz9uZc5R4+ou4qXi7d42bWntWDx0wyb/fFk2JICWvvwNuv1Ky65PG1DLvlZBWh
 mP/A==
Subject: [PATCH 2/6] styleguide: Add listing environment examples
References: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <13615d35-d215-27ee-e639-abd91c2f7a91@gmail.com>
Date: Wed, 9 Aug 2017 07:07:11 +0900
MIME-Version: 1.0
In-Reply-To: <acc91026-d2fe-3cc8-7c6f-f43662b533b8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f1ce3027b98c904b20eb3bf972d4494f1c76a517 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 5 Aug 2017 18:43:01 +0900
Subject: [PATCH 2/6] styleguide: Add listing environment examples

Add two examples:

  1) Caption at the bottom
  2) "Ruled" style

Example 2) changes the looks by the float's "\restylefloat{}" macro.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 52 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index bbd4b7f..8ebf9bf 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -592,7 +592,30 @@ The ``float'' package would be of help.\footnote{
   control of floating objects. However, because of an issue
   in two-column layout, we can not use it at the moment.}

-% TODO: Add example
+Figure~\ref{fig:app:styleguide:Sample Code Snippet}
+can be typeset as in
+Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+using an experimental environment ``listing''.
+
+\begin{listing}
+{ \scriptsize
+\begin{verbbox}[\LstLineNo]
+/*
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+  printf("Hello world!\n");
+  return 0;
+}
+\end{verbbox}
+}
+\centering
+\theverbbox
+\caption{Sample Code Snippet}
+\label{lst:app:styleguide:Sample Code Snippet}
+\end{listing}

 \subsubsection{Position of Caption}
 \label{sec:app:styleguide:Position of Caption}
@@ -607,7 +630,32 @@ top to bottom.
 The float package mentioned above also has the capability
 to adjust layout of caption.

-% TODO: Add example
+For code snippets, the ``ruled'' style would be our choice.
+Listing~\ref{lst:app:styleguide:Sample Code Snippet (Ruled)}
+is an example using the style.
+
+\floatstyle{ruled}
+\restylefloat{listing}
+
+\begin{listing}
+{ \scriptsize
+\begin{verbbox}[\LstLineNo]
+/*
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+  printf("Hello world!\n");
+  return 0;
+}
+\end{verbbox}
+}
+\centering
+\theverbbox
+\caption{Sample Code Snippet (Ruled)}
+\label{lst:app:styleguide:Sample Code Snippet (Ruled)}
+\end{listing}

 Once the conversion of code sippets to a new environment has
 completed, we would be able to choose one of the style options
-- 
2.7.4


