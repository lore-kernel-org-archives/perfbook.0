Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jfAXy/Ld3CU9M/XiBI2c8h2Q8GBAnleHLwlb547LE2A=;
        b=W2onQ34hzH/N1FIBygjzbV7AD11PnX55r+BrA5R5Y2aadhqwD934xnYv5MLUTn2pZM
         KyzDnSTqVm1MvmdGVoQlaF9o/SFrB4dnqT3qXNVA2Qdz1Y6m3MX82LQSbeXzSbxOoKBK
         ENc6bn94KtWjIGr9LSRCtBnbaktsW//zxAUlXijOdO224joSkXVCF3OWET0layUtOswD
         SKEHibDb5ahvWA9q2w4spWp4uwS4oSuvKZZDTfkgV9LWPy2/8/KYw01A9pb3h5TD6WJl
         UbhMypUVu8qI14dUsT78C8aY/8EMZXoHGNKYd6Pw9qLqySDmlHr67mHzqIuHfE+u6Iu0
         DJ4w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] styleguide: Update code snippet section
Message-ID: <8c68ad49-6c54-6ff1-e50d-09337be505c2@gmail.com>
Date: Sun, 11 Nov 2018 23:44:54 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From c821c6c678197b760a4c08c7bfdba370bdd31a71 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 11 Nov 2018 23:30:04 +0900
Subject: [PATCH] styleguide: Update code snippet section

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This updates Style Guide to describe new scheme of code snippet.
Although there still remain rough edges, hopefully it would cover
essential info.

        Thanks, Akira
--
 appendix/styleguide/samplecodesnippet.c         |  11 +
 appendix/styleguide/samplecodesnippetfcv.tex    |  17 +
 appendix/styleguide/samplecodesnippetlst.tex    |   4 +-
 appendix/styleguide/samplecodesnippetlstlbl.tex |  19 ++
 appendix/styleguide/styleguide.tex              | 399 ++++++++++++++++++------
 5 files changed, 359 insertions(+), 91 deletions(-)
 create mode 100644 appendix/styleguide/samplecodesnippet.c
 create mode 100644 appendix/styleguide/samplecodesnippetfcv.tex
 create mode 100644 appendix/styleguide/samplecodesnippetlstlbl.tex

diff --git a/appendix/styleguide/samplecodesnippet.c b/appendix/styleguide/samplecodesnippet.c
new file mode 100644
index 0000000..f58f656
--- /dev/null
+++ b/appendix/styleguide/samplecodesnippet.c
@@ -0,0 +1,11 @@
+//\begin{snippet}[labelbase=ln:base1,commandchars=\$\[\]]
+/*
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+	printf("Hello world!\n");	//\lnlbl{printf}
+	return 0;			//\lnlbl{return}
+}
+//\end{snippet}
diff --git a/appendix/styleguide/samplecodesnippetfcv.tex b/appendix/styleguide/samplecodesnippetfcv.tex
new file mode 100644
index 0000000..4e03b2a
--- /dev/null
+++ b/appendix/styleguide/samplecodesnippetfcv.tex
@@ -0,0 +1,17 @@
+\begin{listing}[tb]
+\begin{linelabel}[ln:base1]			%lnlbl~linelabel^
+\begin{VerbatimL}[commandchars=\$\[\]]
+/*
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+	printf("Hello world!\n");	$lnlbl[printf]
+	return 0;			$lnlbl[return]
+}
+\end{VerbatimL}
+\end{linelabel}
+\caption{Sample Code Snippet}
+\label{lst:app:styleguide:Sample Code Snippet}
+\end{listing}
diff --git a/appendix/styleguide/samplecodesnippetlst.tex b/appendix/styleguide/samplecodesnippetlst.tex
index 06df5cc..65a1f48 100644
--- a/appendix/styleguide/samplecodesnippetlst.tex
+++ b/appendix/styleguide/samplecodesnippetlst.tex
@@ -14,6 +14,6 @@ int main(void)
 }
 \centering
 \theverbbox
-\caption{Sample Code Snippet}
-\label{lst:app:styleguide:Sample Code Snippet}
+\caption{Sample Code Snippet (Obsolescent)}
+\label{lst:app:styleguide:Sample Code Snippet (Obsolesc)}
 \end{listing}
diff --git a/appendix/styleguide/samplecodesnippetlstlbl.tex b/appendix/styleguide/samplecodesnippetlstlbl.tex
new file mode 100644
index 0000000..8ee8b5d
--- /dev/null
+++ b/appendix/styleguide/samplecodesnippetlstlbl.tex
@@ -0,0 +1,19 @@
+\begin{listing}
+{ \scriptsize
+\begin{verbbox}[\LstLineNo] %lnlbl@lineno$
+/*				%lnlbl@b$
+ * Sample Code Snippet
+ */
+#include <stdio.h>
+int main(void)
+{
+  printf("Hello world!\n");
+  return 0;
+}				%lnlbl@e$
+\end{verbbox}
+}
+\centering
+\theverbbox			%lnlbl@theverbbox$
+\caption{Sample Code Snippet (Obsolescent)}
+\label{lst:app:styleguide:Sample Code Snippet (Obsolesc)}
+\end{listing}
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index f375f77..0a94c1c 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -322,106 +322,322 @@ This section explains the use cases of such macros and environments.
 \subsubsection{Code Snippet}
 \label{sec:app:styleguide:Code Snippet}
 
