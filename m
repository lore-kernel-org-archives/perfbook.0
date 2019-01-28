Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bzaY+2zocGAMSaE4DMLMaeOVP1IiW+l2+oxW0l3MM1o=;
        b=AGgzxOV5VhNYPzkE9rOMVpkp+ON0xP6QQLrTe1sgysGOE1hJF8+tvd/cuf9ZYyO93f
         bMme5sKvhWMN6I+2w8ZE15sL54yV7Llk63g46jxQXYrRO+KImvd69fm+fohFQOjSwFiM
         c8jrm1Gnhbf2mX24Rv7+SBOsJ8fVJRva3U9JZG5wf+xJ7aDIvE80Eyav1n0WDeY0a4lp
         4P5RUsQcqqD/8wsHzuuqgHVdD47jKjByiUOz0k+DibbS7sqrsRnSRxgnPmX6Qj7iGOLO
         46Dp+JsoAKs4W/WeFlLZQVZrVx5ARap8PCY6hlAVPjHRyjkJu1GGQ5Zpp5jWg6yphqdM
         s3aA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] Improve definition of \nbco{} and \qco{}
Message-ID: <715cbffc-8d06-5d3c-2a85-f45f87304b28@gmail.com>
Date: Mon, 28 Jan 2019 23:29:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 857e21738a75e2a51ba61738dbf0da404dbb13bf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 28 Jan 2019 23:13:41 +0900
Subject: [PATCH 1/2] Improve definition of \nbco{} and \qco{}

