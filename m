Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32805 "EHLO
 mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750708AbdFQEAl (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 17
 Jun 2017 00:00:41 -0400
Received: by mail-pg0-f68.google.com with SMTP id u62so3129638pgb.0 for
 <perfbook@vger.kernel.org>; Fri, 16 Jun 2017 21:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FXdihpGSjOlTtgH+C7ip7d5bh15G1jAVOX1oZeTBwaU=;
 b=ugIw5fKUcs7ygp52YePiE1Bvc13Zw8pYO8g+g2pr+AojBzeUKH59dfd4lkyszuA+ZT
 ZVq8xSGZRFMnmwL9uerW9xt5ZA6henSany85fVrWxMQJqDWpQWMAy456ZbuWmV5jHaBa
 QDEfYFE5sRuMP7yWbn1opmNGi+3rRITS96ELstmA3bzTQiHn8xUGjKAUAcsjyKXK6dxB
 uFTvMyc7ZMS4UTVFT1wlxcj/LlTaSaXOr2RnjKN/V/xP6zP2/bGjA9R5SxJE70jxOMKg
 iWxPUMa6mKMWsS9BLG6mVgPS9VcEYcNdlM4bPulDypUDlHD1Pkqv09GSEH2+e3CHwGgT
 ufPA==
Subject: [PATCH 5/8] future/QC: Use consistent axis names
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <530756ff-82e4-9eb4-2432-f477c6472149@gmail.com>
Date: Sat, 17 Jun 2017 13:00:38 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

From 3dc3bf3eddf4e368aa6fec38dab13798b9471638 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 2 Jun 2017 00:08:55 +0900
Subject: [PATCH 5/8] future/QC: Use consistent axis names

Consistently use the names of "X-axis", "Y-axis", and "Z-axis" in
these lists.
Also properly use math mode minus signs for minus degrees.

By employing "gensymb" package, we can use \degree macro instead
of \textdegree. As \degree can be used in both text and math modes,
we can simplify things.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 38 +++++++++++++++++++-------------------
 perfbook.tex  |  1 +
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index feb7851..cbcbef3 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -308,7 +308,7 @@ A qubit is said to:
 	Figure~\ref{fig:future:Qubit as Bloch Sphere}.
 \item	Collapse to a zero (\co{|0>}) or a one (\co{|1>}) if measured,
 	with probability being a function of the relative distance from
-	\co{|0>} and \co{|1>}, but projected onto the z-axis.
+	\co{|0>} and \co{|1>}, but projected onto the Z-axis.
 	Thus, a qubit on the equator of the Bloch sphere has a 50\%
 	probability of being measured as a one or as a zero, while
 	a qubit on the 45\textdegree-north latitude would have
@@ -329,40 +329,40 @@ are as follows:

 \begin{description}
 \item[H:]
-	Rotate 180{\textdegree} ($\pi$ radians) about the Bloch-sphere
-	X-Z axis, that is, about the {45\textdegree} line on the
+	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	X-Z axis, that is, about the 45\degree{} line on the
 	X-Z plane.  This rotates \co{|0>} to the point at which the
-	positive x-axis intersects the Bloch sphere, and rotates \co{|1>}
-	to the point at which the negative x-axis intersects the Bloch
+	positive X-axis intersects the Bloch sphere, and rotates \co{|1>}
+	to the point at which the negative X-axis intersects the Bloch
 	sphere.
 	Either way, we get a qubit that is 50\% one and 50\% zero.
 \item[S:]
-	Rotate {90\textdegree} ($\frac{\pi}{2}$ radians) about the
-	Bloch-sphere \co{Z} axis, which no effect on qubits in the
+	Rotate 90\degree{} ($\frac{\pi}{2}$ radians) about the
+	Bloch-sphere Z-axis, which no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 \item[S\textsuperscript{$\dagger$}:]
-	Rotate {-90\textdegree} ($-\frac{\pi}{2}$ radians) about the
-	Bloch-sphere \co{Z} axis, which no effect on qubits in the
+	Rotate $-90\degree$ ($-\frac{\pi}{2}$ radians) about the
+	Bloch-sphere Z-axis, which no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 	This operator is the inverse of \co{S}.
 \item[T:]
-	Rotate {45\textdegree} ($\frac{\pi}{4}$ radians) about the
-	Bloch-sphere \co{Z} axis, which no effect on qubits in the
+	Rotate 45\degree{} ($\frac{\pi}{4}$ radians) about the
+	Bloch-sphere Z-axis, which no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 \item[T\textsuperscript{$\dagger$}:]
-	Rotate {-45\textdegree} ($-\frac{\pi}{4}$ radians) about the
-	Bloch-sphere \co{Z} axis, which no effect on qubits in the
+	Rotate $-45\degree$ ($-\frac{\pi}{4}$ radians) about the
+	Bloch-sphere Z-axis, which no effect on qubits in the
 	\co{|0>} or \co{|1>} states.
 	This operator is the inverse of \co{T}.
 \item[X:]
-	Rotate {180\textdegree} ($\pi$ radians) about the Bloch-sphere
-	\co{X} axis, which takes \co{|0>} to \co{|1>} and vice versa.
+	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	X-axis, which takes \co{|0>} to \co{|1>} and vice versa.
 \item[Y:]
-	Rotate {180\textdegree} ($\pi$ radians) about the Bloch-sphere
-	\co{Y} axis, which also takes \co{|0>} to \co{|1>} and vice versa.
+	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Y-axis, which also takes \co{|0>} to \co{|1>} and vice versa.
 \item[Z:]
-	Rotate 180\textdegree ($\pi$ radians) about the Bloch-sphere
-	\co{Z} axis, which has no effect on qubits in the \co{|0>} or
+	Rotate 180\degree{} ($\pi$ radians) about the Bloch-sphere
+	Z-axis, which has no effect on qubits in the \co{|0>} or
 	\co{|1>} states.
 \end{description}

diff --git a/perfbook.tex b/perfbook.tex
index 2de83f0..b4458f2 100644
--- a/perfbook.tex
+++ b/perfbook.tex
@@ -35,6 +35,7 @@
 % \usepackage[strings]{underscore}
 % \usepackage{underscore}
 \usepackage{pifont} % special character for qqz reference point
+\usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
 \usepackage{verbatimbox} % for centering verbatim listing in figure environment
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables
 \usepackage{tabulary}
-- 
2.7.4