-Although the ``verbatim'' environment is commonly used to include
-listings, we use the ``verbbox'' environment provided by the
-``verbatimbox'' package for most code snippets to enable the
-centering layout.
+Although the \qco{verbatim} environment is a primitve way to include
+listings, we are transitioning to a new scheme which uses
+the \qco{fancyvrb} package for code snippets.
+
+Three customized environments of \qco{Verbatim} are defined
+for perfbook.
+
+\qco{VerbatimL} is for floating snippets within the \qco{listing}
+environment. \qco{VerbatimN} is for inline snippets with line count
+enabled. \qco{VerbatimU} is for inline snippets without line count.
+They are defined in the preamble as shown below:
+
+\begin{VerbatimU}
+\DefineVerbatimEnvironment{VerbatimL}{Verbatim}%
+  {fontsize=\scriptsize,numbers=left,numbersep=5pt,%
+    xleftmargin=9pt,obeytabs=true,tabsize=2}
+\AfterEndEnvironment{VerbatimL}{\vspace*{-9pt}}
+\DefineVerbatimEnvironment{VerbatimN}{Verbatim}%
+  {fontsize=\scriptsize,numbers=left,numbersep=3pt,%
+    xleftmargin=5pt,xrightmargin=5pt,obeytabs=true,%
+    tabsize=2,frame=single}
+\DefineVerbatimEnvironment{VerbatimU}{Verbatim}%
+  {fontsize=\scriptsize,numbers=none,xleftmargin=5pt,%
+    xrightmargin=5pt,obeytabs=true,tabsize=2,%
+    samepage=true,frame=single}
+\end{VerbatimU}
+
+We used to use the \qco{verbbox} environment provided
+by the \qco{verbatimbox} package. As will be described later in
+Section~\ref{sec:app:styleguide:Code Snippet (Obsolesc)},
+\co{verbbox} has the capability of automatic
+line numbering. However, it is not possible to embed labels on lines
+in the snippet to refer from the text.
+
+The \co{fancyvrb} package allows us to do that by the help of
+escaping feature.
+And the \LaTeX\ sources of snippets can be extracted from code samples under
+the \path{CodeSamples} directory of perfbook tree.
+
+Conversion to the new scheme is currently underway.
 
 % Another option would be the ``lstlisting'' environment provided
 %  by the ``listings'' package. We are already using its ``lstinline''
 %  command in the definition of \co{\\co\{\}} macro.
 
