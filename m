Return-Path: <SRS0=/ExH=JY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OlwgFRivckvLrC6NDkUbWo4uP+AsXfP2/wvICxN5vTg=;
        b=rj3f3ZfRjNrOCBNynGdsNBp3hvtb2o0lrDuaYRzHhM33DGwgnwJ1H5XKr6zx/Rz0be
         pjx+HWOh0eZF8tIrhA+HisxwgId7rgcxlD8CGWNyOmfux4NCR4xiLdA5CeDldd57gBoV
         pig+FPpCEYqbjEu0YmJO4u4u77tFgwDlFgiyfFkkALTI53LYoiwTvHoZamyY56n7O1Zo
         ggZ07UNTfystFFcRusbApeA2/XlgFCfB406TmwsynROiGhorYvYLPcT8jLgJlGy6mibj
         ofkpwH7zbArDk9N+uUj22qgaIIjeC/1pzYiprH/QdWO7I3Xt5jq4oaE91XbZbJ2vZv3h
         T44Q==
Subject: [PATCH -perfbook v2 7/9] styleguide: Make end-of-sentence periods be
 at the end of lines
References: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <62f3ad86-34c6-3b6b-b992-8751e59827e0@gmail.com>
Date: Wed, 28 Apr 2021 00:30:27 +0900
MIME-Version: 1.0
In-Reply-To: <71cd07ce-5753-4007-8fab-3654956e5a92@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 237 ++++++++++++++++-------------
 1 file changed, 130 insertions(+), 107 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 407d0c52..7860ee2d 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -8,8 +8,8 @@
 \Epigraph{De gustibus non est disputandum.}{\emph{Latin maxim}}
 
 This appendix is a collection of style guides which is intended
