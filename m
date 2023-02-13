Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjBMThj (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 13 Feb 2023 14:37:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6E5449C
        for <perfbook@vger.kernel.org>; Mon, 13 Feb 2023 11:37:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BF010B8163A
        for <perfbook@vger.kernel.org>; Mon, 13 Feb 2023 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676317055;
        bh=QQm731tq+zdPptjiwTli3r3i4deAjAXz3fq+ZkArj9M=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=b8XNUB9T+XQVIBBUiXZ45bHF3FKq1a7rQd0WqAo464FuEfT7R1JGCjCZCJe28ECd6
         k5P+KtCi9ws0YYmaD/JCxGTf4XFWLCz0umD9oSRuQry0jQC+hMPO6umgi40zTnDVk+
         675oGrNcFtjR6uc/Xz0HQ7x8/77eD9HLG9l3MFq29A0s5938XeoRf1jNObHlJhYJtr
         fhpNkbFxT/NdQBsh2q+86s2QkX9Ny8CNskGxW8fxLYf8W/P9ifSGWhVqRbvwseLtrm
         bnqnZRjr13QY5O6w0oWlHn8nsgbODrstlD7YhvznkK6fXvmugGlVYRG8tb3Hr+/QTL
         OXTCd4Mh+4i+g==
Date: Mon, 13 Feb 2023 11:37:32 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook v2] cpu: Add a QQz on table E.1
Message-ID: <20230213193732.GD2948950@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
 <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
 <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
 <5e85a5a2-00e0-3109-991f-85b32428d037@gmail.com>
 <20230213002856.GA2948950@paulmck-ThinkPad-P17-Gen-1>
 <42ad02ef-121a-e835-bee7-139a083607a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42ad02ef-121a-e835-bee7-139a083607a4@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>, perfbook@vger.kernel.org

On Mon, Feb 13, 2023 at 10:54:09AM +0900, Akira Yokosawa wrote:
> On Sun, 12 Feb 2023 16:28:56 -0800, Paul E. McKenney wrote:
> > On Sun, Feb 12, 2023 at 09:42:07AM +0900, Akira Yokosawa wrote:
> >> An email thread started from a question from Leo [1] stimulated
> >> me to add a QQz on Paul's experience back in 2009.
> >>
> >> As \QuickQuizLabel{} inside \QuickQuizSeries{} doesn't work in
> >> -nq builds, define \QuickQuizLabelRel{}{} and put it in front
> >> of the series.
> >>
> >> Link: [1] https://www.spinics.net/lists/perfbook/msg03824.html
> >> Signed-off-by: Akira Yokosawa <akiygmail.com>
> >> Cc: Leonardo Br=E1s <leobras.c@gmail.com>
> >=20
> > Queued and pushed, thank you!
>=20
> Paul, can you revert c82369bef3f6 ("cpu: Add a QQz citing table E.1")?
>=20
> Patch v2 happens to have no conflict with v1 and you have applied
> both of them!
>=20
> Now we have the same Quizzes of QQz 3.8 and QQz 3.10.
>=20
> c82369bef3f6 can be reverted cleanly.

Apologies for my confusion!  I have revered c82369bef3f6 as you
suggested.

							Thanx, Paul