-\begin{listing}[tbh]
-{ \scriptsize
-\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}:\hspace{2ex}}}]
-	{appendix/styleguide/samplecodesnippetlst.tex}
-}
-\centering
-\theverbbox
+\begin{listing}[tb]
+\fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8,commandchars=\%\~\^}
+\begin{linelabel}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
+\VerbatimInput{appendix/styleguide/samplecodesnippetfcv.tex}
+\end{linelabel}
+\vspace*{-9pt}
 \caption{\LaTeX\ Source of Sample Code Snippet (Current)}
 \label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 \end{listing}
 
-\input{appendix/styleguide/samplecodesnippetlst}
+\input{appendix/styleguide/samplecodesnippetfcv.tex}
 
 The \LaTeX\ source of a sample code snippet is shown in
 Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
-and is typeset as show in
+and is typeset as shown in
 Listing~\ref{lst:app:styleguide:Sample Code Snippet}.
 
-Note that the verbbox environment is placed inside the listing environment.
-This is to avoid a side effect of verbbox environment that interferes
-with the ``afterheading\-/ness'' of a section's first sentence
-when a verbbox is placed just below a heading.
+Labels to lines are specified in \qco{$lnlbl[]} command. The characters
+specified by \qco{commandchars} option to \co{VarbatimL} environment are
+used by the \co{fancyvrb} package to substitute \qco{\\lnlbl\{\}}
+for \qco{$lnlbl[]}. Those characters should be selected so that they
+don't appear elsewhere in the code snippet.
 
-Until recently, code snippets were coded using a different scheme.
-A sample \LaTeX\ source is shown in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)}
-and is typeset as shown in
-Figure~\ref{fig:app:styleguide:Sample Code Snippet}.
+Labels \qco{printf} and \qco{return} in
+Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+can be referred to as shown below:
 
