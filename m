Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=/wetg79peYqajzGtkETbYqOBQTu44fOkJWqiH59NDNk=;
        b=iY3HJZay9KROQojWYbpK43stuFnjEkm0SKQR86RGZDD5W50RILMzzc5wRbeGm1Ig5j
         Gfim0/YERUkjoNiwz+G1YSmPy5Z80G0XvTRT+U7zjsPIPPMXGHivlQK5nL8U+KeWwJXX
         VT/RtnITfhSq+9skZD7Eyh7euqarDOIdDANnIm0J+ge+t4DGRidadFPnI+HNfEAwC8Ju
         BOvYtW2r1njVqV3THMQoqpZ5lBYidVBvtuGPNt4kKBEXjuw3OgA7051UpbrWlG4iZTWE
         tQqfKiVP8he06fcuD11+41CA2BM48ZKdXeg0kCaVsPqHYRBpn9Nxqv4msl5eAuDI/mxP
         Ok6Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] styleguide: Expand on goal of new snippet scheme
Message-ID: <d0231222-c4c4-e6ae-e077-69544c3b96aa@gmail.com>
Date: Sun, 18 Nov 2018 00:17:33 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 0590665e74862cbbe59a432313cb36d55f8cee92 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 18 Nov 2018 00:04:46 +0900
Subject: [PATCH] styleguide: Expand on goal of new snippet scheme

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/samplecodesnippetfcv.tex    |  4 +-
 appendix/styleguide/samplecodesnippetlst.tex    |  2 +-
 appendix/styleguide/samplecodesnippetlstlbl.tex |  2 +-
 appendix/styleguide/styleguide.tex              | 79 +++++++++++++++++--------
 4 files changed, 59 insertions(+), 28 deletions(-)

diff --git a/appendix/styleguide/samplecodesnippetfcv.tex b/appendix/styleguide/samplecodesnippetfcv.tex
index 4e03b2a..b47b7f5 100644
--- a/appendix/styleguide/samplecodesnippetfcv.tex
+++ b/appendix/styleguide/samplecodesnippetfcv.tex
@@ -1,5 +1,5 @@
 \begin{listing}[tb]
