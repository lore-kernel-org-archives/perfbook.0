Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ft5Zulg5RrMDtXCZN7pF5cP8C9TIf5PzbNj3DL7a55c=;
 b=R6mQNcUqAicZ5klUeHQ467enFvfpk6e+R/rLN1839CuyZ5MdFaOsMCXOescS4eit27
 Qycyl/GJiaOP0NL3nZA5gL/qAIKfBiMLty9RXFmL8IZXtjDcSgYVOkj63nJa/T8im6g1
 OWOy/ah31W5CFW1/r/MGmEmLUmtUxvcRdmTbTLmiMgb+OegcOng57tLxW6XwolQmq2Vb
 cCCN2JfrbPACkEVkfc+LDUGxy8lVGk64XHxlQLGywAW/dzlFne4AwSfcHIo/uEG9uI+Z
 PGbJHMMxvNOHz/GovvaR5CIFc3PJCY289GA+ZJL8+HXvGCaF7g/EYI3n0zmleeQYDzDD
 uO/w==
Subject: [PATCH 3/5] styleguide: Update LaTeX source of code snippet
References: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6639f1e4-36fa-2f02-57e4-71b57463501f@gmail.com>
Date: Sun, 13 Aug 2017 12:31:33 +0900
MIME-Version: 1.0
In-Reply-To: <cc6fbe48-4598-922c-295b-a5d70a7d859d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 7729d8527d2594aaabc0d4669ec2f3f9fc10142d Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 10 Aug 2017 00:23:48 +0900
Subject: [PATCH 3/5] styleguide: Update LaTeX source of code snippet

Present up-to-date scheme for code snippets.
Also catch up to the on-going modifications in main text inspired
by the style guide.
Also, clarify which of yet to be followed NIST rules can be
taken care of in the near future

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/samplecodesnippet.tex    |  19 ---
 appendix/styleguide/samplecodesnippetfig.tex |  19 +++
 appendix/styleguide/samplecodesnippetlst.tex |  19 +++
 appendix/styleguide/styleguide.tex           | 242 ++++++++++++++-------------
 perfbook.tex                                 |   1 +
 5 files changed, 168 insertions(+), 132 deletions(-)
 delete mode 100644 appendix/styleguide/samplecodesnippet.tex
 create mode 100644 appendix/styleguide/samplecodesnippetfig.tex
 create mode 100644 appendix/styleguide/samplecodesnippetlst.tex

diff --git a/appendix/styleguide/samplecodesnippet.tex b/appendix/styleguide/samplecodesnippet.tex
deleted file mode 100644
index 9020805..0000000
--- a/appendix/styleguide/samplecodesnippet.tex
+++ /dev/null
@@ -1,19 +0,0 @@
-\begin{figure}[tbh]
-{ \scriptsize
-\begin{verbbox}
-  1 /*
-  2  * Sample Code Snippet
-  3  */
-  4  #include <stdio.h>
-  5  int main(void)
-  6  {
-  7    printf("Hello world!\n");
-  8    return 0;
-  9  }
-\end{verbbox}
-}
-\centering
-\theverbbox
-\caption{Sample Code Snippet}
-\label{fig:app:styleguide:Sample Code Snippet}
-\end{figure}
diff --git a/appendix/styleguide/samplecodesnippetfig.tex b/appendix/styleguide/samplecodesnippetfig.tex
new file mode 100644
index 0000000..9020805
--- /dev/null
+++ b/appendix/styleguide/samplecodesnippetfig.tex
@@ -0,0 +1,19 @@
+\begin{figure}[tbh]
+{ \scriptsize
+\begin{verbbox}
+  1 /*
+  2  * Sample Code Snippet
+  3  */
+  4  #include <stdio.h>
+  5  int main(void)
+  6  {
+  7    printf("Hello world!\n");
+  8    return 0;
+  9  }
+\end{verbbox}
+}
+\centering
+\theverbbox
+\caption{Sample Code Snippet}
+\label{fig:app:styleguide:Sample Code Snippet}
+\end{figure}
diff --git a/appendix/styleguide/samplecodesnippetlst.tex b/appendix/styleguide/samplecodesnippetlst.tex
new file mode 100644
index 0000000..06df5cc
--- /dev/null
+++ b/appendix/styleguide/samplecodesnippetlst.tex
@@ -0,0 +1,19 @@
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
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 2312316..c90bbe7 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -185,44 +185,24 @@ Example:
 \label{sec:app:styleguide:NIST Guides Yet To Be Followed}

 There are a few cases where NIST style guide is not followed.
