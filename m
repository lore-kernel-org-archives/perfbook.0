Return-Path: <SRS0=kTQ9=6F=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXkeJRrRbmfaY4gEUWXYSdprgEN41ZXHX4pQ4W71V/o=;
        b=bSkWK4x5vrRg73t/H5yaF/H4xQqrkOEXC/2nmZcKwwzCOsr5lgsAMnxKBaVecqi7oI
         /nik1vxyV6kR6fksISSU3lEmPOrXgBdQ0DrqN9rmVQruIDSTbqOB+DJypQRO2lQZl+Ss
         uMB/gMuI9eYzqkoEIkRBc/2XqP/rn1ayY9ShOMVeNZi4FGfwwCh7U2csTQlp+p33zG+c
         G9jajjKzyH7CpxiJ3df42V4mmaGJ7zMeOLZ5IYQar6cDXSnpLzkHrXgNA22gEXBW5YGK
         VHnXujQhvs9p0hBUoJVcOqkRkkRNHFK8YPwdoRHIscZAA9kG7CN8HmteJaVeUY9ZiwgK
         1zqA==
Message-ID: <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
Date: Fri, 10 Feb 2023 00:12:17 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook] cpu: PoC of A QQz citing table in answer to another
 QQz (was Re: Question about Table E.1)
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
 <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Subject: [PATCH -perfbook] cpu: Add a QQz citing table E.1

An email thread started from a question from Leo [1] stimulated
me to add a QQz on Paul's experience back in 2009.

Link: [1] https://www.spinics.net/lists/perfbook/msg03824.html
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
I wrote:
> On second thought, it should be possible to put a QQz next to QQz 3.7
> citing Table E.1 in the Quiz part.
> 
> Let me try and produce a PoC patch.

Something like this?

I couldn't make the QQz next to QQz 3.7 due to the

  \QuickQuizLabel{\QspeedOfLightAtoms}

just below QQz 3.7.
If you put the label in the middle of

\QuickQuizSeries{
 ...
}

, you will get build errors in -nq builds. 

Instead, I added it next to QQz 3.8 (or the end of Section 3.2.2).
It looks still relevant there.

The wording of the Quiz and its Answer is just a stub.
Paul, feel free to rewrite them as you like.

        Thanks, Akira
--
 cpu/overheads.tex | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/cpu/overheads.tex b/cpu/overheads.tex
index 0d8270bf6e17..cff847cdadbf 100644
--- a/cpu/overheads.tex
+++ b/cpu/overheads.tex
@@ -485,10 +485,11 @@ cycles, as shown in the ``Global Comms'' row.
 %     page 6/76 'Leading Interconnect, Leading Performance'
 % Needs updating...
 
-\QuickQuiz{
+\QuickQuizSeries{%
+\QuickQuizB{
 	These numbers are insanely large!
 	How can I possibly get my head around them?
-}\QuickQuizAnswer{
+}\QuickQuizAnswerB{
 	Get a roll of toilet paper.
 	In the USA, each roll will normally have somewhere around
 	350--500 sheets.
@@ -516,7 +517,24 @@ cycles, as shown in the ``Global Comms'' row.
 	You might wish to avoid disabling interrupts across that many
 	cache misses.\footnote{
 		Kudos to Matthew Wilcox for this holding-breath analogy.}
-}\QuickQuizEnd
+}\QuickQuizEndB
+%
+\QuickQuizE{
+	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GHz Intel X5550 (Nehalem) System}
+	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
+	In-Core CAS is faster than both of Same-CPU CAS and In-Core Blind CAS\@.
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
 
 \subsection{Hardware Optimizations}
 \label{sec:cpu:Hardware Optimizations}

base-commit: 14440e232cc1b2580dc1a73f873dc29fe3aea02b
-- 
2.25.1