Commit 68288d7d6d55 ("defer/rcufundamental: Additional wordsmithing
and todo-list cleanup") introduced a \qco{} command to represent
"->".  However, \lstinline{} command used in the old definition
gets confused when used inside another command, in this case
\hbox{}, if the enclosed string contains breakable sequence (->).

Another option is to use the \PVerb{} command provided by the
"examplep" package.

By this change, "\" no longer needs escapes inside \nbco{} and \qco{}.
Update the style guide to reflect the change.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 49 +++++++++++++++++++-------------------
 perfbook.tex                       |  3 ++-
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 517424b..7cd0510 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -97,7 +97,7 @@ are used behind numerical values, narrow spaces should be placed between
 the values and the symbols.
 
 A narrow space can be coded in \LaTeX{} by the sequence of
-\qco{\\,}.
+\qco{\,}.
 For example,
 \begin{quote}
   ``2.4\,GHz'', rather then ``2.4GHz''.
@@ -113,17 +113,17 @@ should be placed. For example,
 
 The symbol of micro (\micro :$10^{-6}$) can be typeset easily by
 the help of ``gensymb'' \LaTeX\ package.
-A macro \qco{\\micro} can be used in both text and
+A macro \qco{\micro} can be used in both text and
 math modes. To typeset the symbol of ``microsecond'', you can do
-so by \qco{\\micro s}. For example,
+so by \qco{\micro s}. For example,
 \begin{quote}
   10\,\micro s
 \end{quote}
 
-Note that math mode \qco{\\mu} is italic by default and should not
+Note that math mode \qco{\mu} is italic by default and should not
 be used as a prefix. An improper example:
 \begin{quote}
-  10\,$\mu $s (math mode \qco{\\mu})
+  10\,$\mu $s (math mode \qco{\mu})
 \end{quote}
 
 \subsubsection{Non-SI Unit Symbol}
@@ -173,7 +173,7 @@ of it. NIST style guide clearly states so.
 
 The symbol of degree can also be typeset easily by the help of gensymb
 package.
-A macro \qco{\\degree} can be used in both text and math modes.
+A macro \qco{\degree} can be used in both text and math modes.
 
 Example:
 
@@ -313,7 +313,7 @@ This section summarizes guidelines specific to \LaTeX.
 
 Monospace font (or typewriter font) is heavily used in this textbook.
 First policy regarding monospace font in perfbook is to avoid
-directly using \qco{\\texttt} or \qco{\\tt} macro.
+directly using \qco{\texttt} or \qco{\tt} macro.
 It is highly recommended to use a macro or an environment
 indicating the reason why you want the font.
 
@@ -390,7 +390,7 @@ Listing~\ref{lst:app:styleguide:Sample Code Snippet}.
 
 Labels to lines are specified in \qco{$lnlbl[]} command. The characters
 specified by \qco{commandchars} option to \co{VarbatimL} environment are
-used by the \co{fancyvrb} package to substitute \qco{\\lnlbl\{\}}
+used by the \co{fancyvrb} package to substitute ``\co{\\lnlbl\{\}}''
 for \qco{$lnlbl[]}. Those characters should be selected so that they
 don't appear elsewhere in the code snippet.
 
@@ -414,7 +414,7 @@ to from text.
 \end{lineref}
 \end{quote}
 
-Macros \qco{\\lnlbl\{\}} and \qco{\\lnref\{\}} are defined in
+Macros ``\co{\\lnlbl\{\}}'' and ``\co{\\lnref\{\}}'' are defined in
 the preamble as follows:
 
 \begin{VerbatimU}
@@ -515,14 +515,14 @@ Once one of them appears in a litmus test, comments should be
 ocaml style (\qco{(* ... *)}). Those tokens keep the same meaning
 even when they appear in comments!
 
-The pair of characters \qco{\{} and \qco{\}} also have special
+The pair of characters ``\co{\{}'' and ``\co{\}}'' also have special
 meaning in the C flavour tests. They are used to seperate portions
 in a litmus test.
 
-First pair of \qco{\{} and \qco{\}} encloses initialization part.
+First pair of ``\co{\{}'' and ``\co{\}}'' encloses initialization part.
 Comments in this part should also be in the ocaml form.
 
-You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
+You can't use ``\co{\{}'' nor ``\co{\}}'' in comments in litmus tests, either.
 
 Examples of disallowed comments in a litmus test are shown below:
 
@@ -727,8 +727,9 @@ lists such limitations.
 \begin{tabular}{@{}lll@{}}\toprule
   Macro &  Need Escape & Should Avoid \\
   \midrule
-  \co{\\co}, \co{\\nbco} & \co{\\}, \%, \{, \} & \\
+  \co{\\co}   & \co{\\}, \%, \{, \} & \\
   \co{\\tco}  & \# & \%, \{, \}, \co{\\} \\
+  \co{\\nbco} &    & \%, \{, \}, final \co{\\} \\
   \bottomrule
 \end{tabular}
 \caption{Limitation of Monospace Macro}
@@ -739,10 +740,10 @@ While \verb|\co{}| requires some characters to be escaped,
 it can contain any character.
 
 On the other hand, \verb|\tco{}| can not handle
-\qco{\%}, \qco{\{}, \qco{\}}, nor \qco{\\} properly.
-If they are escaped by a~\qco{\\},
+``\co{\%}'', ``\co{\{}'', ``\co{\}}'', nor ``\co{\\}'' properly.
+If they are escaped by a~``\co{\\}'',
 they appear in the end result with the escape character.
-The \qco{\\verb} macro can be used in running text if you
+The \qco{\verb} macro can be used in running text if you
 need to use monospace font for a string which contains
 many characters to escape.\VerbatimFootnotes\footnote{
   \verb|\verb| macro is not almighty though. For example, you can't
@@ -798,15 +799,15 @@ in poor typesetting. For example:
   high-frequency radio wave, high-frequency radio wave.
 \vspace{0.6\baselineskip}\end{minipage}\end{center}
 
-By using a shortcut \qco{\\-/} provided by the
+By using a shortcut \qco{\-/} provided by the
 ``extdash'' package, hyphenation in elements of compound
 words is enabled in perfbook.\footnote{
   In exchange for enabling the shortcut, we can't use plain
-  \LaTeX's shortcut \qco{\\-} to specify hyphenation points.
+  \LaTeX's shortcut \qco{\-} to specify hyphenation points.
   Use \path{pfhyphex.tex} to add such exceptions.
 }
 
-Example with \qco{\\-/}:
+Example with \qco{\-/}:
 
 \begin{center}\begin{minipage}{2.6in}\vspace{0.6\baselineskip}
   High\-/frequency radio wave, high\-/frequency radio wave,
@@ -822,7 +823,7 @@ We want hyphenated compound terms such as ``x\=/coordinate'',
 following a single letter.
 
 To make a hyphen unbreakable, we can use a short cut
-\qco{\\=/} also provided by the ``extdash'' package.
+\qco{\=/} also provided by the ``extdash'' package.
 
 Example without a shortcut:
 
@@ -832,7 +833,7 @@ x-, y-, and z-coordinates; x-, y-, and z-coordinates;
 x-, y-, and z-coordinates; x-, y-, and z-coordinates;
 \vspace{0.6\baselineskip}\end{minipage}\end{center}
 
-Example with \qco{\\-/}:
+Example with \qco{\-/}:
 
 \begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
 x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
@@ -840,7 +841,7 @@ x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
 x-, y-, and z\-/coordinates; x-, y-, and z\-/coordinates;
 \vspace{0.6\baselineskip}\end{minipage}\end{center}
 
-Example with \qco{\\=/}:
+Example with \qco{\=/}:
 
 \begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
 x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
@@ -848,8 +849,8 @@ x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
 x-, y-, and z\=/coordinates; x-, y-, and z\=/coordinates;
 \vspace{0.6\baselineskip}\end{minipage}\end{center}
 
-Note that \qco{\\=/} enables hyphenation in elements
-of compound words as the same as \qco{\\-/} does.
+Note that \qco{\=/} enables hyphenation in elements
+of compound words as the same as \qco{\-/} does.
 
 \subsubsection{Em Dash}
 \label{sec:app:styleguide:Em Dash}
diff --git a/perfbook.tex b/perfbook.tex
index 1799bfb..2eb4cd8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -42,6 +42,7 @@
 \usepackage{changepage}
 \usepackage{listings}
 \lstset{basicstyle=\ttfamily}
+\usepackage{examplep}
 % \usepackage[strings]{underscore}
 % \usepackage{underscore}
 \usepackage{pifont} % special character for qqz reference point
@@ -155,7 +156,7 @@
 }
 %%HTMLNOSKIP
 \newcommand{\co}[1]{\lstinline[breaklines=true,breakatwhitespace=true]{#1}}
-\newcommand{\nbco}[1]{\hbox{\lstinline[breaklines=false,breakatwhitespace=false]{#1}}} % no break lines for short snippet
+\newcommand{\nbco}[1]{\mbox{\PVerb[pverb-space=invnobreak]{#1}}} % no break lines for short snippet
 \newcommand{\qco}[1]{``\nbco{#1}''} % \nbco with quotation marks
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
-- 
2.7.4

