Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bxtl95cNDSxd+Iu9bKZ98kEElNqG6oH2F40pBFKqCBk=;
 b=tkT82WlqLR+7t1jigk9WHOK8Kot7W137cBDp8ekQgjpOwCTgLceyGtVcYpxccrq2YQ
 t1/2aWPa+dUAxxtzCHfqXnRDW8S1CBDGI1NLu4UUDQ3ocMZ+lUshnzFGc1r0DmhyOyPL
 3N7tqPnP/MXFml74MsR7oyvzXfKCrOapnF0A34q+uUz7TaWmqzo35unFABkN4i34QkZK
 CurKSMc1K6UfgslK8Xf9tJ40EAHVrK32LIHUVkP1jffWCpvyFySUPD19jkEANxt/NI3P
 gXBFcsCB1PHFDGp7F53O7vzJU9ZuclRsxCdOWaZp2Db6lbqakvPDcw5WZ/USIfMKKv/4
 Hmlg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] styleguide: Reflect table format conversion
Message-ID: <e199471f-0d88-8b07-e75c-9611559c599c@gmail.com>
Date: Sun, 29 Oct 2017 09:19:18 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 574dbdaffe6d9243921f4ac4f2cfcb9c3e86ae66 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Oct 2017 09:15:02 +0900
Subject: [PATCH] styleguide: Reflect table format conversion

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 268 ++++++++++++++++++-------------------
 1 file changed, 132 insertions(+), 136 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 024270c..11f539b 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -733,6 +733,105 @@ As you can see, extra space is placed before the comma.

 The \verb|\ldots| macro behaves the same as the \verb|\dots| macro.

+\subsection{Floating Object Format}
+\label{sec:app:styleguide:Floating Object Format}
+
+\subsubsection{Ruled Line in Table}
+\label{sec:app:styleguide:Ruled Line in Table}
+
+They say that tables drawn by using ruled lines of plain \LaTeX\
+look ugly.\footnote{
+  \url{https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf}
+}
+Vertical lines should be avoided and horizontal lines should be
+used sparingly, especially in tables of simple structure.
+
+\IfTblCpTop{}{
+\floatstyle{plaintop}
+\restylefloat{table}
+\setlength{\abovetopsep}{-2pt}
+\addtolength{\abovecaptionskip}{-2.5pt}
+}
+
+Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
+(corresponding to
+Table~\ref{tab:future:Refrigeration Power Consumption})
+is drawn by using the features of ``booktabs'' and ``xcolor'' packages.
+Note that ruled lines of booktabs can not be mixed with
+vertical lines in a table.\footnote{
+  There is another package named ``arydshln'' which provides dashed lines
+  to be used in tables. A couple of experimental examples are presented in
+  Section~\ref{sec:app:styleguide:Table Layout Experiment}.
+}
+
+\begin{table}[tbhp]
+\rowcolors{1}{}{lightgray}
+\renewcommand*{\arraystretch}{1.2}\centering\small
+\begin{tabular}{lrrr}\toprule
+Situation
+	& $T$ (K)
+		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+\midrule
+Dry Ice
+	& $195$
+		& $1.990$
+			& 0.5 \\
+Liquid N$_2$
+	& $77$
+		& $0.356$
+			& 2.8 \\
+Liquid H$_2$
+	& $20$
+		& $0.073$
+			& 13.7 \\
+Liquid He
+	& $4$
+		& $0.0138$
+			& 72.3 \\
+IBM~Q	& $0.015$
+		& $0.000051$
+			& 19,500.0 \\
+\bottomrule
+\end{tabular}
+\caption{Refrigeration Power Consumption}
+\label{tab:app:styleguide:Refrigeration Power Consumption}
+\end{table}
+
+Most tables in the text have been converted to this format.
+Tables~\ref{tab:future:Comparison of Locking and HTM}
+and~\ref{tab:future:Comparison of Locking (Augmented by RCU or Hazard Pointers) and HTM}
+are the exceptions. They are complex and require an alternative
+approach.\footnote{Any suggestion is welcome!!!}
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
+As for tables, the position of caption is tweaked by
+\verb|\floatstyle{}| and \verb|\restylefloat{}| macros
+in preamble.
+
+Vertical skips below captions are reduced by setting a smaller
+value to the \verb|\abovecaptionskip| variable,
+which would also affect captions to figures.
+
+In the tables which use horizontal rules of ``booktabs'' package,
+the vertical skips between captions and tables are further reduced
+by setting a negative value to the \co{\\abovetopsep} variable,
+which controls the behavior of \co{\\toprule}.
+
 \subsection{Improvement Candidates}
 \label{sec:app:styleguide:Improvement Candidates}

