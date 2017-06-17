Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r5urMcl4EavASOSiadroBptZfJvqaW7TPySNj0Zgrtk=;
 b=YabS4ibOp0tIed6GX1Y3FaCu+ta2PxddfxdnUZapZuYkdQGRKzhDYJ9FbKrn0OxbfR
 dAvSUYS2YD0gSVzfSBcY1kKOIGQBHQQQi35GcprXiC2Q1csGqk/mcxSj44ZRyS4iy5J2
 EOrV3TXe+7wzGEokaU/Pg92rNO8zAVlJkHwZSr8Kj3dUsXhp780coB8aOhow9wEFggEm
 8dvNVtuxZkkd2MmnaC+SXx4Dc7iHEPI8VRAkjQ8Na5Y/BNr3gIKXQBW2Xs/XSv0m4eR2
 Ot4IOW9zcx4yS04ENqPI2/T+LL1F8wJ/iTuaZzcssQkxG1y32Pa+WOG+VDMafg9hwwn5
 6QEg==
Subject: [PATCH 7/8] future/QC: Use \ket{} macro for |0> and |1>
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <b9bcf3ae-a086-6d89-d40e-7a982d455563@gmail.com>
Date: Sat, 17 Jun 2017 13:02:30 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 1d0506d2cc0dcfc983a2aedcc011cf9f9cc9be1f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 15 Jun 2017 00:23:16 +0900
Subject: [PATCH 7/8] future/QC: Use \ket{} macro for |0> and |1>

|0> and |1> can be typeset properly by using \ket{} macro of
"braket" package. Note that \ket{} can only be used in math mode.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 28 ++++++++++++++--------------
 perfbook.tex  |  1 +
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 701c086..fa4084e 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -306,9 +306,9 @@ A qubit is said to:
 \begin{enumerate}
 \item	Be represented by a Bloch sphere, as shown in
 	Figure~\ref{fig:future:Qubit as Bloch Sphere}.
-\item	Collapse to a zero (\co{|0>}) or a one (\co{|1>}) if measured,
+\item	Collapse to a zero ($\ket{0}$) or a one ($\ket{1}$) if measured,
 	with probability being a function of the relative distance from
-	\co{|0>} and \co{|1>}, but projected onto the Z-axis.
+	$\ket{0}$ and $\ket{1}$, but projected onto the Z-axis.
 	Thus, a qubit on the equator of the Bloch sphere has a 50\%
 	probability of being measured as a one or as a zero, while
 	a qubit on the 45\textdegree-north latitude would have
@@ -331,39 +331,39 @@ are as follows:
 \item[H:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	X-Z axis, that is, about the 45\degree{} line on the
-	X-Z plane.  This rotates \co{|0>} to the point at which the
-	positive X-axis intersects the Bloch sphere, and rotates \co{|1>}
+	X-Z plane.  This rotates $\ket{0}$ to the point at which the
+	positive X-axis intersects the Bloch sphere, and rotates $\ket{1}$
 	to the point at which the negative X-axis intersects the Bloch
 	sphere.
 	Either way, we get a qubit that is 50\% one and 50\% zero.
 \item[S:]
 	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
-	\co{|0>} or \co{|1>} states.
+	$\ket{0}$ or $\ket{1}$ states.
 \item[S\textsuperscript{$\dagger$}:]
 	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
-	\co{|0>} or \co{|1>} states.
+	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \co{S}.
 \item[T:]
 	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
-	\co{|0>} or \co{|1>} states.
+	$\ket{0}$ or $\ket{1}$ states.
 \item[T\textsuperscript{$\dagger$}:]
 	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
 	Bloch-sphere Z-axis, which has no effect on qubits in the
-	\co{|0>} or \co{|1>} states.
+	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \co{T}.
 \item[X:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	X-axis, which takes \co{|0>} to \co{|1>} and vice versa.
+	X-axis, which takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[Y:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	Y-axis, which also takes \co{|0>} to \co{|1>} and vice versa.
+	Y-axis, which also takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[Z:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	Z-axis, which has no effect on qubits in the \co{|0>} or
-	\co{|1>} states.
+	Z-axis, which has no effect on qubits in the $\ket{0}$ or
+	$\ket{1}$ states.
 \end{description}

 \begin{figure}[tb]
@@ -390,11 +390,11 @@ Similarly, the probability of collapse to one is:
 Thus, one (limited) way to think of a qubit is as a fixed-point number
 ranging between zero and one, inclusive, based on these probabilities
 of collapse.
-Constants may be formed by starting with (say) a \co{|0>} qubit and
+Constants may be formed by starting with (say) a $\ket{0}$ qubit and
 applying sequences of \co{H}, \co{S}, and \co{T} operations.
 For example, the constant $0.14$ can be formed by applying an
 \co{H}, \co{T}\textsuperscript{$\dagger$}, and another \co{H}
-operation on a \co{|0>} qubit as shown in
+operation on a $\ket{0}$ qubit as shown in
 Figure~\ref{fig:future:QC Program as Quantum Experience Score},
 in a manner not entirely unlike constant formation on classic
 computers with small immediate fields.
diff --git a/perfbook.tex b/perfbook.tex
index b4458f2..0b7cff1 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -46,6 +46,7 @@
 \usepackage{epigraph}
 \setlength{\epigraphwidth}{2.6in}
 \usepackage[xspace]{ellipsis}
+\usepackage{braket} % for \ket{} macro in QC section

 % custom packages

-- 
2.7.4


