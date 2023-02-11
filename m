Return-Path: <SRS0=75Ol=6H=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oUFbCGcjhulexiEP0b5SKhu7NgPFIO9XmGa3Pux/seY=;
        b=hj+81A8UEIyvUmLBhXfqZWcEjJdGbdtm23GlVIl1qJzziE/M/2S9/bXVYcwplnah7M
         /2mB+jHJTvVjwowDQmvA2OWgzdZyGLD+k/ZYi+Fu4L7to39d3cOBNxF6/FJG3rRaov3/
         SndUnGdkTYfexDTwYETJQH/Zx6cJLQoZXm43ljbh4vO9g7QCS/cn8NN/lkcJqQ29o8QX
         K0zlgtAJMfo39vBTuX4DWVlE+cICT7QPt9YeBGEoiDbzyPruRpjo8nl4uV2uZgSrKNPK
         WVY+6NQsZhWPJ4FjgBOWyxbyvwFnUFtQCxPm5G6ioNXZN6lDvIUp60bIsR4lyYJjOgO0
         /geQ==
Message-ID: <c7e120f78b29239f4de6c88004318c3c9f825e10.camel@gmail.com>
Subject: Re: [PATCH -perfbook] cpu: PoC of A QQz citing table in answer to
 another QQz (was Re: Question about Table E.1)
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Sat, 11 Feb 2023 05:49:49 -0300
In-Reply-To: <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
References: <fba1fe891b65449475c1e4e9abee2d3337c1567c.camel@gmail.com>
	 <20230208034102.GG2948950@paulmck-ThinkPad-P17-Gen-1>
	 <52d25e8e-9a57-3744-fc0d-17f4a5f36d9f@gmail.com>
	 <7c88779c-208f-ff17-7f23-f7042ea122e5@gmail.com>
	 <20230208221522.GK2948950@paulmck-ThinkPad-P17-Gen-1>
	 <89b46523-75e2-d740-e6d5-add44b6c5591@gmail.com>
	 <8506fddb-f188-2a4f-8315-4a8d56928f31@gmail.com>
	 <f1e6d9a6-c2cc-9b3a-43c0-26ff8760b294@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 2023-02-10 at 00:12 +0900, Akira Yokosawa wrote:
> Subject: [PATCH -perfbook] cpu: Add a QQz citing table E.1
>=20
> An email thread started from a question from Leo [1] stimulated
> me to add a QQz on Paul's experience back in 2009.
>=20
> Link: [1] https://www.spinics.net/lists/perfbook/msg03824.html
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> I wrote:
> > On second thought, it should be possible to put a QQz next to QQz 3.7
> > citing Table E.1 in the Quiz part.
> >=20
> > Let me try and produce a PoC patch.
>=20
> Something like this?
>=20
> I couldn't make the QQz next to QQz 3.7 due to the
>=20
>   \QuickQuizLabel{\QspeedOfLightAtoms}
>=20
> just below QQz 3.7.
> If you put the label in the middle of
>=20
> \QuickQuizSeries{
>  ...
> }
>=20
> , you will get build errors in -nq builds.=20
>=20
> Instead, I added it next to QQz 3.8 (or the end of Section 3.2.2).
> It looks still relevant there.
>=20
> The wording of the Quiz and its Answer is just a stub.
> Paul, feel free to rewrite them as you like.
>=20
>         Thanks, Akira
> --
>  cpu/overheads.tex | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/cpu/overheads.tex b/cpu/overheads.tex
> index 0d8270bf6e17..cff847cdadbf 100644
> --- a/cpu/overheads.tex
> +++ b/cpu/overheads.tex
> @@ -485,10 +485,11 @@ cycles, as shown in the ``Global Comms'' row.
>  %     page 6/76 'Leading Interconnect, Leading Performance'
>  % Needs updating...
> =20
> -\QuickQuiz{
> +\QuickQuizSeries{%
> +\QuickQuizB{
>  	These numbers are insanely large!
>  	How can I possibly get my head around them?
> -}\QuickQuizAnswer{
> +}\QuickQuizAnswerB{
>  	Get a roll of toilet paper.
>  	In the USA, each roll will normally have somewhere around
>  	350--500 sheets.
> @@ -516,7 +517,24 @@ cycles, as shown in the ``Global Comms'' row.
>  	You might wish to avoid disabling interrupts across that many
>  	cache misses.\footnote{
>  		Kudos to Matthew Wilcox for this holding-breath analogy.}
> -}\QuickQuizEnd
> +}\QuickQuizEndB
> +%
> +\QuickQuizE{
> +	\Cref{tab:cpu:Performance of Synchronization Mechanisms on 16-CPU 2.8GH=
z Intel X5550 (Nehalem) System}
> +	in the answer to \QuickQuizARef{\QspeedOfLightAtoms} says that
> +	In-Core CAS is faster than both of Same-CPU CAS and In-Core Blind CAS\@=
.
> +	What is happening there?
> +}\QuickQuizAnswerE{
> +	I \emph{was} surprised by the data I obtained and did a rigorous
> +	check of their validity.
> +	I got the same result persistently.
> +	One theory that might explain the observation would be:
> +	The two threads in the core are able to overlap their accesses,
> +	while the single CPU must do everything sequentially.
> +	Unfortunately, there seems to be no public documentation explaining
> +	why the Intel X5550 (Nehalem) system behaved like that.
> +}\QuickQuizEndE
> +}                 % End of \QuickQuizSeries
> =20
>  \subsection{Hardware Optimizations}
>  \label{sec:cpu:Hardware Optimizations}
>=20
> base-commit: 14440e232cc1b2580dc1a73f873dc29fe3aea02b

Tested on Gitlab:
https://gitlab.com/linux-kernel/perfbook/-/pipelines/774642106

Observations for this PDF:
QQz 3.7 has the mentioned table.
QQz 3.9 has the comment on the table.
'Question + link' to QQz 3.9 appears in Chapter 3, on the page after 'quest=
ion +
link' to QQz 3.7.

Is that the desired output?

(It feels a little 'misplaced', TBH. The best place would be just after QQz=
 3.7,
but looking into your comments, it seems it was not possible.)


Anyway, if the desired output was achieved:

Tested-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Leonardo Bras <leobras@redhat.com>


Best regards,
Leo
