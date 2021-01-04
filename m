Return-Path: <SRS0=fBDh=GH=gmail.com=dimhen@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=th8oc6fojD8i1VAqjdVRsY7GBR1DbobwEfmaFMONXko=;
        b=YoXha06IHZKzkq2Ei/Rv96cFQjRaRGEvrQLRFNAbZXxklpSosVr7FMZ9DiQJLS2q1q
         y1E4Y6TegQoNw3Ue5dVwujW0NX6CPOuX6AbjLuJ1EDhU89SDr/Ua0PZtLZ7d+kTZRMGq
         aj3f5bBZgkqnxzpnAKXLhS6fZE11bSLHwAXalnvaAwGe1kDmetVwXAQa2r04tsvBoru3
         +jSlX0haqaMMDH8hbuv0algc1o9AWXQMsDlHpkO6nc7+yVTmxxmV7t5rSl4vaTotflWM
         DC8+gciks1Aa38GgqaBB266Jqrm9Fr/Ha4dYUSuAEWJbXbWAS2w9yQjNpPfoHohbTEuu
         f+mw==
MIME-Version: 1.0
References: <29de25dd-09e4-cd0b-a743-6e5a7c8dfb36@gmail.com> <4f0c7f49-474d-01e7-fa73-673d5f146633@gmail.com>
In-Reply-To: <4f0c7f49-474d-01e7-fa73-673d5f146633@gmail.com>
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JTRjNGP0YfQtdC90LrQvg==?= <dimhen@gmail.com>
Date: Mon, 4 Jan 2021 16:22:15 +0300
Message-ID: <CADJjh6mdH+Y+33zcqAmn6T6GuJRf7i9xTOuRHG34UTN5Kz8cAA@mail.gmail.com>
Subject: Re: [PATCH v2 -perfbook] Makefile: Cope with GhostScript 9.53.0 or later
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Felipe Balbi <balbi@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Thank you, Akira!
5abdbfb64558c7036a58a8e624120088ce3d2b1f  PASS build.

Dmitry

