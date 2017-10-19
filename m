Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=ww2sf9v0/rcGfYnL7UdVvuinS5RMWFl3+LW8lBYLLRY=;
 b=a0vo9h0cVEBYZpL9w1byLhxevS4ayM7/lZK9aH4GV2PbcyzVkby9S5QzTkEsOp7s3r
 Milep54sgyDm8HvO6kAm0k6PHl1OSgabGklbrZRr4cxMLBfH0El7MyQOq5d5CpbISrrT
 VzmO1VZ5NCIZ+r80zq/iEK36sm91FrN/ciGRtg3MtSxgO46FmdiAXMpqIolv4pOMXuFn
 gg2udZXK3l9v4BXE5bOleUkHGOJBs8zrxM6L1bXXI1gaBUsMH6QdxzbR1+ivU7lEJDhs
 19tJN7Nfmj1lthUG309d3EZH3+4Zhh+KmaQ3+Iy9LJGQIADZD6EVNTXUnGiwzEdywWWQ
 4WPw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] styleguide: Reflect recent conversion of code snippets to
 listing
Message-ID: <976bbd70-e58c-7b10-1339-87167b5f79ae@gmail.com>
Date: Fri, 20 Oct 2017 07:46:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From cf16d20dff9bf4cf2832c1fdd1fe00b39c4836fd Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 20 Oct 2017 07:16:48 +0900
Subject: [PATCH] styleguide: Reflect recent conversion of code snippets to listing

Also use a different approach to reduce skips of table captions.
By setting a smaller value to \abovecaptionskip, captions of tables
and figures can be made closer to the body regardless of their
positions and avoid ambiguity of them to look like captions
to other nearby tables/figures.

In the experimental tables, a negative value is still set
to \abovetopsep to further reduce the skips.

As options of \captionsetup{} related to vertical spacing are
ignored in captions controlled by the "float" package, remove them.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/styleguide/styleguide.tex | 39 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index 22fe537..9e7d846 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -374,7 +374,6 @@ the code snippet is coded as a ``figure'' object.
 Line numbers are manually placed for ease of referencing them within
 \LaTeX\ sources.

-This is how most code snippets are coded as of this writing.
 However, strictly speaking, code snippets are \emph{not} figures
 and they deserve their own floating environment.
 The ``float'' package provides the feature to define additional
@@ -387,7 +386,11 @@ Transition to the auto-numbering scheme of verbbox and
 the ``listing'' environment defined for code snippets
 has recently started in
 Chapter~\ref{chp:Advanced Synchronization: Memory Ordering}.
-The transition also permits us to choose distinct looks
+In other chapters, code snippets have been converted to the
+``listing'' environments without auto-numbering.
+Auto-numbering can be enabled when the renumbering of line
+numbers becomes necessary.
+The transition has allowed us to choose distinct looks
 for code snippets, including moving captions to top of the
 listings
 (discussed in Section~\ref{sec:app:styleguide:Position of Caption}).
@@ -397,7 +400,7 @@ the \verb|\LstLineNo| macro specified in the option to verbbox
 (line~3 in
 Listing~\ref{lst:app:styleguide:LaTeX Source of Sample Code Snippet (Current)}).
 The macro is defined in the preamble of \path{perfbook.tex}
-as the following:
+as follows:

 \noindent\begin{minipage}{\columnwidth}
 { \scriptsize
@@ -844,22 +847,16 @@ As for tables, the position of caption can be tweaked by
 \verb|\floatstyle{}| and \verb|\restylefloat{}| macros
 in preamble.

-Currently, as most code snippets are figures with their captions
-at the bottom, captions of tables at the top might look inconsistent.
-Once the transition of code snippets to listing environment
-completes, there would be fewer figures and the caption of tables
-at the top would hopefully be acceptable.
-
-Vertical space between captions at the top and the table bodies
-can be reduced by the help of ``ctable'' package.
-
 In the sample tables shown in
 Sections~\ref{sec:app:styleguide:Ruled Line in Table}
 and~\ref{sec:app:styleguide:Table Layout Experiment},
-the vertical skip is manually reduced by setting a negative value to the
-\verb|\abovetopsep| variable which controls the behavior of
-\verb|\toprule| of the ``booktabs'' package.
-It should be regarded as a band-aid tweak.
+vertical skips below captions are reduced by setting a smaller
+value to the \verb|\abovecaptionskip| variable,
+which would also affect captions to figures.\footnote{
+  The skip below table captions in these sections is further
+  reduced by setting a negative value to the \co{\\abovetopsep}
+  variable of the ``booktabs'' package which controls the behavior
+  of \co{\\toprule}.}

 \subsubsection{Grouping Related Figures/Listings}
 \label{sec:app:styleguide:Grouping Related Figures/Listings}
@@ -920,8 +917,9 @@ used sparingly, especially in tables of simple structure.

 \floatstyle{plaintop}
 \restylefloat{table}
-\captionsetup[table]{position=top,hangindent=30pt}
-\renewcommand*{\abovetopsep}{-7pt}
+\captionsetup[table]{hangindent=30pt}
+\setlength{\abovetopsep}{-2pt}
+\addtolength{\abovecaptionskip}{-2.5pt}

 For example,
 Table~\ref{tab:future:Refrigeration Power Consumption}
@@ -1385,8 +1383,9 @@ for examples of tables with complex headings.

 \floatstyle{plain}
 \restylefloat{table}
-\captionsetup[table]{position=bottom,hangindent=0pt}
-\renewcommand*{\abovetopsep}{0pt}
+\captionsetup[table]{hangindent=0pt}
+\addtolength{\abovecaptionskip}{2.5pt}
+\setlength{\abovetopsep}{0pt}

 \subsubsection{Miscellaneous Candidates}
 \label{sec:app:styleguide:Miscellaneous Candidates}
-- 
2.7.4