@@ -750,9 +849,6 @@ The \verb|\ldots| macro behaves the same as the \verb|\dots| macro.
 \end{minipage}
 \end{figure*}

-\floatstyle{ruled}
-\restylefloat{listing}
-
 \begin{listing*}[tbh]%
 \caption{Message-Passing Litmus Test (by subfig)}%
 \label{lst:app:styleguide:Message-Passing Litmus Test (subfig)}%
@@ -829,38 +925,7 @@ exists (1:r2=2 /\ 1:r3=0)

 There are a few areas yet to be attempted in perfbook
 which would further improve its appearance.
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
-In the sample tables shown in
-Sections~\ref{sec:app:styleguide:Ruled Line in Table}
-and~\ref{sec:app:styleguide:Table Layout Experiment},
-vertical skips below captions are reduced by setting a smaller
-value to the \verb|\abovecaptionskip| variable,
-which would also affect captions to figures.\footnote{
-  The skip below table captions in these sections is further
-  reduced by setting a negative value to the \co{\\abovetopsep}
-  variable of the ``booktabs'' package which controls the behavior
-  of \co{\\toprule}.}
+This section lists such candidates.

 \subsubsection{Grouping Related Figures/Listings}
 \label{sec:app:styleguide:Grouping Related Figures/Listings}
@@ -909,75 +974,14 @@ subfloats.
 Otherwise, the resulting caption number would be off by one
 from the actual number.

-\subsubsection{Ruled Line in Table}
-\label{sec:app:styleguide:Ruled Line in Table}
-
-They say that tables drawn by using ruled lines of plain \LaTeX\
-look ugly.\footnote{
-  \url{https://www.inf.ethz.ch/personal/markusp/teaching/guides/guide-tables.pdf}
-}
-Vertical lines should be avoided and horizontal lines should be
-used sparingly, especially in tables of simple structure.
-
-\IfTblCpTop{}{
-\floatstyle{plaintop}
-\restylefloat{table}
-\setlength{\abovetopsep}{-2pt}
-\addtolength{\abovecaptionskip}{-2.5pt}
-}
-
-For example,
-Table~\ref{tab:future:Refrigeration Power Consumption}
-can be tweaked as shown in
-Table~\ref{tab:app:styleguide:Refrigeration Power Consumption}
-with the help of ``booktabs'' and ``xcolor'' packages.
-
-\begin{table}[tbhp]
-\rowcolors{1}{}{lightgray}
-\renewcommand*{\arraystretch}{1.2}\centering\small
-\begin{tabular}{lrrr}\toprule
-Situation
-	& $T$ (K)
-		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
-\midrule
-Dry Ice
-	& $195$
-		& $1.990$
-			& 0.5 \\
-Liquid N$_2$
-	& $77$
-		& $0.356$
-			& 2.8 \\
-Liquid H$_2$
-	& $20$
-		& $0.073$
-			& 13.7 \\
-Liquid He
-	& $4$
-		& $0.0138$
-			& 72.3 \\
-IBM~Q	& $0.015$
-		& $0.000051$
-			& 19,500.0 \\
-\bottomrule
-\end{tabular}
-\caption{Refrigeration Power Consumption}
-\label{tab:app:styleguide:Refrigeration Power Consumption}
-\end{table}
-
-Note that ruled lines of booktabs can not be mixed with
-vertical lines in a table.\footnote{
-  There is another package named ``arydshln'' which provides dashed lines
-  to be used in tables. A couple of experimental examples are presented in
-  Section~\ref{sec:app:styleguide:Table Layout Experiment}.
-}
-
 \subsubsection{Table Layout Experiment}
 \label{sec:app:styleguide:Table Layout Experiment}

-To see how far we can go without vertical rules in tables,
-several experiments using booktabs, xcolors, and arydshln packages
-are presented in this section.
+This section presents some experimental tables
+using booktabs, xcolors, and arydshln packages.
+The corresponding tables in the text have been converted using one of
+the format shown here. The source of this section can be regarded
+as a reference to be consulted when new tables are added in the text.

 \begin{table}[tb]
 \rowcolors{1}{}{lightgray}
@@ -1007,25 +1011,26 @@ are presented in this section.
 \label{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
 \end{table}

-Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}
-can be tweaked as is shown in
-Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System} using booktabs and xcolors.
-In this table, original tabular source contains tweaks with
-\verb|\textcolor{}| commands. They are removed by using ``S'' column
-specifiers provided by the ``siunitx'' package.
+In
+Table~\ref{tab:app:styleguide:Performance of Synchronization Mechanisms of 4-CPU 1.8GHz AMD Opteron 844 System}
+(corresponding to
+Table~\ref{tab:cpu:Performance of Synchronization Mechanisms on 4-CPU 1.8GHz AMD Opteron 844 System}),
+the ``S'' column specifiers provided
+by the ``siunitx'' package are used to align numbers.

 Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
