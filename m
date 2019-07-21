Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NnsYZy2MswaExqYV0wohJexsQg221K6g5rp5WFua/eg=;
        b=euTXXVopcHLcYFPL3Jg3qbJuugY6DYj/G0Hzb7IYaYqCPy6qinwR/a1uJkwwLTgiHE
         Ny/MtU8yFpB5/Nvex8WP59WjjYKFw9PVI33zN9lQqr7NQ9TuRJTTQgnWxxjNH4GTuk/O
         +lae6sDdqf/GXNxCa29nUWCSZEOZltJuyGDXbLrOL38ElTNEdeX3JPHkCBoKbIYmZ/5/
         SjFD2+nMBI5mtFdCE7SfjPlZ2Tl1dpB/LFtfmC1Jdsy6zvZglxCOyTU01QusIv03apQc
         DQWPDxuW2BO/CljAelqxPoQSp4WXWmvT+SmWgCA/vHr8KH6wxmZ4dPTdqpyRdI7l7zdC
         8o2Q==
Subject: [PATCH 7/7] styleguide: Update description of available options to
 \begin{snippet}
References: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bf3defd9-1d83-682a-d711-72f332eefc21@gmail.com>
Date: Sun, 21 Jul 2019 09:13:44 +0900
MIME-Version: 1.0
In-Reply-To: <7ad345a2-05a4-d512-bde2-b949f68d5145@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f781e599d428ed061c34159697d7ebf3c32927c8 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 15 Jul 2019 22:51:33 +0900
Subject: [PATCH 7/7] styleguide: Update description of available options to \begin{snippet}

Update the list of commands and options recognized by fcvextract.pl.
Now that the default is to remove comment blocks in code snippets,
we need the "keepcomment=yes" option in Listing B.3.
Also use American spelling of "flavor".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/samplecodesnippet.c |  2 +-
 appendix/styleguide/styleguide.tex      | 76 +++++++++++++++----------
 2 files changed, 48 insertions(+), 30 deletions(-)

diff --git a/appendix/styleguide/samplecodesnippet.c b/appendix/styleguide/samplecodesnippet.c
index f58f6568..37885a12 100644
--- a/appendix/styleguide/samplecodesnippet.c
+++ b/appendix/styleguide/samplecodesnippet.c
@@ -1,4 +1,4 @@
-//\begin{snippet}[labelbase=ln:base1,commandchars=\$\[\]]
+//\begin{snippet}[labelbase=ln:base1,keepcomment=yes,commandchars=\$\[\]]
 /*
  * Sample Code Snippet
  */
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 7cd05102..e5ca7aaa 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -330,20 +330,20 @@ The goal of the new scheme is to extract \LaTeX\ sources of
 code snippets directly from code samples under \path{CodeSamples}
 directory.
 It also makes it possible to embed line labels in the code samples,
-which can be referred from the text.
+which can be referenced within the \LaTeX\ sources.
 This reduces the burden of keeping line numbers
 in the text consistent with those in code snippets.
 
 Code-snippet extraction is handled by a couple of
 perl scripts and recipes in Makefile.
-We use the \co{fancyvrb} package's escaping feature
-to embed line labels in comments.
+We use the escaping feature of the \co{fancyvrb} package
+to embed line labels as comments.
 
 We used to use the \qco{verbbox} environment provided
 by the \qco{verbatimbox} package.
 Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)} describes how
 \co{verbbox} can automatically generate line numbers,
-but these line numbers cannot be referenced from the text.
+but those line numbers cannot be referenced within the \LaTeX\ sources.
 
 Let's start by looking at how code snippets are coded in the new scheme.
 There are three customized environments of \qco{Verbatim}.
@@ -448,45 +448,63 @@ are described as recipes in the top level \path{Makefile} and
 a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
 \end{lineref}
 
-\begin{listing}[tb]
+\begin{listing*}[tb]
 \fvset{fontsize=\scriptsize,numbers=left,numbersep=5pt,xleftmargin=9pt,obeytabs=true,tabsize=8}
 \VerbatimInput{appendix/styleguide/samplecodesnippet.c}
 \vspace*{-9pt}
-\caption{Source of Code Sample with ``snippet'' meta command}
+\caption{Source of Code Sample with ``snippet'' Meta Command}
 \label{lst:app:styleguide:Source of Code Sample}
-\end{listing}
+\end{listing*}
 
 As you can see, Listing ~\ref{lst:app:styleguide:Source of Code Sample}
 has meta commands in comments of C (C++ style). Those meta commands
 are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
 the type of comment style by the suffix of code sample's file name.
 
-Meta commands which can be used in code samples are shown below:
+Meta commands which can be used in code samples are listed below:
 
