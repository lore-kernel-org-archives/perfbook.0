Return-Path: <SRS0=ektU=XV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=PuOAlaE1SvdfzsooaG4Xrl9iocHX29Kyq92V7Yscq44=;
        b=OirRP2lDoDEdXihZycBdNbonilGWQUPGXTJ8LYh+QzcHW38Ek/pQ5S76wWXgV3c8nM
         GduRfIE9ogVPr7V2X1MwnmAcN1oYBHuu3aXG7WqFpdBYaZzduYW7zgyGXKTTpueXGn1v
         kKnmkrTPC3Qf4D8AaeVnh0RRgyKr4NvPR4YHbx9KO0fnNyXC9mdj+EqN0fkVoqc4g0Jx
         H612gTG8luVMsLJ1izeBxRegri0UPXyvRGBAC4bTjfHWsV+tjfxen2eCZ+CW5opcJsNE
         WC8baSQSH60nvnHvPcT3YnN000msizvRBoaLDGgLvEeBV8ZsL3LMI2TyFyniXcWtEuos
         505w==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 1/2] styleguide: Introduce/Experiment 'cleveref' package
Message-ID: <407f9616-f2e9-575d-7441-273d626bb40c@gmail.com>
Date: Fri, 27 Sep 2019 07:33:26 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 162ed1c2a59b2442287184ecfab5676c75b5e7bf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 22 Sep 2019 15:30:59 +0900
Subject: [PATCH 1/2] styleguide: Introduce/Experiment 'cleveref' package

We can automate label naming by employing "cleveref" package [1]
and get rid of explicit names such as "Section~", "Figure~",
"Table~", etc. in front of \ref{} macros.

[1]: https://ctan.org/pkg/cleveref

Using cleveref frees us from keeping label names and label types
consistent. This commit attempts to demonstrate it in Style Guide.

Note: Cross-references to line numbers are not changed here.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 103 ++++++++++++++---------------
 perfbook.tex                       |   3 +
 2 files changed, 54 insertions(+), 52 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index e5ca7aaa..4384dc95 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -10,11 +10,11 @@ This appendix is a collection of style guides which is intended
 as a reference to improve consistency in perfbook. It also contains
 several suggestions and their experimental examples.
 
