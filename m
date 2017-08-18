Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z9tOG04keeeU1WHY1SFtW+1uCA7XbOlOZRXY9hHEFlg=;
 b=i4Av1zLh6w/L72osRt5jZR2gQHDVvYMFk87mKhrl8q5eukG7dz7LujYUz9otubTyGp
 9xQTBKB7L2joqRpmhHJa3pZ2xld9gu3cWXaXgoldP0nhYe0i+5FVbrxoP6K9OYCSMysR
 wqoWFR3QLIXuKbkcf5EjaSuDMN7CdXSlP5zgIQqWT9MlJ9uieSY1FbnypNs6OOWG8t3X
 S8ut07SOF8spM5kWqUuReVdNL9Q5I0QK6t/MnI2SbBBCsNHShq9H+h7KxW3Gzu48QBLP
 cpfYbawH4WfQ4RWSgbkEOoRapTMHhZXyHdqK9XqKArh0P5J8HjnYm7aHMTHqQS/ZVwKg
 kYXA==
Subject: [PATCH 4/4] styleguide: Add table examples with dashed lines
References: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c7144282-e993-e949-09f5-949926dd25ab@gmail.com>
Date: Sat, 19 Aug 2017 08:45:16 +0900
MIME-Version: 1.0
In-Reply-To: <5db6cf8f-2061-5e14-07db-b64ebae2d2e4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From af290804fbb9868bb242c8ad6d889d46dfa9add1 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 18 Aug 2017 00:19:05 +0900
Subject: [PATCH 4/4] styleguide: Add table examples with dashed lines

These examples use dashed lines provided by "arydshln" package.
On Ubuntu 14.04LTS, "arydshln" is contained in "texlive-humanities"
package.

On Ubuntu 16.04LTS, it is covered in "texlive-latex-extra".

Also update FAQ-BUILD.txt accordingly and tweak position of
floating objects.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt                      |   5 +-
 appendix/styleguide/styleguide.tex | 293 +++++++++++++++++++++++--------------
 perfbook.tex                       |   1 +
 3 files changed, 189 insertions(+), 110 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 6b618b4..2bd37f1 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -34,7 +34,7 @@
 	find it?

 	A.	The "pdflatex" package is a variant of Don Knuth's
-		digital typesetting program.  On Ubuntu Trusty and Xenial,
+		digital typesetting program.  On Ubuntu Xenial,
 		installing the following set of packages suffices:

 			texlive-latex-base texlive-latex-extra psutils
@@ -43,6 +43,9 @@
 			texlive-science texlive-bibtex-extra latex2html
 			gnuplot-x11 xfig inkscape graphviz fig2ps

+		On Ubuntu Trusty, in addition to the above, you need:
+			texlive-humanities
+
 		On Fedora 24, installing the following set of packages
 		suffices:
 			fig2ps graphviz texlive-epstopdf inkscape latex2html
diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 40dfa74..cfa3234 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -679,50 +679,7 @@ namely \qco{$-$}. For example,
 \subsection{Improvement Candidates}
 \label{sec:app:styleguide:Improvement Candidates}

-There are a few areas yet to be attempted in perfbook
-which would further improve its appearance.
-This section lists up such candidates.
-
-\subsubsection{Position of Caption}
-\label{sec:app:styleguide:Position of Caption}
-
-In \LaTeX\ conventions, captions of tables are usually placed
-above them. The reason is the flow of your eye movement
-when you look at them. Most tables have a row of heading at the
-top. You naturally look at the top of a table at first. Captions at
-the bottom of tables disturb this flow.
-The same can be said of code snippets, which are read from
-top to bottom.
-
-For code snippets, the ``ruled'' style chosen for listing
-environment places the caption at the top.
-See Listing~\ref{lst:app:styleguide:Sample Code Snippet}
-for an example.
-
-As for tables, the position of caption can be tweaked by
-\verb|\floatstyle{}| and \verb|\restylefloat{}| macros
-in preamble.
-
-Currently, as most code snippets are figures with their captions
-at the bottom, captions of tables at the top might look inconsistent.
-Once the transition of code snippets to listing environment
-completes, there would be fewer figures and the caption of tables
-at the top would hopefully be acceptable.
-
-Vertical space between captions at the top and the table bodies
-can be reduced by the help of ``ctable'' package.
-
-In the sample tables shown in
-Section~\ref{sec:app:styleguide:Ruled Line in Table},
-the vertical skip is manually reduced by setting a negative value to the
-\verb|\abovetopsep| variable which controls the behavior of
-\verb|\toprule| of the ``booktabs'' package.
-It should be regarded as a band-aid tweak.
-
-\subsubsection{Grouping Related Figures/Listings}
-\label{sec:app:styleguide:Grouping Related Figures/Listings}
-
-\begin{figure*}[tbhp]\centering
+\begin{figure*}[tbh]\centering
 \begin{minipage}[t][][t]{2.1in}
 \resizebox{2.1in}{!}{\includegraphics{cartoons/1kHz}}
 \caption{Timer Wheel at 1\,kHz}
