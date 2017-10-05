Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l4O2WSbTj5vypdAZeRg/qwokZkb1bD1nPsk25V7HMq4=;
 b=bMUJrILIeJsiJVwli7rUc+1A6v7RkG8/Q6Fy//lwLxEBPoJrOy0QuvwnI1DE28mqdU
 TbAGuYUK++TJBoTJGtb1TDilguQ1ymEreubTJ2JMaQzPeoaFYZaR2qPHq+bS6hSt8Vgd
 AG+VZ8an45nyNH7crmd9UIQ/u35kxLT4FV+VOmf+oDEAIN43uNq7L+W9FVn2R+hiB61x
 iSmoHfHIqnRaxizB/xwsCM7WbYirXGDsUSihflETzduX6CMnLWzi1oPe8bT2Ku8aF+U+
 ApcfUrQzCpPopSyPhrXJQDK9retluhmun3m45j3vUwB1A+GTtRzYlSWpy9Vx3hYNgMap
 wjpw==
Subject: [PATCH 09/10] future/QC: Use upright glyph for math constant and
 descriptive suffix
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <2e5018f2-5284-99c1-9953-0ec06409a369@gmail.com>
Date: Fri, 6 Oct 2017 00:59:05 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 22146e245ef551489d65834ac4f766176f53bfaf Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Sep 2017 20:22:13 +0900
Subject: [PATCH 09/10] future/QC: Use upright glyph for math constant and descriptive suffix

To have access to a larger set of Greek glyphs and improved math mode
typesetting, substitute "newtxtext" and "newtxmath" packages for
the "mathptmx" package.

Uppercase Greek letters are now slanted by default.

To specify upright Greek letters, you can use commands such as
"\upDelta" and "\uppi" provided by the newtxmath package. In QC.tex,
"pi" is used to represent the circular constant and "Delta" is used to
represent the difference operator. In these cases upright glyphs should be
used.

In NIST style guide, descriptive suffixes are also recommended to be
upright. To avoid repetitive use of \mathrm{} command, macros "\TLo",
"\THi", and "\CPf" are defined locally in QC.tex.

Also use mathcal font for Big O.[1]

NOTE 1: For target "1csf", we now use the "newtxsf" package, which
also provides a larger set of Greek glyphs. However, it is not available
on TeX Live 2013/Debian. Furthermore, it uses a different upright font in
math mode than in text mode. You can distinguish math mode figures from
text mode figures in this target, but the difference looks acceptable.
The font choice for this target can be changed should a better font
combination be found.

NOTE 2: On TeX Live 2013/Debian, newtxmath has a few spacing issues.
They are fixed on TeX Live 2015/Debian, which is available on
Ubuntu Xenial. Both newtxtext and newtxmath are actively updated.
See https://www.ctan.org/pkg/newtx.

[1]: https://texblog.org/2014/06/24/big-o-and-related-notations-in-latex/

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 FAQ-BUILD.txt                      |  4 +--
 Makefile                           |  2 +-
 appendix/styleguide/styleguide.tex |  6 ++--
 future/QC.tex                      | 62 ++++++++++++++++++++------------------
 perfbook.tex                       | 12 +++++---
 5 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
index 1fa581d..e277d95 100644
--- a/FAQ-BUILD.txt
+++ b/FAQ-BUILD.txt
@@ -114,9 +114,9 @@
 		directory.

 		Following is a list of links to optional packages as of
-		March 2017:
+		October 2017:

 			https://www.ctan.org/pkg/newtxtt
 			https://www.ctan.org/pkg/nimbus15
 			https://www.ctan.org/pkg/inconsolata
-			https://www.ctan.org/pkg/mathastext
+			https://www.ctan.org/pkg/newtxsf
diff --git a/Makefile b/Makefile
index 8799313..d8d23c7 100644
--- a/Makefile
+++ b/Makefile
@@ -134,7 +134,7 @@ perfbook-msnt.tex: perfbook.tex
 perfbook-1csf.tex: perfbook-1c.tex
 	sed -e 's/setboolean{sansserif}{false}/setboolean{sansserif}{true}/' \
 	    -e 's/%msfontstub/\\usepackage[var0]{inconsolata}[2013\/07\/17]/' < $< > $@
-	@echo "## This target requires recent version (>= 1.3i) of mathastext. ##"
+	@echo "## This target requires math font package newtxsf. ##"

 # Rules related to perfbook_html are removed as of May, 2016

diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
index bb100a9..bec700c 100644
--- a/appendix/styleguide/styleguide.tex
+++ b/appendix/styleguide/styleguide.tex
@@ -940,7 +940,7 @@ with the help of ``booktabs'' and ``xcolor'' packages.
 \begin{tabular}{lrrr}\toprule
 Situation
 	& $T$ (K)