-Other English conventions are preferred in such cases.
-
-\subsubsection{Digit Spacing}
-\label{sec:app:styleguide:Digit Spacing}
-
-Quote from NIST check list:\footnote{
-  \#16 in \url{http://physics.nist.gov/cuu/Units/checklist.html}.
-}
-
-\begin{quote}
-  The digits of numerical values having more than four digits on either
-  side of the decimal marker are separated into groups of three using
-  a thin, fixed space counting from both the left and right of the decimal
-  marker. Commas are not used to separate digits into groups of three.
-\end{quote}
-
-\begin{quote}
-\begin{tabular}{ll}
-  NIST Example:& 15\,739.012\,53\,ms\\
-  Our conventions:& 15,739.01253\,ms\\
-\end{tabular}
-\end{quote}
-
-In \LaTeX\ coding, it is cumbersome to place thin spaces as are recommended
-in NIST guide. The \verb|\num{}| command provided by the ``siunitx''
-package would be of help for us to follow this rule.
+Other English conventions are followed in such cases.
+NIST rules of
+Sections~\ref{sec:app:styleguide:Percent Symbol}
+and~\ref{sec:app:styleguide:Font Style}
+are deemed acceptable by the editor.
+Contributions in those areas should be welcome.

 \subsubsection{Percent Symbol}
 \label{sec:app:styleguide:Percent Symbol}

 NIST style guide treats the percent symbol (\%) as the same as SI unit
 symbols.
-In this textbook, no space is required in front of a percent symbol.
+In this textbook, no space is placed in front of a percent symbol.

 \begin{quote}
 \begin{tabular}{ll}
   NIST guide:& 50\,\% possibility\\
-  Our conventions:& 50\% possibility\\
+  Current convention:& 50\% possibility\\
 \end{tabular}
 \end{quote}

@@ -262,7 +242,31 @@ in math mode by default.\footnote{
   See \url{https://tex.stackexchange.com/questions/119248/}
   for the historical reason.}

-\pagebreak % to prevent footnotes from spilling into next page
+\subsubsection{Digit Spacing}
+\label{sec:app:styleguide:Digit Spacing}
+
+Quote from NIST check list:\footnote{
+  \#16 in \url{http://physics.nist.gov/cuu/Units/checklist.html}.
+}
+
+\begin{quote}
+  The digits of numerical values having more than four digits on either
+  side of the decimal marker are separated into groups of three using
+  a thin, fixed space counting from both the left and right of the decimal
+  marker. Commas are not used to separate digits into groups of three.
+\end{quote}
+
+\begin{quote}
+\begin{tabular}{ll}
+  NIST Example:& 15\,739.012\,53\,ms\\
+  Our convention:& 15,739.01253\,ms\\
+\end{tabular}
+\end{quote}
+
+In \LaTeX\ coding, it is cumbersome to place thin spaces as are recommended
+in NIST guide. The \verb|\num{}| command provided by the ``siunitx''
+package would be of help for us to follow this rule.
+
 \section{\LaTeX\ Conventions}
 \label{sec:app:styleguide:LaTeX Conventions}

@@ -293,38 +297,90 @@ centering layout.
 %  by the ``listings'' package. We are already using its ``lstinline''
 %  command in the definition of \co{\\co\{\}} macro.

-\begin{figure}[tbh]
+\begin{listing}[tbh]
 { \scriptsize
 \verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}:\hspace{2ex}}}]
-	{appendix/styleguide/samplecodesnippet.tex}
+	{appendix/styleguide/samplecodesnippetlst.tex}
 }
 \centering
 \theverbbox