-Section~\ref{sec:app:styleguide:Paul's Conventions} describes basic
+\cref{sec:app:styleguide:Paul's Conventions} describes basic
 punctuation and spelling rules.
-Section~\ref{sec:app:styleguide:NIST Style Guide} explains rules
+\cref{sec:app:styleguide:NIST Style Guide} explains rules
 related to unit symbols.
-Section~\ref{sec:app:styleguide:LaTeX Conventions} summarizes
+\cref{sec:app:styleguide:LaTeX Conventions} summarizes
 \LaTeX-specific conventions.
 
 \section{Paul's Conventions}
@@ -258,7 +258,7 @@ It would also help us overcome different conventions.
 We can select a specific digit-grouping style as
 a default in preamble, or specify an option to each \verb|\num{}|
 command as is shown in
-Table~\ref{tab:app:styleguide:Digit-Grouping Style}.
+\cref{tab:app:styleguide:Digit-Grouping Style}.
 
 \newcommand{\NumDigitGrpA}{12 345}
 \newcommand{\NumDigitGrpB}{12.345}
@@ -290,7 +290,7 @@ Table~\ref{tab:app:styleguide:Digit-Grouping Style}.
 \end{table}
 
 As are evident in
-Table~\ref{tab:app:styleguide:Digit-Grouping Style},
+\cref{tab:app:styleguide:Digit-Grouping Style},
 periods and commas used as other than decimal markers are confusing
 and should be avoided, especially in documents expecting global
 audiences.
@@ -341,7 +341,7 @@ to embed line labels as comments.
 
 We used to use the \qco{verbbox} environment provided
 by the \qco{verbatimbox} package.
-Section~\ref{sec:app:styleguide:Code Snippet (Obsolete)} describes how
+\cref{sec:app:styleguide:Code Snippet (Obsolete)} describes how
 \co{verbbox} can automatically generate line numbers,
 but those line numbers cannot be referenced within the \LaTeX\ sources.
 
@@ -384,9 +384,9 @@ They are defined in the preamble as shown below:
 \input{appendix/styleguide/samplecodesnippetfcv.tex}
 
 The \LaTeX\ source of a sample code snippet is shown in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+\cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 and is typeset as shown in
-Listing~\ref{lst:app:styleguide:Sample Code Snippet}.
+\cref{lst:app:styleguide:Sample Code Snippet}.
 
 Labels to lines are specified in \qco{$lnlbl[]} command. The characters
 specified by \qco{commandchars} option to \co{VarbatimL} environment are
@@ -395,7 +395,7 @@ for \qco{$lnlbl[]}. Those characters should be selected so that they
 don't appear elsewhere in the code snippet.
 
 Labels \qco{printf} and \qco{return} in
-Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+\cref{lst:app:styleguide:Sample Code Snippet}
 can be referred to as shown below:
 
 \begin{VerbatimU}
@@ -440,9 +440,9 @@ shown below:
 \begin{lineref}[ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current)]
 The main part of \LaTeX\ source shown on
 Lines~\lnref{beg:linelabel}-\lnref{end:linelabel} in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
+\cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 can be extracted from a code sample of
-Listing~\ref{lst:app:styleguide:Source of Code Sample} by a perl script
+\cref{lst:app:styleguide:Source of Code Sample} by a perl script
 \path{utilities/fcvextract.pl}. All the relevant rules of extraction
 are described as recipes in the top level \path{Makefile} and
 a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
@@ -456,7 +456,7 @@ a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
 \label{lst:app:styleguide:Source of Code Sample}
 \end{listing*}
 
-As you can see, Listing ~\ref{lst:app:styleguide:Source of Code Sample}
+As you can see, \cref{lst:app:styleguide:Source of Code Sample}
 has meta commands in comments of C (C++ style). Those meta commands
 are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
 the type of comment style by the suffix of code sample's file name.
@@ -485,7 +485,7 @@ The \qco{labelbase} option is mandatory and the string given to it
 will be passed to the
 ``\co{\\begin\{linelabel\}[<label base string>]}'' command as shown on
 line~\ref{ln:app:styleguide:LaTeX Source of Sample Code Snippet (Current):beg:linelabel} of
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
+\cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}.
 The \qco{keepcomment=yes} option tells \co{fcvextract.pl} to keep
 comment blocks.
 Otherwise, comment blocks in C source code will be omitted.
@@ -647,9 +647,9 @@ the restriction of comments.
 
 Sample \LaTeX\ source of a code snippet coded using
 the \qco{verbatimbox} package is shown in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
+\cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
 and is typeset as shown in
-Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolete)}.
+\cref{lst:app:styleguide:Sample Code Snippet (Obsolete)}.
 
 \begin{listing}[tb]
 \begin{linelabel}[ln:app:styleguide:samplecodesnippetlstlbl]
@@ -666,7 +666,7 @@ Listing~\ref{lst:app:styleguide:Sample Code Snippet (Obsolete)}.
 The auto\-/numbering feature of \co{verbbox} is enabled by
 the ``\verb|\LstLineNo|'' macro specified in the option to verbbox
 (line~\ref{ln:app:styleguide:samplecodesnippetlstlbl:lineno} in
-Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}).
+\cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}).
 The macro is defined in the preamble of \path{perfbook.tex}
 as follows:
 
@@ -737,7 +737,7 @@ the ``\verb|\nbco{}|'' (non-breakable co) macro.
 
 There are a few cases where macros introduced in this section
 do not work as expected.
-Table~\ref{tab:app:styleguide:Limitation of Monospace Macro}
+\cref{tab:app:styleguide:Limitation of Monospace Macro}
 lists such limitations.
 
 \begin{table}[tbh]
@@ -788,7 +788,7 @@ are the following (inexhaustive).
 \begin{itemize}
 \item Reference to a Chapter or a Section:
   \begin{quote}