-		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
 \midrule
 Dry Ice
 	& $195$
@@ -1320,7 +1320,7 @@ with dashed horizontal and vertical rules of the arydshln package.
 \begin{tabular}{l:r:r:r}\toprule
 Situation
 	& $T$ (K)
-		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
 \hline
 Dry Ice
 	& $195$
@@ -1356,7 +1356,7 @@ Table~\ref{tab:app:styleguide:Refrigeration Power Consumption (arydshln-2)}.
 \begin{tabular}{lrrr}\toprule
 Situation
 	& $T$ (K)
-		& $C_P$	& \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
+		& $\CPf$ & \parbox[b]{.75in}{\raggedleft Power per watt\par waste heat (W)} \\
 \midrule
 Dry Ice
 	& $195$
diff --git a/future/QC.tex b/future/QC.tex
index daf0086..349c4ed 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -329,7 +329,7 @@ are as follows:

 \begin{description}
 \item[\qop{H}\,:]
-	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Rotate 180\degree{} ($\uppi$ radians) about the Bloch-sphere
 	X-Z axis, that is, about the 45\degree{} line on the
 	X-Z plane.  This rotates $\ket{0}$ to the point at which the
 	positive X\=/axis intersects the Bloch sphere, and rotates $\ket{1}$
@@ -337,31 +337,31 @@ are as follows:
 	sphere.
 	Either way, we get a qubit that is 50\,\% one and 50\,\% zero.
 \item[\qop{S}\,:]
-	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
+	Rotate 90\degree{} ($\frac{\uppi}{2}$ radians) about the
 	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 \item[\qop{S}$^{\bm{\dagger}}$:]
-	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
+	Rotate $-90\degree$ ($-\frac{\uppi}{2}$ radians) about the
 	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \qop{S}.
 \item[\qop{T}\,:]
-	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
+	Rotate 45\degree{} ($\frac{\uppi}{4}$ radians) about the
 	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 \item[\qop{T}$^{\bm{\dagger}}$:]
-	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
+	Rotate $-45\degree$ ($-\frac{\uppi}{4}$ radians) about the
 	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \qop{T}.
 \item[\qop{X}\,:]
-	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Rotate 180\degree{} ($\uppi$ radians) about the Bloch-sphere
 	X\=/axis, which takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[\qop{Y}\,:]
-	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Rotate 180\degree{} ($\uppi$ radians) about the Bloch-sphere
 	Y\=/axis, which also takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[\qop{Z}\,:]
-	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Rotate 180\degree{} ($\uppi$ radians) about the Bloch-sphere
 	Z\=/axis, which has no effect on qubits in the $\ket{0}$ or
 	$\ket{1}$ states.
 \end{description}
@@ -606,11 +606,11 @@ However, because of its thermodynamic reversibiltiy,
 QC is governed by an even lower limit:

 \begin{equation}
-	\Delta E \geq \frac{\hbar}{2 \Delta t}
+	\upDelta E \geq \frac{\hbar}{2 \upDelta t}
 \end{equation}

-Here $\Delta E$ is the energy required to change the qubit in Joules,
-$\Delta t$ is the time taken to change the qubit in seconds, and
+Here $\upDelta E$ is the energy required to change the qubit in Joules,
+$\upDelta t$ is the time taken to change the qubit in seconds, and
 $\hbar$ is Planck's constant, which is $6.62 \times 10^{-34}$\,J$\cdot$s.
 For the 50-nanosecond switching times of IBM's Quantum Experience
 hardware, this limit is $5.52 \times 10^{-27}$\,J, more than an order
@@ -631,12 +631,16 @@ program.
 Unfortunately, it is not just the amount of heat generated that is
 important, but also the temperature at which this heat is generated.

+\newcommand{\TLo}{T_\mathrm{L}}
+\newcommand{\THi}{T_\mathrm{H}}
+\newcommand{\CPf}{C_\mathrm{P}}
+
 The thermodynamic theoretical limit on the ability of a refrigerator
-to transport heat from a low temperature ($T_L$) to a high temperature
-($T_H$) is given by the coefficient of performance ($C_P$):
+to transport heat from a low temperature ($\TLo$) to a high temperature
+($\THi$) is given by the coefficient of performance ($\CPf$):

 \begin{equation}
-	C_P = \frac{T_L}{T_H - T_L}
+	\CPf = \frac{\TLo}{\THi - \TLo}
 \end{equation}

 \begin{table}
@@ -664,9 +668,9 @@ fancifully illustrated in
 Table~\ref{tab:future:The Three Laws of Thermodynamics}.

 The nominal temperature for IBM~Q is 15~millikelvins, which certainly
