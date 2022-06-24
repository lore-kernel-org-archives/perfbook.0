Return-Path: <SRS0=78J4=W7=qa2.so-net.ne.jp=akys@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qa2.so-net.ne.jp;
	s=sn2021; t=1656080815;
	bh=kzYR9uwQmkwiMi8cfSg3Jt3RFSHufJ3bpjL2rOPaaG4=;
	h=Date:To:Cc:From:Subject;
	b=iwk7XtF75RMkfmOpiJdo7chv4Afw+uyrch8RfXbeadRBGXaLqKNr3iY9xvBcWq19V
	 D6pbilxjPxswKQy+dxrnczOkZ6WDw/+V3lx46pHREDRhqhwrxMxzPQxb2nBSObXhAA
	 lnTGxlwosI/LNRldE7W4qh9o7suOikP+JK7R7ZEzLIvczaBmHxX2Ccz5mQK0OABL07
	 Kw6Enf5ZsnrjQxNPx34uR1nq72WjlKuYVCNrXdB3Mj0e9ZBMSwxlQnGt9bUphhSkF1
	 2uXHzwVBbYM9dSFn6WAxGV2D5jyK/clNKy3lqXcqTNE2/qkb6SsCXnPLjFOkp0lwnr
	 GAkz/9Of8bhCw==
Message-ID: <6957b314-8f59-9671-4adb-37206fc3c693@qa2.so-net.ne.jp>
Date: Fri, 24 Jun 2022 23:26:54 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akys@qa2.so-net.ne.jp>
Subject: [PATCH -perfbook 1/2] defer/whichtochoose: Use parnotes for footnote
 in tabularx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Due to conflict between LaTeX Packages hyperref and tabularx,
both of them attempt to tweak the internal code of \footnote{}
command, normal footnotes don't work in tabularx.

This made Paul use a primitive approach for the footnote added in
commit 1760abb74224 ("defer/whichtochoose: Note possibility of
membarrier() for hazptr").

Alternative way for footnotes inside tabularx is to use the
"parnotes" package, whose implementation is orthogonal to hyperref
and tabularx.

This commit employs this approach and uses the command \parnote in
tabularx, and encloses the footnote-printing \parnotes command in
a minipage to prevent the footnote text from centered.

As hyperref is not aware of parnotes, there is no crossref to the
footnote text.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

I'm not sure if you are happy with the addition of yet another
LaTeX package dependency, but I just wanted to show you this is
possible.  There might be other places where "parnotes" fits.

The trick of minipage for preventing centering should work in
your primitive approach.

It's up to you to take this one or not.

        Thanks, Akira
--
 defer/whichtochoose.tex | 13 +++++++------
 perfbook-lt.tex         |  1 +
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 3c8cc2dccaef..95b355a1c471 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -217,7 +217,9 @@ But those wishing more detail should continue on to the next section.
 	Reader Per-Object Traversal Overhead
 		& Read-modify-write atomic operations, memory\-/barrier
 		  instructions, and cache misses
-			& \tco{smp_mb()} *
+			& \tco{smp_mb()}\parnote[*]{This \co{smp_mb()} can be
+				downgraded to a compiler \co{barrier()} by using
+				the Linux-kernel \co{membarrier()} system call.}
 				& None, but unsafe
 					& None (volatile accesses) \\
 	Reader Forward Progress Guarantee
@@ -253,11 +255,10 @@ But those wishing more detail should continue on to the next section.
 	\bottomrule
 \end{tabularx}
 }
-
-~
-
-* This \co{smp_mb()} can be downgraded to a compiler \co{barrier()} by
-using the Linux-kernel \co{membarrier()} system call.
+\begin{minipage}{\onecolumntextwidth}
+	\vspace*{1ex}
+	\parnotes
+\end{minipage}
 \caption{Which Deferred Technique to Choose?
 					     (Details)}
 \label{tab:defer:Which Deferred Technique to Choose?  (Details)}
diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index d70dde66f725..9cde2e4d42e5 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -75,6 +75,7 @@
 \usepackage[split,makeindex]{splitidx}
 \usepackage[nottoc]{tocbibind}
 \usepackage[columns=3,totoc,indentunit=12pt,justific=raggedright,font=small,columnsep=.15in]{idxlayout}
+\usepackage{parnotes} % for footnotes in tabularx
 \usepackage[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0},linktoc=all]{hyperref}
 \usepackage{footnotebackref} % to enable cross-ref of footnote
 \usepackage[all]{hypcap} % for going to the top of figure and table

base-commit: 1760abb742247869ac06cee18289f0a36d4d973b
-- 
2.25.1