-\begin{VerbatimU}
-\begin{snippet}[option]
-\end{snippet}
-\lnlbl{<label string>}
-\end{VerbatimU}
+\begin{itemize}[noitemsep]
+\item \co{\\begin\{snippet\}[<options>]}
+\item \co{\\end\{snippet\}}
+\item \co{\\lnlbl\{<label string>\}}
+\item \co{\\fcvexclude}
+\item \co{\\fcvblank}
+\end{itemize}
 
-Options to the \co{\\begin\{snippet\}} meta command are as the following:
+\qco{<options>} to the \co{\\begin\{snippet\}} meta command
+is a comma-spareted list of options shown below:
 
-\begin{VerbatimU}
-labelbase=<label base string>
-commandchars=\X\Y\Z
-\end{VerbatimU}
+\begin{itemize}[noitemsep]
+\item \co{labelbase=<label base string>}
+\item \co{keepcomment=yes}
+\item \co{gobbleblank=yes}
+\item \co{commandchars=\\X\\Y\\Z}
+\end{itemize}
 
-The string given to \qco{labelbase} will be passed to
+The \qco{labelbase} option is mandatory and the string given to it
+will be passed to the
 ``\co{\\begin\{linelabel\}[<label base string>]}'' command as shown on
 line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):beg:linelabel} of
 Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
-\qco{commandchars} option is given to the \co{VerbatimL} environment as is.
+The \qco{keepcomment=yes} option tells \co{fcvextract.pl} to keep
+comment blocks.
+Otherwise, comment blocks in C source code will be omitted.
+The \qco{gobbleblank=yes} option will remove empty or blank lines
+in the resulting snippet.
+The \qco{commandchars} option is given to the \co{VerbatimL} environment
+as is. At the moment, it is also mandatory
+and must come at the end of options listed above.
 Other types of options, if any, are also passed to the \co{VerbatimL}
 environment.
-The \qco{lnlbl} commands are converted along the way to reflect
+
+The \qco{\lnlbl} commands are converted along the way to reflect
 the escape-character choice.\footnote{
-	Characters forming comments are also gobbled up.
+	Characters forming comments around the \qco{\lnlbl} commands
+	are also gobbled up regardless of the \qco{keepcomment} setting.
 }
+Source lines with \qco{\fcvexclude} are removed.
+\qco{\fcvblank} can be used to keep blank lines when the
+\qco{gobbleblank=yes} option is specified.
 
 There can be multiple pairs of \co{\\begin\{snippet\}} and \co{\\end\{snippet\}}
 as long as they have unique \qco{labelbase} strings.
@@ -498,25 +516,25 @@ ln:<Chapter/Subdirectory>:<File Name>:<Function Name>
 \end{VerbatimU}
 
 Litmus tests, which are handled by \qco{herdtools7} commands such as
-\qco{litmus7} and \qco{herd7}, were problematic for this scheme.
+\qco{litmus7} and \qco{herd7}, were problematic in this scheme.
 Those commands have particular rules of where comments can be
-placed and restriction on characters in comments.
+placed and restriction on permitted characters in comments.
 They also forbid a couple of tokens to appear in comments.
 (Tokens in comments might sound strange, but they do have such restriction.)
 
 For example, the first token in a litmus test must be one of
 \qco{C}, \qco{PPC}, \qco{X86}, \qco{LISA}, etc., which indicates
-the flavour of the test. This means no comment is allowed
+the flavor of the test. This means no comment is allowed
 at the beginning of a litmus test.
 
 Similarly, several tokens such as \qco{exists}, \qco{filter},
 and~\qco{locations} indicate the end of litmus test's body.
-Once one of them appears in a litmus test, comments should be
+Once one of them appears in a litmus test, comments should be of
 ocaml style (\qco{(* ... *)}). Those tokens keep the same meaning
 even when they appear in comments!
 
 The pair of characters ``\co{\{}'' and ``\co{\}}'' also have special
-meaning in the C flavour tests. They are used to seperate portions
+meaning in the C flavor tests. They are used to seperate portions
 in a litmus test.
 
 First pair of ``\co{\{}'' and ``\co{\}}'' encloses initialization part.
@@ -548,7 +566,7 @@ exists (0:r1=0)  // C++ style comment after test body
 \end{VerbatimN}
 \end{linelabel}
 
-To avoid parse errors, meta commands in litmus tests (C flavour) are embedded
+To avoid parse errors, meta commands in litmus tests (C flavor) are embedded
 in the following way.
 
 \begin{linelabel}[ln:app:styleguide:Sample Source of Litmus Test]
@@ -583,7 +601,7 @@ exists (1:r2=0 /\ 0:r2=0)  (* \lnlbl[exists_] *)
 
 Example above is converted to the following intermediate code
 by a script \path{utilities/reorder_ltms.pl}.\footnote{
-	Currently, only C flavour litmus tests are supported.
+	Currently, only C flavor litmus tests are supported.
 }
 The intermediate code can be handled
 by the common script \path{utilities/fcvextract.pl}.
-- 
2.17.1


