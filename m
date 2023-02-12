Return-Path: <SRS0=sCbS=6I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5I9GaK7VSkiQSsWa1Xmw01xXwNOm+/BbQNGMv3a3XjY=;
        b=mi3Jn5sxLSgI/VqhB1lF1flX3UH77fS06pN59t8MGBDZhU8J+NnlackSy69tIgujG8
         IayTxWYLa2C6Xnh6l6I/LtpcVCGNVBnICLToHVbKKKIQMixzr5cRWkjV597K6hyNWK+P
         S8pr+YU0MblOg041Y6EvCEAs5A1UpNSrnht/w0oCaT/IBoDBulQ+O4xE49GlutKXJKuG
         JxYn/UcRKA78ClZ/PurtMdRIBSvBzkzrvww/uBrVZ8wAviPBtZif4Ib6hIN8hf1RTnsb
         rLK0f11FO6Jq1AXO9kE/irioAinOyxMqtrb8CdT+ACNhqHHKf8s1QOpCdv5MBCBQJAJf
         sJqw==
Message-ID: <5e85a5a2-00e0-3109-991f-85b32428d037@gmail.com>
Date: Sun, 12 Feb 2023 09:42:07 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2] cpu: Add a QQz on table E.1
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
 <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
 <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: paulmck@kernel.org, =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

An email thread started from a question from Leo [1] stimulated
me to add a QQz on Paul's experience back in 2009.

As \QuickQuizLabel{} inside \QuickQuizSeries{} doesn't work in
-nq builds, define \QuickQuizLabelRel{}{} and put it in front
of the series.

Link: [1] https://www.spinics.net/lists/perfbook/msg03824.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo Br=C3=A1s <leobras.c@gmail.com>
---
v2: Place new QQz next to QQz 3.7

--
 cpu/overheads.tex | 28 +++++++++++++++++++++++-----
 qqz.sty           | 16 ++++++++++++++++
 2 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 0d8270bf6e17..a89c71158bf9 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -290,12 +290,15 @@ nanoseconds, or more than seven hundred clock cycle=
s.
 A CAS operation consumes almost a full microsecond, or almost two
 thousand clock cycles.
=20
-\QuickQuiz{
+\QuickQuizLabelRel{\QspeedOfLightAtoms}{1} % cann't put label inside QQS=
eries
+
+\QuickQuizSeries{%
+\QuickQuizB{
 	Surely the hardware designers could be persuaded to improve
 	this situation!
 	Why have they been content with such abysmal performance
 	for these single-instruction operations?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerB{
 	The hardware designers \emph{have} been working on this
 	problem, and have consulted with no less a luminary than
 	the late physicist Stephen Hawking.
@@ -423,9 +426,24 @@ thousand clock cycles.
 	\Cref{sec:cpu:Hardware Free Lunch?}
 	looks at what else hardware designers might be
 	able to do to ease the plight of parallel programmers.
-}\QuickQuizEnd
-
-\QuickQuizLabel{\QspeedOfLightAtoms}
+}\QuickQuizEndB
+%
+\QuickQuizE{
+	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GH=
z Intel X5550 (Nehalem) System}
+	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
+	In-Core CAS is faster than both of Same-CPU CAS and In-Core Blind CAS\@=
=2E
+	What is happening there?
+}\QuickQuizAnswerE{
+	I \emph{was} surprised by the data I obtained and did a rigorous
+	check of their validity.
+	I got the same result persistently.
+	One theory that might explain the observation would be:
+	The two threads in the core are able to overlap their accesses,
+	while the single CPU must do everything sequentially.
+	Unfortunately, there seems to be no public documentation explaining
+	why the Intel X5550 (Nehalem) system behaved like that.
+}\QuickQuizEndE
+}                 % End of \QuickQuizSeries
=20
 \begin{table}
 \rowcolors{1}{}{lightgray}
diff --git a/qqz.sty b/qqz.sty
index a3a9f22d1ba9..5c7eb5340194 100644
--- a/qqz.sty
+++ b/qqz.sty
@@ -156,6 +156,11 @@
=20
 % To create a macro referencing the previously defined quick quiz:
 %	\QuickQuizLabel{\QQname}
+%
+% When labeling a QQz inside \QuickQuizSeries{}, use
+%	\QuickQuizLabelRel{\QQname}{rel}
+% in front of the series.
+%
 % To reference the macro in the text:
 %	\QuickQuizRef{\QQname}
 % To reference the answer of the macro in the text:
@@ -166,6 +171,11 @@
 \newcommand{\QuickQuizLabel}[1]{
 	\edef#1{\thechapter.\thequickquizctrP}
 }
+\newcommand{\QuickQuizLabelRel}[2]{
+        \addtocounter{quickquizctrP}{#2}
+	\QuickQuizLabel{#1}
+	\addtocounter{quickquizctrP}{-#2}
+}
 \newcommand{\QuickQuizRef}[1]{%
 	\hyperref[QQ.#1]{Quick Quiz~#1}%
 }
@@ -176,6 +186,12 @@
 \newcommand{\QuickQuizLabel}[1]{
 	\edef#1{\thechapter.\thequickquizctr}
 }
+\newcommand{\QuickQuizLabelRel}[2]{
+        \addtocounter{quickquizctr}{#2}
+	\QuickQuizLabel{#1}
+	\addtocounter{quickquizctr}{-#2}
+}
+
 \newcommand{\QuickQuizRef}[1]{%
 	\hyperref[QQ.#1]{Quick Quiz~#1}%
 }

base-commit: 14440e232cc1b2580dc1a73f873dc29fe3aea02b
--=20
2.25.1