-as a reference to improve consistency in perfbook. It also contains
-several suggestions and their experimental examples.
+as a reference to improve consistency in perfbook.
+It also contains several suggestions and their experimental examples.
 
 \Cref{sec:app:styleguide:Paul's Conventions} describes basic
 punctuation and spelling rules.
@@ -40,16 +40,18 @@ answers to Akira's questions regarding perfbook's punctuation policy.
   \end{quote}
 \item American English spelling: ``color'' rather than ``colour''.
 \item Oxford comma: ``a, b, and~c'' rather than ``a, b and~c''.
-  This is arbitrary.  Cases where the Oxford comma results in ambiguity
-  should be reworded, for example, by introducing numbering:  ``a,
-  b, and c and~d'' should be ``(1)~a, (2)~b, and (3)~c and~d''.
-\item Italic for emphasis.  Use sparingly.
+  This is arbitrary.
+  Cases where the Oxford comma results in ambiguity should be reworded,
+  for example, by introducing numbering:  ``a, b, and c and~d'' should
+  be ``(1)~a, (2)~b, and (3)~c and~d''.
+\item Italic for emphasis.
+  Use sparingly.
 \item \verb|\co{}| for identifiers, \verb|\url{}| for URLs,
   \verb|\path{}| for filenames.
-\item Dates should use an unambiguous format.  Never ``mm/dd/yy''
-  or ``dd/mm/yy'', but rather ``July 26, 2016'' or ``26 July 2016''
-  or ``26-Jul-2016'' or ``2016/07/26''.  I tend to use
-  \path{yyyy.mm.ddA} for filenames, for example.
+\item Dates should use an unambiguous format.
+  Never ``mm/dd/yy'' or ``dd/mm/yy'', but rather ``July 26, 2016''
+  or ``26 July 2016'' or ``26-Jul-2016'' or ``2016/07/26''.
+  I tend to use \path{yyyy.mm.ddA} for filenames, for example.
 \item North American rules on periods and abbreviations.
   For example neither of the following can reasonably be interpreted
   as two sentences:
@@ -74,8 +76,8 @@ answers to Akira's questions regarding perfbook's punctuation policy.
   \end{quote}
 \item I don't like ampersand (``\&'') in headings, but will sometimes
   use it if doing so prevents a line break in that heading.
-\item When mentioning words, I use quotations.  When introducing
-  a new word, I use \verb|\emph{}|.
+\item When mentioning words, I use quotations.
+  When introducing a new word, I use \verb|\emph{}|.
 \end{itemize}
 
 Following is a convention regarding punctuation in \LaTeX\ sources.
@@ -106,15 +108,15 @@ states the following rules (rephrased for perfbook).
 are used behind numerical values, narrow spaces should be placed between
 the values and the symbols.
 
-A narrow space can be coded in \LaTeX{} by the sequence of
-\qco{\\,}.
+A narrow space can be coded in \LaTeX{} by the sequence of \qco{\\,}.
 For example,
 \begin{quote}
   ``2.4\,GHz'', rather then ``2.4GHz''.
 \end{quote}
 
 \item Even when the value is used in adjectival sense, a narrow space
-should be placed. For example,
+  should be placed.
+  For example,
 \begin{quote}
   ``a~10\,ms interval'', rather than ``a~10\=/ms interval'' nor
   ``a~10ms interval''.
@@ -123,15 +125,17 @@ should be placed. For example,
 
 The symbol of micro (\micro :$10^{-6}$) can be typeset easily by
 the help of ``gensymb'' \LaTeX\ package.
-A macro \qco{\\micro} can be used in both text and
-math modes. To typeset the symbol of ``microsecond'', you can do
-so by \qco{\\micro s}. For example,
+A macro \qco{\\micro} can be used in both text and math modes.
+To typeset the symbol of ``microsecond'', you can do
+so by \qco{\\micro s}.
+For example,
 \begin{quote}
   10\,\micro s
 \end{quote}
 
 Note that math mode \qco{\\mu} is italic by default and should not
-be used as a prefix. An improper example:
+be used as a prefix.
+An improper example:
 \begin{quote}
   10\,$\mu $s (math mode \qco{\\mu})
 \end{quote}
@@ -161,8 +165,9 @@ An acceptable example:
 \end{quote}
 
 Also, it is acceptable to use just ``K'', ``M'', or ``G'' as abbreviations
-appended to a numerical value, e.g., ``4K~entries''. In such cases, no space
-before an abbreviation is required. For example,
+appended to a numerical value, e.g., ``4K~entries''.
+In such cases, no space before an abbreviation is required.
+For example,
 
 \begin{quote}
   ``8K entries'', rather than ``8\,K entries''.
@@ -172,14 +177,15 @@ If you put a space in between, the symbol looks like a unit symbol and
 is confusing.
 Note that ``K'' and ``k'' represent $2^{10}$ and $10^3$, respectively.
 ``M'' can represent either $2^{20}$ or $10^6$, and ``G'' can represent
-either $2^{30}$ or $10^9$. These ambiguities should not be confusing
-in discussing approximate order.
+either $2^{30}$ or $10^9$.
+These ambiguities should not be confusing in discussing approximate order.
 
 \subsubsection{Degree Symbol}
 \label{sec:app:styleguide:Degree Symbol}
 
 The angular-degree symbol (\degree) does not require any space in front
-of it. NIST style guide clearly states so.
+of it.
+NIST style guide clearly states so.
 
 The symbol of degree can also be typeset easily by the help of gensymb
 package.
@@ -209,10 +215,11 @@ Quote from NIST check list:\footnote{
 }
 
 \begin{quote}
-  Variables and quantity symbols are in italic type. Unit symbols
-  are in roman type. Numbers should generally be written in roman
-  type. These rules apply irrespective of the typeface used in
-  the surrounding text.
+  Variables and quantity symbols are in italic type.
+  Unit symbols are in roman type.
+  Numbers should generally be written in roman type.
+  These rules apply irrespective of the typeface used in the surrounding
+  text.
 \end{quote}
 
 For example,
@@ -251,7 +258,8 @@ Quote from NIST checklist:\footnote{
   The digits of numerical values having more than four digits on either
   side of the decimal marker are separated into groups of three using
   a thin, fixed space counting from both the left and right of the decimal
-  marker. Commas are not used to separate digits into groups of three.
+  marker.
+  Commas are not used to separate digits into groups of three.
 \end{quote}
 
 \begin{quote}
@@ -262,8 +270,9 @@ Quote from NIST checklist:\footnote{
 \end{quote}
 
 In \LaTeX\ coding, it is cumbersome to place thin spaces as are recommended
-in NIST guide. The \verb|\num{}| command provided by the ``siunitx''
-package would be of help for us to follow this rule.
+in NIST guide.
+The \verb|\num{}| command provided by the ``siunitx'' package would be
+of help for us to follow this rule.
 It would also help us overcome different conventions.
 We can select a specific digit-grouping style as
 a default in preamble, or specify an option to each \verb|\num{}|
@@ -358,8 +367,9 @@ but those line numbers cannot be referenced within the \LaTeX\ sources.
 Let's start by looking at how code snippets are coded in the current scheme.
 There are three customized environments of \qco{Verbatim}.
 \qco{VerbatimL} is for floating snippets within the \qco{listing}
-environment. \qco{VerbatimN} is for inline snippets with line count
-enabled. \qco{VerbatimU} is for inline snippets without line count.
+environment.
+\qco{VerbatimN} is for inline snippets with line count enabled.
+\qco{VerbatimU} is for inline snippets without line count.
 They are defined in the preamble as shown below:
 
 \begin{VerbatimU}
@@ -398,11 +408,12 @@ The \LaTeX\ source of a sample code snippet is shown in
 and is typeset as shown in
 \cref{lst:app:styleguide:Sample Code Snippet}.
 
-Labels to lines are specified in \qco{$lnlbl[]} command. The characters
-specified by \qco{commandchars} option to \co{VarbatimL} environment are
-used by the \co{fancyvrb} package to substitute \qco{\\lnlbl\{\}}
-for \qco{$lnlbl[]}. Those characters should be selected so that they
-don't appear elsewhere in the code snippet.
+Labels to lines are specified in \qco{$lnlbl[]} command.
+The characters specified by \qco{commandchars} option to \co{VarbatimL}
+environment are used by the \co{fancyvrb} package to substitute
+\qco{\\lnlbl\{\}} for \qco{$lnlbl[]}.
+Those characters should be selected so that they don't appear
+elsewhere in the code snippet.
 
 Labels \qco{printf} and \qco{return} in
 \cref{lst:app:styleguide:Sample Code Snippet}
@@ -453,9 +464,10 @@ The main part of \LaTeX\ source shown on
 \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}
 can be extracted from a code sample of
 \cref{lst:app:styleguide:Source of Code Sample} by a perl script
-\path{utilities/fcvextract.pl}. All the relevant rules of extraction
-are described as recipes in the top level \path{Makefile} and
-a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
+\path{utilities/fcvextract.pl}.
+All the relevant rules of extraction are described as recipes in the
+top level \path{Makefile} and a script to generate dependencies
+(\path{utilities/gen_snippet_d.pl}).
 \end{fcvref}
 
 \begin{listing*}
@@ -467,9 +479,10 @@ a script to generate dependencies (\path{utilities/gen_snippet_d.pl}).
 \end{listing*}
 
 As you can see, \cref{lst:app:styleguide:Source of Code Sample}
-has meta commands in comments of C (C++ style). Those meta commands
-are interpreted by \path{utilities/fcvextract.pl}, which distinguishes
-the type of comment style by the suffix of code sample's file name.
+has meta commands in comments of C (C++ style).
+Those meta commands are interpreted by \path{utilities/fcvextract.pl},
+which distinguishes the type of comment style by the suffix of code
+sample's file name.
 
 Meta commands which can be used in code samples are listed below:
 
@@ -502,8 +515,9 @@ Otherwise, comment blocks in C source code will be omitted.
 The \qco{gobbleblank=yes} option will remove empty or blank lines
 in the resulting snippet.
 The \qco{commandchars} option is given to the \co{VerbatimL} environment
-as is. At the moment, it is also mandatory
-and must come at the end of options listed above.
+as is.
+At the moment, it is also mandatory and must come at the end of options
+listed above.
 Other types of options, if any, are also passed to the \co{VerbatimL}
 environment.
 
@@ -534,18 +548,18 @@ They also forbid a couple of tokens to appear in comments.
 
 For example, the first token in a litmus test must be one of
 \qco{C}, \qco{PPC}, \qco{X86}, \qco{LISA}, etc., which indicates
-the flavor of the test. This means no comment is allowed
-at the beginning of a litmus test.
+the flavor of the test.
+This means no comment is allowed at the beginning of a litmus test.
 
 Similarly, several tokens such as \qco{exists}, \qco{filter},
 and~\qco{locations} indicate the end of litmus test's body.
 Once one of them appears in a litmus test, comments should be of
-OCaml style (\qco{(* ... *)}). Those tokens keep the same meaning
-even when they appear in comments!
+OCaml style (\qco{(* ... *)}).
+Those tokens keep the same meaning even when they appear in comments!
 
 The pair of characters \qco{\{} and \qco{\}} also have special
-meaning in the C flavour tests. They are used to separate portions
-in a litmus test.
+meaning in the C flavour tests.
+They are used to separate portions in a litmus test.
 
 First pair of \qco{\{} and \qco{\}} encloses initialization part.
 Comments in this part should also be in the ocaml form.
@@ -686,9 +700,9 @@ as follows:
 \end{VerbatimU}
 
 The \qco{verbatim} environment is used for listings with too many lines
-to fit in a column. It is also used to avoid overwhelming
-\LaTeX\ with a lot of floating objects. They are being converted to the
-scheme using the \co{VerbatimN} environment.
+to fit in a column.
+It is also used to avoid overwhelming \LaTeX\ with a lot of floating objects.
+They are being converted to the scheme using the \co{VerbatimN} environment.
 
 \subsubsection{Identifier}
 \label{sec:app:styleguide:Identifier}
@@ -697,12 +711,13 @@ We use ``\verb|\co{}|'' macro for inline identifiers.
 (``co'' stands for ``code''.)
 
 By putting them into \verb|\co{}|, underscore characters in
-their names are free of escaping in \LaTeX\ source. It is convenient
-to search them in source files. Also, \verb|\co{}|
-macro has a capability to permit line breaks at particular
-sequences of letters. Current definition permits a line break at
-an underscore (\tco{_}), two consecutive underscores (\tco{__}),
-a white space, or an operator \tco{->}.
+their names are free of escaping in \LaTeX\ source.
+It is convenient to search them in source files.
+Also, \verb|\co{}| macro has a capability to permit line breaks
+at particular sequences of letters.
+Current definition permits a line break at an underscore (\tco{_}),
+two consecutive underscores (\tco{__}), a white space, or an
+operator \tco{->}.
 
 \subsubsection{Identifier inside Table and Heading}
 \label{sec:app:styleguide:Identifier inside Table and Heading}
@@ -716,9 +731,9 @@ Furthermore, \verb|\co{}| can not be safely used in section headings nor
 description headings.
 
 As a workaround, we use ``\verb|\tco{}|'' command
-inside tables and headings. It has no capability of line break
-at particular sequences, but still frees us from escaping
-underscores.
+inside tables and headings.
+It has no capability of line break at particular sequences, but
+still frees us from escaping underscores.
 
 When used in text, \verb|\tco{}| permits line breaks at
 white spaces.
@@ -727,11 +742,11 @@ white spaces.
 \label{sec:app:styleguide:Other Use Cases of Monospace Font}
 
 For URLs, we use ``\verb|\url{}|'' command provided by the
-\qco{hyperref} package. It will generate hyper references to the
-URLs.
+\qco{hyperref} package.
+It will generate hyper references to the URLs.
 
-For path names, we use ``\verb|\path{}|'' command. It won't
-generate hyper references.
+For path names, we use ``\verb|\path{}|'' command.
+It won't generate hyper references.
 
 Both \verb|\url{}| and \verb|\path{}| permit line breaks
 at \qco{/}, \qco{-}, and \qco{.}.\footnote{
@@ -787,7 +802,7 @@ many characters to escape.\footnote{
 
 Cross-references to \namecrefs{chp:Introduction},
 \namecrefs{sec:intro:Parallel Programming Goals},
-\namecrefs{lst:app:styleguide:Source of Code Sample}, etc.\ have
+\namecrefs{lst:app:styleguide:Source of Code Sample}, etc.\@ have
 been expressed by combinations of names and bare \verb|\ref{}|
 commands in the following way:
 
@@ -843,9 +858,10 @@ info on its cleverness.
 \label{sec:app:styleguide:Non Breakable Spaces}
 
 In \LaTeX\ conventions, proper use of non-breakable white spaces
-is highly recommended. They can prevent widowing and orphaning
-of single digit numbers or short variable names, which would
-cause the text to be confusing at first glance.
+is highly recommended.
+They can prevent widowing and orphaning of single digit numbers
+or short variable names, which would cause the text to be confusing
+at first glance.
 
 The thin space mentioned earlier to be placed in front of a unit
 symbol is non breakable.
@@ -877,8 +893,9 @@ are the following (inexhaustive).
 \label{sec:app:styleguide:Hyphenation in Compound Word}
 
 In plain \LaTeX, compound words such as ``high-frequency''
-can be hyphenated only at the hyphen. This sometimes results
-in poor typesetting. For example:
+can be hyphenated only at the hyphen.
+This sometimes results in poor typesetting.
+For example:
 
 \begin{center}\begin{minipage}{2.6in}\vspace{0.6\baselineskip}
   High-frequency radio wave, high-frequency radio wave,
@@ -906,7 +923,7 @@ Example with \qco{\\-/}:
 \label{sec:app:styleguide:Non Breakable Hyphen}
 
 We want hyphenated compound terms such as ``x\=/coordinate'',
-``y\=/coordinate'', etc.\ not to be broken at the hyphen
+``y\=/coordinate'', etc.\@ not to be broken at the hyphen
 following a single letter.
 
 To make a hyphen unbreakable, we can use a short cut
@@ -942,9 +959,9 @@ of compound words as the same as \qco{\\-/} does.
 \subsubsection{Em Dash}
 \label{sec:app:styleguide:Em Dash}
 
-Em dashes are used to indicate parenthetic expression. In perfbook,
-em dashes are placed without spaces around it. In \LaTeX\ source,
-an em dash is represented by \qco{---}.
+Em dashes are used to indicate parenthetic expression.
+In perfbook, em dashes are placed without spaces around it.
+In \LaTeX\ source, an em dash is represented by \qco{---}.
 
 Example (quote from \cref{sec:app:whymb:Cache Structure}):
 \begin{quote}
@@ -972,8 +989,8 @@ Example with a simple dash:
 \begin{fcvref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\=/\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
-  are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on \clnref{theverbbox}.
+  are the contents of the verbbox environment.
+  The box is output by the \co{\\theverbbox} macro on \clnref{theverbbox}.
 \end{fcvref}
 \end{quote}
 
@@ -983,8 +1000,8 @@ Example with an en dash:
 \begin{fcvref}[ln:app:styleguide:samplecodesnippetlstlbl]
   Lines~\lnref{b}\==\lnref{e} in
   \cref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Obsolete)}
-  are the contents of the verbbox environment. The box is output
-  by the \co{\\theverbbox} macro on \clnref{theverbbox}.
+  are the contents of the verbbox environment.
+  The box is output by the \co{\\theverbbox} macro on \clnref{theverbbox}.
 \end{fcvref}
 \end{quote}
 
@@ -993,8 +1010,8 @@ Example with an en dash:
 
 Numerical minus signs should be coded as math mode minus signs,
 namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
-  same upright glyph as text mode. Our default font choice meets
-  the assumption.
+  same upright glyph as text mode.
+  Our default font choice meets the assumption.
 \IfSansSerif{
   One of the experimental targets ``1csf'' \emph{does} use a differnt font
   for math mode figures as of October 2017.}{}
@@ -1011,8 +1028,8 @@ For example,
 \subsubsection{Ellipsis}
 \label{sec:app:styleguide:Ellipsis}
 
-In monospace fonts, ellipses can be expressed by
-series of periods. For example:
+In monospace fonts, ellipses can be expressed by series of periods.
+For example:
 
 \begin{quote}
   \verb|Great ... So how do I fix it?|
@@ -1029,9 +1046,10 @@ Standard \LaTeX\ defines the \verb|\dots| macro for this purpose.
 However, it has a kludge in the evenness of spaces.
 The ``ellipsis'' package redefines the \verb|\dots| macro to fix
 the issue.\footnote{To be exact, it is the \co{\\textellipsis} macro
-  that is redefined. The behavior of \co{\\dots} macro in math
-  mode is not affected. The ``amsmath'' package has another definition
-  of \co{\\dots}. It is not used in perfbook at the moment.}
+  that is redefined.
+  The behavior of \co{\\dots} macro in math mode is not affected.
+  The ``amsmath'' package has another definition of \co{\\dots}.
+  It is not used in perfbook at the moment.}
 By using \verb|\dots|, the above example is typeset as the following:
 
 \begin{quote}
@@ -1149,7 +1167,8 @@ is drawn by using the features of ``booktabs'' and ``xcolor'' packages.
 Note that ruled lines of booktabs can not be mixed with
 vertical lines in a table.\footnote{
   There is another package named ``arydshln'' which provides dashed lines
-  to be used in tables. A couple of experimental examples are presented in
+  to be used in tables.
+  A couple of experimental examples are presented in
   \cref{sec:app:styleguide:Table Layout Experiment}.
 }
 
@@ -1190,10 +1209,11 @@ IBM~Q	& $0.015$
 \label{sec:app:styleguide:Position of Caption}
 
 In \LaTeX\ conventions, captions of tables are usually placed
-above them. The reason is the flow of your eye movement
-when you look at them. Most tables have a row of heading at the
-top. You naturally look at the top of a table at first. Captions at
-the bottom of tables disturb this flow.
+above them.
+The reason is the flow of your eye movement when you look at them.
+Most tables have a row of heading at the top.
+You naturally look at the top of a table at first.
+Captions at the bottom of tables disturb this flow.
 The same can be said of code snippets, which are read from
 top to bottom.
 
@@ -1351,10 +1371,10 @@ and a \verb|\subref{}| macro, for example,
 
 It can also be cited by a \verb|\ref{}| macro, for example,
 ``\cref{sublst:app:styleguide:Enforcing Order}''.
-Note the difference in the resulting format. For the citing by
-a \verb|\ref{}| to work, you need to place the \verb|\label{}|
-macro of the combined floating object ahead of the definition of
-subfloats.
+Note the difference in the resulting format.
+For the citing by a \verb|\ref{}| to work, you need to place
+the \verb|\label{}| macro of the combined floating object
+ahead of the definition of subfloats.
 Otherwise, the resulting caption number would be off by one
 from the actual number.
 
@@ -1364,8 +1384,9 @@ from the actual number.
 This section presents some experimental tables
 using booktabs, xcolors, and arydshln packages.
 The corresponding tables in the text have been converted using one of
-the format shown here. The source of this section can be regarded
-as a reference to be consulted when new tables are added in the text.
+the format shown here.
+The source of this section can be regarded as a reference to be
+consulted when new tables are added in the text.
 
 \begin{table}
 \rowcolors{1}{}{lightgray}
@@ -1415,7 +1436,8 @@ In
 the gap in the mid-rule corresponds to the distinction
 which had been represented by double vertical rules before the conversion.
 The legends in the frame box appended here explain the abbreviations used
-in the matrix. Two types of memory barrier are denoted by subscripts here.
+in the matrix.
+Two types of memory barrier are denoted by subscripts here.
 The legends and subscripts are not present in
 \cref{tab:together:Synchronizing Reference Counting}
 since they are redundant there.
@@ -1508,15 +1530,16 @@ is a tweaked version of
 \cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs}.
 Here, the ``Category'' column in the original is removed
 and the categories are indicated in rows of bold-face font
-just below the mid-rules. This change makes it easier for
-\verb|\rowcolors{}| command of ``xcolor'' package to work
-properly.
+just below the mid-rules.
+This change makes it easier for \verb|\rowcolors{}| command of
+``xcolor'' package to work properly.
 
 \Cref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 is another version which keeps original columns and colors rows only where
-a category has multiple rows. This is done by combining \verb|\rowcolors{}|
-of ``xcolor'' and \verb|\cellcolor{}| commands of the ``colortbl''
-package (\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).
+a category has multiple rows.
+This is done by combining \verb|\rowcolors{}| of ``xcolor'' and
+\verb|\cellcolor{}| commands of the ``colortbl'' package
+(\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).
 
 In
 \cref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
-- 
2.17.1