-\caption{\LaTeX\ Source of Sample Code Snippet}
-\label{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
-\end{figure}
+\caption{\LaTeX\ Source of Sample Code Snippet (Current)}
+\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+\end{listing}

-\input{appendix/styleguide/samplecodesnippet}
+\input{appendix/styleguide/samplecodesnippetlst}

 The \LaTeX\ source of a sample code snippet is shown in
-Figure~\ref{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 and is typeset as show in
-Figure~\ref{fig:app:styleguide:Sample Code Snippet}.
+Listing~\ref{lst:app:styleguide:Sample Code Snippet}.

-Note that the verbbox environment is placed inside the figure environment.
+Note that the verbbox environment is placed inside the listing environment.
 This is to avoid a side effect of verbbox environment that interferes
 with the ``afterheading\-/ness'' of a section's first sentence
 when a verbbox is placed just below a heading.

+Until recently, code snippets were coded using a different scheme.
+A sample \LaTeX\ source is shown in
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)}
+and is typeset as shown in
+Figure~\ref{fig:app:styleguide:Sample Code Snippet}.
+
+\begin{listing}[tbh]
+{ \scriptsize
+\verbfilebox[{\makebox[5ex][r]{\arabic{VerbboxLineNo}:\hspace{2ex}}}]
+	{appendix/styleguide/samplecodesnippetfig.tex}
+}
+\centering
+\theverbbox
+\caption{\LaTeX\ Source of Sample Code Snippet (Obsolescent)}
+\label{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)}
+\end{listing}
+
+\input{appendix/styleguide/samplecodesnippetfig}
+
+In Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolescent)},
+the code snippet is coded as a ``figure'' object.
 Line numbers are manually placed for ease of referencing them within