-\begin{linelabel}[ln:base1]			%lnlbl~linelabel^
+\begin{linelabel}[ln:base1]			%lnlbl~beg:linelabel^
 \begin{VerbatimL}[commandchars=\$\[\]]
 /*
  * Sample Code Snippet
@@ -11,7 +11,7 @@ int main(void)
 	return 0;			$lnlbl[return]
 }
 \end{VerbatimL}
-\end{linelabel}
+\end{linelabel}					%lnlbl~end:linelabel^
 \caption{Sample Code Snippet}
 \label{lst:app:styleguide:Sample Code Snippet}
 \end{listing}
diff --git a/appendix/styleguide/samplecodesnippetlst.tex b/appendix/styleguide/samplecodesnippetlst.tex
index b18922e..43638b6 100644
--- a/appendix/styleguide/samplecodesnippetlst.tex
+++ b/appendix/styleguide/samplecodesnippetlst.tex
@@ -1,4 +1,4 @@
-\begin{listing}
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 /*
diff --git a/appendix/styleguide/samplecodesnippetlstlbl.tex b/appendix/styleguide/samplecodesnippetlstlbl.tex
index d3e4a95..c0558d8 100644
--- a/appendix/styleguide/samplecodesnippetlstlbl.tex
+++ b/appendix/styleguide/samplecodesnippetlstlbl.tex
@@ -1,4 +1,4 @@
-\begin{listing}
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}[\LstLineNo] %lnlbl@lineno$
 /*				%lnlbl@b$
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 0587898..768a0e1 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -322,13 +322,30 @@ This section explains the use cases of such macros and environments.
 \subsubsection{Code Snippet}
 \label{sec:app:styleguide:Code Snippet}
 
-Because the \qco{verbatim} environment is a primitve way to include
+Because the \qco{verbatim} environment is a primitive way to include
 listings, we are transitioning to a new scheme which uses
 the \qco{fancyvrb} package for code snippets.
 
-Three customized environments of \qco{Verbatim} are defined
-for perfbook.
+The goal of the new scheme is to extract \LaTeX\ sources of
+code snippets directly from code samples under \path{CodeSamples}
+directory.
+It also makes it possible to embed line labels in the code samples,
+which can be referred from the text.
+This will reduce the burden of keeping line numbers
+in the text consistent with those in code snippets.
 
+Extraction of code snippets is covered by a couple of
+perl scripts and recipes in Makefile. Embedding line labels is
+realized by using escaping feature provided by the \co{fancyvrb} package.
+
+We used to use the \qco{verbbox} environment provided
+by the \qco{verbatimbox} package. As is described in
+Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)},
+\co{verbbox} has the capability of automatic line numbering.
+However, it is impossible to label lines to refer from the text.
+
+Let's start by looking at how code snippets are coded in the new scheme.
+There are three customized environments of \qco{Verbatim}.
 \qco{VerbatimL} is for floating snippets within the \qco{listing}
 environment. \qco{VerbatimN} is for inline snippets with line count
 enabled. \qco{VerbatimU} is for inline snippets without line count.
@@ -349,20 +366,6 @@ They are defined in the preamble as shown below:
     samepage=true,frame=single}
 \end{VerbatimU}
 
-We used to use the \qco{verbbox} environment provided
-by the \qco{verbatimbox} package. As will be described later in
-Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)},
-\co{verbbox} has the capability of automatic
-line numbering. However, it is not possible to embed labels on lines
-in the snippet to refer from the text.
-
-The \co{fancyvrb} package allows us to do that by the help of
-escaping feature.
-And the \LaTeX\ sources of snippets can be extracted from code samples under
-the \path{CodeSamples} directory of perfbook tree.
-
-Conversion to the new scheme is currently underway.
-
 % Another option would be the ``lstlisting'' environment provided
 %  by the ``listings'' package. We are already using its ``lstinline''
 %  command in the definition of \co{\\co\{\}} macro.
@@ -410,13 +413,39 @@ to from text.
 \end{lineref}
 \end{quote}
 
-\LaTeX\ source shown in
+Macros \qco{\\lnlbl\{\}} and \qco{\\lnref\{\}} are defined in
+the preamble as follows:
+
+\begin{VerbatimU}
+\newcommand{\lnlblbase}{}
+\newcommand{\lnlbl}[1]{%
+  \phantomsection\label{\lnlblbase:#1}}
+\newcommand{\lnrefbase}{}
+\newcommand{\lnref}[1]{\ref{\lnrefbase:#1}}
+\end{VerbatimU}
+
+Environments \qco{linelabel} and \qco{lineref} are defined as
+shown below:
+
+\begin{VerbatimU}
+\newenvironment{linelabel}[1][]{%
+  \renewcommand{\lnlblbase}{#1}%
+  \ignorespaces}{\ignorespacesafterend}
+\newenvironment{lineref}[1][]{%
+  \renewcommand{\lnrefbase}{#1}%
+  \ignorespaces}{\ignorespacesafterend}
+\end{VerbatimU}
+
+\begin{lineref}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
+The main part of \LaTeX\ source shown on
+Lines~\lnref{beg:linelabel}-\lnref{end:linelabel} in
 Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 can be extracted from a code sample of
 Listing~\ref{lst:app:styleguide:Source of Code Sample} by a perl script
 \path{utilities/fcvextract.pl}. All the relevant rules of extraction
 are described as recipes in the top level \path{Makefile} and
 a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
+\end{lineref}
 
 \begin{listing}[tb]
 \fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8}
@@ -427,7 +456,7 @@ a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
 \end{listing}
 
 As you can see, Listing ~\ref{lst:app:styleguide:Source of Code Sample}
-has meta commands in comments of C (C++ style). These meta commands
+has meta commands in comments of C (C++ style). Those meta commands
 are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
 the type of comment style by the suffix of code sample's file name.
 
@@ -446,15 +475,17 @@ labelbase=<label base string>
 commandchars=\X\Y\Z
 \end{VerbatimU}
 
-The string given to \qco{labelbase} will be converted to
+The string given to \qco{labelbase} will be passed to
 ``\co{\\begin\{linelabel\}[<label base string>]}'' command as shown on
-line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):linelabel} of
+line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):beg:linelabel} of
 Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
 \qco{commandchars} option is given to the \co{VerbatimL} environment as is.
 Other types of options, if any, are also passed to the \co{VerbatimL}
 environment.
-The \qco{lnlbl} commands are converted to reflect the escape-character choice
-along the way.
+The \qco{lnlbl} commands are converted along the way to reflect
+the escape-character choice.\footnote{
+	Characters forming comments are also gobbled up.
+}
 
 There can be multiple pairs of \co{\\begin\{snippet\}} and \co{\\end\{snippet\}}
 as long as they have unique \qco{labelbase} strings.
@@ -492,7 +523,7 @@ Comments in this part should be of the form \qco{(* ... *)}.
 
 You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
 
-Example of disallowed comments in a litmus test are shown below:
+Examples of disallowed comments in a litmus test are shown below:
 
 \begin{linelabel}[ln:app:styleguide:Bad comments in Litmus Test]
 \begin{VerbatimN}[tabsize=8]
-- 
2.7.4