=D0=BF=D0=BD, 4 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3. =D0=B2 02:38, Akira Yokosa=
wa <akiyks@gmail.com>:
>
> From d48155e896265c1a26985fe26f9bf8c5fbcfd22e Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 4 Jan 2021 07:58:18 +0900
> Subject: [PATCH v2 -perfbook] Makefile: Cope with GhostScript 9.53.0 or l=
ater
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>
> Combination of GhostScript 9.53.x and pstricks-base 3.01 requires
> an additional option of "gs" to enable transparency.
>
> Current version of a2ping can not cope with this change.
>
> Instead, use the pair of commands "ps2pdf" and "pdfcrop" for .eps
> files originated from .tex sources if a new version of gs is detected.
>
> Note:
> Due to the use of a deprecated command in pstricks.pro (boilerplate
> prologue code), gs 9.53.x emits repetitive warnings of:
>
>    **** WARNING: .setopacityalpha is deprecated (as of 9.53.0) and will b=
e removed in a future release
>    **** See .setfillconstantalpha/.setalphaisshape for the improved solut=
ion
>
> I'll silence them once I'm sure the stability of new commands in
> Makefile.
>
> Reported-by: =D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9 =D0=94=D1=8C=D1=
=8F=D1=87=D0=B5=D0=BD=D0=BA=D0=BE <dimhen@gmail.com>
> Reported-by: Felipe Balbi <balbi@kernel.org>
> Tested-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi,
>
> I thought I didn't redirect the warnings at all, but pdfcrop's stderr
> was redirected in v1.
> I removed the redirection in v2.
>
> Changes v1 -> v2:
>   o Add Felipe's Tested-by
>   o Mention warnings from gs in commit log's note.
>   o Remove ineffective redirection at the end of pipeline.
>
>         Thanks, Akira
> --
> Makefile | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 56ce62bf..0c58f1a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -38,6 +38,8 @@ EPSSOURCES_FROM_TEX :=3D \
>         SMPdesign/DiningPhilosopher4part-b.eps \
>         SMPdesign/DiningPhilosopher5PEM.eps
>
> +PDFTARGETS_OF_TEX :=3D $(EPSSOURCES_FROM_TEX:%.eps=3D%.pdf)
> +
>  DOTSOURCES :=3D $(wildcard */*.dot)
>
>  EPSSOURCES_FROM_DOT :=3D $(DOTSOURCES:%.dot=3D%.eps)
> @@ -70,7 +72,7 @@ EPSORIGIN :=3D $(filter-out $(EPSSOURCES_FROM_TEX) $(EP=
SSOURCES_FROM_DOT) $(EPSSOU
>
>  PDFTARGETS_OF_EPSORIG :=3D $(EPSORIGIN:%.eps=3D%.pdf)
>
> -PDFTARGETS_OF_EPSOTHER :=3D $(filter-out $(PDFTARGETS_OF_EPSORIG),$(PDFT=
ARGETS_OF_EPS))
> +PDFTARGETS_OF_EPSOTHER :=3D $(filter-out $(PDFTARGETS_OF_EPSORIG) $(PDFT=
ARGETS_OF_TEX),$(PDFTARGETS_OF_EPS))
>
>  BIBSOURCES :=3D bib/*.bib alphapf.bst
>
> @@ -124,19 +126,23 @@ ifdef A2PING
>    GS_950_OR_LATER :=3D $(shell gs --version | grep -c -E "9\.[5-9].?")
>    A2PING_277P :=3D $(shell a2ping --help 2>&1 | grep -c "2.77p,")
>    A2PING_283P :=3D $(shell a2ping --help 2>&1 | grep -c "2.83p,")
> +  GS_953_OR_LATER :=3D $(shell gs --version | grep -c -E "9\.5[3-9].?")
>    ifeq ($(A2PING_277P),1)
> -    A2PING_GSCNFL :=3D 1
> +    A2PING_GSCNFL =3D 1
>    else
>      ifeq ($(A2PING_283P),1)
>        ifeq ($(GS_950_OR_LATER),1)
> -        A2PING_GSCNFL :=3D 1
> +        A2PING_GSCNFL =3D 1
>        else
> -        A2PING_GSCNFL :=3D 0
> +        A2PING_GSCNFL =3D 0
>        endif
>      else
> -      A2PING_GSCNFL :=3D 0
> +      A2PING_GSCNFL =3D 0
>      endif
>    endif
> +  ifeq ($(GS_953_OR_LATER),1)
> +    A2PING_GSCNFL =3D 2
> +  endif
>  endif
>
>  LINELABEL_ENV_BEGIN :=3D $(shell grep -l -F '\begin{linelabel}' $(LATEXS=
OURCES))
> @@ -395,6 +401,20 @@ endif
>         @a2ping --below --hires --bboxfrom=3Dcompute-gs $<i $@ > /dev/nul=
l 2>&1
>         @rm -f $<i
>
> +$(PDFTARGETS_OF_TEX): %.pdf: %.eps
> +       @echo "$< --> $@"
> +ifndef A2PING
> +       $(error $< --> $@: a2ping not found. Please install it)
> +endif
> +ifeq ($(A2PING_GSCNFL),1)
> +       $(error a2ping version conflict. See #7 in FAQ-BUILD.txt)
> +endif
> +ifeq ($(A2PING_GSCNFL),2)
> +       @ps2pdf -dALLOWPSTRANSPARENCY -dNOSAFER $< - | pdfcrop -hires - $=
@
> +else
> +       @a2ping --below --hires --bboxfrom=3Dcompute-gs $< $@ > /dev/null=
 2>&1
> +endif
> +
>  $(PDFTARGETS_OF_EPSOTHER): %.pdf: %.eps
>         @echo "$< --> $@"
>  ifndef A2PING
> --
> 2.17.1
>
>
>