-\LaTeX\ sources.\footnote{
-  As a matter of fact, the verbatimbox package has its own line
-  number counter and the count can be displayed in the resulting
-  listing. Leftmost line numbers in
-  Figure~\ref{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
-  are output by the feature. The litmus tests in
-  Section~\ref{sec:advsync:Memory Barriers}
-  have been converted to use the auto-numbering feature.}
+\LaTeX\ sources.
+
+This is how most code snippets are coded as of this writing.
+However, strictly speaking, code snippets are \emph{not} figures
+and they deserve their own floating environment.
+The ``float'' package provides the feature to define additional
+floating environments.\footnote{
+  The ``floatrow'' package provides us even more flexible
+  control of floating objects. However, because of an issue
+  in two-column layout, we can not use it at the moment.}
+
+Transition to the auto-numbering scheme of verbbox and
+the ``listing'' environment defined for code snippets
+has recently started in
+Section~\ref{sec:advsync:Memory Barriers}.
+The transition also permits us to choose distinct looks
+for code snippets, including moving captions to top of the
+listings
+(discussed in Section~\ref{sec:app:styleguide:Position of Caption}).
+
+The auto\-/numbering feature of verbbox is enabled by
+the \verb|\LstLineNo| macro specified in the option to verbbox
+(line~3 in
+Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}).
+The macro is defined in the preamble of \path{perfbook.tex}
+as the following:
+
+\noindent\begin{minipage}{\columnwidth}
+{ \scriptsize
+\begin{verbbox}
+\newcommand{\LstLineNo}
+  {\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
+\end{verbbox}
+}
+\vspace{10pt}
+\centering
+\theverbbox
+\vspace{10pt}
+\end{minipage}

 The verbatim environment is used for listings with too many lines
 to fit in a column. It is also used to avoid overwhelming
@@ -554,7 +610,7 @@ Example with a simple dash:

 \begin{quote}
   Lines~4\=/12 in
-  Figure~\ref{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~16.
 \end{quote}
@@ -563,7 +619,7 @@ Example with an en dash:

 \begin{quote}
   Lines~4\==12 in
-  Figure~\ref{fig:app:styleguide:LaTeX Source of Sample Code Snippet}
+  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~16.
 \end{quote}
@@ -585,81 +641,41 @@ There are a few areas yet to be attempted in perfbook
 which would further improve its appearance.
 This section lists up such candidates.

-\subsubsection{Environment for Code Snippets}
-\label{sec:app:styleguide:Environment for Code Snippets}
-
-Strictly speaking, code snippets are \emph{not} figures.
-They deserve their own floating environment.
-The ``float'' package would be of help.\footnote{
-  The ``floatrow'' package provides us even more flexible
-  control of floating objects. However, because of an issue
-  in two-column layout, we can not use it at the moment.}
-
-Figure~\ref{fig:app:styleguide:Sample Code Snippet}
-can be typeset as in
-Listing~\ref{lst:app:styleguide:Sample Code Snippet}
-using an experimental environment ``listing''.
-
-\begin{listing}
-{ \scriptsize
-\begin{verbbox}[\LstLineNo]
-/*
- * Sample Code Snippet
- */
-#include <stdio.h>
-int main(void)
-{
-  printf("Hello world!\n");
-  return 0;
-}
-\end{verbbox}
-}
-\centering
-\theverbbox
-\caption{Sample Code Snippet}
-\label{lst:app:styleguide:Sample Code Snippet}
-\end{listing}
-
 \subsubsection{Position of Caption}
 \label{sec:app:styleguide:Position of Caption}

-In \LaTeX\ conventions, captions of tables should be placed
+In \LaTeX\ conventions, captions of tables are usually placed
 above them. The reason is the flow of your eye movement
 when you look at them. Most tables have a row of heading at the
 top. You naturally look at the top of a table at first. Captions at
 the bottom of tables disturb this flow.
 The same can be said of code snippets, which are read from
 top to bottom.
-The float package mentioned above also has the capability
-to adjust layout of caption.
-
-For code snippets, the ``ruled'' style would be our choice.
-Listing~\ref{lst:app:styleguide:Sample Code Snippet (Ruled)}
-is an example using the style.
-
-\begin{listing}
-{ \scriptsize
-\begin{verbbox}[\LstLineNo]
-/*
- * Sample Code Snippet
- */
-#include <stdio.h>
-int main(void)
-{
-  printf("Hello world!\n");
-  return 0;
-}
-\end{verbbox}
-}
-\centering
-\theverbbox
-\caption{Sample Code Snippet (Ruled)}
-\label{lst:app:styleguide:Sample Code Snippet (Ruled)}
-\end{listing}

-Once the conversion of code sippets to a new environment has
-completed, we would be able to choose one of the style options
-as the default for the environment.
+For code snippets, the ``ruled'' style chosen for listing
+environment places the caption at the top.
+See Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+for an example.
+
+As for tables, the position of caption can be tweaked by
+\verb|\floatstyle{}| and \verb|\restylefloat{}| macros
+in preamble.
+
+Currently, as most code snippets are figures with their captions
+at the bottom, captions of tables at the top might look inconsistent.
+Once the transition of code snippets to listing environment
+completes, there would be fewer figures and the caption of tables
+at the top would hopefully be acceptable.
+
+Vertical space between captions at the top and the table bodies
+can be reduced by the help of ``ctable'' package.
+
+In the sample tables shown in
+Section~\ref{sec:app:styleguide:Ruled Line in Table},
+the vertical skip is manually reduced by setting a negative value to the
+\verb|\abovetopsep| variable which controls the behavior of
+\verb|\toprule| of the ``booktabs'' package.
+It should be regarded as a band-aid tweak.

 \subsubsection{Grouping Related Figures/Listings}
 \label{sec:app:styleguide:Grouping Related Figures/Listings}
diff --git a/perfbook.tex b/perfbook.tex
index 23146ad..f8421ca 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -98,6 +98,7 @@
 \AtBeginEnvironment{tabular}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{tabulary}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{minipage}{\renewcommand{\ttdefault}{lmtt}}
+\AtBeginEnvironment{listing}{\renewcommand{\ttdefault}{lmtt}}
 }{}

 \begin{document}
-- 
2.7.4


