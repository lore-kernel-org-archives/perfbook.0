Return-Path: <SRS0=b9Am=FD=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pVi9CT4Niky3ECNy9PYxDr2hXG7NHo15/iQ0a7knAnM=;
        b=jM5RsJb+5lYfMp5jlDxIWCYnPZeFEmN/FfP7+ZIZVJRmyQzDllEptkcPL19Q0a+5Hu
         tozMfUWoTDSE3o7/MtwKuyGObbgkRcabcNZxxUgYJ3xDQwLaAeS8zQQWfDSUgUW4YsUd
         embKr8pxJEfDESSAIitat7aBb5cU2XUKzrCx3VU08v+W5Xzup/cGGWZdzKHbzvEoyF+b
         JmWy0ebXxHcNJuwOnp6trI3SJc6L58gSsOwrhmw91mZ8IhayxLhXThNcfukCm4P2tby6
         kThcraqLsMXq+qoLYsdPDZWxt12L1jnwB/96ZJGAAL13iJGxv+3bwKpN3Hf1hx3CAcJx
         UZPA==
Subject: [PATCH -perfbook 2/2] styleguide: Get rid of \VerbatimFootnotes macro
References: <88c1c684-7821-abac-e61d-8c5a19fc66c8@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <70ea5180-16c7-d51b-63cc-102b125c133b@gmail.com>
Date: Sun, 29 Nov 2020 23:33:20 +0900
MIME-Version: 1.0
In-Reply-To: <88c1c684-7821-abac-e61d-8c5a19fc66c8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From b04aeebd8cb7d2ec0e5387c98011601cc4e0c270 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Nov 2020 17:01:24 +0900
Subject: [PATCH -perfbook 2/2] styleguide: Get rid of \VerbatimFootnotes macro

It turns out that this macro is not compatible with the
"footnotebackref" package, which enables hyperlinks from
footnotes to the corresponding footnote symbols in the text.
Furthermore, it is wrong to use the macro in the middle
of a book.
It is supposed to be used next to \begin{document}.

\VerbatimFootnote overrides the definition of \footnote{} based
on the default code of standard LaTeX classes and breaks customization
done by footnotebackref.

In perfbook, this affects footnotes in "Answers to Quick Quizzes"
and Glossary as well as those in the latter part of Style Guide.

As it is not used anywhere else, remove the macro and update the
footnote text accordingly.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index b6b343e0..11802a85 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -772,14 +772,15 @@ If they are escaped by a~\qco{\\},
 they appear in the end result with the escape character.
 The \qco{\\verb} command can be used in running text if you
 need to use monospace font for a string which contains
-many characters to escape.\VerbatimFootnotes\footnote{
-  The \verb|\verb| command is not almighty though.
+many characters to escape.\footnote{
+  The \co{\\verb} command is not almighty though.
   For example, you can't use it within a footnote.
   If you do so, you will see a fatal \LaTeX\ error.
-  The \qco{fancyvrb} package provides a workaround by
-  the name of \verb|\VerbatimFootnotes| macro.
-  This footnote is an example which contains a few \verb|\verb|
-  commands.}
+  A workaround would be a macro named \co{\\VerbatimFootnotes}
+  provided by the \co{fancyvrb} package.
+  Unfortunately, perfbook can't employ it due to the interference
+  with the \co{footnotebackref} package.
+  }
 
 \subsection{Cross-reference}
 \label{sec:app:styleguide:Cross-Reference}
-- 
2.17.1