@@ -736,54 +693,10 @@ It should be regarded as a band-aid tweak.
 \end{minipage}
 \end{figure*}

-To prevent a pair of closely related figures or listings
-from being placed in different pages, it is desirable to group
-them into a single floating object.
-The ``subfig'' package provides the features to do so.\footnote{
-  One problem of grouping figures might be the complexity in
-  \LaTeX\ source.}
-
-Two floating objects can be placed side by side by using
-\co{\\parbox} or \co{minipage}.
-For example,
-Figures~\ref{fig:rt:Timer Wheel at 1kHz}
-and~\ref{fig:rt:Timer Wheel at 100kHz}
-can be grouped together by using a pair of \co{minipage}s
-as shown in
-Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
-and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.
-
-By using subfig package,
-Listings~\ref{lst:advsync:Message-Passing Litmus Test}
-and~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}
-can be grouped together as shown in
-Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
-with sub\-/captions (with a minor change of blank line).
-
-Note that they can not be grouped in the same way as
-Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
-and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}
-because the ``ruled'' style prevents their captions
-from being properly typeset.
-
-The sub\-/caption can be cited by combining a \verb|\ref{}| macro
-and a \verb|\subref{}| macro, for example,
-``Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}\,%
-\subref{sublst:app:styleguide:Not Enforcing Order}''.
-
-It can also be cited by a \verb|\ref{}| macro, for example,
-``Listing~\ref{sublst:app:styleguide:Enforcing Order}''.
-Note the difference in the resulting format. For the citing by
-a \verb|\ref{}| to work, you need to place the \verb|\label{}|
-macro of the combined floating object ahead of the definition of
-subfloats.
-Otherwise, the resulting caption number would be off by one
-from the actual number.
-
 \floatstyle{ruled}
 \restylefloat{listing}

-\begin{listing*}%
+\begin{listing*}[tbh]%
 \caption{Message-Passing Litmus Test (by subfig)}%
 \label{lst:app:styleguide:Message-Passing Litmus Test (subfig)}%
 {\scriptsize%
@@ -857,6 +770,94 @@ exists (1:r2=2 /\ 1:r3=0)
 }\hspace*{\fill}%
 \end{listing*}

