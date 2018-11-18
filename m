Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53062 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbeKRPLz (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 18 Nov 2018 10:11:55 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAI4mgcr109054
        for <perfbook@vger.kernel.org>; Sat, 17 Nov 2018 23:52:50 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nu10n0se6-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Sat, 17 Nov 2018 23:52:49 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sun, 18 Nov 2018 04:52:49 -0000
Date: Sat, 17 Nov 2018 20:52:46 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] styleguide: Expand on goal of new snippet scheme
Reply-To: paulmck@linux.ibm.com
References: <d0231222-c4c4-e6ae-e077-69544c3b96aa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0231222-c4c4-e6ae-e077-69544c3b96aa@gmail.com>
Message-Id: <20181118045246.GF4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Nov 18, 2018 at 12:17:33AM +0900, Akira Yokosawa wrote:
> >From 0590665e74862cbbe59a432313cb36d55f8cee92 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 18 Nov 2018 00:04:46 +0900
> Subject: [PATCH] styleguide: Expand on goal of new snippet scheme
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I applied both, thank you very much!

As usual, I could not resist a bit of editing.  Could you please check
below to catch anything I might have messed up?

							Thanx, Paul

------------------------------------------------------------------------

commit 201ccf123685542f759e66f053d09bce4ca1d0ff
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Sun Nov 18 00:04:46 2018 +0900

    styleguide: Expand on goal of new snippet scheme
    
    Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
    [ paulmck: Update flow and style. ]

diff --git a/appendix/styleguide/samplecodesnippetfcv.tex b/appendix/styleguide/samplecodesnippetfcv.tex
index 4e03b2aaf3ca..b47b7f59c324 100644
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
index b18922e763b3..43638b6f3137 100644
--- a/appendix/styleguide/samplecodesnippetlst.tex
+++ b/appendix/styleguide/samplecodesnippetlst.tex
@@ -1,4 +1,4 @@
-\begin{listing}
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}[\LstLineNo]
 /*
diff --git a/appendix/styleguide/samplecodesnippetlstlbl.tex b/appendix/styleguide/samplecodesnippetlstlbl.tex
index d3e4a9533d89..c0558d8eb2cd 100644
--- a/appendix/styleguide/samplecodesnippetlstlbl.tex
+++ b/appendix/styleguide/samplecodesnippetlstlbl.tex
@@ -1,4 +1,4 @@
-\begin{listing}
+\begin{listing}[tb]
 { \scriptsize
 \begin{verbbox}[\LstLineNo] %lnlbl@lineno$
 /*				%lnlbl@b$
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 058789803f59..3fe79ceb5b04 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -322,13 +322,31 @@ This section explains the use cases of such macros and environments.
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
+This reduces the burden of keeping line numbers
+in the text consistent with those in code snippets.
 
+Code-snippet extraction is handled by a couple of
+perl scripts and recipes in Makefile.
+We use the \co{fancyvrb} package's escaping feature
+to embed line labels in comments.
+
+We used to use the \qco{verbbox} environment provided
+by the \qco{verbatimbox} package.
+Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)} describes how
+\co{verbbox} can automatically generate line numbers,
+but these line numbers cannot be referenced from the text.
+
+Let's start by looking at how code snippets are coded in the new scheme.
+There are three customized environments of \qco{Verbatim}.
 \qco{VerbatimL} is for floating snippets within the \qco{listing}
 environment. \qco{VerbatimN} is for inline snippets with line count
 enabled. \qco{VerbatimU} is for inline snippets without line count.
@@ -349,20 +367,6 @@ They are defined in the preamble as shown below:
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
@@ -410,13 +414,39 @@ to from text.
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
@@ -427,7 +457,7 @@ a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
 \end{listing}
 
 As you can see, Listing ~\ref{lst:app:styleguide:Source of Code Sample}
-has meta commands in comments of C (C++ style). These meta commands
+has meta commands in comments of C (C++ style). Those meta commands
 are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
 the type of comment style by the suffix of code sample's file name.
 
@@ -446,15 +476,17 @@ labelbase=<label base string>
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
@@ -492,7 +524,7 @@ Comments in this part should be of the form \qco{(* ... *)}.
 
 You can't use \qco{\{} and \qco{\}} in comments in litmus tests, either.
 
-Example of disallowed comments in a litmus test are shown below:
+Examples of disallowed comments in a litmus test are shown below:
 
 \begin{linelabel}[ln:app:styleguide:Bad comments in Litmus Test]
 \begin{VerbatimN}[tabsize=8]

