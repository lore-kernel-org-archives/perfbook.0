Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=erTKDfFwAFLcpsBvPpC4M7rvbvODPAerxuG869klUAk=;
 b=VP/6c+VYNK9UJIr5XU7rk/2NrfolFlbRCyiT7k2icByT9/VhViqN66uca7dU4Ayp2u
 DZ92BVLws07+1AJWSvM4Ilioiqxm7jEuZYOO6/VWoWVM8V9hSkgeaZjtLUU02004x9s2
 UuJqaCygr1sp2bk63hUxZ72hWtBfPamglXSJb6y0tsjExE4OKfVPjaYiWxw7OFSRZaAu
 hvp3TKonPJQ8iqZbf3VGnsltMkS4zs44oY/Mi3EF2JZyjBtsbj/NBAj2PWSXFTS8g0Ox
 bjnCQOLCO0On6quZkEriB/GcfctrdycVLZVRJL1/z/E+FBaj3NeUZTnGyZ9eyJYNlY1q
 K3Wg==
Subject: [PATCH 4/8] future/QC: Add narrow space before unit symbol
References: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <0ad36acf-8bd5-b608-fab8-fe4d37877811@gmail.com>
Date: Sat, 17 Jun 2017 12:59:40 +0900
MIME-Version: 1.0
In-Reply-To: <8919b898-9e43-8f72-39ce-5d31dc84f45d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 6f1c49625d34b4a2bd3e80a7170c3d66c6fbd707 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 17 Jun 2017 00:40:34 +0900
Subject: [PATCH 4/8] future/QC: Add narrow space before unit symbol

This section should follow the style guide of NIST [1]. Section 7.2
recommends to place a white space before a unit symbol.

[1] https://www.nist.gov/pml/nist-guide-si-chapter-7-rules-and-style-conventions-expressing-values-quantities

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 future/QC.tex | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/future/QC.tex b/future/QC.tex
index 8727212..feb7851 100644
--- a/future/QC.tex
+++ b/future/QC.tex
@@ -238,7 +238,7 @@ As Scott Crowder of IBM put it,
 For purposes of comparison, the oldest intact computer, the
 University of Melbourne's 1949
 CSIRAC~\cite{CSIRACMuseumVictoria,CSIRACUniversityMelbourne},
-ran at a core clock frequency of 1kHz, consumed 30kW of power,
+ran at a core clock frequency of 1\,kHz, consumed 30\,kW of power,
 weighs three metric tons,
 is constructed of 2,000 vacuum tubes, and has 768 words of RAM
 implemented with acoustic mercury delay lines.
@@ -536,7 +536,7 @@ times of more than
 Unfortunately, the quantum states used by this work involve atomic nuclei,
 which in turn require bulky nuclear magnetic resonance (NMR) machinery
 to read and write state, and the reading and the writing takes place
-at 4K, that is, at the temperature of liquid helium.
+at 4\,K, that is, at the temperature of liquid helium.
 However, between reading and writing, the temperature of the sample may
 be raised to room temperature for extended periods without affecting
 the quantum state.
@@ -598,9 +598,9 @@ This means that in theory, quantum computers can avoid the
 Landauer limit~\cite{Landauer:1961:IHG:1661184.1661186}
 of $kT \ln 2$, where $k$ is the Boltzmann constant and $T$ is the
 temperature in degrees Kelvin.
-Given that the Boltzmann constant is $1.38 \times 10^{-23}$J/K,
-and given the 0.015K operating temperatures that IBM's Quantum Experience
-hardware runs at, this limit is indeed low: $1.43 \times 10^{-25}$J.
+Given that the Boltzmann constant is $1.38 \times 10^{-23}$\,J/K,
+and given the 0.015\,K operating temperatures that IBM's Quantum Experience
+hardware runs at, this limit is indeed low: $1.43 \times 10^{-25}$\,J.

 However, because of its thermodynamic reversibiltiy,
 QC is governed by an even lower limit:
@@ -611,9 +611,9 @@ QC is governed by an even lower limit:

 Here $\Delta E$ is the energy required to change the qubit in Joules,
 $\Delta t$ is the time taken to change the qubit in seconds, and
-$\hbar$ is Planck's constant, which is $6.62 \times 10^{-34}$J$\cdot$s.
+$\hbar$ is Planck's constant, which is $6.62 \times 10^{-34}$\,J$\cdot$s.
 For the 50-nanosecond switching times of IBM's Quantum Experience
-hardware, this limit is $5.52 \times 10^{-27}$J, more than an order
+hardware, this limit is $5.52 \times 10^{-27}$\,J, more than an order
 of magnitude less than the Landauer limit.

 Both of these limits are incredibly small, which holds out the promise
@@ -665,12 +665,12 @@ Table~\ref{tab:future:The Three Laws of Thermodynamics}.

 The nominal temperature for IBM~Q is 15~millikelvins, which certainly
 qualifies as a low $T_L$.
-Let's assume $T_H$ is 293K (room temperature),
+Let's assume $T_H$ is 293\,K (room temperature),
 in which case $C_P$ is $0.000051$.
 This in turn means that it requires \emph{at least} one watt of
 power into the refrigeration unit to transport $0.000051$~watts
 of waste heat from the 15~millikelvin IBM~Q out to room temperature.
-Put another way, 19.5kW is required to remove one watt of waste heat.
+Put another way, 19.5\,kW is required to remove one watt of waste heat.
 Thus, ``very little waste heat'' can nevertheless generate a significant
 power bill for refrigeration, albeit less than two-thirds of the power
 consumption of the CSIRAC machine discussed in
@@ -738,7 +738,7 @@ energy-hungry refrigeration systems, which means that QC
 systems need a high-value killer app.

 Of course, if the value of the killer app is sufficiently high,
-19.5kW might be considered cheap.
+19.5\,kW might be considered cheap.
 In this case, in the spirit of
 ``plenty of room at the bottom''~\cite{RichardPFeynman1959RoomAtBottom},
 we might want even lower temperatures.
@@ -747,7 +747,7 @@ For example, Bose-Einstein condensates
 form in the sub-microkelvin range, exhibiting interesting
 macro-scale quantum effects.
 It is not clear how one would construct any sort of computer from
-these condensates, nor how one would go about providing the 1.6~GW
+these condensates, nor how one would go about providing the 1.6\,GW
 required to remove one watt of waste heat from a BEC---after all,
 even Emmett Brown's fictional flux capacitor required only 1.21 gigawatts.
 However, much remains to be explored in this realm
@@ -756,7 +756,7 @@ nothing of new materials, for but one example,
 perovskite~\cite{ZhengChen2016PerovskiteQDMOFthinFilm}.
 Other avenues include increased pressure, given that diamond anvil
 cells~\cite{Weir1959DiamondAnvilCell} can now reach
-640~GPa~\cite{LeonidDubrovinsky2012640GPaDiamondAnvilCell},
+640\,GPa~\cite{LeonidDubrovinsky2012640GPaDiamondAnvilCell},
 which is almost double the estimated pressure at the center of the earth.
 Such exploration is of course pure research, but if QC is at 1940s levels
 of development, pure research should have a significant role to play.
-- 
2.7.4