+There are a few areas yet to be attempted in perfbook
+which would further improve its appearance.
+This section lists up such candidates.
+
+\subsubsection{Position of Caption}
+\label{sec:app:styleguide:Position of Caption}
+
+In \LaTeX\ conventions, captions of tables are usually placed
+above them. The reason is the flow of your eye movement
+when you look at them. Most tables have a row of heading at the
+top. You naturally look at the top of a table at first. Captions at
+the bottom of tables disturb this flow.
+The same can be said of code snippets, which are read from
+top to bottom.
+
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
+Sections~\ref{sec:app:styleguide:Ruled Line in Table}
+and~\ref{sec:app:styleguide:Table Layout Experiment},
+the vertical skip is manually reduced by setting a negative value to the
+\verb|\abovetopsep| variable which controls the behavior of
+\verb|\toprule| of the ``booktabs'' package.
+It should be regarded as a band-aid tweak.
+
+\subsubsection{Grouping Related Figures/Listings}
+\label{sec:app:styleguide:Grouping Related Figures/Listings}
+
+To prevent a pair of closely related figures or listings
+from being placed in different pages, it is desirable to group
+them into a single floating object.
+The ``subfig'' package provides the features to do so.\footnote{
+  One problem of grouping figures might be the complexity in
+  \LaTeX\ source.}
+
+Two floating objects can be placed side by side by using
+\co{\\parbox} or \co{minipage}.
+For example,
+Figures~\ref{fig:rt:Timer Wheel at 1kHz}
+and~\ref{fig:rt:Timer Wheel at 100kHz}
+can be grouped together by using a pair of \co{minipage}s
+as shown in
+Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
+and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}.
+
+By using subfig package,
+Listings~\ref{lst:advsync:Message-Passing Litmus Test}
+and~\ref{lst:advsync:Enforcing Order of Message-Passing Litmus Test}
+can be grouped together as shown in
+Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}
+with sub\-/captions (with a minor change of blank line).
+
+Note that they can not be grouped in the same way as
+Figures~\ref{fig:app:styleguide:Timer Wheel at 1kHz}
+and~\ref{fig:app:styleguide:Timer Wheel at 100kHz}
+because the ``ruled'' style prevents their captions
+from being properly typeset.
+
+The sub\-/caption can be cited by combining a \verb|\ref{}| macro
+and a \verb|\subref{}| macro, for example,
+``Listing~\ref{lst:app:styleguide:Message-Passing Litmus Test (subfig)}\,%
+\subref{sublst:app:styleguide:Not Enforcing Order}''.
+
+It can also be cited by a \verb|\ref{}| macro, for example,
+``Listing~\ref{sublst:app:styleguide:Enforcing Order}''.
+Note the difference in the resulting format. For the citing by
+a \verb|\ref{}| to work, you need to place the \verb|\label{}|
+macro of the combined floating object ahead of the definition of
+subfloats.
+Otherwise, the resulting caption number would be off by one
+from the actual number.
+
 \subsubsection{Ruled Line in Table}
 \label{sec:app:styleguide:Ruled Line in Table}

@@ -879,7 +880,7 @@ can be tweaked as shown in
 Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
 with the help of ``booktabs'' and ``xcolor'' packages.

-\begin{table}[htbp]
+\begin{table}[tbhp]
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.2}\centering\small
 \begin{tabular}{lrrr}\toprule
@@ -915,27 +916,18 @@ IBM~Q	& $0.015$
 Note that ruled lines of booktabs can not be mixed with
 vertical lines in a table.\footnote{
   There is another package named ``arydshln'' which provides dashed lines
-  to be used in tables.
+  to be used in tables. A couple of experimental examples are presented in
+  Section~\ref{sec:app:styleguide:Table Layout Experiment}.
 }

-\vfil
-\pagebreak % to permit wide tables to be printed
-
 \subsubsection{Table Layout Experiment}
 \label{sec:app:styleguide:Table Layout Experiment}

 To see how far we can go without vertical rules in tables,
-several experiments using booktabs and xcolors are presented
-in this section.
+several experiments using booktabs, xcolors, and arydshln packages
+are presented in this section.

-Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
-can be tweaked as is shown in
-Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}.
-In this table, original tabular source contains tweaks with
-\verb|\textcolor{}| commands. They are removed by using ``S'' column
-specifiers provided by the ``siunitx'' package.
-
-\begin{table}[htb]
+\begin{table}[tb]
 \rowcolors{1}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \sisetup{group-minimum-digits=4,group-separator={,}}
@@ -963,12 +955,19 @@ specifiers provided by the ``siunitx'' package.
 \label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
 \end{table}

+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
+can be tweaked as is shown in
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System} using booktabs and xcolors.
+In this table, original tabular source contains tweaks with
+\verb|\textcolor{}| commands. They are removed by using ``S'' column
+specifiers provided by the ``siunitx'' package.
+
 Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
 is a tweaked version of
 Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms},
 which has more complex header than the tables experimented so far.

-\begin{table}[htbp]
+\begin{table}[tb]
 \small
 \centering
 \renewcommand*{\arraystretch}{1.25}
