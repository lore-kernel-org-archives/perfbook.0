Return-Path: <SRS0=RL7U=DV=gmail.com=leobras.c@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691171595; x=1691776395;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vXMp0eARvpnkv10v0R9k1pkecN8JFAEmGGtjBqRTmTE=;
        b=ThJKnli7dg9C3vltzx+lDGQAKdwyAf6wlyh7x1IsumtRP/AM7FPBHV8hoIqJ4+yn/o
         /rqY131qd1/IsLU3p7DJKaqXzWhqu85rUQiaXR0xa4Kfe4RdCrf9Xfk5kTptuiwkysOg
         v+tf9hkve7zIwP3QyE/O3i2ZHMWZiJLV0mrTcQHacVDgXGyB/vPjYPKOVxItBkwU2IZi
         HoFxbbtlwtF44XX5Zj9WV9fMD8Y/elP5ycnmTC31//t5FSxmKWgK2LNL0Dh5JaEA6RIV
         KYMSxmp9M3VhhnzWfnKmSK4H52p/yrSUxGRaQsJPi+jL9nmXgDylNnYwFuNF9PzO/UsZ
         V51Q==
Message-ID: <d5e9d874f3c432e49c7c824160ced4cbd250f28e.camel@gmail.com>
Subject: Re: [PATCH] utilities/gitlab-ci: Fully update system before building
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
Date: Fri, 04 Aug 2023 14:53:04 -0300
In-Reply-To: <20230804174638.1142845-2-leobras.c@gmail.com>
References: <20230804174638.1142845-2-leobras.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "Paul E . McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, 2023-08-04 at 14:46 -0300, Leonardo Bras wrote:
> Some recent CI errors come from the incompatibility between packages
> pre-installed in the docker image and the ones installed via pacman.
>=20
> To avoid this, make a full system upgrade when installing the needed
> packages.
>=20
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  utilities/gitlab-ci.yml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/utilities/gitlab-ci.yml b/utilities/gitlab-ci.yml
> index 544b9373..bcda8712 100644
> --- a/utilities/gitlab-ci.yml
> +++ b/utilities/gitlab-ci.yml
> @@ -9,7 +9,7 @@ test_codesamples:
>      stage: test
> =20
>      before_script:
> -        - pacman --noconfirm -Sy make gcc liburcu
> +        - pacman --noconfirm -Syu make gcc liburcu
> =20
>      script:
>          - make -C CodeSamples/
> @@ -19,7 +19,7 @@ generate_pdfs:
>      stage: build
> =20
>      before_script:
> -        - pacman --noconfirm -Sy texlive-meta fig2dev ghostscript graphv=
iz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-li=
beration
> +        - pacman --noconfirm -Syu texlive-meta fig2dev ghostscript graph=
viz inkscape wget make which fontconfig git ttf-dejavu gnu-free-fonts ttf-l=
iberation
>          - mkdir -p ~/.local/share/fonts && cp fonts/steel-city-comic.reg=
ular.ttf ~/.local/share/fonts/ && fc-cache
> =20
>      script:

Sorry about resending.=20
I had an issue with credentials, please ignore the ones sent from my employ=
er
account: the gmail is the correct one.