>         Thanks, Akira
>=20
> >=20
> > 							Thanx, Paul
> >=20
> >> ---
> >> v2: Place new QQz next to QQz 3.7
> >>
> >> --
> >>  cpu/overheads.tex | 28 +++++++++++++++++++++++-----
> >>  qqz.sty           | 16 ++++++++++++++++
> >>  2 files changed, 39 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> >> index 0d8270bf6e17..a89c71158bf9 100644
> >> --- a/cpu/overheads.tex
> >> +++ b/cpu/overheads.tex
> >> @@ -290,12 +290,15 @@ nanoseconds, or more than seven hundred clock cy=
cles.
> >>  A CAS operation consumes almost a full microsecond, or almost two
> >>  thousand clock cycles.
> >> =20
> >> -\QuickQuiz{
> >> +\QuickQuizLabelRel{\QspeedOfLightAtoms}{1} % cann't put label inside =
QQSeries
> >> +
> >> +\QuickQuizSeries{%
> >> +\QuickQuizB{
> >>  	Surely the hardware designers could be persuaded to improve
> >>  	this situation!
> >>  	Why have they been content with such abysmal performance
> >>  	for these single-instruction operations?
> >> -}\QuickQuizAnswer{
> >> +}\QuickQuizAnswerB{
> >>  	The hardware designers \emph{have} been working on this
> >>  	problem, and have consulted with no less a luminary than
> >>  	the late physicist Stephen Hawking.
> >> @@ -423,9 +426,24 @@ thousand clock cycles.
> >>  	\Cref{sec:cpu:Hardware Free Lunch?}
> >>  	looks at what else hardware designers might be
> >>  	able to do to ease the plight of parallel programmers.
> >> -}\QuickQuizEnd
> >> -
> >> -\QuickQuizLabel{\QspeedOfLightAtoms}
> >> +}\QuickQuizEndB
> >> +%
> >> +\QuickQuizE{
> >> +	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.=
8GHz Intel X5550 (Nehalem) System}
> >> +	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
> >> +	In-Core CAS is faster than both of Same-CPU CAS and In-Core Blind CA=
S\@.
> >> +	What is happening there?
> >> +}\QuickQuizAnswerE{
> >> +	I \emph{was} surprised by the data I obtained and did a rigorous
> >> +	check of their validity.
> >> +	I got the same result persistently.
> >> +	One theory that might explain the observation would be:
> >> +	The two threads in the core are able to overlap their accesses,
> >> +	while the single CPU must do everything sequentially.
> >> +	Unfortunately, there seems to be no public documentation explaining
> >> +	why the Intel X5550 (Nehalem) system behaved like that.
> >> +}\QuickQuizEndE
> >> +}                 % End of \QuickQuizSeries
> >> =20
> >>  \begin{table}
> >>  \rowcolors{1}{}{lightgray}
> >> diff --git a/qqz.sty b/qqz.sty
> >> index a3a9f22d1ba9..5c7eb5340194 100644
> >> --- a/qqz.sty
> >> +++ b/qqz.sty
> >> @@ -156,6 +156,11 @@
> >> =20
> >>  % To create a macro referencing the previously defined quick quiz:
> >>  %	\QuickQuizLabel{\QQname}
> >> +%
> >> +% When labeling a QQz inside \QuickQuizSeries{}, use
> >> +%	\QuickQuizLabelRel{\QQname}{rel}
> >> +% in front of the series.
> >> +%
> >>  % To reference the macro in the text:
> >>  %	\QuickQuizRef{\QQname}
> >>  % To reference the answer of the macro in the text:
> >> @@ -166,6 +171,11 @@
> >>  \newcommand{\QuickQuizLabel}[1]{
> >>  	\edef#1{\thechapter.\thequickquizctrP}
> >>  }
> >> +\newcommand{\QuickQuizLabelRel}[2]{
> >> +        \addtocounter{quickquizctrP}{#2}
> >> +	\QuickQuizLabel{#1}
> >> +	\addtocounter{quickquizctrP}{-#2}
> >> +}
> >>  \newcommand{\QuickQuizRef}[1]{%
> >>  	\hyperref[QQ.#1]{Quick Quiz~#1}%
> >>  }
> >> @@ -176,6 +186,12 @@
> >>  \newcommand{\QuickQuizLabel}[1]{
> >>  	\edef#1{\thechapter.\thequickquizctr}
> >>  }
> >> +\newcommand{\QuickQuizLabelRel}[2]{
> >> +        \addtocounter{quickquizctr}{#2}
> >> +	\QuickQuizLabel{#1}
> >> +	\addtocounter{quickquizctr}{-#2}
> >> +}
> >> +
> >>  \newcommand{\QuickQuizRef}[1]{%
> >>  	\hyperref[QQ.#1]{Quick Quiz~#1}%
> >>  }
> >>
> >> base-commit: 14440e232cc1b2580dc1a73f873dc29fe3aea02b
> >> --=20
> >> 2.25.1
> >>
> >>