-qualifies as a low $T_L$.
-Let's assume $T_H$ is 293\,K (room temperature),
-in which case $C_P$ is $0.000051$.
+qualifies as a low $\TLo$.
+Let's assume $\THi$ is 293\,K (room temperature),
+in which case $\CPf$ is $0.000051$.
 This in turn means that it requires \emph{at least} one watt of
 power into the refrigeration unit to transport $0.000051$~watts
 of waste heat from the 15~millikelvin IBM~Q out to room temperature.
@@ -692,7 +696,7 @@ at low temperatures.\footnote{
 	&	&	& Power per watt \\
 Situation
 	& $T$ (K)
-		& $C_P$	& waste heat (W) \\
+		& $\CPf$ & waste heat (W) \\
 \hline
 \hline
 Dry Ice
@@ -996,27 +1000,27 @@ it to be not too early to start thinking in terms of replacing RSA.
 \label{sec:future:Grover's Search Algorithm}

 Grover's algorithm searches an unordered list of $N$ items
-in $O(\sqrt N)$ time.
+in $\O{\sqrt N}$ time.
 This is mainly intended for implicit search for solutions as opposed
 to searching through data.
 To see why, keep in mind that before any data can be searched,
 that data list must be downloaded into the QC system, and that
-this download will have computational complexity $O(n)$, where
+this download will have computational complexity $\O{n}$, where
 $n$ is the number of data items.
 The competing classical system can use this time to sort the data
 or to construct any desired index over the data, and the computational
-complexity of these operations can be considered to be $O(n \log_2 n)$,
+complexity of these operations can be considered to be $\O{n \log_2 n}$,
 after which the classical
-system can carry out the search in $O(\log N)$ time, which
-is much faster than the $O(\sqrt N)$ time promised by
+system can carry out the search in $\O{\log N}$ time, which
+is much faster than the $\O{\sqrt N}$ time promised by
 Grover's algorithm.

 \QuickQuiz{}
-	What do you mean $O(n)$ for classic-computing sorting/indexing
-	and $O(n \log_2 n)$ for classic-computing search?
-	Hash tables do $O(n)$ and $O(1)$ respectively!!!
+	What do you mean $\O{n}$ for classic-computing sorting/indexing
+	and $\O{n \log_2 n}$ for classic-computing search?
+	Hash tables do $\O{n}$ and $\O{1}$ respectively!!!
 \QuickQuizAnswer{
-	Fixed-size hash table lookups are $O(n)$, not $O(1)$.
+	Fixed-size hash table lookups are $\O{n}$, not $\O{1}$.
 	And for a resizing hash table, fairness dictates that the overhead
 	of resizing be properly accounted for.

@@ -1049,7 +1053,7 @@ computing:

 Of course, one can pick $n$ and $m$ to favor either approach.
 It makes little sense to choose small $m$ because the winner of that
-race is a simple $O(n)$ sequential scan.
+race is a simple $\O{n}$ sequential scan.
 More interesting scenarios use larger values of $m$.

 The first scenario looks at
@@ -1185,7 +1189,7 @@ That said, this analysis has some limitations:
 \item	Explicit lists are assumed.
 	Implicit lists might well favor quantum computing.
 \item	Traditional sorting and indexing is assumed to result in
-	the traditional $O(\log N)$ computational complexity for
+	the traditional $\O{\log N}$ computational complexity for
 	classic-computing search.
 \item	Quantum computing is assumed to be capable of handling
 	very large data sets.
diff --git a/perfbook.tex b/perfbook.tex
index 906d71b..f36b7ca 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -7,9 +7,9 @@
 % A more pleasant font
 \usepackage{lmodern}
 \usepackage[T1]{fontenc} % use postscript type 1 fonts
+\usepackage[defaultsups]{newtxtext} % use nice, standard fonts for roman
 \usepackage{textcomp} % use symbols in TS1 encoding
-\usepackage{mathptmx} % use nice, standard fonts for roman
-\usepackage[scaled=.92]{helvet} % and sans serif
+\renewcommand*\ttdefault{lmtt}
 %msfontstub

 % Improves the text layout
@@ -85,9 +85,10 @@
 \IfSansSerif{
 \renewcommand{\familydefault}{\sfdefault}
 \normalfont
-\usepackage[italic]{mathastext}[2016/01/06]
-\renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
-}{}
+\usepackage[slantedGreek,scaled=.96]{newtxsf}
+}{
+\usepackage[slantedGreek]{newtxmath} % math package to be used with newtxtext
+}

 \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}

@@ -138,6 +139,7 @@
 \newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.

 \DeclareRobustCommand{\euler}{\ensuremath{\mathrm{e}}}
+\DeclareRobustCommand{\O}[1]{\ensuremath{\mathcal{O}(#1)}}
 \newcommand{\Power}[1]{POWER#1}
 \newcommand{\GNUC}{GNU~C}
 \newcommand{\GCC}{GCC}
-- 
2.7.4