-    Please refer to Section~\ref{sec:app:styleguide:NIST Style Guide}.
+    Please refer to \cref{sec:app:styleguide:NIST Style Guide}.
   \end{quote}
 \item Calling out CPU number or Thread name:
   \begin{quote}
@@ -877,7 +877,7 @@ Em dashes are used to indicate parenthetic expression. In perfbook,
 em dashes are placed without spaces around it. In \LaTeX\ source,
 an em dash is represented by \qco{---}.
 
-Example (quote from Section~\ref{sec:app:whymb:Cache Structure}):
+Example (quote from \cref{sec:app:whymb:Cache Structure}):
 \begin{quote}
   This disparity in speed---more than two orders of magnitude---has
   resulted in the multi-megabyte caches found on modern CPUs.
@@ -907,7 +907,7 @@ Example with a simple dash:
 \begin{quote}
 \begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\=/\lnref{e} in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
+  \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
 \end{lineref}
@@ -918,7 +918,7 @@ Example with an en dash:
 \begin{quote}
 \begin{lineref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\==\lnref{e} in
-  Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
+  \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
   are the contents of the verbbox environment. The box is output
   by the \co{\\theverbbox} macro on line~\lnref{theverbbox}.
 \end{lineref}
@@ -1020,14 +1020,14 @@ used sparingly, especially in tables of simple structure.
 \newcommand{\THi}{T_\mathrm{H}}
 \newcommand{\CPf}{C_\mathrm{P}}
 
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
+\cref{tab:app:styleguide:Refrigeration Power Consumption}
 (corresponding to a table from a now-deleted section)
 is drawn by using the features of ``booktabs'' and ``xcolor'' packages.
 Note that ruled lines of booktabs can not be mixed with
 vertical lines in a table.\footnote{
   There is another package named ``arydshln'' which provides dashed lines
   to be used in tables. A couple of experimental examples are presented in
-  Section~\ref{sec:app:styleguide:Table Layout Experiment}.
+  \cref{sec:app:styleguide:Table Layout Experiment}.
 }
 
 \begin{table}[tbhp]
@@ -1076,7 +1076,7 @@ top to bottom.
 
 For code snippets, the ``ruled'' style chosen for listing
 environment places the caption at the top.
-See Listing~\ref{lst:app:styleguide:Sample Code Snippet}
+See \cref{lst:app:styleguide:Sample Code Snippet}
 for an example.
 
 As for tables, the position of caption is tweaked by
@@ -1200,33 +1200,32 @@ The ``subfig'' package provides the features to do so.\footnote{
 Two floating objects can be placed side by side by using
 \co{\\parbox} or \co{minipage}.
 For example,
-Figures~\ref{fig:advsync:Timer Wheel at 1kHz}
-and~\ref{fig:advsync:Timer Wheel at 100kHz}
+\cref{fig:advsync:Timer Wheel at 1kHz,fig:advsync:Timer Wheel at 100kHz}
 can be grouped together by using a pair of \co{minipage}s
 as shown in
-Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
-and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.
+\cref{fig:app:styleguide:Timer Wheel at 1kHz,%
+fig:app:styleguide:Timer Wheel at 100kHz}.
 
 By using subfig package,
-Listings~\ref{lst:memorder:Message-Passing Litmus Test (No Ordering)}
-and~\ref{lst:memorder:Enforcing Order of Message-Passing Litmus Test}
+\cref{lst:memorder:Message-Passing Litmus Test (No Ordering),%
+lst:memorder:Enforcing Order of Message-Passing Litmus Test}
 can be grouped together as shown in
-Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
+\cref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
 with sub\-/captions (with a minor change of blank line).
 
 Note that they can not be grouped in the same way as
-Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
-and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}
+\cref{fig:app:styleguide:Timer Wheel at 1kHz,%
+fig:app:styleguide:Timer Wheel at 100kHz}
 because the ``ruled'' style prevents their captions
 from being properly typeset.
 
 The sub\-/caption can be cited by combining a \verb|\ref{}| macro
 and a \verb|\subref{}| macro, for example,
-``Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}\,%
+``\cref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}\,%
 \subref{sublst:app:styleguide:Not Enforcing Order}''.
 
 It can also be cited by a \verb|\ref{}| macro, for example,