@@ -1005,7 +1004,7 @@ An example with proper legends is shown in
 Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms (Legends)}.
 Two types of memory barrier are denoted by subscripts here.

-\begin{table}[htbp]
+\begin{table}[tb]
 \small
 \centering
 \renewcommand*{\arraystretch}{1.25}
@@ -1047,7 +1046,7 @@ in a similar manner.
 It is not a ``table'' in the narrow sense, rather a sequence diagram.
 A ``figure'' environment might be a proper choice here.

-\begin{table*}[htb]
+\begin{table*}[tbh]
 \small
 \centering
 \renewcommand*{\arraystretch}{1.2}
@@ -1081,7 +1080,7 @@ Here, the ``Category'' column in the original is removed
 and the categories are indicated in rows of bold-face font
 just below the mid-rules.

-\begin{table*}[htb]
+\begin{table*}[tbh]
 \rowcolors{2}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \footnotesize
@@ -1156,7 +1155,7 @@ can be tweaked as shown in
 Table~\ref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}.
 It is also a sequence diagram drawn as a tabular object.

-\begin{table*}[htb]
+\begin{table*}[tbh]
 \rowcolors{6}{}{lightgray}
 \renewcommand*{\arraystretch}{1.1}
 \small
@@ -1184,6 +1183,82 @@ It is also a sequence diagram drawn as a tabular object.
 \label{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
 \end{table*}

+Table~\ref{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
+shows another version of
+Table~\ref{tab:future:Refrigeration Power Consumption}
+with dashed horizontal and vertical rules of the arydshln package.
+
+\setlength\dashlinedash{.5pt}
+\setlength\dashlinegap{1pt}
+
+\begin{table}[H]
+\renewcommand*{\arraystretch}{1.2}\centering\small
+\begin{tabular}{l:r:r:r}\toprule
+Situation
+	& $T$ (K)
+		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+\hline
+Dry Ice
+	& $195$
+		& $1.990$
+			& 0.5 \\ \hdashline
+Liquid N$_2$
+	& $77$
+		& $0.356$
+			& 2.8 \\ \hdashline
+Liquid H$_2$
+	& $20$
+		& $0.073$
+			& 13.7 \\ \hdashline
+Liquid He
+	& $4$
+		& $0.0138$
+			& 72.3 \\ \hdashline
+IBM~Q	& $0.015$
+		& $0.000051$
+			& 19,500.0 \\
+\bottomrule
+\end{tabular}
+\caption{Refrigeration Power Consumption}
+\label{tab:app:styleguide:Refrigeration Power Consumption (arydshln)}
+\end{table}
+
+In this case, the vertical dashed rules seems unnecessary.
+The one without the vertical rules is shown in
+Table~\ref{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}.
+
+\begin{table}[H]
+\renewcommand*{\arraystretch}{1.2}\centering\small
+\begin{tabular}{lrrr}\toprule
+Situation
+	& $T$ (K)
+		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+\midrule
+Dry Ice
+	& $195$
+		& $1.990$
+			& 0.5 \\ \hdashline
+Liquid N$_2$
+	& $77$
+		& $0.356$
+			& 2.8 \\ \hdashline
+Liquid H$_2$
+	& $20$
+		& $0.073$
+			& 13.7 \\ \hdashline
+Liquid He
+	& $4$
+		& $0.0138$
+			& 72.3 \\ \hdashline
+IBM~Q	& $0.015$
+		& $0.000051$
+			& 19,500.0 \\
+\bottomrule
+\end{tabular}
+\caption{Refrigeration Power Consumption}
+\label{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}
+\end{table}
+
 \floatstyle{plain}
 \restylefloat{table}
 \captionsetup[table]{position=bottom,hangindent=0pt}
diff --git a/perfbook.tex b/perfbook.tex
index 3cfc4fd..17f38e8 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -92,6 +92,7 @@

 \usepackage{bm} % for bold math mode fonts --- should be after math mode font choice
 \usepackage{booktabs}
+\usepackage{arydshln}

 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
-- 
2.7.4