-\begin{listing}[tbh]
-{ \scriptsize
-\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}:\hspace{2ex}}}]
-	{appendix/styleguide/samplecodesnippetfig.tex}
+\begin{VerbatimU}
+\begin{lineref}[ln:base1]
+Lines~\lnref{printf} and~\lnref{return} can be referred
+to from text.
+\end{lineref}
+\end{VerbatimU}
+
+Above code results in the paragraph below:
+
+\begin{quote}
+\begin{lineref}[ln:base1]
+Lines~\lnref{printf} and~\lnref{return} can be referred
+to from text.
+\end{lineref}
+\end{quote}
+
+\LaTeX\ source shown in
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+can be extracted from a code sample of
+Listing~\ref{lst:app:styleguide:Source of Code Sample} by a perl script
+\path{utilities/fcvextract.pl}. All the relevant rules of extraction
+are described as recipes in the top level \path{Makefile} and
+a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
+
+\begin{listing}[tb]
+\fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8}
+\VerbatimInput{appendix/styleguide/samplecodesnippet.c}
+\vspace*{-9pt}
+\caption{Source of Code Sample with ``snippet'' meta command}
+\label{lst:app:styleguide:Source of Code Sample}
+\end{listing}
+
+As you can see, Listing ~\ref{lst:app:styleguide:Source of Code Sample}
+has meta commands in comments of C (C++ style). These meta commands
+are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
+the type of comment style by the suffix of code sample's file name.
+
+Meta commands which can be used in code samples are shown below:
+
+\begin{VerbatimU}
+\begin{snippet}[option]
+\end{snippet}
+\lnlbl{<label string>}
+\end{VerbatimU}
+
+Options to the \co{\\begin\{snippet\}} meta command are as the following:
+
+\begin{VerbatimU}
+labelbase=<label base string>
+commandchars=\X\Y\Z
+\end{VerbatimU}
+
+The string given to \qco{labelbase} will be converted to
+``\co{\\begin\{linelabel\}[<label base string>]}'' command as shown on
+line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):linelabel} of
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
+\qco{commandchars} option is given to the \co{VerbatimL} environment as is.
+Other types of options, if any, are also passed to the \co{VerbatimL}
+environment.
+The \qco{lnlbl} commands are converted to reflect the escape-character choice
+along the way.
+
+There can be multiple pairs of \co{\\begin\{snippet\}} and \co{\\end\{snippet\}}
+as long as they have unique \qco{labelbase} strings.
+
+Our naming scheme of \qco{labelbase} for unique name space is as follows:
+
+\begin{VerbatimU}
+ln:<Chapter/Subdirectory>:<File Name>:<Function Name>
+\end{VerbatimU}
+
+Litmus tests, which are handled by \qco{herdtools7} commands such as
+\qco{litmus7} and \qco{herd7}, were problematic for this scheme.
+Those commands have particular rules of where comments can be
+placed and restriction on characters in comments.
+They also forbid a couple of tokens to appear in comments.
+(Tokens in comments might sound strange, but they do have such restriction.)
+
+For example, the first token in a litmus test must be one of
+\qco{C}, \qco{PPC}, \qco{X86}, \qco{LISA}, etc., which indicates
+the flavour of the test. This means no comment is allowed
+at the beginning of a litmus test.
+
+Similarly, several tokens such as \qco{exists}, \qco{filter},
+and~\qco{locations} indicate the end of litmus test's body.
+Once one of them appears in a litmus test, no comment is
+allowed to appear thereafter.  Those tokens keep the same meaning
+even when they appear in comments!
+
+The pair of characters \qco{\{} and \qco{\}} also have special
+meaning in the C flavour tests. They are used to seperate portions
+in a litmus test.
+
+First pair of \qco{\{} and \qco{\}} encloses initialization part.
+Comments in this part should be of the form \qco{(* ... *)}.
+
+You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
+
+Example of disallowed comments in a litmus test are shown below:
+
+\begin{linelabel}[ln:app:styleguide:Bad comments in Litmus Test]
+\begin{VerbatimN}[tabsize=8]
+// Comment at first
+C C-sample
+// Comment with { and } characters
+{
+x=2;  // C style comment in initialization
 }
