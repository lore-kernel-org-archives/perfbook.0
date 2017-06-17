Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1NPiKG2kummAWkiCeYUjyr8qfCYNrlinP6YvVc4fjc=;
 b=KdBcK+rENYBQtjb5WhPjs7Q/h+CIIug7ArcMZzyGgRK2e2LwI4uiG2Nf6z+KlQwDLC
 lpYZlYsAXLgisxbnZYd9HA+b9v/LDlebpH+4moaiCABF2Q0EFHlYZ7QWdCDk9mL6rSQL
 iOJ5EIgA/RrIO6sZqJaGLplO6FpMN31ZhraUMjwqnUieR0EiKEAZBJPnvpL6J/g76MtG
 rnRtPt9ZENNA6TXpTCWMRJy1HJw3Zdn9FjAVAc4le6aO064iu0W1ZUp/tZV13n2RPkro
 juSGJ09mcnmGSr2nJwzsgUtNUNfwbl59rKwS5QDr6c2MRUIqGjoJlJAL3b5RUvKXhvAQ
 GxOQ==
Subject: [PATCH 8/8] future/QC: Denote QC operators as such
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <59a0e22b-37a2-86e4-1dfc-9cb08d4c26dd@gmail.com>
Date: Sat, 17 Jun 2017 13:04:33 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e5738e83414b3c3d30d616543bb2f70cbb80bcca Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 15 Jun 2017 07:39:05 +0900
Subject: [PATCH 8/8] future/QC: Denote QC operators as such

QC operators H, S, T, etc. are not necessarily monospace.

Instead of \co{}, use newly defined macro \qop{} for QC operators.
Current definition of \qop{} is {\sffamily #1}, which is
automatically boldified in a description label. Another candidate
of the definition would be {\ttfamily #1} for people who prefer
monospace font.

Dagger symbols need special treatment in description labels.
We need to explicitly boldify them. However, the math mode dagger
symbol does not have its own bold typeface.

We can use \bm{} command defined in "bm" package here.
In this case, it overwrites the symbol multiple times slightly
offset against each other.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 30 +++++++++++++++---------------
 perfbook.tex  |  3 +++
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index fa4084e..a9095cb 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -328,7 +328,7 @@ The basic non-entangling operators supported by IBM's Quantum Experience
 are as follows:

 \begin{description}
-\item[H:]
+\item[\qop{H}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	X-Z axis, that is, about the 45\degree{} line on the
 	X-Z plane.  This rotates $\ket{0}$ to the point at which the
@@ -336,31 +336,31 @@ are as follows:
 	to the point at which the negative X-axis intersects the Bloch
 	sphere.
 	Either way, we get a qubit that is 50\% one and 50\% zero.
-\item[S:]
+\item[\qop{S}\,:]
 	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
-\item[S\textsuperscript{$\dagger$}:]
+\item[\qop{S}$^{\bm{\dagger}}$:]
 	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
-	This operator is the inverse of \co{S}.
-\item[T:]
+	This operator is the inverse of \qop{S}.
+\item[\qop{T}\,:]
 	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
-\item[T\textsuperscript{$\dagger$}:]
+\item[\qop{T}$^{\bm{\dagger}}$:]
 	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
-	This operator is the inverse of \co{T}.
-\item[X:]
+	This operator is the inverse of \qop{T}.
+\item[\qop{X}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	X-axis, which takes $\ket{0}$ to $\ket{1}$ and vice versa.
-\item[Y:]
+\item[\qop{Y}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	Y-axis, which also takes $\ket{0}$ to $\ket{1}$ and vice versa.
-\item[Z:]
+\item[\qop{Z}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	Z-axis, which has no effect on qubits in the $\ket{0}$ or
 	$\ket{1}$ states.
@@ -391,9 +391,9 @@ Thus, one (limited) way to think of a qubit is as a fixed-point number
 ranging between zero and one, inclusive, based on these probabilities
 of collapse.
 Constants may be formed by starting with (say) a $\ket{0}$ qubit and
-applying sequences of \co{H}, \co{S}, and \co{T} operations.
+applying sequences of \qop{H}, \qop{S}, and \qop{T} operations.
 For example, the constant $0.14$ can be formed by applying an
-\co{H}, \co{T}\textsuperscript{$\dagger$}, and another \co{H}
+\qop{H}, \qop{T}$^\dagger$, and another \qop{H}
 operation on a $\ket{0}$ qubit as shown in
 Figure~\ref{fig:future:QC Program as Quantum Experience Score},
 in a manner not entirely unlike constant formation on classic
@@ -417,9 +417,9 @@ However, QC provides a powerful capability covered in the next section.

 \paragraph{Entanglement}

-QC has the \co{CNOT} or \emph{controlled-NOT} operator that
+QC has the \qop{CNOT} or \emph{controlled-NOT} operator that
 \emph{entangles} the pair of qubits operated on.
-Different uses of \co{CNOT} can force the two qubits to have the same
+Different uses of \qop{CNOT} can force the two qubits to have the same
 value, opposite values, or other combinations of values (roughly speaking)
 defined by a Bloch-sphere vector.
 Entanglement can be used to implement constraints
@@ -427,7 +427,7 @@ on the relationships of the entangled variables to each other, which
 could potentially make QC handle large optimization problems very
 efficiently.

-Multiple \co{CNOT} operations can (in theory) entangle arbitrarily
+Multiple \qop{CNOT} operations can (in theory) entangle arbitrarily
 large numbers of qubits, which could replace very large numbers of
 classic-computing data structures representing relationships between
 different entities with entanglement of the qubits
diff --git a/perfbook.tex b/perfbook.tex
index 0b7cff1..ad24285 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -80,6 +80,8 @@
 \renewcommand{\path}[1]{\nolinkurl{#1}} % workaround of interference with mathastext
 }{}

+\usepackage{bm} % for bold math mode fonts --- should be after math mode font choice
+
 \IfLmttForCode{
 \AtBeginEnvironment{verbatim}{\renewcommand{\ttdefault}{lmtt}}
 \AtBeginEnvironment{verbbox}{\renewcommand{\ttdefault}{lmtt}}
@@ -118,6 +120,7 @@
 \newcommand{\tco}[1]{\texttt{\detokenize{#1}}} % for code in tabular environment
 % \tco{} will break at spaces but not at underscores
 \newcommand{\nf}[1]{\textnormal{#1}} % to return to normal font
+\newcommand{\qop}[1]{{\sffamily #1}} % QC operator such as H, T, S, etc.

 \newcommand{\Epigraph}[2]{\epigraphhead[65]{\rmfamily\epigraph{#1}{#2}}}

-- 
2.7.4