-``Listing~\ref{sublst:app:styleguide:Enforcing Order}''.
+``\cref{sublst:app:styleguide:Enforcing Order}''.
 Note the difference in the resulting format. For the citing by
 a \verb|\ref{}| to work, you need to place the \verb|\label{}|
 macro of the combined floating object ahead of the definition of
@@ -1272,24 +1271,24 @@ as a reference to be consulted when new tables are added in the text.
 \end{table}
 
 In
-Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+\cref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
 (corresponding to
-Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}),
+\cref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}),
 the ``S'' column specifiers provided
 by the ``siunitx'' package are used to align numbers.
 
-Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
+\cref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
 (corresponding to
-Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms})
+\cref{tab:together:Reference Counting and Synchronization Mechanisms})
 is an example of table with a complex header.
 In
-Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms},
+\cref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms},
 the gap in the mid-rule corresponds to the distinction
 which had been represented by double vertical rules before the conversion.
 The legends in the frame box appended here explain the abbreviations used
 in the matrix. Two types of memory barrier are denoted by subscripts here.
 The legends and subscripts are not present in
-Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}
+\cref{tab:together:Reference Counting and Synchronization Mechanisms}
 since they are redundant there.
 
 \begin{table}[tb]
@@ -1327,9 +1326,9 @@ since they are redundant there.
 \label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
 \end{table}
 
-Table~\ref{tab:app:styleguide:Cache Coherence Example}
+\cref{tab:app:styleguide:Cache Coherence Example}
 (corresponding to
-Table~\ref{tab:app:whymb:Cache Coherence Example})
+\cref{tab:app:whymb:Cache Coherence Example})
 is a sequence diagram drawn as a table.
 
 \begin{table*}[tbh]
@@ -1370,23 +1369,23 @@ is a sequence diagram drawn as a table.
 \label{tab:app:styleguide:Cache Coherence Example}
 \end{table*}
 
-Table~\ref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
+\cref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs}
 is a tweaked version of
-Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
+\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
 Here, the ``Category'' column in the original is removed
 and the categories are indicated in rows of bold-face font
 just below the mid-rules. This change makes it easier for
 \verb|\rowcolors{}| command of ``xcolor'' package to work
 properly.
 
-Table~\ref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
+\cref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 is another version which keeps original columns and colors rows only where
 a category has multiple rows. This is done by combining \verb|\rowcolors{}|
 of ``xcolor'' and \verb|\cellcolor{}| commands of the ``colortbl''
 package (\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).
 
 In
-Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
+\cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
 the latter layout without partial row coloring has been
 chosen for simplicity.
 
@@ -1538,9 +1537,9 @@ Pointer update &
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 \end{table*}
 
-Table~\ref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
+\cref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
 (corresponding to
-Table~\ref{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events})
+\cref{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events})
 is also a sequence diagram drawn as a tabular object.
 
 \begin{table*}[tbh]
@@ -1571,9 +1570,9 @@ is also a sequence diagram drawn as a tabular object.
 \label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
 \end{table*}
 
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
+\cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
 shows another version of
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
+\cref{tab:app:styleguide:Refrigeration Power Consumption}
 with dashed horizontal and vertical rules of the arydshln package.
 
 \setlength\dashlinedash{.5pt}
@@ -1613,7 +1612,7 @@ IBM~Q	& $0.015$
 
 In this case, the vertical dashed rules seems unnecessary.
 The one without the vertical rules is shown in
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}.
+\cref{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}.
 
 \begin{table}[H]
 \renewcommand*{\arraystretch}{1.2}\centering\small
diff --git a/perfbook.tex b/perfbook.tex
index 85696333..3cdb0f9c 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -163,6 +163,9 @@
 \captionsetup{hangindent=20pt}
 \captionsetup[listing]{hangindent=20pt}
 
+\usepackage[capitalise,noabbrev]{cleveref}
+\crefname{subsubsubappendix}{Appendix}{Appendices}
+\crefname{sublisting}{Listing}{Listings}
 
 \begin{document}
 
-- 
2.17.1