-\centering
-\theverbbox
+
+P0(int *x}
+{
+	int r1;
+
+	r1 = READ_ONCE(*x);  // Comment with "exists"
+}
+
+[...]
+
+exists (0:r1=0)  // comment after test body
+\end{VerbatimN}
+\end{linelabel}
+
+To avoid parse error, meta commands in litmus tests (C flavour) are embedded
+in the following way.
+
+\begin{linelabel}[ln:app:styleguide:Sample Source of Litmus Test]
+\begin{VerbatimN}[tabsize=8]
+C C-SB+o-o+o-o
+//\begin[snippet][labelbase=ln:base,commandchars=\%\@\$]
+
+{
+1:r2=0			(*\lnlbl[initr2]*)
+}
+
+P0(int *x0, int *x1)		//\lnlbl[P0:b]
+{
+	int r2;
+
+	WRITE_ONCE(*x0, 2);
+	r2 = READ_ONCE(*x1);
+}				//\lnlbl[P0:e]
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	r2 = READ_ONCE(*x0);
+}
+
+//\end[snippet][existslabel=exists_]
+exists (1:r2=0 /\ 0:r2=0)
+\end{VerbatimN}
+\end{linelabel}
+
+To support labeling lines after the test body, \co{\\end[snippet]}
+can have following options:
+
+\begin{VerbatimU}
+exsitslabel=<label of exists>
+filterlabel=<label of filter>
+locationslabel=<label of locations>
+\end{VerbatimU}
+
+Example above is converted to the following intermediate code
+by a script \path{utilities/reorder_ltms.pl}.\footnote{
+	Currently, only C flavour litmus tests are supported.
+}
+The intermediate code can be handled
+by the common script \path{utilities/fcvextract.pl}.
+
+\begin{linelabel}[ln:app:styleguide:Intermediate Source of Litmus Test]
+\begin{VerbatimN}[tabsize=8]
+// Do not edit!
+// Generated by utillities/reorder_ltms.pl
+//\begin{snippet}[labelbase=ln:base,commandchars=\%\@\$]
+C C-SB+o-o+o-o
+
+{
+1:r2=0			//\lnlbl{initr2}
+}
+
+P0(int *x0, int *x1)		//\lnlbl{P0:b}
+{
+	int r2;
+
+	WRITE_ONCE(*x0, 2);
+	r2 = READ_ONCE(*x1);
+}				//\lnlbl{P0:e}
+
+P1(int *x0, int *x1)
+{
+	int r2;
+
+	WRITE_ONCE(*x1, 2);
+	r2 = READ_ONCE(*x0);
+}
+
+exists (1:r2=0 /\ 0:r2=0)\lnlbl{exists_}
+//\end{snippet}[existslabel=exists_]
+\end{VerbatimN}
+\end{linelabel}
+
+Note that each litmus test's source file can contain at most one
+pair of \co{\\begin[snippet]} and \co{\\end[snippet]} because of
+the restriction of comments.
+
+\subsubsection{Code Snippet (Obsolescent)}
+\label{sec:app:styleguide:Code Snippet (Obsolesc)}
+
+Sample \LaTeX\ source of a code snippet coded using
+the \qco{verbatimbox} package is shown in
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
+and is typeset as shown in
+Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolesc)}.
+
+\begin{listing}[tb]
+\begin{linelabel}[ln:app:styleguide:samplecodesnippetlstlbl]
+\fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,commandchars=\%\@\$}
+\VerbatimInput{appendix/styleguide/samplecodesnippetlstlbl.tex}
+\end{linelabel}
+\vspace*{-9pt}
 \caption{\LaTeX\ Source of Sample Code Snippet (Obsolescent)}
-\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)}
+\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
 \end{listing}
 
-\input{appendix/styleguide/samplecodesnippetfig}
-
-In Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)},
-the code snippet is coded as a ``figure'' object.
-Line numbers are manually placed for ease of referencing them within
-\LaTeX\ sources.
-
-However, strictly speaking, code snippets are \emph{not} figures
-and they deserve their own floating environment.
-The ``float'' package provides the feature to define additional
-floating environments.\footnote{
-  The ``floatrow'' package provides us even more flexible
-  control of floating objects. However, because of an issue
-  in two-column layout, we can not use it at the moment.}
-
-Transition to the auto-numbering scheme of verbbox and
-the ``listing'' environment defined for code snippets
-has recently started in
-Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
-In other chapters, code snippets have been converted to the
-``listing'' environments without auto-numbering.
-Auto-numbering can be enabled when the renumbering of line
-numbers becomes necessary.
-The transition has allowed us to choose distinct looks
-for code snippets, including moving captions to top of the
-listings
-(discussed in Section~\ref{sec:app:styleguide:Position of Caption}).
-
-The auto\-/numbering feature of verbbox is enabled by
-the \verb|\LstLineNo| macro specified in the option to verbbox
-(line~3 in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}).
+\input{appendix/styleguide/samplecodesnippetlst.tex}
+
+The auto\-/numbering feature of \co{verbbox} is enabled by
+the ``\verb|\LstLineNo|'' macro specified in the option to verbbox
+(line~\ref{ln:app:styleguide:samplecodesnippetlstlbl:lineno} in
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}).
 The macro is defined in the preamble of \path{perfbook.tex}
 as follows:
 
