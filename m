Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TsOcPBrMxGpGvWXPWsJ/rImQctYI+l7gE9ROJwv3d2o=;
 b=Zi6YSWB3+D/M6E+qHRUP+xNQz+5z9GMQ05ESooh6fc5RjzIB7q7t3epWWG71AEtfWx
 PNJxPi9pE8ITV6X5TD4GtGPP7PoJ45/KmnjrEqxJqNFWAPbzbIOq0FkHM0nw1gYMhlUM
 NxYaKrD8oK86SjgLSPQnAWS0tj3xV8C+PoyWqK9KEJuIvb0Lr/6YwQ8neyCY8/EEpmFJ
 86Q4+GoaDQRCP+1Fs/d+IYxJfTKkct7O3ZQ6uSFWh/127gc6wftA/Vg98kWLe4w4J5Et
 KX2h5zzZjEw4CLfcYRt6aZV0DrRzLs5U52cl5v/Qj82W2Jpj9lT++w0K7yhlMU44z/8a
 9Zgg==
Subject: [PATCH 3/8] future/QC: Fix typo in unit symbol and usage of math mode
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <c4a4bb87-72aa-391b-81b7-8dcd5b523f5e@gmail.com>
Date: Sat, 17 Jun 2017 12:58:22 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 5c3cb7fa55bf495b500e5a42da0882f167231f77 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 17 Jun 2017 00:29:40 +0900
Subject: [PATCH 3/8] future/QC: Fix typo in unit symbol and usage of math mode

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 36b68ad..8727212 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -238,7 +238,7 @@ As Scott Crowder of IBM put it,
 For purposes of comparison, the oldest intact computer, the
 University of Melbourne's 1949
 CSIRAC~\cite{CSIRACMuseumVictoria,CSIRACUniversityMelbourne},
-ran at a core clock frequency of 1KHz, consumed 30kW of power,
+ran at a core clock frequency of 1kHz, consumed 30kW of power,
 weighs three metric tons,
 is constructed of 2,000 vacuum tubes, and has 768 words of RAM
 implemented with acoustic mercury delay lines.
@@ -596,7 +596,7 @@ QC computation is thermodynamically reversible, generating
 very little waste heat~\cite{Bennett:1973:LRC:1664562.1664568,RichardFeynman1986QuantumMechanicalComputers}.
 This means that in theory, quantum computers can avoid the
 Landauer limit~\cite{Landauer:1961:IHG:1661184.1661186}
-of $kT ln 2$, where $K$ is the Boltzmann constant and $T$ is the
+of $kT \ln 2$, where $k$ is the Boltzmann constant and $T$ is the
 temperature in degrees Kelvin.
 Given that the Boltzmann constant is $1.38 \times 10^{-23}$J/K,
 and given the 0.015K operating temperatures that IBM's Quantum Experience
@@ -611,7 +611,7 @@ QC is governed by an even lower limit:

 Here $\Delta E$ is the energy required to change the qubit in Joules,
 $\Delta t$ is the time taken to change the qubit in seconds, and
-$\hbar$ is Planck's constant, which is $6.62 \times 10^{-34}$J $\cdot$ s.
+$\hbar$ is Planck's constant, which is $6.62 \times 10^{-34}$J$\cdot$s.
 For the 50-nanosecond switching times of IBM's Quantum Experience
 hardware, this limit is $5.52 \times 10^{-27}$J, more than an order
 of magnitude less than the Landauer limit.
@@ -691,7 +691,7 @@ at low temperatures.\footnote{
 \begin{tabular}{l|r|r|r}
 	&	&	& Power per watt \\
 Situation
-	& T (K)
+	& $T$ (K)
 		& $C_P$	& waste heat (W) \\
 \hline
 \hline
@@ -756,7 +756,7 @@ nothing of new materials, for but one example,
 perovskite~\cite{ZhengChen2016PerovskiteQDMOFthinFilm}.
 Other avenues include increased pressure, given that diamond anvil
 cells~\cite{Weir1959DiamondAnvilCell} can now reach
-640~GPA~\cite{LeonidDubrovinsky2012640GPaDiamondAnvilCell},
+640~GPa~\cite{LeonidDubrovinsky2012640GPaDiamondAnvilCell},
 which is almost double the estimated pressure at the center of the earth.
 Such exploration is of course pure research, but if QC is at 1940s levels
 of development, pure research should have a significant role to play.
@@ -999,7 +999,7 @@ But before this can happen, the list must be downloaded into
 the QC system.
 The competing classical system can use this time to construct
 any desired index over the data, after which the classical
-system can carry out the search in $O(log N)$ time, which
+system can carry out the search in $O(\log N)$ time, which
 is much faster than the $O(\sqrt N)$ time promised by
 Grover's algorithm.
 Of course, this would change if the data originates in the
-- 
2.7.4