-is a tweaked version of
-Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms},
-which has more complex header than the tables experimented so far.
-
+(corresponding to
+Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms})
+is an example of table with a complex header.
 In
 Table~\ref{tab:app:styleguide:Reference Counting and Synchronization Mechanisms},
 the gap in the mid-rule corresponds to the distinction
-which is represented by double vertical rules in
-Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}.
-The legends in the frame box explain the abbreviations used in the matrix.
-Two types of memory barrier are denoted by subscripts here.
+which had been represented by double vertical rules before the conversion.
+The legends in the frame box appended here explain the abbreviations used
+in the matrix. Two types of memory barrier are denoted by subscripts here.
+The legends and subscripts are not present in
+Table~\ref{tab:together:Reference Counting and Synchronization Mechanisms}
+since they are redundant there.

 \begin{table}[tb]
 \small
@@ -1062,12 +1067,10 @@ Two types of memory barrier are denoted by subscripts here.
 \label{tab:app:styleguide:Reference Counting and Synchronization Mechanisms}
 \end{table}

-Table~\ref{tab:app:whymb:Cache Coherence Example}
-can be tweaked as in
 Table~\ref{tab:app:styleguide:Cache Coherence Example}
-in a similar manner.
-It is not a ``table'' in the narrow sense, rather a sequence diagram.
-A ``figure'' environment might be a proper choice here.
+(corresponding to
+Table~\ref{tab:app:whymb:Cache Coherence Example})
+is a sequence diagram drawn as a table.

 \begin{table*}[tbh]
 \small
@@ -1117,12 +1120,15 @@ just below the mid-rules. This change makes it easier for
 properly.

 Table~\ref{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
-is another example which keeps original columns and colors rows only where
+is another version which keeps original columns and colors rows only where
 a category has multiple rows. This is done by combining \verb|\rowcolors{}|
 of ``xcolor'' and \verb|\cellcolor{}| commands of the ``colortbl''
 package (\verb|\cellcolor{}| overrides \verb|\rowcolors{}|).

-For consistent looks, the latter layout might be our choice.
+In
+Table~\ref{tab:defer:RCU Publish-Subscribe and Version Maintenance APIs},
+the latter layout without partial row coloring has been
+chosen for simplicity.

 \begin{table*}[tbh]
 \rowcolors{2}{}{blue!15}
@@ -1272,10 +1278,10 @@ Pointer update &
 \label{tab:app:styleguide:RCU Publish-Subscribe and Version Maintenance APIs (colortbl)}
 \end{table*}

-Table~\ref{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events}
-can be tweaked as shown in
-Table~\ref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}.
-It is also a sequence diagram drawn as a tabular object.
+Table~\ref{tab:app:styleguide:Memory Misordering: Store-Buffering Sequence of Events}
+(corresponding to
+Table~\ref{tab:memorder:Memory Misordering: Store-Buffering Sequence of Events})
+is also a sequence diagram drawn as a tabular object.

 \begin{table*}[tbh]
 \rowcolors{6}{}{lightgray}
@@ -1381,11 +1387,6 @@ IBM~Q	& $0.015$
 \label{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}
 \end{table}

-Tables in Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}
-have been recently converted to the scheme presented in this section.
-Refer to \path{memorder/memorder.tex}
-for examples of tables with complex headings.
-
 \IfTblCpTop{}{
 \floatstyle{plain}
 \restylefloat{table}
@@ -1399,11 +1400,6 @@ for examples of tables with complex headings.
 Other improvement candidates are listed in the source of this
 section as comments.

-% Trademarks:
-%    As the Legal page covers trademarks, there is no need to
-%    use trademark symbol in the text. They seems to have been
-%    imported from original publications.
-%
 % Ugly line break by \co{}
 %                                 __
 %        atomic_store()
-- 
2.7.4