-\noindent\begin{minipage}{\columnwidth}
-{ \scriptsize
-\begin{verbbox}
+\begin{VerbatimU}
 \newcommand{\LstLineNo}
   {\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
-\end{verbbox}
-}
-\vspace{10pt}
-\centering
-\theverbbox
-\vspace{10pt}
-\end{minipage}
+\end{VerbatimU}
 
-The verbatim environment is used for listings with too many lines
+The \qco{verbatim} environment is used for listings with too many lines
 to fit in a column. It is also used to avoid overwhelming
-\LaTeX\ with a lot of floating objects.
+\LaTeX\ with a lot of floating objects. They are being converted to the
+scheme using the \co{VerbatimN} environment.
 
 \subsubsection{Identifier}
 \label{sec:app:styleguide:Identifier}
@@ -442,8 +658,8 @@ a white space, or an operator \tco{->}.
 
 Although \verb|\co{}| command is convenient for inlining within text,
 it is fragile because of its capability of line break.
-When it is used inside a ``tabular'' environment or its derivative
-such as ``tabularx'', it confuses column width
+When it is used inside a \qco{tabular} environment or its derivative
+such as \qco{tabularx}, it confuses column width
 estimation of those environments.
 Furthermore, \verb|\co{}| can not be safely used in section headings nor
 description headings.
@@ -460,7 +676,7 @@ white spaces.
 \label{sec:app:styleguide:Other Use Cases of Monospace Font}
 
 For URLs, we use ``\verb|\url{}|'' command provided by the
-``hyperref'' package. It will generate hyper references to the
+\qco{hyperref} package. It will generate hyper references to the
 URLs.
 
 For path names, we use ``\verb|\path{}|'' command. It won't
@@ -505,11 +721,12 @@ If they are escaped by a~\qco{\\},
 they appear in the end result with the escape character.
 The \qco{\\verb} macro can be used in running text if you
 need to use monospace font for a string which contains
-many characters to escape.\footnote{
-  \co{\\verb} is not almighty though. For example, you can't use it
-  within a footnote. If you do so, you will see a fatal latex error.
-  There are several workarounds of this problem, but as for perfbook,
-  \co{\\co\{\}} should suffice.}
+many characters to escape.\VerbatimFootnotes\footnote{
+  \verb|\verb| macro is not almighty though. For example, you can't
+  use it within a footnote. If you do so, you will see a fatal \LaTeX\ error.
+  The \qco{fancyvrb} package provides a workaround by
+  the name of \verb|\VerbatimFootnotes| macro. This footnote
+  contains \verb|\verb| macro.}
 
 \subsection{Non Breakable Spaces}
 \label{sec:app:styleguide:Non Breakable Spaces}
@@ -552,7 +769,7 @@ In plain \LaTeX, compound words such as ``high-frequency''
 can be hyphenated only at the hyphen. This sometimes results
 in poor typesetting. For example:
 
-\begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
+\begin{center}\begin{minipage}{2.6in}\vspace{0.6\baselineskip}
   High-frequency radio wave, high-frequency radio wave,
   high-frequency radio wave, high-frequency radio wave,
   high-frequency radio wave, high-frequency radio wave.
@@ -568,7 +785,7 @@ words is enabled in perfbook.\footnote{
 
 Example with \qco{\\-/}:
 
-\begin{center}\begin{minipage}{2.55in}\vspace{0.6\baselineskip}
+\begin{center}\begin{minipage}{2.6in}\vspace{0.6\baselineskip}
   High\-/frequency radio wave, high\-/frequency radio wave,
   high\-/frequency radio wave, high\-/frequency radio wave,
   high\-/frequency radio wave, high\-/frequency radio wave.
@@ -646,19 +863,23 @@ changes.
 Example with a simple dash:
 
 \begin{quote}
-  Lines~4\=/12 in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+\begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
+  Lines~\lnref{b}\=/\lnref{e} in
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
   are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on line~16.
+  by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
+\end{lineref}
 \end{quote}
 
 Example with an en dash:
 
 \begin{quote}
-  Lines~4\==12 in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+\begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
+  Lines~\lnref{b}\==\lnref{e} in
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolesc)}
   are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on line~16.
+  by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
+\end{lineref}
 \end{quote}
 
 \subsubsection{Numerical Minus Sign}
-- 
2.7.4

