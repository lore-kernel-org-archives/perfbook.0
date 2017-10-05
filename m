Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=thO0TGVL2G79pfRg42MrXaZgn/41sXsKjgNufYzsSWg=;
 b=TsTppwp9hnrM2ZLU2GFfyaiULJqMsp6APEw2QaQ995ZORciCxm+UgiRXaKLD/wVYoG
 +8U0qzUugsyWdRvUo0mwDCt/bZTbPBH9M/D+1Fyom7lFLDvL2KuXoMeTGsHG0fzKt9oO
 hTwphCBoFanODZ7MZYDfM9CDNA46GhWvl1rxDvg4kNQW+TNVBU2p9yR412QMt+eBlNE0
 I1M7ZAErE4lj7vjqxB7Fs5llQHQAmvyAoI1FbEkHcW8NyUEPuHQd4jmiL6hvADTIhxGH
 MCC+txGpFLojTCpB9ah24mRFwy/TYwU4fThD4ADVKYTeooIDn7kqieXriP1mAfLIgpVT
 tNqw==
Subject: [PATCH 04/10] future/QC: Use non-breakable hyphen for axis names
References: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f581353-2239-b5c0-9887-22132729800f@gmail.com>
Date: Fri, 6 Oct 2017 00:52:32 +0900
MIME-Version: 1.0
In-Reply-To: <d36d262c-2fe4-284c-7818-516a4ad59ec7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 827ccdeef99cec23f937b92720992f38b492e502 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 30 Sep 2017 18:08:03 +0900
Subject: [PATCH 04/10] future/QC: Use non-breakable hyphen for axis names

The short cut "\=/" is provided by the "extdash" package,
as is presented in style guide.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 437a4d4..daf0086 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -308,7 +308,7 @@ A qubit is said to:
 	Figure~\ref{fig:future:Qubit as Bloch Sphere}.
 \item	Collapse to a zero ($\ket{0}$) or a one ($\ket{1}$) if measured,
 	with probability being a function of the relative distance from
-	$\ket{0}$ and $\ket{1}$, but projected onto the Z-axis.
+	$\ket{0}$ and $\ket{1}$, but projected onto the Z\=/axis.
 	Thus, a qubit on the equator of the Bloch sphere has a 50\,\%
 	probability of being measured as a one or as a zero, while
 	a qubit on the 45\textdegree-north latitude would have
@@ -332,37 +332,37 @@ are as follows:
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
 	X-Z axis, that is, about the 45\degree{} line on the
 	X-Z plane.  This rotates $\ket{0}$ to the point at which the
-	positive X-axis intersects the Bloch sphere, and rotates $\ket{1}$
-	to the point at which the negative X-axis intersects the Bloch
+	positive X\=/axis intersects the Bloch sphere, and rotates $\ket{1}$
+	to the point at which the negative X\=/axis intersects the Bloch
 	sphere.
 	Either way, we get a qubit that is 50\,\% one and 50\,\% zero.
 \item[\qop{S}\,:]
 	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
-	Bloch-sphere Z-axis, which has no effect on qubits in the
+	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 \item[\qop{S}$^{\bm{\dagger}}$:]
 	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
-	Bloch-sphere Z-axis, which has no effect on qubits in the
+	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \qop{S}.
 \item[\qop{T}\,:]
 	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
-	Bloch-sphere Z-axis, which has no effect on qubits in the
+	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 \item[\qop{T}$^{\bm{\dagger}}$:]
 	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
-	Bloch-sphere Z-axis, which has no effect on qubits in the
+	Bloch-sphere Z\=/axis, which has no effect on qubits in the
 	$\ket{0}$ or $\ket{1}$ states.
 	This operator is the inverse of \qop{T}.
 \item[\qop{X}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	X-axis, which takes $\ket{0}$ to $\ket{1}$ and vice versa.
+	X\=/axis, which takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[\qop{Y}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	Y-axis, which also takes $\ket{0}$ to $\ket{1}$ and vice versa.
+	Y\=/axis, which also takes $\ket{0}$ to $\ket{1}$ and vice versa.
 \item[\qop{Z}\,:]
 	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
-	Z-axis, which has no effect on qubits in the $\ket{0}$ or
+	Z\=/axis, which has no effect on qubits in the $\ket{0}$ or
 	$\ket{1}$ states.
 \end{description}

-- 
2.7.4


