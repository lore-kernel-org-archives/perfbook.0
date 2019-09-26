Return-Path: <SRS0=ektU=XV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KhmmZZHFjGkDE4h5emJW1pkuxO+cXJhOtOXtrDIf2AA=;
        b=Y3z54utY6kBRUB4cxf7hz/djswJhDBXQE1j1PZVPupEQuFBO9H2O6JhTpT7qglCI2U
         i6pIhGSCAywDHSoR8yuUdr1eGJKy61WiuswMAKBiah7dcqTBcElIJvfpHsPZymG6x2KQ
         HlWP1pd+3Pel3cxMiJdFAIQV+eQ03uUhFwOj+0m1t8rJyoAspnbTcq/kyaRyIwZIWYfR
         5cLwnRTxOB7kZ2OSnP9sxQ3zL/MZws8vIeNjfmeOjRY4LL3ulqY1A+YYN6oYGCCHf86S
         sqm32t10FIudY2HuuD5gLktlSFkDXe13Ex1eWwbYnaTdrVmbuUmy289bNsxf0FskDsSX
         pRqQ==
Subject: [PATCH 2/2] Define LaTeX macros inspired by 'cleveref' to reference
 line labels
References: <407f9616-f2e9-575d-7441-273d626bb40c@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <78cde139-ad99-0ecb-6682-1e4767d1c667@gmail.com>
Date: Fri, 27 Sep 2019 07:42:13 +0900
MIME-Version: 1.0
In-Reply-To: <407f9616-f2e9-575d-7441-273d626bb40c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From 4892a1c38ab880cb43616bd391fea6278ea274fd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 27 Sep 2019 00:24:05 +0900
Subject: [PATCH 2/2] Define LaTeX macros inspired by 'cleveref' to reference line labels

Cross references to line labels in our code-snippet scheme can not
be directly supported by "cleveref" because of \labelbase handling.

Line labels won't change into other types of labels, so we don't
need the cleverness provided by cleveref. Instead, this commit
defines LeTeX macros inspired by cleveref commands listed below.

    o \cref and \Cref
    o \crefrange and \Crefrange

\clnref and \Clnref are counterpart of \cref and \Cref.
They can accept a list of labels delimited by commas.

The LaTeX code is based on Werner's example [2] mentioned in a
comment in [3].

[2]: https://pastebin.com/hMC8bmFk
[3]: https://tex.stackexchange.com/questions/87407/

\clnrefrange and \Clnrefrange are for ranges of lines.

Note that macros for ranges can not accept comma-separated pairs of
labels. They need pairs of "{}"s as the same as the "{C|c}refrange"
macros of "cleveref" do. Also note that the en-dash (--) rather than
a plain dash (-) is used in these macros for ranges.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex |  6 +++---
 perfbook.tex                       | 27 ++++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 4384dc95..1fdf6e11 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -439,7 +439,7 @@ shown below:
 
 \begin{lineref}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
 The main part of \LaTeX\ source shown on
-Lines~\lnref{beg:linelabel}-\lnref{end:linelabel} in
+\Clnrefrange{beg:linelabel}{end:linelabel} in
 \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 can be extracted from a code sample of
 \cref{lst:app:styleguide:Source of Code Sample} by a perl script
@@ -909,7 +909,7 @@ Example with a simple dash:
   Lines~\lnref{b}\=/\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
+  by the \co{\\theverbbox} macro on \clnref{theverbbox}.
 \end{lineref}
 \end{quote}
 
@@ -920,7 +920,7 @@ Example with an en dash:
   Lines~\lnref{b}\==\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
+  by the \co{\\theverbbox} macro on \clnref{theverbbox}.
 \end{lineref}
 \end{quote}
 
diff --git a/perfbook.tex b/perfbook.tex
index 3cdb0f9c..42f39e77 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -166,7 +166,32 @@
 \usepackage[capitalise,noabbrev]{cleveref}
 \crefname{subsubsubappendix}{Appendix}{Appendices}
 \crefname{sublisting}{Listing}{Listings}
-
+\newcommand{\crefrangeconjunction}{--}
+
+% Define \clnref{} and \Clnref{} for reference to line labels
+\newcounter{lblcount}
+\newcommand{\clnrefp}[2]{%
+  \setcounter{lblcount}{0}% Restart label count
+  \renewcommand*{\do}[1]{\stepcounter{lblcount}}% Count label
+  \docsvlist{#1}% Process list and count labels
+  \def\nextitem{\def\nextitem{, }}% Separator
+  \ifnum\value{lblcount}=1 #2~\lnref{#1}%
+  \else\ifnum\value{lblcount}=2 {#2}s~%
+  \renewcommand*{\do}[1]{%
+    \addtocounter{lblcount}{-1}%
+    \ifnum\value{lblcount}=0 { }and~\else\nextitem\fi\lnref{##1}}% How to process each label
+  \else {#2}s~%
+  \renewcommand*{\do}[1]{%
+    \addtocounter{lblcount}{-1}%
+    \ifnum\value{lblcount}=0 , and~\else\nextitem\fi\lnref{##1}}% How to process each label
+  \fi%
+  \docsvlist{#1}% Process list
+  \fi%
+}
+\newcommand{\clnref}[1]{\clnrefp{#1}{line}}
+\newcommand{\Clnref}[1]{\clnrefp{#1}{Line}}
+\newcommand{\clnrefrange}[2]{lines~\lnref{#1}--\lnref{#2}}
+\newcommand{\Clnrefrange}[2]{Lines~\lnref{#1}--\lnref{#2}}
 \begin{document}
 
 %%HTMLSKIP
-- 
2.17.1


